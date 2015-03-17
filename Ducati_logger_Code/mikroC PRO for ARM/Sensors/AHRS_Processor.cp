#line 1 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/AHRS_Processor.c"
#line 1 "c:/users/jemmi/documents/github/ducati_mikro/ducati_logger_code/mikroc pro for arm/sensors/typedefs.h"

typedef struct {
 int x;
 int y;
 int z;
} tAxisB;

typedef struct {
 int x;
 int y;
 int z;
} tAxis;

typedef struct {
 float x;
 float y;
 float z;
} tAxisF;



typedef struct {
 tAxis accel;
 tAxis gyro;
 tAxis mag;
 tAxisF calib_accel;
 tAxisF calib_gyro;
 tAxisF calib_mag;
 tAxisF out_accel;
 tAxisF out_gyro;
 tAxisF out_mag;
 tAxisF mag_scale;
 tAxis mag_off;
 float temp;
 float gdt;
} tSensor;
#line 1 "c:/users/jemmi/documents/github/ducati_mikro/ducati_logger_code/mikroc pro for arm/sensors/globals.h"
#line 11 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/AHRS_Processor.c"
extern float twoKp;
extern float twoKi;


extern float q0;
extern float q1;
extern float q2;
extern float q3;


extern float integralFBx;
extern float integralFBy;
extern float integralFBz;

extern float Norm;
extern float q0q0, q0q1, q0q2, q0q3, q1q1, q1q2, q1q3, q2q2, q2q3, q3q3;
extern float hx, hy, bx, bz;
extern float halfvx, halfvy, halfvz, halfwx, halfwy, halfwz;
extern float halfex, halfey, halfez;
extern float qa, qb, qc;


extern float ax, ay, az;
extern float gx, gy, gz;
extern float mx, my, mz;


extern tSensor MPU9150A;
#line 66 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/AHRS_Processor.c"
void AHRS_Update() {

 ax = (float)MPU9150A.accel.x - MPU9150A.calib_accel.x;
 ay = (float)MPU9150A.accel.y - MPU9150A.calib_accel.y;
 az = (float)MPU9150A.accel.z - MPU9150A.calib_accel.z;






 gx = ((float)MPU9150A.gyro.x - MPU9150A.calib_gyro.x) *  0.0048f ;
 gy = ((float)MPU9150A.gyro.y - MPU9150A.calib_gyro.y) *  0.0048f ;
 gz = ((float)MPU9150A.gyro.z - MPU9150A.calib_gyro.z) *  0.0048f ;


 mx = ((float)MPU9150A.mag.x - MPU9150A.mag_off.x) / MPU9150A.mag_scale.x;
 my = ((float)MPU9150A.mag.y - MPU9150A.mag_off.y) / MPU9150A.mag_scale.y;
 mz = ((float)MPU9150A.mag.z - MPU9150A.mag_off.z) / MPU9150A.mag_scale.z;



 if(!((ax == 0.0f) && (ay == 0.0f) && (az == 0.0f))) {


 Norm = sqrt(ax * ax + ay * ay + az * az);
 ax /= Norm;
 ay /= Norm;
 az /= Norm;


 Norm = sqrt(mx * mx + my * my + mz * mz);
 mx /= Norm;
 my /= Norm;
 mz /= Norm;


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


 hx = 2.0f * (mx * (0.5f - q2q2 - q3q3) + my * (q1q2 - q0q3) + mz * (q1q3 + q0q2));
 hy = 2.0f * (mx * (q1q2 + q0q3) + my * (0.5f - q1q1 - q3q3) + mz * (q2q3 - q0q1));
 bx = sqrt(hx * hx + hy * hy);
 bz = 2.0f * (mx * (q1q3 - q0q2) + my * (q2q3 + q0q1) + mz * (0.5f - q1q1 - q2q2));


 halfvx = q1q3 - q0q2;
 halfvy = q0q1 + q2q3;
 halfvz = q0q0 - 0.5f + q3q3;

 halfwx = bx * (0.5f - q2q2 - q3q3) + bz * (q1q3 - q0q2);
 halfwy = bx * (q1q2 - q0q3) + bz * (q0q1 + q2q3);
 halfwz = bx * (q0q2 + q1q3) + bz * (0.5f - q1q1 - q2q2);



 halfex = (ay * halfvz - az * halfvy) + (my * halfwz - mz * halfwy);
 halfey = (az * halfvx - ax * halfvz) + (mz * halfwx - mx * halfwz);
 halfez = (ax * halfvy - ay * halfvx) + (mx * halfwy - my * halfwx);


 if(twoKi > 0.0f) {
 integralFBx += twoKi * halfex * (1.0f /  1000.0f );
 integralFBy += twoKi * halfey * (1.0f /  1000.0f );
 integralFBz += twoKi * halfez * (1.0f /  1000.0f );
 gx += integralFBx;
 gy += integralFBy;
 gz += integralFBz;
 }
 else {
 integralFBx = 0.0f;
 integralFBy = 0.0f;
 integralFBz = 0.0f;
 }


 gx += twoKp * halfex;
 gy += twoKp * halfey;
 gz += twoKp * halfez;
 }


 gx *= (0.5f * (1.0f /  1000.0f ));
 gy *= (0.5f * (1.0f /  1000.0f ));
 gz *= (0.5f * (1.0f /  1000.0f ));
 qa = q0;
 qb = q1;
 qc = q2;
 q0 += (-qb * gx - qc * gy - q3 * gz);
 q1 += (qa * gx + qc * gz - q3 * gy);
 q2 += (qa * gy - qb * gz + q3 * gx);
 q3 += (qa * gz + qb * gy - qc * gx);


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

 MPU9150A.out_mag.x = mx;
 MPU9150A.out_mag.y = my;
 MPU9150A.out_mag.z = mz;

}
