_Write_to_Data_Lines:
;Ducati_logger_driver.c,64 :: 		void Write_to_Data_Lines(unsigned char _hi, unsigned char _lo) {
; _lo start address is: 4 (R1)
; _hi start address is: 0 (R0)
; _lo end address is: 4 (R1)
; _hi end address is: 0 (R0)
; _hi start address is: 0 (R0)
; _lo start address is: 4 (R1)
;Ducati_logger_driver.c,66 :: 		temp = GPIOE_ODR;
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
; temp start address is: 8 (R2)
LDR	R2, [R2, #0]
;Ducati_logger_driver.c,67 :: 		temp &= 0x00FF;
AND	R3, R2, #255
UXTH	R3, R3
; temp end address is: 8 (R2)
;Ducati_logger_driver.c,68 :: 		GPIOE_ODR = temp | (_hi << 8);
LSLS	R2, R0, #8
UXTH	R2, R2
; _hi end address is: 0 (R0)
ORRS	R3, R2
UXTH	R3, R3
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,69 :: 		temp = GPIOG_ODR;
MOVW	R2, #lo_addr(GPIOG_ODR+0)
MOVT	R2, #hi_addr(GPIOG_ODR+0)
; temp start address is: 0 (R0)
LDR	R0, [R2, #0]
;Ducati_logger_driver.c,70 :: 		temp &= 0xFF00;
AND	R2, R0, #65280
UXTH	R2, R2
; temp end address is: 0 (R0)
;Ducati_logger_driver.c,71 :: 		GPIOG_ODR = temp | _lo;
ORR	R3, R2, R1, LSL #0
UXTH	R3, R3
; _lo end address is: 4 (R1)
MOVW	R2, #lo_addr(GPIOG_ODR+0)
MOVT	R2, #hi_addr(GPIOG_ODR+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,72 :: 		}
L_end_Write_to_Data_Lines:
BX	LR
; end of _Write_to_Data_Lines
_Set_Index:
;Ducati_logger_driver.c,74 :: 		void Set_Index(unsigned short index) {
; index start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; index end address is: 0 (R0)
; index start address is: 0 (R0)
;Ducati_logger_driver.c,75 :: 		TFT_RS = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;Ducati_logger_driver.c,76 :: 		Write_to_Data_Lines(0, index);
UXTB	R1, R0
; index end address is: 0 (R0)
MOVS	R0, #0
BL	_Write_to_Data_Lines+0
;Ducati_logger_driver.c,77 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;Ducati_logger_driver.c,78 :: 		asm nop;
NOP
;Ducati_logger_driver.c,79 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;Ducati_logger_driver.c,80 :: 		}
L_end_Set_Index:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_Index
_Write_Command:
;Ducati_logger_driver.c,82 :: 		void Write_Command(unsigned short cmd) {
; cmd start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cmd end address is: 0 (R0)
; cmd start address is: 0 (R0)
;Ducati_logger_driver.c,83 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;Ducati_logger_driver.c,84 :: 		Write_to_Data_Lines(0, cmd);
UXTB	R1, R0
; cmd end address is: 0 (R0)
MOVS	R0, #0
BL	_Write_to_Data_Lines+0
;Ducati_logger_driver.c,85 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;Ducati_logger_driver.c,86 :: 		asm nop;
NOP
;Ducati_logger_driver.c,87 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;Ducati_logger_driver.c,88 :: 		}
L_end_Write_Command:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Write_Command
_Write_Data:
;Ducati_logger_driver.c,90 :: 		void Write_Data(unsigned int _data) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRH	R0, [SP, #4]
;Ducati_logger_driver.c,91 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;Ducati_logger_driver.c,92 :: 		Write_to_Data_Lines(Hi(_data), Lo(_data));
ADD	R3, SP, #4
LDRB	R1, [R3, #0]
UXTB	R2, R1
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
UXTB	R0, R1
UXTB	R1, R2
BL	_Write_to_Data_Lines+0
;Ducati_logger_driver.c,93 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;Ducati_logger_driver.c,94 :: 		asm nop;
NOP
;Ducati_logger_driver.c,95 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;Ducati_logger_driver.c,96 :: 		}
L_end_Write_Data:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Write_Data
_TFT_Get_Data:
;Ducati_logger_driver.c,99 :: 		char* TFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num) {
; offset start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R2, [SP, #16]
MOV	R2, R0
STR	R1, [SP, #12]
; offset end address is: 0 (R0)
; offset start address is: 8 (R2)
;Ducati_logger_driver.c,103 :: 		start_sector = Mmc_Get_File_Write_Sector() + offset/512;
BL	_Mmc_Get_File_Write_Sector+0
LSRS	R3, R2, #9
ADDS	R4, R0, R3
STR	R4, [SP, #4]
;Ducati_logger_driver.c,104 :: 		fpos = (unsigned long)offset%512;
MOVW	R3, #511
AND	R3, R2, R3, LSL #0
; offset end address is: 8 (R2)
STRH	R3, [SP, #8]
;Ducati_logger_driver.c,106 :: 		if(start_sector == currentSector+1) {
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
LDR	R3, [R3, #0]
ADDS	R3, R3, #1
CMP	R4, R3
IT	NE
BNE	L_TFT_Get_Data0
;Ducati_logger_driver.c,107 :: 		Mmc_Multi_Read_Sector(Ext_Data_Buffer);
MOVW	R0, #lo_addr(_Ext_Data_Buffer+0)
MOVT	R0, #hi_addr(_Ext_Data_Buffer+0)
BL	_Mmc_Multi_Read_Sector+0
;Ducati_logger_driver.c,108 :: 		currentSector = start_sector;
LDR	R4, [SP, #4]
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
STR	R4, [R3, #0]
;Ducati_logger_driver.c,109 :: 		} else if (start_sector != currentSector) {
IT	AL
BAL	L_TFT_Get_Data1
L_TFT_Get_Data0:
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
LDR	R4, [R3, #0]
LDR	R3, [SP, #4]
CMP	R3, R4
IT	EQ
BEQ	L_TFT_Get_Data2
;Ducati_logger_driver.c,110 :: 		if(currentSector != -1)
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
LDR	R3, [R3, #0]
CMP	R3, #-1
IT	EQ
BEQ	L_TFT_Get_Data3
;Ducati_logger_driver.c,111 :: 		Mmc_Multi_Read_Stop();
BL	_Mmc_Multi_Read_Stop+0
L_TFT_Get_Data3:
;Ducati_logger_driver.c,112 :: 		Mmc_Multi_Read_Start(start_sector);
LDR	R0, [SP, #4]
BL	_Mmc_Multi_Read_Start+0
;Ducati_logger_driver.c,113 :: 		Mmc_Multi_Read_Sector(Ext_Data_Buffer);
MOVW	R0, #lo_addr(_Ext_Data_Buffer+0)
MOVT	R0, #hi_addr(_Ext_Data_Buffer+0)
BL	_Mmc_Multi_Read_Sector+0
;Ducati_logger_driver.c,114 :: 		currentSector = start_sector;
LDR	R4, [SP, #4]
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
STR	R4, [R3, #0]
;Ducati_logger_driver.c,115 :: 		}
L_TFT_Get_Data2:
L_TFT_Get_Data1:
;Ducati_logger_driver.c,117 :: 		if(count>512-fpos)
LDRH	R3, [SP, #8]
RSB	R4, R3, #512
UXTH	R4, R4
LDR	R3, [SP, #12]
CMP	R3, R4
IT	LS
BLS	L_TFT_Get_Data4
;Ducati_logger_driver.c,118 :: 		*num = 512-fpos;
LDRH	R3, [SP, #8]
RSB	R4, R3, #512
UXTH	R4, R4
LDR	R3, [SP, #16]
STR	R4, [R3, #0]
IT	AL
BAL	L_TFT_Get_Data5
L_TFT_Get_Data4:
;Ducati_logger_driver.c,120 :: 		*num = count;
LDR	R4, [SP, #12]
LDR	R3, [SP, #16]
STR	R4, [R3, #0]
L_TFT_Get_Data5:
;Ducati_logger_driver.c,122 :: 		return Ext_Data_Buffer+fpos;
LDRH	R4, [SP, #8]
MOVW	R3, #lo_addr(_Ext_Data_Buffer+0)
MOVT	R3, #hi_addr(_Ext_Data_Buffer+0)
ADDS	R3, R3, R4
MOV	R0, R3
;Ducati_logger_driver.c,123 :: 		}
L_end_TFT_Get_Data:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _TFT_Get_Data
Ducati_logger_driver_InitializeTouchPanel:
;Ducati_logger_driver.c,124 :: 		static void InitializeTouchPanel() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_driver.c,125 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
MOVW	R2, #lo_addr(_Write_Data+0)
MOVT	R2, #hi_addr(_Write_Data+0)
MOVW	R1, #lo_addr(_Write_Command+0)
MOVT	R1, #hi_addr(_Write_Command+0)
MOVW	R0, #lo_addr(_Set_Index+0)
MOVT	R0, #hi_addr(_Set_Index+0)
BL	_TFT_Set_Active+0
;Ducati_logger_driver.c,126 :: 		TFT_Init_SSD1963(480, 272);
MOVW	R1, #272
MOVW	R0, #480
BL	_TFT_Init_SSD1963+0
;Ducati_logger_driver.c,127 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
MOVW	R0, #lo_addr(_TFT_Get_Data+0)
MOVT	R0, #hi_addr(_TFT_Get_Data+0)
BL	_TFT_Set_Ext_Buffer+0
;Ducati_logger_driver.c,130 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,131 :: 		PressedObject = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PressedObject+0)
MOVT	R0, #hi_addr(_PressedObject+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,132 :: 		PressedObjectType = -1;
MOVW	R1, #65535
SXTH	R1, R1
MOVW	R0, #lo_addr(_PressedObjectType+0)
MOVT	R0, #hi_addr(_PressedObjectType+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,133 :: 		}
L_end_InitializeTouchPanel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of Ducati_logger_driver_InitializeTouchPanel
_Calibrate:
;Ducati_logger_driver.c,135 :: 		void Calibrate() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_driver.c,136 :: 		TFT_Fill_Screen(CL_BLACK);
MOVW	R0, #0
BL	_TFT_Fill_Screen+0
;Ducati_logger_driver.c,137 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;Ducati_logger_driver.c,138 :: 		TFT_Write_Text("Touch points on the screen as they", 125, 121);
MOVW	R0, #lo_addr(?lstr1_Ducati_logger_driver+0)
MOVT	R0, #hi_addr(?lstr1_Ducati_logger_driver+0)
MOVS	R2, #121
MOVS	R1, #125
BL	_TFT_Write_Text+0
;Ducati_logger_driver.c,139 :: 		TFT_Write_Text("appear to calibrate touchscreen.", 135, 151);
MOVW	R0, #lo_addr(?lstr2_Ducati_logger_driver+0)
MOVT	R0, #hi_addr(?lstr2_Ducati_logger_driver+0)
MOVS	R2, #151
MOVS	R1, #135
BL	_TFT_Write_Text+0
;Ducati_logger_driver.c,140 :: 		STMPE610_ClearInterruptFlagsAndFIFO();
BL	_STMPE610_ClearInterruptFlagsAndFIFO+0
;Ducati_logger_driver.c,141 :: 		TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #65535
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Ducati_logger_driver.c,142 :: 		TFT_Circle(0, 0, 3);
MOVS	R2, #3
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Circle+0
;Ducati_logger_driver.c,143 :: 		STMPE610_CalibratePoint(STMPE610_FIRST_CORNER);
MOVS	R0, #0
BL	_STMPE610_CalibratePoint+0
;Ducati_logger_driver.c,144 :: 		Delay_ms(500);
MOVW	R7, #30782
MOVT	R7, #381
NOP
NOP
L_Calibrate6:
SUBS	R7, R7, #1
BNE	L_Calibrate6
NOP
NOP
NOP
;Ducati_logger_driver.c,145 :: 		TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Ducati_logger_driver.c,146 :: 		TFT_Circle(0, 0, 3);
MOVS	R2, #3
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Circle+0
;Ducati_logger_driver.c,147 :: 		STMPE610_ClearInterruptFlagsAndFIFO();
BL	_STMPE610_ClearInterruptFlagsAndFIFO+0
;Ducati_logger_driver.c,148 :: 		TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #65535
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Ducati_logger_driver.c,149 :: 		TFT_Circle(0, TFT_DISP_HEIGHT-1, 3);
MOVW	R0, #lo_addr(_TFT_DISP_HEIGHT+0)
MOVT	R0, #hi_addr(_TFT_DISP_HEIGHT+0)
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
MOVS	R2, #3
SXTH	R2, R2
SXTH	R1, R0
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Circle+0
;Ducati_logger_driver.c,150 :: 		STMPE610_CalibratePoint(STMPE610_SECOND_CORNER);
MOVS	R0, #1
BL	_STMPE610_CalibratePoint+0
;Ducati_logger_driver.c,151 :: 		Delay_ms(500);
MOVW	R7, #30782
MOVT	R7, #381
NOP
NOP
L_Calibrate8:
SUBS	R7, R7, #1
BNE	L_Calibrate8
NOP
NOP
NOP
;Ducati_logger_driver.c,152 :: 		TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Ducati_logger_driver.c,153 :: 		TFT_Circle(0, TFT_DISP_HEIGHT-1, 3);
MOVW	R0, #lo_addr(_TFT_DISP_HEIGHT+0)
MOVT	R0, #hi_addr(_TFT_DISP_HEIGHT+0)
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
MOVS	R2, #3
SXTH	R2, R2
SXTH	R1, R0
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Circle+0
;Ducati_logger_driver.c,154 :: 		STMPE610_ClearInterruptFlagsAndFIFO();
BL	_STMPE610_ClearInterruptFlagsAndFIFO+0
;Ducati_logger_driver.c,155 :: 		TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #65535
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Ducati_logger_driver.c,156 :: 		TFT_Circle(TFT_DISP_WIDTH-1, TFT_DISP_HEIGHT-1, 3);
MOVW	R0, #lo_addr(_TFT_DISP_HEIGHT+0)
MOVT	R0, #hi_addr(_TFT_DISP_HEIGHT+0)
LDRH	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_TFT_DISP_WIDTH+0)
MOVT	R0, #hi_addr(_TFT_DISP_WIDTH+0)
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
MOVS	R2, #3
SXTH	R2, R2
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Circle+0
;Ducati_logger_driver.c,157 :: 		STMPE610_CalibratePoint(STMPE610_THIRD_CORNER);
MOVS	R0, #2
BL	_STMPE610_CalibratePoint+0
;Ducati_logger_driver.c,158 :: 		Delay_ms(500);
MOVW	R7, #30782
MOVT	R7, #381
NOP
NOP
L_Calibrate10:
SUBS	R7, R7, #1
BNE	L_Calibrate10
NOP
NOP
NOP
;Ducati_logger_driver.c,159 :: 		TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Ducati_logger_driver.c,160 :: 		TFT_Circle(TFT_DISP_WIDTH-1, TFT_DISP_HEIGHT-1, 3);
MOVW	R0, #lo_addr(_TFT_DISP_HEIGHT+0)
MOVT	R0, #hi_addr(_TFT_DISP_HEIGHT+0)
LDRH	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_TFT_DISP_WIDTH+0)
MOVT	R0, #hi_addr(_TFT_DISP_WIDTH+0)
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
MOVS	R2, #3
SXTH	R2, R2
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Circle+0
;Ducati_logger_driver.c,161 :: 		STMPE610_ClearInterruptFlagsAndFIFO();
BL	_STMPE610_ClearInterruptFlagsAndFIFO+0
;Ducati_logger_driver.c,162 :: 		TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #65535
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Ducati_logger_driver.c,163 :: 		TFT_Circle(TFT_DISP_WIDTH-1, 0, 3);
MOVW	R0, #lo_addr(_TFT_DISP_WIDTH+0)
MOVT	R0, #hi_addr(_TFT_DISP_WIDTH+0)
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
MOVS	R2, #3
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Circle+0
;Ducati_logger_driver.c,164 :: 		STMPE610_CalibratePoint(STMPE610_FOURTH_CORNER);
MOVS	R0, #3
BL	_STMPE610_CalibratePoint+0
;Ducati_logger_driver.c,165 :: 		TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Ducati_logger_driver.c,166 :: 		TFT_Circle(TFT_DISP_WIDTH-1, 0, 3);
MOVW	R0, #lo_addr(_TFT_DISP_WIDTH+0)
MOVT	R0, #hi_addr(_TFT_DISP_WIDTH+0)
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
MOVS	R2, #3
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Circle+0
;Ducati_logger_driver.c,167 :: 		Delay_ms(500);
MOVW	R7, #30782
MOVT	R7, #381
NOP
NOP
L_Calibrate12:
SUBS	R7, R7, #1
BNE	L_Calibrate12
NOP
NOP
NOP
;Ducati_logger_driver.c,168 :: 		}
L_end_Calibrate:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Calibrate
Ducati_logger_driver_InitializeObjects:
;Ducati_logger_driver.c,852 :: 		static void InitializeObjects() {
;Ducati_logger_driver.c,853 :: 		Boot.Color                     = 0x41E6;
MOVW	R1, #16870
MOVW	R0, #lo_addr(_Boot+0)
MOVT	R0, #hi_addr(_Boot+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,854 :: 		Boot.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Boot+2)
MOVT	R0, #hi_addr(_Boot+2)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,855 :: 		Boot.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Boot+4)
MOVT	R0, #hi_addr(_Boot+4)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,856 :: 		Boot.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Boot+8)
MOVT	R0, #hi_addr(_Boot+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,857 :: 		Boot.LabelsCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Boot+16)
MOVT	R0, #hi_addr(_Boot+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,858 :: 		Boot.ImagesCount               = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Boot+24)
MOVT	R0, #hi_addr(_Boot+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,859 :: 		Boot.Images                    = Screen1_Images;
MOVW	R1, #lo_addr(_Screen1_Images+0)
MOVT	R1, #hi_addr(_Screen1_Images+0)
MOVW	R0, #lo_addr(_Boot+28)
MOVT	R0, #hi_addr(_Boot+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,860 :: 		Boot.CImagesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Boot+32)
MOVT	R0, #hi_addr(_Boot+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,861 :: 		Boot.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Boot+40)
MOVT	R0, #hi_addr(_Boot+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,862 :: 		Boot.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Boot+48)
MOVT	R0, #hi_addr(_Boot+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,863 :: 		Boot.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Boot+56)
MOVT	R0, #hi_addr(_Boot+56)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,864 :: 		Boot.CBoxesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Boot+64)
MOVT	R0, #hi_addr(_Boot+64)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,865 :: 		Boot.LinesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Boot+72)
MOVT	R0, #hi_addr(_Boot+72)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,866 :: 		Boot.ObjectsCount              = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Boot+6)
MOVT	R0, #hi_addr(_Boot+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,868 :: 		Speedometer_graphics.Color                     = 0x5AEB;
MOVW	R1, #23275
MOVW	R0, #lo_addr(_Speedometer_graphics+0)
MOVT	R0, #hi_addr(_Speedometer_graphics+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,869 :: 		Speedometer_graphics.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Speedometer_graphics+2)
MOVT	R0, #hi_addr(_Speedometer_graphics+2)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,870 :: 		Speedometer_graphics.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Speedometer_graphics+4)
MOVT	R0, #hi_addr(_Speedometer_graphics+4)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,871 :: 		Speedometer_graphics.Buttons_RoundCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Speedometer_graphics+8)
MOVT	R0, #hi_addr(_Speedometer_graphics+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,872 :: 		Speedometer_graphics.Buttons_Round             = Screen2_Buttons_Round;
MOVW	R1, #lo_addr(_Screen2_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen2_Buttons_Round+0)
MOVW	R0, #lo_addr(_Speedometer_graphics+12)
MOVT	R0, #hi_addr(_Speedometer_graphics+12)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,873 :: 		Speedometer_graphics.LabelsCount               = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Speedometer_graphics+16)
MOVT	R0, #hi_addr(_Speedometer_graphics+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,874 :: 		Speedometer_graphics.Labels                    = Screen2_Labels;
MOVW	R1, #lo_addr(_Screen2_Labels+0)
MOVT	R1, #hi_addr(_Screen2_Labels+0)
MOVW	R0, #lo_addr(_Speedometer_graphics+20)
MOVT	R0, #hi_addr(_Speedometer_graphics+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,875 :: 		Speedometer_graphics.ImagesCount               = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Speedometer_graphics+24)
MOVT	R0, #hi_addr(_Speedometer_graphics+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,876 :: 		Speedometer_graphics.Images                    = Screen2_Images;
MOVW	R1, #lo_addr(_Screen2_Images+0)
MOVT	R1, #hi_addr(_Screen2_Images+0)
MOVW	R0, #lo_addr(_Speedometer_graphics+28)
MOVT	R0, #hi_addr(_Speedometer_graphics+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,877 :: 		Speedometer_graphics.CImagesCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Speedometer_graphics+32)
MOVT	R0, #hi_addr(_Speedometer_graphics+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,878 :: 		Speedometer_graphics.CImages                   = Screen2_CImages;
MOVW	R1, #lo_addr(_Screen2_CImages+0)
MOVT	R1, #hi_addr(_Screen2_CImages+0)
MOVW	R0, #lo_addr(_Speedometer_graphics+36)
MOVT	R0, #hi_addr(_Speedometer_graphics+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,879 :: 		Speedometer_graphics.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Speedometer_graphics+40)
MOVT	R0, #hi_addr(_Speedometer_graphics+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,880 :: 		Speedometer_graphics.CircleButtonsCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Speedometer_graphics+48)
MOVT	R0, #hi_addr(_Speedometer_graphics+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,881 :: 		Speedometer_graphics.CircleButtons             = Screen2_CircleButtons;
MOVW	R1, #lo_addr(_Screen2_CircleButtons+0)
MOVT	R1, #hi_addr(_Screen2_CircleButtons+0)
MOVW	R0, #lo_addr(_Speedometer_graphics+52)
MOVT	R0, #hi_addr(_Speedometer_graphics+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,882 :: 		Speedometer_graphics.BoxesCount                = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Speedometer_graphics+56)
MOVT	R0, #hi_addr(_Speedometer_graphics+56)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,883 :: 		Speedometer_graphics.Boxes                     = Screen2_Boxes;
MOVW	R1, #lo_addr(_Screen2_Boxes+0)
MOVT	R1, #hi_addr(_Screen2_Boxes+0)
MOVW	R0, #lo_addr(_Speedometer_graphics+60)
MOVT	R0, #hi_addr(_Speedometer_graphics+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,884 :: 		Speedometer_graphics.CBoxesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Speedometer_graphics+64)
MOVT	R0, #hi_addr(_Speedometer_graphics+64)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,885 :: 		Speedometer_graphics.LinesCount                = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Speedometer_graphics+72)
MOVT	R0, #hi_addr(_Speedometer_graphics+72)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,886 :: 		Speedometer_graphics.Lines                     = Screen2_Lines;
MOVW	R1, #lo_addr(_Screen2_Lines+0)
MOVT	R1, #hi_addr(_Screen2_Lines+0)
MOVW	R0, #lo_addr(_Speedometer_graphics+76)
MOVT	R0, #hi_addr(_Speedometer_graphics+76)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,887 :: 		Speedometer_graphics.ObjectsCount              = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Speedometer_graphics+6)
MOVT	R0, #hi_addr(_Speedometer_graphics+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,889 :: 		Tachometer_graphics.Color                     = 0x5AEB;
MOVW	R1, #23275
MOVW	R0, #lo_addr(_Tachometer_graphics+0)
MOVT	R0, #hi_addr(_Tachometer_graphics+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,890 :: 		Tachometer_graphics.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Tachometer_graphics+2)
MOVT	R0, #hi_addr(_Tachometer_graphics+2)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,891 :: 		Tachometer_graphics.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Tachometer_graphics+4)
MOVT	R0, #hi_addr(_Tachometer_graphics+4)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,892 :: 		Tachometer_graphics.Buttons_RoundCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Tachometer_graphics+8)
MOVT	R0, #hi_addr(_Tachometer_graphics+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,893 :: 		Tachometer_graphics.Buttons_Round             = Screen3_Buttons_Round;
MOVW	R1, #lo_addr(_Screen3_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen3_Buttons_Round+0)
MOVW	R0, #lo_addr(_Tachometer_graphics+12)
MOVT	R0, #hi_addr(_Tachometer_graphics+12)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,894 :: 		Tachometer_graphics.LabelsCount               = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Tachometer_graphics+16)
MOVT	R0, #hi_addr(_Tachometer_graphics+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,895 :: 		Tachometer_graphics.Labels                    = Screen3_Labels;
MOVW	R1, #lo_addr(_Screen3_Labels+0)
MOVT	R1, #hi_addr(_Screen3_Labels+0)
MOVW	R0, #lo_addr(_Tachometer_graphics+20)
MOVT	R0, #hi_addr(_Tachometer_graphics+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,896 :: 		Tachometer_graphics.ImagesCount               = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Tachometer_graphics+24)
MOVT	R0, #hi_addr(_Tachometer_graphics+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,897 :: 		Tachometer_graphics.Images                    = Screen3_Images;
MOVW	R1, #lo_addr(_Screen3_Images+0)
MOVT	R1, #hi_addr(_Screen3_Images+0)
MOVW	R0, #lo_addr(_Tachometer_graphics+28)
MOVT	R0, #hi_addr(_Tachometer_graphics+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,898 :: 		Tachometer_graphics.CImagesCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Tachometer_graphics+32)
MOVT	R0, #hi_addr(_Tachometer_graphics+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,899 :: 		Tachometer_graphics.CImages                   = Screen3_CImages;
MOVW	R1, #lo_addr(_Screen3_CImages+0)
MOVT	R1, #hi_addr(_Screen3_CImages+0)
MOVW	R0, #lo_addr(_Tachometer_graphics+36)
MOVT	R0, #hi_addr(_Tachometer_graphics+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,900 :: 		Tachometer_graphics.CirclesCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Tachometer_graphics+40)
MOVT	R0, #hi_addr(_Tachometer_graphics+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,901 :: 		Tachometer_graphics.Circles                   = Screen3_Circles;
MOVW	R1, #lo_addr(_Screen3_Circles+0)
MOVT	R1, #hi_addr(_Screen3_Circles+0)
MOVW	R0, #lo_addr(_Tachometer_graphics+44)
MOVT	R0, #hi_addr(_Tachometer_graphics+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,902 :: 		Tachometer_graphics.CircleButtonsCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Tachometer_graphics+48)
MOVT	R0, #hi_addr(_Tachometer_graphics+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,903 :: 		Tachometer_graphics.CircleButtons             = Screen3_CircleButtons;
MOVW	R1, #lo_addr(_Screen3_CircleButtons+0)
MOVT	R1, #hi_addr(_Screen3_CircleButtons+0)
MOVW	R0, #lo_addr(_Tachometer_graphics+52)
MOVT	R0, #hi_addr(_Tachometer_graphics+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,904 :: 		Tachometer_graphics.BoxesCount                = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Tachometer_graphics+56)
MOVT	R0, #hi_addr(_Tachometer_graphics+56)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,905 :: 		Tachometer_graphics.Boxes                     = Screen3_Boxes;
MOVW	R1, #lo_addr(_Screen3_Boxes+0)
MOVT	R1, #hi_addr(_Screen3_Boxes+0)
MOVW	R0, #lo_addr(_Tachometer_graphics+60)
MOVT	R0, #hi_addr(_Tachometer_graphics+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,906 :: 		Tachometer_graphics.CBoxesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tachometer_graphics+64)
MOVT	R0, #hi_addr(_Tachometer_graphics+64)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,907 :: 		Tachometer_graphics.LinesCount                = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Tachometer_graphics+72)
MOVT	R0, #hi_addr(_Tachometer_graphics+72)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,908 :: 		Tachometer_graphics.Lines                     = Screen3_Lines;
MOVW	R1, #lo_addr(_Screen3_Lines+0)
MOVT	R1, #hi_addr(_Screen3_Lines+0)
MOVW	R0, #lo_addr(_Tachometer_graphics+76)
MOVT	R0, #hi_addr(_Tachometer_graphics+76)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,909 :: 		Tachometer_graphics.ObjectsCount              = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Tachometer_graphics+6)
MOVT	R0, #hi_addr(_Tachometer_graphics+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,911 :: 		Settings.Color                     = 0x5AEB;
MOVW	R1, #23275
MOVW	R0, #lo_addr(_Settings+0)
MOVT	R0, #hi_addr(_Settings+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,912 :: 		Settings.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Settings+2)
MOVT	R0, #hi_addr(_Settings+2)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,913 :: 		Settings.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Settings+4)
MOVT	R0, #hi_addr(_Settings+4)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,914 :: 		Settings.Buttons_RoundCount        = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Settings+8)
MOVT	R0, #hi_addr(_Settings+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,915 :: 		Settings.Buttons_Round             = Screen4_Buttons_Round;
MOVW	R1, #lo_addr(_Screen4_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen4_Buttons_Round+0)
MOVW	R0, #lo_addr(_Settings+12)
MOVT	R0, #hi_addr(_Settings+12)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,916 :: 		Settings.LabelsCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Settings+16)
MOVT	R0, #hi_addr(_Settings+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,917 :: 		Settings.Labels                    = Screen4_Labels;
MOVW	R1, #lo_addr(_Screen4_Labels+0)
MOVT	R1, #hi_addr(_Screen4_Labels+0)
MOVW	R0, #lo_addr(_Settings+20)
MOVT	R0, #hi_addr(_Settings+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,918 :: 		Settings.ImagesCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Settings+24)
MOVT	R0, #hi_addr(_Settings+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,919 :: 		Settings.Images                    = Screen4_Images;
MOVW	R1, #lo_addr(_Screen4_Images+0)
MOVT	R1, #hi_addr(_Screen4_Images+0)
MOVW	R0, #lo_addr(_Settings+28)
MOVT	R0, #hi_addr(_Settings+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,920 :: 		Settings.CImagesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Settings+32)
MOVT	R0, #hi_addr(_Settings+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,921 :: 		Settings.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Settings+40)
MOVT	R0, #hi_addr(_Settings+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,922 :: 		Settings.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Settings+48)
MOVT	R0, #hi_addr(_Settings+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,923 :: 		Settings.BoxesCount                = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Settings+56)
MOVT	R0, #hi_addr(_Settings+56)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,924 :: 		Settings.Boxes                     = Screen4_Boxes;
MOVW	R1, #lo_addr(_Screen4_Boxes+0)
MOVT	R1, #hi_addr(_Screen4_Boxes+0)
MOVW	R0, #lo_addr(_Settings+60)
MOVT	R0, #hi_addr(_Settings+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,925 :: 		Settings.CBoxesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Settings+64)
MOVT	R0, #hi_addr(_Settings+64)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,926 :: 		Settings.CBoxes                    = Screen4_CBoxes;
MOVW	R1, #lo_addr(_Screen4_CBoxes+0)
MOVT	R1, #hi_addr(_Screen4_CBoxes+0)
MOVW	R0, #lo_addr(_Settings+68)
MOVT	R0, #hi_addr(_Settings+68)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,927 :: 		Settings.LinesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Settings+72)
MOVT	R0, #hi_addr(_Settings+72)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,928 :: 		Settings.ObjectsCount              = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Settings+6)
MOVT	R0, #hi_addr(_Settings+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,930 :: 		Set_clock.Color                     = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_clock+0)
MOVT	R0, #hi_addr(_Set_clock+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,931 :: 		Set_clock.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Set_clock+2)
MOVT	R0, #hi_addr(_Set_clock+2)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,932 :: 		Set_clock.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Set_clock+4)
MOVT	R0, #hi_addr(_Set_clock+4)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,933 :: 		Set_clock.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_clock+8)
MOVT	R0, #hi_addr(_Set_clock+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,934 :: 		Set_clock.LabelsCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Set_clock+16)
MOVT	R0, #hi_addr(_Set_clock+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,935 :: 		Set_clock.Labels                    = Screen5_Labels;
MOVW	R1, #lo_addr(_Screen5_Labels+0)
MOVT	R1, #hi_addr(_Screen5_Labels+0)
MOVW	R0, #lo_addr(_Set_clock+20)
MOVT	R0, #hi_addr(_Set_clock+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,936 :: 		Set_clock.ImagesCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Set_clock+24)
MOVT	R0, #hi_addr(_Set_clock+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,937 :: 		Set_clock.Images                    = Screen5_Images;
MOVW	R1, #lo_addr(_Screen5_Images+0)
MOVT	R1, #hi_addr(_Screen5_Images+0)
MOVW	R0, #lo_addr(_Set_clock+28)
MOVT	R0, #hi_addr(_Set_clock+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,938 :: 		Set_clock.CImagesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_clock+32)
MOVT	R0, #hi_addr(_Set_clock+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,939 :: 		Set_clock.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_clock+40)
MOVT	R0, #hi_addr(_Set_clock+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,940 :: 		Set_clock.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_clock+48)
MOVT	R0, #hi_addr(_Set_clock+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,941 :: 		Set_clock.BoxesCount                = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Set_clock+56)
MOVT	R0, #hi_addr(_Set_clock+56)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,942 :: 		Set_clock.Boxes                     = Screen5_Boxes;
MOVW	R1, #lo_addr(_Screen5_Boxes+0)
MOVT	R1, #hi_addr(_Screen5_Boxes+0)
MOVW	R0, #lo_addr(_Set_clock+60)
MOVT	R0, #hi_addr(_Set_clock+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,943 :: 		Set_clock.CBoxesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_clock+64)
MOVT	R0, #hi_addr(_Set_clock+64)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,944 :: 		Set_clock.LinesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_clock+72)
MOVT	R0, #hi_addr(_Set_clock+72)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,945 :: 		Set_clock.ObjectsCount              = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Set_clock+6)
MOVT	R0, #hi_addr(_Set_clock+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,947 :: 		Accelerometer_test.Color                     = 0x5AEB;
MOVW	R1, #23275
MOVW	R0, #lo_addr(_Accelerometer_test+0)
MOVT	R0, #hi_addr(_Accelerometer_test+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,948 :: 		Accelerometer_test.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Accelerometer_test+2)
MOVT	R0, #hi_addr(_Accelerometer_test+2)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,949 :: 		Accelerometer_test.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Accelerometer_test+4)
MOVT	R0, #hi_addr(_Accelerometer_test+4)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,950 :: 		Accelerometer_test.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Accelerometer_test+8)
MOVT	R0, #hi_addr(_Accelerometer_test+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,951 :: 		Accelerometer_test.LabelsCount               = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Accelerometer_test+16)
MOVT	R0, #hi_addr(_Accelerometer_test+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,952 :: 		Accelerometer_test.Labels                    = Screen6_Labels;
MOVW	R1, #lo_addr(_Screen6_Labels+0)
MOVT	R1, #hi_addr(_Screen6_Labels+0)
MOVW	R0, #lo_addr(_Accelerometer_test+20)
MOVT	R0, #hi_addr(_Accelerometer_test+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,953 :: 		Accelerometer_test.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Accelerometer_test+24)
MOVT	R0, #hi_addr(_Accelerometer_test+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,954 :: 		Accelerometer_test.Images                    = Screen6_Images;
MOVW	R1, #lo_addr(_Screen6_Images+0)
MOVT	R1, #hi_addr(_Screen6_Images+0)
MOVW	R0, #lo_addr(_Accelerometer_test+28)
MOVT	R0, #hi_addr(_Accelerometer_test+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,955 :: 		Accelerometer_test.CImagesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Accelerometer_test+32)
MOVT	R0, #hi_addr(_Accelerometer_test+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,956 :: 		Accelerometer_test.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Accelerometer_test+40)
MOVT	R0, #hi_addr(_Accelerometer_test+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,957 :: 		Accelerometer_test.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Accelerometer_test+48)
MOVT	R0, #hi_addr(_Accelerometer_test+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,958 :: 		Accelerometer_test.BoxesCount                = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Accelerometer_test+56)
MOVT	R0, #hi_addr(_Accelerometer_test+56)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,959 :: 		Accelerometer_test.Boxes                     = Screen6_Boxes;
MOVW	R1, #lo_addr(_Screen6_Boxes+0)
MOVT	R1, #hi_addr(_Screen6_Boxes+0)
MOVW	R0, #lo_addr(_Accelerometer_test+60)
MOVT	R0, #hi_addr(_Accelerometer_test+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,960 :: 		Accelerometer_test.CBoxesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Accelerometer_test+64)
MOVT	R0, #hi_addr(_Accelerometer_test+64)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,961 :: 		Accelerometer_test.LinesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Accelerometer_test+72)
MOVT	R0, #hi_addr(_Accelerometer_test+72)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,962 :: 		Accelerometer_test.ObjectsCount              = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Accelerometer_test+6)
MOVT	R0, #hi_addr(_Accelerometer_test+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,964 :: 		GPS_Test.Color                     = 0x5AEB;
MOVW	R1, #23275
MOVW	R0, #lo_addr(_GPS_Test+0)
MOVT	R0, #hi_addr(_GPS_Test+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,965 :: 		GPS_Test.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_GPS_Test+2)
MOVT	R0, #hi_addr(_GPS_Test+2)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,966 :: 		GPS_Test.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_GPS_Test+4)
MOVT	R0, #hi_addr(_GPS_Test+4)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,967 :: 		GPS_Test.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_GPS_Test+8)
MOVT	R0, #hi_addr(_GPS_Test+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,968 :: 		GPS_Test.LabelsCount               = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_GPS_Test+16)
MOVT	R0, #hi_addr(_GPS_Test+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,969 :: 		GPS_Test.Labels                    = Screen7_Labels;
MOVW	R1, #lo_addr(_Screen7_Labels+0)
MOVT	R1, #hi_addr(_Screen7_Labels+0)
MOVW	R0, #lo_addr(_GPS_Test+20)
MOVT	R0, #hi_addr(_GPS_Test+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,970 :: 		GPS_Test.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_GPS_Test+24)
MOVT	R0, #hi_addr(_GPS_Test+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,971 :: 		GPS_Test.Images                    = Screen7_Images;
MOVW	R1, #lo_addr(_Screen7_Images+0)
MOVT	R1, #hi_addr(_Screen7_Images+0)
MOVW	R0, #lo_addr(_GPS_Test+28)
MOVT	R0, #hi_addr(_GPS_Test+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,972 :: 		GPS_Test.CImagesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_GPS_Test+32)
MOVT	R0, #hi_addr(_GPS_Test+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,973 :: 		GPS_Test.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_GPS_Test+40)
MOVT	R0, #hi_addr(_GPS_Test+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,974 :: 		GPS_Test.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_GPS_Test+48)
MOVT	R0, #hi_addr(_GPS_Test+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,975 :: 		GPS_Test.BoxesCount                = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_GPS_Test+56)
MOVT	R0, #hi_addr(_GPS_Test+56)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,976 :: 		GPS_Test.Boxes                     = Screen7_Boxes;
MOVW	R1, #lo_addr(_Screen7_Boxes+0)
MOVT	R1, #hi_addr(_Screen7_Boxes+0)
MOVW	R0, #lo_addr(_GPS_Test+60)
MOVT	R0, #hi_addr(_GPS_Test+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,977 :: 		GPS_Test.CBoxesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_GPS_Test+64)
MOVT	R0, #hi_addr(_GPS_Test+64)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,978 :: 		GPS_Test.LinesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_GPS_Test+72)
MOVT	R0, #hi_addr(_GPS_Test+72)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,979 :: 		GPS_Test.ObjectsCount              = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_GPS_Test+6)
MOVT	R0, #hi_addr(_GPS_Test+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,981 :: 		Gyro_test.Color                     = 0x5AEB;
MOVW	R1, #23275
MOVW	R0, #lo_addr(_Gyro_test+0)
MOVT	R0, #hi_addr(_Gyro_test+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,982 :: 		Gyro_test.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Gyro_test+2)
MOVT	R0, #hi_addr(_Gyro_test+2)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,983 :: 		Gyro_test.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Gyro_test+4)
MOVT	R0, #hi_addr(_Gyro_test+4)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,984 :: 		Gyro_test.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Gyro_test+8)
MOVT	R0, #hi_addr(_Gyro_test+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,985 :: 		Gyro_test.LabelsCount               = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Gyro_test+16)
MOVT	R0, #hi_addr(_Gyro_test+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,986 :: 		Gyro_test.Labels                    = Screen8_Labels;
MOVW	R1, #lo_addr(_Screen8_Labels+0)
MOVT	R1, #hi_addr(_Screen8_Labels+0)
MOVW	R0, #lo_addr(_Gyro_test+20)
MOVT	R0, #hi_addr(_Gyro_test+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,987 :: 		Gyro_test.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Gyro_test+24)
MOVT	R0, #hi_addr(_Gyro_test+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,988 :: 		Gyro_test.Images                    = Screen8_Images;
MOVW	R1, #lo_addr(_Screen8_Images+0)
MOVT	R1, #hi_addr(_Screen8_Images+0)
MOVW	R0, #lo_addr(_Gyro_test+28)
MOVT	R0, #hi_addr(_Gyro_test+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,989 :: 		Gyro_test.CImagesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Gyro_test+32)
MOVT	R0, #hi_addr(_Gyro_test+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,990 :: 		Gyro_test.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Gyro_test+40)
MOVT	R0, #hi_addr(_Gyro_test+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,991 :: 		Gyro_test.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Gyro_test+48)
MOVT	R0, #hi_addr(_Gyro_test+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,992 :: 		Gyro_test.BoxesCount                = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Gyro_test+56)
MOVT	R0, #hi_addr(_Gyro_test+56)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,993 :: 		Gyro_test.Boxes                     = Screen8_Boxes;
MOVW	R1, #lo_addr(_Screen8_Boxes+0)
MOVT	R1, #hi_addr(_Screen8_Boxes+0)
MOVW	R0, #lo_addr(_Gyro_test+60)
MOVT	R0, #hi_addr(_Gyro_test+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,994 :: 		Gyro_test.CBoxesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Gyro_test+64)
MOVT	R0, #hi_addr(_Gyro_test+64)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,995 :: 		Gyro_test.LinesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Gyro_test+72)
MOVT	R0, #hi_addr(_Gyro_test+72)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,996 :: 		Gyro_test.ObjectsCount              = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Gyro_test+6)
MOVT	R0, #hi_addr(_Gyro_test+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,998 :: 		Magnetometer_test.Color                     = 0x5AEB;
MOVW	R1, #23275
MOVW	R0, #lo_addr(_Magnetometer_test+0)
MOVT	R0, #hi_addr(_Magnetometer_test+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,999 :: 		Magnetometer_test.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Magnetometer_test+2)
MOVT	R0, #hi_addr(_Magnetometer_test+2)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1000 :: 		Magnetometer_test.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Magnetometer_test+4)
MOVT	R0, #hi_addr(_Magnetometer_test+4)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1001 :: 		Magnetometer_test.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Magnetometer_test+8)
MOVT	R0, #hi_addr(_Magnetometer_test+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1002 :: 		Magnetometer_test.LabelsCount               = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Magnetometer_test+16)
MOVT	R0, #hi_addr(_Magnetometer_test+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1003 :: 		Magnetometer_test.Labels                    = Screen9_Labels;
MOVW	R1, #lo_addr(_Screen9_Labels+0)
MOVT	R1, #hi_addr(_Screen9_Labels+0)
MOVW	R0, #lo_addr(_Magnetometer_test+20)
MOVT	R0, #hi_addr(_Magnetometer_test+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1004 :: 		Magnetometer_test.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Magnetometer_test+24)
MOVT	R0, #hi_addr(_Magnetometer_test+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1005 :: 		Magnetometer_test.Images                    = Screen9_Images;
MOVW	R1, #lo_addr(_Screen9_Images+0)
MOVT	R1, #hi_addr(_Screen9_Images+0)
MOVW	R0, #lo_addr(_Magnetometer_test+28)
MOVT	R0, #hi_addr(_Magnetometer_test+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1006 :: 		Magnetometer_test.CImagesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Magnetometer_test+32)
MOVT	R0, #hi_addr(_Magnetometer_test+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1007 :: 		Magnetometer_test.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Magnetometer_test+40)
MOVT	R0, #hi_addr(_Magnetometer_test+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1008 :: 		Magnetometer_test.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Magnetometer_test+48)
MOVT	R0, #hi_addr(_Magnetometer_test+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1009 :: 		Magnetometer_test.BoxesCount                = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Magnetometer_test+56)
MOVT	R0, #hi_addr(_Magnetometer_test+56)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1010 :: 		Magnetometer_test.Boxes                     = Screen9_Boxes;
MOVW	R1, #lo_addr(_Screen9_Boxes+0)
MOVT	R1, #hi_addr(_Screen9_Boxes+0)
MOVW	R0, #lo_addr(_Magnetometer_test+60)
MOVT	R0, #hi_addr(_Magnetometer_test+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1011 :: 		Magnetometer_test.CBoxesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Magnetometer_test+64)
MOVT	R0, #hi_addr(_Magnetometer_test+64)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1012 :: 		Magnetometer_test.LinesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Magnetometer_test+72)
MOVT	R0, #hi_addr(_Magnetometer_test+72)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1013 :: 		Magnetometer_test.ObjectsCount              = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Magnetometer_test+6)
MOVT	R0, #hi_addr(_Magnetometer_test+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1015 :: 		Pressure_test.Color                     = 0x5AEB;
MOVW	R1, #23275
MOVW	R0, #lo_addr(_Pressure_test+0)
MOVT	R0, #hi_addr(_Pressure_test+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1016 :: 		Pressure_test.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Pressure_test+2)
MOVT	R0, #hi_addr(_Pressure_test+2)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1017 :: 		Pressure_test.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Pressure_test+4)
MOVT	R0, #hi_addr(_Pressure_test+4)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1018 :: 		Pressure_test.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pressure_test+8)
MOVT	R0, #hi_addr(_Pressure_test+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1019 :: 		Pressure_test.LabelsCount               = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Pressure_test+16)
MOVT	R0, #hi_addr(_Pressure_test+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1020 :: 		Pressure_test.Labels                    = Screen10_Labels;
MOVW	R1, #lo_addr(_Screen10_Labels+0)
MOVT	R1, #hi_addr(_Screen10_Labels+0)
MOVW	R0, #lo_addr(_Pressure_test+20)
MOVT	R0, #hi_addr(_Pressure_test+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1021 :: 		Pressure_test.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Pressure_test+24)
MOVT	R0, #hi_addr(_Pressure_test+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1022 :: 		Pressure_test.Images                    = Screen10_Images;
MOVW	R1, #lo_addr(_Screen10_Images+0)
MOVT	R1, #hi_addr(_Screen10_Images+0)
MOVW	R0, #lo_addr(_Pressure_test+28)
MOVT	R0, #hi_addr(_Pressure_test+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1023 :: 		Pressure_test.CImagesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pressure_test+32)
MOVT	R0, #hi_addr(_Pressure_test+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1024 :: 		Pressure_test.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pressure_test+40)
MOVT	R0, #hi_addr(_Pressure_test+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1025 :: 		Pressure_test.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pressure_test+48)
MOVT	R0, #hi_addr(_Pressure_test+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1026 :: 		Pressure_test.BoxesCount                = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Pressure_test+56)
MOVT	R0, #hi_addr(_Pressure_test+56)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1027 :: 		Pressure_test.Boxes                     = Screen10_Boxes;
MOVW	R1, #lo_addr(_Screen10_Boxes+0)
MOVT	R1, #hi_addr(_Screen10_Boxes+0)
MOVW	R0, #lo_addr(_Pressure_test+60)
MOVT	R0, #hi_addr(_Pressure_test+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1028 :: 		Pressure_test.CBoxesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pressure_test+64)
MOVT	R0, #hi_addr(_Pressure_test+64)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1029 :: 		Pressure_test.LinesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pressure_test+72)
MOVT	R0, #hi_addr(_Pressure_test+72)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1030 :: 		Pressure_test.ObjectsCount              = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Pressure_test+6)
MOVT	R0, #hi_addr(_Pressure_test+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1032 :: 		Humidity_test.Color                     = 0x5AEB;
MOVW	R1, #23275
MOVW	R0, #lo_addr(_Humidity_test+0)
MOVT	R0, #hi_addr(_Humidity_test+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1033 :: 		Humidity_test.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Humidity_test+2)
MOVT	R0, #hi_addr(_Humidity_test+2)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1034 :: 		Humidity_test.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Humidity_test+4)
MOVT	R0, #hi_addr(_Humidity_test+4)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1035 :: 		Humidity_test.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Humidity_test+8)
MOVT	R0, #hi_addr(_Humidity_test+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1036 :: 		Humidity_test.LabelsCount               = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Humidity_test+16)
MOVT	R0, #hi_addr(_Humidity_test+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1037 :: 		Humidity_test.Labels                    = Screen11_Labels;
MOVW	R1, #lo_addr(_Screen11_Labels+0)
MOVT	R1, #hi_addr(_Screen11_Labels+0)
MOVW	R0, #lo_addr(_Humidity_test+20)
MOVT	R0, #hi_addr(_Humidity_test+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1038 :: 		Humidity_test.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Humidity_test+24)
MOVT	R0, #hi_addr(_Humidity_test+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1039 :: 		Humidity_test.Images                    = Screen11_Images;
MOVW	R1, #lo_addr(_Screen11_Images+0)
MOVT	R1, #hi_addr(_Screen11_Images+0)
MOVW	R0, #lo_addr(_Humidity_test+28)
MOVT	R0, #hi_addr(_Humidity_test+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1040 :: 		Humidity_test.CImagesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Humidity_test+32)
MOVT	R0, #hi_addr(_Humidity_test+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1041 :: 		Humidity_test.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Humidity_test+40)
MOVT	R0, #hi_addr(_Humidity_test+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1042 :: 		Humidity_test.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Humidity_test+48)
MOVT	R0, #hi_addr(_Humidity_test+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1043 :: 		Humidity_test.BoxesCount                = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Humidity_test+56)
MOVT	R0, #hi_addr(_Humidity_test+56)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1044 :: 		Humidity_test.Boxes                     = Screen11_Boxes;
MOVW	R1, #lo_addr(_Screen11_Boxes+0)
MOVT	R1, #hi_addr(_Screen11_Boxes+0)
MOVW	R0, #lo_addr(_Humidity_test+60)
MOVT	R0, #hi_addr(_Humidity_test+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1045 :: 		Humidity_test.CBoxesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Humidity_test+64)
MOVT	R0, #hi_addr(_Humidity_test+64)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1046 :: 		Humidity_test.LinesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Humidity_test+72)
MOVT	R0, #hi_addr(_Humidity_test+72)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1047 :: 		Humidity_test.ObjectsCount              = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Humidity_test+6)
MOVT	R0, #hi_addr(_Humidity_test+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1050 :: 		Image1.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image1+0)
MOVT	R0, #hi_addr(_Image1+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1051 :: 		Image1.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+4)
MOVT	R0, #hi_addr(_Image1+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1052 :: 		Image1.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image1+6)
MOVT	R0, #hi_addr(_Image1+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1053 :: 		Image1.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+8)
MOVT	R0, #hi_addr(_Image1+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1054 :: 		Image1.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image1+10)
MOVT	R0, #hi_addr(_Image1+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1055 :: 		Image1.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image1+12)
MOVT	R0, #hi_addr(_Image1+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1056 :: 		Image1.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+22)
MOVT	R0, #hi_addr(_Image1+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1057 :: 		Image1.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+23)
MOVT	R0, #hi_addr(_Image1+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1058 :: 		Image1.Picture_Name    = logo00_jpg;
MOVW	R1, #7732
MOVT	R1, #1
MOVW	R0, #lo_addr(_Image1+16)
MOVT	R0, #hi_addr(_Image1+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1059 :: 		Image1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+20)
MOVT	R0, #hi_addr(_Image1+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1060 :: 		Image1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+21)
MOVT	R0, #hi_addr(_Image1+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1061 :: 		Image1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+24)
MOVT	R0, #hi_addr(_Image1+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1062 :: 		Image1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+28)
MOVT	R0, #hi_addr(_Image1+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1063 :: 		Image1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+32)
MOVT	R0, #hi_addr(_Image1+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1064 :: 		Image1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+36)
MOVT	R0, #hi_addr(_Image1+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1066 :: 		Image2.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image2+0)
MOVT	R0, #hi_addr(_Image2+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1067 :: 		Image2.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+4)
MOVT	R0, #hi_addr(_Image2+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1068 :: 		Image2.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image2+6)
MOVT	R0, #hi_addr(_Image2+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1069 :: 		Image2.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+8)
MOVT	R0, #hi_addr(_Image2+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1070 :: 		Image2.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image2+10)
MOVT	R0, #hi_addr(_Image2+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1071 :: 		Image2.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image2+12)
MOVT	R0, #hi_addr(_Image2+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1072 :: 		Image2.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+22)
MOVT	R0, #hi_addr(_Image2+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1073 :: 		Image2.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+23)
MOVT	R0, #hi_addr(_Image2+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1074 :: 		Image2.Picture_Name    = logo01_jpg;
MOVW	R1, #7640
MOVT	R1, #3
MOVW	R0, #lo_addr(_Image2+16)
MOVT	R0, #hi_addr(_Image2+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1075 :: 		Image2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+20)
MOVT	R0, #hi_addr(_Image2+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1076 :: 		Image2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+21)
MOVT	R0, #hi_addr(_Image2+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1077 :: 		Image2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+24)
MOVT	R0, #hi_addr(_Image2+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1078 :: 		Image2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+28)
MOVT	R0, #hi_addr(_Image2+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1079 :: 		Image2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+32)
MOVT	R0, #hi_addr(_Image2+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1080 :: 		Image2.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+36)
MOVT	R0, #hi_addr(_Image2+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1082 :: 		Image10.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1083 :: 		Image10.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image10+4)
MOVT	R0, #hi_addr(_Image10+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1084 :: 		Image10.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image10+6)
MOVT	R0, #hi_addr(_Image10+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1085 :: 		Image10.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+8)
MOVT	R0, #hi_addr(_Image10+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1086 :: 		Image10.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image10+10)
MOVT	R0, #hi_addr(_Image10+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1087 :: 		Image10.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image10+12)
MOVT	R0, #hi_addr(_Image10+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1088 :: 		Image10.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image10+22)
MOVT	R0, #hi_addr(_Image10+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1089 :: 		Image10.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image10+23)
MOVT	R0, #hi_addr(_Image10+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1090 :: 		Image10.Picture_Name    = logo02_jpg;
MOVW	R1, #7548
MOVT	R1, #5
MOVW	R0, #lo_addr(_Image10+16)
MOVT	R0, #hi_addr(_Image10+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1091 :: 		Image10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image10+20)
MOVT	R0, #hi_addr(_Image10+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1092 :: 		Image10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image10+21)
MOVT	R0, #hi_addr(_Image10+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1093 :: 		Image10.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+24)
MOVT	R0, #hi_addr(_Image10+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1094 :: 		Image10.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+28)
MOVT	R0, #hi_addr(_Image10+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1095 :: 		Image10.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+32)
MOVT	R0, #hi_addr(_Image10+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1096 :: 		Image10.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+36)
MOVT	R0, #hi_addr(_Image10+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1098 :: 		Image11.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image11+0)
MOVT	R0, #hi_addr(_Image11+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1099 :: 		Image11.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Image11+4)
MOVT	R0, #hi_addr(_Image11+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1100 :: 		Image11.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image11+6)
MOVT	R0, #hi_addr(_Image11+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1101 :: 		Image11.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image11+8)
MOVT	R0, #hi_addr(_Image11+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1102 :: 		Image11.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image11+10)
MOVT	R0, #hi_addr(_Image11+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1103 :: 		Image11.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image11+12)
MOVT	R0, #hi_addr(_Image11+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1104 :: 		Image11.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image11+22)
MOVT	R0, #hi_addr(_Image11+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1105 :: 		Image11.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image11+23)
MOVT	R0, #hi_addr(_Image11+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1106 :: 		Image11.Picture_Name    = logo03_jpg;
MOVW	R1, #7456
MOVT	R1, #7
MOVW	R0, #lo_addr(_Image11+16)
MOVT	R0, #hi_addr(_Image11+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1107 :: 		Image11.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image11+20)
MOVT	R0, #hi_addr(_Image11+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1108 :: 		Image11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image11+21)
MOVT	R0, #hi_addr(_Image11+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1109 :: 		Image11.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image11+24)
MOVT	R0, #hi_addr(_Image11+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1110 :: 		Image11.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image11+28)
MOVT	R0, #hi_addr(_Image11+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1111 :: 		Image11.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image11+32)
MOVT	R0, #hi_addr(_Image11+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1112 :: 		Image11.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image11+36)
MOVT	R0, #hi_addr(_Image11+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1114 :: 		Image12.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image12+0)
MOVT	R0, #hi_addr(_Image12+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1115 :: 		Image12.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Image12+4)
MOVT	R0, #hi_addr(_Image12+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1116 :: 		Image12.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image12+6)
MOVT	R0, #hi_addr(_Image12+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1117 :: 		Image12.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+8)
MOVT	R0, #hi_addr(_Image12+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1118 :: 		Image12.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image12+10)
MOVT	R0, #hi_addr(_Image12+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1119 :: 		Image12.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image12+12)
MOVT	R0, #hi_addr(_Image12+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1120 :: 		Image12.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image12+22)
MOVT	R0, #hi_addr(_Image12+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1121 :: 		Image12.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image12+23)
MOVT	R0, #hi_addr(_Image12+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1122 :: 		Image12.Picture_Name    = logo04_jpg;
MOVW	R1, #7364
MOVT	R1, #9
MOVW	R0, #lo_addr(_Image12+16)
MOVT	R0, #hi_addr(_Image12+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1123 :: 		Image12.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image12+20)
MOVT	R0, #hi_addr(_Image12+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1124 :: 		Image12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image12+21)
MOVT	R0, #hi_addr(_Image12+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1125 :: 		Image12.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+24)
MOVT	R0, #hi_addr(_Image12+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1126 :: 		Image12.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+28)
MOVT	R0, #hi_addr(_Image12+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1127 :: 		Image12.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+32)
MOVT	R0, #hi_addr(_Image12+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1128 :: 		Image12.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+36)
MOVT	R0, #hi_addr(_Image12+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1130 :: 		Image16.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image16+0)
MOVT	R0, #hi_addr(_Image16+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1131 :: 		Image16.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image16+4)
MOVT	R0, #hi_addr(_Image16+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1132 :: 		Image16.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image16+6)
MOVT	R0, #hi_addr(_Image16+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1133 :: 		Image16.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image16+8)
MOVT	R0, #hi_addr(_Image16+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1134 :: 		Image16.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image16+10)
MOVT	R0, #hi_addr(_Image16+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1135 :: 		Image16.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image16+12)
MOVT	R0, #hi_addr(_Image16+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1136 :: 		Image16.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image16+22)
MOVT	R0, #hi_addr(_Image16+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1137 :: 		Image16.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image16+23)
MOVT	R0, #hi_addr(_Image16+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1138 :: 		Image16.Picture_Name    = logo05_jpg;
MOVW	R1, #7272
MOVT	R1, #11
MOVW	R0, #lo_addr(_Image16+16)
MOVT	R0, #hi_addr(_Image16+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1139 :: 		Image16.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image16+20)
MOVT	R0, #hi_addr(_Image16+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1140 :: 		Image16.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image16+21)
MOVT	R0, #hi_addr(_Image16+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1141 :: 		Image16.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image16+24)
MOVT	R0, #hi_addr(_Image16+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1142 :: 		Image16.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image16+28)
MOVT	R0, #hi_addr(_Image16+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1143 :: 		Image16.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image16+32)
MOVT	R0, #hi_addr(_Image16+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1144 :: 		Image16.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image16+36)
MOVT	R0, #hi_addr(_Image16+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1146 :: 		Image17.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image17+0)
MOVT	R0, #hi_addr(_Image17+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1147 :: 		Image17.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image17+4)
MOVT	R0, #hi_addr(_Image17+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1148 :: 		Image17.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image17+6)
MOVT	R0, #hi_addr(_Image17+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1149 :: 		Image17.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+8)
MOVT	R0, #hi_addr(_Image17+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1150 :: 		Image17.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image17+10)
MOVT	R0, #hi_addr(_Image17+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1151 :: 		Image17.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image17+12)
MOVT	R0, #hi_addr(_Image17+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1152 :: 		Image17.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image17+22)
MOVT	R0, #hi_addr(_Image17+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1153 :: 		Image17.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image17+23)
MOVT	R0, #hi_addr(_Image17+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1154 :: 		Image17.Picture_Name    = logo06_jpg;
MOVW	R1, #7180
MOVT	R1, #13
MOVW	R0, #lo_addr(_Image17+16)
MOVT	R0, #hi_addr(_Image17+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1155 :: 		Image17.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image17+20)
MOVT	R0, #hi_addr(_Image17+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1156 :: 		Image17.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image17+21)
MOVT	R0, #hi_addr(_Image17+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1157 :: 		Image17.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+24)
MOVT	R0, #hi_addr(_Image17+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1158 :: 		Image17.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+28)
MOVT	R0, #hi_addr(_Image17+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1159 :: 		Image17.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+32)
MOVT	R0, #hi_addr(_Image17+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1160 :: 		Image17.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+36)
MOVT	R0, #hi_addr(_Image17+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1162 :: 		Image21.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image21+0)
MOVT	R0, #hi_addr(_Image21+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1163 :: 		Image21.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Image21+4)
MOVT	R0, #hi_addr(_Image21+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1164 :: 		Image21.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image21+6)
MOVT	R0, #hi_addr(_Image21+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1165 :: 		Image21.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+8)
MOVT	R0, #hi_addr(_Image21+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1166 :: 		Image21.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image21+10)
MOVT	R0, #hi_addr(_Image21+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1167 :: 		Image21.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image21+12)
MOVT	R0, #hi_addr(_Image21+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1168 :: 		Image21.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image21+22)
MOVT	R0, #hi_addr(_Image21+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1169 :: 		Image21.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image21+23)
MOVT	R0, #hi_addr(_Image21+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1170 :: 		Image21.Picture_Name    = logo07_jpg;
MOVW	R1, #7088
MOVT	R1, #15
MOVW	R0, #lo_addr(_Image21+16)
MOVT	R0, #hi_addr(_Image21+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1171 :: 		Image21.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image21+20)
MOVT	R0, #hi_addr(_Image21+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1172 :: 		Image21.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image21+21)
MOVT	R0, #hi_addr(_Image21+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1173 :: 		Image21.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+24)
MOVT	R0, #hi_addr(_Image21+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1174 :: 		Image21.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+28)
MOVT	R0, #hi_addr(_Image21+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1175 :: 		Image21.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+32)
MOVT	R0, #hi_addr(_Image21+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1176 :: 		Image21.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+36)
MOVT	R0, #hi_addr(_Image21+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1178 :: 		Image22.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image22+0)
MOVT	R0, #hi_addr(_Image22+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1179 :: 		Image22.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Image22+4)
MOVT	R0, #hi_addr(_Image22+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1180 :: 		Image22.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image22+6)
MOVT	R0, #hi_addr(_Image22+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1181 :: 		Image22.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+8)
MOVT	R0, #hi_addr(_Image22+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1182 :: 		Image22.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image22+10)
MOVT	R0, #hi_addr(_Image22+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1183 :: 		Image22.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image22+12)
MOVT	R0, #hi_addr(_Image22+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1184 :: 		Image22.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image22+22)
MOVT	R0, #hi_addr(_Image22+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1185 :: 		Image22.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image22+23)
MOVT	R0, #hi_addr(_Image22+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1186 :: 		Image22.Picture_Name    = logo08_jpg;
MOVW	R1, #6996
MOVT	R1, #17
MOVW	R0, #lo_addr(_Image22+16)
MOVT	R0, #hi_addr(_Image22+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1187 :: 		Image22.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image22+20)
MOVT	R0, #hi_addr(_Image22+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1188 :: 		Image22.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image22+21)
MOVT	R0, #hi_addr(_Image22+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1189 :: 		Image22.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+24)
MOVT	R0, #hi_addr(_Image22+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1190 :: 		Image22.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+28)
MOVT	R0, #hi_addr(_Image22+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1191 :: 		Image22.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+32)
MOVT	R0, #hi_addr(_Image22+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1192 :: 		Image22.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+36)
MOVT	R0, #hi_addr(_Image22+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1194 :: 		Image23.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image23+0)
MOVT	R0, #hi_addr(_Image23+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1195 :: 		Image23.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Image23+4)
MOVT	R0, #hi_addr(_Image23+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1196 :: 		Image23.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image23+6)
MOVT	R0, #hi_addr(_Image23+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1197 :: 		Image23.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image23+8)
MOVT	R0, #hi_addr(_Image23+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1198 :: 		Image23.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image23+10)
MOVT	R0, #hi_addr(_Image23+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1199 :: 		Image23.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image23+12)
MOVT	R0, #hi_addr(_Image23+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1200 :: 		Image23.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image23+22)
MOVT	R0, #hi_addr(_Image23+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1201 :: 		Image23.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image23+23)
MOVT	R0, #hi_addr(_Image23+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1202 :: 		Image23.Picture_Name    = logo09_jpg;
MOVW	R1, #6904
MOVT	R1, #19
MOVW	R0, #lo_addr(_Image23+16)
MOVT	R0, #hi_addr(_Image23+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1203 :: 		Image23.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image23+20)
MOVT	R0, #hi_addr(_Image23+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1204 :: 		Image23.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image23+21)
MOVT	R0, #hi_addr(_Image23+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1205 :: 		Image23.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image23+24)
MOVT	R0, #hi_addr(_Image23+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1206 :: 		Image23.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image23+28)
MOVT	R0, #hi_addr(_Image23+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1207 :: 		Image23.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image23+32)
MOVT	R0, #hi_addr(_Image23+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1208 :: 		Image23.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image23+36)
MOVT	R0, #hi_addr(_Image23+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1210 :: 		Image24.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image24+0)
MOVT	R0, #hi_addr(_Image24+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1211 :: 		Image24.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Image24+4)
MOVT	R0, #hi_addr(_Image24+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1212 :: 		Image24.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image24+6)
MOVT	R0, #hi_addr(_Image24+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1213 :: 		Image24.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+8)
MOVT	R0, #hi_addr(_Image24+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1214 :: 		Image24.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image24+10)
MOVT	R0, #hi_addr(_Image24+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1215 :: 		Image24.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image24+12)
MOVT	R0, #hi_addr(_Image24+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1216 :: 		Image24.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image24+22)
MOVT	R0, #hi_addr(_Image24+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1217 :: 		Image24.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image24+23)
MOVT	R0, #hi_addr(_Image24+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1218 :: 		Image24.Picture_Name    = logo10_jpg;
MOVW	R1, #6812
MOVT	R1, #21
MOVW	R0, #lo_addr(_Image24+16)
MOVT	R0, #hi_addr(_Image24+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1219 :: 		Image24.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image24+20)
MOVT	R0, #hi_addr(_Image24+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1220 :: 		Image24.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image24+21)
MOVT	R0, #hi_addr(_Image24+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1221 :: 		Image24.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+24)
MOVT	R0, #hi_addr(_Image24+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1222 :: 		Image24.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+28)
MOVT	R0, #hi_addr(_Image24+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1223 :: 		Image24.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+32)
MOVT	R0, #hi_addr(_Image24+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1224 :: 		Image24.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+36)
MOVT	R0, #hi_addr(_Image24+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1226 :: 		Image25.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image25+0)
MOVT	R0, #hi_addr(_Image25+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1227 :: 		Image25.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Image25+4)
MOVT	R0, #hi_addr(_Image25+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1228 :: 		Image25.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image25+6)
MOVT	R0, #hi_addr(_Image25+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1229 :: 		Image25.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+8)
MOVT	R0, #hi_addr(_Image25+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1230 :: 		Image25.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image25+10)
MOVT	R0, #hi_addr(_Image25+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1231 :: 		Image25.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image25+12)
MOVT	R0, #hi_addr(_Image25+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1232 :: 		Image25.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image25+22)
MOVT	R0, #hi_addr(_Image25+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1233 :: 		Image25.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image25+23)
MOVT	R0, #hi_addr(_Image25+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1234 :: 		Image25.Picture_Name    = logo11_jpg;
MOVW	R1, #6720
MOVT	R1, #23
MOVW	R0, #lo_addr(_Image25+16)
MOVT	R0, #hi_addr(_Image25+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1235 :: 		Image25.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image25+20)
MOVT	R0, #hi_addr(_Image25+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1236 :: 		Image25.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image25+21)
MOVT	R0, #hi_addr(_Image25+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1237 :: 		Image25.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+24)
MOVT	R0, #hi_addr(_Image25+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1238 :: 		Image25.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+28)
MOVT	R0, #hi_addr(_Image25+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1239 :: 		Image25.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+32)
MOVT	R0, #hi_addr(_Image25+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1240 :: 		Image25.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+36)
MOVT	R0, #hi_addr(_Image25+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1242 :: 		Image26.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image26+0)
MOVT	R0, #hi_addr(_Image26+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1243 :: 		Image26.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Image26+4)
MOVT	R0, #hi_addr(_Image26+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1244 :: 		Image26.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image26+6)
MOVT	R0, #hi_addr(_Image26+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1245 :: 		Image26.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image26+8)
MOVT	R0, #hi_addr(_Image26+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1246 :: 		Image26.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image26+10)
MOVT	R0, #hi_addr(_Image26+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1247 :: 		Image26.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image26+12)
MOVT	R0, #hi_addr(_Image26+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1248 :: 		Image26.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image26+22)
MOVT	R0, #hi_addr(_Image26+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1249 :: 		Image26.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image26+23)
MOVT	R0, #hi_addr(_Image26+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1250 :: 		Image26.Picture_Name    = logo12_jpg;
MOVW	R1, #6628
MOVT	R1, #25
MOVW	R0, #lo_addr(_Image26+16)
MOVT	R0, #hi_addr(_Image26+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1251 :: 		Image26.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image26+20)
MOVT	R0, #hi_addr(_Image26+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1252 :: 		Image26.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image26+21)
MOVT	R0, #hi_addr(_Image26+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1253 :: 		Image26.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image26+24)
MOVT	R0, #hi_addr(_Image26+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1254 :: 		Image26.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image26+28)
MOVT	R0, #hi_addr(_Image26+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1255 :: 		Image26.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image26+32)
MOVT	R0, #hi_addr(_Image26+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1256 :: 		Image26.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image26+36)
MOVT	R0, #hi_addr(_Image26+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1258 :: 		Image27.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image27+0)
MOVT	R0, #hi_addr(_Image27+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1259 :: 		Image27.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Image27+4)
MOVT	R0, #hi_addr(_Image27+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1260 :: 		Image27.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image27+6)
MOVT	R0, #hi_addr(_Image27+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1261 :: 		Image27.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+8)
MOVT	R0, #hi_addr(_Image27+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1262 :: 		Image27.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image27+10)
MOVT	R0, #hi_addr(_Image27+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1263 :: 		Image27.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image27+12)
MOVT	R0, #hi_addr(_Image27+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1264 :: 		Image27.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image27+22)
MOVT	R0, #hi_addr(_Image27+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1265 :: 		Image27.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image27+23)
MOVT	R0, #hi_addr(_Image27+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1266 :: 		Image27.Picture_Name    = logo13_jpg;
MOVW	R1, #6536
MOVT	R1, #27
MOVW	R0, #lo_addr(_Image27+16)
MOVT	R0, #hi_addr(_Image27+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1267 :: 		Image27.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image27+20)
MOVT	R0, #hi_addr(_Image27+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1268 :: 		Image27.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image27+21)
MOVT	R0, #hi_addr(_Image27+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1269 :: 		Image27.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+24)
MOVT	R0, #hi_addr(_Image27+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1270 :: 		Image27.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+28)
MOVT	R0, #hi_addr(_Image27+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1271 :: 		Image27.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+32)
MOVT	R0, #hi_addr(_Image27+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1272 :: 		Image27.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+36)
MOVT	R0, #hi_addr(_Image27+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1274 :: 		Image28.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image28+0)
MOVT	R0, #hi_addr(_Image28+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1275 :: 		Image28.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Image28+4)
MOVT	R0, #hi_addr(_Image28+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1276 :: 		Image28.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image28+6)
MOVT	R0, #hi_addr(_Image28+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1277 :: 		Image28.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image28+8)
MOVT	R0, #hi_addr(_Image28+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1278 :: 		Image28.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image28+10)
MOVT	R0, #hi_addr(_Image28+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1279 :: 		Image28.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image28+12)
MOVT	R0, #hi_addr(_Image28+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1280 :: 		Image28.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image28+22)
MOVT	R0, #hi_addr(_Image28+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1281 :: 		Image28.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image28+23)
MOVT	R0, #hi_addr(_Image28+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1282 :: 		Image28.Picture_Name    = logo14_jpg;
MOVW	R1, #6444
MOVT	R1, #29
MOVW	R0, #lo_addr(_Image28+16)
MOVT	R0, #hi_addr(_Image28+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1283 :: 		Image28.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image28+20)
MOVT	R0, #hi_addr(_Image28+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1284 :: 		Image28.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image28+21)
MOVT	R0, #hi_addr(_Image28+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1285 :: 		Image28.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image28+24)
MOVT	R0, #hi_addr(_Image28+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1286 :: 		Image28.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image28+28)
MOVT	R0, #hi_addr(_Image28+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1287 :: 		Image28.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image28+32)
MOVT	R0, #hi_addr(_Image28+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1288 :: 		Image28.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image28+36)
MOVT	R0, #hi_addr(_Image28+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1290 :: 		Image29.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image29+0)
MOVT	R0, #hi_addr(_Image29+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1291 :: 		Image29.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Image29+4)
MOVT	R0, #hi_addr(_Image29+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1292 :: 		Image29.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image29+6)
MOVT	R0, #hi_addr(_Image29+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1293 :: 		Image29.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+8)
MOVT	R0, #hi_addr(_Image29+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1294 :: 		Image29.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image29+10)
MOVT	R0, #hi_addr(_Image29+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1295 :: 		Image29.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image29+12)
MOVT	R0, #hi_addr(_Image29+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1296 :: 		Image29.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image29+22)
MOVT	R0, #hi_addr(_Image29+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1297 :: 		Image29.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image29+23)
MOVT	R0, #hi_addr(_Image29+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1298 :: 		Image29.Picture_Name    = logo15_jpg;
MOVW	R1, #6352
MOVT	R1, #31
MOVW	R0, #lo_addr(_Image29+16)
MOVT	R0, #hi_addr(_Image29+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1299 :: 		Image29.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image29+20)
MOVT	R0, #hi_addr(_Image29+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1300 :: 		Image29.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image29+21)
MOVT	R0, #hi_addr(_Image29+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1301 :: 		Image29.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+24)
MOVT	R0, #hi_addr(_Image29+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1302 :: 		Image29.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+28)
MOVT	R0, #hi_addr(_Image29+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1303 :: 		Image29.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+32)
MOVT	R0, #hi_addr(_Image29+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1304 :: 		Image29.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+36)
MOVT	R0, #hi_addr(_Image29+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1306 :: 		Image30.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image30+0)
MOVT	R0, #hi_addr(_Image30+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1307 :: 		Image30.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Image30+4)
MOVT	R0, #hi_addr(_Image30+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1308 :: 		Image30.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image30+6)
MOVT	R0, #hi_addr(_Image30+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1309 :: 		Image30.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image30+8)
MOVT	R0, #hi_addr(_Image30+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1310 :: 		Image30.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image30+10)
MOVT	R0, #hi_addr(_Image30+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1311 :: 		Image30.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image30+12)
MOVT	R0, #hi_addr(_Image30+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1312 :: 		Image30.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image30+22)
MOVT	R0, #hi_addr(_Image30+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1313 :: 		Image30.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image30+23)
MOVT	R0, #hi_addr(_Image30+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1314 :: 		Image30.Picture_Name    = logo16_jpg;
MOVW	R1, #6260
MOVT	R1, #33
MOVW	R0, #lo_addr(_Image30+16)
MOVT	R0, #hi_addr(_Image30+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1315 :: 		Image30.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image30+20)
MOVT	R0, #hi_addr(_Image30+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1316 :: 		Image30.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image30+21)
MOVT	R0, #hi_addr(_Image30+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1317 :: 		Image30.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image30+24)
MOVT	R0, #hi_addr(_Image30+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1318 :: 		Image30.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image30+28)
MOVT	R0, #hi_addr(_Image30+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1319 :: 		Image30.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image30+32)
MOVT	R0, #hi_addr(_Image30+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1320 :: 		Image30.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image30+36)
MOVT	R0, #hi_addr(_Image30+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1322 :: 		Image31.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image31+0)
MOVT	R0, #hi_addr(_Image31+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1323 :: 		Image31.Order           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Image31+4)
MOVT	R0, #hi_addr(_Image31+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1324 :: 		Image31.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image31+6)
MOVT	R0, #hi_addr(_Image31+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1325 :: 		Image31.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image31+8)
MOVT	R0, #hi_addr(_Image31+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1326 :: 		Image31.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image31+10)
MOVT	R0, #hi_addr(_Image31+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1327 :: 		Image31.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image31+12)
MOVT	R0, #hi_addr(_Image31+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1328 :: 		Image31.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image31+22)
MOVT	R0, #hi_addr(_Image31+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1329 :: 		Image31.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image31+23)
MOVT	R0, #hi_addr(_Image31+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1330 :: 		Image31.Picture_Name    = logo17_jpg;
MOVW	R1, #6168
MOVT	R1, #35
MOVW	R0, #lo_addr(_Image31+16)
MOVT	R0, #hi_addr(_Image31+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1331 :: 		Image31.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image31+20)
MOVT	R0, #hi_addr(_Image31+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1332 :: 		Image31.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image31+21)
MOVT	R0, #hi_addr(_Image31+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1333 :: 		Image31.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image31+24)
MOVT	R0, #hi_addr(_Image31+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1334 :: 		Image31.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image31+28)
MOVT	R0, #hi_addr(_Image31+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1335 :: 		Image31.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image31+32)
MOVT	R0, #hi_addr(_Image31+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1336 :: 		Image31.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image31+36)
MOVT	R0, #hi_addr(_Image31+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1338 :: 		Image32.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image32+0)
MOVT	R0, #hi_addr(_Image32+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1339 :: 		Image32.Order           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Image32+4)
MOVT	R0, #hi_addr(_Image32+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1340 :: 		Image32.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image32+6)
MOVT	R0, #hi_addr(_Image32+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1341 :: 		Image32.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image32+8)
MOVT	R0, #hi_addr(_Image32+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1342 :: 		Image32.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image32+10)
MOVT	R0, #hi_addr(_Image32+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1343 :: 		Image32.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image32+12)
MOVT	R0, #hi_addr(_Image32+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1344 :: 		Image32.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image32+22)
MOVT	R0, #hi_addr(_Image32+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1345 :: 		Image32.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image32+23)
MOVT	R0, #hi_addr(_Image32+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1346 :: 		Image32.Picture_Name    = logo18_jpg;
MOVW	R1, #6076
MOVT	R1, #37
MOVW	R0, #lo_addr(_Image32+16)
MOVT	R0, #hi_addr(_Image32+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1347 :: 		Image32.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image32+20)
MOVT	R0, #hi_addr(_Image32+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1348 :: 		Image32.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image32+21)
MOVT	R0, #hi_addr(_Image32+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1349 :: 		Image32.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image32+24)
MOVT	R0, #hi_addr(_Image32+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1350 :: 		Image32.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image32+28)
MOVT	R0, #hi_addr(_Image32+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1351 :: 		Image32.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image32+32)
MOVT	R0, #hi_addr(_Image32+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1352 :: 		Image32.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image32+36)
MOVT	R0, #hi_addr(_Image32+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1354 :: 		Image33.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image33+0)
MOVT	R0, #hi_addr(_Image33+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1355 :: 		Image33.Order           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Image33+4)
MOVT	R0, #hi_addr(_Image33+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1356 :: 		Image33.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image33+6)
MOVT	R0, #hi_addr(_Image33+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1357 :: 		Image33.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+8)
MOVT	R0, #hi_addr(_Image33+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1358 :: 		Image33.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image33+10)
MOVT	R0, #hi_addr(_Image33+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1359 :: 		Image33.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image33+12)
MOVT	R0, #hi_addr(_Image33+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1360 :: 		Image33.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image33+22)
MOVT	R0, #hi_addr(_Image33+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1361 :: 		Image33.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image33+23)
MOVT	R0, #hi_addr(_Image33+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1362 :: 		Image33.Picture_Name    = logo19_jpg;
MOVW	R1, #5984
MOVT	R1, #39
MOVW	R0, #lo_addr(_Image33+16)
MOVT	R0, #hi_addr(_Image33+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1363 :: 		Image33.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image33+20)
MOVT	R0, #hi_addr(_Image33+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1364 :: 		Image33.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image33+21)
MOVT	R0, #hi_addr(_Image33+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1365 :: 		Image33.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+24)
MOVT	R0, #hi_addr(_Image33+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1366 :: 		Image33.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+28)
MOVT	R0, #hi_addr(_Image33+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1367 :: 		Image33.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+32)
MOVT	R0, #hi_addr(_Image33+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1368 :: 		Image33.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+36)
MOVT	R0, #hi_addr(_Image33+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1370 :: 		Image34.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image34+0)
MOVT	R0, #hi_addr(_Image34+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1371 :: 		Image34.Order           = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Image34+4)
MOVT	R0, #hi_addr(_Image34+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1372 :: 		Image34.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image34+6)
MOVT	R0, #hi_addr(_Image34+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1373 :: 		Image34.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+8)
MOVT	R0, #hi_addr(_Image34+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1374 :: 		Image34.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image34+10)
MOVT	R0, #hi_addr(_Image34+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1375 :: 		Image34.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image34+12)
MOVT	R0, #hi_addr(_Image34+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1376 :: 		Image34.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image34+22)
MOVT	R0, #hi_addr(_Image34+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1377 :: 		Image34.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image34+23)
MOVT	R0, #hi_addr(_Image34+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1378 :: 		Image34.Picture_Name    = logo20_jpg;
MOVW	R1, #5892
MOVT	R1, #41
MOVW	R0, #lo_addr(_Image34+16)
MOVT	R0, #hi_addr(_Image34+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1379 :: 		Image34.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image34+20)
MOVT	R0, #hi_addr(_Image34+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1380 :: 		Image34.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image34+21)
MOVT	R0, #hi_addr(_Image34+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1381 :: 		Image34.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+24)
MOVT	R0, #hi_addr(_Image34+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1382 :: 		Image34.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+28)
MOVT	R0, #hi_addr(_Image34+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1383 :: 		Image34.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+32)
MOVT	R0, #hi_addr(_Image34+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1384 :: 		Image34.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+36)
MOVT	R0, #hi_addr(_Image34+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1386 :: 		Image35.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image35+0)
MOVT	R0, #hi_addr(_Image35+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1387 :: 		Image35.Order           = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Image35+4)
MOVT	R0, #hi_addr(_Image35+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1388 :: 		Image35.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image35+6)
MOVT	R0, #hi_addr(_Image35+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1389 :: 		Image35.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image35+8)
MOVT	R0, #hi_addr(_Image35+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1390 :: 		Image35.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image35+10)
MOVT	R0, #hi_addr(_Image35+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1391 :: 		Image35.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image35+12)
MOVT	R0, #hi_addr(_Image35+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1392 :: 		Image35.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image35+22)
MOVT	R0, #hi_addr(_Image35+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1393 :: 		Image35.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image35+23)
MOVT	R0, #hi_addr(_Image35+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1394 :: 		Image35.Picture_Name    = logo21_jpg;
MOVW	R1, #5800
MOVT	R1, #43
MOVW	R0, #lo_addr(_Image35+16)
MOVT	R0, #hi_addr(_Image35+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1395 :: 		Image35.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image35+20)
MOVT	R0, #hi_addr(_Image35+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1396 :: 		Image35.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image35+21)
MOVT	R0, #hi_addr(_Image35+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1397 :: 		Image35.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image35+24)
MOVT	R0, #hi_addr(_Image35+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1398 :: 		Image35.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image35+28)
MOVT	R0, #hi_addr(_Image35+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1399 :: 		Image35.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image35+32)
MOVT	R0, #hi_addr(_Image35+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1400 :: 		Image35.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image35+36)
MOVT	R0, #hi_addr(_Image35+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1402 :: 		Image36.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image36+0)
MOVT	R0, #hi_addr(_Image36+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1403 :: 		Image36.Order           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image36+4)
MOVT	R0, #hi_addr(_Image36+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1404 :: 		Image36.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image36+6)
MOVT	R0, #hi_addr(_Image36+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1405 :: 		Image36.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image36+8)
MOVT	R0, #hi_addr(_Image36+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1406 :: 		Image36.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image36+10)
MOVT	R0, #hi_addr(_Image36+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1407 :: 		Image36.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image36+12)
MOVT	R0, #hi_addr(_Image36+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1408 :: 		Image36.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image36+22)
MOVT	R0, #hi_addr(_Image36+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1409 :: 		Image36.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image36+23)
MOVT	R0, #hi_addr(_Image36+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1410 :: 		Image36.Picture_Name    = logo22_jpg;
MOVW	R1, #5708
MOVT	R1, #45
MOVW	R0, #lo_addr(_Image36+16)
MOVT	R0, #hi_addr(_Image36+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1411 :: 		Image36.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image36+20)
MOVT	R0, #hi_addr(_Image36+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1412 :: 		Image36.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image36+21)
MOVT	R0, #hi_addr(_Image36+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1413 :: 		Image36.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image36+24)
MOVT	R0, #hi_addr(_Image36+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1414 :: 		Image36.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image36+28)
MOVT	R0, #hi_addr(_Image36+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1415 :: 		Image36.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image36+32)
MOVT	R0, #hi_addr(_Image36+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1416 :: 		Image36.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image36+36)
MOVT	R0, #hi_addr(_Image36+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1418 :: 		Image37.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image37+0)
MOVT	R0, #hi_addr(_Image37+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1419 :: 		Image37.Order           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Image37+4)
MOVT	R0, #hi_addr(_Image37+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1420 :: 		Image37.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image37+6)
MOVT	R0, #hi_addr(_Image37+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1421 :: 		Image37.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image37+8)
MOVT	R0, #hi_addr(_Image37+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1422 :: 		Image37.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image37+10)
MOVT	R0, #hi_addr(_Image37+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1423 :: 		Image37.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image37+12)
MOVT	R0, #hi_addr(_Image37+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1424 :: 		Image37.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image37+22)
MOVT	R0, #hi_addr(_Image37+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1425 :: 		Image37.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image37+23)
MOVT	R0, #hi_addr(_Image37+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1426 :: 		Image37.Picture_Name    = logo23_jpg;
MOVW	R1, #5616
MOVT	R1, #47
MOVW	R0, #lo_addr(_Image37+16)
MOVT	R0, #hi_addr(_Image37+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1427 :: 		Image37.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image37+20)
MOVT	R0, #hi_addr(_Image37+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1428 :: 		Image37.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image37+21)
MOVT	R0, #hi_addr(_Image37+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1429 :: 		Image37.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image37+24)
MOVT	R0, #hi_addr(_Image37+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1430 :: 		Image37.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image37+28)
MOVT	R0, #hi_addr(_Image37+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1431 :: 		Image37.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image37+32)
MOVT	R0, #hi_addr(_Image37+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1432 :: 		Image37.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image37+36)
MOVT	R0, #hi_addr(_Image37+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1434 :: 		Image38.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image38+0)
MOVT	R0, #hi_addr(_Image38+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1435 :: 		Image38.Order           = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Image38+4)
MOVT	R0, #hi_addr(_Image38+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1436 :: 		Image38.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image38+6)
MOVT	R0, #hi_addr(_Image38+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1437 :: 		Image38.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image38+8)
MOVT	R0, #hi_addr(_Image38+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1438 :: 		Image38.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image38+10)
MOVT	R0, #hi_addr(_Image38+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1439 :: 		Image38.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image38+12)
MOVT	R0, #hi_addr(_Image38+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1440 :: 		Image38.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image38+22)
MOVT	R0, #hi_addr(_Image38+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1441 :: 		Image38.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image38+23)
MOVT	R0, #hi_addr(_Image38+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1442 :: 		Image38.Picture_Name    = logo24_jpg;
MOVW	R1, #5524
MOVT	R1, #49
MOVW	R0, #lo_addr(_Image38+16)
MOVT	R0, #hi_addr(_Image38+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1443 :: 		Image38.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image38+20)
MOVT	R0, #hi_addr(_Image38+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1444 :: 		Image38.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image38+21)
MOVT	R0, #hi_addr(_Image38+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1445 :: 		Image38.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image38+24)
MOVT	R0, #hi_addr(_Image38+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1446 :: 		Image38.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image38+28)
MOVT	R0, #hi_addr(_Image38+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1447 :: 		Image38.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image38+32)
MOVT	R0, #hi_addr(_Image38+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1448 :: 		Image38.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image38+36)
MOVT	R0, #hi_addr(_Image38+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1450 :: 		Image39.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image39+0)
MOVT	R0, #hi_addr(_Image39+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1451 :: 		Image39.Order           = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Image39+4)
MOVT	R0, #hi_addr(_Image39+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1452 :: 		Image39.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image39+6)
MOVT	R0, #hi_addr(_Image39+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1453 :: 		Image39.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+8)
MOVT	R0, #hi_addr(_Image39+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1454 :: 		Image39.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image39+10)
MOVT	R0, #hi_addr(_Image39+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1455 :: 		Image39.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image39+12)
MOVT	R0, #hi_addr(_Image39+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1456 :: 		Image39.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image39+22)
MOVT	R0, #hi_addr(_Image39+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1457 :: 		Image39.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image39+23)
MOVT	R0, #hi_addr(_Image39+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1458 :: 		Image39.Picture_Name    = logo25_jpg;
MOVW	R1, #5432
MOVT	R1, #51
MOVW	R0, #lo_addr(_Image39+16)
MOVT	R0, #hi_addr(_Image39+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1459 :: 		Image39.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image39+20)
MOVT	R0, #hi_addr(_Image39+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1460 :: 		Image39.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image39+21)
MOVT	R0, #hi_addr(_Image39+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1461 :: 		Image39.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+24)
MOVT	R0, #hi_addr(_Image39+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1462 :: 		Image39.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+28)
MOVT	R0, #hi_addr(_Image39+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1463 :: 		Image39.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+32)
MOVT	R0, #hi_addr(_Image39+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1464 :: 		Image39.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+36)
MOVT	R0, #hi_addr(_Image39+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1466 :: 		Label19.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Label19+0)
MOVT	R0, #hi_addr(_Label19+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1467 :: 		Label19.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label19+4)
MOVT	R0, #hi_addr(_Label19+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1468 :: 		Label19.Left            = 365;
MOVW	R1, #365
MOVW	R0, #lo_addr(_Label19+6)
MOVT	R0, #hi_addr(_Label19+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1469 :: 		Label19.Top             = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label19+8)
MOVT	R0, #hi_addr(_Label19+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1470 :: 		Label19.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_Label19+10)
MOVT	R0, #hi_addr(_Label19+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1471 :: 		Label19.Height          = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label19+12)
MOVT	R0, #hi_addr(_Label19+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1472 :: 		Label19.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label19+26)
MOVT	R0, #hi_addr(_Label19+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1473 :: 		Label19.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label19+27)
MOVT	R0, #hi_addr(_Label19+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1474 :: 		Label19.Caption         = Label19_Caption;
MOVW	R1, #lo_addr(_Label19_Caption+0)
MOVT	R1, #hi_addr(_Label19_Caption+0)
MOVW	R0, #lo_addr(_Label19+16)
MOVT	R0, #hi_addr(_Label19+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1475 :: 		Label19.FontName        = Arial_Black21x30_Regular;
MOVW	R1, #8609
MOVW	R0, #lo_addr(_Label19+20)
MOVT	R0, #hi_addr(_Label19+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1476 :: 		Label19.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label19+24)
MOVT	R0, #hi_addr(_Label19+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1477 :: 		Label19.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+28)
MOVT	R0, #hi_addr(_Label19+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1478 :: 		Label19.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+32)
MOVT	R0, #hi_addr(_Label19+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1479 :: 		Label19.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+36)
MOVT	R0, #hi_addr(_Label19+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1480 :: 		Label19.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+40)
MOVT	R0, #hi_addr(_Label19+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1482 :: 		Image15.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Image15+0)
MOVT	R0, #hi_addr(_Image15+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1483 :: 		Image15.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image15+4)
MOVT	R0, #hi_addr(_Image15+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1484 :: 		Image15.Left            = 432;
MOVW	R1, #432
MOVW	R0, #lo_addr(_Image15+6)
MOVT	R0, #hi_addr(_Image15+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1485 :: 		Image15.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image15+8)
MOVT	R0, #hi_addr(_Image15+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1486 :: 		Image15.Width           = 44;
MOVS	R1, #44
MOVW	R0, #lo_addr(_Image15+10)
MOVT	R0, #hi_addr(_Image15+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1487 :: 		Image15.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Image15+12)
MOVT	R0, #hi_addr(_Image15+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1488 :: 		Image15.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+22)
MOVT	R0, #hi_addr(_Image15+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1489 :: 		Image15.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image15+23)
MOVT	R0, #hi_addr(_Image15+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1490 :: 		Image15.Picture_Name    = icon_battery_bmp;
MOVW	R1, #4322
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image15+16)
MOVT	R0, #hi_addr(_Image15+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1491 :: 		Image15.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image15+20)
MOVT	R0, #hi_addr(_Image15+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1492 :: 		Image15.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+21)
MOVT	R0, #hi_addr(_Image15+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1493 :: 		Image15.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+24)
MOVT	R0, #hi_addr(_Image15+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1494 :: 		Image15.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+28)
MOVT	R0, #hi_addr(_Image15+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1495 :: 		Image15.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+32)
MOVT	R0, #hi_addr(_Image15+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1496 :: 		Image15.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+36)
MOVT	R0, #hi_addr(_Image15+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1498 :: 		Image3.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Image3+0)
MOVT	R0, #hi_addr(_Image3+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1499 :: 		Image3.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Image3+4)
MOVT	R0, #hi_addr(_Image3+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1500 :: 		Image3.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+6)
MOVT	R0, #hi_addr(_Image3+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1501 :: 		Image3.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+8)
MOVT	R0, #hi_addr(_Image3+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1502 :: 		Image3.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image3+10)
MOVT	R0, #hi_addr(_Image3+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1503 :: 		Image3.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image3+12)
MOVT	R0, #hi_addr(_Image3+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1504 :: 		Image3.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+22)
MOVT	R0, #hi_addr(_Image3+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1505 :: 		Image3.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+23)
MOVT	R0, #hi_addr(_Image3+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1506 :: 		Image3.Picture_Name    = WaterTemperatureIcon_jpg;
MOVW	R1, #6088
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image3+16)
MOVT	R0, #hi_addr(_Image3+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1507 :: 		Image3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+20)
MOVT	R0, #hi_addr(_Image3+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1508 :: 		Image3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+21)
MOVT	R0, #hi_addr(_Image3+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1509 :: 		Image3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+24)
MOVT	R0, #hi_addr(_Image3+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1510 :: 		Image3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+28)
MOVT	R0, #hi_addr(_Image3+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1511 :: 		Image3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+32)
MOVT	R0, #hi_addr(_Image3+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1512 :: 		Image3.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+36)
MOVT	R0, #hi_addr(_Image3+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1514 :: 		Image4.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Image4+0)
MOVT	R0, #hi_addr(_Image4+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1515 :: 		Image4.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Image4+4)
MOVT	R0, #hi_addr(_Image4+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1516 :: 		Image4.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+6)
MOVT	R0, #hi_addr(_Image4+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1517 :: 		Image4.Top             = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Image4+8)
MOVT	R0, #hi_addr(_Image4+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1518 :: 		Image4.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image4+10)
MOVT	R0, #hi_addr(_Image4+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1519 :: 		Image4.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image4+12)
MOVT	R0, #hi_addr(_Image4+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1520 :: 		Image4.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+22)
MOVT	R0, #hi_addr(_Image4+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1521 :: 		Image4.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+23)
MOVT	R0, #hi_addr(_Image4+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1522 :: 		Image4.Picture_Name    = fuel_jpg;
MOVW	R1, #11094
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image4+16)
MOVT	R0, #hi_addr(_Image4+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1523 :: 		Image4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+20)
MOVT	R0, #hi_addr(_Image4+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1524 :: 		Image4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+21)
MOVT	R0, #hi_addr(_Image4+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1525 :: 		Image4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+24)
MOVT	R0, #hi_addr(_Image4+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1526 :: 		Image4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+28)
MOVT	R0, #hi_addr(_Image4+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1527 :: 		Image4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+32)
MOVT	R0, #hi_addr(_Image4+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1528 :: 		Image4.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+36)
MOVT	R0, #hi_addr(_Image4+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1530 :: 		Image5.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Image5+0)
MOVT	R0, #hi_addr(_Image5+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1531 :: 		Image5.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image5+4)
MOVT	R0, #hi_addr(_Image5+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1532 :: 		Image5.Left            = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Image5+6)
MOVT	R0, #hi_addr(_Image5+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1533 :: 		Image5.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+8)
MOVT	R0, #hi_addr(_Image5+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1534 :: 		Image5.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image5+10)
MOVT	R0, #hi_addr(_Image5+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1535 :: 		Image5.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image5+12)
MOVT	R0, #hi_addr(_Image5+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1536 :: 		Image5.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+22)
MOVT	R0, #hi_addr(_Image5+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1537 :: 		Image5.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+23)
MOVT	R0, #hi_addr(_Image5+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1538 :: 		Image5.Picture_Name    = HeadlightIcon_jpg;
MOVW	R1, #16100
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image5+16)
MOVT	R0, #hi_addr(_Image5+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1539 :: 		Image5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+20)
MOVT	R0, #hi_addr(_Image5+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1540 :: 		Image5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+21)
MOVT	R0, #hi_addr(_Image5+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1541 :: 		Image5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+24)
MOVT	R0, #hi_addr(_Image5+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1542 :: 		Image5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+28)
MOVT	R0, #hi_addr(_Image5+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1543 :: 		Image5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+32)
MOVT	R0, #hi_addr(_Image5+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1544 :: 		Image5.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+36)
MOVT	R0, #hi_addr(_Image5+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1546 :: 		Image6.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Image6+0)
MOVT	R0, #hi_addr(_Image6+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1547 :: 		Image6.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image6+4)
MOVT	R0, #hi_addr(_Image6+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1548 :: 		Image6.Left            = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Image6+6)
MOVT	R0, #hi_addr(_Image6+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1549 :: 		Image6.Top             = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Image6+8)
MOVT	R0, #hi_addr(_Image6+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1550 :: 		Image6.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image6+10)
MOVT	R0, #hi_addr(_Image6+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1551 :: 		Image6.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image6+12)
MOVT	R0, #hi_addr(_Image6+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1552 :: 		Image6.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+22)
MOVT	R0, #hi_addr(_Image6+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1553 :: 		Image6.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+23)
MOVT	R0, #hi_addr(_Image6+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1554 :: 		Image6.Picture_Name    = OilAlertIcon_jpg;
MOVW	R1, #21106
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image6+16)
MOVT	R0, #hi_addr(_Image6+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1555 :: 		Image6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+20)
MOVT	R0, #hi_addr(_Image6+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1556 :: 		Image6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+21)
MOVT	R0, #hi_addr(_Image6+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1557 :: 		Image6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image6+24)
MOVT	R0, #hi_addr(_Image6+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1558 :: 		Image6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image6+28)
MOVT	R0, #hi_addr(_Image6+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1559 :: 		Image6.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image6+32)
MOVT	R0, #hi_addr(_Image6+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1560 :: 		Image6.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image6+36)
MOVT	R0, #hi_addr(_Image6+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1562 :: 		Image7.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Image7+0)
MOVT	R0, #hi_addr(_Image7+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1563 :: 		Image7.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Image7+4)
MOVT	R0, #hi_addr(_Image7+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1564 :: 		Image7.Left            = 429;
MOVW	R1, #429
MOVW	R0, #lo_addr(_Image7+6)
MOVT	R0, #hi_addr(_Image7+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1565 :: 		Image7.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_Image7+8)
MOVT	R0, #hi_addr(_Image7+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1566 :: 		Image7.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image7+10)
MOVT	R0, #hi_addr(_Image7+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1567 :: 		Image7.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image7+12)
MOVT	R0, #hi_addr(_Image7+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1568 :: 		Image7.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image7+22)
MOVT	R0, #hi_addr(_Image7+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1569 :: 		Image7.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image7+23)
MOVT	R0, #hi_addr(_Image7+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1570 :: 		Image7.Picture_Name    = Settings_icon_JPG;
MOVW	R1, #26112
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image7+16)
MOVT	R0, #hi_addr(_Image7+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1571 :: 		Image7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image7+20)
MOVT	R0, #hi_addr(_Image7+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1572 :: 		Image7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image7+21)
MOVT	R0, #hi_addr(_Image7+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1573 :: 		Image7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+24)
MOVT	R0, #hi_addr(_Image7+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1574 :: 		Image7.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+28)
MOVT	R0, #hi_addr(_Image7+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1575 :: 		Image7.OnClickPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Image7+32)
MOVT	R0, #hi_addr(_Image7+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1576 :: 		Image7.OnPressPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Image7+36)
MOVT	R0, #hi_addr(_Image7+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1578 :: 		Image8.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Image8+0)
MOVT	R0, #hi_addr(_Image8+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1579 :: 		Image8.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Image8+4)
MOVT	R0, #hi_addr(_Image8+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1580 :: 		Image8.Left            = 55;
MOVS	R1, #55
MOVW	R0, #lo_addr(_Image8+6)
MOVT	R0, #hi_addr(_Image8+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1581 :: 		Image8.Top             = 116;
MOVS	R1, #116
MOVW	R0, #lo_addr(_Image8+8)
MOVT	R0, #hi_addr(_Image8+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1582 :: 		Image8.Width           = 51;
MOVS	R1, #51
MOVW	R0, #lo_addr(_Image8+10)
MOVT	R0, #hi_addr(_Image8+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1583 :: 		Image8.Height          = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Image8+12)
MOVT	R0, #hi_addr(_Image8+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1584 :: 		Image8.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image8+22)
MOVT	R0, #hi_addr(_Image8+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1585 :: 		Image8.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image8+23)
MOVT	R0, #hi_addr(_Image8+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1586 :: 		Image8.Picture_Name    = red_left_arrow_103_jpg;
MOVW	R1, #31118
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image8+16)
MOVT	R0, #hi_addr(_Image8+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1587 :: 		Image8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image8+20)
MOVT	R0, #hi_addr(_Image8+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1588 :: 		Image8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image8+21)
MOVT	R0, #hi_addr(_Image8+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1589 :: 		Image8.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+24)
MOVT	R0, #hi_addr(_Image8+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1590 :: 		Image8.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+28)
MOVT	R0, #hi_addr(_Image8+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1591 :: 		Image8.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+32)
MOVT	R0, #hi_addr(_Image8+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1592 :: 		Image8.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+36)
MOVT	R0, #hi_addr(_Image8+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1594 :: 		Image9.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Image9+0)
MOVT	R0, #hi_addr(_Image9+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1595 :: 		Image9.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Image9+4)
MOVT	R0, #hi_addr(_Image9+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1596 :: 		Image9.Left            = 373;
MOVW	R1, #373
MOVW	R0, #lo_addr(_Image9+6)
MOVT	R0, #hi_addr(_Image9+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1597 :: 		Image9.Top             = 116;
MOVS	R1, #116
MOVW	R0, #lo_addr(_Image9+8)
MOVT	R0, #hi_addr(_Image9+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1598 :: 		Image9.Width           = 51;
MOVS	R1, #51
MOVW	R0, #lo_addr(_Image9+10)
MOVT	R0, #hi_addr(_Image9+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1599 :: 		Image9.Height          = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Image9+12)
MOVT	R0, #hi_addr(_Image9+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1600 :: 		Image9.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image9+22)
MOVT	R0, #hi_addr(_Image9+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1601 :: 		Image9.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image9+23)
MOVT	R0, #hi_addr(_Image9+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1602 :: 		Image9.Picture_Name    = red_left_arrow_copy_jpg;
MOVW	R1, #35102
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image9+16)
MOVT	R0, #hi_addr(_Image9+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1603 :: 		Image9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image9+20)
MOVT	R0, #hi_addr(_Image9+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1604 :: 		Image9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image9+21)
MOVT	R0, #hi_addr(_Image9+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1605 :: 		Image9.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image9+24)
MOVT	R0, #hi_addr(_Image9+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1606 :: 		Image9.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image9+28)
MOVT	R0, #hi_addr(_Image9+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1607 :: 		Image9.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image9+32)
MOVT	R0, #hi_addr(_Image9+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1608 :: 		Image9.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image9+36)
MOVT	R0, #hi_addr(_Image9+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1610 :: 		Label10.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Label10+0)
MOVT	R0, #hi_addr(_Label10+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1611 :: 		Label10.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label10+4)
MOVT	R0, #hi_addr(_Label10+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1612 :: 		Label10.Left            = 373;
MOVW	R1, #373
MOVW	R0, #lo_addr(_Label10+6)
MOVT	R0, #hi_addr(_Label10+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1613 :: 		Label10.Top             = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Label10+8)
MOVT	R0, #hi_addr(_Label10+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1614 :: 		Label10.Width           = 56;
MOVS	R1, #56
MOVW	R0, #lo_addr(_Label10+10)
MOVT	R0, #hi_addr(_Label10+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1615 :: 		Label10.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label10+12)
MOVT	R0, #hi_addr(_Label10+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1616 :: 		Label10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+26)
MOVT	R0, #hi_addr(_Label10+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1617 :: 		Label10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+27)
MOVT	R0, #hi_addr(_Label10+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1618 :: 		Label10.Caption         = Label10_Caption;
MOVW	R1, #lo_addr(_Label10_Caption+0)
MOVT	R1, #hi_addr(_Label10_Caption+0)
MOVW	R0, #lo_addr(_Label10+16)
MOVT	R0, #hi_addr(_Label10+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1619 :: 		Label10.FontName        = Arial_Black16x23_Regular;
MOVW	R1, #2595
MOVW	R0, #lo_addr(_Label10+20)
MOVT	R0, #hi_addr(_Label10+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1620 :: 		Label10.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label10+24)
MOVT	R0, #hi_addr(_Label10+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1621 :: 		Label10.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+28)
MOVT	R0, #hi_addr(_Label10+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1622 :: 		Label10.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+32)
MOVT	R0, #hi_addr(_Label10+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1623 :: 		Label10.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+36)
MOVT	R0, #hi_addr(_Label10+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1624 :: 		Label10.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+40)
MOVT	R0, #hi_addr(_Label10+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1626 :: 		Label11.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Label11+0)
MOVT	R0, #hi_addr(_Label11+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1627 :: 		Label11.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Label11+4)
MOVT	R0, #hi_addr(_Label11+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1628 :: 		Label11.Left            = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label11+6)
MOVT	R0, #hi_addr(_Label11+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1629 :: 		Label11.Top             = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label11+8)
MOVT	R0, #hi_addr(_Label11+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1630 :: 		Label11.Width           = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Label11+10)
MOVT	R0, #hi_addr(_Label11+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1631 :: 		Label11.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label11+12)
MOVT	R0, #hi_addr(_Label11+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1632 :: 		Label11.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label11+26)
MOVT	R0, #hi_addr(_Label11+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1633 :: 		Label11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label11+27)
MOVT	R0, #hi_addr(_Label11+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1634 :: 		Label11.Caption         = Label11_Caption;
MOVW	R1, #lo_addr(_Label11_Caption+0)
MOVT	R1, #hi_addr(_Label11_Caption+0)
MOVW	R0, #lo_addr(_Label11+16)
MOVT	R0, #hi_addr(_Label11+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1635 :: 		Label11.FontName        = Arial_Black11x15_Regular;
MOVW	R1, #44297
MOVW	R0, #lo_addr(_Label11+20)
MOVT	R0, #hi_addr(_Label11+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1636 :: 		Label11.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label11+24)
MOVT	R0, #hi_addr(_Label11+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1637 :: 		Label11.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+28)
MOVT	R0, #hi_addr(_Label11+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1638 :: 		Label11.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+32)
MOVT	R0, #hi_addr(_Label11+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1639 :: 		Label11.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+36)
MOVT	R0, #hi_addr(_Label11+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1640 :: 		Label11.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+40)
MOVT	R0, #hi_addr(_Label11+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1642 :: 		CircleButton1.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_CircleButton1+0)
MOVT	R0, #hi_addr(_CircleButton1+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1643 :: 		CircleButton1.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_CircleButton1+4)
MOVT	R0, #hi_addr(_CircleButton1+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1644 :: 		CircleButton1.Left            = 216;
MOVS	R1, #216
MOVW	R0, #lo_addr(_CircleButton1+6)
MOVT	R0, #hi_addr(_CircleButton1+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1645 :: 		CircleButton1.Top             = 112;
MOVS	R1, #112
MOVW	R0, #lo_addr(_CircleButton1+8)
MOVT	R0, #hi_addr(_CircleButton1+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1646 :: 		CircleButton1.Radius          = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_CircleButton1+10)
MOVT	R0, #hi_addr(_CircleButton1+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1647 :: 		CircleButton1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+12)
MOVT	R0, #hi_addr(_CircleButton1+12)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1648 :: 		CircleButton1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+14)
MOVT	R0, #hi_addr(_CircleButton1+14)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1649 :: 		CircleButton1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+16)
MOVT	R0, #hi_addr(_CircleButton1+16)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1650 :: 		CircleButton1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+17)
MOVT	R0, #hi_addr(_CircleButton1+17)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1651 :: 		CircleButton1.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+18)
MOVT	R0, #hi_addr(_CircleButton1+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1652 :: 		CircleButton1.Caption         = CircleButton1_Caption;
MOVW	R1, #lo_addr(_CircleButton1_Caption+0)
MOVT	R1, #hi_addr(_CircleButton1_Caption+0)
MOVW	R0, #lo_addr(_CircleButton1+20)
MOVT	R0, #hi_addr(_CircleButton1+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1653 :: 		CircleButton1.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+24)
MOVT	R0, #hi_addr(_CircleButton1+24)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1654 :: 		CircleButton1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #6053
MOVT	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+28)
MOVT	R0, #hi_addr(_CircleButton1+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1655 :: 		CircleButton1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+42)
MOVT	R0, #hi_addr(_CircleButton1+42)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1656 :: 		CircleButton1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+32)
MOVT	R0, #hi_addr(_CircleButton1+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1657 :: 		CircleButton1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+34)
MOVT	R0, #hi_addr(_CircleButton1+34)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1658 :: 		CircleButton1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+35)
MOVT	R0, #hi_addr(_CircleButton1+35)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1659 :: 		CircleButton1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_CircleButton1+36)
MOVT	R0, #hi_addr(_CircleButton1+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1660 :: 		CircleButton1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CircleButton1+38)
MOVT	R0, #hi_addr(_CircleButton1+38)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1661 :: 		CircleButton1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CircleButton1+40)
MOVT	R0, #hi_addr(_CircleButton1+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1662 :: 		CircleButton1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_CircleButton1+44)
MOVT	R0, #hi_addr(_CircleButton1+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1663 :: 		CircleButton1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+48)
MOVT	R0, #hi_addr(_CircleButton1+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1664 :: 		CircleButton1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+52)
MOVT	R0, #hi_addr(_CircleButton1+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1665 :: 		CircleButton1.OnClickPtr      = doNextScreen;
MOVW	R1, #lo_addr(_doNextScreen+0)
MOVT	R1, #hi_addr(_doNextScreen+0)
MOVW	R0, #lo_addr(_CircleButton1+56)
MOVT	R0, #hi_addr(_CircleButton1+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1666 :: 		CircleButton1.OnPressPtr      = doNextScreen;
MOVW	R1, #lo_addr(_doNextScreen+0)
MOVT	R1, #hi_addr(_doNextScreen+0)
MOVW	R0, #lo_addr(_CircleButton1+60)
MOVT	R0, #hi_addr(_CircleButton1+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1668 :: 		Label12.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Label12+0)
MOVT	R0, #hi_addr(_Label12+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1669 :: 		Label12.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label12+4)
MOVT	R0, #hi_addr(_Label12+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1670 :: 		Label12.Left            = 33;
MOVS	R1, #33
MOVW	R0, #lo_addr(_Label12+6)
MOVT	R0, #hi_addr(_Label12+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1671 :: 		Label12.Top             = 189;
MOVS	R1, #189
MOVW	R0, #lo_addr(_Label12+8)
MOVT	R0, #hi_addr(_Label12+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1672 :: 		Label12.Width           = 68;
MOVS	R1, #68
MOVW	R0, #lo_addr(_Label12+10)
MOVT	R0, #hi_addr(_Label12+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1673 :: 		Label12.Height          = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_Label12+12)
MOVT	R0, #hi_addr(_Label12+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1674 :: 		Label12.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label12+26)
MOVT	R0, #hi_addr(_Label12+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1675 :: 		Label12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label12+27)
MOVT	R0, #hi_addr(_Label12+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1676 :: 		Label12.Caption         = Label12_Caption;
MOVW	R1, #lo_addr(_Label12_Caption+0)
MOVT	R1, #hi_addr(_Label12_Caption+0)
MOVW	R0, #lo_addr(_Label12+16)
MOVT	R0, #hi_addr(_Label12+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1677 :: 		Label12.FontName        = Arial_Black27x38_Regular;
MOVW	R1, #14431
MOVW	R0, #lo_addr(_Label12+20)
MOVT	R0, #hi_addr(_Label12+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1678 :: 		Label12.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label12+24)
MOVT	R0, #hi_addr(_Label12+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1679 :: 		Label12.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+28)
MOVT	R0, #hi_addr(_Label12+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1680 :: 		Label12.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+32)
MOVT	R0, #hi_addr(_Label12+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1681 :: 		Label12.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+36)
MOVT	R0, #hi_addr(_Label12+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1682 :: 		Label12.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+40)
MOVT	R0, #hi_addr(_Label12+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1684 :: 		Label13.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Label13+0)
MOVT	R0, #hi_addr(_Label13+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1685 :: 		Label13.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label13+4)
MOVT	R0, #hi_addr(_Label13+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1686 :: 		Label13.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+6)
MOVT	R0, #hi_addr(_Label13+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1687 :: 		Label13.Top             = 213;
MOVS	R1, #213
MOVW	R0, #lo_addr(_Label13+8)
MOVT	R0, #hi_addr(_Label13+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1688 :: 		Label13.Width           = 148;
MOVS	R1, #148
MOVW	R0, #lo_addr(_Label13+10)
MOVT	R0, #hi_addr(_Label13+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1689 :: 		Label13.Height          = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Label13+12)
MOVT	R0, #hi_addr(_Label13+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1690 :: 		Label13.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label13+26)
MOVT	R0, #hi_addr(_Label13+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1691 :: 		Label13.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label13+27)
MOVT	R0, #hi_addr(_Label13+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1692 :: 		Label13.Caption         = Label13_Caption;
MOVW	R1, #lo_addr(_Label13_Caption+0)
MOVT	R1, #hi_addr(_Label13_Caption+0)
MOVW	R0, #lo_addr(_Label13+16)
MOVT	R0, #hi_addr(_Label13+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1693 :: 		Label13.FontName        = Arial_Black43x60_Regular;
MOVW	R1, #23145
MOVW	R0, #lo_addr(_Label13+20)
MOVT	R0, #hi_addr(_Label13+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1694 :: 		Label13.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label13+24)
MOVT	R0, #hi_addr(_Label13+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1695 :: 		Label13.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+28)
MOVT	R0, #hi_addr(_Label13+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1696 :: 		Label13.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+32)
MOVT	R0, #hi_addr(_Label13+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1697 :: 		Label13.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+36)
MOVT	R0, #hi_addr(_Label13+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1698 :: 		Label13.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+40)
MOVT	R0, #hi_addr(_Label13+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1700 :: 		Box2.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Box2+0)
MOVT	R0, #hi_addr(_Box2+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1701 :: 		Box2.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Box2+4)
MOVT	R0, #hi_addr(_Box2+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1702 :: 		Box2.Left            = 350;
MOVW	R1, #350
MOVW	R0, #lo_addr(_Box2+6)
MOVT	R0, #hi_addr(_Box2+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1703 :: 		Box2.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_Box2+8)
MOVT	R0, #hi_addr(_Box2+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1704 :: 		Box2.Width           = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_Box2+10)
MOVT	R0, #hi_addr(_Box2+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1705 :: 		Box2.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Box2+12)
MOVT	R0, #hi_addr(_Box2+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1706 :: 		Box2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+14)
MOVT	R0, #hi_addr(_Box2+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1707 :: 		Box2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+16)
MOVT	R0, #hi_addr(_Box2+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1708 :: 		Box2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+18)
MOVT	R0, #hi_addr(_Box2+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1709 :: 		Box2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+19)
MOVT	R0, #hi_addr(_Box2+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1710 :: 		Box2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+20)
MOVT	R0, #hi_addr(_Box2+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1711 :: 		Box2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+21)
MOVT	R0, #hi_addr(_Box2+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1712 :: 		Box2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+22)
MOVT	R0, #hi_addr(_Box2+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1713 :: 		Box2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box2+24)
MOVT	R0, #hi_addr(_Box2+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1714 :: 		Box2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box2+26)
MOVT	R0, #hi_addr(_Box2+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1715 :: 		Box2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box2+28)
MOVT	R0, #hi_addr(_Box2+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1716 :: 		Box2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+30)
MOVT	R0, #hi_addr(_Box2+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1717 :: 		Box2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box2+32)
MOVT	R0, #hi_addr(_Box2+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1718 :: 		Box2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+36)
MOVT	R0, #hi_addr(_Box2+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1719 :: 		Box2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+40)
MOVT	R0, #hi_addr(_Box2+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1720 :: 		Box2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+44)
MOVT	R0, #hi_addr(_Box2+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1721 :: 		Box2.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+48)
MOVT	R0, #hi_addr(_Box2+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1723 :: 		Label14.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Label14+0)
MOVT	R0, #hi_addr(_Label14+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1724 :: 		Label14.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label14+4)
MOVT	R0, #hi_addr(_Label14+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1725 :: 		Label14.Left            = 358;
MOVW	R1, #358
MOVW	R0, #lo_addr(_Label14+6)
MOVT	R0, #hi_addr(_Label14+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1726 :: 		Label14.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_Label14+8)
MOVT	R0, #hi_addr(_Label14+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1727 :: 		Label14.Width           = 62;
MOVS	R1, #62
MOVW	R0, #lo_addr(_Label14+10)
MOVT	R0, #hi_addr(_Label14+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1728 :: 		Label14.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label14+12)
MOVT	R0, #hi_addr(_Label14+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1729 :: 		Label14.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label14+26)
MOVT	R0, #hi_addr(_Label14+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1730 :: 		Label14.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label14+27)
MOVT	R0, #hi_addr(_Label14+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1731 :: 		Label14.Caption         = Label14_Caption;
MOVW	R1, #lo_addr(_Label14_Caption+0)
MOVT	R1, #hi_addr(_Label14_Caption+0)
MOVW	R0, #lo_addr(_Label14+16)
MOVT	R0, #hi_addr(_Label14+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1732 :: 		Label14.FontName        = Arial_Black11x15_Regular;
MOVW	R1, #44297
MOVW	R0, #lo_addr(_Label14+20)
MOVT	R0, #hi_addr(_Label14+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1733 :: 		Label14.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+24)
MOVT	R0, #hi_addr(_Label14+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1734 :: 		Label14.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+28)
MOVT	R0, #hi_addr(_Label14+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1735 :: 		Label14.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+32)
MOVT	R0, #hi_addr(_Label14+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1736 :: 		Label14.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+36)
MOVT	R0, #hi_addr(_Label14+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1737 :: 		Label14.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+40)
MOVT	R0, #hi_addr(_Label14+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1739 :: 		Label15.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Label15+0)
MOVT	R0, #hi_addr(_Label15+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1740 :: 		Label15.Order           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label15+4)
MOVT	R0, #hi_addr(_Label15+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1741 :: 		Label15.Left            = 198;
MOVS	R1, #198
MOVW	R0, #lo_addr(_Label15+6)
MOVT	R0, #hi_addr(_Label15+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1742 :: 		Label15.Top             = 203;
MOVS	R1, #203
MOVW	R0, #lo_addr(_Label15+8)
MOVT	R0, #hi_addr(_Label15+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1743 :: 		Label15.Width           = 86;
MOVS	R1, #86
MOVW	R0, #lo_addr(_Label15+10)
MOVT	R0, #hi_addr(_Label15+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1744 :: 		Label15.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label15+12)
MOVT	R0, #hi_addr(_Label15+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1745 :: 		Label15.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label15+26)
MOVT	R0, #hi_addr(_Label15+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1746 :: 		Label15.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label15+27)
MOVT	R0, #hi_addr(_Label15+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1747 :: 		Label15.Caption         = Label15_Caption;
MOVW	R1, #lo_addr(_Label15_Caption+0)
MOVT	R1, #hi_addr(_Label15_Caption+0)
MOVW	R0, #lo_addr(_Label15+16)
MOVT	R0, #hi_addr(_Label15+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1748 :: 		Label15.FontName        = Arial_Black16x23_Regular;
MOVW	R1, #2595
MOVW	R0, #lo_addr(_Label15+20)
MOVT	R0, #hi_addr(_Label15+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1749 :: 		Label15.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+24)
MOVT	R0, #hi_addr(_Label15+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1750 :: 		Label15.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+28)
MOVT	R0, #hi_addr(_Label15+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1751 :: 		Label15.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+32)
MOVT	R0, #hi_addr(_Label15+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1752 :: 		Label15.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+36)
MOVT	R0, #hi_addr(_Label15+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1753 :: 		Label15.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+40)
MOVT	R0, #hi_addr(_Label15+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1755 :: 		Label16.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Label16+0)
MOVT	R0, #hi_addr(_Label16+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1756 :: 		Label16.Order           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Label16+4)
MOVT	R0, #hi_addr(_Label16+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1757 :: 		Label16.Left            = 218;
MOVS	R1, #218
MOVW	R0, #lo_addr(_Label16+6)
MOVT	R0, #hi_addr(_Label16+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1758 :: 		Label16.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_Label16+8)
MOVT	R0, #hi_addr(_Label16+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1759 :: 		Label16.Width           = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_Label16+10)
MOVT	R0, #hi_addr(_Label16+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1760 :: 		Label16.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label16+12)
MOVT	R0, #hi_addr(_Label16+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1761 :: 		Label16.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label16+26)
MOVT	R0, #hi_addr(_Label16+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1762 :: 		Label16.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label16+27)
MOVT	R0, #hi_addr(_Label16+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1763 :: 		Label16.Caption         = Label16_Caption;
MOVW	R1, #lo_addr(_Label16_Caption+0)
MOVT	R1, #hi_addr(_Label16_Caption+0)
MOVW	R0, #lo_addr(_Label16+16)
MOVT	R0, #hi_addr(_Label16+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1764 :: 		Label16.FontName        = Arial_Black11x15_Regular;
MOVW	R1, #44297
MOVW	R0, #lo_addr(_Label16+20)
MOVT	R0, #hi_addr(_Label16+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1765 :: 		Label16.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+24)
MOVT	R0, #hi_addr(_Label16+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1766 :: 		Label16.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+28)
MOVT	R0, #hi_addr(_Label16+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1767 :: 		Label16.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+32)
MOVT	R0, #hi_addr(_Label16+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1768 :: 		Label16.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+36)
MOVT	R0, #hi_addr(_Label16+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1769 :: 		Label16.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+40)
MOVT	R0, #hi_addr(_Label16+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1771 :: 		Label17.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Label17+0)
MOVT	R0, #hi_addr(_Label17+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1772 :: 		Label17.Order           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Label17+4)
MOVT	R0, #hi_addr(_Label17+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1773 :: 		Label17.Left            = 195;
MOVS	R1, #195
MOVW	R0, #lo_addr(_Label17+6)
MOVT	R0, #hi_addr(_Label17+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1774 :: 		Label17.Top             = 192;
MOVS	R1, #192
MOVW	R0, #lo_addr(_Label17+8)
MOVT	R0, #hi_addr(_Label17+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1775 :: 		Label17.Width           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label17+10)
MOVT	R0, #hi_addr(_Label17+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1776 :: 		Label17.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label17+12)
MOVT	R0, #hi_addr(_Label17+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1777 :: 		Label17.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label17+26)
MOVT	R0, #hi_addr(_Label17+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1778 :: 		Label17.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label17+27)
MOVT	R0, #hi_addr(_Label17+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1779 :: 		Label17.Caption         = Label17_Caption;
MOVW	R1, #lo_addr(_Label17_Caption+0)
MOVT	R1, #hi_addr(_Label17_Caption+0)
MOVW	R0, #lo_addr(_Label17+16)
MOVT	R0, #hi_addr(_Label17+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1780 :: 		Label17.FontName        = Arial_Black11x15_Regular;
MOVW	R1, #44297
MOVW	R0, #lo_addr(_Label17+20)
MOVT	R0, #hi_addr(_Label17+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1781 :: 		Label17.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+24)
MOVT	R0, #hi_addr(_Label17+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1782 :: 		Label17.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+28)
MOVT	R0, #hi_addr(_Label17+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1783 :: 		Label17.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+32)
MOVT	R0, #hi_addr(_Label17+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1784 :: 		Label17.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+36)
MOVT	R0, #hi_addr(_Label17+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1785 :: 		Label17.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+40)
MOVT	R0, #hi_addr(_Label17+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1787 :: 		Line1.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Line1+0)
MOVT	R0, #hi_addr(_Line1+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1788 :: 		Line1.Order           = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Line1+4)
MOVT	R0, #hi_addr(_Line1+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1789 :: 		Line1.First_Point_X   = 238;
MOVS	R1, #238
MOVW	R0, #lo_addr(_Line1+6)
MOVT	R0, #hi_addr(_Line1+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1790 :: 		Line1.First_Point_Y   = 135;
MOVS	R1, #135
MOVW	R0, #lo_addr(_Line1+8)
MOVT	R0, #hi_addr(_Line1+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1791 :: 		Line1.Second_Point_X  = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_Line1+10)
MOVT	R0, #hi_addr(_Line1+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1792 :: 		Line1.Second_Point_Y  = 214;
MOVS	R1, #214
MOVW	R0, #lo_addr(_Line1+12)
MOVT	R0, #hi_addr(_Line1+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1793 :: 		Line1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Line1+15)
MOVT	R0, #hi_addr(_Line1+15)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1794 :: 		Line1.Pen_Width       = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Line1+14)
MOVT	R0, #hi_addr(_Line1+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1795 :: 		Line1.Color           = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Line1+16)
MOVT	R0, #hi_addr(_Line1+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1797 :: 		Label18.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Label18+0)
MOVT	R0, #hi_addr(_Label18+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1798 :: 		Label18.Order           = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label18+4)
MOVT	R0, #hi_addr(_Label18+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1799 :: 		Label18.Left            = 222;
MOVS	R1, #222
MOVW	R0, #lo_addr(_Label18+6)
MOVT	R0, #hi_addr(_Label18+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1800 :: 		Label18.Top             = 103;
MOVS	R1, #103
MOVW	R0, #lo_addr(_Label18+8)
MOVT	R0, #hi_addr(_Label18+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1801 :: 		Label18.Width           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Label18+10)
MOVT	R0, #hi_addr(_Label18+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1802 :: 		Label18.Height          = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Label18+12)
MOVT	R0, #hi_addr(_Label18+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1803 :: 		Label18.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label18+26)
MOVT	R0, #hi_addr(_Label18+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1804 :: 		Label18.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label18+27)
MOVT	R0, #hi_addr(_Label18+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1805 :: 		Label18.Caption         = Label18_Caption;
MOVW	R1, #lo_addr(_Label18_Caption+0)
MOVT	R1, #hi_addr(_Label18_Caption+0)
MOVW	R0, #lo_addr(_Label18+16)
MOVT	R0, #hi_addr(_Label18+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1806 :: 		Label18.FontName        = Arial_Black43x60_Regular;
MOVW	R1, #23145
MOVW	R0, #lo_addr(_Label18+20)
MOVT	R0, #hi_addr(_Label18+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1807 :: 		Label18.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_Label18+24)
MOVT	R0, #hi_addr(_Label18+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1808 :: 		Label18.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+28)
MOVT	R0, #hi_addr(_Label18+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1809 :: 		Label18.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+32)
MOVT	R0, #hi_addr(_Label18+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1810 :: 		Label18.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+36)
MOVT	R0, #hi_addr(_Label18+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1811 :: 		Label18.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+40)
MOVT	R0, #hi_addr(_Label18+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1813 :: 		ButtonRound8.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_ButtonRound8+0)
MOVT	R0, #hi_addr(_ButtonRound8+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1814 :: 		ButtonRound8.Order           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_ButtonRound8+4)
MOVT	R0, #hi_addr(_ButtonRound8+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1815 :: 		ButtonRound8.Left            = 378;
MOVW	R1, #378
MOVW	R0, #lo_addr(_ButtonRound8+6)
MOVT	R0, #hi_addr(_ButtonRound8+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1816 :: 		ButtonRound8.Top             = 165;
MOVS	R1, #165
MOVW	R0, #lo_addr(_ButtonRound8+8)
MOVT	R0, #hi_addr(_ButtonRound8+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1817 :: 		ButtonRound8.Width           = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_ButtonRound8+10)
MOVT	R0, #hi_addr(_ButtonRound8+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1818 :: 		ButtonRound8.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_ButtonRound8+12)
MOVT	R0, #hi_addr(_ButtonRound8+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1819 :: 		ButtonRound8.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+14)
MOVT	R0, #hi_addr(_ButtonRound8+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1820 :: 		ButtonRound8.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+16)
MOVT	R0, #hi_addr(_ButtonRound8+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1821 :: 		ButtonRound8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+18)
MOVT	R0, #hi_addr(_ButtonRound8+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1822 :: 		ButtonRound8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+19)
MOVT	R0, #hi_addr(_ButtonRound8+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1823 :: 		ButtonRound8.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+20)
MOVT	R0, #hi_addr(_ButtonRound8+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1824 :: 		ButtonRound8.Caption         = ButtonRound8_Caption;
MOVW	R1, #lo_addr(_ButtonRound8_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound8_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound8+24)
MOVT	R0, #hi_addr(_ButtonRound8+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1825 :: 		ButtonRound8.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+28)
MOVT	R0, #hi_addr(_ButtonRound8+28)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1826 :: 		ButtonRound8.FontName        = Arial_Black11x15_Regular;
MOVW	R1, #44297
MOVW	R0, #lo_addr(_ButtonRound8+32)
MOVT	R0, #hi_addr(_ButtonRound8+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1827 :: 		ButtonRound8.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+47)
MOVT	R0, #hi_addr(_ButtonRound8+47)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1828 :: 		ButtonRound8.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+36)
MOVT	R0, #hi_addr(_ButtonRound8+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1829 :: 		ButtonRound8.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+38)
MOVT	R0, #hi_addr(_ButtonRound8+38)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1830 :: 		ButtonRound8.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+39)
MOVT	R0, #hi_addr(_ButtonRound8+39)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1831 :: 		ButtonRound8.Gradient_Start_Color = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_ButtonRound8+40)
MOVT	R0, #hi_addr(_ButtonRound8+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1832 :: 		ButtonRound8.Gradient_End_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+42)
MOVT	R0, #hi_addr(_ButtonRound8+42)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1833 :: 		ButtonRound8.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound8+44)
MOVT	R0, #hi_addr(_ButtonRound8+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1834 :: 		ButtonRound8.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound8+48)
MOVT	R0, #hi_addr(_ButtonRound8+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1835 :: 		ButtonRound8.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound8+46)
MOVT	R0, #hi_addr(_ButtonRound8+46)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1836 :: 		ButtonRound8.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+52)
MOVT	R0, #hi_addr(_ButtonRound8+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1837 :: 		ButtonRound8.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+56)
MOVT	R0, #hi_addr(_ButtonRound8+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1838 :: 		ButtonRound8.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+60)
MOVT	R0, #hi_addr(_ButtonRound8+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1839 :: 		ButtonRound8.OnPressPtr      = doLog;
MOVW	R1, #lo_addr(_doLog+0)
MOVT	R1, #hi_addr(_doLog+0)
MOVW	R0, #lo_addr(_ButtonRound8+64)
MOVT	R0, #hi_addr(_ButtonRound8+64)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1841 :: 		Image40.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Image40+0)
MOVT	R0, #hi_addr(_Image40+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1842 :: 		Image40.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image40+4)
MOVT	R0, #hi_addr(_Image40+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1843 :: 		Image40.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image40+6)
MOVT	R0, #hi_addr(_Image40+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1844 :: 		Image40.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image40+8)
MOVT	R0, #hi_addr(_Image40+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1845 :: 		Image40.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image40+10)
MOVT	R0, #hi_addr(_Image40+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1846 :: 		Image40.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image40+12)
MOVT	R0, #hi_addr(_Image40+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1847 :: 		Image40.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image40+22)
MOVT	R0, #hi_addr(_Image40+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1848 :: 		Image40.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image40+23)
MOVT	R0, #hi_addr(_Image40+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1849 :: 		Image40.Picture_Name    = WaterTemperatureIcon_jpg;
MOVW	R1, #6088
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image40+16)
MOVT	R0, #hi_addr(_Image40+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1850 :: 		Image40.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image40+20)
MOVT	R0, #hi_addr(_Image40+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1851 :: 		Image40.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image40+21)
MOVT	R0, #hi_addr(_Image40+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1852 :: 		Image40.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image40+24)
MOVT	R0, #hi_addr(_Image40+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1853 :: 		Image40.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image40+28)
MOVT	R0, #hi_addr(_Image40+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1854 :: 		Image40.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image40+32)
MOVT	R0, #hi_addr(_Image40+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1855 :: 		Image40.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image40+36)
MOVT	R0, #hi_addr(_Image40+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1857 :: 		Image41.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Image41+0)
MOVT	R0, #hi_addr(_Image41+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1858 :: 		Image41.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image41+4)
MOVT	R0, #hi_addr(_Image41+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1859 :: 		Image41.Left            = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Image41+6)
MOVT	R0, #hi_addr(_Image41+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1860 :: 		Image41.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image41+8)
MOVT	R0, #hi_addr(_Image41+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1861 :: 		Image41.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image41+10)
MOVT	R0, #hi_addr(_Image41+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1862 :: 		Image41.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image41+12)
MOVT	R0, #hi_addr(_Image41+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1863 :: 		Image41.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image41+22)
MOVT	R0, #hi_addr(_Image41+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1864 :: 		Image41.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image41+23)
MOVT	R0, #hi_addr(_Image41+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1865 :: 		Image41.Picture_Name    = HeadlightIcon_jpg;
MOVW	R1, #16100
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image41+16)
MOVT	R0, #hi_addr(_Image41+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1866 :: 		Image41.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image41+20)
MOVT	R0, #hi_addr(_Image41+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1867 :: 		Image41.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image41+21)
MOVT	R0, #hi_addr(_Image41+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1868 :: 		Image41.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image41+24)
MOVT	R0, #hi_addr(_Image41+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1869 :: 		Image41.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image41+28)
MOVT	R0, #hi_addr(_Image41+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1870 :: 		Image41.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image41+32)
MOVT	R0, #hi_addr(_Image41+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1871 :: 		Image41.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image41+36)
MOVT	R0, #hi_addr(_Image41+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1873 :: 		Image42.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Image42+0)
MOVT	R0, #hi_addr(_Image42+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1874 :: 		Image42.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Image42+4)
MOVT	R0, #hi_addr(_Image42+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1875 :: 		Image42.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image42+6)
MOVT	R0, #hi_addr(_Image42+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1876 :: 		Image42.Top             = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Image42+8)
MOVT	R0, #hi_addr(_Image42+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1877 :: 		Image42.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image42+10)
MOVT	R0, #hi_addr(_Image42+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1878 :: 		Image42.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image42+12)
MOVT	R0, #hi_addr(_Image42+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1879 :: 		Image42.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image42+22)
MOVT	R0, #hi_addr(_Image42+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1880 :: 		Image42.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image42+23)
MOVT	R0, #hi_addr(_Image42+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1881 :: 		Image42.Picture_Name    = fuel_jpg;
MOVW	R1, #11094
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image42+16)
MOVT	R0, #hi_addr(_Image42+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1882 :: 		Image42.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image42+20)
MOVT	R0, #hi_addr(_Image42+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1883 :: 		Image42.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image42+21)
MOVT	R0, #hi_addr(_Image42+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1884 :: 		Image42.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image42+24)
MOVT	R0, #hi_addr(_Image42+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1885 :: 		Image42.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image42+28)
MOVT	R0, #hi_addr(_Image42+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1886 :: 		Image42.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image42+32)
MOVT	R0, #hi_addr(_Image42+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1887 :: 		Image42.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image42+36)
MOVT	R0, #hi_addr(_Image42+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1889 :: 		Image43.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Image43+0)
MOVT	R0, #hi_addr(_Image43+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1890 :: 		Image43.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Image43+4)
MOVT	R0, #hi_addr(_Image43+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1891 :: 		Image43.Left            = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Image43+6)
MOVT	R0, #hi_addr(_Image43+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1892 :: 		Image43.Top             = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Image43+8)
MOVT	R0, #hi_addr(_Image43+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1893 :: 		Image43.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image43+10)
MOVT	R0, #hi_addr(_Image43+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1894 :: 		Image43.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image43+12)
MOVT	R0, #hi_addr(_Image43+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1895 :: 		Image43.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image43+22)
MOVT	R0, #hi_addr(_Image43+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1896 :: 		Image43.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image43+23)
MOVT	R0, #hi_addr(_Image43+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1897 :: 		Image43.Picture_Name    = OilAlertIcon_jpg;
MOVW	R1, #21106
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image43+16)
MOVT	R0, #hi_addr(_Image43+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1898 :: 		Image43.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image43+20)
MOVT	R0, #hi_addr(_Image43+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1899 :: 		Image43.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image43+21)
MOVT	R0, #hi_addr(_Image43+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1900 :: 		Image43.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image43+24)
MOVT	R0, #hi_addr(_Image43+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1901 :: 		Image43.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image43+28)
MOVT	R0, #hi_addr(_Image43+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1902 :: 		Image43.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image43+32)
MOVT	R0, #hi_addr(_Image43+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1903 :: 		Image43.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image43+36)
MOVT	R0, #hi_addr(_Image43+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1905 :: 		Image44.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Image44+0)
MOVT	R0, #hi_addr(_Image44+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1906 :: 		Image44.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image44+4)
MOVT	R0, #hi_addr(_Image44+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1907 :: 		Image44.Left            = 55;
MOVS	R1, #55
MOVW	R0, #lo_addr(_Image44+6)
MOVT	R0, #hi_addr(_Image44+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1908 :: 		Image44.Top             = 116;
MOVS	R1, #116
MOVW	R0, #lo_addr(_Image44+8)
MOVT	R0, #hi_addr(_Image44+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1909 :: 		Image44.Width           = 51;
MOVS	R1, #51
MOVW	R0, #lo_addr(_Image44+10)
MOVT	R0, #hi_addr(_Image44+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1910 :: 		Image44.Height          = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Image44+12)
MOVT	R0, #hi_addr(_Image44+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1911 :: 		Image44.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image44+22)
MOVT	R0, #hi_addr(_Image44+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1912 :: 		Image44.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image44+23)
MOVT	R0, #hi_addr(_Image44+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1913 :: 		Image44.Picture_Name    = red_left_arrow_103_jpg;
MOVW	R1, #31118
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image44+16)
MOVT	R0, #hi_addr(_Image44+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1914 :: 		Image44.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image44+20)
MOVT	R0, #hi_addr(_Image44+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1915 :: 		Image44.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image44+21)
MOVT	R0, #hi_addr(_Image44+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1916 :: 		Image44.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image44+24)
MOVT	R0, #hi_addr(_Image44+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1917 :: 		Image44.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image44+28)
MOVT	R0, #hi_addr(_Image44+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1918 :: 		Image44.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image44+32)
MOVT	R0, #hi_addr(_Image44+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1919 :: 		Image44.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image44+36)
MOVT	R0, #hi_addr(_Image44+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1921 :: 		Image45.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Image45+0)
MOVT	R0, #hi_addr(_Image45+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1922 :: 		Image45.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image45+4)
MOVT	R0, #hi_addr(_Image45+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1923 :: 		Image45.Left            = 373;
MOVW	R1, #373
MOVW	R0, #lo_addr(_Image45+6)
MOVT	R0, #hi_addr(_Image45+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1924 :: 		Image45.Top             = 116;
MOVS	R1, #116
MOVW	R0, #lo_addr(_Image45+8)
MOVT	R0, #hi_addr(_Image45+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1925 :: 		Image45.Width           = 51;
MOVS	R1, #51
MOVW	R0, #lo_addr(_Image45+10)
MOVT	R0, #hi_addr(_Image45+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1926 :: 		Image45.Height          = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Image45+12)
MOVT	R0, #hi_addr(_Image45+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1927 :: 		Image45.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image45+22)
MOVT	R0, #hi_addr(_Image45+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1928 :: 		Image45.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image45+23)
MOVT	R0, #hi_addr(_Image45+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1929 :: 		Image45.Picture_Name    = red_left_arrow_copy_jpg;
MOVW	R1, #35102
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image45+16)
MOVT	R0, #hi_addr(_Image45+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1930 :: 		Image45.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image45+20)
MOVT	R0, #hi_addr(_Image45+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1931 :: 		Image45.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image45+21)
MOVT	R0, #hi_addr(_Image45+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1932 :: 		Image45.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image45+24)
MOVT	R0, #hi_addr(_Image45+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1933 :: 		Image45.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image45+28)
MOVT	R0, #hi_addr(_Image45+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1934 :: 		Image45.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image45+32)
MOVT	R0, #hi_addr(_Image45+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1935 :: 		Image45.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image45+36)
MOVT	R0, #hi_addr(_Image45+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1937 :: 		Label20.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Label20+0)
MOVT	R0, #hi_addr(_Label20+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1938 :: 		Label20.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label20+4)
MOVT	R0, #hi_addr(_Label20+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1939 :: 		Label20.Left            = 33;
MOVS	R1, #33
MOVW	R0, #lo_addr(_Label20+6)
MOVT	R0, #hi_addr(_Label20+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1940 :: 		Label20.Top             = 189;
MOVS	R1, #189
MOVW	R0, #lo_addr(_Label20+8)
MOVT	R0, #hi_addr(_Label20+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1941 :: 		Label20.Width           = 69;
MOVS	R1, #69
MOVW	R0, #lo_addr(_Label20+10)
MOVT	R0, #hi_addr(_Label20+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1942 :: 		Label20.Height          = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_Label20+12)
MOVT	R0, #hi_addr(_Label20+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1943 :: 		Label20.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label20+26)
MOVT	R0, #hi_addr(_Label20+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1944 :: 		Label20.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label20+27)
MOVT	R0, #hi_addr(_Label20+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1945 :: 		Label20.Caption         = Label20_Caption;
MOVW	R1, #lo_addr(_Label20_Caption+0)
MOVT	R1, #hi_addr(_Label20_Caption+0)
MOVW	R0, #lo_addr(_Label20+16)
MOVT	R0, #hi_addr(_Label20+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1946 :: 		Label20.FontName        = Arial_Black27x38_Regular;
MOVW	R1, #14431
MOVW	R0, #lo_addr(_Label20+20)
MOVT	R0, #hi_addr(_Label20+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1947 :: 		Label20.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label20+24)
MOVT	R0, #hi_addr(_Label20+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1948 :: 		Label20.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+28)
MOVT	R0, #hi_addr(_Label20+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1949 :: 		Label20.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+32)
MOVT	R0, #hi_addr(_Label20+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1950 :: 		Label20.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+36)
MOVT	R0, #hi_addr(_Label20+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1951 :: 		Label20.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+40)
MOVT	R0, #hi_addr(_Label20+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1953 :: 		Label21.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Label21+0)
MOVT	R0, #hi_addr(_Label21+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1954 :: 		Label21.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Label21+4)
MOVT	R0, #hi_addr(_Label21+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1955 :: 		Label21.Left            = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Label21+6)
MOVT	R0, #hi_addr(_Label21+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1956 :: 		Label21.Top             = 213;
MOVS	R1, #213
MOVW	R0, #lo_addr(_Label21+8)
MOVT	R0, #hi_addr(_Label21+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1957 :: 		Label21.Width           = 89;
MOVS	R1, #89
MOVW	R0, #lo_addr(_Label21+10)
MOVT	R0, #hi_addr(_Label21+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1958 :: 		Label21.Height          = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Label21+12)
MOVT	R0, #hi_addr(_Label21+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1959 :: 		Label21.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label21+26)
MOVT	R0, #hi_addr(_Label21+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1960 :: 		Label21.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label21+27)
MOVT	R0, #hi_addr(_Label21+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1961 :: 		Label21.Caption         = Label21_Caption;
MOVW	R1, #lo_addr(_Label21_Caption+0)
MOVT	R1, #hi_addr(_Label21_Caption+0)
MOVW	R0, #lo_addr(_Label21+16)
MOVT	R0, #hi_addr(_Label21+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1962 :: 		Label21.FontName        = Arial_Black43x60_Regular;
MOVW	R1, #23145
MOVW	R0, #lo_addr(_Label21+20)
MOVT	R0, #hi_addr(_Label21+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1963 :: 		Label21.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label21+24)
MOVT	R0, #hi_addr(_Label21+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1964 :: 		Label21.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+28)
MOVT	R0, #hi_addr(_Label21+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1965 :: 		Label21.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+32)
MOVT	R0, #hi_addr(_Label21+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1966 :: 		Label21.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+36)
MOVT	R0, #hi_addr(_Label21+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1967 :: 		Label21.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+40)
MOVT	R0, #hi_addr(_Label21+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1969 :: 		Label22.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Label22+0)
MOVT	R0, #hi_addr(_Label22+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1970 :: 		Label22.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label22+4)
MOVT	R0, #hi_addr(_Label22+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1971 :: 		Label22.Left            = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label22+6)
MOVT	R0, #hi_addr(_Label22+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1972 :: 		Label22.Top             = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label22+8)
MOVT	R0, #hi_addr(_Label22+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1973 :: 		Label22.Width           = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Label22+10)
MOVT	R0, #hi_addr(_Label22+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1974 :: 		Label22.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label22+12)
MOVT	R0, #hi_addr(_Label22+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1975 :: 		Label22.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label22+26)
MOVT	R0, #hi_addr(_Label22+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1976 :: 		Label22.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label22+27)
MOVT	R0, #hi_addr(_Label22+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1977 :: 		Label22.Caption         = Label22_Caption;
MOVW	R1, #lo_addr(_Label22_Caption+0)
MOVT	R1, #hi_addr(_Label22_Caption+0)
MOVW	R0, #lo_addr(_Label22+16)
MOVT	R0, #hi_addr(_Label22+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1978 :: 		Label22.FontName        = Arial_Black11x15_Regular;
MOVW	R1, #44297
MOVW	R0, #lo_addr(_Label22+20)
MOVT	R0, #hi_addr(_Label22+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1979 :: 		Label22.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label22+24)
MOVT	R0, #hi_addr(_Label22+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1980 :: 		Label22.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+28)
MOVT	R0, #hi_addr(_Label22+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1981 :: 		Label22.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+32)
MOVT	R0, #hi_addr(_Label22+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1982 :: 		Label22.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+36)
MOVT	R0, #hi_addr(_Label22+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1983 :: 		Label22.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+40)
MOVT	R0, #hi_addr(_Label22+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1985 :: 		Box12.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Box12+0)
MOVT	R0, #hi_addr(_Box12+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1986 :: 		Box12.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Box12+4)
MOVT	R0, #hi_addr(_Box12+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1987 :: 		Box12.Left            = 350;
MOVW	R1, #350
MOVW	R0, #lo_addr(_Box12+6)
MOVT	R0, #hi_addr(_Box12+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1988 :: 		Box12.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_Box12+8)
MOVT	R0, #hi_addr(_Box12+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1989 :: 		Box12.Width           = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_Box12+10)
MOVT	R0, #hi_addr(_Box12+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1990 :: 		Box12.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Box12+12)
MOVT	R0, #hi_addr(_Box12+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1991 :: 		Box12.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box12+14)
MOVT	R0, #hi_addr(_Box12+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1992 :: 		Box12.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+16)
MOVT	R0, #hi_addr(_Box12+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1993 :: 		Box12.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box12+18)
MOVT	R0, #hi_addr(_Box12+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1994 :: 		Box12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box12+19)
MOVT	R0, #hi_addr(_Box12+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1995 :: 		Box12.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box12+20)
MOVT	R0, #hi_addr(_Box12+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1996 :: 		Box12.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box12+21)
MOVT	R0, #hi_addr(_Box12+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1997 :: 		Box12.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+22)
MOVT	R0, #hi_addr(_Box12+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1998 :: 		Box12.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box12+24)
MOVT	R0, #hi_addr(_Box12+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1999 :: 		Box12.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box12+26)
MOVT	R0, #hi_addr(_Box12+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2000 :: 		Box12.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box12+28)
MOVT	R0, #hi_addr(_Box12+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2001 :: 		Box12.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box12+30)
MOVT	R0, #hi_addr(_Box12+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2002 :: 		Box12.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box12+32)
MOVT	R0, #hi_addr(_Box12+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2003 :: 		Box12.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+36)
MOVT	R0, #hi_addr(_Box12+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2004 :: 		Box12.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+40)
MOVT	R0, #hi_addr(_Box12+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2005 :: 		Box12.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+44)
MOVT	R0, #hi_addr(_Box12+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2006 :: 		Box12.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+48)
MOVT	R0, #hi_addr(_Box12+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2008 :: 		Label23.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Label23+0)
MOVT	R0, #hi_addr(_Label23+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2009 :: 		Label23.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Label23+4)
MOVT	R0, #hi_addr(_Label23+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2010 :: 		Label23.Left            = 353;
MOVW	R1, #353
MOVW	R0, #lo_addr(_Label23+6)
MOVT	R0, #hi_addr(_Label23+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2011 :: 		Label23.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_Label23+8)
MOVT	R0, #hi_addr(_Label23+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2012 :: 		Label23.Width           = 69;
MOVS	R1, #69
MOVW	R0, #lo_addr(_Label23+10)
MOVT	R0, #hi_addr(_Label23+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2013 :: 		Label23.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label23+12)
MOVT	R0, #hi_addr(_Label23+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2014 :: 		Label23.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label23+26)
MOVT	R0, #hi_addr(_Label23+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2015 :: 		Label23.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label23+27)
MOVT	R0, #hi_addr(_Label23+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2016 :: 		Label23.Caption         = Label23_Caption;
MOVW	R1, #lo_addr(_Label23_Caption+0)
MOVT	R1, #hi_addr(_Label23_Caption+0)
MOVW	R0, #lo_addr(_Label23+16)
MOVT	R0, #hi_addr(_Label23+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2017 :: 		Label23.FontName        = Arial_Black11x15_Regular;
MOVW	R1, #44297
MOVW	R0, #lo_addr(_Label23+20)
MOVT	R0, #hi_addr(_Label23+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2018 :: 		Label23.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+24)
MOVT	R0, #hi_addr(_Label23+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2019 :: 		Label23.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+28)
MOVT	R0, #hi_addr(_Label23+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2020 :: 		Label23.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+32)
MOVT	R0, #hi_addr(_Label23+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2021 :: 		Label23.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+36)
MOVT	R0, #hi_addr(_Label23+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2022 :: 		Label23.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+40)
MOVT	R0, #hi_addr(_Label23+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2024 :: 		Image46.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Image46+0)
MOVT	R0, #hi_addr(_Image46+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2025 :: 		Image46.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Image46+4)
MOVT	R0, #hi_addr(_Image46+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2026 :: 		Image46.Left            = 429;
MOVW	R1, #429
MOVW	R0, #lo_addr(_Image46+6)
MOVT	R0, #hi_addr(_Image46+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2027 :: 		Image46.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_Image46+8)
MOVT	R0, #hi_addr(_Image46+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2028 :: 		Image46.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image46+10)
MOVT	R0, #hi_addr(_Image46+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2029 :: 		Image46.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image46+12)
MOVT	R0, #hi_addr(_Image46+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2030 :: 		Image46.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image46+22)
MOVT	R0, #hi_addr(_Image46+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2031 :: 		Image46.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image46+23)
MOVT	R0, #hi_addr(_Image46+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2032 :: 		Image46.Picture_Name    = Settings_icon_JPG;
MOVW	R1, #26112
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image46+16)
MOVT	R0, #hi_addr(_Image46+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2033 :: 		Image46.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image46+20)
MOVT	R0, #hi_addr(_Image46+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2034 :: 		Image46.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image46+21)
MOVT	R0, #hi_addr(_Image46+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2035 :: 		Image46.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image46+24)
MOVT	R0, #hi_addr(_Image46+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2036 :: 		Image46.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image46+28)
MOVT	R0, #hi_addr(_Image46+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2037 :: 		Image46.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image46+32)
MOVT	R0, #hi_addr(_Image46+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2038 :: 		Image46.OnPressPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Image46+36)
MOVT	R0, #hi_addr(_Image46+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2040 :: 		ButtonRound9.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_ButtonRound9+0)
MOVT	R0, #hi_addr(_ButtonRound9+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2041 :: 		ButtonRound9.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_ButtonRound9+4)
MOVT	R0, #hi_addr(_ButtonRound9+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2042 :: 		ButtonRound9.Left            = 378;
MOVW	R1, #378
MOVW	R0, #lo_addr(_ButtonRound9+6)
MOVT	R0, #hi_addr(_ButtonRound9+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2043 :: 		ButtonRound9.Top             = 165;
MOVS	R1, #165
MOVW	R0, #lo_addr(_ButtonRound9+8)
MOVT	R0, #hi_addr(_ButtonRound9+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2044 :: 		ButtonRound9.Width           = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_ButtonRound9+10)
MOVT	R0, #hi_addr(_ButtonRound9+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2045 :: 		ButtonRound9.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_ButtonRound9+12)
MOVT	R0, #hi_addr(_ButtonRound9+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2046 :: 		ButtonRound9.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+14)
MOVT	R0, #hi_addr(_ButtonRound9+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2047 :: 		ButtonRound9.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+16)
MOVT	R0, #hi_addr(_ButtonRound9+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2048 :: 		ButtonRound9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+18)
MOVT	R0, #hi_addr(_ButtonRound9+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2049 :: 		ButtonRound9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+19)
MOVT	R0, #hi_addr(_ButtonRound9+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2050 :: 		ButtonRound9.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+20)
MOVT	R0, #hi_addr(_ButtonRound9+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2051 :: 		ButtonRound9.Caption         = ButtonRound9_Caption;
MOVW	R1, #lo_addr(_ButtonRound9_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound9_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound9+24)
MOVT	R0, #hi_addr(_ButtonRound9+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2052 :: 		ButtonRound9.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+28)
MOVT	R0, #hi_addr(_ButtonRound9+28)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2053 :: 		ButtonRound9.FontName        = Arial_Black11x15_Regular;
MOVW	R1, #44297
MOVW	R0, #lo_addr(_ButtonRound9+32)
MOVT	R0, #hi_addr(_ButtonRound9+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2054 :: 		ButtonRound9.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+47)
MOVT	R0, #hi_addr(_ButtonRound9+47)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2055 :: 		ButtonRound9.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+36)
MOVT	R0, #hi_addr(_ButtonRound9+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2056 :: 		ButtonRound9.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+38)
MOVT	R0, #hi_addr(_ButtonRound9+38)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2057 :: 		ButtonRound9.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+39)
MOVT	R0, #hi_addr(_ButtonRound9+39)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2058 :: 		ButtonRound9.Gradient_Start_Color = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_ButtonRound9+40)
MOVT	R0, #hi_addr(_ButtonRound9+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2059 :: 		ButtonRound9.Gradient_End_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+42)
MOVT	R0, #hi_addr(_ButtonRound9+42)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2060 :: 		ButtonRound9.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound9+44)
MOVT	R0, #hi_addr(_ButtonRound9+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2061 :: 		ButtonRound9.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound9+48)
MOVT	R0, #hi_addr(_ButtonRound9+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2062 :: 		ButtonRound9.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound9+46)
MOVT	R0, #hi_addr(_ButtonRound9+46)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2063 :: 		ButtonRound9.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+52)
MOVT	R0, #hi_addr(_ButtonRound9+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2064 :: 		ButtonRound9.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+56)
MOVT	R0, #hi_addr(_ButtonRound9+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2065 :: 		ButtonRound9.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+60)
MOVT	R0, #hi_addr(_ButtonRound9+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2066 :: 		ButtonRound9.OnPressPtr      = doLog;
MOVW	R1, #lo_addr(_doLog+0)
MOVT	R1, #hi_addr(_doLog+0)
MOVW	R0, #lo_addr(_ButtonRound9+64)
MOVT	R0, #hi_addr(_ButtonRound9+64)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2068 :: 		Label24.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Label24+0)
MOVT	R0, #hi_addr(_Label24+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2069 :: 		Label24.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label24+4)
MOVT	R0, #hi_addr(_Label24+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2070 :: 		Label24.Left            = 373;
MOVW	R1, #373
MOVW	R0, #lo_addr(_Label24+6)
MOVT	R0, #hi_addr(_Label24+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2071 :: 		Label24.Top             = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Label24+8)
MOVT	R0, #hi_addr(_Label24+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2072 :: 		Label24.Width           = 56;
MOVS	R1, #56
MOVW	R0, #lo_addr(_Label24+10)
MOVT	R0, #hi_addr(_Label24+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2073 :: 		Label24.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label24+12)
MOVT	R0, #hi_addr(_Label24+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2074 :: 		Label24.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label24+26)
MOVT	R0, #hi_addr(_Label24+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2075 :: 		Label24.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label24+27)
MOVT	R0, #hi_addr(_Label24+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2076 :: 		Label24.Caption         = Label24_Caption;
MOVW	R1, #lo_addr(_Label24_Caption+0)
MOVT	R1, #hi_addr(_Label24_Caption+0)
MOVW	R0, #lo_addr(_Label24+16)
MOVT	R0, #hi_addr(_Label24+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2077 :: 		Label24.FontName        = Arial_Black16x23_Regular;
MOVW	R1, #2595
MOVW	R0, #lo_addr(_Label24+20)
MOVT	R0, #hi_addr(_Label24+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2078 :: 		Label24.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label24+24)
MOVT	R0, #hi_addr(_Label24+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2079 :: 		Label24.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+28)
MOVT	R0, #hi_addr(_Label24+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2080 :: 		Label24.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+32)
MOVT	R0, #hi_addr(_Label24+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2081 :: 		Label24.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+36)
MOVT	R0, #hi_addr(_Label24+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2082 :: 		Label24.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+40)
MOVT	R0, #hi_addr(_Label24+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2084 :: 		Label25.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Label25+0)
MOVT	R0, #hi_addr(_Label25+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2085 :: 		Label25.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label25+4)
MOVT	R0, #hi_addr(_Label25+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2086 :: 		Label25.Left            = 365;
MOVW	R1, #365
MOVW	R0, #lo_addr(_Label25+6)
MOVT	R0, #hi_addr(_Label25+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2087 :: 		Label25.Top             = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label25+8)
MOVT	R0, #hi_addr(_Label25+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2088 :: 		Label25.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_Label25+10)
MOVT	R0, #hi_addr(_Label25+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2089 :: 		Label25.Height          = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label25+12)
MOVT	R0, #hi_addr(_Label25+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2090 :: 		Label25.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label25+26)
MOVT	R0, #hi_addr(_Label25+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2091 :: 		Label25.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label25+27)
MOVT	R0, #hi_addr(_Label25+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2092 :: 		Label25.Caption         = Label25_Caption;
MOVW	R1, #lo_addr(_Label25_Caption+0)
MOVT	R1, #hi_addr(_Label25_Caption+0)
MOVW	R0, #lo_addr(_Label25+16)
MOVT	R0, #hi_addr(_Label25+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2093 :: 		Label25.FontName        = Arial_Black21x30_Regular;
MOVW	R1, #8609
MOVW	R0, #lo_addr(_Label25+20)
MOVT	R0, #hi_addr(_Label25+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2094 :: 		Label25.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label25+24)
MOVT	R0, #hi_addr(_Label25+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2095 :: 		Label25.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+28)
MOVT	R0, #hi_addr(_Label25+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2096 :: 		Label25.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+32)
MOVT	R0, #hi_addr(_Label25+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2097 :: 		Label25.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+36)
MOVT	R0, #hi_addr(_Label25+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2098 :: 		Label25.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+40)
MOVT	R0, #hi_addr(_Label25+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2100 :: 		Image47.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Image47+0)
MOVT	R0, #hi_addr(_Image47+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2101 :: 		Image47.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Image47+4)
MOVT	R0, #hi_addr(_Image47+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2102 :: 		Image47.Left            = 432;
MOVW	R1, #432
MOVW	R0, #lo_addr(_Image47+6)
MOVT	R0, #hi_addr(_Image47+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2103 :: 		Image47.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image47+8)
MOVT	R0, #hi_addr(_Image47+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2104 :: 		Image47.Width           = 44;
MOVS	R1, #44
MOVW	R0, #lo_addr(_Image47+10)
MOVT	R0, #hi_addr(_Image47+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2105 :: 		Image47.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Image47+12)
MOVT	R0, #hi_addr(_Image47+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2106 :: 		Image47.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image47+22)
MOVT	R0, #hi_addr(_Image47+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2107 :: 		Image47.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image47+23)
MOVT	R0, #hi_addr(_Image47+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2108 :: 		Image47.Picture_Name    = icon_battery_bmp;
MOVW	R1, #4322
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image47+16)
MOVT	R0, #hi_addr(_Image47+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2109 :: 		Image47.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image47+20)
MOVT	R0, #hi_addr(_Image47+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2110 :: 		Image47.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image47+21)
MOVT	R0, #hi_addr(_Image47+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2111 :: 		Image47.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image47+24)
MOVT	R0, #hi_addr(_Image47+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2112 :: 		Image47.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image47+28)
MOVT	R0, #hi_addr(_Image47+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2113 :: 		Image47.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image47+32)
MOVT	R0, #hi_addr(_Image47+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2114 :: 		Image47.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image47+36)
MOVT	R0, #hi_addr(_Image47+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2116 :: 		Label26.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Label26+0)
MOVT	R0, #hi_addr(_Label26+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2117 :: 		Label26.Order           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label26+4)
MOVT	R0, #hi_addr(_Label26+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2118 :: 		Label26.Left            = 198;
MOVS	R1, #198
MOVW	R0, #lo_addr(_Label26+6)
MOVT	R0, #hi_addr(_Label26+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2119 :: 		Label26.Top             = 203;
MOVS	R1, #203
MOVW	R0, #lo_addr(_Label26+8)
MOVT	R0, #hi_addr(_Label26+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2120 :: 		Label26.Width           = 86;
MOVS	R1, #86
MOVW	R0, #lo_addr(_Label26+10)
MOVT	R0, #hi_addr(_Label26+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2121 :: 		Label26.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label26+12)
MOVT	R0, #hi_addr(_Label26+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2122 :: 		Label26.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label26+26)
MOVT	R0, #hi_addr(_Label26+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2123 :: 		Label26.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label26+27)
MOVT	R0, #hi_addr(_Label26+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2124 :: 		Label26.Caption         = Label26_Caption;
MOVW	R1, #lo_addr(_Label26_Caption+0)
MOVT	R1, #hi_addr(_Label26_Caption+0)
MOVW	R0, #lo_addr(_Label26+16)
MOVT	R0, #hi_addr(_Label26+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2125 :: 		Label26.FontName        = Arial_Black16x23_Regular;
MOVW	R1, #2595
MOVW	R0, #lo_addr(_Label26+20)
MOVT	R0, #hi_addr(_Label26+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2126 :: 		Label26.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+24)
MOVT	R0, #hi_addr(_Label26+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2127 :: 		Label26.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+28)
MOVT	R0, #hi_addr(_Label26+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2128 :: 		Label26.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+32)
MOVT	R0, #hi_addr(_Label26+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2129 :: 		Label26.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+36)
MOVT	R0, #hi_addr(_Label26+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2130 :: 		Label26.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+40)
MOVT	R0, #hi_addr(_Label26+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2132 :: 		Label27.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Label27+0)
MOVT	R0, #hi_addr(_Label27+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2133 :: 		Label27.Order           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Label27+4)
MOVT	R0, #hi_addr(_Label27+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2134 :: 		Label27.Left            = 218;
MOVS	R1, #218
MOVW	R0, #lo_addr(_Label27+6)
MOVT	R0, #hi_addr(_Label27+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2135 :: 		Label27.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_Label27+8)
MOVT	R0, #hi_addr(_Label27+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2136 :: 		Label27.Width           = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_Label27+10)
MOVT	R0, #hi_addr(_Label27+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2137 :: 		Label27.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label27+12)
MOVT	R0, #hi_addr(_Label27+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2138 :: 		Label27.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label27+26)
MOVT	R0, #hi_addr(_Label27+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2139 :: 		Label27.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label27+27)
MOVT	R0, #hi_addr(_Label27+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2140 :: 		Label27.Caption         = Label27_Caption;
MOVW	R1, #lo_addr(_Label27_Caption+0)
MOVT	R1, #hi_addr(_Label27_Caption+0)
MOVW	R0, #lo_addr(_Label27+16)
MOVT	R0, #hi_addr(_Label27+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2141 :: 		Label27.FontName        = Arial_Black11x15_Regular;
MOVW	R1, #44297
MOVW	R0, #lo_addr(_Label27+20)
MOVT	R0, #hi_addr(_Label27+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2142 :: 		Label27.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+24)
MOVT	R0, #hi_addr(_Label27+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2143 :: 		Label27.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+28)
MOVT	R0, #hi_addr(_Label27+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2144 :: 		Label27.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+32)
MOVT	R0, #hi_addr(_Label27+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2145 :: 		Label27.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+36)
MOVT	R0, #hi_addr(_Label27+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2146 :: 		Label27.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+40)
MOVT	R0, #hi_addr(_Label27+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2148 :: 		Label28.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Label28+0)
MOVT	R0, #hi_addr(_Label28+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2149 :: 		Label28.Order           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Label28+4)
MOVT	R0, #hi_addr(_Label28+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2150 :: 		Label28.Left            = 195;
MOVS	R1, #195
MOVW	R0, #lo_addr(_Label28+6)
MOVT	R0, #hi_addr(_Label28+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2151 :: 		Label28.Top             = 192;
MOVS	R1, #192
MOVW	R0, #lo_addr(_Label28+8)
MOVT	R0, #hi_addr(_Label28+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2152 :: 		Label28.Width           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label28+10)
MOVT	R0, #hi_addr(_Label28+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2153 :: 		Label28.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label28+12)
MOVT	R0, #hi_addr(_Label28+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2154 :: 		Label28.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label28+26)
MOVT	R0, #hi_addr(_Label28+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2155 :: 		Label28.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label28+27)
MOVT	R0, #hi_addr(_Label28+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2156 :: 		Label28.Caption         = Label28_Caption;
MOVW	R1, #lo_addr(_Label28_Caption+0)
MOVT	R1, #hi_addr(_Label28_Caption+0)
MOVW	R0, #lo_addr(_Label28+16)
MOVT	R0, #hi_addr(_Label28+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2157 :: 		Label28.FontName        = Arial_Black11x15_Regular;
MOVW	R1, #44297
MOVW	R0, #lo_addr(_Label28+20)
MOVT	R0, #hi_addr(_Label28+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2158 :: 		Label28.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+24)
MOVT	R0, #hi_addr(_Label28+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2159 :: 		Label28.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+28)
MOVT	R0, #hi_addr(_Label28+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2160 :: 		Label28.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+32)
MOVT	R0, #hi_addr(_Label28+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2161 :: 		Label28.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+36)
MOVT	R0, #hi_addr(_Label28+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2162 :: 		Label28.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+40)
MOVT	R0, #hi_addr(_Label28+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2164 :: 		CircleButton2.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_CircleButton2+0)
MOVT	R0, #hi_addr(_CircleButton2+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2165 :: 		CircleButton2.Order           = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_CircleButton2+4)
MOVT	R0, #hi_addr(_CircleButton2+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2166 :: 		CircleButton2.Left            = 216;
MOVS	R1, #216
MOVW	R0, #lo_addr(_CircleButton2+6)
MOVT	R0, #hi_addr(_CircleButton2+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2167 :: 		CircleButton2.Top             = 112;
MOVS	R1, #112
MOVW	R0, #lo_addr(_CircleButton2+8)
MOVT	R0, #hi_addr(_CircleButton2+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2168 :: 		CircleButton2.Radius          = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_CircleButton2+10)
MOVT	R0, #hi_addr(_CircleButton2+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2169 :: 		CircleButton2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+12)
MOVT	R0, #hi_addr(_CircleButton2+12)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2170 :: 		CircleButton2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+14)
MOVT	R0, #hi_addr(_CircleButton2+14)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2171 :: 		CircleButton2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+16)
MOVT	R0, #hi_addr(_CircleButton2+16)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2172 :: 		CircleButton2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+17)
MOVT	R0, #hi_addr(_CircleButton2+17)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2173 :: 		CircleButton2.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+18)
MOVT	R0, #hi_addr(_CircleButton2+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2174 :: 		CircleButton2.Caption         = CircleButton2_Caption;
MOVW	R1, #lo_addr(_CircleButton2_Caption+0)
MOVT	R1, #hi_addr(_CircleButton2_Caption+0)
MOVW	R0, #lo_addr(_CircleButton2+20)
MOVT	R0, #hi_addr(_CircleButton2+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2175 :: 		CircleButton2.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+24)
MOVT	R0, #hi_addr(_CircleButton2+24)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2176 :: 		CircleButton2.FontName        = Tahoma11x13_Regular;
MOVW	R1, #6053
MOVT	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+28)
MOVT	R0, #hi_addr(_CircleButton2+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2177 :: 		CircleButton2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+42)
MOVT	R0, #hi_addr(_CircleButton2+42)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2178 :: 		CircleButton2.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+32)
MOVT	R0, #hi_addr(_CircleButton2+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2179 :: 		CircleButton2.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+34)
MOVT	R0, #hi_addr(_CircleButton2+34)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2180 :: 		CircleButton2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+35)
MOVT	R0, #hi_addr(_CircleButton2+35)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2181 :: 		CircleButton2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_CircleButton2+36)
MOVT	R0, #hi_addr(_CircleButton2+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2182 :: 		CircleButton2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CircleButton2+38)
MOVT	R0, #hi_addr(_CircleButton2+38)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2183 :: 		CircleButton2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CircleButton2+40)
MOVT	R0, #hi_addr(_CircleButton2+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2184 :: 		CircleButton2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_CircleButton2+44)
MOVT	R0, #hi_addr(_CircleButton2+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2185 :: 		CircleButton2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+48)
MOVT	R0, #hi_addr(_CircleButton2+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2186 :: 		CircleButton2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+52)
MOVT	R0, #hi_addr(_CircleButton2+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2187 :: 		CircleButton2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+56)
MOVT	R0, #hi_addr(_CircleButton2+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2188 :: 		CircleButton2.OnPressPtr      = doPrevScreen;
MOVW	R1, #lo_addr(_doPrevScreen+0)
MOVT	R1, #hi_addr(_doPrevScreen+0)
MOVW	R0, #lo_addr(_CircleButton2+60)
MOVT	R0, #hi_addr(_CircleButton2+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2190 :: 		Line2.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Line2+0)
MOVT	R0, #hi_addr(_Line2+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2191 :: 		Line2.Order           = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Line2+4)
MOVT	R0, #hi_addr(_Line2+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2192 :: 		Line2.First_Point_X   = 238;
MOVS	R1, #238
MOVW	R0, #lo_addr(_Line2+6)
MOVT	R0, #hi_addr(_Line2+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2193 :: 		Line2.First_Point_Y   = 135;
MOVS	R1, #135
MOVW	R0, #lo_addr(_Line2+8)
MOVT	R0, #hi_addr(_Line2+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2194 :: 		Line2.Second_Point_X  = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_Line2+10)
MOVT	R0, #hi_addr(_Line2+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2195 :: 		Line2.Second_Point_Y  = 214;
MOVS	R1, #214
MOVW	R0, #lo_addr(_Line2+12)
MOVT	R0, #hi_addr(_Line2+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2196 :: 		Line2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Line2+15)
MOVT	R0, #hi_addr(_Line2+15)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2197 :: 		Line2.Pen_Width       = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Line2+14)
MOVT	R0, #hi_addr(_Line2+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2198 :: 		Line2.Color           = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Line2+16)
MOVT	R0, #hi_addr(_Line2+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2200 :: 		Label29.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Label29+0)
MOVT	R0, #hi_addr(_Label29+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2201 :: 		Label29.Order           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Label29+4)
MOVT	R0, #hi_addr(_Label29+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2202 :: 		Label29.Left            = 222;
MOVS	R1, #222
MOVW	R0, #lo_addr(_Label29+6)
MOVT	R0, #hi_addr(_Label29+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2203 :: 		Label29.Top             = 103;
MOVS	R1, #103
MOVW	R0, #lo_addr(_Label29+8)
MOVT	R0, #hi_addr(_Label29+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2204 :: 		Label29.Width           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Label29+10)
MOVT	R0, #hi_addr(_Label29+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2205 :: 		Label29.Height          = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Label29+12)
MOVT	R0, #hi_addr(_Label29+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2206 :: 		Label29.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label29+26)
MOVT	R0, #hi_addr(_Label29+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2207 :: 		Label29.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label29+27)
MOVT	R0, #hi_addr(_Label29+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2208 :: 		Label29.Caption         = Label29_Caption;
MOVW	R1, #lo_addr(_Label29_Caption+0)
MOVT	R1, #hi_addr(_Label29_Caption+0)
MOVW	R0, #lo_addr(_Label29+16)
MOVT	R0, #hi_addr(_Label29+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2209 :: 		Label29.FontName        = Arial_Black43x60_Regular;
MOVW	R1, #23145
MOVW	R0, #lo_addr(_Label29+20)
MOVT	R0, #hi_addr(_Label29+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2210 :: 		Label29.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_Label29+24)
MOVT	R0, #hi_addr(_Label29+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2211 :: 		Label29.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label29+28)
MOVT	R0, #hi_addr(_Label29+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2212 :: 		Label29.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label29+32)
MOVT	R0, #hi_addr(_Label29+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2213 :: 		Label29.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label29+36)
MOVT	R0, #hi_addr(_Label29+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2214 :: 		Label29.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label29+40)
MOVT	R0, #hi_addr(_Label29+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2216 :: 		Circle1.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Circle1+0)
MOVT	R0, #hi_addr(_Circle1+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2217 :: 		Circle1.Order           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Circle1+4)
MOVT	R0, #hi_addr(_Circle1+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2218 :: 		Circle1.Left            = 331;
MOVW	R1, #331
MOVW	R0, #lo_addr(_Circle1+6)
MOVT	R0, #hi_addr(_Circle1+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2219 :: 		Circle1.Top             = 138;
MOVS	R1, #138
MOVW	R0, #lo_addr(_Circle1+8)
MOVT	R0, #hi_addr(_Circle1+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2220 :: 		Circle1.Radius          = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Circle1+10)
MOVT	R0, #hi_addr(_Circle1+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2221 :: 		Circle1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+12)
MOVT	R0, #hi_addr(_Circle1+12)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2222 :: 		Circle1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+14)
MOVT	R0, #hi_addr(_Circle1+14)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2223 :: 		Circle1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+16)
MOVT	R0, #hi_addr(_Circle1+16)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2224 :: 		Circle1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+17)
MOVT	R0, #hi_addr(_Circle1+17)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2225 :: 		Circle1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+18)
MOVT	R0, #hi_addr(_Circle1+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2226 :: 		Circle1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+19)
MOVT	R0, #hi_addr(_Circle1+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2227 :: 		Circle1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+20)
MOVT	R0, #hi_addr(_Circle1+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2228 :: 		Circle1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Circle1+22)
MOVT	R0, #hi_addr(_Circle1+22)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2229 :: 		Circle1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Circle1+24)
MOVT	R0, #hi_addr(_Circle1+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2230 :: 		Circle1.Color           = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Circle1+26)
MOVT	R0, #hi_addr(_Circle1+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2231 :: 		Circle1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+28)
MOVT	R0, #hi_addr(_Circle1+28)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2232 :: 		Circle1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Circle1+30)
MOVT	R0, #hi_addr(_Circle1+30)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2233 :: 		Circle1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+32)
MOVT	R0, #hi_addr(_Circle1+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2234 :: 		Circle1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+36)
MOVT	R0, #hi_addr(_Circle1+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2235 :: 		Circle1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+40)
MOVT	R0, #hi_addr(_Circle1+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2236 :: 		Circle1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+44)
MOVT	R0, #hi_addr(_Circle1+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2238 :: 		ButtonRound1.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_ButtonRound1+0)
MOVT	R0, #hi_addr(_ButtonRound1+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2239 :: 		ButtonRound1.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+4)
MOVT	R0, #hi_addr(_ButtonRound1+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2240 :: 		ButtonRound1.Left            = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_ButtonRound1+6)
MOVT	R0, #hi_addr(_ButtonRound1+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2241 :: 		ButtonRound1.Top             = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_ButtonRound1+8)
MOVT	R0, #hi_addr(_ButtonRound1+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2242 :: 		ButtonRound1.Width           = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_ButtonRound1+10)
MOVT	R0, #hi_addr(_ButtonRound1+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2243 :: 		ButtonRound1.Height          = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_ButtonRound1+12)
MOVT	R0, #hi_addr(_ButtonRound1+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2244 :: 		ButtonRound1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+14)
MOVT	R0, #hi_addr(_ButtonRound1+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2245 :: 		ButtonRound1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+16)
MOVT	R0, #hi_addr(_ButtonRound1+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2246 :: 		ButtonRound1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+18)
MOVT	R0, #hi_addr(_ButtonRound1+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2247 :: 		ButtonRound1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+19)
MOVT	R0, #hi_addr(_ButtonRound1+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2248 :: 		ButtonRound1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+20)
MOVT	R0, #hi_addr(_ButtonRound1+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2249 :: 		ButtonRound1.Caption         = ButtonRound1_Caption;
MOVW	R1, #lo_addr(_ButtonRound1_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound1_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound1+24)
MOVT	R0, #hi_addr(_ButtonRound1+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2250 :: 		ButtonRound1.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+28)
MOVT	R0, #hi_addr(_ButtonRound1+28)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2251 :: 		ButtonRound1.FontName        = Impact13x20_Regular;
MOVW	R1, #47479
MOVW	R0, #lo_addr(_ButtonRound1+32)
MOVT	R0, #hi_addr(_ButtonRound1+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2252 :: 		ButtonRound1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+47)
MOVT	R0, #hi_addr(_ButtonRound1+47)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2253 :: 		ButtonRound1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+36)
MOVT	R0, #hi_addr(_ButtonRound1+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2254 :: 		ButtonRound1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+38)
MOVT	R0, #hi_addr(_ButtonRound1+38)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2255 :: 		ButtonRound1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+39)
MOVT	R0, #hi_addr(_ButtonRound1+39)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2256 :: 		ButtonRound1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound1+40)
MOVT	R0, #hi_addr(_ButtonRound1+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2257 :: 		ButtonRound1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound1+42)
MOVT	R0, #hi_addr(_ButtonRound1+42)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2258 :: 		ButtonRound1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound1+44)
MOVT	R0, #hi_addr(_ButtonRound1+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2259 :: 		ButtonRound1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound1+48)
MOVT	R0, #hi_addr(_ButtonRound1+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2260 :: 		ButtonRound1.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound1+46)
MOVT	R0, #hi_addr(_ButtonRound1+46)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2261 :: 		ButtonRound1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+52)
MOVT	R0, #hi_addr(_ButtonRound1+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2262 :: 		ButtonRound1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+56)
MOVT	R0, #hi_addr(_ButtonRound1+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2263 :: 		ButtonRound1.OnClickPtr      = doSetClock;
MOVW	R1, #lo_addr(_doSetClock+0)
MOVT	R1, #hi_addr(_doSetClock+0)
MOVW	R0, #lo_addr(_ButtonRound1+60)
MOVT	R0, #hi_addr(_ButtonRound1+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2264 :: 		ButtonRound1.OnPressPtr      = doSetClock;
MOVW	R1, #lo_addr(_doSetClock+0)
MOVT	R1, #hi_addr(_doSetClock+0)
MOVW	R0, #lo_addr(_ButtonRound1+64)
MOVT	R0, #hi_addr(_ButtonRound1+64)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2266 :: 		ButtonRound2.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_ButtonRound2+0)
MOVT	R0, #hi_addr(_ButtonRound2+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2267 :: 		ButtonRound2.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_ButtonRound2+4)
MOVT	R0, #hi_addr(_ButtonRound2+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2268 :: 		ButtonRound2.Left            = 52;
MOVS	R1, #52
MOVW	R0, #lo_addr(_ButtonRound2+6)
MOVT	R0, #hi_addr(_ButtonRound2+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2269 :: 		ButtonRound2.Top             = 60;
MOVS	R1, #60
MOVW	R0, #lo_addr(_ButtonRound2+8)
MOVT	R0, #hi_addr(_ButtonRound2+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2270 :: 		ButtonRound2.Width           = 164;
MOVS	R1, #164
MOVW	R0, #lo_addr(_ButtonRound2+10)
MOVT	R0, #hi_addr(_ButtonRound2+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2271 :: 		ButtonRound2.Height          = 48;
MOVS	R1, #48
MOVW	R0, #lo_addr(_ButtonRound2+12)
MOVT	R0, #hi_addr(_ButtonRound2+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2272 :: 		ButtonRound2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+14)
MOVT	R0, #hi_addr(_ButtonRound2+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2273 :: 		ButtonRound2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+16)
MOVT	R0, #hi_addr(_ButtonRound2+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2274 :: 		ButtonRound2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+18)
MOVT	R0, #hi_addr(_ButtonRound2+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2275 :: 		ButtonRound2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+19)
MOVT	R0, #hi_addr(_ButtonRound2+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2276 :: 		ButtonRound2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+20)
MOVT	R0, #hi_addr(_ButtonRound2+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2277 :: 		ButtonRound2.Caption         = ButtonRound2_Caption;
MOVW	R1, #lo_addr(_ButtonRound2_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound2_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound2+24)
MOVT	R0, #hi_addr(_ButtonRound2+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2278 :: 		ButtonRound2.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+28)
MOVT	R0, #hi_addr(_ButtonRound2+28)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2279 :: 		ButtonRound2.FontName        = Impact13x20_Regular;
MOVW	R1, #47479
MOVW	R0, #lo_addr(_ButtonRound2+32)
MOVT	R0, #hi_addr(_ButtonRound2+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2280 :: 		ButtonRound2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+47)
MOVT	R0, #hi_addr(_ButtonRound2+47)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2281 :: 		ButtonRound2.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+36)
MOVT	R0, #hi_addr(_ButtonRound2+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2282 :: 		ButtonRound2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+38)
MOVT	R0, #hi_addr(_ButtonRound2+38)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2283 :: 		ButtonRound2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+39)
MOVT	R0, #hi_addr(_ButtonRound2+39)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2284 :: 		ButtonRound2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound2+40)
MOVT	R0, #hi_addr(_ButtonRound2+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2285 :: 		ButtonRound2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound2+42)
MOVT	R0, #hi_addr(_ButtonRound2+42)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2286 :: 		ButtonRound2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound2+44)
MOVT	R0, #hi_addr(_ButtonRound2+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2287 :: 		ButtonRound2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound2+48)
MOVT	R0, #hi_addr(_ButtonRound2+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2288 :: 		ButtonRound2.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound2+46)
MOVT	R0, #hi_addr(_ButtonRound2+46)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2289 :: 		ButtonRound2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+52)
MOVT	R0, #hi_addr(_ButtonRound2+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2290 :: 		ButtonRound2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+56)
MOVT	R0, #hi_addr(_ButtonRound2+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2291 :: 		ButtonRound2.OnClickPtr      = doAccelerometerTest;
MOVW	R1, #lo_addr(_doAccelerometerTest+0)
MOVT	R1, #hi_addr(_doAccelerometerTest+0)
MOVW	R0, #lo_addr(_ButtonRound2+60)
MOVT	R0, #hi_addr(_ButtonRound2+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2292 :: 		ButtonRound2.OnPressPtr      = doAccelerometerTest;
MOVW	R1, #lo_addr(_doAccelerometerTest+0)
MOVT	R1, #hi_addr(_doAccelerometerTest+0)
MOVW	R0, #lo_addr(_ButtonRound2+64)
MOVT	R0, #hi_addr(_ButtonRound2+64)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2294 :: 		ButtonRound3.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_ButtonRound3+0)
MOVT	R0, #hi_addr(_ButtonRound3+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2295 :: 		ButtonRound3.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound3+4)
MOVT	R0, #hi_addr(_ButtonRound3+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2296 :: 		ButtonRound3.Left            = 262;
MOVW	R1, #262
MOVW	R0, #lo_addr(_ButtonRound3+6)
MOVT	R0, #hi_addr(_ButtonRound3+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2297 :: 		ButtonRound3.Top             = 60;
MOVS	R1, #60
MOVW	R0, #lo_addr(_ButtonRound3+8)
MOVT	R0, #hi_addr(_ButtonRound3+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2298 :: 		ButtonRound3.Width           = 164;
MOVS	R1, #164
MOVW	R0, #lo_addr(_ButtonRound3+10)
MOVT	R0, #hi_addr(_ButtonRound3+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2299 :: 		ButtonRound3.Height          = 48;
MOVS	R1, #48
MOVW	R0, #lo_addr(_ButtonRound3+12)
MOVT	R0, #hi_addr(_ButtonRound3+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2300 :: 		ButtonRound3.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+14)
MOVT	R0, #hi_addr(_ButtonRound3+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2301 :: 		ButtonRound3.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound3+16)
MOVT	R0, #hi_addr(_ButtonRound3+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2302 :: 		ButtonRound3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+18)
MOVT	R0, #hi_addr(_ButtonRound3+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2303 :: 		ButtonRound3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+19)
MOVT	R0, #hi_addr(_ButtonRound3+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2304 :: 		ButtonRound3.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+20)
MOVT	R0, #hi_addr(_ButtonRound3+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2305 :: 		ButtonRound3.Caption         = ButtonRound3_Caption;
MOVW	R1, #lo_addr(_ButtonRound3_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound3_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound3+24)
MOVT	R0, #hi_addr(_ButtonRound3+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2306 :: 		ButtonRound3.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+28)
MOVT	R0, #hi_addr(_ButtonRound3+28)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2307 :: 		ButtonRound3.FontName        = Impact13x20_Regular;
MOVW	R1, #47479
MOVW	R0, #lo_addr(_ButtonRound3+32)
MOVT	R0, #hi_addr(_ButtonRound3+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2308 :: 		ButtonRound3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+47)
MOVT	R0, #hi_addr(_ButtonRound3+47)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2309 :: 		ButtonRound3.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound3+36)
MOVT	R0, #hi_addr(_ButtonRound3+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2310 :: 		ButtonRound3.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+38)
MOVT	R0, #hi_addr(_ButtonRound3+38)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2311 :: 		ButtonRound3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound3+39)
MOVT	R0, #hi_addr(_ButtonRound3+39)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2312 :: 		ButtonRound3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound3+40)
MOVT	R0, #hi_addr(_ButtonRound3+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2313 :: 		ButtonRound3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound3+42)
MOVT	R0, #hi_addr(_ButtonRound3+42)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2314 :: 		ButtonRound3.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound3+44)
MOVT	R0, #hi_addr(_ButtonRound3+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2315 :: 		ButtonRound3.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound3+48)
MOVT	R0, #hi_addr(_ButtonRound3+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2316 :: 		ButtonRound3.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound3+46)
MOVT	R0, #hi_addr(_ButtonRound3+46)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2317 :: 		ButtonRound3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound3+52)
MOVT	R0, #hi_addr(_ButtonRound3+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2318 :: 		ButtonRound3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound3+56)
MOVT	R0, #hi_addr(_ButtonRound3+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2319 :: 		ButtonRound3.OnClickPtr      = doGPSTest;
MOVW	R1, #lo_addr(_doGPSTest+0)
MOVT	R1, #hi_addr(_doGPSTest+0)
MOVW	R0, #lo_addr(_ButtonRound3+60)
MOVT	R0, #hi_addr(_ButtonRound3+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2320 :: 		ButtonRound3.OnPressPtr      = doGPSTest;
MOVW	R1, #lo_addr(_doGPSTest+0)
MOVT	R1, #hi_addr(_doGPSTest+0)
MOVW	R0, #lo_addr(_ButtonRound3+64)
MOVT	R0, #hi_addr(_ButtonRound3+64)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2322 :: 		ButtonRound4.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_ButtonRound4+0)
MOVT	R0, #hi_addr(_ButtonRound4+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2323 :: 		ButtonRound4.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_ButtonRound4+4)
MOVT	R0, #hi_addr(_ButtonRound4+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2324 :: 		ButtonRound4.Left            = 52;
MOVS	R1, #52
MOVW	R0, #lo_addr(_ButtonRound4+6)
MOVT	R0, #hi_addr(_ButtonRound4+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2325 :: 		ButtonRound4.Top             = 208;
MOVS	R1, #208
MOVW	R0, #lo_addr(_ButtonRound4+8)
MOVT	R0, #hi_addr(_ButtonRound4+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2326 :: 		ButtonRound4.Width           = 164;
MOVS	R1, #164
MOVW	R0, #lo_addr(_ButtonRound4+10)
MOVT	R0, #hi_addr(_ButtonRound4+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2327 :: 		ButtonRound4.Height          = 48;
MOVS	R1, #48
MOVW	R0, #lo_addr(_ButtonRound4+12)
MOVT	R0, #hi_addr(_ButtonRound4+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2328 :: 		ButtonRound4.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+14)
MOVT	R0, #hi_addr(_ButtonRound4+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2329 :: 		ButtonRound4.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+16)
MOVT	R0, #hi_addr(_ButtonRound4+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2330 :: 		ButtonRound4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+18)
MOVT	R0, #hi_addr(_ButtonRound4+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2331 :: 		ButtonRound4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+19)
MOVT	R0, #hi_addr(_ButtonRound4+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2332 :: 		ButtonRound4.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+20)
MOVT	R0, #hi_addr(_ButtonRound4+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2333 :: 		ButtonRound4.Caption         = ButtonRound4_Caption;
MOVW	R1, #lo_addr(_ButtonRound4_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound4_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound4+24)
MOVT	R0, #hi_addr(_ButtonRound4+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2334 :: 		ButtonRound4.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+28)
MOVT	R0, #hi_addr(_ButtonRound4+28)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2335 :: 		ButtonRound4.FontName        = Impact13x20_Regular;
MOVW	R1, #47479
MOVW	R0, #lo_addr(_ButtonRound4+32)
MOVT	R0, #hi_addr(_ButtonRound4+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2336 :: 		ButtonRound4.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+47)
MOVT	R0, #hi_addr(_ButtonRound4+47)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2337 :: 		ButtonRound4.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+36)
MOVT	R0, #hi_addr(_ButtonRound4+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2338 :: 		ButtonRound4.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+38)
MOVT	R0, #hi_addr(_ButtonRound4+38)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2339 :: 		ButtonRound4.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+39)
MOVT	R0, #hi_addr(_ButtonRound4+39)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2340 :: 		ButtonRound4.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound4+40)
MOVT	R0, #hi_addr(_ButtonRound4+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2341 :: 		ButtonRound4.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound4+42)
MOVT	R0, #hi_addr(_ButtonRound4+42)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2342 :: 		ButtonRound4.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound4+44)
MOVT	R0, #hi_addr(_ButtonRound4+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2343 :: 		ButtonRound4.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound4+48)
MOVT	R0, #hi_addr(_ButtonRound4+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2344 :: 		ButtonRound4.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound4+46)
MOVT	R0, #hi_addr(_ButtonRound4+46)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2345 :: 		ButtonRound4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+52)
MOVT	R0, #hi_addr(_ButtonRound4+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2346 :: 		ButtonRound4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+56)
MOVT	R0, #hi_addr(_ButtonRound4+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2347 :: 		ButtonRound4.OnClickPtr      = doMagnetTest;
MOVW	R1, #lo_addr(_doMagnetTest+0)
MOVT	R1, #hi_addr(_doMagnetTest+0)
MOVW	R0, #lo_addr(_ButtonRound4+60)
MOVT	R0, #hi_addr(_ButtonRound4+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2348 :: 		ButtonRound4.OnPressPtr      = doMagnetTest;
MOVW	R1, #lo_addr(_doMagnetTest+0)
MOVT	R1, #hi_addr(_doMagnetTest+0)
MOVW	R0, #lo_addr(_ButtonRound4+64)
MOVT	R0, #hi_addr(_ButtonRound4+64)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2350 :: 		ButtonRound5.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_ButtonRound5+0)
MOVT	R0, #hi_addr(_ButtonRound5+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2351 :: 		ButtonRound5.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_ButtonRound5+4)
MOVT	R0, #hi_addr(_ButtonRound5+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2352 :: 		ButtonRound5.Left            = 262;
MOVW	R1, #262
MOVW	R0, #lo_addr(_ButtonRound5+6)
MOVT	R0, #hi_addr(_ButtonRound5+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2353 :: 		ButtonRound5.Top             = 208;
MOVS	R1, #208
MOVW	R0, #lo_addr(_ButtonRound5+8)
MOVT	R0, #hi_addr(_ButtonRound5+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2354 :: 		ButtonRound5.Width           = 164;
MOVS	R1, #164
MOVW	R0, #lo_addr(_ButtonRound5+10)
MOVT	R0, #hi_addr(_ButtonRound5+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2355 :: 		ButtonRound5.Height          = 48;
MOVS	R1, #48
MOVW	R0, #lo_addr(_ButtonRound5+12)
MOVT	R0, #hi_addr(_ButtonRound5+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2356 :: 		ButtonRound5.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+14)
MOVT	R0, #hi_addr(_ButtonRound5+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2357 :: 		ButtonRound5.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+16)
MOVT	R0, #hi_addr(_ButtonRound5+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2358 :: 		ButtonRound5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+18)
MOVT	R0, #hi_addr(_ButtonRound5+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2359 :: 		ButtonRound5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+19)
MOVT	R0, #hi_addr(_ButtonRound5+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2360 :: 		ButtonRound5.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+20)
MOVT	R0, #hi_addr(_ButtonRound5+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2361 :: 		ButtonRound5.Caption         = ButtonRound5_Caption;
MOVW	R1, #lo_addr(_ButtonRound5_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound5_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound5+24)
MOVT	R0, #hi_addr(_ButtonRound5+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2362 :: 		ButtonRound5.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+28)
MOVT	R0, #hi_addr(_ButtonRound5+28)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2363 :: 		ButtonRound5.FontName        = Impact13x20_Regular;
MOVW	R1, #47479
MOVW	R0, #lo_addr(_ButtonRound5+32)
MOVT	R0, #hi_addr(_ButtonRound5+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2364 :: 		ButtonRound5.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+47)
MOVT	R0, #hi_addr(_ButtonRound5+47)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2365 :: 		ButtonRound5.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+36)
MOVT	R0, #hi_addr(_ButtonRound5+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2366 :: 		ButtonRound5.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+38)
MOVT	R0, #hi_addr(_ButtonRound5+38)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2367 :: 		ButtonRound5.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+39)
MOVT	R0, #hi_addr(_ButtonRound5+39)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2368 :: 		ButtonRound5.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound5+40)
MOVT	R0, #hi_addr(_ButtonRound5+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2369 :: 		ButtonRound5.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound5+42)
MOVT	R0, #hi_addr(_ButtonRound5+42)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2370 :: 		ButtonRound5.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound5+44)
MOVT	R0, #hi_addr(_ButtonRound5+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2371 :: 		ButtonRound5.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound5+48)
MOVT	R0, #hi_addr(_ButtonRound5+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2372 :: 		ButtonRound5.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound5+46)
MOVT	R0, #hi_addr(_ButtonRound5+46)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2373 :: 		ButtonRound5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+52)
MOVT	R0, #hi_addr(_ButtonRound5+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2374 :: 		ButtonRound5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+56)
MOVT	R0, #hi_addr(_ButtonRound5+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2375 :: 		ButtonRound5.OnClickPtr      = doPressureTest;
MOVW	R1, #lo_addr(_doPressureTest+0)
MOVT	R1, #hi_addr(_doPressureTest+0)
MOVW	R0, #lo_addr(_ButtonRound5+60)
MOVT	R0, #hi_addr(_ButtonRound5+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2376 :: 		ButtonRound5.OnPressPtr      = doPressureTest;
MOVW	R1, #lo_addr(_doPressureTest+0)
MOVT	R1, #hi_addr(_doPressureTest+0)
MOVW	R0, #lo_addr(_ButtonRound5+64)
MOVT	R0, #hi_addr(_ButtonRound5+64)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2378 :: 		ButtonRound6.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_ButtonRound6+0)
MOVT	R0, #hi_addr(_ButtonRound6+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2379 :: 		ButtonRound6.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_ButtonRound6+4)
MOVT	R0, #hi_addr(_ButtonRound6+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2380 :: 		ButtonRound6.Left            = 52;
MOVS	R1, #52
MOVW	R0, #lo_addr(_ButtonRound6+6)
MOVT	R0, #hi_addr(_ButtonRound6+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2381 :: 		ButtonRound6.Top             = 134;
MOVS	R1, #134
MOVW	R0, #lo_addr(_ButtonRound6+8)
MOVT	R0, #hi_addr(_ButtonRound6+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2382 :: 		ButtonRound6.Width           = 164;
MOVS	R1, #164
MOVW	R0, #lo_addr(_ButtonRound6+10)
MOVT	R0, #hi_addr(_ButtonRound6+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2383 :: 		ButtonRound6.Height          = 48;
MOVS	R1, #48
MOVW	R0, #lo_addr(_ButtonRound6+12)
MOVT	R0, #hi_addr(_ButtonRound6+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2384 :: 		ButtonRound6.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+14)
MOVT	R0, #hi_addr(_ButtonRound6+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2385 :: 		ButtonRound6.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+16)
MOVT	R0, #hi_addr(_ButtonRound6+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2386 :: 		ButtonRound6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+18)
MOVT	R0, #hi_addr(_ButtonRound6+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2387 :: 		ButtonRound6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+19)
MOVT	R0, #hi_addr(_ButtonRound6+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2388 :: 		ButtonRound6.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+20)
MOVT	R0, #hi_addr(_ButtonRound6+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2389 :: 		ButtonRound6.Caption         = ButtonRound6_Caption;
MOVW	R1, #lo_addr(_ButtonRound6_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound6_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound6+24)
MOVT	R0, #hi_addr(_ButtonRound6+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2390 :: 		ButtonRound6.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+28)
MOVT	R0, #hi_addr(_ButtonRound6+28)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2391 :: 		ButtonRound6.FontName        = Impact13x20_Regular;
MOVW	R1, #47479
MOVW	R0, #lo_addr(_ButtonRound6+32)
MOVT	R0, #hi_addr(_ButtonRound6+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2392 :: 		ButtonRound6.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+47)
MOVT	R0, #hi_addr(_ButtonRound6+47)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2393 :: 		ButtonRound6.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+36)
MOVT	R0, #hi_addr(_ButtonRound6+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2394 :: 		ButtonRound6.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+38)
MOVT	R0, #hi_addr(_ButtonRound6+38)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2395 :: 		ButtonRound6.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+39)
MOVT	R0, #hi_addr(_ButtonRound6+39)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2396 :: 		ButtonRound6.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound6+40)
MOVT	R0, #hi_addr(_ButtonRound6+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2397 :: 		ButtonRound6.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound6+42)
MOVT	R0, #hi_addr(_ButtonRound6+42)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2398 :: 		ButtonRound6.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound6+44)
MOVT	R0, #hi_addr(_ButtonRound6+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2399 :: 		ButtonRound6.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound6+48)
MOVT	R0, #hi_addr(_ButtonRound6+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2400 :: 		ButtonRound6.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound6+46)
MOVT	R0, #hi_addr(_ButtonRound6+46)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2401 :: 		ButtonRound6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+52)
MOVT	R0, #hi_addr(_ButtonRound6+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2402 :: 		ButtonRound6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+56)
MOVT	R0, #hi_addr(_ButtonRound6+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2403 :: 		ButtonRound6.OnClickPtr      = doGyroTest;
MOVW	R1, #lo_addr(_doGyroTest+0)
MOVT	R1, #hi_addr(_doGyroTest+0)
MOVW	R0, #lo_addr(_ButtonRound6+60)
MOVT	R0, #hi_addr(_ButtonRound6+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2404 :: 		ButtonRound6.OnPressPtr      = doGyroTest;
MOVW	R1, #lo_addr(_doGyroTest+0)
MOVT	R1, #hi_addr(_doGyroTest+0)
MOVW	R0, #lo_addr(_ButtonRound6+64)
MOVT	R0, #hi_addr(_ButtonRound6+64)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2406 :: 		ButtonRound7.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_ButtonRound7+0)
MOVT	R0, #hi_addr(_ButtonRound7+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2407 :: 		ButtonRound7.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_ButtonRound7+4)
MOVT	R0, #hi_addr(_ButtonRound7+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2408 :: 		ButtonRound7.Left            = 262;
MOVW	R1, #262
MOVW	R0, #lo_addr(_ButtonRound7+6)
MOVT	R0, #hi_addr(_ButtonRound7+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2409 :: 		ButtonRound7.Top             = 134;
MOVS	R1, #134
MOVW	R0, #lo_addr(_ButtonRound7+8)
MOVT	R0, #hi_addr(_ButtonRound7+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2410 :: 		ButtonRound7.Width           = 164;
MOVS	R1, #164
MOVW	R0, #lo_addr(_ButtonRound7+10)
MOVT	R0, #hi_addr(_ButtonRound7+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2411 :: 		ButtonRound7.Height          = 48;
MOVS	R1, #48
MOVW	R0, #lo_addr(_ButtonRound7+12)
MOVT	R0, #hi_addr(_ButtonRound7+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2412 :: 		ButtonRound7.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+14)
MOVT	R0, #hi_addr(_ButtonRound7+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2413 :: 		ButtonRound7.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+16)
MOVT	R0, #hi_addr(_ButtonRound7+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2414 :: 		ButtonRound7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+18)
MOVT	R0, #hi_addr(_ButtonRound7+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2415 :: 		ButtonRound7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+19)
MOVT	R0, #hi_addr(_ButtonRound7+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2416 :: 		ButtonRound7.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+20)
MOVT	R0, #hi_addr(_ButtonRound7+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2417 :: 		ButtonRound7.Caption         = ButtonRound7_Caption;
MOVW	R1, #lo_addr(_ButtonRound7_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound7_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound7+24)
MOVT	R0, #hi_addr(_ButtonRound7+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2418 :: 		ButtonRound7.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+28)
MOVT	R0, #hi_addr(_ButtonRound7+28)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2419 :: 		ButtonRound7.FontName        = Impact13x20_Regular;
MOVW	R1, #47479
MOVW	R0, #lo_addr(_ButtonRound7+32)
MOVT	R0, #hi_addr(_ButtonRound7+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2420 :: 		ButtonRound7.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+47)
MOVT	R0, #hi_addr(_ButtonRound7+47)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2421 :: 		ButtonRound7.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+36)
MOVT	R0, #hi_addr(_ButtonRound7+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2422 :: 		ButtonRound7.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+38)
MOVT	R0, #hi_addr(_ButtonRound7+38)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2423 :: 		ButtonRound7.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+39)
MOVT	R0, #hi_addr(_ButtonRound7+39)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2424 :: 		ButtonRound7.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound7+40)
MOVT	R0, #hi_addr(_ButtonRound7+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2425 :: 		ButtonRound7.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound7+42)
MOVT	R0, #hi_addr(_ButtonRound7+42)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2426 :: 		ButtonRound7.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound7+44)
MOVT	R0, #hi_addr(_ButtonRound7+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2427 :: 		ButtonRound7.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound7+48)
MOVT	R0, #hi_addr(_ButtonRound7+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2428 :: 		ButtonRound7.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound7+46)
MOVT	R0, #hi_addr(_ButtonRound7+46)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2429 :: 		ButtonRound7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+52)
MOVT	R0, #hi_addr(_ButtonRound7+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2430 :: 		ButtonRound7.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+56)
MOVT	R0, #hi_addr(_ButtonRound7+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2431 :: 		ButtonRound7.OnClickPtr      = doCalibration;
MOVW	R1, #lo_addr(_doCalibration+0)
MOVT	R1, #hi_addr(_doCalibration+0)
MOVW	R0, #lo_addr(_ButtonRound7+60)
MOVT	R0, #hi_addr(_ButtonRound7+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2432 :: 		ButtonRound7.OnPressPtr      = doCalibration;
MOVW	R1, #lo_addr(_doCalibration+0)
MOVT	R1, #hi_addr(_doCalibration+0)
MOVW	R0, #lo_addr(_ButtonRound7+64)
MOVT	R0, #hi_addr(_ButtonRound7+64)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2434 :: 		Image48.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_Image48+0)
MOVT	R0, #hi_addr(_Image48+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2435 :: 		Image48.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Image48+4)
MOVT	R0, #hi_addr(_Image48+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2436 :: 		Image48.Left            = 432;
MOVW	R1, #432
MOVW	R0, #lo_addr(_Image48+6)
MOVT	R0, #hi_addr(_Image48+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2437 :: 		Image48.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image48+8)
MOVT	R0, #hi_addr(_Image48+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2438 :: 		Image48.Width           = 44;
MOVS	R1, #44
MOVW	R0, #lo_addr(_Image48+10)
MOVT	R0, #hi_addr(_Image48+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2439 :: 		Image48.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Image48+12)
MOVT	R0, #hi_addr(_Image48+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2440 :: 		Image48.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image48+22)
MOVT	R0, #hi_addr(_Image48+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2441 :: 		Image48.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image48+23)
MOVT	R0, #hi_addr(_Image48+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2442 :: 		Image48.Picture_Name    = icon_battery_bmp;
MOVW	R1, #4322
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image48+16)
MOVT	R0, #hi_addr(_Image48+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2443 :: 		Image48.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image48+20)
MOVT	R0, #hi_addr(_Image48+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2444 :: 		Image48.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image48+21)
MOVT	R0, #hi_addr(_Image48+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2445 :: 		Image48.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image48+24)
MOVT	R0, #hi_addr(_Image48+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2446 :: 		Image48.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image48+28)
MOVT	R0, #hi_addr(_Image48+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2447 :: 		Image48.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image48+32)
MOVT	R0, #hi_addr(_Image48+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2448 :: 		Image48.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image48+36)
MOVT	R0, #hi_addr(_Image48+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2450 :: 		Label30.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_Label30+0)
MOVT	R0, #hi_addr(_Label30+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2451 :: 		Label30.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label30+4)
MOVT	R0, #hi_addr(_Label30+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2452 :: 		Label30.Left            = 365;
MOVW	R1, #365
MOVW	R0, #lo_addr(_Label30+6)
MOVT	R0, #hi_addr(_Label30+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2453 :: 		Label30.Top             = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label30+8)
MOVT	R0, #hi_addr(_Label30+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2454 :: 		Label30.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_Label30+10)
MOVT	R0, #hi_addr(_Label30+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2455 :: 		Label30.Height          = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label30+12)
MOVT	R0, #hi_addr(_Label30+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2456 :: 		Label30.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label30+26)
MOVT	R0, #hi_addr(_Label30+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2457 :: 		Label30.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label30+27)
MOVT	R0, #hi_addr(_Label30+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2458 :: 		Label30.Caption         = Label30_Caption;
MOVW	R1, #lo_addr(_Label30_Caption+0)
MOVT	R1, #hi_addr(_Label30_Caption+0)
MOVW	R0, #lo_addr(_Label30+16)
MOVT	R0, #hi_addr(_Label30+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2459 :: 		Label30.FontName        = Arial_Black21x30_Regular;
MOVW	R1, #8609
MOVW	R0, #lo_addr(_Label30+20)
MOVT	R0, #hi_addr(_Label30+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2460 :: 		Label30.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label30+24)
MOVT	R0, #hi_addr(_Label30+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2461 :: 		Label30.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label30+28)
MOVT	R0, #hi_addr(_Label30+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2462 :: 		Label30.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label30+32)
MOVT	R0, #hi_addr(_Label30+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2463 :: 		Label30.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label30+36)
MOVT	R0, #hi_addr(_Label30+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2464 :: 		Label30.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label30+40)
MOVT	R0, #hi_addr(_Label30+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2466 :: 		Box17.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_Box17+0)
MOVT	R0, #hi_addr(_Box17+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2467 :: 		Box17.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Box17+4)
MOVT	R0, #hi_addr(_Box17+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2468 :: 		Box17.Left            = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Box17+6)
MOVT	R0, #hi_addr(_Box17+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2469 :: 		Box17.Top             = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Box17+8)
MOVT	R0, #hi_addr(_Box17+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2470 :: 		Box17.Width           = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_Box17+10)
MOVT	R0, #hi_addr(_Box17+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2471 :: 		Box17.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Box17+12)
MOVT	R0, #hi_addr(_Box17+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2472 :: 		Box17.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box17+14)
MOVT	R0, #hi_addr(_Box17+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2473 :: 		Box17.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+16)
MOVT	R0, #hi_addr(_Box17+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2474 :: 		Box17.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+18)
MOVT	R0, #hi_addr(_Box17+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2475 :: 		Box17.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box17+19)
MOVT	R0, #hi_addr(_Box17+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2476 :: 		Box17.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box17+20)
MOVT	R0, #hi_addr(_Box17+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2477 :: 		Box17.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box17+21)
MOVT	R0, #hi_addr(_Box17+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2478 :: 		Box17.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+22)
MOVT	R0, #hi_addr(_Box17+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2479 :: 		Box17.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box17+24)
MOVT	R0, #hi_addr(_Box17+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2480 :: 		Box17.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box17+26)
MOVT	R0, #hi_addr(_Box17+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2481 :: 		Box17.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box17+28)
MOVT	R0, #hi_addr(_Box17+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2482 :: 		Box17.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+30)
MOVT	R0, #hi_addr(_Box17+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2483 :: 		Box17.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box17+32)
MOVT	R0, #hi_addr(_Box17+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2484 :: 		Box17.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+36)
MOVT	R0, #hi_addr(_Box17+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2485 :: 		Box17.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+40)
MOVT	R0, #hi_addr(_Box17+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2486 :: 		Box17.OnClickPtr      = Image18OnPress;
MOVW	R1, #lo_addr(_Image18OnPress+0)
MOVT	R1, #hi_addr(_Image18OnPress+0)
MOVW	R0, #lo_addr(_Box17+44)
MOVT	R0, #hi_addr(_Box17+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2487 :: 		Box17.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+48)
MOVT	R0, #hi_addr(_Box17+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2489 :: 		Image51.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_Image51+0)
MOVT	R0, #hi_addr(_Image51+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2490 :: 		Image51.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Image51+4)
MOVT	R0, #hi_addr(_Image51+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2491 :: 		Image51.Left            = 29;
MOVS	R1, #29
MOVW	R0, #lo_addr(_Image51+6)
MOVT	R0, #hi_addr(_Image51+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2492 :: 		Image51.Top             = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Image51+8)
MOVT	R0, #hi_addr(_Image51+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2493 :: 		Image51.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image51+10)
MOVT	R0, #hi_addr(_Image51+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2494 :: 		Image51.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image51+12)
MOVT	R0, #hi_addr(_Image51+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2495 :: 		Image51.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image51+22)
MOVT	R0, #hi_addr(_Image51+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2496 :: 		Image51.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image51+23)
MOVT	R0, #hi_addr(_Image51+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2497 :: 		Image51.Picture_Name    = icon_ok_bmp;
MOVW	R1, #38068
MOVT	R1, #61
MOVW	R0, #lo_addr(_Image51+16)
MOVT	R0, #hi_addr(_Image51+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2498 :: 		Image51.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image51+20)
MOVT	R0, #hi_addr(_Image51+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2499 :: 		Image51.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image51+21)
MOVT	R0, #hi_addr(_Image51+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2500 :: 		Image51.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image51+24)
MOVT	R0, #hi_addr(_Image51+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2501 :: 		Image51.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image51+28)
MOVT	R0, #hi_addr(_Image51+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2502 :: 		Image51.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image51+32)
MOVT	R0, #hi_addr(_Image51+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2503 :: 		Image51.OnPressPtr      = Image18OnPress;
MOVW	R1, #lo_addr(_Image18OnPress+0)
MOVT	R1, #hi_addr(_Image18OnPress+0)
MOVW	R0, #lo_addr(_Image51+36)
MOVT	R0, #hi_addr(_Image51+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2505 :: 		Label73.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_Label73+0)
MOVT	R0, #hi_addr(_Label73+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2506 :: 		Label73.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Label73+4)
MOVT	R0, #hi_addr(_Label73+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2507 :: 		Label73.Left            = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_Label73+6)
MOVT	R0, #hi_addr(_Label73+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2508 :: 		Label73.Top             = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label73+8)
MOVT	R0, #hi_addr(_Label73+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2509 :: 		Label73.Width           = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Label73+10)
MOVT	R0, #hi_addr(_Label73+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2510 :: 		Label73.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label73+12)
MOVT	R0, #hi_addr(_Label73+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2511 :: 		Label73.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label73+26)
MOVT	R0, #hi_addr(_Label73+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2512 :: 		Label73.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label73+27)
MOVT	R0, #hi_addr(_Label73+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2513 :: 		Label73.Caption         = Label73_Caption;
MOVW	R1, #lo_addr(_Label73_Caption+0)
MOVT	R1, #hi_addr(_Label73_Caption+0)
MOVW	R0, #lo_addr(_Label73+16)
MOVT	R0, #hi_addr(_Label73+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2514 :: 		Label73.FontName        = Arial_Black16x23_Regular;
MOVW	R1, #2595
MOVW	R0, #lo_addr(_Label73+20)
MOVT	R0, #hi_addr(_Label73+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2515 :: 		Label73.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label73+24)
MOVT	R0, #hi_addr(_Label73+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2516 :: 		Label73.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label73+28)
MOVT	R0, #hi_addr(_Label73+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2517 :: 		Label73.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label73+32)
MOVT	R0, #hi_addr(_Label73+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2518 :: 		Label73.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label73+36)
MOVT	R0, #hi_addr(_Label73+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2519 :: 		Label73.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label73+40)
MOVT	R0, #hi_addr(_Label73+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2521 :: 		Box7.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Box7+0)
MOVT	R0, #hi_addr(_Box7+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2522 :: 		Box7.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+4)
MOVT	R0, #hi_addr(_Box7+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2523 :: 		Box7.Left            = 376;
MOVW	R1, #376
MOVW	R0, #lo_addr(_Box7+6)
MOVT	R0, #hi_addr(_Box7+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2524 :: 		Box7.Top             = 234;
MOVS	R1, #234
MOVW	R0, #lo_addr(_Box7+8)
MOVT	R0, #hi_addr(_Box7+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2525 :: 		Box7.Width           = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_Box7+10)
MOVT	R0, #hi_addr(_Box7+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2526 :: 		Box7.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Box7+12)
MOVT	R0, #hi_addr(_Box7+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2527 :: 		Box7.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box7+14)
MOVT	R0, #hi_addr(_Box7+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2528 :: 		Box7.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+16)
MOVT	R0, #hi_addr(_Box7+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2529 :: 		Box7.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+18)
MOVT	R0, #hi_addr(_Box7+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2530 :: 		Box7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box7+19)
MOVT	R0, #hi_addr(_Box7+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2531 :: 		Box7.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box7+20)
MOVT	R0, #hi_addr(_Box7+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2532 :: 		Box7.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box7+21)
MOVT	R0, #hi_addr(_Box7+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2533 :: 		Box7.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+22)
MOVT	R0, #hi_addr(_Box7+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2534 :: 		Box7.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box7+24)
MOVT	R0, #hi_addr(_Box7+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2535 :: 		Box7.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box7+26)
MOVT	R0, #hi_addr(_Box7+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2536 :: 		Box7.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box7+28)
MOVT	R0, #hi_addr(_Box7+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2537 :: 		Box7.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+30)
MOVT	R0, #hi_addr(_Box7+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2538 :: 		Box7.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box7+32)
MOVT	R0, #hi_addr(_Box7+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2539 :: 		Box7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+36)
MOVT	R0, #hi_addr(_Box7+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2540 :: 		Box7.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+40)
MOVT	R0, #hi_addr(_Box7+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2541 :: 		Box7.OnClickPtr      = Image18OnPress;
MOVW	R1, #lo_addr(_Image18OnPress+0)
MOVT	R1, #hi_addr(_Image18OnPress+0)
MOVW	R0, #lo_addr(_Box7+44)
MOVT	R0, #hi_addr(_Box7+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2542 :: 		Box7.OnPressPtr      = Image18OnPress;
MOVW	R1, #lo_addr(_Image18OnPress+0)
MOVT	R1, #hi_addr(_Image18OnPress+0)
MOVW	R0, #lo_addr(_Box7+48)
MOVT	R0, #hi_addr(_Box7+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2544 :: 		Box8.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Box8+0)
MOVT	R0, #hi_addr(_Box8+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2545 :: 		Box8.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box8+4)
MOVT	R0, #hi_addr(_Box8+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2546 :: 		Box8.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+6)
MOVT	R0, #hi_addr(_Box8+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2547 :: 		Box8.Top             = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_Box8+8)
MOVT	R0, #hi_addr(_Box8+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2548 :: 		Box8.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Box8+10)
MOVT	R0, #hi_addr(_Box8+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2549 :: 		Box8.Height          = 193;
MOVS	R1, #193
MOVW	R0, #lo_addr(_Box8+12)
MOVT	R0, #hi_addr(_Box8+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2550 :: 		Box8.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+14)
MOVT	R0, #hi_addr(_Box8+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2551 :: 		Box8.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+16)
MOVT	R0, #hi_addr(_Box8+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2552 :: 		Box8.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+18)
MOVT	R0, #hi_addr(_Box8+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2553 :: 		Box8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box8+19)
MOVT	R0, #hi_addr(_Box8+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2554 :: 		Box8.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+20)
MOVT	R0, #hi_addr(_Box8+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2555 :: 		Box8.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+21)
MOVT	R0, #hi_addr(_Box8+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2556 :: 		Box8.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+22)
MOVT	R0, #hi_addr(_Box8+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2557 :: 		Box8.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box8+24)
MOVT	R0, #hi_addr(_Box8+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2558 :: 		Box8.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box8+26)
MOVT	R0, #hi_addr(_Box8+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2559 :: 		Box8.Color           = 0x54C3;
MOVW	R1, #21699
MOVW	R0, #lo_addr(_Box8+28)
MOVT	R0, #hi_addr(_Box8+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2560 :: 		Box8.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+30)
MOVT	R0, #hi_addr(_Box8+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2561 :: 		Box8.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box8+32)
MOVT	R0, #hi_addr(_Box8+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2562 :: 		Box8.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+36)
MOVT	R0, #hi_addr(_Box8+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2563 :: 		Box8.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+40)
MOVT	R0, #hi_addr(_Box8+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2564 :: 		Box8.OnClickPtr      = Box8OnClick;
MOVW	R1, #lo_addr(_Box8OnClick+0)
MOVT	R1, #hi_addr(_Box8OnClick+0)
MOVW	R0, #lo_addr(_Box8+44)
MOVT	R0, #hi_addr(_Box8+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2565 :: 		Box8.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+48)
MOVT	R0, #hi_addr(_Box8+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2567 :: 		Label2.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Label2+0)
MOVT	R0, #hi_addr(_Label2+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2568 :: 		Label2.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label2+4)
MOVT	R0, #hi_addr(_Label2+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2569 :: 		Label2.Left            = 191;
MOVS	R1, #191
MOVW	R0, #lo_addr(_Label2+6)
MOVT	R0, #hi_addr(_Label2+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2570 :: 		Label2.Top             = 94;
MOVS	R1, #94
MOVW	R0, #lo_addr(_Label2+8)
MOVT	R0, #hi_addr(_Label2+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2571 :: 		Label2.Width           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label2+10)
MOVT	R0, #hi_addr(_Label2+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2572 :: 		Label2.Height          = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Label2+12)
MOVT	R0, #hi_addr(_Label2+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2573 :: 		Label2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+26)
MOVT	R0, #hi_addr(_Label2+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2574 :: 		Label2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+27)
MOVT	R0, #hi_addr(_Label2+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2575 :: 		Label2.Caption         = Label2_Caption;
MOVW	R1, #lo_addr(_Label2_Caption+0)
MOVT	R1, #hi_addr(_Label2_Caption+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2576 :: 		Label2.FontName        = Open_Sans_Light51x78_Regular;
MOVW	R1, #60365
MOVW	R0, #lo_addr(_Label2+20)
MOVT	R0, #hi_addr(_Label2+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2577 :: 		Label2.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2578 :: 		Label2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+28)
MOVT	R0, #hi_addr(_Label2+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2579 :: 		Label2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+32)
MOVT	R0, #hi_addr(_Label2+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2580 :: 		Label2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+36)
MOVT	R0, #hi_addr(_Label2+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2581 :: 		Label2.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+40)
MOVT	R0, #hi_addr(_Label2+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2583 :: 		Box10.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Box10+0)
MOVT	R0, #hi_addr(_Box10+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2584 :: 		Box10.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Box10+4)
MOVT	R0, #hi_addr(_Box10+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2585 :: 		Box10.Left            = 108;
MOVS	R1, #108
MOVW	R0, #lo_addr(_Box10+6)
MOVT	R0, #hi_addr(_Box10+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2586 :: 		Box10.Top             = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box10+8)
MOVT	R0, #hi_addr(_Box10+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2587 :: 		Box10.Width           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Box10+10)
MOVT	R0, #hi_addr(_Box10+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2588 :: 		Box10.Height          = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Box10+12)
MOVT	R0, #hi_addr(_Box10+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2589 :: 		Box10.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+14)
MOVT	R0, #hi_addr(_Box10+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2590 :: 		Box10.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+16)
MOVT	R0, #hi_addr(_Box10+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2591 :: 		Box10.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+18)
MOVT	R0, #hi_addr(_Box10+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2592 :: 		Box10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box10+19)
MOVT	R0, #hi_addr(_Box10+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2593 :: 		Box10.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+20)
MOVT	R0, #hi_addr(_Box10+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2594 :: 		Box10.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+21)
MOVT	R0, #hi_addr(_Box10+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2595 :: 		Box10.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+22)
MOVT	R0, #hi_addr(_Box10+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2596 :: 		Box10.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box10+24)
MOVT	R0, #hi_addr(_Box10+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2597 :: 		Box10.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box10+26)
MOVT	R0, #hi_addr(_Box10+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2598 :: 		Box10.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box10+28)
MOVT	R0, #hi_addr(_Box10+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2599 :: 		Box10.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box10+30)
MOVT	R0, #hi_addr(_Box10+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2600 :: 		Box10.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box10+32)
MOVT	R0, #hi_addr(_Box10+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2601 :: 		Box10.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+36)
MOVT	R0, #hi_addr(_Box10+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2602 :: 		Box10.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+40)
MOVT	R0, #hi_addr(_Box10+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2603 :: 		Box10.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+44)
MOVT	R0, #hi_addr(_Box10+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2604 :: 		Box10.OnPressPtr      = Box10OnPress;
MOVW	R1, #lo_addr(_Box10OnPress+0)
MOVT	R1, #hi_addr(_Box10OnPress+0)
MOVW	R0, #lo_addr(_Box10+48)
MOVT	R0, #hi_addr(_Box10+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2606 :: 		Box11.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Box11+0)
MOVT	R0, #hi_addr(_Box11+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2607 :: 		Box11.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box11+4)
MOVT	R0, #hi_addr(_Box11+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2608 :: 		Box11.Left            = 146;
MOVS	R1, #146
MOVW	R0, #lo_addr(_Box11+6)
MOVT	R0, #hi_addr(_Box11+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2609 :: 		Box11.Top             = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box11+8)
MOVT	R0, #hi_addr(_Box11+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2610 :: 		Box11.Width           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Box11+10)
MOVT	R0, #hi_addr(_Box11+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2611 :: 		Box11.Height          = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Box11+12)
MOVT	R0, #hi_addr(_Box11+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2612 :: 		Box11.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+14)
MOVT	R0, #hi_addr(_Box11+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2613 :: 		Box11.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+16)
MOVT	R0, #hi_addr(_Box11+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2614 :: 		Box11.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+18)
MOVT	R0, #hi_addr(_Box11+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2615 :: 		Box11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box11+19)
MOVT	R0, #hi_addr(_Box11+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2616 :: 		Box11.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+20)
MOVT	R0, #hi_addr(_Box11+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2617 :: 		Box11.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+21)
MOVT	R0, #hi_addr(_Box11+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2618 :: 		Box11.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+22)
MOVT	R0, #hi_addr(_Box11+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2619 :: 		Box11.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box11+24)
MOVT	R0, #hi_addr(_Box11+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2620 :: 		Box11.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box11+26)
MOVT	R0, #hi_addr(_Box11+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2621 :: 		Box11.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box11+28)
MOVT	R0, #hi_addr(_Box11+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2622 :: 		Box11.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box11+30)
MOVT	R0, #hi_addr(_Box11+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2623 :: 		Box11.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box11+32)
MOVT	R0, #hi_addr(_Box11+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2624 :: 		Box11.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+36)
MOVT	R0, #hi_addr(_Box11+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2625 :: 		Box11.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+40)
MOVT	R0, #hi_addr(_Box11+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2626 :: 		Box11.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+44)
MOVT	R0, #hi_addr(_Box11+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2627 :: 		Box11.OnPressPtr      = Box11OnPress;
MOVW	R1, #lo_addr(_Box11OnPress+0)
MOVT	R1, #hi_addr(_Box11OnPress+0)
MOVW	R0, #lo_addr(_Box11+48)
MOVT	R0, #hi_addr(_Box11+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2629 :: 		Label5.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Label5+0)
MOVT	R0, #hi_addr(_Label5+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2630 :: 		Label5.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label5+4)
MOVT	R0, #hi_addr(_Label5+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2631 :: 		Label5.Left            = 408;
MOVW	R1, #408
MOVW	R0, #lo_addr(_Label5+6)
MOVT	R0, #hi_addr(_Label5+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2632 :: 		Label5.Top             = 236;
MOVS	R1, #236
MOVW	R0, #lo_addr(_Label5+8)
MOVT	R0, #hi_addr(_Label5+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2633 :: 		Label5.Width           = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Label5+10)
MOVT	R0, #hi_addr(_Label5+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2634 :: 		Label5.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label5+12)
MOVT	R0, #hi_addr(_Label5+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2635 :: 		Label5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+26)
MOVT	R0, #hi_addr(_Label5+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2636 :: 		Label5.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+27)
MOVT	R0, #hi_addr(_Label5+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2637 :: 		Label5.Caption         = Label5_Caption;
MOVW	R1, #lo_addr(_Label5_Caption+0)
MOVT	R1, #hi_addr(_Label5_Caption+0)
MOVW	R0, #lo_addr(_Label5+16)
MOVT	R0, #hi_addr(_Label5+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2638 :: 		Label5.FontName        = Arial_Black16x23_Regular;
MOVW	R1, #2595
MOVW	R0, #lo_addr(_Label5+20)
MOVT	R0, #hi_addr(_Label5+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2639 :: 		Label5.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+24)
MOVT	R0, #hi_addr(_Label5+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2640 :: 		Label5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+28)
MOVT	R0, #hi_addr(_Label5+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2641 :: 		Label5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+32)
MOVT	R0, #hi_addr(_Label5+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2642 :: 		Label5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+36)
MOVT	R0, #hi_addr(_Label5+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2643 :: 		Label5.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+40)
MOVT	R0, #hi_addr(_Label5+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2645 :: 		Image18.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Image18+0)
MOVT	R0, #hi_addr(_Image18+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2646 :: 		Image18.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image18+4)
MOVT	R0, #hi_addr(_Image18+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2647 :: 		Image18.Left            = 380;
MOVW	R1, #380
MOVW	R0, #lo_addr(_Image18+6)
MOVT	R0, #hi_addr(_Image18+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2648 :: 		Image18.Top             = 236;
MOVS	R1, #236
MOVW	R0, #lo_addr(_Image18+8)
MOVT	R0, #hi_addr(_Image18+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2649 :: 		Image18.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image18+10)
MOVT	R0, #hi_addr(_Image18+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2650 :: 		Image18.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image18+12)
MOVT	R0, #hi_addr(_Image18+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2651 :: 		Image18.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+22)
MOVT	R0, #hi_addr(_Image18+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2652 :: 		Image18.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image18+23)
MOVT	R0, #hi_addr(_Image18+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2653 :: 		Image18.Picture_Name    = icon_ok_bmp;
MOVW	R1, #38068
MOVT	R1, #61
MOVW	R0, #lo_addr(_Image18+16)
MOVT	R0, #hi_addr(_Image18+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2654 :: 		Image18.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image18+20)
MOVT	R0, #hi_addr(_Image18+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2655 :: 		Image18.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+21)
MOVT	R0, #hi_addr(_Image18+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2656 :: 		Image18.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+24)
MOVT	R0, #hi_addr(_Image18+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2657 :: 		Image18.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+28)
MOVT	R0, #hi_addr(_Image18+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2658 :: 		Image18.OnClickPtr      = Image18OnPress;
MOVW	R1, #lo_addr(_Image18OnPress+0)
MOVT	R1, #hi_addr(_Image18OnPress+0)
MOVW	R0, #lo_addr(_Image18+32)
MOVT	R0, #hi_addr(_Image18+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2659 :: 		Image18.OnPressPtr      = Image18OnPress;
MOVW	R1, #lo_addr(_Image18OnPress+0)
MOVT	R1, #hi_addr(_Image18OnPress+0)
MOVW	R0, #lo_addr(_Image18+36)
MOVT	R0, #hi_addr(_Image18+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2661 :: 		Box3.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Box3+0)
MOVT	R0, #hi_addr(_Box3+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2662 :: 		Box3.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Box3+4)
MOVT	R0, #hi_addr(_Box3+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2663 :: 		Box3.Left            = 212;
MOVS	R1, #212
MOVW	R0, #lo_addr(_Box3+6)
MOVT	R0, #hi_addr(_Box3+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2664 :: 		Box3.Top             = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box3+8)
MOVT	R0, #hi_addr(_Box3+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2665 :: 		Box3.Width           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Box3+10)
MOVT	R0, #hi_addr(_Box3+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2666 :: 		Box3.Height          = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Box3+12)
MOVT	R0, #hi_addr(_Box3+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2667 :: 		Box3.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+14)
MOVT	R0, #hi_addr(_Box3+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2668 :: 		Box3.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+16)
MOVT	R0, #hi_addr(_Box3+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2669 :: 		Box3.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+18)
MOVT	R0, #hi_addr(_Box3+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2670 :: 		Box3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+19)
MOVT	R0, #hi_addr(_Box3+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2671 :: 		Box3.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+20)
MOVT	R0, #hi_addr(_Box3+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2672 :: 		Box3.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+21)
MOVT	R0, #hi_addr(_Box3+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2673 :: 		Box3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+22)
MOVT	R0, #hi_addr(_Box3+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2674 :: 		Box3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box3+24)
MOVT	R0, #hi_addr(_Box3+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2675 :: 		Box3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box3+26)
MOVT	R0, #hi_addr(_Box3+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2676 :: 		Box3.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box3+28)
MOVT	R0, #hi_addr(_Box3+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2677 :: 		Box3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+30)
MOVT	R0, #hi_addr(_Box3+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2678 :: 		Box3.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box3+32)
MOVT	R0, #hi_addr(_Box3+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2679 :: 		Box3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+36)
MOVT	R0, #hi_addr(_Box3+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2680 :: 		Box3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+40)
MOVT	R0, #hi_addr(_Box3+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2681 :: 		Box3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+44)
MOVT	R0, #hi_addr(_Box3+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2682 :: 		Box3.OnPressPtr      = Box3OnPress;
MOVW	R1, #lo_addr(_Box3OnPress+0)
MOVT	R1, #hi_addr(_Box3OnPress+0)
MOVW	R0, #lo_addr(_Box3+48)
MOVT	R0, #hi_addr(_Box3+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2684 :: 		Box4.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Box4+0)
MOVT	R0, #hi_addr(_Box4+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2685 :: 		Box4.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Box4+4)
MOVT	R0, #hi_addr(_Box4+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2686 :: 		Box4.Left            = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Box4+6)
MOVT	R0, #hi_addr(_Box4+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2687 :: 		Box4.Top             = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box4+8)
MOVT	R0, #hi_addr(_Box4+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2688 :: 		Box4.Width           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Box4+10)
MOVT	R0, #hi_addr(_Box4+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2689 :: 		Box4.Height          = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Box4+12)
MOVT	R0, #hi_addr(_Box4+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2690 :: 		Box4.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+14)
MOVT	R0, #hi_addr(_Box4+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2691 :: 		Box4.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+16)
MOVT	R0, #hi_addr(_Box4+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2692 :: 		Box4.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+18)
MOVT	R0, #hi_addr(_Box4+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2693 :: 		Box4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box4+19)
MOVT	R0, #hi_addr(_Box4+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2694 :: 		Box4.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+20)
MOVT	R0, #hi_addr(_Box4+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2695 :: 		Box4.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+21)
MOVT	R0, #hi_addr(_Box4+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2696 :: 		Box4.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+22)
MOVT	R0, #hi_addr(_Box4+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2697 :: 		Box4.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box4+24)
MOVT	R0, #hi_addr(_Box4+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2698 :: 		Box4.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box4+26)
MOVT	R0, #hi_addr(_Box4+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2699 :: 		Box4.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box4+28)
MOVT	R0, #hi_addr(_Box4+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2700 :: 		Box4.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box4+30)
MOVT	R0, #hi_addr(_Box4+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2701 :: 		Box4.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box4+32)
MOVT	R0, #hi_addr(_Box4+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2702 :: 		Box4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+36)
MOVT	R0, #hi_addr(_Box4+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2703 :: 		Box4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+40)
MOVT	R0, #hi_addr(_Box4+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2704 :: 		Box4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+44)
MOVT	R0, #hi_addr(_Box4+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2705 :: 		Box4.OnPressPtr      = Box4OnPress;
MOVW	R1, #lo_addr(_Box4OnPress+0)
MOVT	R1, #hi_addr(_Box4OnPress+0)
MOVW	R0, #lo_addr(_Box4+48)
MOVT	R0, #hi_addr(_Box4+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2707 :: 		Image19.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Image19+0)
MOVT	R0, #hi_addr(_Image19+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2708 :: 		Image19.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Image19+4)
MOVT	R0, #hi_addr(_Image19+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2709 :: 		Image19.Left            = 475;
MOVW	R1, #475
MOVW	R0, #lo_addr(_Image19+6)
MOVT	R0, #hi_addr(_Image19+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2710 :: 		Image19.Top             = 248;
MOVS	R1, #248
MOVW	R0, #lo_addr(_Image19+8)
MOVT	R0, #hi_addr(_Image19+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2711 :: 		Image19.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Image19+10)
MOVT	R0, #hi_addr(_Image19+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2712 :: 		Image19.Height          = 740;
MOVW	R1, #740
MOVW	R0, #lo_addr(_Image19+12)
MOVT	R0, #hi_addr(_Image19+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2713 :: 		Image19.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image19+22)
MOVT	R0, #hi_addr(_Image19+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2714 :: 		Image19.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image19+23)
MOVT	R0, #hi_addr(_Image19+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2715 :: 		Image19.Picture_Name    = stripe_black_bmp;
MOVW	R1, #39042
MOVT	R1, #61
MOVW	R0, #lo_addr(_Image19+16)
MOVT	R0, #hi_addr(_Image19+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2716 :: 		Image19.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image19+20)
MOVT	R0, #hi_addr(_Image19+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2717 :: 		Image19.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image19+21)
MOVT	R0, #hi_addr(_Image19+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2718 :: 		Image19.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image19+24)
MOVT	R0, #hi_addr(_Image19+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2719 :: 		Image19.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image19+28)
MOVT	R0, #hi_addr(_Image19+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2720 :: 		Image19.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image19+32)
MOVT	R0, #hi_addr(_Image19+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2721 :: 		Image19.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image19+36)
MOVT	R0, #hi_addr(_Image19+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2723 :: 		Label6.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Label6+0)
MOVT	R0, #hi_addr(_Label6+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2724 :: 		Label6.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label6+4)
MOVT	R0, #hi_addr(_Label6+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2725 :: 		Label6.Left            = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label6+6)
MOVT	R0, #hi_addr(_Label6+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2726 :: 		Label6.Top             = 235;
MOVS	R1, #235
MOVW	R0, #lo_addr(_Label6+8)
MOVT	R0, #hi_addr(_Label6+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2727 :: 		Label6.Width           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+10)
MOVT	R0, #hi_addr(_Label6+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2728 :: 		Label6.Height          = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Label6+12)
MOVT	R0, #hi_addr(_Label6+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2729 :: 		Label6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+26)
MOVT	R0, #hi_addr(_Label6+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2730 :: 		Label6.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+27)
MOVT	R0, #hi_addr(_Label6+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2731 :: 		Label6.Caption         = Label6_Caption;
MOVW	R1, #lo_addr(_Label6_Caption+0)
MOVT	R1, #hi_addr(_Label6_Caption+0)
MOVW	R0, #lo_addr(_Label6+16)
MOVT	R0, #hi_addr(_Label6+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2732 :: 		Label6.FontName        = Open_Sans_Light12x18_Regular;
MOVW	R1, #49991
MOVW	R0, #lo_addr(_Label6+20)
MOVT	R0, #hi_addr(_Label6+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2733 :: 		Label6.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label6+24)
MOVT	R0, #hi_addr(_Label6+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2734 :: 		Label6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+28)
MOVT	R0, #hi_addr(_Label6+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2735 :: 		Label6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+32)
MOVT	R0, #hi_addr(_Label6+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2736 :: 		Label6.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+36)
MOVT	R0, #hi_addr(_Label6+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2737 :: 		Label6.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+40)
MOVT	R0, #hi_addr(_Label6+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2739 :: 		Image20.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Image20+0)
MOVT	R0, #hi_addr(_Image20+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2740 :: 		Image20.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Image20+4)
MOVT	R0, #hi_addr(_Image20+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2741 :: 		Image20.Left            = 474;
MOVW	R1, #474
MOVW	R0, #lo_addr(_Image20+6)
MOVT	R0, #hi_addr(_Image20+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2742 :: 		Image20.Top             = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Image20+8)
MOVT	R0, #hi_addr(_Image20+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2743 :: 		Image20.Width           = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_Image20+10)
MOVT	R0, #hi_addr(_Image20+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2744 :: 		Image20.Height          = 151;
MOVS	R1, #151
MOVW	R0, #lo_addr(_Image20+12)
MOVT	R0, #hi_addr(_Image20+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2745 :: 		Image20.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+22)
MOVT	R0, #hi_addr(_Image20+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2746 :: 		Image20.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image20+23)
MOVT	R0, #hi_addr(_Image20+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2747 :: 		Image20.Picture_Name    = am_pm_bmp;
MOVW	R1, #26792
MOVT	R1, #62
MOVW	R0, #lo_addr(_Image20+16)
MOVT	R0, #hi_addr(_Image20+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2748 :: 		Image20.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+20)
MOVT	R0, #hi_addr(_Image20+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2749 :: 		Image20.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+21)
MOVT	R0, #hi_addr(_Image20+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2750 :: 		Image20.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+24)
MOVT	R0, #hi_addr(_Image20+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2751 :: 		Image20.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+28)
MOVT	R0, #hi_addr(_Image20+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2752 :: 		Image20.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+32)
MOVT	R0, #hi_addr(_Image20+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2753 :: 		Image20.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+36)
MOVT	R0, #hi_addr(_Image20+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2755 :: 		Box5.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Box5+0)
MOVT	R0, #hi_addr(_Box5+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2756 :: 		Box5.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Box5+4)
MOVT	R0, #hi_addr(_Box5+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2757 :: 		Box5.Left            = 305;
MOVW	R1, #305
MOVW	R0, #lo_addr(_Box5+6)
MOVT	R0, #hi_addr(_Box5+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2758 :: 		Box5.Top             = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box5+8)
MOVT	R0, #hi_addr(_Box5+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2759 :: 		Box5.Width           = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_Box5+10)
MOVT	R0, #hi_addr(_Box5+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2760 :: 		Box5.Height          = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Box5+12)
MOVT	R0, #hi_addr(_Box5+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2761 :: 		Box5.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+14)
MOVT	R0, #hi_addr(_Box5+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2762 :: 		Box5.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+16)
MOVT	R0, #hi_addr(_Box5+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2763 :: 		Box5.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+18)
MOVT	R0, #hi_addr(_Box5+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2764 :: 		Box5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box5+19)
MOVT	R0, #hi_addr(_Box5+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2765 :: 		Box5.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+20)
MOVT	R0, #hi_addr(_Box5+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2766 :: 		Box5.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+21)
MOVT	R0, #hi_addr(_Box5+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2767 :: 		Box5.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+22)
MOVT	R0, #hi_addr(_Box5+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2768 :: 		Box5.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box5+24)
MOVT	R0, #hi_addr(_Box5+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2769 :: 		Box5.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box5+26)
MOVT	R0, #hi_addr(_Box5+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2770 :: 		Box5.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box5+28)
MOVT	R0, #hi_addr(_Box5+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2771 :: 		Box5.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box5+30)
MOVT	R0, #hi_addr(_Box5+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2772 :: 		Box5.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box5+32)
MOVT	R0, #hi_addr(_Box5+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2773 :: 		Box5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+36)
MOVT	R0, #hi_addr(_Box5+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2774 :: 		Box5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+40)
MOVT	R0, #hi_addr(_Box5+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2775 :: 		Box5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+44)
MOVT	R0, #hi_addr(_Box5+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2776 :: 		Box5.OnPressPtr      = Box5OnPress;
MOVW	R1, #lo_addr(_Box5OnPress+0)
MOVT	R1, #hi_addr(_Box5OnPress+0)
MOVW	R0, #lo_addr(_Box5+48)
MOVT	R0, #hi_addr(_Box5+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2778 :: 		Box23.OwnerScreen     = &Accelerometer_test;
MOVW	R1, #lo_addr(_Accelerometer_test+0)
MOVT	R1, #hi_addr(_Accelerometer_test+0)
MOVW	R0, #lo_addr(_Box23+0)
MOVT	R0, #hi_addr(_Box23+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2779 :: 		Box23.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+4)
MOVT	R0, #hi_addr(_Box23+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2780 :: 		Box23.Left            = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box23+6)
MOVT	R0, #hi_addr(_Box23+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2781 :: 		Box23.Top             = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Box23+8)
MOVT	R0, #hi_addr(_Box23+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2782 :: 		Box23.Width           = 236;
MOVS	R1, #236
MOVW	R0, #lo_addr(_Box23+10)
MOVT	R0, #hi_addr(_Box23+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2783 :: 		Box23.Height          = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Box23+12)
MOVT	R0, #hi_addr(_Box23+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2784 :: 		Box23.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box23+14)
MOVT	R0, #hi_addr(_Box23+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2785 :: 		Box23.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+16)
MOVT	R0, #hi_addr(_Box23+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2786 :: 		Box23.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+18)
MOVT	R0, #hi_addr(_Box23+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2787 :: 		Box23.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box23+19)
MOVT	R0, #hi_addr(_Box23+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2788 :: 		Box23.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box23+20)
MOVT	R0, #hi_addr(_Box23+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2789 :: 		Box23.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+21)
MOVT	R0, #hi_addr(_Box23+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2790 :: 		Box23.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+22)
MOVT	R0, #hi_addr(_Box23+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2791 :: 		Box23.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box23+24)
MOVT	R0, #hi_addr(_Box23+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2792 :: 		Box23.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box23+26)
MOVT	R0, #hi_addr(_Box23+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2793 :: 		Box23.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box23+28)
MOVT	R0, #hi_addr(_Box23+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2794 :: 		Box23.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+30)
MOVT	R0, #hi_addr(_Box23+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2795 :: 		Box23.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box23+32)
MOVT	R0, #hi_addr(_Box23+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2796 :: 		Box23.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+36)
MOVT	R0, #hi_addr(_Box23+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2797 :: 		Box23.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+40)
MOVT	R0, #hi_addr(_Box23+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2798 :: 		Box23.OnClickPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Box23+44)
MOVT	R0, #hi_addr(_Box23+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2799 :: 		Box23.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+48)
MOVT	R0, #hi_addr(_Box23+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2801 :: 		Box6.OwnerScreen     = &Accelerometer_test;
MOVW	R1, #lo_addr(_Accelerometer_test+0)
MOVT	R1, #hi_addr(_Accelerometer_test+0)
MOVW	R0, #lo_addr(_Box6+0)
MOVT	R0, #hi_addr(_Box6+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2802 :: 		Box6.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+4)
MOVT	R0, #hi_addr(_Box6+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2803 :: 		Box6.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+6)
MOVT	R0, #hi_addr(_Box6+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2804 :: 		Box6.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Box6+8)
MOVT	R0, #hi_addr(_Box6+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2805 :: 		Box6.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Box6+10)
MOVT	R0, #hi_addr(_Box6+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2806 :: 		Box6.Height          = 207;
MOVS	R1, #207
MOVW	R0, #lo_addr(_Box6+12)
MOVT	R0, #hi_addr(_Box6+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2807 :: 		Box6.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+14)
MOVT	R0, #hi_addr(_Box6+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2808 :: 		Box6.Pen_Color       = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box6+16)
MOVT	R0, #hi_addr(_Box6+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2809 :: 		Box6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+18)
MOVT	R0, #hi_addr(_Box6+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2810 :: 		Box6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+19)
MOVT	R0, #hi_addr(_Box6+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2811 :: 		Box6.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+20)
MOVT	R0, #hi_addr(_Box6+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2812 :: 		Box6.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+21)
MOVT	R0, #hi_addr(_Box6+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2813 :: 		Box6.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+22)
MOVT	R0, #hi_addr(_Box6+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2814 :: 		Box6.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box6+24)
MOVT	R0, #hi_addr(_Box6+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2815 :: 		Box6.Gradient_End_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box6+26)
MOVT	R0, #hi_addr(_Box6+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2816 :: 		Box6.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box6+28)
MOVT	R0, #hi_addr(_Box6+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2817 :: 		Box6.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+30)
MOVT	R0, #hi_addr(_Box6+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2818 :: 		Box6.Press_Color     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box6+32)
MOVT	R0, #hi_addr(_Box6+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2819 :: 		Box6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+36)
MOVT	R0, #hi_addr(_Box6+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2820 :: 		Box6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+40)
MOVT	R0, #hi_addr(_Box6+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2821 :: 		Box6.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+44)
MOVT	R0, #hi_addr(_Box6+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2822 :: 		Box6.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+48)
MOVT	R0, #hi_addr(_Box6+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2824 :: 		Image49.OwnerScreen     = &Accelerometer_test;
MOVW	R1, #lo_addr(_Accelerometer_test+0)
MOVT	R1, #hi_addr(_Accelerometer_test+0)
MOVW	R0, #lo_addr(_Image49+0)
MOVT	R0, #hi_addr(_Image49+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2825 :: 		Image49.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image49+4)
MOVT	R0, #hi_addr(_Image49+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2826 :: 		Image49.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image49+6)
MOVT	R0, #hi_addr(_Image49+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2827 :: 		Image49.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image49+8)
MOVT	R0, #hi_addr(_Image49+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2828 :: 		Image49.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image49+10)
MOVT	R0, #hi_addr(_Image49+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2829 :: 		Image49.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image49+12)
MOVT	R0, #hi_addr(_Image49+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2830 :: 		Image49.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image49+22)
MOVT	R0, #hi_addr(_Image49+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2831 :: 		Image49.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image49+23)
MOVT	R0, #hi_addr(_Image49+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2832 :: 		Image49.Picture_Name    = icon_back_accel_bmp;
MOVW	R1, #53978
MOVT	R1, #62
MOVW	R0, #lo_addr(_Image49+16)
MOVT	R0, #hi_addr(_Image49+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2833 :: 		Image49.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image49+20)
MOVT	R0, #hi_addr(_Image49+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2834 :: 		Image49.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image49+21)
MOVT	R0, #hi_addr(_Image49+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2835 :: 		Image49.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image49+24)
MOVT	R0, #hi_addr(_Image49+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2836 :: 		Image49.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image49+28)
MOVT	R0, #hi_addr(_Image49+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2837 :: 		Image49.OnClickPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Image49+32)
MOVT	R0, #hi_addr(_Image49+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2838 :: 		Image49.OnPressPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Image49+36)
MOVT	R0, #hi_addr(_Image49+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2840 :: 		Label1.OwnerScreen     = &Accelerometer_test;
MOVW	R1, #lo_addr(_Accelerometer_test+0)
MOVT	R1, #hi_addr(_Accelerometer_test+0)
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2841 :: 		Label1.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label1+4)
MOVT	R0, #hi_addr(_Label1+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2842 :: 		Label1.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label1+6)
MOVT	R0, #hi_addr(_Label1+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2843 :: 		Label1.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label1+8)
MOVT	R0, #hi_addr(_Label1+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2844 :: 		Label1.Width           = 209;
MOVS	R1, #209
MOVW	R0, #lo_addr(_Label1+10)
MOVT	R0, #hi_addr(_Label1+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2845 :: 		Label1.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label1+12)
MOVT	R0, #hi_addr(_Label1+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2846 :: 		Label1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+26)
MOVT	R0, #hi_addr(_Label1+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2847 :: 		Label1.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+27)
MOVT	R0, #hi_addr(_Label1+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2848 :: 		Label1.Caption         = Label1_Caption;
MOVW	R1, #lo_addr(_Label1_Caption+0)
MOVT	R1, #hi_addr(_Label1_Caption+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2849 :: 		Label1.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R1, #55353
MOVW	R0, #lo_addr(_Label1+20)
MOVT	R0, #hi_addr(_Label1+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2850 :: 		Label1.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label1+24)
MOVT	R0, #hi_addr(_Label1+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2851 :: 		Label1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+28)
MOVT	R0, #hi_addr(_Label1+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2852 :: 		Label1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+32)
MOVT	R0, #hi_addr(_Label1+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2853 :: 		Label1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+36)
MOVT	R0, #hi_addr(_Label1+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2854 :: 		Label1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+40)
MOVT	R0, #hi_addr(_Label1+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2856 :: 		Label3.OwnerScreen     = &Accelerometer_test;
MOVW	R1, #lo_addr(_Accelerometer_test+0)
MOVT	R1, #hi_addr(_Accelerometer_test+0)
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2857 :: 		Label3.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label3+4)
MOVT	R0, #hi_addr(_Label3+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2858 :: 		Label3.Left            = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_Label3+6)
MOVT	R0, #hi_addr(_Label3+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2859 :: 		Label3.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label3+8)
MOVT	R0, #hi_addr(_Label3+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2860 :: 		Label3.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label3+10)
MOVT	R0, #hi_addr(_Label3+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2861 :: 		Label3.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label3+12)
MOVT	R0, #hi_addr(_Label3+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2862 :: 		Label3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+26)
MOVT	R0, #hi_addr(_Label3+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2863 :: 		Label3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+27)
MOVT	R0, #hi_addr(_Label3+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2864 :: 		Label3.Caption         = Label3_Caption;
MOVW	R1, #lo_addr(_Label3_Caption+0)
MOVT	R1, #hi_addr(_Label3_Caption+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2865 :: 		Label3.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #52255
MOVW	R0, #lo_addr(_Label3+20)
MOVT	R0, #hi_addr(_Label3+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2866 :: 		Label3.Font_Color      = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label3+24)
MOVT	R0, #hi_addr(_Label3+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2867 :: 		Label3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+28)
MOVT	R0, #hi_addr(_Label3+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2868 :: 		Label3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+32)
MOVT	R0, #hi_addr(_Label3+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2869 :: 		Label3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+36)
MOVT	R0, #hi_addr(_Label3+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2870 :: 		Label3.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+40)
MOVT	R0, #hi_addr(_Label3+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2872 :: 		Label4.OwnerScreen     = &Accelerometer_test;
MOVW	R1, #lo_addr(_Accelerometer_test+0)
MOVT	R1, #hi_addr(_Accelerometer_test+0)
MOVW	R0, #lo_addr(_Label4+0)
MOVT	R0, #hi_addr(_Label4+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2873 :: 		Label4.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label4+4)
MOVT	R0, #hi_addr(_Label4+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2874 :: 		Label4.Left            = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Label4+6)
MOVT	R0, #hi_addr(_Label4+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2875 :: 		Label4.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label4+8)
MOVT	R0, #hi_addr(_Label4+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2876 :: 		Label4.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label4+10)
MOVT	R0, #hi_addr(_Label4+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2877 :: 		Label4.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label4+12)
MOVT	R0, #hi_addr(_Label4+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2878 :: 		Label4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+26)
MOVT	R0, #hi_addr(_Label4+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2879 :: 		Label4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+27)
MOVT	R0, #hi_addr(_Label4+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2880 :: 		Label4.Caption         = Label4_Caption;
MOVW	R1, #lo_addr(_Label4_Caption+0)
MOVT	R1, #hi_addr(_Label4_Caption+0)
MOVW	R0, #lo_addr(_Label4+16)
MOVT	R0, #hi_addr(_Label4+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2881 :: 		Label4.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #52255
MOVW	R0, #lo_addr(_Label4+20)
MOVT	R0, #hi_addr(_Label4+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2882 :: 		Label4.Font_Color      = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label4+24)
MOVT	R0, #hi_addr(_Label4+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2883 :: 		Label4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+28)
MOVT	R0, #hi_addr(_Label4+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2884 :: 		Label4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+32)
MOVT	R0, #hi_addr(_Label4+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2885 :: 		Label4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+36)
MOVT	R0, #hi_addr(_Label4+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2886 :: 		Label4.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+40)
MOVT	R0, #hi_addr(_Label4+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2888 :: 		Label7.OwnerScreen     = &Accelerometer_test;
MOVW	R1, #lo_addr(_Accelerometer_test+0)
MOVT	R1, #hi_addr(_Accelerometer_test+0)
MOVW	R0, #lo_addr(_Label7+0)
MOVT	R0, #hi_addr(_Label7+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2889 :: 		Label7.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label7+4)
MOVT	R0, #hi_addr(_Label7+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2890 :: 		Label7.Left            = 375;
MOVW	R1, #375
MOVW	R0, #lo_addr(_Label7+6)
MOVT	R0, #hi_addr(_Label7+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2891 :: 		Label7.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label7+8)
MOVT	R0, #hi_addr(_Label7+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2892 :: 		Label7.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label7+10)
MOVT	R0, #hi_addr(_Label7+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2893 :: 		Label7.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label7+12)
MOVT	R0, #hi_addr(_Label7+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2894 :: 		Label7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+26)
MOVT	R0, #hi_addr(_Label7+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2895 :: 		Label7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+27)
MOVT	R0, #hi_addr(_Label7+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2896 :: 		Label7.Caption         = Label7_Caption;
MOVW	R1, #lo_addr(_Label7_Caption+0)
MOVT	R1, #hi_addr(_Label7_Caption+0)
MOVW	R0, #lo_addr(_Label7+16)
MOVT	R0, #hi_addr(_Label7+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2897 :: 		Label7.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #52255
MOVW	R0, #lo_addr(_Label7+20)
MOVT	R0, #hi_addr(_Label7+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2898 :: 		Label7.Font_Color      = 0x0400;
MOVW	R1, #1024
MOVW	R0, #lo_addr(_Label7+24)
MOVT	R0, #hi_addr(_Label7+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2899 :: 		Label7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+28)
MOVT	R0, #hi_addr(_Label7+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2900 :: 		Label7.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+32)
MOVT	R0, #hi_addr(_Label7+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2901 :: 		Label7.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+36)
MOVT	R0, #hi_addr(_Label7+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2902 :: 		Label7.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+40)
MOVT	R0, #hi_addr(_Label7+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2904 :: 		Box9.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Box9+0)
MOVT	R0, #hi_addr(_Box9+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2905 :: 		Box9.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+4)
MOVT	R0, #hi_addr(_Box9+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2906 :: 		Box9.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+6)
MOVT	R0, #hi_addr(_Box9+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2907 :: 		Box9.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+8)
MOVT	R0, #hi_addr(_Box9+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2908 :: 		Box9.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Box9+10)
MOVT	R0, #hi_addr(_Box9+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2909 :: 		Box9.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Box9+12)
MOVT	R0, #hi_addr(_Box9+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2910 :: 		Box9.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box9+14)
MOVT	R0, #hi_addr(_Box9+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2911 :: 		Box9.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+16)
MOVT	R0, #hi_addr(_Box9+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2912 :: 		Box9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box9+18)
MOVT	R0, #hi_addr(_Box9+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2913 :: 		Box9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box9+19)
MOVT	R0, #hi_addr(_Box9+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2914 :: 		Box9.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box9+20)
MOVT	R0, #hi_addr(_Box9+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2915 :: 		Box9.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box9+21)
MOVT	R0, #hi_addr(_Box9+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2916 :: 		Box9.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+22)
MOVT	R0, #hi_addr(_Box9+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2917 :: 		Box9.Gradient_Start_Color = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Box9+24)
MOVT	R0, #hi_addr(_Box9+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2918 :: 		Box9.Gradient_End_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_Box9+26)
MOVT	R0, #hi_addr(_Box9+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2919 :: 		Box9.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box9+28)
MOVT	R0, #hi_addr(_Box9+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2920 :: 		Box9.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box9+30)
MOVT	R0, #hi_addr(_Box9+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2921 :: 		Box9.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box9+32)
MOVT	R0, #hi_addr(_Box9+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2922 :: 		Box9.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+36)
MOVT	R0, #hi_addr(_Box9+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2923 :: 		Box9.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+40)
MOVT	R0, #hi_addr(_Box9+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2924 :: 		Box9.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+44)
MOVT	R0, #hi_addr(_Box9+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2925 :: 		Box9.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+48)
MOVT	R0, #hi_addr(_Box9+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2927 :: 		Box16.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Box16+0)
MOVT	R0, #hi_addr(_Box16+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2928 :: 		Box16.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box16+4)
MOVT	R0, #hi_addr(_Box16+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2929 :: 		Box16.Left            = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Box16+6)
MOVT	R0, #hi_addr(_Box16+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2930 :: 		Box16.Top             = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Box16+8)
MOVT	R0, #hi_addr(_Box16+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2931 :: 		Box16.Width           = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_Box16+10)
MOVT	R0, #hi_addr(_Box16+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2932 :: 		Box16.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Box16+12)
MOVT	R0, #hi_addr(_Box16+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2933 :: 		Box16.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box16+14)
MOVT	R0, #hi_addr(_Box16+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2934 :: 		Box16.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+16)
MOVT	R0, #hi_addr(_Box16+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2935 :: 		Box16.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+18)
MOVT	R0, #hi_addr(_Box16+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2936 :: 		Box16.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box16+19)
MOVT	R0, #hi_addr(_Box16+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2937 :: 		Box16.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box16+20)
MOVT	R0, #hi_addr(_Box16+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2938 :: 		Box16.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box16+21)
MOVT	R0, #hi_addr(_Box16+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2939 :: 		Box16.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+22)
MOVT	R0, #hi_addr(_Box16+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2940 :: 		Box16.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box16+24)
MOVT	R0, #hi_addr(_Box16+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2941 :: 		Box16.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box16+26)
MOVT	R0, #hi_addr(_Box16+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2942 :: 		Box16.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box16+28)
MOVT	R0, #hi_addr(_Box16+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2943 :: 		Box16.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+30)
MOVT	R0, #hi_addr(_Box16+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2944 :: 		Box16.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box16+32)
MOVT	R0, #hi_addr(_Box16+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2945 :: 		Box16.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+36)
MOVT	R0, #hi_addr(_Box16+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2946 :: 		Box16.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+40)
MOVT	R0, #hi_addr(_Box16+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2947 :: 		Box16.OnClickPtr      = Image18OnPress;
MOVW	R1, #lo_addr(_Image18OnPress+0)
MOVT	R1, #hi_addr(_Image18OnPress+0)
MOVW	R0, #lo_addr(_Box16+44)
MOVT	R0, #hi_addr(_Box16+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2948 :: 		Box16.OnPressPtr      = Image18OnPress;
MOVW	R1, #lo_addr(_Image18OnPress+0)
MOVT	R1, #hi_addr(_Image18OnPress+0)
MOVW	R0, #lo_addr(_Box16+48)
MOVT	R0, #hi_addr(_Box16+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2950 :: 		Image50.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Image50+0)
MOVT	R0, #hi_addr(_Image50+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2951 :: 		Image50.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image50+4)
MOVT	R0, #hi_addr(_Image50+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2952 :: 		Image50.Left            = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Image50+6)
MOVT	R0, #hi_addr(_Image50+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2953 :: 		Image50.Top             = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Image50+8)
MOVT	R0, #hi_addr(_Image50+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2954 :: 		Image50.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image50+10)
MOVT	R0, #hi_addr(_Image50+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2955 :: 		Image50.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image50+12)
MOVT	R0, #hi_addr(_Image50+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2956 :: 		Image50.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image50+22)
MOVT	R0, #hi_addr(_Image50+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2957 :: 		Image50.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image50+23)
MOVT	R0, #hi_addr(_Image50+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2958 :: 		Image50.Picture_Name    = icon_ok_bmp;
MOVW	R1, #38068
MOVT	R1, #61
MOVW	R0, #lo_addr(_Image50+16)
MOVT	R0, #hi_addr(_Image50+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2959 :: 		Image50.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image50+20)
MOVT	R0, #hi_addr(_Image50+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2960 :: 		Image50.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image50+21)
MOVT	R0, #hi_addr(_Image50+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2961 :: 		Image50.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image50+24)
MOVT	R0, #hi_addr(_Image50+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2962 :: 		Image50.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image50+28)
MOVT	R0, #hi_addr(_Image50+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2963 :: 		Image50.OnClickPtr      = Image18OnPress;
MOVW	R1, #lo_addr(_Image18OnPress+0)
MOVT	R1, #hi_addr(_Image18OnPress+0)
MOVW	R0, #lo_addr(_Image50+32)
MOVT	R0, #hi_addr(_Image50+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2964 :: 		Image50.OnPressPtr      = Image18OnPress;
MOVW	R1, #lo_addr(_Image18OnPress+0)
MOVT	R1, #hi_addr(_Image18OnPress+0)
MOVW	R0, #lo_addr(_Image50+36)
MOVT	R0, #hi_addr(_Image50+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2966 :: 		Label32.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label32+0)
MOVT	R0, #hi_addr(_Label32+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2967 :: 		Label32.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label32+4)
MOVT	R0, #hi_addr(_Label32+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2968 :: 		Label32.Left            = 44;
MOVS	R1, #44
MOVW	R0, #lo_addr(_Label32+6)
MOVT	R0, #hi_addr(_Label32+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2969 :: 		Label32.Top             = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label32+8)
MOVT	R0, #hi_addr(_Label32+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2970 :: 		Label32.Width           = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Label32+10)
MOVT	R0, #hi_addr(_Label32+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2971 :: 		Label32.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label32+12)
MOVT	R0, #hi_addr(_Label32+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2972 :: 		Label32.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label32+26)
MOVT	R0, #hi_addr(_Label32+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2973 :: 		Label32.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+27)
MOVT	R0, #hi_addr(_Label32+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2974 :: 		Label32.Caption         = Label32_Caption;
MOVW	R1, #lo_addr(_Label32_Caption+0)
MOVT	R1, #hi_addr(_Label32_Caption+0)
MOVW	R0, #lo_addr(_Label32+16)
MOVT	R0, #hi_addr(_Label32+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2975 :: 		Label32.FontName        = Arial_Black16x23_Regular;
MOVW	R1, #2595
MOVW	R0, #lo_addr(_Label32+20)
MOVT	R0, #hi_addr(_Label32+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2976 :: 		Label32.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+24)
MOVT	R0, #hi_addr(_Label32+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2977 :: 		Label32.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+28)
MOVT	R0, #hi_addr(_Label32+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2978 :: 		Label32.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+32)
MOVT	R0, #hi_addr(_Label32+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2979 :: 		Label32.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+36)
MOVT	R0, #hi_addr(_Label32+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2980 :: 		Label32.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+40)
MOVT	R0, #hi_addr(_Label32+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2982 :: 		Label53.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label53+0)
MOVT	R0, #hi_addr(_Label53+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2983 :: 		Label53.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label53+4)
MOVT	R0, #hi_addr(_Label53+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2984 :: 		Label53.Left            = 159;
MOVS	R1, #159
MOVW	R0, #lo_addr(_Label53+6)
MOVT	R0, #hi_addr(_Label53+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2985 :: 		Label53.Top             = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Label53+8)
MOVT	R0, #hi_addr(_Label53+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2986 :: 		Label53.Width           = 65;
MOVS	R1, #65
MOVW	R0, #lo_addr(_Label53+10)
MOVT	R0, #hi_addr(_Label53+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2987 :: 		Label53.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label53+12)
MOVT	R0, #hi_addr(_Label53+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2988 :: 		Label53.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label53+26)
MOVT	R0, #hi_addr(_Label53+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2989 :: 		Label53.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label53+27)
MOVT	R0, #hi_addr(_Label53+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2990 :: 		Label53.Caption         = Label53_Caption;
MOVW	R1, #lo_addr(_Label53_Caption+0)
MOVT	R1, #hi_addr(_Label53_Caption+0)
MOVW	R0, #lo_addr(_Label53+16)
MOVT	R0, #hi_addr(_Label53+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2991 :: 		Label53.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label53+20)
MOVT	R0, #hi_addr(_Label53+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2992 :: 		Label53.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label53+24)
MOVT	R0, #hi_addr(_Label53+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2993 :: 		Label53.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label53+28)
MOVT	R0, #hi_addr(_Label53+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2994 :: 		Label53.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label53+32)
MOVT	R0, #hi_addr(_Label53+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2995 :: 		Label53.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label53+36)
MOVT	R0, #hi_addr(_Label53+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2996 :: 		Label53.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label53+40)
MOVT	R0, #hi_addr(_Label53+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2998 :: 		Label54.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label54+0)
MOVT	R0, #hi_addr(_Label54+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2999 :: 		Label54.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label54+4)
MOVT	R0, #hi_addr(_Label54+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3000 :: 		Label54.Left            = 243;
MOVS	R1, #243
MOVW	R0, #lo_addr(_Label54+6)
MOVT	R0, #hi_addr(_Label54+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3001 :: 		Label54.Top             = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Label54+8)
MOVT	R0, #hi_addr(_Label54+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3002 :: 		Label54.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label54+10)
MOVT	R0, #hi_addr(_Label54+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3003 :: 		Label54.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label54+12)
MOVT	R0, #hi_addr(_Label54+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3004 :: 		Label54.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label54+26)
MOVT	R0, #hi_addr(_Label54+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3005 :: 		Label54.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label54+27)
MOVT	R0, #hi_addr(_Label54+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3006 :: 		Label54.Caption         = Label54_Caption;
MOVW	R1, #lo_addr(_Label54_Caption+0)
MOVT	R1, #hi_addr(_Label54_Caption+0)
MOVW	R0, #lo_addr(_Label54+16)
MOVT	R0, #hi_addr(_Label54+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3007 :: 		Label54.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label54+20)
MOVT	R0, #hi_addr(_Label54+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3008 :: 		Label54.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label54+24)
MOVT	R0, #hi_addr(_Label54+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3009 :: 		Label54.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label54+28)
MOVT	R0, #hi_addr(_Label54+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3010 :: 		Label54.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label54+32)
MOVT	R0, #hi_addr(_Label54+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3011 :: 		Label54.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label54+36)
MOVT	R0, #hi_addr(_Label54+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3012 :: 		Label54.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label54+40)
MOVT	R0, #hi_addr(_Label54+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3014 :: 		Label55.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label55+0)
MOVT	R0, #hi_addr(_Label55+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3015 :: 		Label55.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label55+4)
MOVT	R0, #hi_addr(_Label55+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3016 :: 		Label55.Left            = 284;
MOVW	R1, #284
MOVW	R0, #lo_addr(_Label55+6)
MOVT	R0, #hi_addr(_Label55+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3017 :: 		Label55.Top             = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Label55+8)
MOVT	R0, #hi_addr(_Label55+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3018 :: 		Label55.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label55+10)
MOVT	R0, #hi_addr(_Label55+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3019 :: 		Label55.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label55+12)
MOVT	R0, #hi_addr(_Label55+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3020 :: 		Label55.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label55+26)
MOVT	R0, #hi_addr(_Label55+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3021 :: 		Label55.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label55+27)
MOVT	R0, #hi_addr(_Label55+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3022 :: 		Label55.Caption         = Label55_Caption;
MOVW	R1, #lo_addr(_Label55_Caption+0)
MOVT	R1, #hi_addr(_Label55_Caption+0)
MOVW	R0, #lo_addr(_Label55+16)
MOVT	R0, #hi_addr(_Label55+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3023 :: 		Label55.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label55+20)
MOVT	R0, #hi_addr(_Label55+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3024 :: 		Label55.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label55+24)
MOVT	R0, #hi_addr(_Label55+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3025 :: 		Label55.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label55+28)
MOVT	R0, #hi_addr(_Label55+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3026 :: 		Label55.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label55+32)
MOVT	R0, #hi_addr(_Label55+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3027 :: 		Label55.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label55+36)
MOVT	R0, #hi_addr(_Label55+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3028 :: 		Label55.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label55+40)
MOVT	R0, #hi_addr(_Label55+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3030 :: 		Label56.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label56+0)
MOVT	R0, #hi_addr(_Label56+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3031 :: 		Label56.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label56+4)
MOVT	R0, #hi_addr(_Label56+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3032 :: 		Label56.Left            = 279;
MOVW	R1, #279
MOVW	R0, #lo_addr(_Label56+6)
MOVT	R0, #hi_addr(_Label56+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3033 :: 		Label56.Top             = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Label56+8)
MOVT	R0, #hi_addr(_Label56+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3034 :: 		Label56.Width           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label56+10)
MOVT	R0, #hi_addr(_Label56+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3035 :: 		Label56.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label56+12)
MOVT	R0, #hi_addr(_Label56+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3036 :: 		Label56.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label56+26)
MOVT	R0, #hi_addr(_Label56+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3037 :: 		Label56.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label56+27)
MOVT	R0, #hi_addr(_Label56+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3038 :: 		Label56.Caption         = Label56_Caption;
MOVW	R1, #lo_addr(_Label56_Caption+0)
MOVT	R1, #hi_addr(_Label56_Caption+0)
MOVW	R0, #lo_addr(_Label56+16)
MOVT	R0, #hi_addr(_Label56+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3039 :: 		Label56.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label56+20)
MOVT	R0, #hi_addr(_Label56+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3040 :: 		Label56.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label56+24)
MOVT	R0, #hi_addr(_Label56+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3041 :: 		Label56.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label56+28)
MOVT	R0, #hi_addr(_Label56+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3042 :: 		Label56.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label56+32)
MOVT	R0, #hi_addr(_Label56+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3043 :: 		Label56.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label56+36)
MOVT	R0, #hi_addr(_Label56+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3044 :: 		Label56.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label56+40)
MOVT	R0, #hi_addr(_Label56+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3046 :: 		Label57.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label57+0)
MOVT	R0, #hi_addr(_Label57+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3047 :: 		Label57.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Label57+4)
MOVT	R0, #hi_addr(_Label57+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3048 :: 		Label57.Left            = 159;
MOVS	R1, #159
MOVW	R0, #lo_addr(_Label57+6)
MOVT	R0, #hi_addr(_Label57+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3049 :: 		Label57.Top             = 108;
MOVS	R1, #108
MOVW	R0, #lo_addr(_Label57+8)
MOVT	R0, #hi_addr(_Label57+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3050 :: 		Label57.Width           = 77;
MOVS	R1, #77
MOVW	R0, #lo_addr(_Label57+10)
MOVT	R0, #hi_addr(_Label57+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3051 :: 		Label57.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label57+12)
MOVT	R0, #hi_addr(_Label57+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3052 :: 		Label57.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label57+26)
MOVT	R0, #hi_addr(_Label57+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3053 :: 		Label57.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label57+27)
MOVT	R0, #hi_addr(_Label57+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3054 :: 		Label57.Caption         = Label57_Caption;
MOVW	R1, #lo_addr(_Label57_Caption+0)
MOVT	R1, #hi_addr(_Label57_Caption+0)
MOVW	R0, #lo_addr(_Label57+16)
MOVT	R0, #hi_addr(_Label57+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3055 :: 		Label57.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label57+20)
MOVT	R0, #hi_addr(_Label57+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3056 :: 		Label57.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label57+24)
MOVT	R0, #hi_addr(_Label57+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3057 :: 		Label57.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label57+28)
MOVT	R0, #hi_addr(_Label57+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3058 :: 		Label57.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label57+32)
MOVT	R0, #hi_addr(_Label57+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3059 :: 		Label57.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label57+36)
MOVT	R0, #hi_addr(_Label57+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3060 :: 		Label57.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label57+40)
MOVT	R0, #hi_addr(_Label57+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3062 :: 		Label58.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label58+0)
MOVT	R0, #hi_addr(_Label58+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3063 :: 		Label58.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label58+4)
MOVT	R0, #hi_addr(_Label58+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3064 :: 		Label58.Left            = 243;
MOVS	R1, #243
MOVW	R0, #lo_addr(_Label58+6)
MOVT	R0, #hi_addr(_Label58+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3065 :: 		Label58.Top             = 108;
MOVS	R1, #108
MOVW	R0, #lo_addr(_Label58+8)
MOVT	R0, #hi_addr(_Label58+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3066 :: 		Label58.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label58+10)
MOVT	R0, #hi_addr(_Label58+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3067 :: 		Label58.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label58+12)
MOVT	R0, #hi_addr(_Label58+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3068 :: 		Label58.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label58+26)
MOVT	R0, #hi_addr(_Label58+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3069 :: 		Label58.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label58+27)
MOVT	R0, #hi_addr(_Label58+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3070 :: 		Label58.Caption         = Label58_Caption;
MOVW	R1, #lo_addr(_Label58_Caption+0)
MOVT	R1, #hi_addr(_Label58_Caption+0)
MOVW	R0, #lo_addr(_Label58+16)
MOVT	R0, #hi_addr(_Label58+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3071 :: 		Label58.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label58+20)
MOVT	R0, #hi_addr(_Label58+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3072 :: 		Label58.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label58+24)
MOVT	R0, #hi_addr(_Label58+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3073 :: 		Label58.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label58+28)
MOVT	R0, #hi_addr(_Label58+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3074 :: 		Label58.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label58+32)
MOVT	R0, #hi_addr(_Label58+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3075 :: 		Label58.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label58+36)
MOVT	R0, #hi_addr(_Label58+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3076 :: 		Label58.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label58+40)
MOVT	R0, #hi_addr(_Label58+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3078 :: 		Label59.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label59+0)
MOVT	R0, #hi_addr(_Label59+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3079 :: 		Label59.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label59+4)
MOVT	R0, #hi_addr(_Label59+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3080 :: 		Label59.Left            = 284;
MOVW	R1, #284
MOVW	R0, #lo_addr(_Label59+6)
MOVT	R0, #hi_addr(_Label59+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3081 :: 		Label59.Top             = 108;
MOVS	R1, #108
MOVW	R0, #lo_addr(_Label59+8)
MOVT	R0, #hi_addr(_Label59+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3082 :: 		Label59.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label59+10)
MOVT	R0, #hi_addr(_Label59+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3083 :: 		Label59.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label59+12)
MOVT	R0, #hi_addr(_Label59+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3084 :: 		Label59.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label59+26)
MOVT	R0, #hi_addr(_Label59+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3085 :: 		Label59.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label59+27)
MOVT	R0, #hi_addr(_Label59+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3086 :: 		Label59.Caption         = Label59_Caption;
MOVW	R1, #lo_addr(_Label59_Caption+0)
MOVT	R1, #hi_addr(_Label59_Caption+0)
MOVW	R0, #lo_addr(_Label59+16)
MOVT	R0, #hi_addr(_Label59+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3087 :: 		Label59.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label59+20)
MOVT	R0, #hi_addr(_Label59+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3088 :: 		Label59.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label59+24)
MOVT	R0, #hi_addr(_Label59+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3089 :: 		Label59.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label59+28)
MOVT	R0, #hi_addr(_Label59+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3090 :: 		Label59.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label59+32)
MOVT	R0, #hi_addr(_Label59+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3091 :: 		Label59.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label59+36)
MOVT	R0, #hi_addr(_Label59+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3092 :: 		Label59.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label59+40)
MOVT	R0, #hi_addr(_Label59+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3094 :: 		Label60.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label60+0)
MOVT	R0, #hi_addr(_Label60+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3095 :: 		Label60.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Label60+4)
MOVT	R0, #hi_addr(_Label60+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3096 :: 		Label60.Left            = 279;
MOVW	R1, #279
MOVW	R0, #lo_addr(_Label60+6)
MOVT	R0, #hi_addr(_Label60+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3097 :: 		Label60.Top             = 108;
MOVS	R1, #108
MOVW	R0, #lo_addr(_Label60+8)
MOVT	R0, #hi_addr(_Label60+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3098 :: 		Label60.Width           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label60+10)
MOVT	R0, #hi_addr(_Label60+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3099 :: 		Label60.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label60+12)
MOVT	R0, #hi_addr(_Label60+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3100 :: 		Label60.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label60+26)
MOVT	R0, #hi_addr(_Label60+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3101 :: 		Label60.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label60+27)
MOVT	R0, #hi_addr(_Label60+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3102 :: 		Label60.Caption         = Label60_Caption;
MOVW	R1, #lo_addr(_Label60_Caption+0)
MOVT	R1, #hi_addr(_Label60_Caption+0)
MOVW	R0, #lo_addr(_Label60+16)
MOVT	R0, #hi_addr(_Label60+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3103 :: 		Label60.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label60+20)
MOVT	R0, #hi_addr(_Label60+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3104 :: 		Label60.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label60+24)
MOVT	R0, #hi_addr(_Label60+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3105 :: 		Label60.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label60+28)
MOVT	R0, #hi_addr(_Label60+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3106 :: 		Label60.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label60+32)
MOVT	R0, #hi_addr(_Label60+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3107 :: 		Label60.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label60+36)
MOVT	R0, #hi_addr(_Label60+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3108 :: 		Label60.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label60+40)
MOVT	R0, #hi_addr(_Label60+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3110 :: 		Label61.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label61+0)
MOVT	R0, #hi_addr(_Label61+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3111 :: 		Label61.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Label61+4)
MOVT	R0, #hi_addr(_Label61+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3112 :: 		Label61.Left            = 159;
MOVS	R1, #159
MOVW	R0, #lo_addr(_Label61+6)
MOVT	R0, #hi_addr(_Label61+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3113 :: 		Label61.Top             = 131;
MOVS	R1, #131
MOVW	R0, #lo_addr(_Label61+8)
MOVT	R0, #hi_addr(_Label61+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3114 :: 		Label61.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Label61+10)
MOVT	R0, #hi_addr(_Label61+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3115 :: 		Label61.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label61+12)
MOVT	R0, #hi_addr(_Label61+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3116 :: 		Label61.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label61+26)
MOVT	R0, #hi_addr(_Label61+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3117 :: 		Label61.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label61+27)
MOVT	R0, #hi_addr(_Label61+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3118 :: 		Label61.Caption         = Label61_Caption;
MOVW	R1, #lo_addr(_Label61_Caption+0)
MOVT	R1, #hi_addr(_Label61_Caption+0)
MOVW	R0, #lo_addr(_Label61+16)
MOVT	R0, #hi_addr(_Label61+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3119 :: 		Label61.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label61+20)
MOVT	R0, #hi_addr(_Label61+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3120 :: 		Label61.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label61+24)
MOVT	R0, #hi_addr(_Label61+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3121 :: 		Label61.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label61+28)
MOVT	R0, #hi_addr(_Label61+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3122 :: 		Label61.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label61+32)
MOVT	R0, #hi_addr(_Label61+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3123 :: 		Label61.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label61+36)
MOVT	R0, #hi_addr(_Label61+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3124 :: 		Label61.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label61+40)
MOVT	R0, #hi_addr(_Label61+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3126 :: 		Label62.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label62+0)
MOVT	R0, #hi_addr(_Label62+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3127 :: 		Label62.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label62+4)
MOVT	R0, #hi_addr(_Label62+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3128 :: 		Label62.Left            = 243;
MOVS	R1, #243
MOVW	R0, #lo_addr(_Label62+6)
MOVT	R0, #hi_addr(_Label62+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3129 :: 		Label62.Top             = 131;
MOVS	R1, #131
MOVW	R0, #lo_addr(_Label62+8)
MOVT	R0, #hi_addr(_Label62+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3130 :: 		Label62.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label62+10)
MOVT	R0, #hi_addr(_Label62+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3131 :: 		Label62.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label62+12)
MOVT	R0, #hi_addr(_Label62+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3132 :: 		Label62.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label62+26)
MOVT	R0, #hi_addr(_Label62+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3133 :: 		Label62.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label62+27)
MOVT	R0, #hi_addr(_Label62+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3134 :: 		Label62.Caption         = Label62_Caption;
MOVW	R1, #lo_addr(_Label62_Caption+0)
MOVT	R1, #hi_addr(_Label62_Caption+0)
MOVW	R0, #lo_addr(_Label62+16)
MOVT	R0, #hi_addr(_Label62+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3135 :: 		Label62.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label62+20)
MOVT	R0, #hi_addr(_Label62+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3136 :: 		Label62.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label62+24)
MOVT	R0, #hi_addr(_Label62+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3137 :: 		Label62.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label62+28)
MOVT	R0, #hi_addr(_Label62+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3138 :: 		Label62.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label62+32)
MOVT	R0, #hi_addr(_Label62+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3139 :: 		Label62.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label62+36)
MOVT	R0, #hi_addr(_Label62+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3140 :: 		Label62.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label62+40)
MOVT	R0, #hi_addr(_Label62+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3142 :: 		Label63.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label63+0)
MOVT	R0, #hi_addr(_Label63+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3143 :: 		Label63.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label63+4)
MOVT	R0, #hi_addr(_Label63+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3144 :: 		Label63.Left            = 284;
MOVW	R1, #284
MOVW	R0, #lo_addr(_Label63+6)
MOVT	R0, #hi_addr(_Label63+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3145 :: 		Label63.Top             = 131;
MOVS	R1, #131
MOVW	R0, #lo_addr(_Label63+8)
MOVT	R0, #hi_addr(_Label63+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3146 :: 		Label63.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label63+10)
MOVT	R0, #hi_addr(_Label63+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3147 :: 		Label63.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label63+12)
MOVT	R0, #hi_addr(_Label63+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3148 :: 		Label63.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label63+26)
MOVT	R0, #hi_addr(_Label63+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3149 :: 		Label63.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label63+27)
MOVT	R0, #hi_addr(_Label63+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3150 :: 		Label63.Caption         = Label63_Caption;
MOVW	R1, #lo_addr(_Label63_Caption+0)
MOVT	R1, #hi_addr(_Label63_Caption+0)
MOVW	R0, #lo_addr(_Label63+16)
MOVT	R0, #hi_addr(_Label63+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3151 :: 		Label63.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label63+20)
MOVT	R0, #hi_addr(_Label63+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3152 :: 		Label63.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label63+24)
MOVT	R0, #hi_addr(_Label63+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3153 :: 		Label63.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label63+28)
MOVT	R0, #hi_addr(_Label63+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3154 :: 		Label63.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label63+32)
MOVT	R0, #hi_addr(_Label63+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3155 :: 		Label63.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label63+36)
MOVT	R0, #hi_addr(_Label63+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3156 :: 		Label63.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label63+40)
MOVT	R0, #hi_addr(_Label63+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3158 :: 		Label64.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label64+0)
MOVT	R0, #hi_addr(_Label64+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3159 :: 		Label64.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label64+4)
MOVT	R0, #hi_addr(_Label64+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3160 :: 		Label64.Left            = 279;
MOVW	R1, #279
MOVW	R0, #lo_addr(_Label64+6)
MOVT	R0, #hi_addr(_Label64+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3161 :: 		Label64.Top             = 131;
MOVS	R1, #131
MOVW	R0, #lo_addr(_Label64+8)
MOVT	R0, #hi_addr(_Label64+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3162 :: 		Label64.Width           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label64+10)
MOVT	R0, #hi_addr(_Label64+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3163 :: 		Label64.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label64+12)
MOVT	R0, #hi_addr(_Label64+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3164 :: 		Label64.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label64+26)
MOVT	R0, #hi_addr(_Label64+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3165 :: 		Label64.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label64+27)
MOVT	R0, #hi_addr(_Label64+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3166 :: 		Label64.Caption         = Label64_Caption;
MOVW	R1, #lo_addr(_Label64_Caption+0)
MOVT	R1, #hi_addr(_Label64_Caption+0)
MOVW	R0, #lo_addr(_Label64+16)
MOVT	R0, #hi_addr(_Label64+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3167 :: 		Label64.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label64+20)
MOVT	R0, #hi_addr(_Label64+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3168 :: 		Label64.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label64+24)
MOVT	R0, #hi_addr(_Label64+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3169 :: 		Label64.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label64+28)
MOVT	R0, #hi_addr(_Label64+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3170 :: 		Label64.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label64+32)
MOVT	R0, #hi_addr(_Label64+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3171 :: 		Label64.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label64+36)
MOVT	R0, #hi_addr(_Label64+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3172 :: 		Label64.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label64+40)
MOVT	R0, #hi_addr(_Label64+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3174 :: 		Label65.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label65+0)
MOVT	R0, #hi_addr(_Label65+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3175 :: 		Label65.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label65+4)
MOVT	R0, #hi_addr(_Label65+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3176 :: 		Label65.Left            = 159;
MOVS	R1, #159
MOVW	R0, #lo_addr(_Label65+6)
MOVT	R0, #hi_addr(_Label65+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3177 :: 		Label65.Top             = 154;
MOVS	R1, #154
MOVW	R0, #lo_addr(_Label65+8)
MOVT	R0, #hi_addr(_Label65+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3178 :: 		Label65.Width           = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_Label65+10)
MOVT	R0, #hi_addr(_Label65+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3179 :: 		Label65.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label65+12)
MOVT	R0, #hi_addr(_Label65+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3180 :: 		Label65.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label65+26)
MOVT	R0, #hi_addr(_Label65+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3181 :: 		Label65.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label65+27)
MOVT	R0, #hi_addr(_Label65+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3182 :: 		Label65.Caption         = Label65_Caption;
MOVW	R1, #lo_addr(_Label65_Caption+0)
MOVT	R1, #hi_addr(_Label65_Caption+0)
MOVW	R0, #lo_addr(_Label65+16)
MOVT	R0, #hi_addr(_Label65+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3183 :: 		Label65.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label65+20)
MOVT	R0, #hi_addr(_Label65+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3184 :: 		Label65.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label65+24)
MOVT	R0, #hi_addr(_Label65+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3185 :: 		Label65.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label65+28)
MOVT	R0, #hi_addr(_Label65+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3186 :: 		Label65.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label65+32)
MOVT	R0, #hi_addr(_Label65+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3187 :: 		Label65.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label65+36)
MOVT	R0, #hi_addr(_Label65+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3188 :: 		Label65.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label65+40)
MOVT	R0, #hi_addr(_Label65+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3190 :: 		Label66.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label66+0)
MOVT	R0, #hi_addr(_Label66+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3191 :: 		Label66.Order           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label66+4)
MOVT	R0, #hi_addr(_Label66+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3192 :: 		Label66.Left            = 243;
MOVS	R1, #243
MOVW	R0, #lo_addr(_Label66+6)
MOVT	R0, #hi_addr(_Label66+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3193 :: 		Label66.Top             = 154;
MOVS	R1, #154
MOVW	R0, #lo_addr(_Label66+8)
MOVT	R0, #hi_addr(_Label66+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3194 :: 		Label66.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label66+10)
MOVT	R0, #hi_addr(_Label66+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3195 :: 		Label66.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label66+12)
MOVT	R0, #hi_addr(_Label66+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3196 :: 		Label66.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label66+26)
MOVT	R0, #hi_addr(_Label66+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3197 :: 		Label66.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label66+27)
MOVT	R0, #hi_addr(_Label66+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3198 :: 		Label66.Caption         = Label66_Caption;
MOVW	R1, #lo_addr(_Label66_Caption+0)
MOVT	R1, #hi_addr(_Label66_Caption+0)
MOVW	R0, #lo_addr(_Label66+16)
MOVT	R0, #hi_addr(_Label66+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3199 :: 		Label66.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label66+20)
MOVT	R0, #hi_addr(_Label66+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3200 :: 		Label66.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label66+24)
MOVT	R0, #hi_addr(_Label66+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3201 :: 		Label66.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label66+28)
MOVT	R0, #hi_addr(_Label66+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3202 :: 		Label66.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label66+32)
MOVT	R0, #hi_addr(_Label66+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3203 :: 		Label66.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label66+36)
MOVT	R0, #hi_addr(_Label66+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3204 :: 		Label66.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label66+40)
MOVT	R0, #hi_addr(_Label66+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3206 :: 		Label67.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label67+0)
MOVT	R0, #hi_addr(_Label67+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3207 :: 		Label67.Order           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Label67+4)
MOVT	R0, #hi_addr(_Label67+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3208 :: 		Label67.Left            = 284;
MOVW	R1, #284
MOVW	R0, #lo_addr(_Label67+6)
MOVT	R0, #hi_addr(_Label67+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3209 :: 		Label67.Top             = 154;
MOVS	R1, #154
MOVW	R0, #lo_addr(_Label67+8)
MOVT	R0, #hi_addr(_Label67+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3210 :: 		Label67.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label67+10)
MOVT	R0, #hi_addr(_Label67+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3211 :: 		Label67.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label67+12)
MOVT	R0, #hi_addr(_Label67+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3212 :: 		Label67.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label67+26)
MOVT	R0, #hi_addr(_Label67+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3213 :: 		Label67.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label67+27)
MOVT	R0, #hi_addr(_Label67+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3214 :: 		Label67.Caption         = Label67_Caption;
MOVW	R1, #lo_addr(_Label67_Caption+0)
MOVT	R1, #hi_addr(_Label67_Caption+0)
MOVW	R0, #lo_addr(_Label67+16)
MOVT	R0, #hi_addr(_Label67+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3215 :: 		Label67.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label67+20)
MOVT	R0, #hi_addr(_Label67+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3216 :: 		Label67.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label67+24)
MOVT	R0, #hi_addr(_Label67+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3217 :: 		Label67.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label67+28)
MOVT	R0, #hi_addr(_Label67+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3218 :: 		Label67.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label67+32)
MOVT	R0, #hi_addr(_Label67+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3219 :: 		Label67.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label67+36)
MOVT	R0, #hi_addr(_Label67+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3220 :: 		Label67.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label67+40)
MOVT	R0, #hi_addr(_Label67+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3222 :: 		Label68.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label68+0)
MOVT	R0, #hi_addr(_Label68+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3223 :: 		Label68.Order           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Label68+4)
MOVT	R0, #hi_addr(_Label68+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3224 :: 		Label68.Left            = 279;
MOVW	R1, #279
MOVW	R0, #lo_addr(_Label68+6)
MOVT	R0, #hi_addr(_Label68+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3225 :: 		Label68.Top             = 154;
MOVS	R1, #154
MOVW	R0, #lo_addr(_Label68+8)
MOVT	R0, #hi_addr(_Label68+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3226 :: 		Label68.Width           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label68+10)
MOVT	R0, #hi_addr(_Label68+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3227 :: 		Label68.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label68+12)
MOVT	R0, #hi_addr(_Label68+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3228 :: 		Label68.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label68+26)
MOVT	R0, #hi_addr(_Label68+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3229 :: 		Label68.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label68+27)
MOVT	R0, #hi_addr(_Label68+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3230 :: 		Label68.Caption         = Label68_Caption;
MOVW	R1, #lo_addr(_Label68_Caption+0)
MOVT	R1, #hi_addr(_Label68_Caption+0)
MOVW	R0, #lo_addr(_Label68+16)
MOVT	R0, #hi_addr(_Label68+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3231 :: 		Label68.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label68+20)
MOVT	R0, #hi_addr(_Label68+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3232 :: 		Label68.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label68+24)
MOVT	R0, #hi_addr(_Label68+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3233 :: 		Label68.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label68+28)
MOVT	R0, #hi_addr(_Label68+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3234 :: 		Label68.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label68+32)
MOVT	R0, #hi_addr(_Label68+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3235 :: 		Label68.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label68+36)
MOVT	R0, #hi_addr(_Label68+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3236 :: 		Label68.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label68+40)
MOVT	R0, #hi_addr(_Label68+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3238 :: 		Label69.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label69+0)
MOVT	R0, #hi_addr(_Label69+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3239 :: 		Label69.Order           = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label69+4)
MOVT	R0, #hi_addr(_Label69+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3240 :: 		Label69.Left            = 159;
MOVS	R1, #159
MOVW	R0, #lo_addr(_Label69+6)
MOVT	R0, #hi_addr(_Label69+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3241 :: 		Label69.Top             = 177;
MOVS	R1, #177
MOVW	R0, #lo_addr(_Label69+8)
MOVT	R0, #hi_addr(_Label69+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3242 :: 		Label69.Width           = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_Label69+10)
MOVT	R0, #hi_addr(_Label69+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3243 :: 		Label69.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label69+12)
MOVT	R0, #hi_addr(_Label69+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3244 :: 		Label69.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label69+26)
MOVT	R0, #hi_addr(_Label69+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3245 :: 		Label69.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label69+27)
MOVT	R0, #hi_addr(_Label69+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3246 :: 		Label69.Caption         = Label69_Caption;
MOVW	R1, #lo_addr(_Label69_Caption+0)
MOVT	R1, #hi_addr(_Label69_Caption+0)
MOVW	R0, #lo_addr(_Label69+16)
MOVT	R0, #hi_addr(_Label69+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3247 :: 		Label69.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label69+20)
MOVT	R0, #hi_addr(_Label69+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3248 :: 		Label69.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label69+24)
MOVT	R0, #hi_addr(_Label69+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3249 :: 		Label69.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label69+28)
MOVT	R0, #hi_addr(_Label69+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3250 :: 		Label69.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label69+32)
MOVT	R0, #hi_addr(_Label69+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3251 :: 		Label69.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label69+36)
MOVT	R0, #hi_addr(_Label69+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3252 :: 		Label69.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label69+40)
MOVT	R0, #hi_addr(_Label69+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3254 :: 		Label70.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label70+0)
MOVT	R0, #hi_addr(_Label70+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3255 :: 		Label70.Order           = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label70+4)
MOVT	R0, #hi_addr(_Label70+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3256 :: 		Label70.Left            = 243;
MOVS	R1, #243
MOVW	R0, #lo_addr(_Label70+6)
MOVT	R0, #hi_addr(_Label70+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3257 :: 		Label70.Top             = 177;
MOVS	R1, #177
MOVW	R0, #lo_addr(_Label70+8)
MOVT	R0, #hi_addr(_Label70+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3258 :: 		Label70.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label70+10)
MOVT	R0, #hi_addr(_Label70+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3259 :: 		Label70.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label70+12)
MOVT	R0, #hi_addr(_Label70+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3260 :: 		Label70.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label70+26)
MOVT	R0, #hi_addr(_Label70+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3261 :: 		Label70.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label70+27)
MOVT	R0, #hi_addr(_Label70+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3262 :: 		Label70.Caption         = Label70_Caption;
MOVW	R1, #lo_addr(_Label70_Caption+0)
MOVT	R1, #hi_addr(_Label70_Caption+0)
MOVW	R0, #lo_addr(_Label70+16)
MOVT	R0, #hi_addr(_Label70+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3263 :: 		Label70.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label70+20)
MOVT	R0, #hi_addr(_Label70+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3264 :: 		Label70.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label70+24)
MOVT	R0, #hi_addr(_Label70+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3265 :: 		Label70.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label70+28)
MOVT	R0, #hi_addr(_Label70+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3266 :: 		Label70.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label70+32)
MOVT	R0, #hi_addr(_Label70+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3267 :: 		Label70.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label70+36)
MOVT	R0, #hi_addr(_Label70+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3268 :: 		Label70.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label70+40)
MOVT	R0, #hi_addr(_Label70+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3270 :: 		Label71.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label71+0)
MOVT	R0, #hi_addr(_Label71+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3271 :: 		Label71.Order           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Label71+4)
MOVT	R0, #hi_addr(_Label71+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3272 :: 		Label71.Left            = 284;
MOVW	R1, #284
MOVW	R0, #lo_addr(_Label71+6)
MOVT	R0, #hi_addr(_Label71+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3273 :: 		Label71.Top             = 177;
MOVS	R1, #177
MOVW	R0, #lo_addr(_Label71+8)
MOVT	R0, #hi_addr(_Label71+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3274 :: 		Label71.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label71+10)
MOVT	R0, #hi_addr(_Label71+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3275 :: 		Label71.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label71+12)
MOVT	R0, #hi_addr(_Label71+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3276 :: 		Label71.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label71+26)
MOVT	R0, #hi_addr(_Label71+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3277 :: 		Label71.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label71+27)
MOVT	R0, #hi_addr(_Label71+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3278 :: 		Label71.Caption         = Label71_Caption;
MOVW	R1, #lo_addr(_Label71_Caption+0)
MOVT	R1, #hi_addr(_Label71_Caption+0)
MOVW	R0, #lo_addr(_Label71+16)
MOVT	R0, #hi_addr(_Label71+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3279 :: 		Label71.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label71+20)
MOVT	R0, #hi_addr(_Label71+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3280 :: 		Label71.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label71+24)
MOVT	R0, #hi_addr(_Label71+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3281 :: 		Label71.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label71+28)
MOVT	R0, #hi_addr(_Label71+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3282 :: 		Label71.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label71+32)
MOVT	R0, #hi_addr(_Label71+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3283 :: 		Label71.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label71+36)
MOVT	R0, #hi_addr(_Label71+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3284 :: 		Label71.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label71+40)
MOVT	R0, #hi_addr(_Label71+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3286 :: 		Label72.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label72+0)
MOVT	R0, #hi_addr(_Label72+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3287 :: 		Label72.Order           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Label72+4)
MOVT	R0, #hi_addr(_Label72+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3288 :: 		Label72.Left            = 279;
MOVW	R1, #279
MOVW	R0, #lo_addr(_Label72+6)
MOVT	R0, #hi_addr(_Label72+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3289 :: 		Label72.Top             = 177;
MOVS	R1, #177
MOVW	R0, #lo_addr(_Label72+8)
MOVT	R0, #hi_addr(_Label72+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3290 :: 		Label72.Width           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label72+10)
MOVT	R0, #hi_addr(_Label72+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3291 :: 		Label72.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label72+12)
MOVT	R0, #hi_addr(_Label72+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3292 :: 		Label72.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label72+26)
MOVT	R0, #hi_addr(_Label72+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3293 :: 		Label72.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label72+27)
MOVT	R0, #hi_addr(_Label72+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3294 :: 		Label72.Caption         = Label72_Caption;
MOVW	R1, #lo_addr(_Label72_Caption+0)
MOVT	R1, #hi_addr(_Label72_Caption+0)
MOVW	R0, #lo_addr(_Label72+16)
MOVT	R0, #hi_addr(_Label72+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3295 :: 		Label72.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label72+20)
MOVT	R0, #hi_addr(_Label72+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3296 :: 		Label72.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label72+24)
MOVT	R0, #hi_addr(_Label72+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3297 :: 		Label72.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label72+28)
MOVT	R0, #hi_addr(_Label72+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3298 :: 		Label72.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label72+32)
MOVT	R0, #hi_addr(_Label72+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3299 :: 		Label72.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label72+36)
MOVT	R0, #hi_addr(_Label72+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3300 :: 		Label72.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label72+40)
MOVT	R0, #hi_addr(_Label72+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3302 :: 		Box13.OwnerScreen     = &Gyro_test;
MOVW	R1, #lo_addr(_Gyro_test+0)
MOVT	R1, #hi_addr(_Gyro_test+0)
MOVW	R0, #lo_addr(_Box13+0)
MOVT	R0, #hi_addr(_Box13+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3303 :: 		Box13.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+4)
MOVT	R0, #hi_addr(_Box13+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3304 :: 		Box13.Left            = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box13+6)
MOVT	R0, #hi_addr(_Box13+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3305 :: 		Box13.Top             = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Box13+8)
MOVT	R0, #hi_addr(_Box13+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3306 :: 		Box13.Width           = 150;
MOVS	R1, #150
MOVW	R0, #lo_addr(_Box13+10)
MOVT	R0, #hi_addr(_Box13+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3307 :: 		Box13.Height          = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Box13+12)
MOVT	R0, #hi_addr(_Box13+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3308 :: 		Box13.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box13+14)
MOVT	R0, #hi_addr(_Box13+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3309 :: 		Box13.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+16)
MOVT	R0, #hi_addr(_Box13+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3310 :: 		Box13.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+18)
MOVT	R0, #hi_addr(_Box13+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3311 :: 		Box13.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box13+19)
MOVT	R0, #hi_addr(_Box13+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3312 :: 		Box13.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box13+20)
MOVT	R0, #hi_addr(_Box13+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3313 :: 		Box13.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+21)
MOVT	R0, #hi_addr(_Box13+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3314 :: 		Box13.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+22)
MOVT	R0, #hi_addr(_Box13+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3315 :: 		Box13.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box13+24)
MOVT	R0, #hi_addr(_Box13+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3316 :: 		Box13.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box13+26)
MOVT	R0, #hi_addr(_Box13+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3317 :: 		Box13.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box13+28)
MOVT	R0, #hi_addr(_Box13+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3318 :: 		Box13.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+30)
MOVT	R0, #hi_addr(_Box13+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3319 :: 		Box13.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box13+32)
MOVT	R0, #hi_addr(_Box13+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3320 :: 		Box13.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+36)
MOVT	R0, #hi_addr(_Box13+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3321 :: 		Box13.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+40)
MOVT	R0, #hi_addr(_Box13+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3322 :: 		Box13.OnClickPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Box13+44)
MOVT	R0, #hi_addr(_Box13+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3323 :: 		Box13.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+48)
MOVT	R0, #hi_addr(_Box13+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3325 :: 		Box14.OwnerScreen     = &Gyro_test;
MOVW	R1, #lo_addr(_Gyro_test+0)
MOVT	R1, #hi_addr(_Gyro_test+0)
MOVW	R0, #lo_addr(_Box14+0)
MOVT	R0, #hi_addr(_Box14+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3326 :: 		Box14.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box14+4)
MOVT	R0, #hi_addr(_Box14+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3327 :: 		Box14.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+6)
MOVT	R0, #hi_addr(_Box14+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3328 :: 		Box14.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Box14+8)
MOVT	R0, #hi_addr(_Box14+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3329 :: 		Box14.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Box14+10)
MOVT	R0, #hi_addr(_Box14+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3330 :: 		Box14.Height          = 207;
MOVS	R1, #207
MOVW	R0, #lo_addr(_Box14+12)
MOVT	R0, #hi_addr(_Box14+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3331 :: 		Box14.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box14+14)
MOVT	R0, #hi_addr(_Box14+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3332 :: 		Box14.Pen_Color       = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box14+16)
MOVT	R0, #hi_addr(_Box14+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3333 :: 		Box14.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box14+18)
MOVT	R0, #hi_addr(_Box14+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3334 :: 		Box14.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box14+19)
MOVT	R0, #hi_addr(_Box14+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3335 :: 		Box14.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box14+20)
MOVT	R0, #hi_addr(_Box14+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3336 :: 		Box14.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+21)
MOVT	R0, #hi_addr(_Box14+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3337 :: 		Box14.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+22)
MOVT	R0, #hi_addr(_Box14+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3338 :: 		Box14.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box14+24)
MOVT	R0, #hi_addr(_Box14+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3339 :: 		Box14.Gradient_End_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box14+26)
MOVT	R0, #hi_addr(_Box14+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3340 :: 		Box14.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box14+28)
MOVT	R0, #hi_addr(_Box14+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3341 :: 		Box14.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+30)
MOVT	R0, #hi_addr(_Box14+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3342 :: 		Box14.Press_Color     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box14+32)
MOVT	R0, #hi_addr(_Box14+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3343 :: 		Box14.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+36)
MOVT	R0, #hi_addr(_Box14+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3344 :: 		Box14.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+40)
MOVT	R0, #hi_addr(_Box14+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3345 :: 		Box14.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+44)
MOVT	R0, #hi_addr(_Box14+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3346 :: 		Box14.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+48)
MOVT	R0, #hi_addr(_Box14+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3348 :: 		Image52.OwnerScreen     = &Gyro_test;
MOVW	R1, #lo_addr(_Gyro_test+0)
MOVT	R1, #hi_addr(_Gyro_test+0)
MOVW	R0, #lo_addr(_Image52+0)
MOVT	R0, #hi_addr(_Image52+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3349 :: 		Image52.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image52+4)
MOVT	R0, #hi_addr(_Image52+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3350 :: 		Image52.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image52+6)
MOVT	R0, #hi_addr(_Image52+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3351 :: 		Image52.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image52+8)
MOVT	R0, #hi_addr(_Image52+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3352 :: 		Image52.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image52+10)
MOVT	R0, #hi_addr(_Image52+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3353 :: 		Image52.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image52+12)
MOVT	R0, #hi_addr(_Image52+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3354 :: 		Image52.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image52+22)
MOVT	R0, #hi_addr(_Image52+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3355 :: 		Image52.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image52+23)
MOVT	R0, #hi_addr(_Image52+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3356 :: 		Image52.Picture_Name    = icon_back_gyro_bmp;
MOVW	R1, #54952
MOVT	R1, #62
MOVW	R0, #lo_addr(_Image52+16)
MOVT	R0, #hi_addr(_Image52+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3357 :: 		Image52.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image52+20)
MOVT	R0, #hi_addr(_Image52+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3358 :: 		Image52.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image52+21)
MOVT	R0, #hi_addr(_Image52+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3359 :: 		Image52.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image52+24)
MOVT	R0, #hi_addr(_Image52+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3360 :: 		Image52.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image52+28)
MOVT	R0, #hi_addr(_Image52+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3361 :: 		Image52.OnClickPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Image52+32)
MOVT	R0, #hi_addr(_Image52+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3362 :: 		Image52.OnPressPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Image52+36)
MOVT	R0, #hi_addr(_Image52+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3364 :: 		Label8.OwnerScreen     = &Gyro_test;
MOVW	R1, #lo_addr(_Gyro_test+0)
MOVT	R1, #hi_addr(_Gyro_test+0)
MOVW	R0, #lo_addr(_Label8+0)
MOVT	R0, #hi_addr(_Label8+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3365 :: 		Label8.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label8+4)
MOVT	R0, #hi_addr(_Label8+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3366 :: 		Label8.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label8+6)
MOVT	R0, #hi_addr(_Label8+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3367 :: 		Label8.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label8+8)
MOVT	R0, #hi_addr(_Label8+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3368 :: 		Label8.Width           = 113;
MOVS	R1, #113
MOVW	R0, #lo_addr(_Label8+10)
MOVT	R0, #hi_addr(_Label8+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3369 :: 		Label8.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label8+12)
MOVT	R0, #hi_addr(_Label8+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3370 :: 		Label8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label8+26)
MOVT	R0, #hi_addr(_Label8+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3371 :: 		Label8.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+27)
MOVT	R0, #hi_addr(_Label8+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3372 :: 		Label8.Caption         = Label8_Caption;
MOVW	R1, #lo_addr(_Label8_Caption+0)
MOVT	R1, #hi_addr(_Label8_Caption+0)
MOVW	R0, #lo_addr(_Label8+16)
MOVT	R0, #hi_addr(_Label8+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3373 :: 		Label8.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R1, #55353
MOVW	R0, #lo_addr(_Label8+20)
MOVT	R0, #hi_addr(_Label8+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3374 :: 		Label8.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label8+24)
MOVT	R0, #hi_addr(_Label8+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3375 :: 		Label8.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+28)
MOVT	R0, #hi_addr(_Label8+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3376 :: 		Label8.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+32)
MOVT	R0, #hi_addr(_Label8+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3377 :: 		Label8.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+36)
MOVT	R0, #hi_addr(_Label8+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3378 :: 		Label8.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+40)
MOVT	R0, #hi_addr(_Label8+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3380 :: 		Label9.OwnerScreen     = &Gyro_test;
MOVW	R1, #lo_addr(_Gyro_test+0)
MOVT	R1, #hi_addr(_Gyro_test+0)
MOVW	R0, #lo_addr(_Label9+0)
MOVT	R0, #hi_addr(_Label9+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3381 :: 		Label9.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label9+4)
MOVT	R0, #hi_addr(_Label9+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3382 :: 		Label9.Left            = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_Label9+6)
MOVT	R0, #hi_addr(_Label9+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3383 :: 		Label9.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label9+8)
MOVT	R0, #hi_addr(_Label9+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3384 :: 		Label9.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label9+10)
MOVT	R0, #hi_addr(_Label9+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3385 :: 		Label9.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label9+12)
MOVT	R0, #hi_addr(_Label9+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3386 :: 		Label9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label9+26)
MOVT	R0, #hi_addr(_Label9+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3387 :: 		Label9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label9+27)
MOVT	R0, #hi_addr(_Label9+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3388 :: 		Label9.Caption         = Label9_Caption;
MOVW	R1, #lo_addr(_Label9_Caption+0)
MOVT	R1, #hi_addr(_Label9_Caption+0)
MOVW	R0, #lo_addr(_Label9+16)
MOVT	R0, #hi_addr(_Label9+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3389 :: 		Label9.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #52255
MOVW	R0, #lo_addr(_Label9+20)
MOVT	R0, #hi_addr(_Label9+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3390 :: 		Label9.Font_Color      = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label9+24)
MOVT	R0, #hi_addr(_Label9+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3391 :: 		Label9.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+28)
MOVT	R0, #hi_addr(_Label9+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3392 :: 		Label9.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+32)
MOVT	R0, #hi_addr(_Label9+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3393 :: 		Label9.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+36)
MOVT	R0, #hi_addr(_Label9+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3394 :: 		Label9.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+40)
MOVT	R0, #hi_addr(_Label9+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3396 :: 		Label31.OwnerScreen     = &Gyro_test;
MOVW	R1, #lo_addr(_Gyro_test+0)
MOVT	R1, #hi_addr(_Gyro_test+0)
MOVW	R0, #lo_addr(_Label31+0)
MOVT	R0, #hi_addr(_Label31+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3397 :: 		Label31.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label31+4)
MOVT	R0, #hi_addr(_Label31+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3398 :: 		Label31.Left            = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Label31+6)
MOVT	R0, #hi_addr(_Label31+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3399 :: 		Label31.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label31+8)
MOVT	R0, #hi_addr(_Label31+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3400 :: 		Label31.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label31+10)
MOVT	R0, #hi_addr(_Label31+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3401 :: 		Label31.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label31+12)
MOVT	R0, #hi_addr(_Label31+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3402 :: 		Label31.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label31+26)
MOVT	R0, #hi_addr(_Label31+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3403 :: 		Label31.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label31+27)
MOVT	R0, #hi_addr(_Label31+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3404 :: 		Label31.Caption         = Label31_Caption;
MOVW	R1, #lo_addr(_Label31_Caption+0)
MOVT	R1, #hi_addr(_Label31_Caption+0)
MOVW	R0, #lo_addr(_Label31+16)
MOVT	R0, #hi_addr(_Label31+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3405 :: 		Label31.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #52255
MOVW	R0, #lo_addr(_Label31+20)
MOVT	R0, #hi_addr(_Label31+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3406 :: 		Label31.Font_Color      = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label31+24)
MOVT	R0, #hi_addr(_Label31+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3407 :: 		Label31.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label31+28)
MOVT	R0, #hi_addr(_Label31+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3408 :: 		Label31.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label31+32)
MOVT	R0, #hi_addr(_Label31+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3409 :: 		Label31.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label31+36)
MOVT	R0, #hi_addr(_Label31+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3410 :: 		Label31.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label31+40)
MOVT	R0, #hi_addr(_Label31+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3412 :: 		Label33.OwnerScreen     = &Gyro_test;
MOVW	R1, #lo_addr(_Gyro_test+0)
MOVT	R1, #hi_addr(_Gyro_test+0)
MOVW	R0, #lo_addr(_Label33+0)
MOVT	R0, #hi_addr(_Label33+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3413 :: 		Label33.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label33+4)
MOVT	R0, #hi_addr(_Label33+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3414 :: 		Label33.Left            = 375;
MOVW	R1, #375
MOVW	R0, #lo_addr(_Label33+6)
MOVT	R0, #hi_addr(_Label33+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3415 :: 		Label33.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label33+8)
MOVT	R0, #hi_addr(_Label33+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3416 :: 		Label33.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label33+10)
MOVT	R0, #hi_addr(_Label33+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3417 :: 		Label33.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label33+12)
MOVT	R0, #hi_addr(_Label33+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3418 :: 		Label33.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label33+26)
MOVT	R0, #hi_addr(_Label33+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3419 :: 		Label33.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label33+27)
MOVT	R0, #hi_addr(_Label33+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3420 :: 		Label33.Caption         = Label33_Caption;
MOVW	R1, #lo_addr(_Label33_Caption+0)
MOVT	R1, #hi_addr(_Label33_Caption+0)
MOVW	R0, #lo_addr(_Label33+16)
MOVT	R0, #hi_addr(_Label33+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3421 :: 		Label33.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #52255
MOVW	R0, #lo_addr(_Label33+20)
MOVT	R0, #hi_addr(_Label33+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3422 :: 		Label33.Font_Color      = 0x0400;
MOVW	R1, #1024
MOVW	R0, #lo_addr(_Label33+24)
MOVT	R0, #hi_addr(_Label33+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3423 :: 		Label33.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label33+28)
MOVT	R0, #hi_addr(_Label33+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3424 :: 		Label33.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label33+32)
MOVT	R0, #hi_addr(_Label33+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3425 :: 		Label33.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label33+36)
MOVT	R0, #hi_addr(_Label33+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3426 :: 		Label33.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label33+40)
MOVT	R0, #hi_addr(_Label33+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3428 :: 		Box15.OwnerScreen     = &Magnetometer_test;
MOVW	R1, #lo_addr(_Magnetometer_test+0)
MOVT	R1, #hi_addr(_Magnetometer_test+0)
MOVW	R0, #lo_addr(_Box15+0)
MOVT	R0, #hi_addr(_Box15+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3429 :: 		Box15.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+4)
MOVT	R0, #hi_addr(_Box15+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3430 :: 		Box15.Left            = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box15+6)
MOVT	R0, #hi_addr(_Box15+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3431 :: 		Box15.Top             = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Box15+8)
MOVT	R0, #hi_addr(_Box15+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3432 :: 		Box15.Width           = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Box15+10)
MOVT	R0, #hi_addr(_Box15+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3433 :: 		Box15.Height          = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Box15+12)
MOVT	R0, #hi_addr(_Box15+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3434 :: 		Box15.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box15+14)
MOVT	R0, #hi_addr(_Box15+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3435 :: 		Box15.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+16)
MOVT	R0, #hi_addr(_Box15+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3436 :: 		Box15.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+18)
MOVT	R0, #hi_addr(_Box15+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3437 :: 		Box15.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box15+19)
MOVT	R0, #hi_addr(_Box15+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3438 :: 		Box15.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box15+20)
MOVT	R0, #hi_addr(_Box15+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3439 :: 		Box15.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+21)
MOVT	R0, #hi_addr(_Box15+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3440 :: 		Box15.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+22)
MOVT	R0, #hi_addr(_Box15+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3441 :: 		Box15.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box15+24)
MOVT	R0, #hi_addr(_Box15+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3442 :: 		Box15.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box15+26)
MOVT	R0, #hi_addr(_Box15+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3443 :: 		Box15.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box15+28)
MOVT	R0, #hi_addr(_Box15+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3444 :: 		Box15.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+30)
MOVT	R0, #hi_addr(_Box15+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3445 :: 		Box15.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box15+32)
MOVT	R0, #hi_addr(_Box15+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3446 :: 		Box15.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+36)
MOVT	R0, #hi_addr(_Box15+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3447 :: 		Box15.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+40)
MOVT	R0, #hi_addr(_Box15+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3448 :: 		Box15.OnClickPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Box15+44)
MOVT	R0, #hi_addr(_Box15+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3449 :: 		Box15.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+48)
MOVT	R0, #hi_addr(_Box15+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3451 :: 		Box18.OwnerScreen     = &Magnetometer_test;
MOVW	R1, #lo_addr(_Magnetometer_test+0)
MOVT	R1, #hi_addr(_Magnetometer_test+0)
MOVW	R0, #lo_addr(_Box18+0)
MOVT	R0, #hi_addr(_Box18+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3452 :: 		Box18.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box18+4)
MOVT	R0, #hi_addr(_Box18+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3453 :: 		Box18.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box18+6)
MOVT	R0, #hi_addr(_Box18+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3454 :: 		Box18.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Box18+8)
MOVT	R0, #hi_addr(_Box18+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3455 :: 		Box18.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Box18+10)
MOVT	R0, #hi_addr(_Box18+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3456 :: 		Box18.Height          = 207;
MOVS	R1, #207
MOVW	R0, #lo_addr(_Box18+12)
MOVT	R0, #hi_addr(_Box18+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3457 :: 		Box18.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box18+14)
MOVT	R0, #hi_addr(_Box18+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3458 :: 		Box18.Pen_Color       = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box18+16)
MOVT	R0, #hi_addr(_Box18+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3459 :: 		Box18.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box18+18)
MOVT	R0, #hi_addr(_Box18+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3460 :: 		Box18.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box18+19)
MOVT	R0, #hi_addr(_Box18+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3461 :: 		Box18.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box18+20)
MOVT	R0, #hi_addr(_Box18+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3462 :: 		Box18.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box18+21)
MOVT	R0, #hi_addr(_Box18+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3463 :: 		Box18.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box18+22)
MOVT	R0, #hi_addr(_Box18+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3464 :: 		Box18.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box18+24)
MOVT	R0, #hi_addr(_Box18+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3465 :: 		Box18.Gradient_End_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box18+26)
MOVT	R0, #hi_addr(_Box18+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3466 :: 		Box18.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box18+28)
MOVT	R0, #hi_addr(_Box18+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3467 :: 		Box18.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box18+30)
MOVT	R0, #hi_addr(_Box18+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3468 :: 		Box18.Press_Color     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box18+32)
MOVT	R0, #hi_addr(_Box18+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3469 :: 		Box18.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box18+36)
MOVT	R0, #hi_addr(_Box18+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3470 :: 		Box18.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box18+40)
MOVT	R0, #hi_addr(_Box18+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3471 :: 		Box18.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box18+44)
MOVT	R0, #hi_addr(_Box18+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3472 :: 		Box18.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box18+48)
MOVT	R0, #hi_addr(_Box18+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3474 :: 		Image53.OwnerScreen     = &Magnetometer_test;
MOVW	R1, #lo_addr(_Magnetometer_test+0)
MOVT	R1, #hi_addr(_Magnetometer_test+0)
MOVW	R0, #lo_addr(_Image53+0)
MOVT	R0, #hi_addr(_Image53+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3475 :: 		Image53.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image53+4)
MOVT	R0, #hi_addr(_Image53+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3476 :: 		Image53.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image53+6)
MOVT	R0, #hi_addr(_Image53+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3477 :: 		Image53.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image53+8)
MOVT	R0, #hi_addr(_Image53+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3478 :: 		Image53.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image53+10)
MOVT	R0, #hi_addr(_Image53+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3479 :: 		Image53.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image53+12)
MOVT	R0, #hi_addr(_Image53+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3480 :: 		Image53.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image53+22)
MOVT	R0, #hi_addr(_Image53+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3481 :: 		Image53.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image53+23)
MOVT	R0, #hi_addr(_Image53+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3482 :: 		Image53.Picture_Name    = icon_back_magnet_bmp;
MOVW	R1, #55926
MOVT	R1, #62
MOVW	R0, #lo_addr(_Image53+16)
MOVT	R0, #hi_addr(_Image53+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3483 :: 		Image53.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image53+20)
MOVT	R0, #hi_addr(_Image53+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3484 :: 		Image53.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image53+21)
MOVT	R0, #hi_addr(_Image53+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3485 :: 		Image53.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image53+24)
MOVT	R0, #hi_addr(_Image53+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3486 :: 		Image53.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image53+28)
MOVT	R0, #hi_addr(_Image53+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3487 :: 		Image53.OnClickPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Image53+32)
MOVT	R0, #hi_addr(_Image53+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3488 :: 		Image53.OnPressPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Image53+36)
MOVT	R0, #hi_addr(_Image53+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3490 :: 		Label34.OwnerScreen     = &Magnetometer_test;
MOVW	R1, #lo_addr(_Magnetometer_test+0)
MOVT	R1, #hi_addr(_Magnetometer_test+0)
MOVW	R0, #lo_addr(_Label34+0)
MOVT	R0, #hi_addr(_Label34+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3491 :: 		Label34.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label34+4)
MOVT	R0, #hi_addr(_Label34+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3492 :: 		Label34.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label34+6)
MOVT	R0, #hi_addr(_Label34+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3493 :: 		Label34.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label34+8)
MOVT	R0, #hi_addr(_Label34+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3494 :: 		Label34.Width           = 211;
MOVS	R1, #211
MOVW	R0, #lo_addr(_Label34+10)
MOVT	R0, #hi_addr(_Label34+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3495 :: 		Label34.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label34+12)
MOVT	R0, #hi_addr(_Label34+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3496 :: 		Label34.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label34+26)
MOVT	R0, #hi_addr(_Label34+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3497 :: 		Label34.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label34+27)
MOVT	R0, #hi_addr(_Label34+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3498 :: 		Label34.Caption         = Label34_Caption;
MOVW	R1, #lo_addr(_Label34_Caption+0)
MOVT	R1, #hi_addr(_Label34_Caption+0)
MOVW	R0, #lo_addr(_Label34+16)
MOVT	R0, #hi_addr(_Label34+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3499 :: 		Label34.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R1, #55353
MOVW	R0, #lo_addr(_Label34+20)
MOVT	R0, #hi_addr(_Label34+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3500 :: 		Label34.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label34+24)
MOVT	R0, #hi_addr(_Label34+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3501 :: 		Label34.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label34+28)
MOVT	R0, #hi_addr(_Label34+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3502 :: 		Label34.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label34+32)
MOVT	R0, #hi_addr(_Label34+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3503 :: 		Label34.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label34+36)
MOVT	R0, #hi_addr(_Label34+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3504 :: 		Label34.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label34+40)
MOVT	R0, #hi_addr(_Label34+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3506 :: 		Label35.OwnerScreen     = &Magnetometer_test;
MOVW	R1, #lo_addr(_Magnetometer_test+0)
MOVT	R1, #hi_addr(_Magnetometer_test+0)
MOVW	R0, #lo_addr(_Label35+0)
MOVT	R0, #hi_addr(_Label35+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3507 :: 		Label35.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label35+4)
MOVT	R0, #hi_addr(_Label35+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3508 :: 		Label35.Left            = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_Label35+6)
MOVT	R0, #hi_addr(_Label35+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3509 :: 		Label35.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label35+8)
MOVT	R0, #hi_addr(_Label35+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3510 :: 		Label35.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label35+10)
MOVT	R0, #hi_addr(_Label35+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3511 :: 		Label35.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label35+12)
MOVT	R0, #hi_addr(_Label35+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3512 :: 		Label35.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label35+26)
MOVT	R0, #hi_addr(_Label35+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3513 :: 		Label35.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label35+27)
MOVT	R0, #hi_addr(_Label35+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3514 :: 		Label35.Caption         = Label35_Caption;
MOVW	R1, #lo_addr(_Label35_Caption+0)
MOVT	R1, #hi_addr(_Label35_Caption+0)
MOVW	R0, #lo_addr(_Label35+16)
MOVT	R0, #hi_addr(_Label35+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3515 :: 		Label35.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #52255
MOVW	R0, #lo_addr(_Label35+20)
MOVT	R0, #hi_addr(_Label35+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3516 :: 		Label35.Font_Color      = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label35+24)
MOVT	R0, #hi_addr(_Label35+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3517 :: 		Label35.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label35+28)
MOVT	R0, #hi_addr(_Label35+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3518 :: 		Label35.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label35+32)
MOVT	R0, #hi_addr(_Label35+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3519 :: 		Label35.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label35+36)
MOVT	R0, #hi_addr(_Label35+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3520 :: 		Label35.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label35+40)
MOVT	R0, #hi_addr(_Label35+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3522 :: 		Label36.OwnerScreen     = &Magnetometer_test;
MOVW	R1, #lo_addr(_Magnetometer_test+0)
MOVT	R1, #hi_addr(_Magnetometer_test+0)
MOVW	R0, #lo_addr(_Label36+0)
MOVT	R0, #hi_addr(_Label36+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3523 :: 		Label36.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label36+4)
MOVT	R0, #hi_addr(_Label36+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3524 :: 		Label36.Left            = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Label36+6)
MOVT	R0, #hi_addr(_Label36+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3525 :: 		Label36.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label36+8)
MOVT	R0, #hi_addr(_Label36+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3526 :: 		Label36.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label36+10)
MOVT	R0, #hi_addr(_Label36+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3527 :: 		Label36.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label36+12)
MOVT	R0, #hi_addr(_Label36+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3528 :: 		Label36.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label36+26)
MOVT	R0, #hi_addr(_Label36+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3529 :: 		Label36.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label36+27)
MOVT	R0, #hi_addr(_Label36+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3530 :: 		Label36.Caption         = Label36_Caption;
MOVW	R1, #lo_addr(_Label36_Caption+0)
MOVT	R1, #hi_addr(_Label36_Caption+0)
MOVW	R0, #lo_addr(_Label36+16)
MOVT	R0, #hi_addr(_Label36+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3531 :: 		Label36.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #52255
MOVW	R0, #lo_addr(_Label36+20)
MOVT	R0, #hi_addr(_Label36+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3532 :: 		Label36.Font_Color      = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label36+24)
MOVT	R0, #hi_addr(_Label36+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3533 :: 		Label36.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label36+28)
MOVT	R0, #hi_addr(_Label36+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3534 :: 		Label36.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label36+32)
MOVT	R0, #hi_addr(_Label36+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3535 :: 		Label36.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label36+36)
MOVT	R0, #hi_addr(_Label36+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3536 :: 		Label36.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label36+40)
MOVT	R0, #hi_addr(_Label36+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3538 :: 		Label37.OwnerScreen     = &Magnetometer_test;
MOVW	R1, #lo_addr(_Magnetometer_test+0)
MOVT	R1, #hi_addr(_Magnetometer_test+0)
MOVW	R0, #lo_addr(_Label37+0)
MOVT	R0, #hi_addr(_Label37+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3539 :: 		Label37.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label37+4)
MOVT	R0, #hi_addr(_Label37+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3540 :: 		Label37.Left            = 375;
MOVW	R1, #375
MOVW	R0, #lo_addr(_Label37+6)
MOVT	R0, #hi_addr(_Label37+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3541 :: 		Label37.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label37+8)
MOVT	R0, #hi_addr(_Label37+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3542 :: 		Label37.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label37+10)
MOVT	R0, #hi_addr(_Label37+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3543 :: 		Label37.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label37+12)
MOVT	R0, #hi_addr(_Label37+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3544 :: 		Label37.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label37+26)
MOVT	R0, #hi_addr(_Label37+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3545 :: 		Label37.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label37+27)
MOVT	R0, #hi_addr(_Label37+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3546 :: 		Label37.Caption         = Label37_Caption;
MOVW	R1, #lo_addr(_Label37_Caption+0)
MOVT	R1, #hi_addr(_Label37_Caption+0)
MOVW	R0, #lo_addr(_Label37+16)
MOVT	R0, #hi_addr(_Label37+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3547 :: 		Label37.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #52255
MOVW	R0, #lo_addr(_Label37+20)
MOVT	R0, #hi_addr(_Label37+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3548 :: 		Label37.Font_Color      = 0x0400;
MOVW	R1, #1024
MOVW	R0, #lo_addr(_Label37+24)
MOVT	R0, #hi_addr(_Label37+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3549 :: 		Label37.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label37+28)
MOVT	R0, #hi_addr(_Label37+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3550 :: 		Label37.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label37+32)
MOVT	R0, #hi_addr(_Label37+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3551 :: 		Label37.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label37+36)
MOVT	R0, #hi_addr(_Label37+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3552 :: 		Label37.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label37+40)
MOVT	R0, #hi_addr(_Label37+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3554 :: 		Box19.OwnerScreen     = &Pressure_test;
MOVW	R1, #lo_addr(_Pressure_test+0)
MOVT	R1, #hi_addr(_Pressure_test+0)
MOVW	R0, #lo_addr(_Box19+0)
MOVT	R0, #hi_addr(_Box19+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3555 :: 		Box19.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+4)
MOVT	R0, #hi_addr(_Box19+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3556 :: 		Box19.Left            = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box19+6)
MOVT	R0, #hi_addr(_Box19+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3557 :: 		Box19.Top             = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Box19+8)
MOVT	R0, #hi_addr(_Box19+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3558 :: 		Box19.Width           = 265;
MOVW	R1, #265
MOVW	R0, #lo_addr(_Box19+10)
MOVT	R0, #hi_addr(_Box19+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3559 :: 		Box19.Height          = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Box19+12)
MOVT	R0, #hi_addr(_Box19+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3560 :: 		Box19.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box19+14)
MOVT	R0, #hi_addr(_Box19+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3561 :: 		Box19.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+16)
MOVT	R0, #hi_addr(_Box19+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3562 :: 		Box19.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+18)
MOVT	R0, #hi_addr(_Box19+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3563 :: 		Box19.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box19+19)
MOVT	R0, #hi_addr(_Box19+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3564 :: 		Box19.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box19+20)
MOVT	R0, #hi_addr(_Box19+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3565 :: 		Box19.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+21)
MOVT	R0, #hi_addr(_Box19+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3566 :: 		Box19.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+22)
MOVT	R0, #hi_addr(_Box19+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3567 :: 		Box19.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box19+24)
MOVT	R0, #hi_addr(_Box19+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3568 :: 		Box19.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box19+26)
MOVT	R0, #hi_addr(_Box19+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3569 :: 		Box19.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box19+28)
MOVT	R0, #hi_addr(_Box19+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3570 :: 		Box19.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+30)
MOVT	R0, #hi_addr(_Box19+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3571 :: 		Box19.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box19+32)
MOVT	R0, #hi_addr(_Box19+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3572 :: 		Box19.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+36)
MOVT	R0, #hi_addr(_Box19+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3573 :: 		Box19.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+40)
MOVT	R0, #hi_addr(_Box19+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3574 :: 		Box19.OnClickPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Box19+44)
MOVT	R0, #hi_addr(_Box19+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3575 :: 		Box19.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+48)
MOVT	R0, #hi_addr(_Box19+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3577 :: 		Box20.OwnerScreen     = &Pressure_test;
MOVW	R1, #lo_addr(_Pressure_test+0)
MOVT	R1, #hi_addr(_Pressure_test+0)
MOVW	R0, #lo_addr(_Box20+0)
MOVT	R0, #hi_addr(_Box20+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3578 :: 		Box20.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box20+4)
MOVT	R0, #hi_addr(_Box20+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3579 :: 		Box20.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+6)
MOVT	R0, #hi_addr(_Box20+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3580 :: 		Box20.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Box20+8)
MOVT	R0, #hi_addr(_Box20+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3581 :: 		Box20.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Box20+10)
MOVT	R0, #hi_addr(_Box20+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3582 :: 		Box20.Height          = 207;
MOVS	R1, #207
MOVW	R0, #lo_addr(_Box20+12)
MOVT	R0, #hi_addr(_Box20+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3583 :: 		Box20.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box20+14)
MOVT	R0, #hi_addr(_Box20+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3584 :: 		Box20.Pen_Color       = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box20+16)
MOVT	R0, #hi_addr(_Box20+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3585 :: 		Box20.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box20+18)
MOVT	R0, #hi_addr(_Box20+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3586 :: 		Box20.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box20+19)
MOVT	R0, #hi_addr(_Box20+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3587 :: 		Box20.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box20+20)
MOVT	R0, #hi_addr(_Box20+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3588 :: 		Box20.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+21)
MOVT	R0, #hi_addr(_Box20+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3589 :: 		Box20.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+22)
MOVT	R0, #hi_addr(_Box20+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3590 :: 		Box20.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box20+24)
MOVT	R0, #hi_addr(_Box20+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3591 :: 		Box20.Gradient_End_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box20+26)
MOVT	R0, #hi_addr(_Box20+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3592 :: 		Box20.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box20+28)
MOVT	R0, #hi_addr(_Box20+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3593 :: 		Box20.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+30)
MOVT	R0, #hi_addr(_Box20+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3594 :: 		Box20.Press_Color     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box20+32)
MOVT	R0, #hi_addr(_Box20+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3595 :: 		Box20.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+36)
MOVT	R0, #hi_addr(_Box20+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3596 :: 		Box20.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+40)
MOVT	R0, #hi_addr(_Box20+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3597 :: 		Box20.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+44)
MOVT	R0, #hi_addr(_Box20+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3598 :: 		Box20.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+48)
MOVT	R0, #hi_addr(_Box20+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3600 :: 		Image54.OwnerScreen     = &Pressure_test;
MOVW	R1, #lo_addr(_Pressure_test+0)
MOVT	R1, #hi_addr(_Pressure_test+0)
MOVW	R0, #lo_addr(_Image54+0)
MOVT	R0, #hi_addr(_Image54+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3601 :: 		Image54.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image54+4)
MOVT	R0, #hi_addr(_Image54+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3602 :: 		Image54.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image54+6)
MOVT	R0, #hi_addr(_Image54+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3603 :: 		Image54.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image54+8)
MOVT	R0, #hi_addr(_Image54+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3604 :: 		Image54.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image54+10)
MOVT	R0, #hi_addr(_Image54+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3605 :: 		Image54.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image54+12)
MOVT	R0, #hi_addr(_Image54+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3606 :: 		Image54.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image54+22)
MOVT	R0, #hi_addr(_Image54+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3607 :: 		Image54.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image54+23)
MOVT	R0, #hi_addr(_Image54+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3608 :: 		Image54.Picture_Name    = icon_back_pressure_bmp;
MOVW	R1, #56900
MOVT	R1, #62
MOVW	R0, #lo_addr(_Image54+16)
MOVT	R0, #hi_addr(_Image54+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3609 :: 		Image54.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image54+20)
MOVT	R0, #hi_addr(_Image54+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3610 :: 		Image54.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image54+21)
MOVT	R0, #hi_addr(_Image54+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3611 :: 		Image54.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image54+24)
MOVT	R0, #hi_addr(_Image54+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3612 :: 		Image54.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image54+28)
MOVT	R0, #hi_addr(_Image54+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3613 :: 		Image54.OnClickPtr      = doPrevScreen;
MOVW	R1, #lo_addr(_doPrevScreen+0)
MOVT	R1, #hi_addr(_doPrevScreen+0)
MOVW	R0, #lo_addr(_Image54+32)
MOVT	R0, #hi_addr(_Image54+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3614 :: 		Image54.OnPressPtr      = doPrevScreen;
MOVW	R1, #lo_addr(_doPrevScreen+0)
MOVT	R1, #hi_addr(_doPrevScreen+0)
MOVW	R0, #lo_addr(_Image54+36)
MOVT	R0, #hi_addr(_Image54+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3616 :: 		Label38.OwnerScreen     = &Pressure_test;
MOVW	R1, #lo_addr(_Pressure_test+0)
MOVT	R1, #hi_addr(_Pressure_test+0)
MOVW	R0, #lo_addr(_Label38+0)
MOVT	R0, #hi_addr(_Label38+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3617 :: 		Label38.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label38+4)
MOVT	R0, #hi_addr(_Label38+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3618 :: 		Label38.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label38+6)
MOVT	R0, #hi_addr(_Label38+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3619 :: 		Label38.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label38+8)
MOVT	R0, #hi_addr(_Label38+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3620 :: 		Label38.Width           = 226;
MOVS	R1, #226
MOVW	R0, #lo_addr(_Label38+10)
MOVT	R0, #hi_addr(_Label38+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3621 :: 		Label38.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label38+12)
MOVT	R0, #hi_addr(_Label38+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3622 :: 		Label38.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label38+26)
MOVT	R0, #hi_addr(_Label38+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3623 :: 		Label38.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label38+27)
MOVT	R0, #hi_addr(_Label38+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3624 :: 		Label38.Caption         = Label38_Caption;
MOVW	R1, #lo_addr(_Label38_Caption+0)
MOVT	R1, #hi_addr(_Label38_Caption+0)
MOVW	R0, #lo_addr(_Label38+16)
MOVT	R0, #hi_addr(_Label38+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3625 :: 		Label38.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R1, #55353
MOVW	R0, #lo_addr(_Label38+20)
MOVT	R0, #hi_addr(_Label38+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3626 :: 		Label38.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label38+24)
MOVT	R0, #hi_addr(_Label38+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3627 :: 		Label38.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label38+28)
MOVT	R0, #hi_addr(_Label38+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3628 :: 		Label38.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label38+32)
MOVT	R0, #hi_addr(_Label38+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3629 :: 		Label38.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label38+36)
MOVT	R0, #hi_addr(_Label38+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3630 :: 		Label38.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label38+40)
MOVT	R0, #hi_addr(_Label38+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3632 :: 		Label39.OwnerScreen     = &Pressure_test;
MOVW	R1, #lo_addr(_Pressure_test+0)
MOVT	R1, #hi_addr(_Pressure_test+0)
MOVW	R0, #lo_addr(_Label39+0)
MOVT	R0, #hi_addr(_Label39+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3633 :: 		Label39.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label39+4)
MOVT	R0, #hi_addr(_Label39+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3634 :: 		Label39.Left            = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_Label39+6)
MOVT	R0, #hi_addr(_Label39+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3635 :: 		Label39.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label39+8)
MOVT	R0, #hi_addr(_Label39+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3636 :: 		Label39.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label39+10)
MOVT	R0, #hi_addr(_Label39+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3637 :: 		Label39.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label39+12)
MOVT	R0, #hi_addr(_Label39+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3638 :: 		Label39.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label39+26)
MOVT	R0, #hi_addr(_Label39+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3639 :: 		Label39.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label39+27)
MOVT	R0, #hi_addr(_Label39+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3640 :: 		Label39.Caption         = Label39_Caption;
MOVW	R1, #lo_addr(_Label39_Caption+0)
MOVT	R1, #hi_addr(_Label39_Caption+0)
MOVW	R0, #lo_addr(_Label39+16)
MOVT	R0, #hi_addr(_Label39+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3641 :: 		Label39.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #52255
MOVW	R0, #lo_addr(_Label39+20)
MOVT	R0, #hi_addr(_Label39+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3642 :: 		Label39.Font_Color      = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label39+24)
MOVT	R0, #hi_addr(_Label39+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3643 :: 		Label39.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label39+28)
MOVT	R0, #hi_addr(_Label39+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3644 :: 		Label39.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label39+32)
MOVT	R0, #hi_addr(_Label39+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3645 :: 		Label39.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label39+36)
MOVT	R0, #hi_addr(_Label39+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3646 :: 		Label39.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label39+40)
MOVT	R0, #hi_addr(_Label39+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3648 :: 		Label40.OwnerScreen     = &Pressure_test;
MOVW	R1, #lo_addr(_Pressure_test+0)
MOVT	R1, #hi_addr(_Pressure_test+0)
MOVW	R0, #lo_addr(_Label40+0)
MOVT	R0, #hi_addr(_Label40+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3649 :: 		Label40.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label40+4)
MOVT	R0, #hi_addr(_Label40+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3650 :: 		Label40.Left            = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Label40+6)
MOVT	R0, #hi_addr(_Label40+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3651 :: 		Label40.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label40+8)
MOVT	R0, #hi_addr(_Label40+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3652 :: 		Label40.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label40+10)
MOVT	R0, #hi_addr(_Label40+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3653 :: 		Label40.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label40+12)
MOVT	R0, #hi_addr(_Label40+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3654 :: 		Label40.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label40+26)
MOVT	R0, #hi_addr(_Label40+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3655 :: 		Label40.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label40+27)
MOVT	R0, #hi_addr(_Label40+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3656 :: 		Label40.Caption         = Label40_Caption;
MOVW	R1, #lo_addr(_Label40_Caption+0)
MOVT	R1, #hi_addr(_Label40_Caption+0)
MOVW	R0, #lo_addr(_Label40+16)
MOVT	R0, #hi_addr(_Label40+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3657 :: 		Label40.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #52255
MOVW	R0, #lo_addr(_Label40+20)
MOVT	R0, #hi_addr(_Label40+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3658 :: 		Label40.Font_Color      = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label40+24)
MOVT	R0, #hi_addr(_Label40+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3659 :: 		Label40.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label40+28)
MOVT	R0, #hi_addr(_Label40+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3660 :: 		Label40.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label40+32)
MOVT	R0, #hi_addr(_Label40+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3661 :: 		Label40.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label40+36)
MOVT	R0, #hi_addr(_Label40+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3662 :: 		Label40.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label40+40)
MOVT	R0, #hi_addr(_Label40+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3664 :: 		Label41.OwnerScreen     = &Pressure_test;
MOVW	R1, #lo_addr(_Pressure_test+0)
MOVT	R1, #hi_addr(_Pressure_test+0)
MOVW	R0, #lo_addr(_Label41+0)
MOVT	R0, #hi_addr(_Label41+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3665 :: 		Label41.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label41+4)
MOVT	R0, #hi_addr(_Label41+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3666 :: 		Label41.Left            = 375;
MOVW	R1, #375
MOVW	R0, #lo_addr(_Label41+6)
MOVT	R0, #hi_addr(_Label41+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3667 :: 		Label41.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label41+8)
MOVT	R0, #hi_addr(_Label41+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3668 :: 		Label41.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label41+10)
MOVT	R0, #hi_addr(_Label41+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3669 :: 		Label41.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label41+12)
MOVT	R0, #hi_addr(_Label41+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3670 :: 		Label41.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label41+26)
MOVT	R0, #hi_addr(_Label41+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3671 :: 		Label41.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label41+27)
MOVT	R0, #hi_addr(_Label41+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3672 :: 		Label41.Caption         = Label41_Caption;
MOVW	R1, #lo_addr(_Label41_Caption+0)
MOVT	R1, #hi_addr(_Label41_Caption+0)
MOVW	R0, #lo_addr(_Label41+16)
MOVT	R0, #hi_addr(_Label41+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3673 :: 		Label41.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #52255
MOVW	R0, #lo_addr(_Label41+20)
MOVT	R0, #hi_addr(_Label41+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3674 :: 		Label41.Font_Color      = 0x0400;
MOVW	R1, #1024
MOVW	R0, #lo_addr(_Label41+24)
MOVT	R0, #hi_addr(_Label41+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3675 :: 		Label41.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label41+28)
MOVT	R0, #hi_addr(_Label41+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3676 :: 		Label41.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label41+32)
MOVT	R0, #hi_addr(_Label41+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3677 :: 		Label41.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label41+36)
MOVT	R0, #hi_addr(_Label41+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3678 :: 		Label41.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label41+40)
MOVT	R0, #hi_addr(_Label41+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3680 :: 		Box21.OwnerScreen     = &Humidity_test;
MOVW	R1, #lo_addr(_Humidity_test+0)
MOVT	R1, #hi_addr(_Humidity_test+0)
MOVW	R0, #lo_addr(_Box21+0)
MOVT	R0, #hi_addr(_Box21+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3681 :: 		Box21.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+4)
MOVT	R0, #hi_addr(_Box21+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3682 :: 		Box21.Left            = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box21+6)
MOVT	R0, #hi_addr(_Box21+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3683 :: 		Box21.Top             = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Box21+8)
MOVT	R0, #hi_addr(_Box21+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3684 :: 		Box21.Width           = 265;
MOVW	R1, #265
MOVW	R0, #lo_addr(_Box21+10)
MOVT	R0, #hi_addr(_Box21+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3685 :: 		Box21.Height          = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Box21+12)
MOVT	R0, #hi_addr(_Box21+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3686 :: 		Box21.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box21+14)
MOVT	R0, #hi_addr(_Box21+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3687 :: 		Box21.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+16)
MOVT	R0, #hi_addr(_Box21+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3688 :: 		Box21.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+18)
MOVT	R0, #hi_addr(_Box21+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3689 :: 		Box21.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box21+19)
MOVT	R0, #hi_addr(_Box21+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3690 :: 		Box21.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box21+20)
MOVT	R0, #hi_addr(_Box21+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3691 :: 		Box21.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+21)
MOVT	R0, #hi_addr(_Box21+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3692 :: 		Box21.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+22)
MOVT	R0, #hi_addr(_Box21+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3693 :: 		Box21.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box21+24)
MOVT	R0, #hi_addr(_Box21+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3694 :: 		Box21.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box21+26)
MOVT	R0, #hi_addr(_Box21+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3695 :: 		Box21.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box21+28)
MOVT	R0, #hi_addr(_Box21+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3696 :: 		Box21.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+30)
MOVT	R0, #hi_addr(_Box21+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3697 :: 		Box21.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box21+32)
MOVT	R0, #hi_addr(_Box21+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3698 :: 		Box21.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+36)
MOVT	R0, #hi_addr(_Box21+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3699 :: 		Box21.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+40)
MOVT	R0, #hi_addr(_Box21+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3700 :: 		Box21.OnClickPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Box21+44)
MOVT	R0, #hi_addr(_Box21+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3701 :: 		Box21.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+48)
MOVT	R0, #hi_addr(_Box21+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3703 :: 		Box22.OwnerScreen     = &Humidity_test;
MOVW	R1, #lo_addr(_Humidity_test+0)
MOVT	R1, #hi_addr(_Humidity_test+0)
MOVW	R0, #lo_addr(_Box22+0)
MOVT	R0, #hi_addr(_Box22+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3704 :: 		Box22.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box22+4)
MOVT	R0, #hi_addr(_Box22+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3705 :: 		Box22.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+6)
MOVT	R0, #hi_addr(_Box22+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3706 :: 		Box22.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Box22+8)
MOVT	R0, #hi_addr(_Box22+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3707 :: 		Box22.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Box22+10)
MOVT	R0, #hi_addr(_Box22+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3708 :: 		Box22.Height          = 207;
MOVS	R1, #207
MOVW	R0, #lo_addr(_Box22+12)
MOVT	R0, #hi_addr(_Box22+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3709 :: 		Box22.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box22+14)
MOVT	R0, #hi_addr(_Box22+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3710 :: 		Box22.Pen_Color       = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box22+16)
MOVT	R0, #hi_addr(_Box22+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3711 :: 		Box22.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box22+18)
MOVT	R0, #hi_addr(_Box22+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3712 :: 		Box22.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box22+19)
MOVT	R0, #hi_addr(_Box22+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3713 :: 		Box22.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box22+20)
MOVT	R0, #hi_addr(_Box22+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3714 :: 		Box22.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+21)
MOVT	R0, #hi_addr(_Box22+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3715 :: 		Box22.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+22)
MOVT	R0, #hi_addr(_Box22+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3716 :: 		Box22.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box22+24)
MOVT	R0, #hi_addr(_Box22+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3717 :: 		Box22.Gradient_End_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box22+26)
MOVT	R0, #hi_addr(_Box22+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3718 :: 		Box22.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box22+28)
MOVT	R0, #hi_addr(_Box22+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3719 :: 		Box22.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+30)
MOVT	R0, #hi_addr(_Box22+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3720 :: 		Box22.Press_Color     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box22+32)
MOVT	R0, #hi_addr(_Box22+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3721 :: 		Box22.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+36)
MOVT	R0, #hi_addr(_Box22+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3722 :: 		Box22.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+40)
MOVT	R0, #hi_addr(_Box22+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3723 :: 		Box22.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+44)
MOVT	R0, #hi_addr(_Box22+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3724 :: 		Box22.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+48)
MOVT	R0, #hi_addr(_Box22+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3726 :: 		Image55.OwnerScreen     = &Humidity_test;
MOVW	R1, #lo_addr(_Humidity_test+0)
MOVT	R1, #hi_addr(_Humidity_test+0)
MOVW	R0, #lo_addr(_Image55+0)
MOVT	R0, #hi_addr(_Image55+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3727 :: 		Image55.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image55+4)
MOVT	R0, #hi_addr(_Image55+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3728 :: 		Image55.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image55+6)
MOVT	R0, #hi_addr(_Image55+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3729 :: 		Image55.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image55+8)
MOVT	R0, #hi_addr(_Image55+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3730 :: 		Image55.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image55+10)
MOVT	R0, #hi_addr(_Image55+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3731 :: 		Image55.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image55+12)
MOVT	R0, #hi_addr(_Image55+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3732 :: 		Image55.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image55+22)
MOVT	R0, #hi_addr(_Image55+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3733 :: 		Image55.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image55+23)
MOVT	R0, #hi_addr(_Image55+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3734 :: 		Image55.Picture_Name    = icon_back_pressure_bmp;
MOVW	R1, #56900
MOVT	R1, #62
MOVW	R0, #lo_addr(_Image55+16)
MOVT	R0, #hi_addr(_Image55+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3735 :: 		Image55.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image55+20)
MOVT	R0, #hi_addr(_Image55+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3736 :: 		Image55.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image55+21)
MOVT	R0, #hi_addr(_Image55+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3737 :: 		Image55.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image55+24)
MOVT	R0, #hi_addr(_Image55+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3738 :: 		Image55.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image55+28)
MOVT	R0, #hi_addr(_Image55+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3739 :: 		Image55.OnClickPtr      = doPrevScreen;
MOVW	R1, #lo_addr(_doPrevScreen+0)
MOVT	R1, #hi_addr(_doPrevScreen+0)
MOVW	R0, #lo_addr(_Image55+32)
MOVT	R0, #hi_addr(_Image55+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3740 :: 		Image55.OnPressPtr      = doPrevScreen;
MOVW	R1, #lo_addr(_doPrevScreen+0)
MOVT	R1, #hi_addr(_doPrevScreen+0)
MOVW	R0, #lo_addr(_Image55+36)
MOVT	R0, #hi_addr(_Image55+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3742 :: 		Label42.OwnerScreen     = &Humidity_test;
MOVW	R1, #lo_addr(_Humidity_test+0)
MOVT	R1, #hi_addr(_Humidity_test+0)
MOVW	R0, #lo_addr(_Label42+0)
MOVT	R0, #hi_addr(_Label42+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3743 :: 		Label42.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label42+4)
MOVT	R0, #hi_addr(_Label42+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3744 :: 		Label42.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label42+6)
MOVT	R0, #hi_addr(_Label42+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3745 :: 		Label42.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label42+8)
MOVT	R0, #hi_addr(_Label42+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3746 :: 		Label42.Width           = 227;
MOVS	R1, #227
MOVW	R0, #lo_addr(_Label42+10)
MOVT	R0, #hi_addr(_Label42+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3747 :: 		Label42.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label42+12)
MOVT	R0, #hi_addr(_Label42+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3748 :: 		Label42.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label42+26)
MOVT	R0, #hi_addr(_Label42+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3749 :: 		Label42.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label42+27)
MOVT	R0, #hi_addr(_Label42+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3750 :: 		Label42.Caption         = Label42_Caption;
MOVW	R1, #lo_addr(_Label42_Caption+0)
MOVT	R1, #hi_addr(_Label42_Caption+0)
MOVW	R0, #lo_addr(_Label42+16)
MOVT	R0, #hi_addr(_Label42+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3751 :: 		Label42.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R1, #55353
MOVW	R0, #lo_addr(_Label42+20)
MOVT	R0, #hi_addr(_Label42+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3752 :: 		Label42.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label42+24)
MOVT	R0, #hi_addr(_Label42+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3753 :: 		Label42.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label42+28)
MOVT	R0, #hi_addr(_Label42+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3754 :: 		Label42.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label42+32)
MOVT	R0, #hi_addr(_Label42+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3755 :: 		Label42.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label42+36)
MOVT	R0, #hi_addr(_Label42+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3756 :: 		Label42.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label42+40)
MOVT	R0, #hi_addr(_Label42+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3758 :: 		Label43.OwnerScreen     = &Humidity_test;
MOVW	R1, #lo_addr(_Humidity_test+0)
MOVT	R1, #hi_addr(_Humidity_test+0)
MOVW	R0, #lo_addr(_Label43+0)
MOVT	R0, #hi_addr(_Label43+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3759 :: 		Label43.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label43+4)
MOVT	R0, #hi_addr(_Label43+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3760 :: 		Label43.Left            = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_Label43+6)
MOVT	R0, #hi_addr(_Label43+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3761 :: 		Label43.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label43+8)
MOVT	R0, #hi_addr(_Label43+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3762 :: 		Label43.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label43+10)
MOVT	R0, #hi_addr(_Label43+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3763 :: 		Label43.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label43+12)
MOVT	R0, #hi_addr(_Label43+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3764 :: 		Label43.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label43+26)
MOVT	R0, #hi_addr(_Label43+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3765 :: 		Label43.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label43+27)
MOVT	R0, #hi_addr(_Label43+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3766 :: 		Label43.Caption         = Label43_Caption;
MOVW	R1, #lo_addr(_Label43_Caption+0)
MOVT	R1, #hi_addr(_Label43_Caption+0)
MOVW	R0, #lo_addr(_Label43+16)
MOVT	R0, #hi_addr(_Label43+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3767 :: 		Label43.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #52255
MOVW	R0, #lo_addr(_Label43+20)
MOVT	R0, #hi_addr(_Label43+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3768 :: 		Label43.Font_Color      = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label43+24)
MOVT	R0, #hi_addr(_Label43+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3769 :: 		Label43.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label43+28)
MOVT	R0, #hi_addr(_Label43+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3770 :: 		Label43.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label43+32)
MOVT	R0, #hi_addr(_Label43+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3771 :: 		Label43.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label43+36)
MOVT	R0, #hi_addr(_Label43+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3772 :: 		Label43.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label43+40)
MOVT	R0, #hi_addr(_Label43+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3774 :: 		Label44.OwnerScreen     = &Humidity_test;
MOVW	R1, #lo_addr(_Humidity_test+0)
MOVT	R1, #hi_addr(_Humidity_test+0)
MOVW	R0, #lo_addr(_Label44+0)
MOVT	R0, #hi_addr(_Label44+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3775 :: 		Label44.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label44+4)
MOVT	R0, #hi_addr(_Label44+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3776 :: 		Label44.Left            = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Label44+6)
MOVT	R0, #hi_addr(_Label44+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3777 :: 		Label44.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label44+8)
MOVT	R0, #hi_addr(_Label44+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3778 :: 		Label44.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label44+10)
MOVT	R0, #hi_addr(_Label44+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3779 :: 		Label44.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label44+12)
MOVT	R0, #hi_addr(_Label44+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3780 :: 		Label44.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label44+26)
MOVT	R0, #hi_addr(_Label44+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3781 :: 		Label44.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label44+27)
MOVT	R0, #hi_addr(_Label44+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3782 :: 		Label44.Caption         = Label44_Caption;
MOVW	R1, #lo_addr(_Label44_Caption+0)
MOVT	R1, #hi_addr(_Label44_Caption+0)
MOVW	R0, #lo_addr(_Label44+16)
MOVT	R0, #hi_addr(_Label44+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3783 :: 		Label44.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #52255
MOVW	R0, #lo_addr(_Label44+20)
MOVT	R0, #hi_addr(_Label44+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3784 :: 		Label44.Font_Color      = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label44+24)
MOVT	R0, #hi_addr(_Label44+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3785 :: 		Label44.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label44+28)
MOVT	R0, #hi_addr(_Label44+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3786 :: 		Label44.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label44+32)
MOVT	R0, #hi_addr(_Label44+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3787 :: 		Label44.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label44+36)
MOVT	R0, #hi_addr(_Label44+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3788 :: 		Label44.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label44+40)
MOVT	R0, #hi_addr(_Label44+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3790 :: 		Label45.OwnerScreen     = &Humidity_test;
MOVW	R1, #lo_addr(_Humidity_test+0)
MOVT	R1, #hi_addr(_Humidity_test+0)
MOVW	R0, #lo_addr(_Label45+0)
MOVT	R0, #hi_addr(_Label45+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3791 :: 		Label45.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label45+4)
MOVT	R0, #hi_addr(_Label45+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3792 :: 		Label45.Left            = 375;
MOVW	R1, #375
MOVW	R0, #lo_addr(_Label45+6)
MOVT	R0, #hi_addr(_Label45+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3793 :: 		Label45.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label45+8)
MOVT	R0, #hi_addr(_Label45+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3794 :: 		Label45.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label45+10)
MOVT	R0, #hi_addr(_Label45+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3795 :: 		Label45.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label45+12)
MOVT	R0, #hi_addr(_Label45+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3796 :: 		Label45.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label45+26)
MOVT	R0, #hi_addr(_Label45+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3797 :: 		Label45.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label45+27)
MOVT	R0, #hi_addr(_Label45+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3798 :: 		Label45.Caption         = Label45_Caption;
MOVW	R1, #lo_addr(_Label45_Caption+0)
MOVT	R1, #hi_addr(_Label45_Caption+0)
MOVW	R0, #lo_addr(_Label45+16)
MOVT	R0, #hi_addr(_Label45+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3799 :: 		Label45.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #52255
MOVW	R0, #lo_addr(_Label45+20)
MOVT	R0, #hi_addr(_Label45+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3800 :: 		Label45.Font_Color      = 0x0400;
MOVW	R1, #1024
MOVW	R0, #lo_addr(_Label45+24)
MOVT	R0, #hi_addr(_Label45+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3801 :: 		Label45.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label45+28)
MOVT	R0, #hi_addr(_Label45+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3802 :: 		Label45.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label45+32)
MOVT	R0, #hi_addr(_Label45+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3803 :: 		Label45.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label45+36)
MOVT	R0, #hi_addr(_Label45+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3804 :: 		Label45.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label45+40)
MOVT	R0, #hi_addr(_Label45+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3805 :: 		}
L_end_InitializeObjects:
BX	LR
; end of Ducati_logger_driver_InitializeObjects
Ducati_logger_driver_IsInsideObject:
;Ducati_logger_driver.c,3807 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
; Top start address is: 12 (R3)
; Left start address is: 8 (R2)
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
; Top end address is: 12 (R3)
; Left end address is: 8 (R2)
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
; Left start address is: 8 (R2)
; Top start address is: 12 (R3)
; Width start address is: 20 (R5)
LDRH	R5, [SP, #0]
; Height start address is: 24 (R6)
LDRH	R6, [SP, #4]
;Ducati_logger_driver.c,3808 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
CMP	R2, R0
IT	HI
BHI	L_Ducati_logger_driver_IsInsideObject266
ADDS	R4, R2, R5
UXTH	R4, R4
; Left end address is: 8 (R2)
; Width end address is: 20 (R5)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R0
IT	CC
BCC	L_Ducati_logger_driver_IsInsideObject265
; X end address is: 0 (R0)
;Ducati_logger_driver.c,3809 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
CMP	R3, R1
IT	HI
BHI	L_Ducati_logger_driver_IsInsideObject264
ADDS	R4, R3, R6
UXTH	R4, R4
; Top end address is: 12 (R3)
; Height end address is: 24 (R6)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R1
IT	CC
BCC	L_Ducati_logger_driver_IsInsideObject263
; Y end address is: 4 (R1)
L_Ducati_logger_driver_IsInsideObject262:
;Ducati_logger_driver.c,3810 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_IsInsideObject
;Ducati_logger_driver.c,3808 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
L_Ducati_logger_driver_IsInsideObject266:
L_Ducati_logger_driver_IsInsideObject265:
;Ducati_logger_driver.c,3809 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
L_Ducati_logger_driver_IsInsideObject264:
L_Ducati_logger_driver_IsInsideObject263:
;Ducati_logger_driver.c,3812 :: 		return 0;
MOVS	R0, #0
;Ducati_logger_driver.c,3813 :: 		}
L_end_IsInsideObject:
BX	LR
; end of Ducati_logger_driver_IsInsideObject
_DrawRoundButton:
;Ducati_logger_driver.c,3827 :: 		void DrawRoundButton(TButton_Round *Around_button) {
; Around_button start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Around_button end address is: 0 (R0)
; Around_button start address is: 0 (R0)
;Ducati_logger_driver.c,3828 :: 		if (Around_button->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton18
;Ducati_logger_driver.c,3829 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton19
;Ducati_logger_driver.c,3830 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;Ducati_logger_driver.c,3832 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
;Ducati_logger_driver.c,3831 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #48
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;Ducati_logger_driver.c,3832 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Ducati_logger_driver.c,3831 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3833 :: 		}
IT	AL
BAL	L_DrawRoundButton20
L_DrawRoundButton19:
;Ducati_logger_driver.c,3836 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R5, R1
;Ducati_logger_driver.c,3835 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;Ducati_logger_driver.c,3836 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Ducati_logger_driver.c,3835 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3837 :: 		}
L_DrawRoundButton20:
;Ducati_logger_driver.c,3838 :: 		TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3841 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
ADDW	R1, R0, #46
LDRB	R1, [R1, #0]
UXTB	R6, R1
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #2
;Ducati_logger_driver.c,3840 :: 		Around_button->Left + Around_button->Width - 2,
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #2
;Ducati_logger_driver.c,3839 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ADDS	R2, R2, #1
ADDS	R1, R4, #1
;Ducati_logger_driver.c,3841 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
STR	R0, [SP, #4]
;Ducati_logger_driver.c,3839 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
UXTH	R0, R1
UXTH	R1, R2
;Ducati_logger_driver.c,3840 :: 		Around_button->Left + Around_button->Width - 2,
UXTH	R2, R3
;Ducati_logger_driver.c,3841 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
UXTH	R3, R5
PUSH	(R6)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3842 :: 		TFT_Set_Ext_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3843 :: 		TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3844 :: 		if (Around_button->TextAlign == _taLeft)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRoundButton21
;Ducati_logger_driver.c,3845 :: 		TFT_Write_Text(Around_button->Caption, Around_button->Left + 4, (Around_button->Top + ((Around_button->Height - caption_height) / 2)));
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R3, R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R2, R1, #4
ADDW	R1, R0, #24
; Around_button end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
IT	AL
BAL	L_DrawRoundButton22
L_DrawRoundButton21:
;Ducati_logger_driver.c,3846 :: 		else if (Around_button->TextAlign == _taCenter)
; Around_button start address is: 0 (R0)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton23
;Ducati_logger_driver.c,3847 :: 		TFT_Write_Text(Around_button->Caption, (Around_button->Left + (Around_button->Width - caption_length) / 2), (Around_button->Top + ((Around_button->Height - caption_height) / 2)));
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R4, R3, R1
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R2, R3, R1
ADDW	R1, R0, #24
; Around_button end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R4
BL	_TFT_Write_Text+0
IT	AL
BAL	L_DrawRoundButton24
L_DrawRoundButton23:
;Ducati_logger_driver.c,3848 :: 		else if (Around_button->TextAlign == _taRight)
; Around_button start address is: 0 (R0)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawRoundButton25
;Ducati_logger_driver.c,3849 :: 		TFT_Write_Text(Around_button->Caption, Around_button->Left + (Around_button->Width - caption_length - 4), (Around_button->Top + (Around_button->Height - caption_height) / 2));
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R4, R3, R1
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
UXTH	R1, R1
ADDS	R2, R3, R1
ADDW	R1, R0, #24
; Around_button end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R4
BL	_TFT_Write_Text+0
L_DrawRoundButton25:
L_DrawRoundButton24:
L_DrawRoundButton22:
;Ducati_logger_driver.c,3850 :: 		}
L_DrawRoundButton18:
;Ducati_logger_driver.c,3851 :: 		}
L_end_DrawRoundButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawRoundButton
_DrawLabel:
;Ducati_logger_driver.c,3853 :: 		void DrawLabel(TLabel *ALabel) {
; ALabel start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ALabel end address is: 0 (R0)
; ALabel start address is: 0 (R0)
;Ducati_logger_driver.c,3854 :: 		if (ALabel->Visible == 1) {
ADDW	R1, R0, #26
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawLabel26
;Ducati_logger_driver.c,3855 :: 		TFT_Set_Ext_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3856 :: 		TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #16
; ALabel end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;Ducati_logger_driver.c,3857 :: 		}
L_DrawLabel26:
;Ducati_logger_driver.c,3858 :: 		}
L_end_DrawLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawLabel
_DrawImage:
;Ducati_logger_driver.c,3860 :: 		void DrawImage(TImage *AImage) {
; AImage start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; AImage end address is: 0 (R0)
; AImage start address is: 0 (R0)
;Ducati_logger_driver.c,3861 :: 		if (AImage->Visible) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawImage27
;Ducati_logger_driver.c,3862 :: 		TFT_Ext_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
ADDW	R1, R0, #23
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
MOV	R3, R1
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDS	R1, R0, #6
; AImage end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
MOV	R2, R3
UXTB	R3, R4
BL	_TFT_Ext_Image+0
;Ducati_logger_driver.c,3863 :: 		}
L_DrawImage27:
;Ducati_logger_driver.c,3864 :: 		}
L_end_DrawImage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawImage
_DrawCImage:
;Ducati_logger_driver.c,3866 :: 		void DrawCImage(TCImage *AImage) {
; AImage start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; AImage end address is: 0 (R0)
; AImage start address is: 0 (R0)
;Ducati_logger_driver.c,3867 :: 		if (AImage->Visible) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawCImage28
;Ducati_logger_driver.c,3868 :: 		TFT_Ext_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
ADDW	R1, R0, #23
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
MOV	R3, R1
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDS	R1, R0, #6
; AImage end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
MOV	R2, R3
UXTB	R3, R4
BL	_TFT_Ext_Image+0
;Ducati_logger_driver.c,3869 :: 		}
L_DrawCImage28:
;Ducati_logger_driver.c,3870 :: 		}
L_end_DrawCImage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawCImage
_DrawCircle:
;Ducati_logger_driver.c,3872 :: 		void DrawCircle(TCircle *ACircle) {
; ACircle start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ACircle end address is: 0 (R0)
; ACircle start address is: 0 (R0)
;Ducati_logger_driver.c,3873 :: 		if (ACircle->Visible == 1) {
ADDW	R1, R0, #16
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircle29
;Ducati_logger_driver.c,3874 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircle30
;Ducati_logger_driver.c,3875 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;Ducati_logger_driver.c,3877 :: 		ACircle->Gradient_End_Color, ACircle->Gradient_Start_Color);
ADDW	R1, R0, #22
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R5, R1
;Ducati_logger_driver.c,3876 :: 		TFT_Set_Brush(ACircle->Transparent, ACircle->Press_Color, ACircle->Gradient, ACircle->Gradient_Orientation,
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #19
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #30
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;Ducati_logger_driver.c,3877 :: 		ACircle->Gradient_End_Color, ACircle->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Ducati_logger_driver.c,3876 :: 		TFT_Set_Brush(ACircle->Transparent, ACircle->Press_Color, ACircle->Gradient, ACircle->Gradient_Orientation,
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3878 :: 		}
IT	AL
BAL	L_DrawCircle31
L_DrawCircle30:
;Ducati_logger_driver.c,3881 :: 		ACircle->Gradient_Start_Color, ACircle->Gradient_End_Color);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #22
LDRH	R1, [R1, #0]
UXTH	R5, R1
;Ducati_logger_driver.c,3880 :: 		TFT_Set_Brush(ACircle->Transparent, ACircle->Color, ACircle->Gradient, ACircle->Gradient_Orientation,
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #19
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;Ducati_logger_driver.c,3881 :: 		ACircle->Gradient_Start_Color, ACircle->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Ducati_logger_driver.c,3880 :: 		TFT_Set_Brush(ACircle->Transparent, ACircle->Color, ACircle->Gradient, ACircle->Gradient_Orientation,
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3882 :: 		}
L_DrawCircle31:
;Ducati_logger_driver.c,3883 :: 		TFT_Set_Pen(ACircle->Pen_Color, ACircle->Pen_Width);
ADDW	R1, R0, #12
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #14
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3886 :: 		ACircle->Radius);
ADDW	R1, R0, #10
LDRH	R4, [R1, #0]
SXTH	R3, R4
;Ducati_logger_driver.c,3885 :: 		ACircle->Top + ACircle->Radius,
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R2, R1, R4
;Ducati_logger_driver.c,3884 :: 		TFT_Circle(ACircle->Left + ACircle->Radius,
ADDS	R1, R0, #6
; ACircle end address is: 0 (R0)
LDRH	R1, [R1, #0]
ADDS	R1, R1, R4
SXTH	R0, R1
;Ducati_logger_driver.c,3885 :: 		ACircle->Top + ACircle->Radius,
SXTH	R1, R2
;Ducati_logger_driver.c,3886 :: 		ACircle->Radius);
SXTH	R2, R3
BL	_TFT_Circle+0
;Ducati_logger_driver.c,3887 :: 		}
L_DrawCircle29:
;Ducati_logger_driver.c,3888 :: 		}
L_end_DrawCircle:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawCircle
_DrawCircleButton:
;Ducati_logger_driver.c,3890 :: 		void DrawCircleButton(TCircleButton *ACircle_button) {
; ACircle_button start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ACircle_button end address is: 0 (R0)
; ACircle_button start address is: 0 (R0)
;Ducati_logger_driver.c,3891 :: 		if (ACircle_button->Visible == 1) {
ADDW	R1, R0, #16
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircleButton32
;Ducati_logger_driver.c,3892 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircleButton33
;Ducati_logger_driver.c,3893 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;Ducati_logger_driver.c,3895 :: 		ACircle_button->Gradient_End_Color, ACircle_button->Gradient_Start_Color);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #38
LDRH	R1, [R1, #0]
UXTH	R5, R1
;Ducati_logger_driver.c,3894 :: 		TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Press_Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
ADDW	R1, R0, #35
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #34
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;Ducati_logger_driver.c,3895 :: 		ACircle_button->Gradient_End_Color, ACircle_button->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Ducati_logger_driver.c,3894 :: 		TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Press_Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3896 :: 		}
IT	AL
BAL	L_DrawCircleButton34
L_DrawCircleButton33:
;Ducati_logger_driver.c,3899 :: 		ACircle_button->Gradient_Start_Color, ACircle_button->Gradient_End_Color);
ADDW	R1, R0, #38
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R5, R1
;Ducati_logger_driver.c,3898 :: 		TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
ADDW	R1, R0, #35
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #34
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;Ducati_logger_driver.c,3899 :: 		ACircle_button->Gradient_Start_Color, ACircle_button->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Ducati_logger_driver.c,3898 :: 		TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3900 :: 		}
L_DrawCircleButton34:
;Ducati_logger_driver.c,3901 :: 		TFT_Set_Pen(ACircle_button->Pen_Color, ACircle_button->Pen_Width);
ADDW	R1, R0, #12
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #14
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3904 :: 		ACircle_button->Radius);
ADDW	R1, R0, #10
LDRH	R4, [R1, #0]
SXTH	R3, R4
;Ducati_logger_driver.c,3903 :: 		ACircle_button->Top + ACircle_button->Radius,
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R2, R1, R4
;Ducati_logger_driver.c,3902 :: 		TFT_Circle(ACircle_button->Left + ACircle_button->Radius,
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, R4
;Ducati_logger_driver.c,3904 :: 		ACircle_button->Radius);
STR	R0, [SP, #4]
;Ducati_logger_driver.c,3902 :: 		TFT_Circle(ACircle_button->Left + ACircle_button->Radius,
SXTH	R0, R1
;Ducati_logger_driver.c,3903 :: 		ACircle_button->Top + ACircle_button->Radius,
SXTH	R1, R2
;Ducati_logger_driver.c,3904 :: 		ACircle_button->Radius);
SXTH	R2, R3
BL	_TFT_Circle+0
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3905 :: 		TFT_Set_Ext_Font(ACircle_button->FontName, ACircle_button->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #28
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3906 :: 		TFT_Write_Text_Return_Pos(ACircle_button->Caption, ACircle_button->Left, ACircle_button->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3907 :: 		if (ACircle_button->TextAlign == _taLeft)
ADDW	R1, R0, #24
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawCircleButton35
;Ducati_logger_driver.c,3908 :: 		TFT_Write_Text(ACircle_button->Caption, ACircle_button->Left + 4, (ACircle_button->Top + ACircle_button->Radius - caption_height / 2));
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R2, R2, R1
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
LSRS	R1, R1, #1
UXTH	R1, R1
SUB	R3, R2, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R2, R1, #4
ADDW	R1, R0, #20
; ACircle_button end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
IT	AL
BAL	L_DrawCircleButton36
L_DrawCircleButton35:
;Ducati_logger_driver.c,3909 :: 		else if (ACircle_button->TextAlign == _taCenter)
; ACircle_button start address is: 0 (R0)
ADDW	R1, R0, #24
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircleButton37
;Ducati_logger_driver.c,3910 :: 		TFT_Write_Text(ACircle_button->Caption, (ACircle_button->Left + (ACircle_button->Radius*2 - caption_length) / 2), (ACircle_button->Top + ACircle_button->Radius - caption_height / 2));
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R5, [R1, #0]
ADDS	R2, R2, R5
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
LSRS	R1, R1, #1
UXTH	R1, R1
SUB	R4, R2, R1
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
LSLS	R2, R5, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R2, R3, R1
ADDW	R1, R0, #20
; ACircle_button end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R4
BL	_TFT_Write_Text+0
IT	AL
BAL	L_DrawCircleButton38
L_DrawCircleButton37:
;Ducati_logger_driver.c,3911 :: 		else if (ACircle_button->TextAlign == _taRight)
; ACircle_button start address is: 0 (R0)
ADDW	R1, R0, #24
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawCircleButton39
;Ducati_logger_driver.c,3912 :: 		TFT_Write_Text(ACircle_button->Caption, ACircle_button->Left + (ACircle_button->Radius*2 - caption_length - 4), (ACircle_button->Top + ACircle_button->Radius - caption_height / 2));
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R5, [R1, #0]
ADDS	R2, R2, R5
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
LSRS	R1, R1, #1
UXTH	R1, R1
SUB	R4, R2, R1
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
LSLS	R2, R5, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
UXTH	R1, R1
ADDS	R2, R3, R1
ADDW	R1, R0, #20
; ACircle_button end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R4
BL	_TFT_Write_Text+0
L_DrawCircleButton39:
L_DrawCircleButton38:
L_DrawCircleButton36:
;Ducati_logger_driver.c,3913 :: 		}
L_DrawCircleButton32:
;Ducati_logger_driver.c,3914 :: 		}
L_end_DrawCircleButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawCircleButton
_DrawBox:
;Ducati_logger_driver.c,3916 :: 		void DrawBox(TBox *ABox) {
; ABox start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ABox end address is: 0 (R0)
; ABox start address is: 0 (R0)
;Ducati_logger_driver.c,3917 :: 		if (ABox->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawBox40
;Ducati_logger_driver.c,3918 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawBox41
;Ducati_logger_driver.c,3919 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;Ducati_logger_driver.c,3920 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3921 :: 		}
IT	AL
BAL	L_DrawBox42
L_DrawBox41:
;Ducati_logger_driver.c,3923 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #28
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3924 :: 		}
L_DrawBox42:
;Ducati_logger_driver.c,3925 :: 		TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3926 :: 		TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
; ABox end address is: 0 (R0)
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #1
SXTH	R2, R2
SXTH	R1, R4
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
;Ducati_logger_driver.c,3927 :: 		}
L_DrawBox40:
;Ducati_logger_driver.c,3928 :: 		}
L_end_DrawBox:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawBox
_DrawCBox:
;Ducati_logger_driver.c,3930 :: 		void DrawCBox(TCBox *ABox) {
; ABox start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ABox end address is: 0 (R0)
; ABox start address is: 0 (R0)
;Ducati_logger_driver.c,3931 :: 		if (ABox->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCBox43
;Ducati_logger_driver.c,3932 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCBox44
;Ducati_logger_driver.c,3933 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;Ducati_logger_driver.c,3934 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3935 :: 		}
IT	AL
BAL	L_DrawCBox45
L_DrawCBox44:
;Ducati_logger_driver.c,3937 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #28
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3938 :: 		}
L_DrawCBox45:
;Ducati_logger_driver.c,3939 :: 		TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,3940 :: 		TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
; ABox end address is: 0 (R0)
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #1
SXTH	R2, R2
SXTH	R1, R4
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
;Ducati_logger_driver.c,3941 :: 		}
L_DrawCBox43:
;Ducati_logger_driver.c,3942 :: 		}
L_end_DrawCBox:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawCBox
_DrawLine:
;Ducati_logger_driver.c,3944 :: 		void DrawLine(TLine *Aline) {
; Aline start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R5, R0
; Aline end address is: 0 (R0)
; Aline start address is: 20 (R5)
;Ducati_logger_driver.c,3945 :: 		if (Aline->Visible == 1) {
ADDW	R1, R5, #15
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawLine46
;Ducati_logger_driver.c,3946 :: 		TFT_Set_Pen(Aline->Color, Aline->Pen_Width);
ADDW	R1, R5, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R5, #16
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
;Ducati_logger_driver.c,3947 :: 		TFT_Line(Aline->First_Point_X, Aline->First_Point_Y, Aline->Second_Point_X, Aline->Second_Point_Y);
ADDW	R1, R5, #12
LDRH	R1, [R1, #0]
SXTH	R4, R1
ADDW	R1, R5, #10
LDRH	R1, [R1, #0]
SXTH	R3, R1
ADDW	R1, R5, #8
LDRH	R1, [R1, #0]
SXTH	R2, R1
ADDS	R1, R5, #6
; Aline end address is: 20 (R5)
LDRH	R1, [R1, #0]
SXTH	R1, R1
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R4
BL	_TFT_Line+0
;Ducati_logger_driver.c,3948 :: 		}
L_DrawLine46:
;Ducati_logger_driver.c,3949 :: 		}
L_end_DrawLine:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawLine
_DrawScreen:
;Ducati_logger_driver.c,3951 :: 		void DrawScreen(TScreen *aScreen) {
; aScreen start address is: 0 (R0)
SUB	SP, SP, #120
STR	LR, [SP, #0]
; aScreen end address is: 0 (R0)
; aScreen start address is: 0 (R0)
;Ducati_logger_driver.c,3973 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;Ducati_logger_driver.c,3974 :: 		order = 0;
MOVS	R1, #0
STRH	R1, [SP, #4]
;Ducati_logger_driver.c,3975 :: 		round_button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #6]
;Ducati_logger_driver.c,3976 :: 		label_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #12]
;Ducati_logger_driver.c,3977 :: 		image_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #20]
;Ducati_logger_driver.c,3978 :: 		cimage_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #28]
;Ducati_logger_driver.c,3979 :: 		circle_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #36]
;Ducati_logger_driver.c,3980 :: 		circle_button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #44]
;Ducati_logger_driver.c,3981 :: 		box_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #52]
;Ducati_logger_driver.c,3982 :: 		cbox_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #60]
;Ducati_logger_driver.c,3983 :: 		line_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #68]
;Ducati_logger_driver.c,3984 :: 		CurrentScreen = aScreen;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
STR	R0, [R1, #0]
;Ducati_logger_driver.c,3986 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
ADDS	R1, R0, #2
; aScreen end address is: 0 (R0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen269
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen268
IT	AL
BAL	L_DrawScreen49
L__DrawScreen269:
L__DrawScreen268:
;Ducati_logger_driver.c,3987 :: 		save_bled = TFT_BLED;
MOVW	R2, #lo_addr(GPIOF_ODR+0)
MOVT	R2, #hi_addr(GPIOF_ODR+0)
STR	R2, [SP, #116]
LDR	R1, [R2, #0]
STRB	R1, [SP, #76]
;Ducati_logger_driver.c,3988 :: 		TFT_BLED           = 0;
MOVS	R1, #0
SXTB	R1, R1
STR	R1, [R2, #0]
;Ducati_logger_driver.c,3989 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
MOVW	R3, #lo_addr(_Write_Data+0)
MOVT	R3, #hi_addr(_Write_Data+0)
MOVW	R2, #lo_addr(_Write_Command+0)
MOVT	R2, #hi_addr(_Write_Command+0)
MOVW	R1, #lo_addr(_Set_Index+0)
MOVT	R1, #hi_addr(_Set_Index+0)
MOV	R0, R1
MOV	R1, R2
MOV	R2, R3
BL	_TFT_Set_Active+0
;Ducati_logger_driver.c,3990 :: 		TFT_Init_SSD1963(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
STR	R3, [SP, #112]
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_TFT_Init_SSD1963+0
;Ducati_logger_driver.c,3991 :: 		STMPE610_SetSize(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_STMPE610_SetSize+0
;Ducati_logger_driver.c,3992 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
MOVW	R1, #lo_addr(_TFT_Get_Data+0)
MOVT	R1, #hi_addr(_TFT_Get_Data+0)
MOV	R0, R1
BL	_TFT_Set_Ext_Buffer+0
;Ducati_logger_driver.c,3993 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
;Ducati_logger_driver.c,3994 :: 		display_width = CurrentScreen->Width;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
STRH	R2, [R1, #0]
;Ducati_logger_driver.c,3995 :: 		display_height = CurrentScreen->Height;
LDR	R1, [SP, #112]
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
STRH	R2, [R1, #0]
;Ducati_logger_driver.c,3996 :: 		TFT_BLED           = save_bled;
LDRB	R2, [SP, #76]
LDR	R1, [SP, #116]
STR	R2, [R1, #0]
;Ducati_logger_driver.c,3997 :: 		}
IT	AL
BAL	L_DrawScreen50
L_DrawScreen49:
;Ducati_logger_driver.c,3999 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
L_DrawScreen50:
;Ducati_logger_driver.c,4002 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen51:
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #6
LDRH	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen52
;Ducati_logger_driver.c,4003 :: 		if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #8
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #6]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen53
;Ducati_logger_driver.c,4004 :: 		local_round_button = GetRoundButton(round_button_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #12
LDR	R2, [R1, #0]
LDRB	R1, [SP, #6]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #8]
;Ducati_logger_driver.c,4005 :: 		if (order == local_round_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen54
;Ducati_logger_driver.c,4006 :: 		round_button_idx++;
LDRB	R1, [SP, #6]
ADDS	R1, R1, #1
STRB	R1, [SP, #6]
;Ducati_logger_driver.c,4007 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;Ducati_logger_driver.c,4008 :: 		DrawRoundButton(local_round_button);
LDR	R0, [SP, #8]
BL	_DrawRoundButton+0
;Ducati_logger_driver.c,4009 :: 		}
L_DrawScreen54:
;Ducati_logger_driver.c,4010 :: 		}
L_DrawScreen53:
;Ducati_logger_driver.c,4012 :: 		if (label_idx < CurrentScreen->LabelsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #16
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #12]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen55
;Ducati_logger_driver.c,4013 :: 		local_label = GetLabel(label_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #20
LDR	R2, [R1, #0]
LDRB	R1, [SP, #12]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #16]
;Ducati_logger_driver.c,4014 :: 		if (order == local_label->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen56
;Ducati_logger_driver.c,4015 :: 		label_idx++;
LDRB	R1, [SP, #12]
ADDS	R1, R1, #1
STRB	R1, [SP, #12]
;Ducati_logger_driver.c,4016 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;Ducati_logger_driver.c,4017 :: 		DrawLabel(local_label);
LDR	R0, [SP, #16]
BL	_DrawLabel+0
;Ducati_logger_driver.c,4018 :: 		}
L_DrawScreen56:
;Ducati_logger_driver.c,4019 :: 		}
L_DrawScreen55:
;Ducati_logger_driver.c,4021 :: 		if (circle_idx < CurrentScreen->CirclesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #40
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #36]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen57
;Ducati_logger_driver.c,4022 :: 		local_circle = GetCircle(circle_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #44
LDR	R2, [R1, #0]
LDRB	R1, [SP, #36]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #40]
;Ducati_logger_driver.c,4023 :: 		if (order == local_circle->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen58
;Ducati_logger_driver.c,4024 :: 		circle_idx++;
LDRB	R1, [SP, #36]
ADDS	R1, R1, #1
STRB	R1, [SP, #36]
;Ducati_logger_driver.c,4025 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;Ducati_logger_driver.c,4026 :: 		DrawCircle(local_circle);
LDR	R0, [SP, #40]
BL	_DrawCircle+0
;Ducati_logger_driver.c,4027 :: 		}
L_DrawScreen58:
;Ducati_logger_driver.c,4028 :: 		}
L_DrawScreen57:
;Ducati_logger_driver.c,4030 :: 		if (circle_button_idx < CurrentScreen->CircleButtonsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #48
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #44]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen59
;Ducati_logger_driver.c,4031 :: 		local_circle_button = GetCircleButton(circle_button_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #52
LDR	R2, [R1, #0]
LDRB	R1, [SP, #44]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #48]
;Ducati_logger_driver.c,4032 :: 		if (order == local_circle_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen60
;Ducati_logger_driver.c,4033 :: 		circle_button_idx++;
LDRB	R1, [SP, #44]
ADDS	R1, R1, #1
STRB	R1, [SP, #44]
;Ducati_logger_driver.c,4034 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;Ducati_logger_driver.c,4035 :: 		DrawCircleButton(local_circle_button);
LDR	R0, [SP, #48]
BL	_DrawCircleButton+0
;Ducati_logger_driver.c,4036 :: 		}
L_DrawScreen60:
;Ducati_logger_driver.c,4037 :: 		}
L_DrawScreen59:
;Ducati_logger_driver.c,4039 :: 		if (box_idx < CurrentScreen->BoxesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #56
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #52]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen61
;Ducati_logger_driver.c,4040 :: 		local_box = GetBox(box_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #60
LDR	R2, [R1, #0]
LDRB	R1, [SP, #52]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #56]
;Ducati_logger_driver.c,4041 :: 		if (order == local_box->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen62
;Ducati_logger_driver.c,4042 :: 		box_idx++;
LDRB	R1, [SP, #52]
ADDS	R1, R1, #1
STRB	R1, [SP, #52]
;Ducati_logger_driver.c,4043 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;Ducati_logger_driver.c,4044 :: 		DrawBox(local_box);
LDR	R0, [SP, #56]
BL	_DrawBox+0
;Ducati_logger_driver.c,4045 :: 		}
L_DrawScreen62:
;Ducati_logger_driver.c,4046 :: 		}
L_DrawScreen61:
;Ducati_logger_driver.c,4048 :: 		if (cbox_idx < CurrentScreen->CBoxesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #64
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #60]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen63
;Ducati_logger_driver.c,4049 :: 		local_cbox = GetCBox(cbox_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #68
LDR	R2, [R1, #0]
LDRB	R1, [SP, #60]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #64]
;Ducati_logger_driver.c,4050 :: 		if (order == local_cbox->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen64
;Ducati_logger_driver.c,4051 :: 		cbox_idx++;
LDRB	R1, [SP, #60]
ADDS	R1, R1, #1
STRB	R1, [SP, #60]
;Ducati_logger_driver.c,4052 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;Ducati_logger_driver.c,4053 :: 		DrawCBox(local_cbox);
LDR	R0, [SP, #64]
BL	_DrawCBox+0
;Ducati_logger_driver.c,4054 :: 		}
L_DrawScreen64:
;Ducati_logger_driver.c,4055 :: 		}
L_DrawScreen63:
;Ducati_logger_driver.c,4057 :: 		if (line_idx < CurrentScreen->LinesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #72
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #68]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen65
;Ducati_logger_driver.c,4058 :: 		local_line = GetLine(line_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #76
LDR	R2, [R1, #0]
LDRB	R1, [SP, #68]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #72]
;Ducati_logger_driver.c,4059 :: 		if (order == local_line->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen66
;Ducati_logger_driver.c,4060 :: 		line_idx++;
LDRB	R1, [SP, #68]
ADDS	R1, R1, #1
STRB	R1, [SP, #68]
;Ducati_logger_driver.c,4061 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;Ducati_logger_driver.c,4062 :: 		DrawLine(local_line);
LDR	R0, [SP, #72]
BL	_DrawLine+0
;Ducati_logger_driver.c,4063 :: 		}
L_DrawScreen66:
;Ducati_logger_driver.c,4064 :: 		}
L_DrawScreen65:
;Ducati_logger_driver.c,4066 :: 		if (image_idx < CurrentScreen->ImagesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #24
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #20]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen67
;Ducati_logger_driver.c,4067 :: 		local_image = GetImage(image_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #28
LDR	R2, [R1, #0]
LDRB	R1, [SP, #20]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #24]
;Ducati_logger_driver.c,4068 :: 		if (order == local_image->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen68
;Ducati_logger_driver.c,4069 :: 		image_idx++;
LDRB	R1, [SP, #20]
ADDS	R1, R1, #1
STRB	R1, [SP, #20]
;Ducati_logger_driver.c,4070 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;Ducati_logger_driver.c,4071 :: 		DrawImage(local_image);
LDR	R0, [SP, #24]
BL	_DrawImage+0
;Ducati_logger_driver.c,4072 :: 		}
L_DrawScreen68:
;Ducati_logger_driver.c,4073 :: 		}
L_DrawScreen67:
;Ducati_logger_driver.c,4075 :: 		if (cimage_idx < CurrentScreen->CImagesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #32
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #28]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen69
;Ducati_logger_driver.c,4076 :: 		local_cimage = GetCImage(cimage_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #36
LDR	R2, [R1, #0]
LDRB	R1, [SP, #28]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #32]
;Ducati_logger_driver.c,4077 :: 		if (order == local_cimage->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen70
;Ducati_logger_driver.c,4078 :: 		cimage_idx++;
LDRB	R1, [SP, #28]
ADDS	R1, R1, #1
STRB	R1, [SP, #28]
;Ducati_logger_driver.c,4079 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;Ducati_logger_driver.c,4080 :: 		DrawCImage(local_cimage);
LDR	R0, [SP, #32]
BL	_DrawCImage+0
;Ducati_logger_driver.c,4081 :: 		}
L_DrawScreen70:
;Ducati_logger_driver.c,4082 :: 		}
L_DrawScreen69:
;Ducati_logger_driver.c,4084 :: 		}
IT	AL
BAL	L_DrawScreen51
L_DrawScreen52:
;Ducati_logger_driver.c,4085 :: 		}
L_end_DrawScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #120
BX	LR
; end of _DrawScreen
_Get_Object:
;Ducati_logger_driver.c,4087 :: 		void Get_Object(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;Ducati_logger_driver.c,4088 :: 		round_button_order  = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4089 :: 		label_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4090 :: 		image_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4091 :: 		cimage_order        = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_cimage_order+0)
MOVT	R2, #hi_addr(_cimage_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4092 :: 		circle_order        = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4093 :: 		circle_button_order = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4094 :: 		box_order           = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4095 :: 		cbox_order          = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_cbox_order+0)
MOVT	R2, #hi_addr(_cbox_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4097 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 0 (R0)
; Y end address is: 4 (R1)
UXTH	R8, R0
UXTH	R7, R1
L_Get_Object71:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object72
;Ducati_logger_driver.c,4098 :: 		local_round_button = GetRoundButton(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #12
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_round_button+0)
MOVT	R2, #hi_addr(_local_round_button+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4099 :: 		if (local_round_button->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object74
;Ducati_logger_driver.c,4101 :: 		local_round_button->Width, local_round_button->Height) == 1) {
MOVW	R6, #lo_addr(_local_round_button+0)
MOVT	R6, #hi_addr(_local_round_button+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;Ducati_logger_driver.c,4100 :: 		if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;Ducati_logger_driver.c,4101 :: 		local_round_button->Width, local_round_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	Ducati_logger_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object75
;Ducati_logger_driver.c,4102 :: 		round_button_order = local_round_button->Order;
MOVW	R4, #lo_addr(_local_round_button+0)
MOVT	R4, #hi_addr(_local_round_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4103 :: 		exec_round_button = local_round_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4104 :: 		}
L_Get_Object75:
;Ducati_logger_driver.c,4105 :: 		}
L_Get_Object74:
;Ducati_logger_driver.c,4097 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;Ducati_logger_driver.c,4106 :: 		}
IT	AL
BAL	L_Get_Object71
L_Get_Object72:
;Ducati_logger_driver.c,4109 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object76:
; X start address is: 28 (R7)
; Y start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #16
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object77
;Ducati_logger_driver.c,4110 :: 		local_label = GetLabel(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #20
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_label+0)
MOVT	R2, #hi_addr(_local_label+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4111 :: 		if (local_label->Active == 1) {
ADDW	R2, R3, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object79
;Ducati_logger_driver.c,4113 :: 		local_label->Width, local_label->Height) == 1) {
MOVW	R6, #lo_addr(_local_label+0)
MOVT	R6, #hi_addr(_local_label+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;Ducati_logger_driver.c,4112 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;Ducati_logger_driver.c,4113 :: 		local_label->Width, local_label->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	Ducati_logger_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object80
;Ducati_logger_driver.c,4114 :: 		label_order = local_label->Order;
MOVW	R4, #lo_addr(_local_label+0)
MOVT	R4, #hi_addr(_local_label+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4115 :: 		exec_label = local_label;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4116 :: 		}
L_Get_Object80:
;Ducati_logger_driver.c,4117 :: 		}
L_Get_Object79:
;Ducati_logger_driver.c,4109 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;Ducati_logger_driver.c,4118 :: 		}
IT	AL
BAL	L_Get_Object76
L_Get_Object77:
;Ducati_logger_driver.c,4121 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object81:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #24
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object82
;Ducati_logger_driver.c,4122 :: 		local_image = GetImage(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_image+0)
MOVT	R2, #hi_addr(_local_image+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4123 :: 		if (local_image->Active == 1) {
ADDW	R2, R3, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object84
;Ducati_logger_driver.c,4125 :: 		local_image->Width, local_image->Height) == 1) {
MOVW	R6, #lo_addr(_local_image+0)
MOVT	R6, #hi_addr(_local_image+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;Ducati_logger_driver.c,4124 :: 		if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;Ducati_logger_driver.c,4125 :: 		local_image->Width, local_image->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	Ducati_logger_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object85
;Ducati_logger_driver.c,4126 :: 		image_order = local_image->Order;
MOVW	R4, #lo_addr(_local_image+0)
MOVT	R4, #hi_addr(_local_image+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4127 :: 		exec_image = local_image;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4128 :: 		}
L_Get_Object85:
;Ducati_logger_driver.c,4129 :: 		}
L_Get_Object84:
;Ducati_logger_driver.c,4121 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;Ducati_logger_driver.c,4130 :: 		}
IT	AL
BAL	L_Get_Object81
L_Get_Object82:
;Ducati_logger_driver.c,4133 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CImagesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object86:
; X start address is: 28 (R7)
; Y start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #32
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object87
;Ducati_logger_driver.c,4134 :: 		local_cimage = GetCImage(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #36
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_cimage+0)
MOVT	R2, #hi_addr(_local_cimage+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4135 :: 		if (local_cimage->Active == 1) {
ADDW	R2, R3, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object89
;Ducati_logger_driver.c,4137 :: 		local_cimage->Width, local_cimage->Height) == 1) {
MOVW	R6, #lo_addr(_local_cimage+0)
MOVT	R6, #hi_addr(_local_cimage+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;Ducati_logger_driver.c,4136 :: 		if (IsInsideObject(X, Y, local_cimage->Left, local_cimage->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;Ducati_logger_driver.c,4137 :: 		local_cimage->Width, local_cimage->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	Ducati_logger_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object90
;Ducati_logger_driver.c,4138 :: 		cimage_order = local_cimage->Order;
MOVW	R4, #lo_addr(_local_cimage+0)
MOVT	R4, #hi_addr(_local_cimage+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_cimage_order+0)
MOVT	R2, #hi_addr(_cimage_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4139 :: 		exec_cimage = local_cimage;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_cimage+0)
MOVT	R2, #hi_addr(_exec_cimage+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4140 :: 		}
L_Get_Object90:
;Ducati_logger_driver.c,4141 :: 		}
L_Get_Object89:
;Ducati_logger_driver.c,4133 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CImagesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;Ducati_logger_driver.c,4142 :: 		}
IT	AL
BAL	L_Get_Object86
L_Get_Object87:
;Ducati_logger_driver.c,4145 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CirclesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object91:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #40
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object92
;Ducati_logger_driver.c,4146 :: 		local_circle = GetCircle(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #44
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_circle+0)
MOVT	R2, #hi_addr(_local_circle+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4147 :: 		if (local_circle->Active == 1) {
ADDW	R2, R3, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object94
;Ducati_logger_driver.c,4149 :: 		(local_circle->Radius * 2), (local_circle->Radius * 2)) == 1) {
MOVW	R5, #lo_addr(_local_circle+0)
MOVT	R5, #hi_addr(_local_circle+0)
LDR	R2, [R5, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
LSLS	R4, R2, #1
UXTH	R4, R4
;Ducati_logger_driver.c,4148 :: 		if (IsInsideObject(X, Y, local_circle->Left, local_circle->Top,
MOV	R2, R5
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R5
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;Ducati_logger_driver.c,4149 :: 		(local_circle->Radius * 2), (local_circle->Radius * 2)) == 1) {
PUSH	(R4)
PUSH	(R4)
BL	Ducati_logger_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object95
;Ducati_logger_driver.c,4150 :: 		circle_order = local_circle->Order;
MOVW	R4, #lo_addr(_local_circle+0)
MOVT	R4, #hi_addr(_local_circle+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4151 :: 		exec_circle = local_circle;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4152 :: 		}
L_Get_Object95:
;Ducati_logger_driver.c,4153 :: 		}
L_Get_Object94:
;Ducati_logger_driver.c,4145 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CirclesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;Ducati_logger_driver.c,4154 :: 		}
IT	AL
BAL	L_Get_Object91
L_Get_Object92:
;Ducati_logger_driver.c,4157 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CircleButtonsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
L_Get_Object96:
; X start address is: 32 (R8)
; Y start address is: 28 (R7)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object97
;Ducati_logger_driver.c,4158 :: 		local_circle_button = GetCircleButton(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #52
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_circle_button+0)
MOVT	R2, #hi_addr(_local_circle_button+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4159 :: 		if (local_circle_button->Active == 1) {
ADDW	R2, R3, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object99
;Ducati_logger_driver.c,4161 :: 		(local_circle_button->Radius * 2), (local_circle_button->Radius * 2)) == 1) {
MOVW	R5, #lo_addr(_local_circle_button+0)
MOVT	R5, #hi_addr(_local_circle_button+0)
LDR	R2, [R5, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
LSLS	R4, R2, #1
UXTH	R4, R4
;Ducati_logger_driver.c,4160 :: 		if (IsInsideObject(X, Y, local_circle_button->Left, local_circle_button->Top,
MOV	R2, R5
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R5
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;Ducati_logger_driver.c,4161 :: 		(local_circle_button->Radius * 2), (local_circle_button->Radius * 2)) == 1) {
PUSH	(R4)
PUSH	(R4)
BL	Ducati_logger_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object100
;Ducati_logger_driver.c,4162 :: 		circle_button_order = local_circle_button->Order;
MOVW	R4, #lo_addr(_local_circle_button+0)
MOVT	R4, #hi_addr(_local_circle_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4163 :: 		exec_circle_button = local_circle_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4164 :: 		}
L_Get_Object100:
;Ducati_logger_driver.c,4165 :: 		}
L_Get_Object99:
;Ducati_logger_driver.c,4157 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CircleButtonsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;Ducati_logger_driver.c,4166 :: 		}
IT	AL
BAL	L_Get_Object96
L_Get_Object97:
;Ducati_logger_driver.c,4169 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
L_Get_Object101:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #56
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object102
;Ducati_logger_driver.c,4170 :: 		local_box = GetBox(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #60
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_box+0)
MOVT	R2, #hi_addr(_local_box+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4171 :: 		if (local_box->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object104
;Ducati_logger_driver.c,4173 :: 		local_box->Width, local_box->Height) == 1) {
MOVW	R6, #lo_addr(_local_box+0)
MOVT	R6, #hi_addr(_local_box+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;Ducati_logger_driver.c,4172 :: 		if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;Ducati_logger_driver.c,4173 :: 		local_box->Width, local_box->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	Ducati_logger_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object105
;Ducati_logger_driver.c,4174 :: 		box_order = local_box->Order;
MOVW	R4, #lo_addr(_local_box+0)
MOVT	R4, #hi_addr(_local_box+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4175 :: 		exec_box = local_box;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4176 :: 		}
L_Get_Object105:
;Ducati_logger_driver.c,4177 :: 		}
L_Get_Object104:
;Ducati_logger_driver.c,4169 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;Ducati_logger_driver.c,4178 :: 		}
IT	AL
BAL	L_Get_Object101
L_Get_Object102:
;Ducati_logger_driver.c,4181 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CBoxesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object106:
; Y start address is: 32 (R8)
; X start address is: 28 (R7)
; X start address is: 28 (R7)
; X end address is: 28 (R7)
; Y start address is: 32 (R8)
; Y end address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #64
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object107
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
;Ducati_logger_driver.c,4182 :: 		local_cbox = GetCBox(_object_count);
; Y start address is: 32 (R8)
; X start address is: 28 (R7)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #68
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_cbox+0)
MOVT	R2, #hi_addr(_local_cbox+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4183 :: 		if (local_cbox->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object109
;Ducati_logger_driver.c,4185 :: 		local_cbox->Width, local_cbox->Height) == 1) {
MOVW	R6, #lo_addr(_local_cbox+0)
MOVT	R6, #hi_addr(_local_cbox+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;Ducati_logger_driver.c,4184 :: 		if (IsInsideObject(X, Y, local_cbox->Left, local_cbox->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;Ducati_logger_driver.c,4185 :: 		local_cbox->Width, local_cbox->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	Ducati_logger_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object110
;Ducati_logger_driver.c,4186 :: 		cbox_order = local_cbox->Order;
MOVW	R4, #lo_addr(_local_cbox+0)
MOVT	R4, #hi_addr(_local_cbox+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_cbox_order+0)
MOVT	R2, #hi_addr(_cbox_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4187 :: 		exec_cbox = local_cbox;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4188 :: 		}
L_Get_Object110:
;Ducati_logger_driver.c,4189 :: 		}
L_Get_Object109:
;Ducati_logger_driver.c,4181 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CBoxesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;Ducati_logger_driver.c,4190 :: 		}
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
IT	AL
BAL	L_Get_Object106
L_Get_Object107:
;Ducati_logger_driver.c,4192 :: 		_object_count = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4193 :: 		if (round_button_order >  _object_count )
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	LE
BLE	L_Get_Object111
;Ducati_logger_driver.c,4194 :: 		_object_count = round_button_order;
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object111:
;Ducati_logger_driver.c,4195 :: 		if (label_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object112
;Ducati_logger_driver.c,4196 :: 		_object_count = label_order;
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object112:
;Ducati_logger_driver.c,4197 :: 		if (image_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object113
;Ducati_logger_driver.c,4198 :: 		_object_count = image_order;
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object113:
;Ducati_logger_driver.c,4199 :: 		if (cimage_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_cimage_order+0)
MOVT	R2, #hi_addr(_cimage_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object114
;Ducati_logger_driver.c,4200 :: 		_object_count = cimage_order;
MOVW	R2, #lo_addr(_cimage_order+0)
MOVT	R2, #hi_addr(_cimage_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object114:
;Ducati_logger_driver.c,4201 :: 		if (circle_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object115
;Ducati_logger_driver.c,4202 :: 		_object_count = circle_order;
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object115:
;Ducati_logger_driver.c,4203 :: 		if (circle_button_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object116
;Ducati_logger_driver.c,4204 :: 		_object_count = circle_button_order;
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object116:
;Ducati_logger_driver.c,4205 :: 		if (box_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object117
;Ducati_logger_driver.c,4206 :: 		_object_count = box_order;
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object117:
;Ducati_logger_driver.c,4207 :: 		if (cbox_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_cbox_order+0)
MOVT	R2, #hi_addr(_cbox_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object118
;Ducati_logger_driver.c,4208 :: 		_object_count = cbox_order;
MOVW	R2, #lo_addr(_cbox_order+0)
MOVT	R2, #hi_addr(_cbox_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object118:
;Ducati_logger_driver.c,4209 :: 		}
L_end_Get_Object:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Get_Object
_Process_TP_Press:
;Ducati_logger_driver.c,4212 :: 		void Process_TP_Press(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;Ducati_logger_driver.c,4213 :: 		exec_round_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4214 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4215 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4216 :: 		exec_cimage         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_cimage+0)
MOVT	R2, #hi_addr(_exec_cimage+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4217 :: 		exec_circle         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4218 :: 		exec_circle_button  = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4219 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4220 :: 		exec_cbox           = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4222 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;Ducati_logger_driver.c,4224 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Press119
;Ducati_logger_driver.c,4225 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press120
;Ducati_logger_driver.c,4226 :: 		if (exec_round_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press121
;Ducati_logger_driver.c,4227 :: 		if (exec_round_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press122
;Ducati_logger_driver.c,4228 :: 		exec_round_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4229 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;Ducati_logger_driver.c,4230 :: 		}
L_Process_TP_Press122:
;Ducati_logger_driver.c,4231 :: 		}
L_Process_TP_Press121:
;Ducati_logger_driver.c,4232 :: 		}
L_Process_TP_Press120:
;Ducati_logger_driver.c,4234 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press123
;Ducati_logger_driver.c,4235 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press124
;Ducati_logger_driver.c,4236 :: 		if (exec_label->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press125
;Ducati_logger_driver.c,4237 :: 		exec_label->OnPressPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4238 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;Ducati_logger_driver.c,4239 :: 		}
L_Process_TP_Press125:
;Ducati_logger_driver.c,4240 :: 		}
L_Process_TP_Press124:
;Ducati_logger_driver.c,4241 :: 		}
L_Process_TP_Press123:
;Ducati_logger_driver.c,4243 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press126
;Ducati_logger_driver.c,4244 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press127
;Ducati_logger_driver.c,4245 :: 		if (exec_image->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press128
;Ducati_logger_driver.c,4246 :: 		exec_image->OnPressPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4247 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;Ducati_logger_driver.c,4248 :: 		}
L_Process_TP_Press128:
;Ducati_logger_driver.c,4249 :: 		}
L_Process_TP_Press127:
;Ducati_logger_driver.c,4250 :: 		}
L_Process_TP_Press126:
;Ducati_logger_driver.c,4252 :: 		if (_object_count == cimage_order) {
MOVW	R2, #lo_addr(_cimage_order+0)
MOVT	R2, #hi_addr(_cimage_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press129
;Ducati_logger_driver.c,4253 :: 		if (exec_cimage->Active == 1) {
MOVW	R2, #lo_addr(_exec_cimage+0)
MOVT	R2, #hi_addr(_exec_cimage+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press130
;Ducati_logger_driver.c,4254 :: 		if (exec_cimage->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_cimage+0)
MOVT	R4, #hi_addr(_exec_cimage+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press131
;Ducati_logger_driver.c,4255 :: 		exec_cimage->OnPressPtr();
MOVW	R4, #lo_addr(_exec_cimage+0)
MOVT	R4, #hi_addr(_exec_cimage+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4256 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;Ducati_logger_driver.c,4257 :: 		}
L_Process_TP_Press131:
;Ducati_logger_driver.c,4258 :: 		}
L_Process_TP_Press130:
;Ducati_logger_driver.c,4259 :: 		}
L_Process_TP_Press129:
;Ducati_logger_driver.c,4261 :: 		if (_object_count == circle_order) {
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press132
;Ducati_logger_driver.c,4262 :: 		if (exec_circle->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press133
;Ducati_logger_driver.c,4263 :: 		if (exec_circle->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press134
;Ducati_logger_driver.c,4264 :: 		exec_circle->OnPressPtr();
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4265 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;Ducati_logger_driver.c,4266 :: 		}
L_Process_TP_Press134:
;Ducati_logger_driver.c,4267 :: 		}
L_Process_TP_Press133:
;Ducati_logger_driver.c,4268 :: 		}
L_Process_TP_Press132:
;Ducati_logger_driver.c,4270 :: 		if (_object_count == circle_button_order) {
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press135
;Ducati_logger_driver.c,4271 :: 		if (exec_circle_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press136
;Ducati_logger_driver.c,4272 :: 		if (exec_circle_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press137
;Ducati_logger_driver.c,4273 :: 		exec_circle_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4274 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;Ducati_logger_driver.c,4275 :: 		}
L_Process_TP_Press137:
;Ducati_logger_driver.c,4276 :: 		}
L_Process_TP_Press136:
;Ducati_logger_driver.c,4277 :: 		}
L_Process_TP_Press135:
;Ducati_logger_driver.c,4279 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press138
;Ducati_logger_driver.c,4280 :: 		if (exec_box->Active == 1) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press139
;Ducati_logger_driver.c,4281 :: 		if (exec_box->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press140
;Ducati_logger_driver.c,4282 :: 		exec_box->OnPressPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4283 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;Ducati_logger_driver.c,4284 :: 		}
L_Process_TP_Press140:
;Ducati_logger_driver.c,4285 :: 		}
L_Process_TP_Press139:
;Ducati_logger_driver.c,4286 :: 		}
L_Process_TP_Press138:
;Ducati_logger_driver.c,4288 :: 		if (_object_count == cbox_order) {
MOVW	R2, #lo_addr(_cbox_order+0)
MOVT	R2, #hi_addr(_cbox_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press141
;Ducati_logger_driver.c,4289 :: 		if (exec_cbox->Active == 1) {
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press142
;Ducati_logger_driver.c,4290 :: 		if (exec_cbox->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_cbox+0)
MOVT	R4, #hi_addr(_exec_cbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press143
;Ducati_logger_driver.c,4291 :: 		exec_cbox->OnPressPtr();
MOVW	R4, #lo_addr(_exec_cbox+0)
MOVT	R4, #hi_addr(_exec_cbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4292 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;Ducati_logger_driver.c,4293 :: 		}
L_Process_TP_Press143:
;Ducati_logger_driver.c,4294 :: 		}
L_Process_TP_Press142:
;Ducati_logger_driver.c,4295 :: 		}
L_Process_TP_Press141:
;Ducati_logger_driver.c,4297 :: 		}
L_Process_TP_Press119:
;Ducati_logger_driver.c,4298 :: 		}
L_end_Process_TP_Press:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Press
_Process_TP_Up:
;Ducati_logger_driver.c,4300 :: 		void Process_TP_Up(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;Ducati_logger_driver.c,4302 :: 		switch (PressedObjectType) {
IT	AL
BAL	L_Process_TP_Up144
;Ducati_logger_driver.c,4304 :: 		case 1: {
L_Process_TP_Up146:
;Ducati_logger_driver.c,4305 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up147
;Ducati_logger_driver.c,4306 :: 		exec_round_button = (TButton_Round*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4307 :: 		if ((exec_round_button->PressColEnabled == 1) && (exec_round_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #47
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L__Process_TP_Up276
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up275
L__Process_TP_Up274:
;Ducati_logger_driver.c,4308 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawRoundButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;Ducati_logger_driver.c,4307 :: 		if ((exec_round_button->PressColEnabled == 1) && (exec_round_button->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up276:
L__Process_TP_Up275:
;Ducati_logger_driver.c,4310 :: 		break;
IT	AL
BAL	L_Process_TP_Up145
;Ducati_logger_driver.c,4311 :: 		}
L_Process_TP_Up147:
;Ducati_logger_driver.c,4312 :: 		break;
IT	AL
BAL	L_Process_TP_Up145
;Ducati_logger_driver.c,4315 :: 		case 4: {
L_Process_TP_Up151:
;Ducati_logger_driver.c,4316 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up152
;Ducati_logger_driver.c,4317 :: 		exec_circle = (TCircle*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4318 :: 		if ((exec_circle->PressColEnabled == 1) && (exec_circle->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L__Process_TP_Up278
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up277
L__Process_TP_Up273:
;Ducati_logger_driver.c,4319 :: 		DrawCircle(exec_circle);
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawCircle+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;Ducati_logger_driver.c,4318 :: 		if ((exec_circle->PressColEnabled == 1) && (exec_circle->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up278:
L__Process_TP_Up277:
;Ducati_logger_driver.c,4321 :: 		break;
IT	AL
BAL	L_Process_TP_Up145
;Ducati_logger_driver.c,4322 :: 		}
L_Process_TP_Up152:
;Ducati_logger_driver.c,4323 :: 		break;
IT	AL
BAL	L_Process_TP_Up145
;Ducati_logger_driver.c,4326 :: 		case 5: {
L_Process_TP_Up156:
;Ducati_logger_driver.c,4327 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up157
;Ducati_logger_driver.c,4328 :: 		exec_circle_button = (TCircleButton*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4329 :: 		if ((exec_circle_button->PressColEnabled == 1) && (exec_circle_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #42
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L__Process_TP_Up280
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up279
L__Process_TP_Up272:
;Ducati_logger_driver.c,4330 :: 		DrawCircleButton(exec_circle_button);
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawCircleButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;Ducati_logger_driver.c,4329 :: 		if ((exec_circle_button->PressColEnabled == 1) && (exec_circle_button->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up280:
L__Process_TP_Up279:
;Ducati_logger_driver.c,4332 :: 		break;
IT	AL
BAL	L_Process_TP_Up145
;Ducati_logger_driver.c,4333 :: 		}
L_Process_TP_Up157:
;Ducati_logger_driver.c,4334 :: 		break;
IT	AL
BAL	L_Process_TP_Up145
;Ducati_logger_driver.c,4337 :: 		case 6: {
L_Process_TP_Up161:
;Ducati_logger_driver.c,4338 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up162
;Ducati_logger_driver.c,4339 :: 		exec_box = (TBox*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4340 :: 		if ((exec_box->PressColEnabled == 1) && (exec_box->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L__Process_TP_Up282
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up281
L__Process_TP_Up271:
;Ducati_logger_driver.c,4341 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawBox+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;Ducati_logger_driver.c,4340 :: 		if ((exec_box->PressColEnabled == 1) && (exec_box->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up282:
L__Process_TP_Up281:
;Ducati_logger_driver.c,4343 :: 		break;
IT	AL
BAL	L_Process_TP_Up145
;Ducati_logger_driver.c,4344 :: 		}
L_Process_TP_Up162:
;Ducati_logger_driver.c,4345 :: 		break;
IT	AL
BAL	L_Process_TP_Up145
;Ducati_logger_driver.c,4348 :: 		case 14: {
L_Process_TP_Up166:
;Ducati_logger_driver.c,4349 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up167
;Ducati_logger_driver.c,4350 :: 		exec_cbox = (TCBox*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4351 :: 		if ((exec_cbox->PressColEnabled == 1) && (exec_cbox->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L__Process_TP_Up284
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up283
L__Process_TP_Up270:
;Ducati_logger_driver.c,4352 :: 		DrawCBox(exec_cbox);
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawCBox+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;Ducati_logger_driver.c,4351 :: 		if ((exec_cbox->PressColEnabled == 1) && (exec_cbox->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up284:
L__Process_TP_Up283:
;Ducati_logger_driver.c,4354 :: 		break;
IT	AL
BAL	L_Process_TP_Up145
;Ducati_logger_driver.c,4355 :: 		}
L_Process_TP_Up167:
;Ducati_logger_driver.c,4356 :: 		break;
IT	AL
BAL	L_Process_TP_Up145
;Ducati_logger_driver.c,4358 :: 		}
L_Process_TP_Up144:
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #1
IT	EQ
BEQ	L_Process_TP_Up146
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #4
IT	EQ
BEQ	L_Process_TP_Up151
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #5
IT	EQ
BEQ	L_Process_TP_Up156
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #6
IT	EQ
BEQ	L_Process_TP_Up161
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #14
IT	EQ
BEQ	L_Process_TP_Up166
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
L_Process_TP_Up145:
;Ducati_logger_driver.c,4360 :: 		exec_label          = 0;
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4361 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4362 :: 		exec_cimage          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_cimage+0)
MOVT	R2, #hi_addr(_exec_cimage+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4364 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;Ducati_logger_driver.c,4367 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Up171
;Ducati_logger_driver.c,4369 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up172
;Ducati_logger_driver.c,4370 :: 		if (exec_round_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up173
;Ducati_logger_driver.c,4371 :: 		if (exec_round_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up174
;Ducati_logger_driver.c,4372 :: 		exec_round_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up174:
;Ducati_logger_driver.c,4373 :: 		if (PressedObject == (TPointer)exec_round_button)
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up175
;Ducati_logger_driver.c,4374 :: 		if (exec_round_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up176
;Ducati_logger_driver.c,4375 :: 		exec_round_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up176:
L_Process_TP_Up175:
;Ducati_logger_driver.c,4376 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4377 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4378 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;Ducati_logger_driver.c,4379 :: 		}
L_Process_TP_Up173:
;Ducati_logger_driver.c,4380 :: 		}
L_Process_TP_Up172:
;Ducati_logger_driver.c,4383 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up177
;Ducati_logger_driver.c,4384 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up178
;Ducati_logger_driver.c,4385 :: 		if (exec_label->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up179
;Ducati_logger_driver.c,4386 :: 		exec_label->OnUpPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up179:
;Ducati_logger_driver.c,4387 :: 		if (PressedObject == (TPointer)exec_label)
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up180
;Ducati_logger_driver.c,4388 :: 		if (exec_label->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up181
;Ducati_logger_driver.c,4389 :: 		exec_label->OnClickPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up181:
L_Process_TP_Up180:
;Ducati_logger_driver.c,4390 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4391 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4392 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;Ducati_logger_driver.c,4393 :: 		}
L_Process_TP_Up178:
;Ducati_logger_driver.c,4394 :: 		}
L_Process_TP_Up177:
;Ducati_logger_driver.c,4397 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up182
;Ducati_logger_driver.c,4398 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up183
;Ducati_logger_driver.c,4399 :: 		if (exec_image->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up184
;Ducati_logger_driver.c,4400 :: 		exec_image->OnUpPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up184:
;Ducati_logger_driver.c,4401 :: 		if (PressedObject == (TPointer)exec_image)
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up185
;Ducati_logger_driver.c,4402 :: 		if (exec_image->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up186
;Ducati_logger_driver.c,4403 :: 		exec_image->OnClickPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up186:
L_Process_TP_Up185:
;Ducati_logger_driver.c,4404 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4405 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4406 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;Ducati_logger_driver.c,4407 :: 		}
L_Process_TP_Up183:
;Ducati_logger_driver.c,4408 :: 		}
L_Process_TP_Up182:
;Ducati_logger_driver.c,4411 :: 		if (_object_count == cimage_order) {
MOVW	R2, #lo_addr(_cimage_order+0)
MOVT	R2, #hi_addr(_cimage_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up187
;Ducati_logger_driver.c,4412 :: 		if (exec_cimage->Active == 1) {
MOVW	R2, #lo_addr(_exec_cimage+0)
MOVT	R2, #hi_addr(_exec_cimage+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up188
;Ducati_logger_driver.c,4413 :: 		if (exec_cimage->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_cimage+0)
MOVT	R4, #hi_addr(_exec_cimage+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up189
;Ducati_logger_driver.c,4414 :: 		exec_cimage->OnUpPtr();
MOVW	R4, #lo_addr(_exec_cimage+0)
MOVT	R4, #hi_addr(_exec_cimage+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up189:
;Ducati_logger_driver.c,4415 :: 		if (PressedObject == (TPointer)exec_cimage)
MOVW	R2, #lo_addr(_exec_cimage+0)
MOVT	R2, #hi_addr(_exec_cimage+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up190
;Ducati_logger_driver.c,4416 :: 		if (exec_cimage->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_cimage+0)
MOVT	R4, #hi_addr(_exec_cimage+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up191
;Ducati_logger_driver.c,4417 :: 		exec_cimage->OnClickPtr();
MOVW	R4, #lo_addr(_exec_cimage+0)
MOVT	R4, #hi_addr(_exec_cimage+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up191:
L_Process_TP_Up190:
;Ducati_logger_driver.c,4418 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4419 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4420 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;Ducati_logger_driver.c,4421 :: 		}
L_Process_TP_Up188:
;Ducati_logger_driver.c,4422 :: 		}
L_Process_TP_Up187:
;Ducati_logger_driver.c,4425 :: 		if (_object_count == circle_order) {
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up192
;Ducati_logger_driver.c,4426 :: 		if (exec_circle->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up193
;Ducati_logger_driver.c,4427 :: 		if (exec_circle->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up194
;Ducati_logger_driver.c,4428 :: 		exec_circle->OnUpPtr();
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up194:
;Ducati_logger_driver.c,4429 :: 		if (PressedObject == (TPointer)exec_circle)
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up195
;Ducati_logger_driver.c,4430 :: 		if (exec_circle->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up196
;Ducati_logger_driver.c,4431 :: 		exec_circle->OnClickPtr();
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up196:
L_Process_TP_Up195:
;Ducati_logger_driver.c,4432 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4433 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4434 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;Ducati_logger_driver.c,4435 :: 		}
L_Process_TP_Up193:
;Ducati_logger_driver.c,4436 :: 		}
L_Process_TP_Up192:
;Ducati_logger_driver.c,4439 :: 		if (_object_count == circle_button_order) {
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up197
;Ducati_logger_driver.c,4440 :: 		if (exec_circle_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up198
;Ducati_logger_driver.c,4441 :: 		if (exec_circle_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up199
;Ducati_logger_driver.c,4442 :: 		exec_circle_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up199:
;Ducati_logger_driver.c,4443 :: 		if (PressedObject == (TPointer)exec_circle_button)
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up200
;Ducati_logger_driver.c,4444 :: 		if (exec_circle_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up201
;Ducati_logger_driver.c,4445 :: 		exec_circle_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up201:
L_Process_TP_Up200:
;Ducati_logger_driver.c,4446 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4447 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4448 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;Ducati_logger_driver.c,4449 :: 		}
L_Process_TP_Up198:
;Ducati_logger_driver.c,4450 :: 		}
L_Process_TP_Up197:
;Ducati_logger_driver.c,4453 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up202
;Ducati_logger_driver.c,4454 :: 		if (exec_box->Active == 1) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up203
;Ducati_logger_driver.c,4455 :: 		if (exec_box->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up204
;Ducati_logger_driver.c,4456 :: 		exec_box->OnUpPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up204:
;Ducati_logger_driver.c,4457 :: 		if (PressedObject == (TPointer)exec_box)
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up205
;Ducati_logger_driver.c,4458 :: 		if (exec_box->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up206
;Ducati_logger_driver.c,4459 :: 		exec_box->OnClickPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up206:
L_Process_TP_Up205:
;Ducati_logger_driver.c,4460 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4461 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4462 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;Ducati_logger_driver.c,4463 :: 		}
L_Process_TP_Up203:
;Ducati_logger_driver.c,4464 :: 		}
L_Process_TP_Up202:
;Ducati_logger_driver.c,4467 :: 		if (_object_count == cbox_order) {
MOVW	R2, #lo_addr(_cbox_order+0)
MOVT	R2, #hi_addr(_cbox_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up207
;Ducati_logger_driver.c,4468 :: 		if (exec_cbox->Active == 1) {
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up208
;Ducati_logger_driver.c,4469 :: 		if (exec_cbox->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_cbox+0)
MOVT	R4, #hi_addr(_exec_cbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up209
;Ducati_logger_driver.c,4470 :: 		exec_cbox->OnUpPtr();
MOVW	R4, #lo_addr(_exec_cbox+0)
MOVT	R4, #hi_addr(_exec_cbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up209:
;Ducati_logger_driver.c,4471 :: 		if (PressedObject == (TPointer)exec_cbox)
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up210
;Ducati_logger_driver.c,4472 :: 		if (exec_cbox->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_cbox+0)
MOVT	R4, #hi_addr(_exec_cbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up211
;Ducati_logger_driver.c,4473 :: 		exec_cbox->OnClickPtr();
MOVW	R4, #lo_addr(_exec_cbox+0)
MOVT	R4, #hi_addr(_exec_cbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up211:
L_Process_TP_Up210:
;Ducati_logger_driver.c,4474 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4475 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4476 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;Ducati_logger_driver.c,4477 :: 		}
L_Process_TP_Up208:
;Ducati_logger_driver.c,4478 :: 		}
L_Process_TP_Up207:
;Ducati_logger_driver.c,4480 :: 		}
L_Process_TP_Up171:
;Ducati_logger_driver.c,4481 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4482 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4483 :: 		}
L_end_Process_TP_Up:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Process_TP_Up
_Process_TP_Down:
;Ducati_logger_driver.c,4485 :: 		void Process_TP_Down(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;Ducati_logger_driver.c,4487 :: 		object_pressed      = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;Ducati_logger_driver.c,4488 :: 		exec_round_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4489 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4490 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4491 :: 		exec_cimage         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_cimage+0)
MOVT	R2, #hi_addr(_exec_cimage+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4492 :: 		exec_circle         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4493 :: 		exec_circle_button  = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4494 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4495 :: 		exec_cbox           = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4497 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;Ducati_logger_driver.c,4499 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Down212
;Ducati_logger_driver.c,4500 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down213
;Ducati_logger_driver.c,4501 :: 		if (exec_round_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down214
;Ducati_logger_driver.c,4502 :: 		if (exec_round_button->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #47
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down215
;Ducati_logger_driver.c,4503 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;Ducati_logger_driver.c,4504 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawRoundButton+0
;Ducati_logger_driver.c,4505 :: 		}
L_Process_TP_Down215:
;Ducati_logger_driver.c,4506 :: 		PressedObject = (TPointer)exec_round_button;
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4507 :: 		PressedObjectType = 1;
MOVS	R3, #1
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4508 :: 		if (exec_round_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down216
;Ducati_logger_driver.c,4509 :: 		exec_round_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4510 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;Ducati_logger_driver.c,4511 :: 		}
L_Process_TP_Down216:
;Ducati_logger_driver.c,4512 :: 		}
L_Process_TP_Down214:
;Ducati_logger_driver.c,4513 :: 		}
L_Process_TP_Down213:
;Ducati_logger_driver.c,4515 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down217
;Ducati_logger_driver.c,4516 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down218
;Ducati_logger_driver.c,4517 :: 		PressedObject = (TPointer)exec_label;
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4518 :: 		PressedObjectType = 2;
MOVS	R3, #2
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4519 :: 		if (exec_label->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down219
;Ducati_logger_driver.c,4520 :: 		exec_label->OnDownPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4521 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;Ducati_logger_driver.c,4522 :: 		}
L_Process_TP_Down219:
;Ducati_logger_driver.c,4523 :: 		}
L_Process_TP_Down218:
;Ducati_logger_driver.c,4524 :: 		}
L_Process_TP_Down217:
;Ducati_logger_driver.c,4526 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down220
;Ducati_logger_driver.c,4527 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down221
;Ducati_logger_driver.c,4528 :: 		PressedObject = (TPointer)exec_image;
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4529 :: 		PressedObjectType = 3;
MOVS	R3, #3
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4530 :: 		if (exec_image->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down222
;Ducati_logger_driver.c,4531 :: 		exec_image->OnDownPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4532 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;Ducati_logger_driver.c,4533 :: 		}
L_Process_TP_Down222:
;Ducati_logger_driver.c,4534 :: 		}
L_Process_TP_Down221:
;Ducati_logger_driver.c,4535 :: 		}
L_Process_TP_Down220:
;Ducati_logger_driver.c,4537 :: 		if (_object_count == cimage_order) {
MOVW	R2, #lo_addr(_cimage_order+0)
MOVT	R2, #hi_addr(_cimage_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down223
;Ducati_logger_driver.c,4538 :: 		if (exec_cimage->Active == 1) {
MOVW	R2, #lo_addr(_exec_cimage+0)
MOVT	R2, #hi_addr(_exec_cimage+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down224
;Ducati_logger_driver.c,4539 :: 		PressedObject = (TPointer)exec_cimage;
MOVW	R4, #lo_addr(_exec_cimage+0)
MOVT	R4, #hi_addr(_exec_cimage+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4540 :: 		PressedObjectType = 11;
MOVS	R3, #11
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4541 :: 		if (exec_cimage->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down225
;Ducati_logger_driver.c,4542 :: 		exec_cimage->OnDownPtr();
MOVW	R4, #lo_addr(_exec_cimage+0)
MOVT	R4, #hi_addr(_exec_cimage+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4543 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;Ducati_logger_driver.c,4544 :: 		}
L_Process_TP_Down225:
;Ducati_logger_driver.c,4545 :: 		}
L_Process_TP_Down224:
;Ducati_logger_driver.c,4546 :: 		}
L_Process_TP_Down223:
;Ducati_logger_driver.c,4548 :: 		if (_object_count == circle_order) {
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down226
;Ducati_logger_driver.c,4549 :: 		if (exec_circle->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down227
;Ducati_logger_driver.c,4550 :: 		if (exec_circle->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down228
;Ducati_logger_driver.c,4551 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;Ducati_logger_driver.c,4552 :: 		DrawCircle(exec_circle);
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawCircle+0
;Ducati_logger_driver.c,4553 :: 		}
L_Process_TP_Down228:
;Ducati_logger_driver.c,4554 :: 		PressedObject = (TPointer)exec_circle;
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4555 :: 		PressedObjectType = 4;
MOVS	R3, #4
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4556 :: 		if (exec_circle->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down229
;Ducati_logger_driver.c,4557 :: 		exec_circle->OnDownPtr();
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4558 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;Ducati_logger_driver.c,4559 :: 		}
L_Process_TP_Down229:
;Ducati_logger_driver.c,4560 :: 		}
L_Process_TP_Down227:
;Ducati_logger_driver.c,4561 :: 		}
L_Process_TP_Down226:
;Ducati_logger_driver.c,4563 :: 		if (_object_count == circle_button_order) {
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down230
;Ducati_logger_driver.c,4564 :: 		if (exec_circle_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down231
;Ducati_logger_driver.c,4565 :: 		if (exec_circle_button->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #42
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down232
;Ducati_logger_driver.c,4566 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;Ducati_logger_driver.c,4567 :: 		DrawCircleButton(exec_circle_button);
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawCircleButton+0
;Ducati_logger_driver.c,4568 :: 		}
L_Process_TP_Down232:
;Ducati_logger_driver.c,4569 :: 		PressedObject = (TPointer)exec_circle_button;
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4570 :: 		PressedObjectType = 5;
MOVS	R3, #5
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4571 :: 		if (exec_circle_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down233
;Ducati_logger_driver.c,4572 :: 		exec_circle_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4573 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;Ducati_logger_driver.c,4574 :: 		}
L_Process_TP_Down233:
;Ducati_logger_driver.c,4575 :: 		}
L_Process_TP_Down231:
;Ducati_logger_driver.c,4576 :: 		}
L_Process_TP_Down230:
;Ducati_logger_driver.c,4578 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down234
;Ducati_logger_driver.c,4579 :: 		if (exec_box->Active == 1) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down235
;Ducati_logger_driver.c,4580 :: 		if (exec_box->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down236
;Ducati_logger_driver.c,4581 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;Ducati_logger_driver.c,4582 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawBox+0
;Ducati_logger_driver.c,4583 :: 		}
L_Process_TP_Down236:
;Ducati_logger_driver.c,4584 :: 		PressedObject = (TPointer)exec_box;
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4585 :: 		PressedObjectType = 6;
MOVS	R3, #6
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4586 :: 		if (exec_box->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down237
;Ducati_logger_driver.c,4587 :: 		exec_box->OnDownPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4588 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;Ducati_logger_driver.c,4589 :: 		}
L_Process_TP_Down237:
;Ducati_logger_driver.c,4590 :: 		}
L_Process_TP_Down235:
;Ducati_logger_driver.c,4591 :: 		}
L_Process_TP_Down234:
;Ducati_logger_driver.c,4593 :: 		if (_object_count == cbox_order) {
MOVW	R2, #lo_addr(_cbox_order+0)
MOVT	R2, #hi_addr(_cbox_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down238
;Ducati_logger_driver.c,4594 :: 		if (exec_cbox->Active == 1) {
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down239
;Ducati_logger_driver.c,4595 :: 		if (exec_cbox->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down240
;Ducati_logger_driver.c,4596 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;Ducati_logger_driver.c,4597 :: 		DrawCBox(exec_cbox);
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawCBox+0
;Ducati_logger_driver.c,4598 :: 		}
L_Process_TP_Down240:
;Ducati_logger_driver.c,4599 :: 		PressedObject = (TPointer)exec_cbox;
MOVW	R4, #lo_addr(_exec_cbox+0)
MOVT	R4, #hi_addr(_exec_cbox+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4600 :: 		PressedObjectType = 14;
MOVS	R3, #14
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4601 :: 		if (exec_cbox->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down241
;Ducati_logger_driver.c,4602 :: 		exec_cbox->OnDownPtr();
MOVW	R4, #lo_addr(_exec_cbox+0)
MOVT	R4, #hi_addr(_exec_cbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4603 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;Ducati_logger_driver.c,4604 :: 		}
L_Process_TP_Down241:
;Ducati_logger_driver.c,4605 :: 		}
L_Process_TP_Down239:
;Ducati_logger_driver.c,4606 :: 		}
L_Process_TP_Down238:
;Ducati_logger_driver.c,4608 :: 		}
L_Process_TP_Down212:
;Ducati_logger_driver.c,4609 :: 		}
L_end_Process_TP_Down:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Down
_Check_TP:
;Ducati_logger_driver.c,4611 :: 		void Check_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_driver.c,4612 :: 		if (STMPE610_PressDetect()) {
BL	_STMPE610_PressDetect+0
CMP	R0, #0
IT	EQ
BEQ	L_Check_TP242
;Ducati_logger_driver.c,4613 :: 		if (STMPE610_GetLastCoordinates(&Xcoord, &Ycoord) == 0) {
MOVW	R1, #lo_addr(_Ycoord+0)
MOVT	R1, #hi_addr(_Ycoord+0)
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
BL	_STMPE610_GetLastCoordinates+0
CMP	R0, #0
IT	NE
BNE	L_Check_TP243
;Ducati_logger_driver.c,4615 :: 		Process_TP_Press(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Press+0
;Ducati_logger_driver.c,4616 :: 		if (PenDown == 0) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Check_TP244
;Ducati_logger_driver.c,4617 :: 		PenDown = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4618 :: 		Process_TP_Down(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Down+0
;Ducati_logger_driver.c,4619 :: 		}
L_Check_TP244:
;Ducati_logger_driver.c,4620 :: 		}
L_Check_TP243:
;Ducati_logger_driver.c,4621 :: 		}
IT	AL
BAL	L_Check_TP245
L_Check_TP242:
;Ducati_logger_driver.c,4622 :: 		else if (PenDown == 1) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Check_TP246
;Ducati_logger_driver.c,4623 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4624 :: 		Process_TP_Up(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Up+0
;Ducati_logger_driver.c,4625 :: 		}
L_Check_TP246:
L_Check_TP245:
;Ducati_logger_driver.c,4626 :: 		}
L_end_Check_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Check_TP
_Init_MCU:
;Ducati_logger_driver.c,4628 :: 		void Init_MCU() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_driver.c,4630 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;Ducati_logger_driver.c,4631 :: 		for (_cnt = 0; _cnt < 20; _cnt++) {
; _cnt start address is: 8 (R2)
MOVS	R2, #0
; _cnt end address is: 8 (R2)
L_Init_MCU247:
; _cnt start address is: 8 (R2)
CMP	R2, #20
IT	CS
BCS	L_Init_MCU248
;Ducati_logger_driver.c,4632 :: 		GPIOB_ODR.B6 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4633 :: 		Delay_ms(1);
MOVW	R7, #49998
MOVT	R7, #0
NOP
NOP
L_Init_MCU250:
SUBS	R7, R7, #1
BNE	L_Init_MCU250
NOP
NOP
NOP
;Ducati_logger_driver.c,4634 :: 		GPIOB_ODR.B6 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4635 :: 		Delay_ms(1);
MOVW	R7, #49998
MOVT	R7, #0
NOP
NOP
L_Init_MCU252:
SUBS	R7, R7, #1
BNE	L_Init_MCU252
NOP
NOP
NOP
;Ducati_logger_driver.c,4631 :: 		for (_cnt = 0; _cnt < 20; _cnt++) {
ADDS	R2, R2, #1
UXTB	R2, R2
;Ducati_logger_driver.c,4636 :: 		}
; _cnt end address is: 8 (R2)
IT	AL
BAL	L_Init_MCU247
L_Init_MCU248:
;Ducati_logger_driver.c,4638 :: 		I2C1_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB67);
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVW	R0, #6784
MOVT	R0, #6
BL	_I2C1_Init_Advanced+0
;Ducati_logger_driver.c,4639 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;Ducati_logger_driver.c,4640 :: 		GPIO_Digital_Output(&GPIOG_BASE, 0x00FF);
MOVS	R1, #255
MOVW	R0, #lo_addr(GPIOG_BASE+0)
MOVT	R0, #hi_addr(GPIOG_BASE+0)
BL	_GPIO_Digital_Output+0
;Ducati_logger_driver.c,4641 :: 		GPIO_Digital_Output(&GPIOE_BASE, 0xFF00);
MOVW	R1, #65280
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Ducati_logger_driver.c,4642 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;Ducati_logger_driver.c,4643 :: 		GPIOB_ODR.B4 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4644 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;Ducati_logger_driver.c,4645 :: 		TFT_Set_MM_Plus();
BL	_TFT_Set_MM_Plus+0
;Ducati_logger_driver.c,4646 :: 		STMPE610_SetDefaultMode();
BL	_STMPE610_SetDefaultMode+0
;Ducati_logger_driver.c,4647 :: 		}
L_end_Init_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_MCU
_Init_Ext_Mem:
;Ducati_logger_driver.c,4649 :: 		void Init_Ext_Mem() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_driver.c,4651 :: 		SDIO_Reset();
BL	_SDIO_Reset+0
;Ducati_logger_driver.c,4654 :: 		| _SDIO_CFG_CLOCK_RISING_EDGE | _SDIO_CFG_HW_FLOW_DISABLE, 125, &_GPIO_MODULE_SDIO_D0_D3);
MOVW	R2, #lo_addr(__GPIO_MODULE_SDIO_D0_D3+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SDIO_D0_D3+0)
MOVS	R1, #125
MOVW	R0, #2048
BL	_SDIO_Init+0
;Ducati_logger_driver.c,4657 :: 		GPIOD_PUPDRbits.PUPDR2 = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOD_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOD_PUPDRbits+0)
LDRB	R0, [R1, #0]
BFI	R0, R2, #4, #2
STRB	R0, [R1, #0]
;Ducati_logger_driver.c,4658 :: 		GPIOC_PUPDRbits.PUPDR8 = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOC_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOC_PUPDRbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #16, #2
STR	R0, [R1, #0]
;Ducati_logger_driver.c,4659 :: 		GPIOC_PUPDRbits.PUPDR9 = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOC_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOC_PUPDRbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #18, #2
STR	R0, [R1, #0]
;Ducati_logger_driver.c,4660 :: 		GPIOC_PUPDRbits.PUPDR10 = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOC_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOC_PUPDRbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #20, #2
STR	R0, [R1, #0]
;Ducati_logger_driver.c,4661 :: 		GPIOC_PUPDRbits.PUPDR11 = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOC_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOC_PUPDRbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #22, #2
STR	R0, [R1, #0]
;Ducati_logger_driver.c,4663 :: 		Mmc_Set_Interface(_MMC_INTERFACE_SDIO);
MOVS	R0, #1
BL	_Mmc_Set_Interface+0
;Ducati_logger_driver.c,4666 :: 		if (!Mmc_Fat_Init()) {
BL	_Mmc_Fat_Init+0
CMP	R0, #0
IT	NE
BNE	L_Init_Ext_Mem254
;Ducati_logger_driver.c,4669 :: 		| _SDIO_CFG_CLOCK_RISING_EDGE | _SDIO_CFG_HW_FLOW_DISABLE, 1, &_GPIO_MODULE_SDIO_D0_D3);
MOVW	R2, #lo_addr(__GPIO_MODULE_SDIO_D0_D3+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SDIO_D0_D3+0)
MOVS	R1, #1
MOVW	R0, #2048
BL	_SDIO_Init+0
;Ducati_logger_driver.c,4672 :: 		Mmc_Fat_Assign("Ducati_l.RES", 0);
MOVW	R0, #lo_addr(?lstr3_Ducati_logger_driver+0)
MOVT	R0, #hi_addr(?lstr3_Ducati_logger_driver+0)
MOVS	R1, #0
BL	_Mmc_Fat_Assign+0
;Ducati_logger_driver.c,4673 :: 		Mmc_Fat_Reset(&res_file_size);
MOVW	R0, #lo_addr(_res_file_size+0)
MOVT	R0, #hi_addr(_res_file_size+0)
BL	_Mmc_Fat_Reset+0
;Ducati_logger_driver.c,4674 :: 		}
L_Init_Ext_Mem254:
;Ducati_logger_driver.c,4675 :: 		}
L_end_Init_Ext_Mem:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_Ext_Mem
_STMPE610_Config:
;Ducati_logger_driver.c,4677 :: 		char STMPE610_Config()  {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_driver.c,4678 :: 		STMPE610_SetI2CAddress(STMPE610_I2C_ADDR1);
MOVS	R0, #136
BL	_STMPE610_SetI2CAddress+0
;Ducati_logger_driver.c,4679 :: 		if (STMPE610_IsOperational() != 0){
BL	_STMPE610_IsOperational+0
CMP	R0, #0
IT	EQ
BEQ	L_STMPE610_Config255
;Ducati_logger_driver.c,4680 :: 		return STMPE610_IO_NOT_OPERATIONAL;
MOVS	R0, #4
IT	AL
BAL	L_end_STMPE610_Config
;Ducati_logger_driver.c,4681 :: 		}
L_STMPE610_Config255:
;Ducati_logger_driver.c,4683 :: 		STMPE610_Reset();
BL	_STMPE610_Reset+0
;Ducati_logger_driver.c,4684 :: 		STMPE610_Module(STMPE610_MODULE_TS | STMPE610_MODULE_ADC, STMPE610_ENABLE);
MOVS	R1, #1
MOVS	R0, #3
BL	_STMPE610_Module+0
;Ducati_logger_driver.c,4685 :: 		STMPE610_AlternateFunction(STMPE610_GPIO_PIN1, STMPE610_ENABLE);
MOVS	R1, #1
MOVS	R0, #2
BL	_STMPE610_AlternateFunction+0
;Ducati_logger_driver.c,4686 :: 		STMPE610_SetGPIOPin(STMPE610_GPIO_PIN1, 0);   // IN1 to "0" -> I2C communication
MOVS	R1, #0
MOVS	R0, #2
BL	_STMPE610_SetGPIOPin+0
;Ducati_logger_driver.c,4687 :: 		STMPE610_SetSize(480,272);
MOVW	R1, #272
MOVW	R0, #480
BL	_STMPE610_SetSize+0
;Ducati_logger_driver.c,4688 :: 		STMPE610_Module(STMPE610_MODULE_TS | STMPE610_MODULE_ADC, STMPE610_ENABLE);
MOVS	R1, #1
MOVS	R0, #3
BL	_STMPE610_Module+0
;Ducati_logger_driver.c,4689 :: 		STMPE610_EnableInterrupt(STMPE610_IE_TOUCH_DET | STMPE610_IE_FIFO_TH | STMPE610_IE_FIFO_0FLOW, STMPE610_ENABLE);
MOVS	R1, #1
MOVS	R0, #7
BL	_STMPE610_EnableInterrupt+0
;Ducati_logger_driver.c,4690 :: 		STMPE610_ConfigureInterrupt(STMPE610_INT_POLARITY_ACTIVE_HIGH | STMPE610_INT_TYPE_EDGE | STMPE610_INT_ENABLE_ALL);
MOVS	R0, #7
BL	_STMPE610_ConfigureInterrupt+0
;Ducati_logger_driver.c,4691 :: 		STMPE610_SetADC(STMPE610_ADC_CTRL1_SAMPLETIME_44 | STMPE610_ADC_CTRL1_ADC_12BIT | STMPE610_ADC_CTRL1_INT_REFERENCE);
MOVS	R0, #20
BL	_STMPE610_SetADC+0
;Ducati_logger_driver.c,4692 :: 		Delay_10ms(); Delay_10ms();
BL	_Delay_10ms+0
BL	_Delay_10ms+0
;Ducati_logger_driver.c,4693 :: 		STMPE610_SetADCClock(STMPE610_ADC_CTRL2_3250_kHZ);
MOVS	R0, #1
BL	_STMPE610_SetADCClock+0
;Ducati_logger_driver.c,4694 :: 		STMPE610_AlternateFunction(STMPE610_GPIO_PIN4 | STMPE610_GPIO_PIN5 | STMPE610_GPIO_PIN6 | STMPE610_GPIO_PIN7, STMPE610_DISABLE);
MOVS	R1, #0
MOVS	R0, #240
BL	_STMPE610_AlternateFunction+0
;Ducati_logger_driver.c,4695 :: 		STMPE610_ConfigureTSC(STMPE610_TSC_CFG_AVE_CTRL_4S, STMPE610_TSC_CFG_TOUCH_DET_DELAY_500uS, STMPE610_TSC_CFG_TOUCH_SETTLING_500uS);
MOVS	R2, #2
MOVS	R1, #24
MOVS	R0, #128
BL	_STMPE610_ConfigureTSC+0
;Ducati_logger_driver.c,4696 :: 		STMPE610_SetFIFOThreshold(1);
MOVS	R0, #1
BL	_STMPE610_SetFIFOThreshold+0
;Ducati_logger_driver.c,4697 :: 		STMPE610_ResetFIFO();
BL	_STMPE610_ResetFIFO+0
;Ducati_logger_driver.c,4698 :: 		STMPE610_TSIDrive(STMPE610_TSC_I_DRIVE_20mA);
MOVS	R0, #0
BL	_STMPE610_TSIDrive+0
;Ducati_logger_driver.c,4699 :: 		STMPE610_TSControl(STMPE610_TSC_CTRL_TRACK0 | STMPE610_TSC_CTRL_ACQU_XYZ | STMPE610_TSC_CTRL_ENABLE);
MOVS	R0, #1
BL	_STMPE610_TSControl+0
;Ducati_logger_driver.c,4700 :: 		STMPE610_ZDataFraction(STMPE610_FRACP4_WHOLP4);
MOVS	R0, #4
BL	_STMPE610_ZDataFraction+0
;Ducati_logger_driver.c,4701 :: 		STMPE610_SetTouchPressureThreshold(70);
MOVS	R0, #70
BL	_STMPE610_SetTouchPressureThreshold+0
;Ducati_logger_driver.c,4702 :: 		STMPE610_ClearInterrupts();
BL	_STMPE610_ClearInterrupts+0
;Ducati_logger_driver.c,4703 :: 		STMPE610_WriteReg(STMPE610_INT_CTRL_REG, 0x01);
MOVS	R1, #1
MOVS	R0, #9
BL	_STMPE610_WriteReg+0
;Ducati_logger_driver.c,4704 :: 		return STMPE610_OK;
MOVS	R0, #0
;Ducati_logger_driver.c,4705 :: 		}
L_end_STMPE610_Config:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _STMPE610_Config
_Start_TP:
;Ducati_logger_driver.c,4708 :: 		void Start_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_driver.c,4709 :: 		Init_MCU();
BL	_Init_MCU+0
;Ducati_logger_driver.c,4711 :: 		Init_Ext_Mem();
BL	_Init_Ext_Mem+0
;Ducati_logger_driver.c,4713 :: 		InitializeTouchPanel();
BL	Ducati_logger_driver_InitializeTouchPanel+0
;Ducati_logger_driver.c,4714 :: 		if (STMPE610_Config() == STMPE610_OK) {
BL	_STMPE610_Config+0
CMP	R0, #0
IT	NE
BNE	L_Start_TP256
;Ducati_logger_driver.c,4715 :: 		} else {
IT	AL
BAL	L_Start_TP257
L_Start_TP256:
;Ducati_logger_driver.c,4716 :: 		while(1);
L_Start_TP258:
IT	AL
BAL	L_Start_TP258
;Ducati_logger_driver.c,4717 :: 		}
L_Start_TP257:
;Ducati_logger_driver.c,4720 :: 		Delay_ms(1000);
MOVW	R7, #61566
MOVT	R7, #762
NOP
NOP
L_Start_TP260:
SUBS	R7, R7, #1
BNE	L_Start_TP260
NOP
NOP
NOP
;Ducati_logger_driver.c,4721 :: 		TFT_Fill_Screen(0);
MOVS	R0, #0
BL	_TFT_Fill_Screen+0
;Ducati_logger_driver.c,4722 :: 		Calibrate();
BL	_Calibrate+0
;Ducati_logger_driver.c,4723 :: 		TFT_Fill_Screen(0);
MOVS	R0, #0
BL	_TFT_Fill_Screen+0
;Ducati_logger_driver.c,4725 :: 		InitializeObjects();
BL	Ducati_logger_driver_InitializeObjects+0
;Ducati_logger_driver.c,4726 :: 		display_width = Tachometer_graphics.Width;
MOVW	R0, #lo_addr(_Tachometer_graphics+2)
MOVT	R0, #hi_addr(_Tachometer_graphics+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_width+0)
MOVT	R0, #hi_addr(_display_width+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4727 :: 		display_height = Tachometer_graphics.Height;
MOVW	R0, #lo_addr(_Tachometer_graphics+4)
MOVT	R0, #hi_addr(_Tachometer_graphics+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_height+0)
MOVT	R0, #hi_addr(_display_height+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4728 :: 		DrawScreen(&Tachometer_graphics);
MOVW	R0, #lo_addr(_Tachometer_graphics+0)
MOVT	R0, #hi_addr(_Tachometer_graphics+0)
BL	_DrawScreen+0
;Ducati_logger_driver.c,4729 :: 		}
L_end_Start_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Start_TP
Ducati_logger_driver____?ag:
L_end_Ducati_logger_driver___?ag:
BX	LR
; end of Ducati_logger_driver____?ag
