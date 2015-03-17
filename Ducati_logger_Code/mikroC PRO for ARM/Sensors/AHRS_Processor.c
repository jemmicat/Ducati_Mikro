
#include "typedefs.h"
#include "Globals.h"

//==============================================================================
//                   Definitions for AHRS Alghoritm
//==============================================================================


// Variable definitions
extern float twoKp;
extern float twoKi;

// Quaternion of sensor frame relative to auxiliary frame
extern float q0;
extern float q1;
extern float q2;
extern float q3;

// Integral error terms scaled by Ki
extern float integralFBx;
extern float integralFBy;
extern float integralFBz;

extern float Norm;
extern float q0q0, q0q1, q0q2, q0q3, q1q1, q1q2, q1q3, q2q2, q2q3, q3q3;
extern float hx, hy, bx, bz;
extern float halfvx, halfvy, halfvz, halfwx, halfwy, halfwz;
extern float halfex, halfey, halfez;
extern float qa, qb, qc;

// Input Values for AHRS and IMU algorit
extern float ax, ay, az;
extern float gx, gy, gz;
extern float mx, my, mz;


extern tSensor MPU9150A;

#define _DEG //or _RAD

// Attitude Estimation Function

/*******************************************************************************
* Function Name     : AHRS_Update
* Description       : Quaternion implementation of the 'DCM filter'.
                      Incorporates the magnetic distortion compensation
                      algorithms from Madgwicks filter which eliminates the
                      need for a reference direction of flux (bx bz) to be
                      predefined and limits the effect of magnetic distortions
                      to yaw axis only.
* Input             : Nothing
* Output            : Quaternion global variables values q0, q1, q2 and q3,
                      representing the estimated orientation. Results are sent
                      over serial communication.
* Note              : User must call 'AHRS_Update()' every sample period and
                      parse calibrated gyroscope ('gx', 'gy', 'gz'),
                      accelerometer ('ax', 'ay', 'ay') and magnetometer
                      ('mx', 'my', 'mz') data.  Gyroscope units are
                      radians/second or degrees/second, 
                      accelerometer and magnetometer units are irrelevant as 
                      the vector is normalised.
* Return            : Nothing
*******************************************************************************/

