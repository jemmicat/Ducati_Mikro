ITG3200_driver_ITG3200_Write:
;ITG3200_driver.c,33 :: 		static void ITG3200_Write(unsigned short address, unsigned short data1) {
; data1 start address is: 4 (R1)
; address start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R5, R0
UXTB	R6, R1
; data1 end address is: 4 (R1)
; address end address is: 0 (R0)
; address start address is: 20 (R5)
; data1 start address is: 24 (R6)
;ITG3200_driver.c,34 :: 		I2C2_Start();              // issue I2C start signal
BL	_I2C2_Start+0
;ITG3200_driver.c,35 :: 		gyrodata_[0] = address;
MOVW	R2, #lo_addr(_gyrodata_+0)
MOVT	R2, #hi_addr(_gyrodata_+0)
STRB	R5, [R2, #0]
; address end address is: 20 (R5)
;ITG3200_driver.c,36 :: 		gyrodata_[1] = data1;
MOVW	R2, #lo_addr(_gyrodata_+1)
MOVT	R2, #hi_addr(_gyrodata_+1)
STRB	R6, [R2, #0]
; data1 end address is: 24 (R6)
;ITG3200_driver.c,37 :: 		I2C2_Write(_GYRO_ADDRESS, gyrodata_, 2, END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #2
MOVW	R1, #lo_addr(_gyrodata_+0)
MOVT	R1, #hi_addr(_gyrodata_+0)
MOVS	R0, #104
BL	_I2C2_Write+0
;ITG3200_driver.c,38 :: 		}
L_end_ITG3200_Write:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of ITG3200_driver_ITG3200_Write
_ITG3200_Read:
;ITG3200_driver.c,47 :: 		void ITG3200_Read(int *data_X, int *data_Y, int *data_Z){
; data_Y start address is: 4 (R1)
; data_X start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R11, R0
MOV	R12, R1
STR	R2, [SP, #4]
; data_Y end address is: 4 (R1)
; data_X end address is: 0 (R0)
; data_X start address is: 44 (R11)
; data_Y start address is: 48 (R12)
;ITG3200_driver.c,48 :: 		gyrodata_[0] = GYRO_XOUT_H;
MOVW	R3, #lo_addr(_GYRO_XOUT_H+0)
MOVT	R3, #hi_addr(_GYRO_XOUT_H+0)
LDRB	R4, [R3, #0]
MOVW	R3, #lo_addr(_gyrodata_+0)
MOVT	R3, #hi_addr(_gyrodata_+0)
STRB	R4, [R3, #0]
;ITG3200_driver.c,49 :: 		I2C2_Start();              // issue I2C start signal
BL	_I2C2_Start+0
;ITG3200_driver.c,50 :: 		I2C2_Write(_GYRO_ADDRESS, gyrodata_, 1, END_MODE_RESTART);
MOVW	R3, #0
MOVS	R2, #1
MOVW	R1, #lo_addr(_gyrodata_+0)
MOVT	R1, #hi_addr(_gyrodata_+0)
MOVS	R0, #104
BL	_I2C2_Write+0
;ITG3200_driver.c,51 :: 		I2C2_Read(_GYRO_ADDRESS, gyrodata_, 6, END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #6
MOVW	R1, #lo_addr(_gyrodata_+0)
MOVT	R1, #hi_addr(_gyrodata_+0)
MOVS	R0, #104
BL	_I2C2_Read+0
;ITG3200_driver.c,53 :: 		*data_X = gyrodata_[0] + (gyrodata_[1] << 8);
MOVW	R3, #lo_addr(_gyrodata_+1)
MOVT	R3, #hi_addr(_gyrodata_+1)
LDRB	R3, [R3, #0]
LSLS	R4, R3, #8
UXTH	R4, R4
MOVW	R3, #lo_addr(_gyrodata_+0)
MOVT	R3, #hi_addr(_gyrodata_+0)
LDRB	R3, [R3, #0]
ADDS	R3, R3, R4
STRH	R3, [R11, #0]
; data_X end address is: 44 (R11)
;ITG3200_driver.c,54 :: 		*data_Y = gyrodata_[2] + (gyrodata_[3] << 8);
MOVW	R3, #lo_addr(_gyrodata_+3)
MOVT	R3, #hi_addr(_gyrodata_+3)
LDRB	R3, [R3, #0]
LSLS	R4, R3, #8
UXTH	R4, R4
MOVW	R3, #lo_addr(_gyrodata_+2)
MOVT	R3, #hi_addr(_gyrodata_+2)
LDRB	R3, [R3, #0]
ADDS	R3, R3, R4
STRH	R3, [R12, #0]
; data_Y end address is: 48 (R12)
;ITG3200_driver.c,55 :: 		*data_Z = gyrodata_[4] + (gyrodata_[5] << 8);
MOVW	R3, #lo_addr(_gyrodata_+5)
MOVT	R3, #hi_addr(_gyrodata_+5)
LDRB	R3, [R3, #0]
LSLS	R4, R3, #8
UXTH	R4, R4
MOVW	R3, #lo_addr(_gyrodata_+4)
MOVT	R3, #hi_addr(_gyrodata_+4)
LDRB	R3, [R3, #0]
ADDS	R4, R3, R4
LDR	R3, [SP, #4]
STRH	R4, [R3, #0]
;ITG3200_driver.c,56 :: 		}
L_end_ITG3200_Read:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _ITG3200_Read
ITG3200_driver_ITG3200_Read_Register:
;ITG3200_driver.c,65 :: 		static unsigned short ITG3200_Read_Register(unsigned short address) {
; address start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R5, R0
; address end address is: 0 (R0)
; address start address is: 20 (R5)
;ITG3200_driver.c,66 :: 		I2C2_Start();              // issue I2C start signal
BL	_I2C2_Start+0
;ITG3200_driver.c,67 :: 		gyrodata_[0] = address;
MOVW	R1, #lo_addr(_gyrodata_+0)
MOVT	R1, #hi_addr(_gyrodata_+0)
STRB	R5, [R1, #0]
; address end address is: 20 (R5)
;ITG3200_driver.c,68 :: 		I2C2_Write(_GYRO_ADDRESS, gyrodata_, 1, END_MODE_RESTART);
MOVW	R3, #0
MOVS	R2, #1
MOVW	R1, #lo_addr(_gyrodata_+0)
MOVT	R1, #hi_addr(_gyrodata_+0)
MOVS	R0, #104
BL	_I2C2_Write+0
;ITG3200_driver.c,69 :: 		I2C2_Read(_GYRO_ADDRESS, gyrodata_, 1, END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #1
MOVW	R1, #lo_addr(_gyrodata_+0)
MOVT	R1, #hi_addr(_gyrodata_+0)
MOVS	R0, #104
BL	_I2C2_Read+0
;ITG3200_driver.c,70 :: 		return gyrodata_[0];
MOVW	R1, #lo_addr(_gyrodata_+0)
MOVT	R1, #hi_addr(_gyrodata_+0)
LDRB	R0, [R1, #0]
;ITG3200_driver.c,71 :: 		}
L_end_ITG3200_Read_Register:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of ITG3200_driver_ITG3200_Read_Register
_ITG3200_Init:
;ITG3200_driver.c,80 :: 		char ITG3200_Init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ITG3200_driver.c,81 :: 		char id = 0x00;
;ITG3200_driver.c,83 :: 		id = ITG3200_Read_Register(0x00);
MOVS	R0, #0
BL	ITG3200_driver_ITG3200_Read_Register+0
;ITG3200_driver.c,84 :: 		if (id != 0x68) {
CMP	R0, #104
IT	EQ
BEQ	L_ITG3200_Init0
;ITG3200_driver.c,85 :: 		return _GYRO_ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_ITG3200_Init
;ITG3200_driver.c,86 :: 		}
L_ITG3200_Init0:
;ITG3200_driver.c,89 :: 		ITG3200_Write(DLPF_FS, (DLPF_FS_SEL_0|DLPF_FS_SEL_1|DLPF_CFG_0));
MOVW	R0, #lo_addr(_DLPF_FS_SEL_1+0)
MOVT	R0, #hi_addr(_DLPF_FS_SEL_1+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_DLPF_FS_SEL_0+0)
MOVT	R0, #hi_addr(_DLPF_FS_SEL_0+0)
LDRB	R0, [R0, #0]
ORR	R1, R0, R1, LSL #0
UXTB	R1, R1
MOVW	R0, #lo_addr(_DLPF_CFG_0+0)
MOVT	R0, #hi_addr(_DLPF_CFG_0+0)
LDRB	R0, [R0, #0]
ORRS	R1, R0
MOVW	R0, #lo_addr(_DLPF_FS+0)
MOVT	R0, #hi_addr(_DLPF_FS+0)
LDRB	R0, [R0, #0]
BL	ITG3200_driver_ITG3200_Write+0
;ITG3200_driver.c,91 :: 		ITG3200_Write(SMPLRT_DIV, 9);;
MOVW	R0, #lo_addr(_SMPLRT_DIV+0)
MOVT	R0, #hi_addr(_SMPLRT_DIV+0)
LDRB	R0, [R0, #0]
MOVS	R1, #9
BL	ITG3200_driver_ITG3200_Write+0
;ITG3200_driver.c,92 :: 		return 0x00;
MOVS	R0, #0
;ITG3200_driver.c,94 :: 		}
L_end_ITG3200_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ITG3200_Init
