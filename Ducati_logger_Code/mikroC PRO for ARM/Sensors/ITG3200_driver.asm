ITG3200_driver_ITG3200_Write:
;ITG3200_driver.c,24 :: 		static void ITG3200_Write(unsigned short address, unsigned short data1) {
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
;ITG3200_driver.c,25 :: 		I2C1_Start();              // issue I2C start signal
BL	_I2C1_Start+0
;ITG3200_driver.c,26 :: 		gyrodata_[0] = address;
MOVW	R2, #lo_addr(_gyrodata_+0)
MOVT	R2, #hi_addr(_gyrodata_+0)
STRB	R5, [R2, #0]
; address end address is: 20 (R5)
;ITG3200_driver.c,27 :: 		gyrodata_[1] = data1;
MOVW	R2, #lo_addr(_gyrodata_+1)
MOVT	R2, #hi_addr(_gyrodata_+1)
STRB	R6, [R2, #0]
; data1 end address is: 24 (R6)
;ITG3200_driver.c,28 :: 		I2C1_Write(_GYRO_ADDRESS, gyrodata_, 2, END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #2
MOVW	R1, #lo_addr(_gyrodata_+0)
MOVT	R1, #hi_addr(_gyrodata_+0)
MOVS	R0, #105
BL	_I2C1_Write+0
;ITG3200_driver.c,29 :: 		}
L_end_ITG3200_Write:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of ITG3200_driver_ITG3200_Write
_ITG3200_Read:
;ITG3200_driver.c,38 :: 		void ITG3200_Read(int *data_X, int *data_Y, int *data_Z){
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
;ITG3200_driver.c,39 :: 		gyrodata_[0] = _GYRODATAX0;
MOVS	R4, #29
MOVW	R3, #lo_addr(_gyrodata_+0)
MOVT	R3, #hi_addr(_gyrodata_+0)
STRB	R4, [R3, #0]
;ITG3200_driver.c,40 :: 		I2C1_Start();              // issue I2C start signal
BL	_I2C1_Start+0
;ITG3200_driver.c,41 :: 		I2C1_Write(_GYRO_ADDRESS, gyrodata_, 1, END_MODE_RESTART);
MOVW	R3, #0
MOVS	R2, #1
MOVW	R1, #lo_addr(_gyrodata_+0)
MOVT	R1, #hi_addr(_gyrodata_+0)
MOVS	R0, #105
BL	_I2C1_Write+0
;ITG3200_driver.c,42 :: 		I2C1_Read(_GYRO_ADDRESS, gyrodata_, 6, END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #6
MOVW	R1, #lo_addr(_gyrodata_+0)
MOVT	R1, #hi_addr(_gyrodata_+0)
MOVS	R0, #105
BL	_I2C1_Read+0
;ITG3200_driver.c,44 :: 		*data_X = gyrodata_[0] + (gyrodata_[1] << 8);
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
;ITG3200_driver.c,45 :: 		*data_Y = gyrodata_[2] + (gyrodata_[3] << 8);
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
;ITG3200_driver.c,46 :: 		*data_Z = gyrodata_[4] + (gyrodata_[5] << 8);
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
;ITG3200_driver.c,47 :: 		}
L_end_ITG3200_Read:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _ITG3200_Read
ITG3200_driver_ITG3200_Read_Register:
;ITG3200_driver.c,56 :: 		static unsigned short ITG3200_Read_Register(unsigned short address) {
; address start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R5, R0
; address end address is: 0 (R0)
; address start address is: 20 (R5)
;ITG3200_driver.c,57 :: 		I2C1_Start();              // issue I2C start signal
BL	_I2C1_Start+0
;ITG3200_driver.c,58 :: 		gyrodata_[0] = address;
MOVW	R1, #lo_addr(_gyrodata_+0)
MOVT	R1, #hi_addr(_gyrodata_+0)
STRB	R5, [R1, #0]
; address end address is: 20 (R5)
;ITG3200_driver.c,59 :: 		I2C1_Write(_GYRO_ADDRESS, gyrodata_, 1, END_MODE_RESTART);
MOVW	R3, #0
MOVS	R2, #1
MOVW	R1, #lo_addr(_gyrodata_+0)
MOVT	R1, #hi_addr(_gyrodata_+0)
MOVS	R0, #105
BL	_I2C1_Write+0
;ITG3200_driver.c,60 :: 		I2C1_Read(_GYRO_ADDRESS, gyrodata_, 1, END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #1
MOVW	R1, #lo_addr(_gyrodata_+0)
MOVT	R1, #hi_addr(_gyrodata_+0)
MOVS	R0, #105
BL	_I2C1_Read+0
;ITG3200_driver.c,61 :: 		return gyrodata_[0];
MOVW	R1, #lo_addr(_gyrodata_+0)
MOVT	R1, #hi_addr(_gyrodata_+0)
LDRB	R0, [R1, #0]
;ITG3200_driver.c,62 :: 		}
L_end_ITG3200_Read_Register:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of ITG3200_driver_ITG3200_Read_Register
_ITG3200_Init:
;ITG3200_driver.c,71 :: 		char ITG3200_Init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ITG3200_driver.c,72 :: 		char id = 0x00;
;ITG3200_driver.c,74 :: 		ITG3200_Write(0x2D, 0x00);
MOVS	R1, #0
MOVS	R0, #45
BL	ITG3200_driver_ITG3200_Write+0
;ITG3200_driver.c,75 :: 		id = ITG3200_Read_Register(0x00);
MOVS	R0, #0
BL	ITG3200_driver_ITG3200_Read_Register+0
;ITG3200_driver.c,76 :: 		if (id != 0xE5) {
CMP	R0, #229
IT	EQ
BEQ	L_ITG3200_Init0
;ITG3200_driver.c,77 :: 		return _GYRO_ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_ITG3200_Init
;ITG3200_driver.c,78 :: 		}
L_ITG3200_Init0:
;ITG3200_driver.c,83 :: 		ITG3200_Write(SMPLRT_DIV, 0x09);
MOVS	R1, #9
MOVS	R0, #21
BL	ITG3200_driver_ITG3200_Write+0
;ITG3200_driver.c,87 :: 		return 0x00;
MOVS	R0, #0
;ITG3200_driver.c,89 :: 		}
L_end_ITG3200_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ITG3200_Init
