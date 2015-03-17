_AHRS_Update:
;AHRS_Processor.c,66 :: 		void AHRS_Update() {
SUB	SP, SP, #68
STR	LR, [SP, #0]
;AHRS_Processor.c,68 :: 		ax = (float)MPU9150A.accel.x - MPU9150A.calib_accel.x;
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
;AHRS_Processor.c,69 :: 		ay = (float)MPU9150A.accel.y - MPU9150A.calib_accel.y;
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
;AHRS_Processor.c,70 :: 		az = (float)MPU9150A.accel.z - MPU9150A.calib_accel.z;
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
;AHRS_Processor.c,77 :: 		gx = ((float)MPU9150A.gyro.x - MPU9150A.calib_gyro.x) * gyroGAIN;
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
;AHRS_Processor.c,78 :: 		gy = ((float)MPU9150A.gyro.y - MPU9150A.calib_gyro.y) * gyroGAIN;
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
;AHRS_Processor.c,79 :: 		gz = ((float)MPU9150A.gyro.z - MPU9150A.calib_gyro.z) * gyroGAIN;
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
;AHRS_Processor.c,82 :: 		mx = ((float)MPU9150A.mag.x - MPU9150A.mag_off.x) / MPU9150A.mag_scale.x;
MOVW	R0, #lo_addr(_MPU9150A+12)
MOVT	R0, #hi_addr(_MPU9150A+12)
LDRSH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #lo_addr(_MPU9150A+104)
MOVT	R0, #hi_addr(_MPU9150A+104)
LDRSH	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#1, S0, S0
VSUB.F32	S1, S1, S0
MOVW	R0, #lo_addr(_MPU9150A+92)
MOVT	R0, #hi_addr(_MPU9150A+92)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S1, S0
MOVW	R0, #lo_addr(_mx+0)
MOVT	R0, #hi_addr(_mx+0)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,83 :: 		my = ((float)MPU9150A.mag.y - MPU9150A.mag_off.y) / MPU9150A.mag_scale.y;
MOVW	R0, #lo_addr(_MPU9150A+14)
MOVT	R0, #hi_addr(_MPU9150A+14)
LDRSH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #lo_addr(_MPU9150A+106)
MOVT	R0, #hi_addr(_MPU9150A+106)
LDRSH	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#1, S0, S0
VSUB.F32	S1, S1, S0
MOVW	R0, #lo_addr(_MPU9150A+96)
MOVT	R0, #hi_addr(_MPU9150A+96)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S1, S0
MOVW	R0, #lo_addr(_my+0)
MOVT	R0, #hi_addr(_my+0)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,84 :: 		mz = ((float)MPU9150A.mag.z - MPU9150A.mag_off.z) / MPU9150A.mag_scale.z;
MOVW	R0, #lo_addr(_MPU9150A+16)
MOVT	R0, #hi_addr(_MPU9150A+16)
LDRSH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #lo_addr(_MPU9150A+108)
MOVT	R0, #hi_addr(_MPU9150A+108)
LDRSH	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#1, S0, S0
VSUB.F32	S1, S1, S0
MOVW	R0, #lo_addr(_MPU9150A+100)
MOVT	R0, #hi_addr(_MPU9150A+100)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S1, S0
MOVW	R0, #lo_addr(_mz+0)
MOVT	R0, #hi_addr(_mz+0)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,88 :: 		if(!((ax == 0.0f) && (ay == 0.0f) && (az == 0.0f))) {
VCMPE.F32	S2, #0
VMRS	#60, FPSCR
IT	NE
BNE	L_AHRS_Update1
MOVW	R0, #lo_addr(_ay+0)
MOVT	R0, #hi_addr(_ay+0)
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S0, #0
VMRS	#60, FPSCR
IT	NE
BNE	L_AHRS_Update1
MOVW	R0, #lo_addr(_az+0)
MOVT	R0, #hi_addr(_az+0)
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S0, #0
VMRS	#60, FPSCR
IT	NE
BNE	L_AHRS_Update1
MOVS	R0, #1
IT	AL
BAL	L_AHRS_Update0
L_AHRS_Update1:
MOVS	R0, #0
L_AHRS_Update0:
CMP	R0, #0
IT	NE
BNE	L_AHRS_Update2
;AHRS_Processor.c,91 :: 		Norm = sqrt(ax * ax + ay * ay + az * az);
MOVW	R0, #lo_addr(_ax+0)
MOVT	R0, #hi_addr(_ax+0)
STR	R0, [SP, #64]
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R0, #0]
VMUL.F32	S2, S0, S1
MOVW	R0, #lo_addr(_ay+0)
MOVT	R0, #hi_addr(_ay+0)
STR	R0, [SP, #60]
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S2, S2, S0
MOVW	R0, #lo_addr(_az+0)
MOVT	R0, #hi_addr(_az+0)
STR	R0, [SP, #56]
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_Norm+0)
MOVT	R0, #hi_addr(_Norm+0)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,92 :: 		ax /= Norm;
LDR	R1, [SP, #64]
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VDIV.F32	S1, S1, S0
VSTR	#1, S1, [R1, #0]
;AHRS_Processor.c,93 :: 		ay /= Norm;
LDR	R1, [SP, #60]
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VDIV.F32	S1, S1, S0
VSTR	#1, S1, [R1, #0]
;AHRS_Processor.c,94 :: 		az /= Norm;
LDR	R1, [SP, #56]
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [R1, #0]
;AHRS_Processor.c,97 :: 		Norm = sqrt(mx * mx + my * my + mz * mz);
MOVW	R0, #lo_addr(_mx+0)
MOVT	R0, #hi_addr(_mx+0)
STR	R0, [SP, #52]
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R0, #0]
VMUL.F32	S2, S0, S1
MOVW	R0, #lo_addr(_my+0)
MOVT	R0, #hi_addr(_my+0)
STR	R0, [SP, #48]
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S2, S2, S0
MOVW	R0, #lo_addr(_mz+0)
MOVT	R0, #hi_addr(_mz+0)
STR	R0, [SP, #44]
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_Norm+0)
MOVT	R0, #hi_addr(_Norm+0)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,98 :: 		mx /= Norm;
LDR	R1, [SP, #52]
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VDIV.F32	S13, S1, S0
VSTR	#1, S13, [R1, #0]
;AHRS_Processor.c,99 :: 		my /= Norm;
LDR	R1, [SP, #48]
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VDIV.F32	S12, S1, S0
VSTR	#1, S12, [R1, #0]
;AHRS_Processor.c,100 :: 		mz /= Norm;
LDR	R1, [SP, #44]
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VDIV.F32	S11, S1, S0
VSTR	#1, S11, [R1, #0]
;AHRS_Processor.c,103 :: 		q0q0 = q0 * q0;
MOVW	R4, #lo_addr(_q0+0)
MOVT	R4, #hi_addr(_q0+0)
VLDR	#1, S1, [R4, #0]
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_q0q0+0)
MOVT	R0, #hi_addr(_q0q0+0)
STR	R0, [SP, #40]
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,104 :: 		q0q1 = q0 * q1;
MOVW	R2, #lo_addr(_q1+0)
MOVT	R2, #hi_addr(_q1+0)
VLDR	#1, S1, [R2, #0]
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S10, S0, S1
MOVW	R0, #lo_addr(_q0q1+0)
MOVT	R0, #hi_addr(_q0q1+0)
STR	R0, [SP, #36]
VSTR	#1, S10, [R0, #0]
;AHRS_Processor.c,105 :: 		q0q2 = q0 * q2;
MOVW	R3, #lo_addr(_q2+0)
MOVT	R3, #hi_addr(_q2+0)
VLDR	#1, S1, [R3, #0]
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S9, S0, S1
MOVW	R0, #lo_addr(_q0q2+0)
MOVT	R0, #hi_addr(_q0q2+0)
STR	R0, [SP, #32]
VSTR	#1, S9, [R0, #0]
;AHRS_Processor.c,106 :: 		q0q3 = q0 * q3;
MOVW	R1, #lo_addr(_q3+0)
MOVT	R1, #hi_addr(_q3+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S8, S0, S1
MOVW	R0, #lo_addr(_q0q3+0)
MOVT	R0, #hi_addr(_q0q3+0)
STR	R0, [SP, #28]
VSTR	#1, S8, [R0, #0]
;AHRS_Processor.c,107 :: 		q1q1 = q1 * q1;
MOV	R0, R2
VLDR	#1, S1, [R0, #0]
MOV	R0, R2
VLDR	#1, S0, [R0, #0]
VMUL.F32	S7, S0, S1
MOVW	R0, #lo_addr(_q1q1+0)
MOVT	R0, #hi_addr(_q1q1+0)
STR	R0, [SP, #24]
VSTR	#1, S7, [R0, #0]
;AHRS_Processor.c,108 :: 		q1q2 = q1 * q2;
MOV	R0, R3
VLDR	#1, S1, [R0, #0]
MOV	R0, R2
VLDR	#1, S0, [R0, #0]
VMUL.F32	S6, S0, S1
MOVW	R0, #lo_addr(_q1q2+0)
MOVT	R0, #hi_addr(_q1q2+0)
STR	R0, [SP, #20]
VSTR	#1, S6, [R0, #0]
;AHRS_Processor.c,109 :: 		q1q3 = q1 * q3;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R2
VLDR	#1, S0, [R0, #0]
VMUL.F32	S5, S0, S1
MOVW	R0, #lo_addr(_q1q3+0)
MOVT	R0, #hi_addr(_q1q3+0)
STR	R0, [SP, #16]
VSTR	#1, S5, [R0, #0]
;AHRS_Processor.c,110 :: 		q2q2 = q2 * q2;
MOV	R0, R3
VLDR	#1, S1, [R0, #0]
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VMUL.F32	S3, S0, S1
MOVW	R0, #lo_addr(_q2q2+0)
MOVT	R0, #hi_addr(_q2q2+0)
STR	R0, [SP, #12]
VSTR	#1, S3, [R0, #0]
;AHRS_Processor.c,111 :: 		q2q3 = q2 * q3;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VMUL.F32	S4, S0, S1
MOVW	R0, #lo_addr(_q2q3+0)
MOVT	R0, #hi_addr(_q2q3+0)
STR	R0, [SP, #8]
VSTR	#1, S4, [R0, #0]
;AHRS_Processor.c,112 :: 		q3q3 = q3 * q3;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S2, S0, S1
MOVW	R0, #lo_addr(_q3q3+0)
MOVT	R0, #hi_addr(_q3q3+0)
STR	R0, [SP, #4]
VSTR	#1, S2, [R0, #0]
;AHRS_Processor.c,115 :: 		hx = 2.0f * (mx * (0.5f - q2q2 - q3q3) + my * (q1q2 - q0q3) + mz * (q1q3 + q0q2));
VMOV.F32	S0, #0.5
VSUB.F32	S0, S0, S3
VSUB.F32	S0, S0, S2
VMUL.F32	S1, S13, S0
VSUB.F32	S0, S6, S8
VMUL.F32	S0, S12, S0
VADD.F32	S1, S1, S0
VADD.F32	S0, S5, S9
VMUL.F32	S0, S11, S0
VADD.F32	S1, S1, S0
VMOV.F32	S0, #2
VMUL.F32	S3, S0, S1
MOVW	R0, #lo_addr(_hx+0)
MOVT	R0, #hi_addr(_hx+0)
VSTR	#1, S3, [R0, #0]
;AHRS_Processor.c,116 :: 		hy = 2.0f * (mx * (q1q2 + q0q3) + my * (0.5f - q1q1 - q3q3) + mz * (q2q3 - q0q1));
VADD.F32	S0, S6, S8
VMUL.F32	S1, S13, S0
VMOV.F32	S0, #0.5
VSUB.F32	S0, S0, S7
VSUB.F32	S0, S0, S2
VMUL.F32	S0, S12, S0
VADD.F32	S1, S1, S0
VSUB.F32	S0, S4, S10
VMUL.F32	S0, S11, S0
VADD.F32	S1, S1, S0
VMOV.F32	S0, #2
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_hy+0)
MOVT	R0, #hi_addr(_hy+0)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,117 :: 		bx = sqrt(hx * hx + hy * hy);
VMUL.F32	S1, S3, S3
VMUL.F32	S0, S0, S0
VADD.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_bx+0)
MOVT	R0, #hi_addr(_bx+0)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,118 :: 		bz = 2.0f * (mx * (q1q3 - q0q2) + my * (q2q3 + q0q1) + mz * (0.5f - q1q1 - q2q2));
LDR	R8, [SP, #32]
MOV	R0, R8
VLDR	#1, S2, [R0, #0]
LDR	R7, [SP, #16]
MOV	R0, R7
VLDR	#1, S1, [R0, #0]
VSUB.F32	S8, S1, S2
LDR	R6, [SP, #52]
MOV	R0, R6
VLDR	#1, S1, [R0, #0]
VMUL.F32	S3, S1, S8
LDR	R0, [SP, #36]
VLDR	#1, S2, [R0, #0]
LDR	R0, [SP, #8]
VLDR	#1, S1, [R0, #0]
VADD.F32	S7, S1, S2
LDR	R5, [SP, #48]
MOV	R0, R5
VLDR	#1, S1, [R0, #0]
VMUL.F32	S1, S1, S7
VADD.F32	S3, S3, S1
LDR	R4, [SP, #24]
MOV	R0, R4
VLDR	#1, S2, [R0, #0]
VMOV.F32	S1, #0.5
VSUB.F32	S2, S1, S2
LDR	R2, [SP, #12]
MOV	R0, R2
VLDR	#1, S1, [R0, #0]
VSUB.F32	S2, S2, S1
LDR	R3, [SP, #44]
MOV	R0, R3
VLDR	#1, S1, [R0, #0]
VMUL.F32	S1, S1, S2
VADD.F32	S2, S3, S1
VMOV.F32	S1, #2
VMUL.F32	S3, S1, S2
MOVW	R0, #lo_addr(_bz+0)
MOVT	R0, #hi_addr(_bz+0)
VSTR	#1, S3, [R0, #0]
;AHRS_Processor.c,121 :: 		halfvx = q1q3 - q0q2;
MOVW	R0, #lo_addr(_halfvx+0)
MOVT	R0, #hi_addr(_halfvx+0)
VSTR	#1, S8, [R0, #0]
;AHRS_Processor.c,122 :: 		halfvy = q0q1 + q2q3;
MOVW	R0, #lo_addr(_halfvy+0)
MOVT	R0, #hi_addr(_halfvy+0)
VSTR	#1, S7, [R0, #0]
;AHRS_Processor.c,123 :: 		halfvz = q0q0 - 0.5f + q3q3;
LDR	R0, [SP, #40]
VLDR	#1, S2, [R0, #0]
VMOV.F32	S1, #0.5
VSUB.F32	S2, S2, S1
LDR	R1, [SP, #4]
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VADD.F32	S6, S2, S1
MOVW	R0, #lo_addr(_halfvz+0)
MOVT	R0, #hi_addr(_halfvz+0)
VSTR	#1, S6, [R0, #0]
;AHRS_Processor.c,125 :: 		halfwx = bx * (0.5f - q2q2 - q3q3) + bz * (q1q3 - q0q2);
MOV	R0, R2
VLDR	#1, S2, [R0, #0]
VMOV.F32	S1, #0.5
VSUB.F32	S2, S1, S2
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VSUB.F32	S1, S2, S1
VMUL.F32	S2, S0, S1
VMUL.F32	S1, S3, S8
VADD.F32	S5, S2, S1
MOVW	R0, #lo_addr(_halfwx+0)
MOVT	R0, #hi_addr(_halfwx+0)
VSTR	#1, S5, [R0, #0]
;AHRS_Processor.c,126 :: 		halfwy = bx * (q1q2 - q0q3) + bz * (q0q1 + q2q3);
LDR	R0, [SP, #28]
VLDR	#1, S2, [R0, #0]
LDR	R0, [SP, #20]
VLDR	#1, S1, [R0, #0]
VSUB.F32	S1, S1, S2
VMUL.F32	S2, S0, S1
VMUL.F32	S1, S3, S7
VADD.F32	S4, S2, S1
MOVW	R0, #lo_addr(_halfwy+0)
MOVT	R0, #hi_addr(_halfwy+0)
VSTR	#1, S4, [R0, #0]
;AHRS_Processor.c,127 :: 		halfwz = bx * (q0q2 + q1q3) + bz * (0.5f - q1q1 - q2q2);
MOV	R0, R7
VLDR	#1, S2, [R0, #0]
MOV	R0, R8
VLDR	#1, S1, [R0, #0]
VADD.F32	S1, S1, S2
VMUL.F32	S2, S0, S1
MOV	R0, R4
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.5
VSUB.F32	S1, S0, S1
MOV	R0, R2
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
VMUL.F32	S0, S3, S0
VADD.F32	S3, S2, S0
MOVW	R0, #lo_addr(_halfwz+0)
MOVT	R0, #hi_addr(_halfwz+0)
VSTR	#1, S3, [R0, #0]
;AHRS_Processor.c,131 :: 		halfex = (ay * halfvz - az * halfvy) + (my * halfwz - mz * halfwy);
LDR	R2, [SP, #60]
MOV	R0, R2
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S0, S6
LDR	R1, [SP, #56]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S7
VSUB.F32	S2, S1, S0
MOV	R0, R5
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S0, S3
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S4
VSUB.F32	S0, S1, S0
VADD.F32	S0, S2, S0
MOVW	R0, #lo_addr(_halfex+0)
MOVT	R0, #hi_addr(_halfex+0)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,132 :: 		halfey = (az * halfvx - ax * halfvz) + (mz * halfwx - mx * halfwz);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S0, S8
LDR	R1, [SP, #64]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S6
VSUB.F32	S2, S1, S0
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S0, S5
MOV	R0, R6
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S3
VSUB.F32	S0, S1, S0
VADD.F32	S0, S2, S0
MOVW	R0, #lo_addr(_halfey+0)
MOVT	R0, #hi_addr(_halfey+0)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,133 :: 		halfez = (ax * halfvy - ay * halfvx) + (mx * halfwy - my * halfwx);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S0, S7
MOV	R0, R2
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S8
VSUB.F32	S2, S1, S0
MOV	R0, R6
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S0, S4
MOV	R0, R5
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S5
VSUB.F32	S0, S1, S0
VADD.F32	S0, S2, S0
MOVW	R0, #lo_addr(_halfez+0)
MOVT	R0, #hi_addr(_halfez+0)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,136 :: 		if(twoKi > 0.0f) {
MOVW	R0, #lo_addr(_twoKi+0)
MOVT	R0, #hi_addr(_twoKi+0)
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S0, #0
VMRS	#60, FPSCR
IT	LE
BLE	L_AHRS_Update3
;AHRS_Processor.c,137 :: 		integralFBx += twoKi * halfex * (1.0f / sampleFreq);        // integral error scaled by Ki
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
;AHRS_Processor.c,138 :: 		integralFBy += twoKi * halfey * (1.0f / sampleFreq);
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
;AHRS_Processor.c,139 :: 		integralFBz += twoKi * halfez * (1.0f / sampleFreq);
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
;AHRS_Processor.c,140 :: 		gx += integralFBx;        // apply integral feedback
MOVW	R0, #lo_addr(_gx+0)
MOVT	R0, #hi_addr(_gx+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S3
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,141 :: 		gy += integralFBy;
MOVW	R0, #lo_addr(_gy+0)
MOVT	R0, #hi_addr(_gy+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S2
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,142 :: 		gz += integralFBz;
MOVW	R0, #lo_addr(_gz+0)
MOVT	R0, #hi_addr(_gz+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,143 :: 		}
IT	AL
BAL	L_AHRS_Update4
L_AHRS_Update3:
;AHRS_Processor.c,145 :: 		integralFBx = 0.0f;        // prevent integral windup
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_integralFBx+0)
MOVT	R0, #hi_addr(_integralFBx+0)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,146 :: 		integralFBy = 0.0f;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_integralFBy+0)
MOVT	R0, #hi_addr(_integralFBy+0)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,147 :: 		integralFBz = 0.0f;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_integralFBz+0)
MOVT	R0, #hi_addr(_integralFBz+0)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,148 :: 		}
L_AHRS_Update4:
;AHRS_Processor.c,151 :: 		gx += twoKp * halfex;
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
;AHRS_Processor.c,152 :: 		gy += twoKp * halfey;
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
;AHRS_Processor.c,153 :: 		gz += twoKp * halfez;
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
;AHRS_Processor.c,154 :: 		}
L_AHRS_Update2:
;AHRS_Processor.c,157 :: 		gx *= (0.5f * (1.0f / sampleFreq));       // pre-multiply common factors
MOVW	R1, #lo_addr(_gx+0)
MOVT	R1, #hi_addr(_gx+0)
STR	R1, [SP, #28]
VLDR	#1, S1, [R1, #0]
MOVW	R0, #4719
MOVT	R0, #14851
VMOV	S0, R0
VMUL.F32	S7, S1, S0
VSTR	#1, S7, [R1, #0]
;AHRS_Processor.c,158 :: 		gy *= (0.5f * (1.0f / sampleFreq));
MOVW	R1, #lo_addr(_gy+0)
MOVT	R1, #hi_addr(_gy+0)
STR	R1, [SP, #24]
VLDR	#1, S1, [R1, #0]
MOVW	R0, #4719
MOVT	R0, #14851
VMOV	S0, R0
VMUL.F32	S6, S1, S0
VSTR	#1, S6, [R1, #0]
;AHRS_Processor.c,159 :: 		gz *= (0.5f * (1.0f / sampleFreq));
MOVW	R1, #lo_addr(_gz+0)
MOVT	R1, #hi_addr(_gz+0)
STR	R1, [SP, #20]
VLDR	#1, S1, [R1, #0]
MOVW	R0, #4719
MOVT	R0, #14851
VMOV	S0, R0
VMUL.F32	S2, S1, S0
VSTR	#1, S2, [R1, #0]
;AHRS_Processor.c,160 :: 		qa = q0;
MOVW	R3, #lo_addr(_q0+0)
MOVT	R3, #hi_addr(_q0+0)
STR	R3, [SP, #16]
VLDR	#1, S0, [R3, #0]
MOVW	R7, #lo_addr(_qa+0)
MOVT	R7, #hi_addr(_qa+0)
VSTR	#1, S0, [R7, #0]
;AHRS_Processor.c,161 :: 		qb = q1;
MOVW	R2, #lo_addr(_q1+0)
MOVT	R2, #hi_addr(_q1+0)
STR	R2, [SP, #12]
VLDR	#1, S0, [R2, #0]
MOVW	R6, #lo_addr(_qb+0)
MOVT	R6, #hi_addr(_qb+0)
VSTR	#1, S0, [R6, #0]
;AHRS_Processor.c,162 :: 		qc = q2;
MOVW	R5, #lo_addr(_q2+0)
MOVT	R5, #hi_addr(_q2+0)
STR	R5, [SP, #8]
VLDR	#1, S0, [R5, #0]
MOVW	R1, #lo_addr(_qc+0)
MOVT	R1, #hi_addr(_qc+0)
VSTR	#1, S0, [R1, #0]
;AHRS_Processor.c,163 :: 		q0 += (-qb * gx - qc * gy - q3 * gz);
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
;AHRS_Processor.c,164 :: 		q1 += (qa * gx + qc * gz - q3 * gy);
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
;AHRS_Processor.c,165 :: 		q2 += (qa * gy - qb * gz + q3 * gx);
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
;AHRS_Processor.c,166 :: 		q3 += (qa * gz + qb * gy - qc * gx);
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
;AHRS_Processor.c,169 :: 		Norm = sqrt(q0 * q0 + q1 * q1 + q2 * q2 + q3 * q3);
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
;AHRS_Processor.c,170 :: 		q0 /= Norm;
LDR	R1, [SP, #16]
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VDIV.F32	S1, S1, S0
VSTR	#1, S1, [R1, #0]
;AHRS_Processor.c,171 :: 		q1 /= Norm;
LDR	R1, [SP, #12]
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VDIV.F32	S1, S1, S0
VSTR	#1, S1, [R1, #0]
;AHRS_Processor.c,172 :: 		q2 /= Norm;
LDR	R1, [SP, #8]
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VDIV.F32	S1, S1, S0
VSTR	#1, S1, [R1, #0]
;AHRS_Processor.c,173 :: 		q3 /= Norm;
LDR	R1, [SP, #4]
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [R1, #0]
;AHRS_Processor.c,176 :: 		MPU9150A.out_accel.x = ax;
MOVW	R0, #lo_addr(_ax+0)
MOVT	R0, #hi_addr(_ax+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_MPU9150A+56)
MOVT	R0, #hi_addr(_MPU9150A+56)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,177 :: 		MPU9150A.out_accel.y = ay;
MOVW	R0, #lo_addr(_ay+0)
MOVT	R0, #hi_addr(_ay+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_MPU9150A+60)
MOVT	R0, #hi_addr(_MPU9150A+60)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,178 :: 		MPU9150A.out_accel.z = az;
MOVW	R0, #lo_addr(_az+0)
MOVT	R0, #hi_addr(_az+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_MPU9150A+64)
MOVT	R0, #hi_addr(_MPU9150A+64)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,180 :: 		MPU9150A.out_gyro.x = gx;
LDR	R0, [SP, #28]
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_MPU9150A+68)
MOVT	R0, #hi_addr(_MPU9150A+68)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,181 :: 		MPU9150A.out_gyro.y = gy;
LDR	R0, [SP, #24]
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_MPU9150A+72)
MOVT	R0, #hi_addr(_MPU9150A+72)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,182 :: 		MPU9150A.out_gyro.z = gz;
LDR	R0, [SP, #20]
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_MPU9150A+76)
MOVT	R0, #hi_addr(_MPU9150A+76)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,184 :: 		MPU9150A.out_mag.x = mx;
MOVW	R0, #lo_addr(_mx+0)
MOVT	R0, #hi_addr(_mx+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_MPU9150A+80)
MOVT	R0, #hi_addr(_MPU9150A+80)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,185 :: 		MPU9150A.out_mag.y = my;
MOVW	R0, #lo_addr(_my+0)
MOVT	R0, #hi_addr(_my+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_MPU9150A+84)
MOVT	R0, #hi_addr(_MPU9150A+84)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,186 :: 		MPU9150A.out_mag.z = mz;
MOVW	R0, #lo_addr(_mz+0)
MOVT	R0, #hi_addr(_mz+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_MPU9150A+88)
MOVT	R0, #hi_addr(_MPU9150A+88)
VSTR	#1, S0, [R0, #0]
;AHRS_Processor.c,188 :: 		}
L_end_AHRS_Update:
LDR	LR, [SP, #0]
ADD	SP, SP, #68
BX	LR
; end of _AHRS_Update
