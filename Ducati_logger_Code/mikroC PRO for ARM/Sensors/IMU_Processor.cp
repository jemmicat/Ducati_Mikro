#line 1 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/IMU_Processor.c"
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
#line 11 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/IMU_Processor.c"
extern float q0;
extern float q1;
extern float q2;
extern float q3;


extern float twoKp;
extern float twoKi;

extern float integralFBx;
extern float integralFBy;
extern float integralFBz;
extern float halfvx, halfvy, halfvz, halfwx, halfwy, halfwz;
extern float halfex, halfey, halfez;
extern float qa, qb, qc;
extern float Norm;
extern float gx, gy, gz, ax, ay, az;

extern tSensor MPU9150A;
#line 45 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/IMU_Processor.c"
void IMU_Update() {

 ax = (float)MPU9150A.accel.x - MPU9150A.calib_accel.x;
 ay = (float)MPU9150A.accel.y - MPU9150A.calib_accel.y;
 az = (float)MPU9150A.accel.z - MPU9150A.calib_accel.z;






 gx = ((float)MPU9150A.gyro.x - MPU9150A.calib_gyro.x) *  0.0048f ;
 gy = ((float)MPU9150A.gyro.y - MPU9150A.calib_gyro.y) *  0.0048f ;
 gz = ((float)MPU9150A.gyro.z - MPU9150A.calib_gyro.z) *  0.0048f ;



 if(!((ax == 0.0f) && (ay == 0.0f) && (az == 0.0f))) {


 Norm = sqrt(ax * ax + ay * ay + az * az);
 ax /= Norm;
 ay /= Norm;
 az /= Norm;


 halfvx = q1 * q3 - q0 * q2;
 halfvy = q0 * q1 + q2 * q3;
 halfvz = q0 * q0 - 0.5f + q3 * q3;


 halfex = (ay * halfvz - az * halfvy);
 halfey = (az * halfvx - ax * halfvz);
 halfez = (ax * halfvy - ay * halfvx);


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

}
