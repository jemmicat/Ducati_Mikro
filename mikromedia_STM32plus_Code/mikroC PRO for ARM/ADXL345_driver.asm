ADXL345_driver_ADXL345_Write:
;ADXL345_driver.c,30 :: 		static void ADXL345_Write(unsigned short address, unsigned short data1) {
; data1 start address is: 4 (R1)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R5, R0
UXTB	R6, R1
; data1 end address is: 4 (R1)
; address start address is: 20 (R5)
; data1 start address is: 24 (R6)
;ADXL345_driver.c,31 :: 		I2C1_Start();              // issue I2C start signal
BL	_I2C1_Start+0
;ADXL345_driver.c,32 :: 		data_[0] = address;
MOVW	R2, #lo_addr(_data_+0)
MOVT	R2, #hi_addr(_data_+0)
STRB	R5, [R2, #0]
; address end address is: 20 (R5)
;ADXL345_driver.c,33 :: 		data_[1] = data1;
MOVW	R2, #lo_addr(_data_+1)
MOVT	R2, #hi_addr(_data_+1)
STRB	R6, [R2, #0]
; data1 end address is: 24 (R6)
;ADXL345_driver.c,34 :: 		I2C1_Write(_ACCEL_ADDRESS, data_, 2, END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #2
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
MOVS	R0, #83
BL	_I2C1_Write+0
;ADXL345_driver.c,35 :: 		}
L_end_ADXL345_Write:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of ADXL345_driver_ADXL345_Write
_ADXL345_Read:
;ADXL345_driver.c,44 :: 		void ADXL345_Read(int *data_X, int *data_Y, int *data_Z){
; data_Y start address is: 4 (R1)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R11, R0
MOV	R12, R1
STR	R2, [SP, #4]
; data_Y end address is: 4 (R1)
; data_X start address is: 44 (R11)
; data_Y start address is: 48 (R12)
;ADXL345_driver.c,45 :: 		data_[0] = _DATAX0;
MOVS	R4, #50
MOVW	R3, #lo_addr(_data_+0)
MOVT	R3, #hi_addr(_data_+0)
STRB	R4, [R3, #0]
;ADXL345_driver.c,46 :: 		I2C1_Start();              // issue I2C start signal
BL	_I2C1_Start+0
;ADXL345_driver.c,47 :: 		I2C1_Write(_ACCEL_ADDRESS, data_, 1, END_MODE_RESTART);
MOVW	R3, #0
MOVS	R2, #1
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
MOVS	R0, #83
BL	_I2C1_Write+0
;ADXL345_driver.c,48 :: 		I2C1_Read(_ACCEL_ADDRESS, data_, 6, END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #6
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
MOVS	R0, #83
BL	_I2C1_Read+0
;ADXL345_driver.c,50 :: 		*data_X = data_[0] + (data_[1] << 8);
MOVW	R3, #lo_addr(_data_+1)
MOVT	R3, #hi_addr(_data_+1)
LDRB	R3, [R3, #0]
LSLS	R4, R3, #8
UXTH	R4, R4
MOVW	R3, #lo_addr(_data_+0)
MOVT	R3, #hi_addr(_data_+0)
LDRB	R3, [R3, #0]
ADDS	R3, R3, R4
STRH	R3, [R11, #0]
; data_X end address is: 44 (R11)
;ADXL345_driver.c,51 :: 		*data_Y = data_[2] + (data_[3] << 8);
MOVW	R3, #lo_addr(_data_+3)
MOVT	R3, #hi_addr(_data_+3)
LDRB	R3, [R3, #0]
LSLS	R4, R3, #8
UXTH	R4, R4
MOVW	R3, #lo_addr(_data_+2)
MOVT	R3, #hi_addr(_data_+2)
LDRB	R3, [R3, #0]
ADDS	R3, R3, R4
STRH	R3, [R12, #0]
; data_Y end address is: 48 (R12)
;ADXL345_driver.c,52 :: 		*data_Z = data_[4] + (data_[5] << 8);
MOVW	R3, #lo_addr(_data_+5)
MOVT	R3, #hi_addr(_data_+5)
LDRB	R3, [R3, #0]
LSLS	R4, R3, #8
UXTH	R4, R4
MOVW	R3, #lo_addr(_data_+4)
MOVT	R3, #hi_addr(_data_+4)
LDRB	R3, [R3, #0]
ADDS	R4, R3, R4
LDR	R3, [SP, #4]
STRH	R4, [R3, #0]
;ADXL345_driver.c,53 :: 		}
L_end_ADXL345_Read:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _ADXL345_Read
ADXL345_driver_ADXL345_Read_Register:
;ADXL345_driver.c,62 :: 		static unsigned short ADXL345_Read_Register(unsigned short address) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R5, R0
; address start address is: 20 (R5)
;ADXL345_driver.c,63 :: 		I2C1_Start();              // issue I2C start signal
BL	_I2C1_Start+0
;ADXL345_driver.c,64 :: 		data_[0] = address;
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
STRB	R5, [R1, #0]
; address end address is: 20 (R5)
;ADXL345_driver.c,65 :: 		I2C1_Write(_ACCEL_ADDRESS, data_, 1, END_MODE_RESTART);
MOVW	R3, #0
MOVS	R2, #1
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
MOVS	R0, #83
BL	_I2C1_Write+0
;ADXL345_driver.c,66 :: 		I2C1_Read(_ACCEL_ADDRESS, data_, 1, END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #1
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
MOVS	R0, #83
BL	_I2C1_Read+0
;ADXL345_driver.c,67 :: 		return data_[0];
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
LDRB	R0, [R1, #0]
;ADXL345_driver.c,68 :: 		}
L_end_ADXL345_Read_Register:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of ADXL345_driver_ADXL345_Read_Register
_ADXL345_Init:
;ADXL345_driver.c,77 :: 		char ADXL345_Init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ADXL345_driver.c,78 :: 		char id = 0x00;
;ADXL345_driver.c,80 :: 		ADXL345_Write(0x2D, 0x00);
MOVS	R1, #0
MOVS	R0, #45
BL	ADXL345_driver_ADXL345_Write+0
;ADXL345_driver.c,81 :: 		id = ADXL345_Read_Register(0x00);
MOVS	R0, #0
BL	ADXL345_driver_ADXL345_Read_Register+0
;ADXL345_driver.c,82 :: 		if (id != 0xE5) {
CMP	R0, #229
IT	EQ
BEQ	L_ADXL345_Init0
;ADXL345_driver.c,83 :: 		return _ACCEL_ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_ADXL345_Init
;ADXL345_driver.c,84 :: 		}
L_ADXL345_Init0:
;ADXL345_driver.c,86 :: 		ADXL345_Write(_DATA_FORMAT, 0x08);       // Full resolution, +/-2g, 4mg/LSB, right justified
MOVS	R1, #8
MOVS	R0, #49
BL	ADXL345_driver_ADXL345_Write+0
;ADXL345_driver.c,87 :: 		ADXL345_Write(_BW_RATE, 0x0A);           // Set 100 Hz data rate
MOVS	R1, #10
MOVS	R0, #44
BL	ADXL345_driver_ADXL345_Write+0
;ADXL345_driver.c,88 :: 		ADXL345_Write(_FIFO_CTL, 0x80);          // stream mode
MOVS	R1, #128
MOVS	R0, #56
BL	ADXL345_driver_ADXL345_Write+0
;ADXL345_driver.c,89 :: 		ADXL345_Write(_POWER_CTL, 0x08);         // POWER_CTL reg: measurement mode
MOVS	R1, #8
MOVS	R0, #45
BL	ADXL345_driver_ADXL345_Write+0
;ADXL345_driver.c,90 :: 		return 0x00;
MOVS	R0, #0
;ADXL345_driver.c,92 :: 		}
L_end_ADXL345_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ADXL345_Init
