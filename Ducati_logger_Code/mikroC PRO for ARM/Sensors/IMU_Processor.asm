_IMU_Update:
;IMU_Processor.c,45 :: 		void IMU_Update() {
SUB	SP, SP, #32
STR	LR, [SP, #0]
;IMU_Processor.c,47 :: 		ax = (float)MPU9150A.accel.x - MPU9150A.calib_accel.x;
MOVW	R0, #lo_addr(_MPU9150A+0)
MOVT	R0, #hi_addr(_MPU9150A+0)
LDRSH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #lo_addr(_MPU9150A+20)
MOVT	R0, #hi_addr(_MPU9150A+20)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S2, S1, S0
MOVW	R0, #lo_addr(_ax+0)
MOVT	R0, #hi_addr(_ax+0)
VSTR	#1, S2, [R0, #0]
;IMU_Processor.c,48 :: 		ay = (float)MPU9150A.accel.y - MPU9150A.calib_accel.y;
MOVW	R0, #lo_addr(_MPU9150A+2)
MOVT	R0, #hi_addr(_MPU9150A+2)
LDRSH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #lo_addr(_MPU9150A+24)
MOVT	R0, #hi_addr(_MPU9150A+24)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ay+0)
MOVT	R0, #hi_addr(_ay+0)
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,49 :: 		az = (float)MPU9150A.accel.z - MPU9150A.calib_accel.z;
MOVW	R0, #lo_addr(_MPU9150A+4)
MOVT	R0, #hi_addr(_MPU9150A+4)
LDRSH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #lo_addr(_MPU9150A+28)
MOVT	R0, #hi_addr(_MPU9150A+28)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
MOVW	R0, #lo_addr(_az+0)
MOVT	R0, #hi_addr(_az+0)
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,56 :: 		gx = ((float)MPU9150A.gyro.x - MPU9150A.calib_gyro.x) * gyroGAIN;
MOVW	R0, #lo_addr(_MPU9150A+6)
MOVT	R0, #hi_addr(_MPU9150A+6)
LDRSH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #lo_addr(_MPU9150A+32)
MOVT	R0, #hi_addr(_MPU9150A+32)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S1, S1, S0
MOVW	R0, #18770
MOVT	R0, #15261
VMOV	S0, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_gx+0)
MOVT	R0, #hi_addr(_gx+0)
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,57 :: 		gy = ((float)MPU9150A.gyro.y - MPU9150A.calib_gyro.y) * gyroGAIN;
MOVW	R0, #lo_addr(_MPU9150A+8)
MOVT	R0, #hi_addr(_MPU9150A+8)
LDRSH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #lo_addr(_MPU9150A+36)
MOVT	R0, #hi_addr(_MPU9150A+36)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S1, S1, S0
MOVW	R0, #18770
MOVT	R0, #15261
VMOV	S0, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_gy+0)
MOVT	R0, #hi_addr(_gy+0)
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,58 :: 		gz = ((float)MPU9150A.gyro.z - MPU9150A.calib_gyro.z) * gyroGAIN;
MOVW	R0, #lo_addr(_MPU9150A+10)
MOVT	R0, #hi_addr(_MPU9150A+10)
LDRSH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #lo_addr(_MPU9150A+40)
MOVT	R0, #hi_addr(_MPU9150A+40)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S1, S1, S0
MOVW	R0, #18770
MOVT	R0, #15261
VMOV	S0, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_gz+0)
MOVT	R0, #hi_addr(_gz+0)
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,62 :: 		if(!((ax == 0.0f) && (ay == 0.0f) && (az == 0.0f))) {
VCMPE.F32	S2, #0
VMRS	#60, FPSCR
IT	NE
BNE	L_IMU_Update1
MOVW	R0, #lo_addr(_ay+0)
MOVT	R0, #hi_addr(_ay+0)
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S0, #0
VMRS	#60, FPSCR
IT	NE
BNE	L_IMU_Update1
MOVW	R0, #lo_addr(_az+0)
MOVT	R0, #hi_addr(_az+0)
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S0, #0
VMRS	#60, FPSCR
IT	NE
BNE	L_IMU_Update1
MOVS	R0, #1
IT	AL
BAL	L_IMU_Update0
L_IMU_Update1:
MOVS	R0, #0
L_IMU_Update0:
CMP	R0, #0
IT	NE
BNE	L_IMU_Update2
;IMU_Processor.c,65 :: 		Norm = sqrt(ax * ax + ay * ay + az * az);
MOVW	R0, #lo_addr(_ax+0)
MOVT	R0, #hi_addr(_ax+0)
STR	R0, [SP, #12]
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R0, #0]
VMUL.F32	S2, S0, S1
MOVW	R0, #lo_addr(_ay+0)
MOVT	R0, #hi_addr(_ay+0)
STR	R0, [SP, #8]
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S2, S2, S0
MOVW	R0, #lo_addr(_az+0)
MOVT	R0, #hi_addr(_az+0)
STR	R0, [SP, #4]
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_Norm+0)
MOVT	R0, #hi_addr(_Norm+0)
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,66 :: 		ax /= Norm;
LDR	R1, [SP, #12]
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VDIV.F32	S7, S1, S0
VSTR	#1, S7, [R1, #0]
;IMU_Processor.c,67 :: 		ay /= Norm;
LDR	R1, [SP, #8]
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VDIV.F32	S6, S1, S0
VSTR	#1, S6, [R1, #0]
;IMU_Processor.c,68 :: 		az /= Norm;
LDR	R1, [SP, #4]
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VDIV.F32	S5, S1, S0
VSTR	#1, S5, [R1, #0]
;IMU_Processor.c,71 :: 		halfvx = q1 * q3 - q0 * q2;
MOVW	R4, #lo_addr(_q3+0)
MOVT	R4, #hi_addr(_q3+0)
VLDR	#1, S1, [R4, #0]
MOVW	R3, #lo_addr(_q1+0)
MOVT	R3, #hi_addr(_q1+0)
VLDR	#1, S0, [R3, #0]
VMUL.F32	S2, S0, S1
MOVW	R1, #lo_addr(_q2+0)
MOVT	R1, #hi_addr(_q2+0)
VLDR	#1, S1, [R1, #0]
MOVW	R2, #lo_addr(_q0+0)
MOVT	R2, #hi_addr(_q0+0)
VLDR	#1, S0, [R2, #0]
VMUL.F32	S0, S0, S1
VSUB.F32	S4, S2, S0
MOVW	R0, #lo_addr(_halfvx+0)
MOVT	R0, #hi_addr(_halfvx+0)
VSTR	#1, S4, [R0, #0]
;IMU_Processor.c,72 :: 		halfvy = q0 * q1 + q2 * q3;
MOV	R0, R3
VLDR	#1, S1, [R0, #0]
MOV	R0, R2
VLDR	#1, S0, [R0, #0]
VMUL.F32	S2, S0, S1
MOV	R0, R4
VLDR	#1, S1, [R0, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S3, S2, S0
MOVW	R0, #lo_addr(_halfvy+0)
MOVT	R0, #hi_addr(_halfvy+0)
VSTR	#1, S3, [R0, #0]
;IMU_Processor.c,73 :: 		halfvz = q0 * q0 - 0.5f + q3 * q3;
MOV	R0, R2
VLDR	#1, S1, [R0, #0]
MOV	R0, R2
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #0.5
VSUB.F32	S2, S1, S0
MOV	R0, R4
VLDR	#1, S1, [R0, #0]
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S2, S2, S0
MOVW	R0, #lo_addr(_halfvz+0)
MOVT	R0, #hi_addr(_halfvz+0)
VSTR	#1, S2, [R0, #0]
;IMU_Processor.c,76 :: 		halfex = (ay * halfvz - az * halfvy);
VMUL.F32	S1, S6, S2
VMUL.F32	S0, S5, S3
VSUB.F32	S0, S1, S0
MOVW	R0, #lo_addr(_halfex+0)
MOVT	R0, #hi_addr(_halfex+0)
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,77 :: 		halfey = (az * halfvx - ax * halfvz);
VMUL.F32	S1, S5, S4
VMUL.F32	S0, S7, S2
VSUB.F32	S0, S1, S0
MOVW	R0, #lo_addr(_halfey+0)
MOVT	R0, #hi_addr(_halfey+0)
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,78 :: 		halfez = (ax * halfvy - ay * halfvx);
VMUL.F32	S1, S7, S3
VMUL.F32	S0, S6, S4
VSUB.F32	S0, S1, S0
MOVW	R0, #lo_addr(_halfez+0)
MOVT	R0, #hi_addr(_halfez+0)
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,81 :: 		if(twoKi > 0.0f) {
MOVW	R0, #lo_addr(_twoKi+0)
MOVT	R0, #hi_addr(_twoKi+0)
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S0, #0
VMRS	#60, FPSCR
IT	LE
BLE	L_IMU_Update3
;IMU_Processor.c,82 :: 		integralFBx += twoKi * halfex * (1.0f / sampleFreq);        // integral error scaled by Ki
MOVW	R0, #lo_addr(_halfex+0)
MOVT	R0, #hi_addr(_halfex+0)
VLDR	#1, S1, [R0, #0]
MOVW	R1, #lo_addr(_twoKi+0)
MOVT	R1, #hi_addr(_twoKi+0)
VLDR	#1, S0, [R1, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #4719
MOVT	R0, #14979
VMOV	S0, R0
VMUL.F32	S1, S1, S0
MOVW	R0, #lo_addr(_integralFBx+0)
MOVT	R0, #hi_addr(_integralFBx+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S3, S0, S1
VSTR	#1, S3, [R0, #0]
;IMU_Processor.c,83 :: 		integralFBy += twoKi * halfey * (1.0f / sampleFreq);
MOVW	R0, #lo_addr(_halfey+0)
MOVT	R0, #hi_addr(_halfey+0)
VLDR	#1, S1, [R0, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #4719
MOVT	R0, #14979
VMOV	S0, R0
VMUL.F32	S1, S1, S0
MOVW	R0, #lo_addr(_integralFBy+0)
MOVT	R0, #hi_addr(_integralFBy+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S2, S0, S1
VSTR	#1, S2, [R0, #0]
;IMU_Processor.c,84 :: 		integralFBz += twoKi * halfez * (1.0f / sampleFreq);
MOVW	R0, #lo_addr(_halfez+0)
MOVT	R0, #hi_addr(_halfez+0)
VLDR	#1, S1, [R0, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #4719
MOVT	R0, #14979
VMOV	S0, R0
VMUL.F32	S1, S1, S0
MOVW	R0, #lo_addr(_integralFBz+0)
MOVT	R0, #hi_addr(_integralFBz+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S1, S0, S1
VSTR	#1, S1, [R0, #0]
;IMU_Processor.c,85 :: 		gx += integralFBx;        // apply integral feedback
MOVW	R0, #lo_addr(_gx+0)
MOVT	R0, #hi_addr(_gx+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S3
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,86 :: 		gy += integralFBy;
MOVW	R0, #lo_addr(_gy+0)
MOVT	R0, #hi_addr(_gy+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S2
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,87 :: 		gz += integralFBz;
MOVW	R0, #lo_addr(_gz+0)
MOVT	R0, #hi_addr(_gz+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,88 :: 		}
IT	AL
BAL	L_IMU_Update4
L_IMU_Update3:
;IMU_Processor.c,90 :: 		integralFBx = 0.0f;        // prevent integral windup
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_integralFBx+0)
MOVT	R0, #hi_addr(_integralFBx+0)
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,91 :: 		integralFBy = 0.0f;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_integralFBy+0)
MOVT	R0, #hi_addr(_integralFBy+0)
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,92 :: 		integralFBz = 0.0f;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_integralFBz+0)
MOVT	R0, #hi_addr(_integralFBz+0)
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,93 :: 		}
L_IMU_Update4:
;IMU_Processor.c,96 :: 		gx += twoKp * halfex;
MOVW	R0, #lo_addr(_halfex+0)
MOVT	R0, #hi_addr(_halfex+0)
VLDR	#1, S1, [R0, #0]
MOVW	R1, #lo_addr(_twoKp+0)
MOVT	R1, #hi_addr(_twoKp+0)
VLDR	#1, S0, [R1, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_gx+0)
MOVT	R0, #hi_addr(_gx+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,97 :: 		gy += twoKp * halfey;
MOVW	R0, #lo_addr(_halfey+0)
MOVT	R0, #hi_addr(_halfey+0)
VLDR	#1, S1, [R0, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_gy+0)
MOVT	R0, #hi_addr(_gy+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,98 :: 		gz += twoKp * halfez;
MOVW	R0, #lo_addr(_halfez+0)
MOVT	R0, #hi_addr(_halfez+0)
VLDR	#1, S1, [R0, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_gz+0)
MOVT	R0, #hi_addr(_gz+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,99 :: 		}
L_IMU_Update2:
;IMU_Processor.c,102 :: 		gx *= (0.5f * (1.0f / sampleFreq));                // pre-multiply common factors
MOVW	R1, #lo_addr(_gx+0)
MOVT	R1, #hi_addr(_gx+0)
STR	R1, [SP, #28]
VLDR	#1, S1, [R1, #0]
MOVW	R0, #4719
MOVT	R0, #14851
VMOV	S0, R0
VMUL.F32	S7, S1, S0
VSTR	#1, S7, [R1, #0]
;IMU_Processor.c,103 :: 		gy *= (0.5f * (1.0f / sampleFreq));
MOVW	R1, #lo_addr(_gy+0)
MOVT	R1, #hi_addr(_gy+0)
STR	R1, [SP, #24]
VLDR	#1, S1, [R1, #0]
MOVW	R0, #4719
MOVT	R0, #14851
VMOV	S0, R0
VMUL.F32	S6, S1, S0
VSTR	#1, S6, [R1, #0]
;IMU_Processor.c,104 :: 		gz *= (0.5f * (1.0f / sampleFreq));
MOVW	R1, #lo_addr(_gz+0)
MOVT	R1, #hi_addr(_gz+0)
STR	R1, [SP, #20]
VLDR	#1, S1, [R1, #0]
MOVW	R0, #4719
MOVT	R0, #14851
VMOV	S0, R0
VMUL.F32	S2, S1, S0
VSTR	#1, S2, [R1, #0]
;IMU_Processor.c,105 :: 		qa = q0;
MOVW	R3, #lo_addr(_q0+0)
MOVT	R3, #hi_addr(_q0+0)
STR	R3, [SP, #16]
VLDR	#1, S0, [R3, #0]
MOVW	R7, #lo_addr(_qa+0)
MOVT	R7, #hi_addr(_qa+0)
VSTR	#1, S0, [R7, #0]
;IMU_Processor.c,106 :: 		qb = q1;
MOVW	R2, #lo_addr(_q1+0)
MOVT	R2, #hi_addr(_q1+0)
STR	R2, [SP, #12]
VLDR	#1, S0, [R2, #0]
MOVW	R6, #lo_addr(_qb+0)
MOVT	R6, #hi_addr(_qb+0)
VSTR	#1, S0, [R6, #0]
;IMU_Processor.c,107 :: 		qc = q2;
MOVW	R5, #lo_addr(_q2+0)
MOVT	R5, #hi_addr(_q2+0)
STR	R5, [SP, #8]
VLDR	#1, S0, [R5, #0]
MOVW	R1, #lo_addr(_qc+0)
MOVT	R1, #hi_addr(_qc+0)
VSTR	#1, S0, [R1, #0]
;IMU_Processor.c,108 :: 		q0 += (-qb * gx - qc * gy - q3 * gz);
MOV	R0, R2
VLDR	#1, S0, [R0, #0]
VNEG.F32	S0, S0
VMUL.F32	S1, S0, S7
MOV	R0, R5
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S6
VSUB.F32	S1, S1, S0
MOVW	R4, #lo_addr(_q3+0)
MOVT	R4, #hi_addr(_q3+0)
STR	R4, [SP, #4]
VLDR	#1, S0, [R4, #0]
VMUL.F32	S0, S0, S2
VSUB.F32	S1, S1, S0
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VADD.F32	S5, S0, S1
VSTR	#1, S5, [R3, #0]
;IMU_Processor.c,109 :: 		q1 += (qa * gx + qc * gz - q3 * gy);
MOV	R0, R7
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S0, S7
MOV	R0, R5
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S2
VADD.F32	S1, S1, S0
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S6
VSUB.F32	S1, S1, S0
MOV	R0, R2
VLDR	#1, S0, [R0, #0]
VADD.F32	S4, S0, S1
VSTR	#1, S4, [R2, #0]
;IMU_Processor.c,110 :: 		q2 += (qa * gy - qb * gz + q3 * gx);
MOV	R0, R7
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S0, S6
MOV	R0, R6
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S2
VSUB.F32	S1, S1, S0
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S7
VADD.F32	S1, S1, S0
MOV	R0, R5
VLDR	#1, S0, [R0, #0]
VADD.F32	S3, S0, S1
VSTR	#1, S3, [R5, #0]
;IMU_Processor.c,111 :: 		q3 += (qa * gz + qb * gy - qc * gx);
MOV	R0, R7
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S0, S2
MOV	R0, R6
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S6
VADD.F32	S1, S1, S0
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S7
VSUB.F32	S1, S1, S0
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VADD.F32	S2, S0, S1
VSTR	#1, S2, [R4, #0]
;IMU_Processor.c,114 :: 		Norm = sqrt(q0 * q0 + q1 * q1 + q2 * q2 + q3 * q3);
VMUL.F32	S1, S5, S5
VMUL.F32	S0, S4, S4
VADD.F32	S1, S1, S0
VMUL.F32	S0, S3, S3
VADD.F32	S1, S1, S0
VMUL.F32	S0, S2, S2
VADD.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_Norm+0)
MOVT	R0, #hi_addr(_Norm+0)
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,115 :: 		q0 /= Norm;
LDR	R1, [SP, #16]
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VDIV.F32	S1, S1, S0
VSTR	#1, S1, [R1, #0]
;IMU_Processor.c,116 :: 		q1 /= Norm;
LDR	R1, [SP, #12]
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VDIV.F32	S1, S1, S0
VSTR	#1, S1, [R1, #0]
;IMU_Processor.c,117 :: 		q2 /= Norm;
LDR	R1, [SP, #8]
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VDIV.F32	S1, S1, S0
VSTR	#1, S1, [R1, #0]
;IMU_Processor.c,118 :: 		q3 /= Norm;
LDR	R1, [SP, #4]
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [R1, #0]
;IMU_Processor.c,121 :: 		MPU9150A.out_accel.x = ax;
MOVW	R0, #lo_addr(_ax+0)
MOVT	R0, #hi_addr(_ax+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_MPU9150A+56)
MOVT	R0, #hi_addr(_MPU9150A+56)
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,122 :: 		MPU9150A.out_accel.y = ay;
MOVW	R0, #lo_addr(_ay+0)
MOVT	R0, #hi_addr(_ay+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_MPU9150A+60)
MOVT	R0, #hi_addr(_MPU9150A+60)
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,123 :: 		MPU9150A.out_accel.z = az;
MOVW	R0, #lo_addr(_az+0)
MOVT	R0, #hi_addr(_az+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_MPU9150A+64)
MOVT	R0, #hi_addr(_MPU9150A+64)
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,125 :: 		MPU9150A.out_gyro.x = gx;
LDR	R0, [SP, #28]
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_MPU9150A+68)
MOVT	R0, #hi_addr(_MPU9150A+68)
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,126 :: 		MPU9150A.out_gyro.y = gy;
LDR	R0, [SP, #24]
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_MPU9150A+72)
MOVT	R0, #hi_addr(_MPU9150A+72)
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,127 :: 		MPU9150A.out_gyro.z = gz;
LDR	R0, [SP, #20]
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_MPU9150A+76)
MOVT	R0, #hi_addr(_MPU9150A+76)
VSTR	#1, S0, [R0, #0]
;IMU_Processor.c,129 :: 		}
L_end_IMU_Update:
LDR	LR, [SP, #0]
ADD	SP, SP, #32
BX	LR
; end of _IMU_Update
