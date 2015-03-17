#line 1 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/Globals.c"
#line 1 "c:/users/jemmi/documents/github/ducati_mikro/ducati_logger_code/mikroc pro for arm/sensors/globals.h"
#line 6 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/Globals.c"
float twoKp =  (2.0f * 0.04f) ;
float twoKi =  (2.0f * 0.002f) ;


float q0 = 1.0f;
float q1 = 0.0f;
float q2 = 0.0f;
float q3 = 0.0f;


float integralFBx = 0.0f;
float integralFBy = 0.0f;
float integralFBz = 0.0f;

float Norm;
float q0q0, q0q1, q0q2, q0q3, q1q1, q1q2, q1q3, q2q2, q2q3, q3q3;
float hx, hy, bx, bz;
float halfvx, halfvy, halfvz, halfwx, halfwy, halfwz;
float halfex, halfey, halfez;
float qa, qb, qc;


float ax, ay, az;
float gx, gy, gz;
float mx, my, mz;
