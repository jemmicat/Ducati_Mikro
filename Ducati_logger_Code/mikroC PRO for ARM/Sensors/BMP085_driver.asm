_bmp085ReadInt:
;BMP085_driver.c,41 :: 		int bmp085ReadInt(unsigned char address)
SUB	SP, SP, #8
;BMP085_driver.c,55 :: 		return (int) msb<<8 | lsb;
LDRB	R1, [SP, #0]
LSLS	R2, R1, #8
SXTH	R2, R2
LDRB	R1, [SP, #1]
ORR	R1, R2, R1, LSL #0
SXTH	R0, R1
;BMP085_driver.c,56 :: 		}
L_end_bmp085ReadInt:
ADD	SP, SP, #8
BX	LR
; end of _bmp085ReadInt
_bmp085Calibration:
;BMP085_driver.c,64 :: 		void bmp085Calibration()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;BMP085_driver.c,66 :: 		ac1 = bmp085ReadInt(0xAA);
MOVS	R0, #170
BL	_bmp085ReadInt+0
MOVW	R1, #lo_addr(_ac1+0)
MOVT	R1, #hi_addr(_ac1+0)
STRH	R0, [R1, #0]
;BMP085_driver.c,67 :: 		ac2 = bmp085ReadInt(0xAC);
MOVS	R0, #172
BL	_bmp085ReadInt+0
MOVW	R1, #lo_addr(_ac2+0)
MOVT	R1, #hi_addr(_ac2+0)
STRH	R0, [R1, #0]
;BMP085_driver.c,68 :: 		ac3 = bmp085ReadInt(0xAE);
MOVS	R0, #174
BL	_bmp085ReadInt+0
MOVW	R1, #lo_addr(_ac3+0)
MOVT	R1, #hi_addr(_ac3+0)
STRH	R0, [R1, #0]
;BMP085_driver.c,69 :: 		ac4 = bmp085ReadInt(0xB0);
MOVS	R0, #176
BL	_bmp085ReadInt+0
MOVW	R1, #lo_addr(_ac4+0)
MOVT	R1, #hi_addr(_ac4+0)
STRH	R0, [R1, #0]
;BMP085_driver.c,70 :: 		ac5 = bmp085ReadInt(0xB2);
MOVS	R0, #178
BL	_bmp085ReadInt+0
MOVW	R1, #lo_addr(_ac5+0)
MOVT	R1, #hi_addr(_ac5+0)
STRH	R0, [R1, #0]
;BMP085_driver.c,71 :: 		ac6 = bmp085ReadInt(0xB4);
MOVS	R0, #180
BL	_bmp085ReadInt+0
MOVW	R1, #lo_addr(_ac6+0)
MOVT	R1, #hi_addr(_ac6+0)
STRH	R0, [R1, #0]
;BMP085_driver.c,72 :: 		bb1 = bmp085ReadInt(0xB6);
MOVS	R0, #182
BL	_bmp085ReadInt+0
MOVW	R1, #lo_addr(_bb1+0)
MOVT	R1, #hi_addr(_bb1+0)
STRH	R0, [R1, #0]
;BMP085_driver.c,73 :: 		bb2 = bmp085ReadInt(0xB8);
MOVS	R0, #184
BL	_bmp085ReadInt+0
MOVW	R1, #lo_addr(_bb2+0)
MOVT	R1, #hi_addr(_bb2+0)
STRH	R0, [R1, #0]
;BMP085_driver.c,74 :: 		mmb = bmp085ReadInt(0xBA);
MOVS	R0, #186
BL	_bmp085ReadInt+0
MOVW	R1, #lo_addr(_mmb+0)
MOVT	R1, #hi_addr(_mmb+0)
STRH	R0, [R1, #0]
;BMP085_driver.c,75 :: 		mmc = bmp085ReadInt(0xBC);
MOVS	R0, #188
BL	_bmp085ReadInt+0
MOVW	R1, #lo_addr(_mmc+0)
MOVT	R1, #hi_addr(_mmc+0)
STRH	R0, [R1, #0]
;BMP085_driver.c,76 :: 		mmd = bmp085ReadInt(0xBE);
MOVS	R0, #190
BL	_bmp085ReadInt+0
MOVW	R1, #lo_addr(_mmd+0)
MOVT	R1, #hi_addr(_mmd+0)
STRH	R0, [R1, #0]
;BMP085_driver.c,77 :: 		}
L_end_bmp085Calibration:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _bmp085Calibration
_bmp085GetTemperature:
;BMP085_driver.c,81 :: 		short bmp085GetTemperature(unsigned int ut)
; ut start address is: 0 (R0)
; ut end address is: 0 (R0)
; ut start address is: 0 (R0)
;BMP085_driver.c,85 :: 		x1 = (((long)ut - (long)ac6)*(long)ac5) >> 15;
UXTH	R2, R0
; ut end address is: 0 (R0)
MOVW	R1, #lo_addr(_ac6+0)
MOVT	R1, #hi_addr(_ac6+0)
LDRH	R1, [R1, #0]
SUB	R2, R2, R1
MOVW	R1, #lo_addr(_ac5+0)
MOVT	R1, #hi_addr(_ac5+0)
LDRH	R1, [R1, #0]
MULS	R1, R2, R1
ASRS	R3, R1, #15
; x1 start address is: 0 (R0)
MOV	R0, R3
;BMP085_driver.c,86 :: 		x2 = ((long)mmc << 11)/(x1 + mmd);
MOVW	R1, #lo_addr(_mmc+0)
MOVT	R1, #hi_addr(_mmc+0)
LDRSH	R1, [R1, #0]
LSLS	R2, R1, #11
MOVW	R1, #lo_addr(_mmd+0)
MOVT	R1, #hi_addr(_mmd+0)
LDRSH	R1, [R1, #0]
ADDS	R1, R3, R1
SDIV	R1, R2, R1
;BMP085_driver.c,87 :: 		bb5 = x1 + x2;
ADDS	R2, R0, R1
; x1 end address is: 0 (R0)
MOVW	R1, #lo_addr(_bb5+0)
MOVT	R1, #hi_addr(_bb5+0)
STR	R2, [R1, #0]
;BMP085_driver.c,89 :: 		return ((bb5 + 8)>>4);
ADDW	R1, R2, #8
ASRS	R1, R1, #4
SXTB	R0, R1
;BMP085_driver.c,90 :: 		}
L_end_bmp085GetTemperature:
BX	LR
; end of _bmp085GetTemperature
_bmp085GetPressure:
;BMP085_driver.c,96 :: 		long bmp085GetPressure(unsigned long up)
; up start address is: 0 (R0)
; up end address is: 0 (R0)
; up start address is: 0 (R0)
;BMP085_driver.c,103 :: 		x1 = (b2 * (b6 * b6)>>12)>>11;
MOVW	R1, #4018
MOVT	R1, #487
ASRS	R1, R1, #12
ASRS	R1, R1, #11
; x1 start address is: 12 (R3)
MOV	R3, R1
;BMP085_driver.c,104 :: 		x2 = (ac2 * b6)>>11;
MOVW	R1, #lo_addr(_ac2+0)
MOVT	R1, #hi_addr(_ac2+0)
LDRSH	R2, [R1, #0]
MOVW	R1, #61541
MOVT	R1, #65535
MULS	R1, R2, R1
ASRS	R1, R1, #11
;BMP085_driver.c,105 :: 		x3 = x1 + x2;
ADDS	R2, R3, R1
; x1 end address is: 12 (R3)
;BMP085_driver.c,106 :: 		b3 = (((((long)ac1)*4 + x3)<<OSS) + 2)>>2;
MOVW	R1, #lo_addr(_ac1+0)
MOVT	R1, #hi_addr(_ac1+0)
LDRSH	R1, [R1, #0]
LSLS	R1, R1, #2
ADDS	R1, R1, R2
ADDS	R1, R1, #2
ASRS	R1, R1, #2
; b3 start address is: 16 (R4)
MOV	R4, R1
;BMP085_driver.c,109 :: 		x1 = (ac3 * b6)>>13;
MOVW	R1, #lo_addr(_ac3+0)
MOVT	R1, #hi_addr(_ac3+0)
LDRSH	R2, [R1, #0]
MOVW	R1, #61541
MOVT	R1, #65535
MULS	R1, R2, R1
ASRS	R2, R1, #13
;BMP085_driver.c,110 :: 		x2 = (b1 * ((b6 * b6)>>12))>>16;
MOVW	R1, #34777
MOVT	R1, #243
ASRS	R1, R1, #12
ASRS	R1, R1, #16
;BMP085_driver.c,111 :: 		x3 = ((x1 + x2) + 2)>>2;
ADDS	R1, R2, R1
ADDS	R1, R1, #2
ASRS	R1, R1, #2
;BMP085_driver.c,112 :: 		b4 = (ac4 * (unsigned long)(x3 + 32768))>>15;
ADD	R2, R1, #32768
MOVW	R1, #lo_addr(_ac4+0)
MOVT	R1, #hi_addr(_ac4+0)
LDRH	R1, [R1, #0]
MULS	R1, R2, R1
LSRS	R1, R1, #15
; b4 start address is: 12 (R3)
MOV	R3, R1
;BMP085_driver.c,114 :: 		b7 = ((unsigned long)(up - b3) * (50000>>OSS));
SUB	R2, R0, R4
; up end address is: 0 (R0)
; b3 end address is: 16 (R4)
MOVW	R1, #50000
MULS	R1, R2, R1
; b7 start address is: 0 (R0)
MOV	R0, R1
;BMP085_driver.c,115 :: 		if (b7 < 0x80000000)
CMP	R1, #-2147483648
IT	CS
BCS	L_bmp085GetPressure0
;BMP085_driver.c,116 :: 		p = (b7<<1)/b4;
LSLS	R0, R0, #1
; b7 end address is: 0 (R0)
UDIV	R0, R0, R3
; b4 end address is: 12 (R3)
; p start address is: 0 (R0)
; p end address is: 0 (R0)
IT	AL
BAL	L_bmp085GetPressure1
L_bmp085GetPressure0:
;BMP085_driver.c,118 :: 		p = (b7/b4)<<1;
; b7 start address is: 0 (R0)
; b4 start address is: 12 (R3)
UDIV	R0, R0, R3
; b4 end address is: 12 (R3)
; b7 end address is: 0 (R0)
LSLS	R0, R0, #1
; p start address is: 0 (R0)
; p end address is: 0 (R0)
L_bmp085GetPressure1:
;BMP085_driver.c,120 :: 		x1 = (p>>8) * (p>>8);
; p start address is: 0 (R0)
ASRS	R1, R0, #8
MUL	R2, R1, R1
;BMP085_driver.c,121 :: 		x1 = (x1 * 3038)>>16;
MOVW	R1, #3038
MULS	R1, R2, R1
ASRS	R1, R1, #16
; x1 start address is: 8 (R2)
MOV	R2, R1
;BMP085_driver.c,122 :: 		x2 = (-7357 * p)>>16;
MOVW	R1, #58179
MOVT	R1, #65535
MULS	R1, R0, R1
ASRS	R1, R1, #16
;BMP085_driver.c,123 :: 		p += (x1 + x2 + 3791)>>4;
ADDS	R1, R2, R1
; x1 end address is: 8 (R2)
ADDW	R1, R1, #3791
ASRS	R1, R1, #4
ADDS	R1, R0, R1
; p end address is: 0 (R0)
;BMP085_driver.c,125 :: 		return p;
MOV	R0, R1
;BMP085_driver.c,126 :: 		}
L_end_bmp085GetPressure:
BX	LR
; end of _bmp085GetPressure
_bmp085Read:
;BMP085_driver.c,129 :: 		char bmp085Read(unsigned char address)
;BMP085_driver.c,142 :: 		}
L_end_bmp085Read:
BX	LR
; end of _bmp085Read
_bmp085ReadUT:
;BMP085_driver.c,147 :: 		unsigned int bmp085ReadUT()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;BMP085_driver.c,162 :: 		ut = bmp085ReadInt(0xF6);
MOVS	R0, #246
BL	_bmp085ReadInt+0
;BMP085_driver.c,163 :: 		return ut;
UXTH	R0, R0
;BMP085_driver.c,164 :: 		}
L_end_bmp085ReadUT:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _bmp085ReadUT
_bmp085ReadUP:
;BMP085_driver.c,167 :: 		unsigned long bmp085ReadUP()
SUB	SP, SP, #4
;BMP085_driver.c,170 :: 		unsigned long up = 0;
;BMP085_driver.c,194 :: 		up = (((unsigned long) msb << 16) | ((unsigned long) lsb << 8) | (unsigned long) xlsb) >> (8-OSS);
LDRB	R0, [SP, #0]
LSLS	R1, R0, #16
LDRB	R0, [SP, #1]
LSLS	R0, R0, #8
ORRS	R1, R0
LDRB	R0, [SP, #2]
ORR	R0, R1, R0, LSL #0
LSRS	R0, R0, #8
;BMP085_driver.c,196 :: 		return up;
;BMP085_driver.c,197 :: 		}
L_end_bmp085ReadUP:
ADD	SP, SP, #4
BX	LR
; end of _bmp085ReadUP
