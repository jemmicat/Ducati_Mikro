MPU9150A_I2C_MPU9150A_I2C_WriteReg:
;MPU9150A_I2C.c,94 :: 		static void MPU9150A_I2C_WriteReg(char wAddr, char wData){
; wData start address is: 4 (R1)
; wAddr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; wData end address is: 4 (R1)
; wAddr end address is: 0 (R0)
; wAddr start address is: 0 (R0)
; wData start address is: 4 (R1)
;MPU9150A_I2C.c,95 :: 		reg_data[0] = wAddr;
MOVW	R2, #lo_addr(MPU9150A_I2C_reg_data+0)
MOVT	R2, #hi_addr(MPU9150A_I2C_reg_data+0)
STRB	R0, [R2, #0]
; wAddr end address is: 0 (R0)
;MPU9150A_I2C.c,96 :: 		reg_data[1] = wData;
MOVW	R2, #lo_addr(MPU9150A_I2C_reg_data+1)
MOVT	R2, #hi_addr(MPU9150A_I2C_reg_data+1)
STRB	R1, [R2, #0]
; wData end address is: 4 (R1)
;MPU9150A_I2C.c,97 :: 		I2C_Start();
BL	_I2C_Start+0
;MPU9150A_I2C.c,98 :: 		I2C_Write(MPU9150A_I2C_ADDR,reg_data, 2, END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #2
MOVW	R1, #lo_addr(MPU9150A_I2C_reg_data+0)
MOVT	R1, #hi_addr(MPU9150A_I2C_reg_data+0)
MOVS	R0, #105
BL	_I2C_Write+0
;MPU9150A_I2C.c,99 :: 		}
L_end_MPU9150A_I2C_WriteReg:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of MPU9150A_I2C_MPU9150A_I2C_WriteReg
MPU9150A_I2C_MPU9150A_I2C_ReadReg:
;MPU9150A_I2C.c,101 :: 		static char MPU9150A_I2C_ReadReg(char rAddr){
; rAddr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; rAddr end address is: 0 (R0)
; rAddr start address is: 0 (R0)
;MPU9150A_I2C.c,102 :: 		reg_data[0] = rAddr;
MOVW	R1, #lo_addr(MPU9150A_I2C_reg_data+0)
MOVT	R1, #hi_addr(MPU9150A_I2C_reg_data+0)
STRB	R0, [R1, #0]
; rAddr end address is: 0 (R0)
;MPU9150A_I2C.c,103 :: 		I2C_Start();
BL	_I2C_Start+0
;MPU9150A_I2C.c,104 :: 		I2C_Write(MPU9150A_I2C_ADDR, reg_data, 1 , END_MODE_RESTART);
MOVW	R3, #0
MOVS	R2, #1
MOVW	R1, #lo_addr(MPU9150A_I2C_reg_data+0)
MOVT	R1, #hi_addr(MPU9150A_I2C_reg_data+0)
MOVS	R0, #105
BL	_I2C_Write+0
;MPU9150A_I2C.c,105 :: 		I2C_Read(MPU9150A_I2C_ADDR, reg_data,  1 , END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #1
MOVW	R1, #lo_addr(MPU9150A_I2C_reg_data+0)
MOVT	R1, #hi_addr(MPU9150A_I2C_reg_data+0)
MOVS	R0, #105
BL	_I2C_Read+0
;MPU9150A_I2C.c,106 :: 		return reg_data[0];
MOVW	R1, #lo_addr(MPU9150A_I2C_reg_data+0)
MOVT	R1, #hi_addr(MPU9150A_I2C_reg_data+0)
LDRB	R0, [R1, #0]
;MPU9150A_I2C.c,107 :: 		}
L_end_MPU9150A_I2C_ReadReg:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of MPU9150A_I2C_MPU9150A_I2C_ReadReg
MPU9150A_I2C_MAG_I2C_WriteReg:
;MPU9150A_I2C.c,109 :: 		static void MAG_I2C_WriteReg(char wAddr, char wData){
; wData start address is: 4 (R1)
; wAddr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; wData end address is: 4 (R1)
; wAddr end address is: 0 (R0)
; wAddr start address is: 0 (R0)
; wData start address is: 4 (R1)
;MPU9150A_I2C.c,110 :: 		reg_data[0] = wAddr;
MOVW	R2, #lo_addr(MPU9150A_I2C_reg_data+0)
MOVT	R2, #hi_addr(MPU9150A_I2C_reg_data+0)
STRB	R0, [R2, #0]
; wAddr end address is: 0 (R0)
;MPU9150A_I2C.c,111 :: 		reg_data[1] = wData;
MOVW	R2, #lo_addr(MPU9150A_I2C_reg_data+1)
MOVT	R2, #hi_addr(MPU9150A_I2C_reg_data+1)
STRB	R1, [R2, #0]
; wData end address is: 4 (R1)
;MPU9150A_I2C.c,112 :: 		I2C_Start();
BL	_I2C_Start+0
;MPU9150A_I2C.c,113 :: 		I2C_Write(MAG_I2C_ADDR,reg_data,2,END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #2
MOVW	R1, #lo_addr(MPU9150A_I2C_reg_data+0)
MOVT	R1, #hi_addr(MPU9150A_I2C_reg_data+0)
MOVS	R0, #12
BL	_I2C_Write+0
;MPU9150A_I2C.c,114 :: 		}
L_end_MAG_I2C_WriteReg:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of MPU9150A_I2C_MAG_I2C_WriteReg
MPU9150A_I2C_MAG_I2C_ReadReg:
;MPU9150A_I2C.c,116 :: 		static char MAG_I2C_ReadReg(char rAddr){
; rAddr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; rAddr end address is: 0 (R0)
; rAddr start address is: 0 (R0)
;MPU9150A_I2C.c,117 :: 		reg_data[0] = rAddr;
MOVW	R1, #lo_addr(MPU9150A_I2C_reg_data+0)
MOVT	R1, #hi_addr(MPU9150A_I2C_reg_data+0)
STRB	R0, [R1, #0]
; rAddr end address is: 0 (R0)
;MPU9150A_I2C.c,118 :: 		I2C_Start();
BL	_I2C_Start+0
;MPU9150A_I2C.c,119 :: 		I2C_Write(MAG_I2C_ADDR, reg_data, 1 , END_MODE_RESTART);
MOVW	R3, #0
MOVS	R2, #1
MOVW	R1, #lo_addr(MPU9150A_I2C_reg_data+0)
MOVT	R1, #hi_addr(MPU9150A_I2C_reg_data+0)
MOVS	R0, #12
BL	_I2C_Write+0
;MPU9150A_I2C.c,120 :: 		I2C_Read(MAG_I2C_ADDR, reg_data,  1 , END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #1
MOVW	R1, #lo_addr(MPU9150A_I2C_reg_data+0)
MOVT	R1, #hi_addr(MPU9150A_I2C_reg_data+0)
MOVS	R0, #12
BL	_I2C_Read+0
;MPU9150A_I2C.c,121 :: 		return reg_data[0];
MOVW	R1, #lo_addr(MPU9150A_I2C_reg_data+0)
MOVT	R1, #hi_addr(MPU9150A_I2C_reg_data+0)
LDRB	R0, [R1, #0]
;MPU9150A_I2C.c,122 :: 		}
L_end_MAG_I2C_ReadReg:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of MPU9150A_I2C_MAG_I2C_ReadReg
_MPU9150A_Detect:
;MPU9150A_I2C.c,124 :: 		char MPU9150A_Detect() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MPU9150A_I2C.c,126 :: 		detect = MPU9150A_I2C_ReadReg(MPUREG_WHOAMI);
MOVS	R0, #117
BL	MPU9150A_I2C_MPU9150A_I2C_ReadReg+0
;MPU9150A_I2C.c,127 :: 		if((detect & 0x7E) == 0x68) {
AND	R0, R0, #126
UXTB	R0, R0
CMP	R0, #104
IT	NE
BNE	L_MPU9150A_Detect0
;MPU9150A_I2C.c,128 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_MPU9150A_Detect
;MPU9150A_I2C.c,129 :: 		}else{
L_MPU9150A_Detect0:
;MPU9150A_I2C.c,130 :: 		return 0;
MOVS	R0, #0
;MPU9150A_I2C.c,132 :: 		}
L_end_MPU9150A_Detect:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MPU9150A_Detect
_MAG_Detect:
;MPU9150A_I2C.c,134 :: 		char MAG_Detect() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MPU9150A_I2C.c,136 :: 		detect = MAG_I2C_ReadReg(MAGREG_WIA);
MOVS	R0, #0
BL	MPU9150A_I2C_MAG_I2C_ReadReg+0
;MPU9150A_I2C.c,137 :: 		return detect;
;MPU9150A_I2C.c,138 :: 		}
L_end_MAG_Detect:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MAG_Detect
MPU9150A_I2C_MPU9150A_Config:
;MPU9150A_I2C.c,140 :: 		static void MPU9150A_Config() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MPU9150A_I2C.c,141 :: 		while(!I2C1_IS_IDLE);
L_MPU9150A_I2C_MPU9150A_Config2:
MOVW	R0, #lo_addr(_I2C1_Is_Idle+0)
MOVT	R0, #hi_addr(_I2C1_Is_Idle+0)
CMP	R0, #0
IT	NE
BNE	L_MPU9150A_I2C_MPU9150A_Config3
IT	AL
BAL	L_MPU9150A_I2C_MPU9150A_Config2
L_MPU9150A_I2C_MPU9150A_Config3:
;MPU9150A_I2C.c,142 :: 		MPU9150A_I2C_WriteReg(MPUREG_PWR_MGMT_1, BIT_H_RESET);                        // Chip reset
MOVS	R1, #128
MOVS	R0, #107
BL	MPU9150A_I2C_MPU9150A_I2C_WriteReg+0
;MPU9150A_I2C.c,143 :: 		delay_ms(10);                                                                 // Startup time delay
MOVW	R7, #41246
MOVT	R7, #7
NOP
NOP
L_MPU9150A_I2C_MPU9150A_Config4:
SUBS	R7, R7, #1
BNE	L_MPU9150A_I2C_MPU9150A_Config4
NOP
NOP
NOP
;MPU9150A_I2C.c,145 :: 		MPU9150A_I2C_WriteReg(MPUREG_SMPLRT_DIV,0x00);                                // Sample rate = 1kHz
MOVS	R1, #0
MOVS	R0, #25
BL	MPU9150A_I2C_MPU9150A_I2C_WriteReg+0
;MPU9150A_I2C.c,147 :: 		MPU9150A_I2C_WriteReg(MPUREG_CONFIG, BITS_DLPF_CFG_42HZ);
MOVS	R1, #3
MOVS	R0, #26
BL	MPU9150A_I2C_MPU9150A_I2C_WriteReg+0
;MPU9150A_I2C.c,148 :: 		MPU9150A_I2C_WriteReg(MPUREG_GYRO_CONFIG,BITS_FS_1000DPS);                    // Gyro scale 1000º/s
MOVS	R1, #16
MOVS	R0, #27
BL	MPU9150A_I2C_MPU9150A_I2C_WriteReg+0
;MPU9150A_I2C.c,149 :: 		MPU9150A_I2C_WriteReg(MPUREG_ACCEL_CONFIG,0x10);                              // Accel scale 8g (+-4096LSB/g)
MOVS	R1, #16
MOVS	R0, #28
BL	MPU9150A_I2C_MPU9150A_I2C_WriteReg+0
;MPU9150A_I2C.c,151 :: 		MPU9150A_I2C_WriteReg(MPUREG_FIFO_EN , BIT_FIFO_DIS);
MOVS	R1, #0
MOVS	R0, #35
BL	MPU9150A_I2C_MPU9150A_I2C_WriteReg+0
;MPU9150A_I2C.c,152 :: 		MPU9150A_I2C_WriteReg(MPUREG_INT_PIN_CFG, 0x02);                              // Bypass mode enabled: 0b00000010 MPUREG_INT_PIN_CFG
MOVS	R1, #2
MOVS	R0, #55
BL	MPU9150A_I2C_MPU9150A_I2C_WriteReg+0
;MPU9150A_I2C.c,153 :: 		MPU9150A_I2C_WriteReg(MPUREG_INT_ENABLE , 0x00);                              // Disable all interrupts: 0b00000000
MOVS	R1, #0
MOVS	R0, #56
BL	MPU9150A_I2C_MPU9150A_I2C_WriteReg+0
;MPU9150A_I2C.c,154 :: 		MPU9150A_I2C_WriteReg(MPUREG_USER_CTRL  , 0x00);                              // No FIFO and no I2C slaves: 0b00000000
MOVS	R1, #0
MOVS	R0, #106
BL	MPU9150A_I2C_MPU9150A_I2C_WriteReg+0
;MPU9150A_I2C.c,155 :: 		MPU9150A_I2C_WriteReg(MPUREG_PWR_MGMT_1 , 0x00);                              // No power management, internal clock source: 0b00000000
MOVS	R1, #0
MOVS	R0, #107
BL	MPU9150A_I2C_MPU9150A_I2C_WriteReg+0
;MPU9150A_I2C.c,156 :: 		MPU9150A_I2C_WriteReg(MPUREG_PWR_MGMT_2 , 0x00);
MOVS	R1, #0
MOVS	R0, #108
BL	MPU9150A_I2C_MPU9150A_I2C_WriteReg+0
;MPU9150A_I2C.c,158 :: 		MAG_I2C_WriteReg(MAGREG_CNTL, 0x01);                                          // Single measurement mode: 0b00000001
MOVS	R1, #1
MOVS	R0, #10
BL	MPU9150A_I2C_MAG_I2C_WriteReg+0
;MPU9150A_I2C.c,159 :: 		delay_ms(10);
MOVW	R7, #41246
MOVT	R7, #7
NOP
NOP
L_MPU9150A_I2C_MPU9150A_Config6:
SUBS	R7, R7, #1
BNE	L_MPU9150A_I2C_MPU9150A_Config6
NOP
NOP
NOP
;MPU9150A_I2C.c,160 :: 		}
L_end_MPU9150A_Config:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of MPU9150A_I2C_MPU9150A_Config
_MPU9150A_Init:
;MPU9150A_I2C.c,162 :: 		char MPU9150A_Init() {                                                          // Reset MPU9150A structure
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MPU9150A_I2C.c,163 :: 		MPU9150A.accel.x = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_MPU9150A+0)
MOVT	R0, #hi_addr(_MPU9150A+0)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,164 :: 		MPU9150A.accel.y = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_MPU9150A+2)
MOVT	R0, #hi_addr(_MPU9150A+2)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,165 :: 		MPU9150A.accel.z = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_MPU9150A+4)
MOVT	R0, #hi_addr(_MPU9150A+4)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,166 :: 		MPU9150A.gyro.x = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_MPU9150A+6)
MOVT	R0, #hi_addr(_MPU9150A+6)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,167 :: 		MPU9150A.gyro.y = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_MPU9150A+8)
MOVT	R0, #hi_addr(_MPU9150A+8)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,168 :: 		MPU9150A.gyro.z = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_MPU9150A+10)
MOVT	R0, #hi_addr(_MPU9150A+10)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,169 :: 		MPU9150A.mag.x = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_MPU9150A+12)
MOVT	R0, #hi_addr(_MPU9150A+12)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,170 :: 		MPU9150A.mag.y = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_MPU9150A+14)
MOVT	R0, #hi_addr(_MPU9150A+14)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,171 :: 		MPU9150A.mag.z = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_MPU9150A+16)
MOVT	R0, #hi_addr(_MPU9150A+16)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,172 :: 		MPU9150A.temp = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_MPU9150A+112)
MOVT	R0, #hi_addr(_MPU9150A+112)
VSTR	#1, S0, [R0, #0]
;MPU9150A_I2C.c,173 :: 		MPU9150A.gdt = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_MPU9150A+116)
MOVT	R0, #hi_addr(_MPU9150A+116)
VSTR	#1, S0, [R0, #0]
;MPU9150A_I2C.c,174 :: 		MPU9150A.calib_accel.x = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_MPU9150A+20)
MOVT	R0, #hi_addr(_MPU9150A+20)
VSTR	#1, S0, [R0, #0]
;MPU9150A_I2C.c,175 :: 		MPU9150A.calib_accel.y = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_MPU9150A+24)
MOVT	R0, #hi_addr(_MPU9150A+24)
VSTR	#1, S0, [R0, #0]
;MPU9150A_I2C.c,176 :: 		MPU9150A.calib_accel.z = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_MPU9150A+28)
MOVT	R0, #hi_addr(_MPU9150A+28)
VSTR	#1, S0, [R0, #0]
;MPU9150A_I2C.c,177 :: 		MPU9150A.calib_gyro.x = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_MPU9150A+32)
MOVT	R0, #hi_addr(_MPU9150A+32)
VSTR	#1, S0, [R0, #0]
;MPU9150A_I2C.c,178 :: 		MPU9150A.calib_gyro.y = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_MPU9150A+36)
MOVT	R0, #hi_addr(_MPU9150A+36)
VSTR	#1, S0, [R0, #0]
;MPU9150A_I2C.c,179 :: 		MPU9150A.calib_gyro.z = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_MPU9150A+40)
MOVT	R0, #hi_addr(_MPU9150A+40)
VSTR	#1, S0, [R0, #0]
;MPU9150A_I2C.c,181 :: 		MPU9150A.mag_off.x = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_MPU9150A+104)
MOVT	R0, #hi_addr(_MPU9150A+104)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,182 :: 		MPU9150A.mag_off.y = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_MPU9150A+106)
MOVT	R0, #hi_addr(_MPU9150A+106)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,183 :: 		MPU9150A.mag_off.z = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_MPU9150A+108)
MOVT	R0, #hi_addr(_MPU9150A+108)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,185 :: 		MPU9150A.mag_scale.x = 1.0;
VMOV.F32	S0, #1
MOVW	R0, #lo_addr(_MPU9150A+92)
MOVT	R0, #hi_addr(_MPU9150A+92)
VSTR	#1, S0, [R0, #0]
;MPU9150A_I2C.c,186 :: 		MPU9150A.mag_scale.y = 1.0;
VMOV.F32	S0, #1
MOVW	R0, #lo_addr(_MPU9150A+96)
MOVT	R0, #hi_addr(_MPU9150A+96)
VSTR	#1, S0, [R0, #0]
;MPU9150A_I2C.c,187 :: 		MPU9150A.mag_scale.z = 1.0;
VMOV.F32	S0, #1
MOVW	R0, #lo_addr(_MPU9150A+100)
MOVT	R0, #hi_addr(_MPU9150A+100)
VSTR	#1, S0, [R0, #0]
;MPU9150A_I2C.c,188 :: 		MPU9150A_Config();
BL	MPU9150A_I2C_MPU9150A_Config+0
;MPU9150A_I2C.c,189 :: 		return 1;
MOVS	R0, #1
;MPU9150A_I2C.c,190 :: 		}
L_end_MPU9150A_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MPU9150A_Init
MPU9150A_I2C_MPU9150A_ReadAccel:
;MPU9150A_I2C.c,192 :: 		static void MPU9150A_ReadAccel() {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;MPU9150A_I2C.c,195 :: 		valueH = MPU9150A_I2C_ReadReg(MPUREG_ACCEL_XOUT_H);
MOVS	R0, #59
BL	MPU9150A_I2C_MPU9150A_I2C_ReadReg+0
STRB	R0, [SP, #4]
;MPU9150A_I2C.c,196 :: 		valueL = MPU9150A_I2C_ReadReg(MPUREG_ACCEL_XOUT_L);
MOVS	R0, #60
BL	MPU9150A_I2C_MPU9150A_I2C_ReadReg+0
;MPU9150A_I2C.c,197 :: 		MPU9150A.accel.x = (int)((valueH << 8) | valueL );
LDRB	R1, [SP, #4]
LSLS	R1, R1, #8
UXTH	R1, R1
ORR	R0, R1, R0, LSL #0
SXTH	R1, R0
MOVW	R0, #lo_addr(_MPU9150A+0)
MOVT	R0, #hi_addr(_MPU9150A+0)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,199 :: 		valueH = MPU9150A_I2C_ReadReg(MPUREG_ACCEL_YOUT_H);
MOVS	R0, #61
BL	MPU9150A_I2C_MPU9150A_I2C_ReadReg+0
STRB	R0, [SP, #4]
;MPU9150A_I2C.c,200 :: 		valueL = MPU9150A_I2C_ReadReg(MPUREG_ACCEL_YOUT_L);
MOVS	R0, #62
BL	MPU9150A_I2C_MPU9150A_I2C_ReadReg+0
;MPU9150A_I2C.c,201 :: 		MPU9150A.accel.y = (int)((valueH << 8) | valueL );
LDRB	R1, [SP, #4]
LSLS	R1, R1, #8
UXTH	R1, R1
ORR	R0, R1, R0, LSL #0
SXTH	R1, R0
MOVW	R0, #lo_addr(_MPU9150A+2)
MOVT	R0, #hi_addr(_MPU9150A+2)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,203 :: 		valueH = MPU9150A_I2C_ReadReg(MPUREG_ACCEL_ZOUT_H);
MOVS	R0, #63
BL	MPU9150A_I2C_MPU9150A_I2C_ReadReg+0
STRB	R0, [SP, #4]
;MPU9150A_I2C.c,204 :: 		valueL = MPU9150A_I2C_ReadReg(MPUREG_ACCEL_ZOUT_L);
MOVS	R0, #64
BL	MPU9150A_I2C_MPU9150A_I2C_ReadReg+0
;MPU9150A_I2C.c,205 :: 		MPU9150A.accel.z = (int)((valueH << 8) | valueL );
LDRB	R1, [SP, #4]
LSLS	R1, R1, #8
UXTH	R1, R1
ORR	R0, R1, R0, LSL #0
SXTH	R1, R0
MOVW	R0, #lo_addr(_MPU9150A+4)
MOVT	R0, #hi_addr(_MPU9150A+4)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,206 :: 		}
L_end_MPU9150A_ReadAccel:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of MPU9150A_I2C_MPU9150A_ReadAccel
MPU9150A_I2C_MPU9150A_ReadGyro:
;MPU9150A_I2C.c,208 :: 		static void MPU9150A_ReadGyro() {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;MPU9150A_I2C.c,211 :: 		valueH = MPU9150A_I2C_ReadReg(MPUREG_GYRO_XOUT_H);
MOVS	R0, #67
BL	MPU9150A_I2C_MPU9150A_I2C_ReadReg+0
STRB	R0, [SP, #4]
;MPU9150A_I2C.c,212 :: 		valueL = MPU9150A_I2C_ReadReg(MPUREG_GYRO_XOUT_L);
MOVS	R0, #68
BL	MPU9150A_I2C_MPU9150A_I2C_ReadReg+0
;MPU9150A_I2C.c,213 :: 		MPU9150A.gyro.x = (int)((valueH << 8) | valueL );
LDRB	R1, [SP, #4]
LSLS	R1, R1, #8
UXTH	R1, R1
ORR	R0, R1, R0, LSL #0
SXTH	R1, R0
MOVW	R0, #lo_addr(_MPU9150A+6)
MOVT	R0, #hi_addr(_MPU9150A+6)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,215 :: 		valueH = MPU9150A_I2C_ReadReg(MPUREG_GYRO_YOUT_H);
MOVS	R0, #69
BL	MPU9150A_I2C_MPU9150A_I2C_ReadReg+0
STRB	R0, [SP, #4]
;MPU9150A_I2C.c,216 :: 		valueL = MPU9150A_I2C_ReadReg(MPUREG_GYRO_YOUT_L);
MOVS	R0, #70
BL	MPU9150A_I2C_MPU9150A_I2C_ReadReg+0
;MPU9150A_I2C.c,217 :: 		MPU9150A.gyro.y = (int)((valueH << 8) | valueL );
LDRB	R1, [SP, #4]
LSLS	R1, R1, #8
UXTH	R1, R1
ORR	R0, R1, R0, LSL #0
SXTH	R1, R0
MOVW	R0, #lo_addr(_MPU9150A+8)
MOVT	R0, #hi_addr(_MPU9150A+8)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,219 :: 		valueH = MPU9150A_I2C_ReadReg(MPUREG_GYRO_ZOUT_H);
MOVS	R0, #71
BL	MPU9150A_I2C_MPU9150A_I2C_ReadReg+0
STRB	R0, [SP, #4]
;MPU9150A_I2C.c,220 :: 		valueL = MPU9150A_I2C_ReadReg(MPUREG_GYRO_ZOUT_L);
MOVS	R0, #72
BL	MPU9150A_I2C_MPU9150A_I2C_ReadReg+0
;MPU9150A_I2C.c,221 :: 		MPU9150A.gyro.z = (int)((valueH << 8) | valueL );
LDRB	R1, [SP, #4]
LSLS	R1, R1, #8
UXTH	R1, R1
ORR	R0, R1, R0, LSL #0
SXTH	R1, R0
MOVW	R0, #lo_addr(_MPU9150A+10)
MOVT	R0, #hi_addr(_MPU9150A+10)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,223 :: 		MPU9150A.gdt = (float)tmrTicks/10000;
MOVW	R1, #lo_addr(_tmrTicks+0)
MOVT	R1, #hi_addr(_tmrTicks+0)
LDRH	R0, [R1, #0]
VMOV	S1, R0
VCVT.F32	#0, S1, S1
MOVW	R0, #16384
MOVT	R0, #17948
VMOV	S0, R0
VDIV.F32	S0, S1, S0
MOVW	R0, #lo_addr(_MPU9150A+116)
MOVT	R0, #hi_addr(_MPU9150A+116)
VSTR	#1, S0, [R0, #0]
;MPU9150A_I2C.c,224 :: 		tmrTicks = 0;
MOVS	R0, #0
STRH	R0, [R1, #0]
;MPU9150A_I2C.c,225 :: 		}
L_end_MPU9150A_ReadGyro:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of MPU9150A_I2C_MPU9150A_ReadGyro
MPU9150A_I2C_MPU9150A_ReadTemp:
;MPU9150A_I2C.c,231 :: 		static void MPU9150A_ReadTemp() {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;MPU9150A_I2C.c,235 :: 		valueH = MPU9150A_I2C_ReadReg(MPUREG_TEMP_OUT_H);
MOVS	R0, #65
BL	MPU9150A_I2C_MPU9150A_I2C_ReadReg+0
STRB	R0, [SP, #4]
;MPU9150A_I2C.c,236 :: 		valueL = MPU9150A_I2C_ReadReg(MPUREG_TEMP_OUT_L);
MOVS	R0, #66
BL	MPU9150A_I2C_MPU9150A_I2C_ReadReg+0
;MPU9150A_I2C.c,237 :: 		temp = (int)((valueH << 8) | valueL );
LDRB	R1, [SP, #4]
LSLS	R1, R1, #8
UXTH	R1, R1
ORR	R0, R1, R0, LSL #0
;MPU9150A_I2C.c,239 :: 		MPU9150A.temp = (float)(temp/340) + 36.5;
SXTH	R1, R0
MOVW	R0, #340
SXTH	R0, R0
SDIV	R0, R1, R0
SXTH	R0, R0
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #0
MOVT	R0, #16914
VMOV	S0, R0
VADD.F32	S0, S1, S0
MOVW	R0, #lo_addr(_MPU9150A+112)
MOVT	R0, #hi_addr(_MPU9150A+112)
VSTR	#1, S0, [R0, #0]
;MPU9150A_I2C.c,240 :: 		}
L_end_MPU9150A_ReadTemp:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of MPU9150A_I2C_MPU9150A_ReadTemp
MPU9150A_I2C_MPU9150A_ReadMagnetometer:
;MPU9150A_I2C.c,242 :: 		static void MPU9150A_ReadMagnetometer() {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;MPU9150A_I2C.c,245 :: 		dataReady = MAG_I2C_ReadReg(MAGREG_ST1);
MOVS	R0, #2
BL	MPU9150A_I2C_MAG_I2C_ReadReg+0
;MPU9150A_I2C.c,247 :: 		if (dataReady) {
CMP	R0, #0
IT	EQ
BEQ	L_MPU9150A_I2C_MPU9150A_ReadMagnetometer8
;MPU9150A_I2C.c,248 :: 		valueH = MAG_I2C_ReadReg(MAGREG_HXH);
MOVS	R0, #4
BL	MPU9150A_I2C_MAG_I2C_ReadReg+0
STRB	R0, [SP, #4]
;MPU9150A_I2C.c,249 :: 		valueL = MAG_I2C_ReadReg(MAGREG_HXL);
MOVS	R0, #3
BL	MPU9150A_I2C_MAG_I2C_ReadReg+0
;MPU9150A_I2C.c,250 :: 		MPU9150A.mag.x = (int)((valueH << 8) | valueL );
LDRB	R1, [SP, #4]
LSLS	R1, R1, #8
UXTH	R1, R1
ORR	R0, R1, R0, LSL #0
SXTH	R1, R0
MOVW	R0, #lo_addr(_MPU9150A+12)
MOVT	R0, #hi_addr(_MPU9150A+12)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,252 :: 		valueH = MAG_I2C_ReadReg(MAGREG_HYH);
MOVS	R0, #6
BL	MPU9150A_I2C_MAG_I2C_ReadReg+0
STRB	R0, [SP, #4]
;MPU9150A_I2C.c,253 :: 		valueL = MAG_I2C_ReadReg(MAGREG_HYL);
MOVS	R0, #5
BL	MPU9150A_I2C_MAG_I2C_ReadReg+0
;MPU9150A_I2C.c,254 :: 		MPU9150A.mag.y = (int)((valueH << 8) | valueL );
LDRB	R1, [SP, #4]
LSLS	R1, R1, #8
UXTH	R1, R1
ORR	R0, R1, R0, LSL #0
SXTH	R1, R0
MOVW	R0, #lo_addr(_MPU9150A+14)
MOVT	R0, #hi_addr(_MPU9150A+14)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,256 :: 		valueH = MAG_I2C_ReadReg(MAGREG_HZH);
MOVS	R0, #8
BL	MPU9150A_I2C_MAG_I2C_ReadReg+0
STRB	R0, [SP, #4]
;MPU9150A_I2C.c,257 :: 		valueL = MAG_I2C_ReadReg(MAGREG_HZL);
MOVS	R0, #7
BL	MPU9150A_I2C_MAG_I2C_ReadReg+0
;MPU9150A_I2C.c,258 :: 		MPU9150A.mag.z = (int)((valueH << 8) | valueL );
LDRB	R1, [SP, #4]
LSLS	R1, R1, #8
UXTH	R1, R1
ORR	R0, R1, R0, LSL #0
SXTH	R1, R0
MOVW	R0, #lo_addr(_MPU9150A+16)
MOVT	R0, #hi_addr(_MPU9150A+16)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,259 :: 		} else {
IT	AL
BAL	L_MPU9150A_I2C_MPU9150A_ReadMagnetometer9
L_MPU9150A_I2C_MPU9150A_ReadMagnetometer8:
;MPU9150A_I2C.c,260 :: 		MPU9150A.mag.x = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_MPU9150A+12)
MOVT	R0, #hi_addr(_MPU9150A+12)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,261 :: 		MPU9150A.mag.y = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_MPU9150A+14)
MOVT	R0, #hi_addr(_MPU9150A+14)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,262 :: 		MPU9150A.mag.z = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_MPU9150A+16)
MOVT	R0, #hi_addr(_MPU9150A+16)
STRH	R1, [R0, #0]
;MPU9150A_I2C.c,263 :: 		}
L_MPU9150A_I2C_MPU9150A_ReadMagnetometer9:
;MPU9150A_I2C.c,265 :: 		MAG_I2C_writeReg(MAGREG_CNTL, 0x01);
MOVS	R1, #1
MOVS	R0, #10
BL	MPU9150A_I2C_MAG_I2C_WriteReg+0
;MPU9150A_I2C.c,266 :: 		}
L_end_MPU9150A_ReadMagnetometer:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of MPU9150A_I2C_MPU9150A_ReadMagnetometer
_MPU9150A_Read:
;MPU9150A_I2C.c,268 :: 		void MPU9150A_Read() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MPU9150A_I2C.c,269 :: 		MPU9150A_ReadAccel();
BL	MPU9150A_I2C_MPU9150A_ReadAccel+0
;MPU9150A_I2C.c,270 :: 		MPU9150A_ReadGyro();
BL	MPU9150A_I2C_MPU9150A_ReadGyro+0
;MPU9150A_I2C.c,271 :: 		MPU9150A_ReadTemp();
BL	MPU9150A_I2C_MPU9150A_ReadTemp+0
;MPU9150A_I2C.c,272 :: 		MPU9150A_ReadMagnetometer();
BL	MPU9150A_I2C_MPU9150A_ReadMagnetometer+0
;MPU9150A_I2C.c,273 :: 		}
L_end_MPU9150A_Read:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MPU9150A_Read
