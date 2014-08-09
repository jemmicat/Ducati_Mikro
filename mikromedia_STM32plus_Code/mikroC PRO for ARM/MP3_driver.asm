_MP3_SCI_Write:
;MP3_driver.c,51 :: 		void MP3_SCI_Write(char address, unsigned int data_in) {
; address start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
UXTB	R4, R0
STRH	R1, [SP, #4]
; address end address is: 0 (R0)
; address start address is: 16 (R4)
;MP3_driver.c,52 :: 		BSYNC = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(BSYNC+0)
MOVT	R2, #hi_addr(BSYNC+0)
STR	R3, [R2, #0]
;MP3_driver.c,54 :: 		MP3_CS = 0;                    // select MP3 SCI
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(MP3_CS+0)
MOVT	R2, #hi_addr(MP3_CS+0)
STR	R3, [R2, #0]
;MP3_driver.c,55 :: 		SPI2_Write(WRITE_CODE);
MOVS	R0, #2
BL	_SPI2_Write+0
;MP3_driver.c,56 :: 		SPI2_Write(address);
UXTB	R0, R4
; address end address is: 16 (R4)
BL	_SPI2_Write+0
;MP3_driver.c,57 :: 		SPI2_Write(Hi(data_in));       // high byte
ADD	R2, SP, #4
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
UXTH	R0, R2
BL	_SPI2_Write+0
;MP3_driver.c,58 :: 		SPI2_Write(Lo(data_in));       // low byte
ADD	R2, SP, #4
LDRB	R2, [R2, #0]
UXTH	R0, R2
BL	_SPI2_Write+0
;MP3_driver.c,59 :: 		MP3_CS = 1;                    // deselect MP3 SCI
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(MP3_CS+0)
MOVT	R2, #hi_addr(MP3_CS+0)
STR	R3, [R2, #0]
;MP3_driver.c,60 :: 		while (DREQ == 0);             // wait until DREQ becomes 1, see MP3 codec datasheet, Serial Protocol for SCI
L_MP3_SCI_Write0:
MOVW	R3, #lo_addr(DREQ+0)
MOVT	R3, #hi_addr(DREQ+0)
LDR	R2, [R3, #0]
CMP	R2, #0
IT	NE
BNE	L_MP3_SCI_Write1
IT	AL
BAL	L_MP3_SCI_Write0
L_MP3_SCI_Write1:
;MP3_driver.c,61 :: 		}
L_end_MP3_SCI_Write:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _MP3_SCI_Write
_MP3_SCI_Read:
;MP3_driver.c,70 :: 		void MP3_SCI_Read(char start_address, char words_count, unsigned int *data_buffer) {
; data_buffer start address is: 8 (R2)
; words_count start address is: 4 (R1)
; start_address start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R5, R0
UXTB	R6, R1
MOV	R7, R2
; data_buffer end address is: 8 (R2)
; words_count end address is: 4 (R1)
; start_address end address is: 0 (R0)
; start_address start address is: 20 (R5)
; words_count start address is: 24 (R6)
; data_buffer start address is: 28 (R7)
;MP3_driver.c,73 :: 		MP3_CS = 0;                    // select MP3 SCI
MOVS	R4, #0
SXTB	R4, R4
MOVW	R3, #lo_addr(MP3_CS+0)
MOVT	R3, #hi_addr(MP3_CS+0)
STR	R4, [R3, #0]
;MP3_driver.c,74 :: 		SPI2_Write(READ_CODE);
MOVS	R0, #3
BL	_SPI2_Write+0
;MP3_driver.c,75 :: 		SPI2_Write(start_address);
UXTB	R0, R5
; start_address end address is: 20 (R5)
BL	_SPI2_Write+0
; words_count end address is: 24 (R6)
; data_buffer end address is: 28 (R7)
UXTB	R0, R6
MOV	R6, R7
;MP3_driver.c,77 :: 		while (words_count--) {        // read words_count words byte per byte
L_MP3_SCI_Read2:
; data_buffer start address is: 24 (R6)
; words_count start address is: 20 (R5)
; words_count start address is: 0 (R0)
UXTB	R4, R0
SUBS	R3, R0, #1
; words_count end address is: 0 (R0)
; words_count start address is: 20 (R5)
UXTB	R5, R3
; words_count end address is: 20 (R5)
CMP	R4, #0
IT	EQ
BEQ	L_MP3_SCI_Read3
; words_count end address is: 20 (R5)
;MP3_driver.c,78 :: 		temp = SPI2_Read(0);
; words_count start address is: 20 (R5)
MOVS	R0, #0
BL	_SPI2_Read+0
;MP3_driver.c,79 :: 		temp <<= 8;
LSLS	R3, R0, #8
; temp start address is: 16 (R4)
UXTH	R4, R3
;MP3_driver.c,80 :: 		temp += SPI2_Read(0);
MOVS	R0, #0
BL	_SPI2_Read+0
ADDS	R3, R4, R0
; temp end address is: 16 (R4)
;MP3_driver.c,81 :: 		*(data_buffer++) = temp;
STRH	R3, [R6, #0]
ADDS	R6, R6, #2
;MP3_driver.c,82 :: 		}
UXTB	R0, R5
; words_count end address is: 20 (R5)
; data_buffer end address is: 24 (R6)
IT	AL
BAL	L_MP3_SCI_Read2
L_MP3_SCI_Read3:
;MP3_driver.c,83 :: 		MP3_CS = 1;                    // deselect MP3 SCI
MOVS	R4, #1
SXTB	R4, R4
MOVW	R3, #lo_addr(MP3_CS+0)
MOVT	R3, #hi_addr(MP3_CS+0)
STR	R4, [R3, #0]
;MP3_driver.c,84 :: 		while (DREQ == 0);             // wait until DREQ becomes 1, see MP3 codec datasheet, Serial Protocol for SCI
L_MP3_SCI_Read4:
MOVW	R4, #lo_addr(DREQ+0)
MOVT	R4, #hi_addr(DREQ+0)
LDR	R3, [R4, #0]
CMP	R3, #0
IT	NE
BNE	L_MP3_SCI_Read5
IT	AL
BAL	L_MP3_SCI_Read4
L_MP3_SCI_Read5:
;MP3_driver.c,85 :: 		}
L_end_MP3_SCI_Read:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MP3_SCI_Read
_MP3_SDI_Write:
;MP3_driver.c,94 :: 		void MP3_SDI_Write(char data_) {
; data_ start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; data_ end address is: 0 (R0)
; data_ start address is: 0 (R0)
;MP3_driver.c,96 :: 		MP3_CS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(MP3_CS+0)
MOVT	R1, #hi_addr(MP3_CS+0)
STR	R2, [R1, #0]
;MP3_driver.c,97 :: 		BSYNC = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(BSYNC+0)
MOVT	R1, #hi_addr(BSYNC+0)
STR	R2, [R1, #0]
; data_ end address is: 0 (R0)
;MP3_driver.c,99 :: 		while (DREQ == 0);             // wait until DREQ becomes 1, see MP3 codec datasheet, Serial Protocol for SCI
L_MP3_SDI_Write6:
; data_ start address is: 0 (R0)
MOVW	R2, #lo_addr(DREQ+0)
MOVT	R2, #hi_addr(DREQ+0)
LDR	R1, [R2, #0]
CMP	R1, #0
IT	NE
BNE	L_MP3_SDI_Write7
IT	AL
BAL	L_MP3_SDI_Write6
L_MP3_SDI_Write7:
;MP3_driver.c,101 :: 		SPI2_Write(data_);
; data_ end address is: 0 (R0)
BL	_SPI2_Write+0
;MP3_driver.c,102 :: 		BSYNC = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(BSYNC+0)
MOVT	R1, #hi_addr(BSYNC+0)
STR	R2, [R1, #0]
;MP3_driver.c,103 :: 		}
L_end_MP3_SDI_Write:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MP3_SDI_Write
_MP3_Reset_Time:
;MP3_driver.c,112 :: 		void MP3_Reset_Time(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MP3_driver.c,113 :: 		MP3_SCI_Write(SCI_DECODE_TIME_ADDR, 0);
MOVS	R1, #0
MOVS	R0, #4
BL	_MP3_SCI_Write+0
;MP3_driver.c,114 :: 		}
L_end_MP3_Reset_Time:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MP3_Reset_Time
_MP3_Get_Decode_Time:
;MP3_driver.c,123 :: 		void MP3_Get_Decode_Time(unsigned int *time){
; time start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; time end address is: 0 (R0)
; time start address is: 0 (R0)
;MP3_driver.c,124 :: 		MP3_SCI_Read(SCI_DECODE_TIME_ADDR, 1, time);
MOV	R2, R0
; time end address is: 0 (R0)
MOVS	R1, #1
MOVS	R0, #4
BL	_MP3_SCI_Read+0
;MP3_driver.c,125 :: 		}
L_end_MP3_Get_Decode_Time:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MP3_Get_Decode_Time
_MP3_SDI_Write_32:
;MP3_driver.c,134 :: 		void MP3_SDI_Write_32(char *data_) {
; data_ start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; data_ end address is: 0 (R0)
; data_ start address is: 0 (R0)
;MP3_driver.c,137 :: 		MP3_CS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(MP3_CS+0)
MOVT	R1, #hi_addr(MP3_CS+0)
STR	R2, [R1, #0]
;MP3_driver.c,138 :: 		BSYNC = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(BSYNC+0)
MOVT	R1, #hi_addr(BSYNC+0)
STR	R2, [R1, #0]
; data_ end address is: 0 (R0)
;MP3_driver.c,140 :: 		while (DREQ == 0);             // wait until DREQ becomes 1, see MP3 codec datasheet, Serial Protocol for SCI
L_MP3_SDI_Write_328:
; data_ start address is: 0 (R0)
MOVW	R2, #lo_addr(DREQ+0)
MOVT	R2, #hi_addr(DREQ+0)
LDR	R1, [R2, #0]
CMP	R1, #0
IT	NE
BNE	L_MP3_SDI_Write_329
IT	AL
BAL	L_MP3_SDI_Write_328
L_MP3_SDI_Write_329:
;MP3_driver.c,142 :: 		for (i=0; i<32; i++)
; i start address is: 20 (R5)
MOVS	R5, #0
; data_ end address is: 0 (R0)
; i end address is: 20 (R5)
MOV	R4, R0
L_MP3_SDI_Write_3210:
; i start address is: 20 (R5)
; data_ start address is: 16 (R4)
; data_ start address is: 16 (R4)
; data_ end address is: 16 (R4)
CMP	R5, #32
IT	CS
BCS	L_MP3_SDI_Write_3211
; data_ end address is: 16 (R4)
;MP3_driver.c,143 :: 		SPI2_Write(data_[i]);
; data_ start address is: 16 (R4)
ADDS	R1, R4, R5
LDRB	R1, [R1, #0]
UXTH	R0, R1
BL	_SPI2_Write+0
;MP3_driver.c,142 :: 		for (i=0; i<32; i++)
ADDS	R5, R5, #1
UXTB	R5, R5
;MP3_driver.c,143 :: 		SPI2_Write(data_[i]);
; data_ end address is: 16 (R4)
; i end address is: 20 (R5)
IT	AL
BAL	L_MP3_SDI_Write_3210
L_MP3_SDI_Write_3211:
;MP3_driver.c,144 :: 		BSYNC = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(BSYNC+0)
MOVT	R1, #hi_addr(BSYNC+0)
STR	R2, [R1, #0]
;MP3_driver.c,145 :: 		}
L_end_MP3_SDI_Write_32:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MP3_SDI_Write_32
_MP3_Set_Volume:
;MP3_driver.c,154 :: 		void MP3_Set_Volume(char left, char right) {
; right start address is: 4 (R1)
; left start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; right end address is: 4 (R1)
; left end address is: 0 (R0)
; left start address is: 0 (R0)
; right start address is: 4 (R1)
;MP3_driver.c,157 :: 		volume = (left<<8) + right;             // calculate value
LSLS	R2, R0, #8
UXTH	R2, R2
; left end address is: 0 (R0)
ADDS	R2, R2, R1
; right end address is: 4 (R1)
;MP3_driver.c,158 :: 		MP3_SCI_Write(SCI_VOL_ADDR, volume);    // Write value to VOL register
UXTH	R1, R2
MOVS	R0, #11
BL	_MP3_SCI_Write+0
;MP3_driver.c,159 :: 		}
L_end_MP3_Set_Volume:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MP3_Set_Volume
_MP3_Set_default_Mode:
;MP3_driver.c,161 :: 		void MP3_Set_default_Mode(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MP3_driver.c,162 :: 		BSYNC = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(BSYNC+0)
MOVT	R0, #hi_addr(BSYNC+0)
STR	R1, [R0, #0]
;MP3_driver.c,163 :: 		MP3_CS = 1;
MOVW	R0, #lo_addr(MP3_CS+0)
MOVT	R0, #hi_addr(MP3_CS+0)
STR	R1, [R0, #0]
;MP3_driver.c,166 :: 		MP3_RST = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(MP3_RST+0)
MOVT	R0, #hi_addr(MP3_RST+0)
STR	R1, [R0, #0]
;MP3_driver.c,167 :: 		Delay_ms(10);
MOVW	R7, #41246
MOVT	R7, #7
NOP
NOP
L_MP3_Set_default_Mode13:
SUBS	R7, R7, #1
BNE	L_MP3_Set_default_Mode13
NOP
NOP
NOP
;MP3_driver.c,168 :: 		MP3_RST = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(MP3_RST+0)
MOVT	R0, #hi_addr(MP3_RST+0)
STR	R1, [R0, #0]
;MP3_driver.c,170 :: 		while (DREQ == 0);
L_MP3_Set_default_Mode15:
MOVW	R1, #lo_addr(DREQ+0)
MOVT	R1, #hi_addr(DREQ+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_MP3_Set_default_Mode16
IT	AL
BAL	L_MP3_Set_default_Mode15
L_MP3_Set_default_Mode16:
;MP3_driver.c,172 :: 		MP3_SCI_Write(SCI_MODE_ADDR, 0x0800);
MOVW	R1, #2048
MOVS	R0, #0
BL	_MP3_SCI_Write+0
;MP3_driver.c,173 :: 		MP3_SCI_Write(SCI_BASS_ADDR, 0x7A00);
MOVW	R1, #31232
MOVS	R0, #2
BL	_MP3_SCI_Write+0
;MP3_driver.c,174 :: 		MP3_SCI_Write(SCI_CLOCKF_ADDR, 0xC000);   // default 12 288 000 Hz
MOVW	R1, #49152
MOVS	R0, #3
BL	_MP3_SCI_Write+0
;MP3_driver.c,177 :: 		}
L_end_MP3_Set_default_Mode:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MP3_Set_default_Mode