void AHRS_Update() {

        ax = (float)MPU9150A.accel.x - MPU9150A.calib_accel.x;
        ay = (float)MPU9150A.accel.y - MPU9150A.calib_accel.y;
        az = (float)MPU9150A.accel.z - MPU9150A.calib_accel.z;

        #ifdef _RAD
        gx = toRads(((float)MPU9150A.gyro.x - MPU9150A.calib_gyro.x) * gyroGAIN);
        gy = toRads(((float)MPU9150A.gyro.y - MPU9150A.calib_gyro.y) * gyroGAIN);
        gz = toRads(((float)MPU9150A.gyro.z - MPU9150A.calib_gyro.z) * gyroGAIN);
        #else
        gx = ((float)MPU9150A.gyro.x - MPU9150A.calib_gyro.x) * gyroGAIN;
        gy = ((float)MPU9150A.gyro.y - MPU9150A.calib_gyro.y) * gyroGAIN;
        gz = ((float)MPU9150A.gyro.z - MPU9150A.calib_gyro.z) * gyroGAIN;
        #endif
        
        mx = ((float)MPU9150A.mag.x - MPU9150A.mag_off.x) / MPU9150A.mag_scale.x;
        my = ((float)MPU9150A.mag.y - MPU9150A.mag_off.y) / MPU9150A.mag_scale.y;
        mz = ((float)MPU9150A.mag.z - MPU9150A.mag_off.z) / MPU9150A.mag_scale.z;

        // Compute feedback only if accelerometer measurement valid
        //(avoids NaN in accelerometer normalisation)
        if(!((ax == 0.0f) && (ay == 0.0f) && (az == 0.0f))) {

                // Normalise accelerometer measurement
                Norm = sqrt(ax * ax + ay * ay + az * az);
                ax /= Norm;
                ay /= Norm;
                az /= Norm;

                // Normalise magnetometer measurement
                Norm = sqrt(mx * mx + my * my + mz * mz);
                mx /= Norm;
                my /= Norm;
                mz /= Norm;

        // Auxiliary variables to avoid repeated arithmetic
        q0q0 = q0 * q0;
        q0q1 = q0 * q1;
        q0q2 = q0 * q2;
        q0q3 = q0 * q3;
        q1q1 = q1 * q1;
        q1q2 = q1 * q2;
        q1q3 = q1 * q3;
        q2q2 = q2 * q2;
        q2q3 = q2 * q3;
        q3q3 = q3 * q3;

        // Reference direction of Earth's magnetic field
        hx = 2.0f * (mx * (0.5f - q2q2 - q3q3) + my * (q1q2 - q0q3) + mz * (q1q3 + q0q2));
        hy = 2.0f * (mx * (q1q2 + q0q3) + my * (0.5f - q1q1 - q3q3) + mz * (q2q3 - q0q1));
        bx = sqrt(hx * hx + hy * hy);
        bz = 2.0f * (mx * (q1q3 - q0q2) + my * (q2q3 + q0q1) + mz * (0.5f - q1q1 - q2q2));

                // Estimated direction of gravity and magnetic field
                halfvx = q1q3 - q0q2;
                halfvy = q0q1 + q2q3;
                halfvz = q0q0 - 0.5f + q3q3;

                halfwx = bx * (0.5f - q2q2 - q3q3) + bz * (q1q3 - q0q2);
                halfwy = bx * (q1q2 - q0q3) + bz * (q0q1 + q2q3);
                halfwz = bx * (q0q2 + q1q3) + bz * (0.5f - q1q1 - q2q2);

                // Error is sum of cross product between estimated direction and
                // measured direction of field vectors
                halfex = (ay * halfvz - az * halfvy) + (my * halfwz - mz * halfwy);
                halfey = (az * halfvx - ax * halfvz) + (mz * halfwx - mx * halfwz);
                halfez = (ax * halfvy - ay * halfvx) + (mx * halfwy - my * halfwx);

                // Compute and apply integral feedback if enabled
                if(twoKi > 0.0f) {
                        integralFBx += twoKi * halfex * (1.0f / sampleFreq);        // integral error scaled by Ki
                        integralFBy += twoKi * halfey * (1.0f / sampleFreq);
                        integralFBz += twoKi * halfez * (1.0f / sampleFreq);
                        gx += integralFBx;        // apply integral feedback
                        gy += integralFBy;
                        gz += integralFBz;
                }
                else {
                        integralFBx = 0.0f;        // prevent integral windup
                        integralFBy = 0.0f;
                        integralFBz = 0.0f;
                }

                // Apply proportional feedback
                gx += twoKp * halfex;
                gy += twoKp * halfey;
                gz += twoKp * halfez;
        }

        // Integrate rate of change of quaternion
        gx *= (0.5f * (1.0f / sampleFreq));       // pre-multiply common factors
        gy *= (0.5f * (1.0f / sampleFreq));
        gz *= (0.5f * (1.0f / sampleFreq));
        qa = q0;
        qb = q1;
        qc = q2;
        q0 += (-qb * gx - qc * gy - q3 * gz);
        q1 += (qa * gx + qc * gz - q3 * gy);
        q2 += (qa * gy - qb * gz + q3 * gx);
        q3 += (qa * gz + qb * gy - qc * gx);

        // Normalise quaternion
        Norm = sqrt(q0 * q0 + q1 * q1 + q2 * q2 + q3 * q3);
        q0 /= Norm;
        q1 /= Norm;
        q2 /= Norm;
        q3 /= Norm;
        
        // Store values to output data
        MPU9150A.out_accel.x = ax;
        MPU9150A.out_accel.y = ay;
        MPU9150A.out_accel.z = az;

        MPU9150A.out_gyro.x = gx;
        MPU9150A.out_gyro.y = gy;
        MPU9150A.out_gyro.z = gz;
        
        MPU9150A.out_mag.x = mx;
        MPU9150A.out_mag.y = my;
        MPU9150A.out_mag.z = mz;

}