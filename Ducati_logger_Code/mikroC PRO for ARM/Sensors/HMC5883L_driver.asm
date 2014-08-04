HMC5883L_driver_HMC5883L_Write:
;HMC5883L_driver.c,27 :: 		static void HMC5883L_Write(unsigned short address, unsigned short data1) {
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
;HMC5883L_driver.c,28 :: 		I2C1_Start();              // issue I2C start signal
BL	_I2C1_Start+0
;HMC5883L_driver.c,29 :: 		Magnetdata_[0] = address;
MOVW	R2, #lo_addr(_Magnetdata_+0)
MOVT	R2, #hi_addr(_Magnetdata_+0)
STRB	R5, [R2, #0]
; address end address is: 20 (R5)
;HMC5883L_driver.c,30 :: 		Magnetdata_[1] = data1;
MOVW	R2, #lo_addr(_Magnetdata_+1)
MOVT	R2, #hi_addr(_Magnetdata_+1)
STRB	R6, [R2, #0]
; data1 end address is: 24 (R6)
;HMC5883L_driver.c,31 :: 		I2C1_Write(_HMC5883L_ADDRESS, Magnetdata_, 2, END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #2
MOVW	R1, #lo_addr(_Magnetdata_+0)
MOVT	R1, #hi_addr(_Magnetdata_+0)
MOVS	R0, #83
BL	_I2C1_Write+0
;HMC5883L_driver.c,32 :: 		}
L_end_HMC5883L_Write:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of HMC5883L_driver_HMC5883L_Write
_HMC5883L_Read:
;HMC5883L_driver.c,41 :: 		void HMC5883L_Read(int *data_X, int *data_Y, int *data_Z){
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
;HMC5883L_driver.c,42 :: 		Magnetdata_[0] = _MAGNETDATAX0;
MOVS	R4, #3
MOVW	R3, #lo_addr(_Magnetdata_+0)
MOVT	R3, #hi_addr(_Magnetdata_+0)
STRB	R4, [R3, #0]
;HMC5883L_driver.c,43 :: 		I2C1_Start();              // issue I2C start signal
BL	_I2C1_Start+0
;HMC5883L_driver.c,44 :: 		I2C1_Write(_HMC5883L_ADDRESS, Magnetdata_, 1, END_MODE_RESTART);
MOVW	R3, #0
MOVS	R2, #1
MOVW	R1, #lo_addr(_Magnetdata_+0)
MOVT	R1, #hi_addr(_Magnetdata_+0)
MOVS	R0, #83
BL	_I2C1_Write+0
;HMC5883L_driver.c,45 :: 		I2C1_Read(_HMC5883L_ADDRESS, Magnetdata_, 6, END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #6
MOVW	R1, #lo_addr(_Magnetdata_+0)
MOVT	R1, #hi_addr(_Magnetdata_+0)
MOVS	R0, #83
BL	_I2C1_Read+0
;HMC5883L_driver.c,47 :: 		*data_X = Magnetdata_[0] + (Magnetdata_[1] << 8);
MOVW	R3, #lo_addr(_Magnetdata_+1)
MOVT	R3, #hi_addr(_Magnetdata_+1)
LDRB	R3, [R3, #0]
LSLS	R4, R3, #8
UXTH	R4, R4
MOVW	R3, #lo_addr(_Magnetdata_+0)
MOVT	R3, #hi_addr(_Magnetdata_+0)
LDRB	R3, [R3, #0]
ADDS	R3, R3, R4
STRH	R3, [R11, #0]
; data_X end address is: 44 (R11)
;HMC5883L_driver.c,48 :: 		*data_Y = Magnetdata_[2] + (Magnetdata_[3] << 8);
MOVW	R3, #lo_addr(_Magnetdata_+3)
MOVT	R3, #hi_addr(_Magnetdata_+3)
LDRB	R3, [R3, #0]
LSLS	R4, R3, #8
UXTH	R4, R4
MOVW	R3, #lo_addr(_Magnetdata_+2)
MOVT	R3, #hi_addr(_Magnetdata_+2)
LDRB	R3, [R3, #0]
ADDS	R3, R3, R4
STRH	R3, [R12, #0]
; data_Y end address is: 48 (R12)
;HMC5883L_driver.c,49 :: 		*data_Z = Magnetdata_[4] + (Magnetdata_[5] << 8);
MOVW	R3, #lo_addr(_Magnetdata_+5)
MOVT	R3, #hi_addr(_Magnetdata_+5)
LDRB	R3, [R3, #0]
LSLS	R4, R3, #8
UXTH	R4, R4
MOVW	R3, #lo_addr(_Magnetdata_+4)
MOVT	R3, #hi_addr(_Magnetdata_+4)
LDRB	R3, [R3, #0]
ADDS	R4, R3, R4
LDR	R3, [SP, #4]
STRH	R4, [R3, #0]
;HMC5883L_driver.c,50 :: 		}
L_end_HMC5883L_Read:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _HMC5883L_Read
HMC5883L_driver_HMC5883L_Read_Register:
;HMC5883L_driver.c,59 :: 		static unsigned short HMC5883L_Read_Register(unsigned short address) {
; address start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R5, R0
; address end address is: 0 (R0)
; address start address is: 20 (R5)
;HMC5883L_driver.c,60 :: 		I2C1_Start();              // issue I2C start signal
BL	_I2C1_Start+0
;HMC5883L_driver.c,61 :: 		Magnetdata_[0] = address;
MOVW	R1, #lo_addr(_Magnetdata_+0)
MOVT	R1, #hi_addr(_Magnetdata_+0)
STRB	R5, [R1, #0]
; address end address is: 20 (R5)
;HMC5883L_driver.c,62 :: 		I2C1_Write(_HMC5883L_ADDRESS, Magnetdata_, 1, END_MODE_RESTART);
MOVW	R3, #0
MOVS	R2, #1
MOVW	R1, #lo_addr(_Magnetdata_+0)
MOVT	R1, #hi_addr(_Magnetdata_+0)
MOVS	R0, #83
BL	_I2C1_Write+0
;HMC5883L_driver.c,63 :: 		I2C1_Read(_HMC5883L_ADDRESS, Magnetdata_, 1, END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #1
MOVW	R1, #lo_addr(_Magnetdata_+0)
MOVT	R1, #hi_addr(_Magnetdata_+0)
MOVS	R0, #83
BL	_I2C1_Read+0
;HMC5883L_driver.c,64 :: 		return Magnetdata_[0];
MOVW	R1, #lo_addr(_Magnetdata_+0)
MOVT	R1, #hi_addr(_Magnetdata_+0)
LDRB	R0, [R1, #0]
;HMC5883L_driver.c,65 :: 		}
L_end_HMC5883L_Read_Register:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of HMC5883L_driver_HMC5883L_Read_Register
_HMC5883L_Init:
;HMC5883L_driver.c,74 :: 		char HMC5883L_Init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;HMC5883L_driver.c,75 :: 		char id = 0x00;
;HMC5883L_driver.c,77 :: 		HMC5883L_Write(0x2D, 0x00);
MOVS	R1, #0
MOVS	R0, #45
BL	HMC5883L_driver_HMC5883L_Write+0
;HMC5883L_driver.c,78 :: 		id = HMC5883L_Read_Register(0x00);
MOVS	R0, #0
BL	HMC5883L_driver_HMC5883L_Read_Register+0
;HMC5883L_driver.c,79 :: 		if (id != 0xE5) {
CMP	R0, #229
IT	EQ
BEQ	L_HMC5883L_Init0
;HMC5883L_driver.c,81 :: 		}
IT	AL
BAL	L_HMC5883L_Init1
L_HMC5883L_Init0:
;HMC5883L_driver.c,87 :: 		return 0x00;
MOVS	R0, #0
IT	AL
BAL	L_end_HMC5883L_Init
;HMC5883L_driver.c,88 :: 		}
L_HMC5883L_Init1:
;HMC5883L_driver.c,89 :: 		}
L_end_HMC5883L_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _HMC5883L_Init
