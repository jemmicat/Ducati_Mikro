
#include "Globals.h"
/* Global variable definitions for IMU or AHRS Processors */

// Variable definitions
float twoKp = twoKpDef;                       // 2 * proportional gain (Kp)
float twoKi = twoKiDef;                       // 2 * integral gain (Ki)

// Quaternion of sensor frame relative to auxiliary frame
float q0 = 1.0f;
float q1 = 0.0f;
float q2 = 0.0f;
float q3 = 0.0f;

// Integral error terms scaled by Ki
float integralFBx = 0.0f;
float integralFBy = 0.0f;
float integralFBz = 0.0f;

float Norm;
float q0q0, q0q1, q0q2, q0q3, q1q1, q1q2, q1q3, q2q2, q2q3, q3q3;
float hx, hy, bx, bz;
float halfvx, halfvy, halfvz, halfwx, halfwy, halfwz;
float halfex, halfey, halfez;
float qa, qb, qc;

// Input Values for AHRS and IMU algorit
float ax, ay, az;
float gx, gy, gz;
float mx, my, mz;