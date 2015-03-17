
#include "typedefs.h"
#include "Globals.h"

//==============================================================================
//                 Definitions for IMU Alghoritms
//==============================================================================


// Quaternion of sensor frame relative to auxiliary frame
extern float q0;
extern float q1;
extern float q2;
extern float q3;

// Variable definitions
extern float twoKp;
extern float twoKi;
// Integral error terms scaled by Ki
extern float integralFBx;
extern float integralFBy;
extern float integralFBz;
extern float halfvx, halfvy, halfvz, halfwx, halfwy, halfwz;
extern float halfex, halfey, halfez;
extern float qa, qb, qc;
extern float Norm;
extern float gx, gy, gz, ax, ay, az;

extern tSensor MPU9150A;

#define _DEG //or _RAD

//==========================================================================================================
// Description:
//
// Global variables 'q0', 'q1', 'q2', 'q3' are the quaternion elements representing the estimated
// orientation.  See my report for an overview of the use of quaternions in this application.
//
// User must call 'IMUupdate()' every sample period and parse calibrated gyroscope ('gx', 'gy', 'gz')
// and accelerometer ('ax', 'ay', 'ay') data.  Gyroscope units are radians or degrees/second, accelerometer
// units are irrelevant as the vector is normalised.
//
//==========================================================================================================

void IMU_Update() {

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

        // Compute feedback only if accelerometer measurement valid (avoids NaN in accelerometer normalisation)
        if(!((ax == 0.0f) && (ay == 0.0f) && (az == 0.0f))) {

                // Normalise accelerometer measurement
                Norm = sqrt(ax * ax + ay * ay + az * az);
                ax /= Norm;
                ay /= Norm;
                az /= Norm;

                // Estimated direction of gravity and vector perpendicular to magnetic flux
                halfvx = q1 * q3 - q0 * q2;
                halfvy = q0 * q1 + q2 * q3;
                halfvz = q0 * q0 - 0.5f + q3 * q3;

                // Error is sum of cross product between estimated and measured direction of gravity
                halfex = (ay * halfvz - az * halfvy);
                halfey = (az * halfvx - ax * halfvz);
                halfez = (ax * halfvy - ay * halfvx);

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
        gx *= (0.5f * (1.0f / sampleFreq));                // pre-multiply common factors
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


        MPU9150A.out_accel.x = ax;
        MPU9150A.out_accel.y = ay;
        MPU9150A.out_accel.z = az;

        MPU9150A.out_gyro.x = gx;
        MPU9150A.out_gyro.y = gy;
        MPU9150A.out_gyro.z = gz;

}