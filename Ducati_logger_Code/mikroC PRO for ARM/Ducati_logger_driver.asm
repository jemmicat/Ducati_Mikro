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
;Ducati_logger_driver.c,126 :: 		TFT_Init(480, 272);
MOVW	R1, #272
MOVW	R0, #480
BL	_TFT_Init+0
;Ducati_logger_driver.c,127 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
MOVW	R0, #lo_addr(_TFT_Get_Data+0)
MOVT	R0, #hi_addr(_TFT_Get_Data+0)
BL	_TFT_Set_Ext_Buffer+0
;Ducati_logger_driver.c,129 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;Ducati_logger_driver.c,131 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,132 :: 		PressedObject = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PressedObject+0)
MOVT	R0, #hi_addr(_PressedObject+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,133 :: 		PressedObjectType = -1;
MOVW	R1, #65535
SXTH	R1, R1
MOVW	R0, #lo_addr(_PressedObjectType+0)
MOVT	R0, #hi_addr(_PressedObjectType+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,134 :: 		}
L_end_InitializeTouchPanel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of Ducati_logger_driver_InitializeTouchPanel
_Calibrate:
;Ducati_logger_driver.c,136 :: 		void Calibrate() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_driver.c,137 :: 		TFT_Fill_Screen(CL_BLACK);
MOVW	R0, #0
BL	_TFT_Fill_Screen+0
;Ducati_logger_driver.c,138 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;Ducati_logger_driver.c,139 :: 		TFT_Write_Text("Touch points on the screen as they", 125, 121);
MOVW	R0, #lo_addr(?lstr1_Ducati_logger_driver+0)
MOVT	R0, #hi_addr(?lstr1_Ducati_logger_driver+0)
MOVS	R2, #121
MOVS	R1, #125
BL	_TFT_Write_Text+0
;Ducati_logger_driver.c,140 :: 		TFT_Write_Text("appear to calibrate touchscreen.", 135, 151);
MOVW	R0, #lo_addr(?lstr2_Ducati_logger_driver+0)
MOVT	R0, #hi_addr(?lstr2_Ducati_logger_driver+0)
MOVS	R2, #151
MOVS	R1, #135
BL	_TFT_Write_Text+0
;Ducati_logger_driver.c,141 :: 		STMPE610_ClearInterruptFlagsAndFIFO();
BL	_STMPE610_ClearInterruptFlagsAndFIFO+0
;Ducati_logger_driver.c,142 :: 		TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
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
;Ducati_logger_driver.c,143 :: 		TFT_Circle(0, 0, 3);
MOVS	R2, #3
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Circle+0
;Ducati_logger_driver.c,144 :: 		STMPE610_CalibratePoint(STMPE610_FIRST_CORNER);
MOVS	R0, #0
BL	_STMPE610_CalibratePoint+0
;Ducati_logger_driver.c,145 :: 		Delay_ms(500);
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
;Ducati_logger_driver.c,146 :: 		TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
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
;Ducati_logger_driver.c,147 :: 		TFT_Circle(0, 0, 3);
MOVS	R2, #3
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Circle+0
;Ducati_logger_driver.c,148 :: 		STMPE610_ClearInterruptFlagsAndFIFO();
BL	_STMPE610_ClearInterruptFlagsAndFIFO+0
;Ducati_logger_driver.c,149 :: 		TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
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
;Ducati_logger_driver.c,150 :: 		TFT_Circle(0, TFT_DISP_HEIGHT-1, 3);
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
;Ducati_logger_driver.c,151 :: 		STMPE610_CalibratePoint(STMPE610_SECOND_CORNER);
MOVS	R0, #1
BL	_STMPE610_CalibratePoint+0
;Ducati_logger_driver.c,152 :: 		Delay_ms(500);
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
;Ducati_logger_driver.c,153 :: 		TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
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
;Ducati_logger_driver.c,154 :: 		TFT_Circle(0, TFT_DISP_HEIGHT-1, 3);
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
;Ducati_logger_driver.c,155 :: 		STMPE610_ClearInterruptFlagsAndFIFO();
BL	_STMPE610_ClearInterruptFlagsAndFIFO+0
;Ducati_logger_driver.c,156 :: 		TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
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
;Ducati_logger_driver.c,157 :: 		TFT_Circle(TFT_DISP_WIDTH-1, TFT_DISP_HEIGHT-1, 3);
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
;Ducati_logger_driver.c,158 :: 		STMPE610_CalibratePoint(STMPE610_THIRD_CORNER);
MOVS	R0, #2
BL	_STMPE610_CalibratePoint+0
;Ducati_logger_driver.c,159 :: 		Delay_ms(500);
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
;Ducati_logger_driver.c,160 :: 		TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
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
;Ducati_logger_driver.c,161 :: 		TFT_Circle(TFT_DISP_WIDTH-1, TFT_DISP_HEIGHT-1, 3);
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
;Ducati_logger_driver.c,162 :: 		STMPE610_ClearInterruptFlagsAndFIFO();
BL	_STMPE610_ClearInterruptFlagsAndFIFO+0
;Ducati_logger_driver.c,163 :: 		TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
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
;Ducati_logger_driver.c,164 :: 		TFT_Circle(TFT_DISP_WIDTH-1, 0, 3);
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
;Ducati_logger_driver.c,165 :: 		STMPE610_CalibratePoint(STMPE610_FOURTH_CORNER);
MOVS	R0, #3
BL	_STMPE610_CalibratePoint+0
;Ducati_logger_driver.c,166 :: 		TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
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
;Ducati_logger_driver.c,167 :: 		TFT_Circle(TFT_DISP_WIDTH-1, 0, 3);
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
;Ducati_logger_driver.c,168 :: 		Delay_ms(500);
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
;Ducati_logger_driver.c,169 :: 		}
L_end_Calibrate:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Calibrate
Ducati_logger_driver_InitializeObjects:
;Ducati_logger_driver.c,906 :: 		static void InitializeObjects() {
;Ducati_logger_driver.c,907 :: 		Boot.Color                     = 0x41E6;
MOVW	R1, #16870
MOVW	R0, #lo_addr(_Boot+0)
MOVT	R0, #hi_addr(_Boot+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,908 :: 		Boot.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Boot+2)
MOVT	R0, #hi_addr(_Boot+2)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,909 :: 		Boot.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Boot+4)
MOVT	R0, #hi_addr(_Boot+4)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,910 :: 		Boot.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Boot+8)
MOVT	R0, #hi_addr(_Boot+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,911 :: 		Boot.LabelsCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Boot+16)
MOVT	R0, #hi_addr(_Boot+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,912 :: 		Boot.ImagesCount               = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Boot+24)
MOVT	R0, #hi_addr(_Boot+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,913 :: 		Boot.Images                    = Screen1_Images;
MOVW	R1, #lo_addr(_Screen1_Images+0)
MOVT	R1, #hi_addr(_Screen1_Images+0)
MOVW	R0, #lo_addr(_Boot+28)
MOVT	R0, #hi_addr(_Boot+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,914 :: 		Boot.CImagesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Boot+32)
MOVT	R0, #hi_addr(_Boot+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,915 :: 		Boot.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Boot+40)
MOVT	R0, #hi_addr(_Boot+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,916 :: 		Boot.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Boot+48)
MOVT	R0, #hi_addr(_Boot+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,917 :: 		Boot.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Boot+56)
MOVT	R0, #hi_addr(_Boot+56)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,918 :: 		Boot.CBoxesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Boot+64)
MOVT	R0, #hi_addr(_Boot+64)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,919 :: 		Boot.LinesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Boot+72)
MOVT	R0, #hi_addr(_Boot+72)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,920 :: 		Boot.ObjectsCount              = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Boot+6)
MOVT	R0, #hi_addr(_Boot+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,922 :: 		Speedometer_graphics.Color                     = 0x5AEB;
MOVW	R1, #23275
MOVW	R0, #lo_addr(_Speedometer_graphics+0)
MOVT	R0, #hi_addr(_Speedometer_graphics+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,923 :: 		Speedometer_graphics.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Speedometer_graphics+2)
MOVT	R0, #hi_addr(_Speedometer_graphics+2)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,924 :: 		Speedometer_graphics.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Speedometer_graphics+4)
MOVT	R0, #hi_addr(_Speedometer_graphics+4)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,925 :: 		Speedometer_graphics.Buttons_RoundCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Speedometer_graphics+8)
MOVT	R0, #hi_addr(_Speedometer_graphics+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,926 :: 		Speedometer_graphics.Buttons_Round             = Screen2_Buttons_Round;
MOVW	R1, #lo_addr(_Screen2_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen2_Buttons_Round+0)
MOVW	R0, #lo_addr(_Speedometer_graphics+12)
MOVT	R0, #hi_addr(_Speedometer_graphics+12)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,927 :: 		Speedometer_graphics.LabelsCount               = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Speedometer_graphics+16)
MOVT	R0, #hi_addr(_Speedometer_graphics+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,928 :: 		Speedometer_graphics.Labels                    = Screen2_Labels;
MOVW	R1, #lo_addr(_Screen2_Labels+0)
MOVT	R1, #hi_addr(_Screen2_Labels+0)
MOVW	R0, #lo_addr(_Speedometer_graphics+20)
MOVT	R0, #hi_addr(_Speedometer_graphics+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,929 :: 		Speedometer_graphics.ImagesCount               = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Speedometer_graphics+24)
MOVT	R0, #hi_addr(_Speedometer_graphics+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,930 :: 		Speedometer_graphics.Images                    = Screen2_Images;
MOVW	R1, #lo_addr(_Screen2_Images+0)
MOVT	R1, #hi_addr(_Screen2_Images+0)
MOVW	R0, #lo_addr(_Speedometer_graphics+28)
MOVT	R0, #hi_addr(_Speedometer_graphics+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,931 :: 		Speedometer_graphics.CImagesCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Speedometer_graphics+32)
MOVT	R0, #hi_addr(_Speedometer_graphics+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,932 :: 		Speedometer_graphics.CImages                   = Screen2_CImages;
MOVW	R1, #lo_addr(_Screen2_CImages+0)
MOVT	R1, #hi_addr(_Screen2_CImages+0)
MOVW	R0, #lo_addr(_Speedometer_graphics+36)
MOVT	R0, #hi_addr(_Speedometer_graphics+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,933 :: 		Speedometer_graphics.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Speedometer_graphics+40)
MOVT	R0, #hi_addr(_Speedometer_graphics+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,934 :: 		Speedometer_graphics.CircleButtonsCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Speedometer_graphics+48)
MOVT	R0, #hi_addr(_Speedometer_graphics+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,935 :: 		Speedometer_graphics.CircleButtons             = Screen2_CircleButtons;
MOVW	R1, #lo_addr(_Screen2_CircleButtons+0)
MOVT	R1, #hi_addr(_Screen2_CircleButtons+0)
MOVW	R0, #lo_addr(_Speedometer_graphics+52)
MOVT	R0, #hi_addr(_Speedometer_graphics+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,936 :: 		Speedometer_graphics.BoxesCount                = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Speedometer_graphics+56)
MOVT	R0, #hi_addr(_Speedometer_graphics+56)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,937 :: 		Speedometer_graphics.Boxes                     = Screen2_Boxes;
MOVW	R1, #lo_addr(_Screen2_Boxes+0)
MOVT	R1, #hi_addr(_Screen2_Boxes+0)
MOVW	R0, #lo_addr(_Speedometer_graphics+60)
MOVT	R0, #hi_addr(_Speedometer_graphics+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,938 :: 		Speedometer_graphics.CBoxesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Speedometer_graphics+64)
MOVT	R0, #hi_addr(_Speedometer_graphics+64)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,939 :: 		Speedometer_graphics.LinesCount                = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Speedometer_graphics+72)
MOVT	R0, #hi_addr(_Speedometer_graphics+72)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,940 :: 		Speedometer_graphics.Lines                     = Screen2_Lines;
MOVW	R1, #lo_addr(_Screen2_Lines+0)
MOVT	R1, #hi_addr(_Screen2_Lines+0)
MOVW	R0, #lo_addr(_Speedometer_graphics+76)
MOVT	R0, #hi_addr(_Speedometer_graphics+76)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,941 :: 		Speedometer_graphics.ObjectsCount              = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Speedometer_graphics+6)
MOVT	R0, #hi_addr(_Speedometer_graphics+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,943 :: 		Tachometer_graphics.Color                     = 0x5AEB;
MOVW	R1, #23275
MOVW	R0, #lo_addr(_Tachometer_graphics+0)
MOVT	R0, #hi_addr(_Tachometer_graphics+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,944 :: 		Tachometer_graphics.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Tachometer_graphics+2)
MOVT	R0, #hi_addr(_Tachometer_graphics+2)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,945 :: 		Tachometer_graphics.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Tachometer_graphics+4)
MOVT	R0, #hi_addr(_Tachometer_graphics+4)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,946 :: 		Tachometer_graphics.Buttons_RoundCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Tachometer_graphics+8)
MOVT	R0, #hi_addr(_Tachometer_graphics+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,947 :: 		Tachometer_graphics.Buttons_Round             = Screen3_Buttons_Round;
MOVW	R1, #lo_addr(_Screen3_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen3_Buttons_Round+0)
MOVW	R0, #lo_addr(_Tachometer_graphics+12)
MOVT	R0, #hi_addr(_Tachometer_graphics+12)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,948 :: 		Tachometer_graphics.LabelsCount               = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Tachometer_graphics+16)
MOVT	R0, #hi_addr(_Tachometer_graphics+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,949 :: 		Tachometer_graphics.Labels                    = Screen3_Labels;
MOVW	R1, #lo_addr(_Screen3_Labels+0)
MOVT	R1, #hi_addr(_Screen3_Labels+0)
MOVW	R0, #lo_addr(_Tachometer_graphics+20)
MOVT	R0, #hi_addr(_Tachometer_graphics+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,950 :: 		Tachometer_graphics.ImagesCount               = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Tachometer_graphics+24)
MOVT	R0, #hi_addr(_Tachometer_graphics+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,951 :: 		Tachometer_graphics.Images                    = Screen3_Images;
MOVW	R1, #lo_addr(_Screen3_Images+0)
MOVT	R1, #hi_addr(_Screen3_Images+0)
MOVW	R0, #lo_addr(_Tachometer_graphics+28)
MOVT	R0, #hi_addr(_Tachometer_graphics+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,952 :: 		Tachometer_graphics.CImagesCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Tachometer_graphics+32)
MOVT	R0, #hi_addr(_Tachometer_graphics+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,953 :: 		Tachometer_graphics.CImages                   = Screen3_CImages;
MOVW	R1, #lo_addr(_Screen3_CImages+0)
MOVT	R1, #hi_addr(_Screen3_CImages+0)
MOVW	R0, #lo_addr(_Tachometer_graphics+36)
MOVT	R0, #hi_addr(_Tachometer_graphics+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,954 :: 		Tachometer_graphics.CirclesCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Tachometer_graphics+40)
MOVT	R0, #hi_addr(_Tachometer_graphics+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,955 :: 		Tachometer_graphics.Circles                   = Screen3_Circles;
MOVW	R1, #lo_addr(_Screen3_Circles+0)
MOVT	R1, #hi_addr(_Screen3_Circles+0)
MOVW	R0, #lo_addr(_Tachometer_graphics+44)
MOVT	R0, #hi_addr(_Tachometer_graphics+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,956 :: 		Tachometer_graphics.CircleButtonsCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Tachometer_graphics+48)
MOVT	R0, #hi_addr(_Tachometer_graphics+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,957 :: 		Tachometer_graphics.CircleButtons             = Screen3_CircleButtons;
MOVW	R1, #lo_addr(_Screen3_CircleButtons+0)
MOVT	R1, #hi_addr(_Screen3_CircleButtons+0)
MOVW	R0, #lo_addr(_Tachometer_graphics+52)
MOVT	R0, #hi_addr(_Tachometer_graphics+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,958 :: 		Tachometer_graphics.BoxesCount                = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Tachometer_graphics+56)
MOVT	R0, #hi_addr(_Tachometer_graphics+56)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,959 :: 		Tachometer_graphics.Boxes                     = Screen3_Boxes;
MOVW	R1, #lo_addr(_Screen3_Boxes+0)
MOVT	R1, #hi_addr(_Screen3_Boxes+0)
MOVW	R0, #lo_addr(_Tachometer_graphics+60)
MOVT	R0, #hi_addr(_Tachometer_graphics+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,960 :: 		Tachometer_graphics.CBoxesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tachometer_graphics+64)
MOVT	R0, #hi_addr(_Tachometer_graphics+64)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,961 :: 		Tachometer_graphics.LinesCount                = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Tachometer_graphics+72)
MOVT	R0, #hi_addr(_Tachometer_graphics+72)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,962 :: 		Tachometer_graphics.Lines                     = Screen3_Lines;
MOVW	R1, #lo_addr(_Screen3_Lines+0)
MOVT	R1, #hi_addr(_Screen3_Lines+0)
MOVW	R0, #lo_addr(_Tachometer_graphics+76)
MOVT	R0, #hi_addr(_Tachometer_graphics+76)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,963 :: 		Tachometer_graphics.ObjectsCount              = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Tachometer_graphics+6)
MOVT	R0, #hi_addr(_Tachometer_graphics+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,965 :: 		Settings.Color                     = 0x5AEB;
MOVW	R1, #23275
MOVW	R0, #lo_addr(_Settings+0)
MOVT	R0, #hi_addr(_Settings+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,966 :: 		Settings.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Settings+2)
MOVT	R0, #hi_addr(_Settings+2)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,967 :: 		Settings.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Settings+4)
MOVT	R0, #hi_addr(_Settings+4)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,968 :: 		Settings.Buttons_RoundCount        = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Settings+8)
MOVT	R0, #hi_addr(_Settings+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,969 :: 		Settings.Buttons_Round             = Screen4_Buttons_Round;
MOVW	R1, #lo_addr(_Screen4_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen4_Buttons_Round+0)
MOVW	R0, #lo_addr(_Settings+12)
MOVT	R0, #hi_addr(_Settings+12)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,970 :: 		Settings.LabelsCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Settings+16)
MOVT	R0, #hi_addr(_Settings+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,971 :: 		Settings.Labels                    = Screen4_Labels;
MOVW	R1, #lo_addr(_Screen4_Labels+0)
MOVT	R1, #hi_addr(_Screen4_Labels+0)
MOVW	R0, #lo_addr(_Settings+20)
MOVT	R0, #hi_addr(_Settings+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,972 :: 		Settings.ImagesCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Settings+24)
MOVT	R0, #hi_addr(_Settings+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,973 :: 		Settings.Images                    = Screen4_Images;
MOVW	R1, #lo_addr(_Screen4_Images+0)
MOVT	R1, #hi_addr(_Screen4_Images+0)
MOVW	R0, #lo_addr(_Settings+28)
MOVT	R0, #hi_addr(_Settings+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,974 :: 		Settings.CImagesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Settings+32)
MOVT	R0, #hi_addr(_Settings+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,975 :: 		Settings.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Settings+40)
MOVT	R0, #hi_addr(_Settings+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,976 :: 		Settings.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Settings+48)
MOVT	R0, #hi_addr(_Settings+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,977 :: 		Settings.BoxesCount                = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Settings+56)
MOVT	R0, #hi_addr(_Settings+56)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,978 :: 		Settings.Boxes                     = Screen4_Boxes;
MOVW	R1, #lo_addr(_Screen4_Boxes+0)
MOVT	R1, #hi_addr(_Screen4_Boxes+0)
MOVW	R0, #lo_addr(_Settings+60)
MOVT	R0, #hi_addr(_Settings+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,979 :: 		Settings.CBoxesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Settings+64)
MOVT	R0, #hi_addr(_Settings+64)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,980 :: 		Settings.CBoxes                    = Screen4_CBoxes;
MOVW	R1, #lo_addr(_Screen4_CBoxes+0)
MOVT	R1, #hi_addr(_Screen4_CBoxes+0)
MOVW	R0, #lo_addr(_Settings+68)
MOVT	R0, #hi_addr(_Settings+68)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,981 :: 		Settings.LinesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Settings+72)
MOVT	R0, #hi_addr(_Settings+72)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,982 :: 		Settings.ObjectsCount              = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Settings+6)
MOVT	R0, #hi_addr(_Settings+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,984 :: 		Set_clock.Color                     = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_clock+0)
MOVT	R0, #hi_addr(_Set_clock+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,985 :: 		Set_clock.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Set_clock+2)
MOVT	R0, #hi_addr(_Set_clock+2)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,986 :: 		Set_clock.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Set_clock+4)
MOVT	R0, #hi_addr(_Set_clock+4)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,987 :: 		Set_clock.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_clock+8)
MOVT	R0, #hi_addr(_Set_clock+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,988 :: 		Set_clock.LabelsCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Set_clock+16)
MOVT	R0, #hi_addr(_Set_clock+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,989 :: 		Set_clock.Labels                    = Screen5_Labels;
MOVW	R1, #lo_addr(_Screen5_Labels+0)
MOVT	R1, #hi_addr(_Screen5_Labels+0)
MOVW	R0, #lo_addr(_Set_clock+20)
MOVT	R0, #hi_addr(_Set_clock+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,990 :: 		Set_clock.ImagesCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Set_clock+24)
MOVT	R0, #hi_addr(_Set_clock+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,991 :: 		Set_clock.Images                    = Screen5_Images;
MOVW	R1, #lo_addr(_Screen5_Images+0)
MOVT	R1, #hi_addr(_Screen5_Images+0)
MOVW	R0, #lo_addr(_Set_clock+28)
MOVT	R0, #hi_addr(_Set_clock+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,992 :: 		Set_clock.CImagesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_clock+32)
MOVT	R0, #hi_addr(_Set_clock+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,993 :: 		Set_clock.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_clock+40)
MOVT	R0, #hi_addr(_Set_clock+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,994 :: 		Set_clock.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_clock+48)
MOVT	R0, #hi_addr(_Set_clock+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,995 :: 		Set_clock.BoxesCount                = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Set_clock+56)
MOVT	R0, #hi_addr(_Set_clock+56)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,996 :: 		Set_clock.Boxes                     = Screen5_Boxes;
MOVW	R1, #lo_addr(_Screen5_Boxes+0)
MOVT	R1, #hi_addr(_Screen5_Boxes+0)
MOVW	R0, #lo_addr(_Set_clock+60)
MOVT	R0, #hi_addr(_Set_clock+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,997 :: 		Set_clock.CBoxesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_clock+64)
MOVT	R0, #hi_addr(_Set_clock+64)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,998 :: 		Set_clock.LinesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Set_clock+72)
MOVT	R0, #hi_addr(_Set_clock+72)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,999 :: 		Set_clock.ObjectsCount              = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Set_clock+6)
MOVT	R0, #hi_addr(_Set_clock+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1001 :: 		IMU_test.Color                     = 0x5AEB;
MOVW	R1, #23275
MOVW	R0, #lo_addr(_IMU_test+0)
MOVT	R0, #hi_addr(_IMU_test+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1002 :: 		IMU_test.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_IMU_test+2)
MOVT	R0, #hi_addr(_IMU_test+2)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1003 :: 		IMU_test.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_IMU_test+4)
MOVT	R0, #hi_addr(_IMU_test+4)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1004 :: 		IMU_test.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_IMU_test+8)
MOVT	R0, #hi_addr(_IMU_test+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1005 :: 		IMU_test.LabelsCount               = 29;
MOVS	R1, #29
MOVW	R0, #lo_addr(_IMU_test+16)
MOVT	R0, #hi_addr(_IMU_test+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1006 :: 		IMU_test.Labels                    = Screen6_Labels;
MOVW	R1, #lo_addr(_Screen6_Labels+0)
MOVT	R1, #hi_addr(_Screen6_Labels+0)
MOVW	R0, #lo_addr(_IMU_test+20)
MOVT	R0, #hi_addr(_IMU_test+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1007 :: 		IMU_test.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_IMU_test+24)
MOVT	R0, #hi_addr(_IMU_test+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1008 :: 		IMU_test.Images                    = Screen6_Images;
MOVW	R1, #lo_addr(_Screen6_Images+0)
MOVT	R1, #hi_addr(_Screen6_Images+0)
MOVW	R0, #lo_addr(_IMU_test+28)
MOVT	R0, #hi_addr(_IMU_test+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1009 :: 		IMU_test.CImagesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_IMU_test+32)
MOVT	R0, #hi_addr(_IMU_test+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1010 :: 		IMU_test.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_IMU_test+40)
MOVT	R0, #hi_addr(_IMU_test+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1011 :: 		IMU_test.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_IMU_test+48)
MOVT	R0, #hi_addr(_IMU_test+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1012 :: 		IMU_test.BoxesCount                = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_IMU_test+56)
MOVT	R0, #hi_addr(_IMU_test+56)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1013 :: 		IMU_test.Boxes                     = Screen6_Boxes;
MOVW	R1, #lo_addr(_Screen6_Boxes+0)
MOVT	R1, #hi_addr(_Screen6_Boxes+0)
MOVW	R0, #lo_addr(_IMU_test+60)
MOVT	R0, #hi_addr(_IMU_test+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1014 :: 		IMU_test.CBoxesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_IMU_test+64)
MOVT	R0, #hi_addr(_IMU_test+64)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1015 :: 		IMU_test.LinesCount                = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_IMU_test+72)
MOVT	R0, #hi_addr(_IMU_test+72)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1016 :: 		IMU_test.Lines                     = Screen6_Lines;
MOVW	R1, #lo_addr(_Screen6_Lines+0)
MOVT	R1, #hi_addr(_Screen6_Lines+0)
MOVW	R0, #lo_addr(_IMU_test+76)
MOVT	R0, #hi_addr(_IMU_test+76)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1017 :: 		IMU_test.ObjectsCount              = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_IMU_test+6)
MOVT	R0, #hi_addr(_IMU_test+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1019 :: 		GPS_Test.Color                     = 0x5AEB;
MOVW	R1, #23275
MOVW	R0, #lo_addr(_GPS_Test+0)
MOVT	R0, #hi_addr(_GPS_Test+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1020 :: 		GPS_Test.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_GPS_Test+2)
MOVT	R0, #hi_addr(_GPS_Test+2)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1021 :: 		GPS_Test.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_GPS_Test+4)
MOVT	R0, #hi_addr(_GPS_Test+4)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1022 :: 		GPS_Test.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_GPS_Test+8)
MOVT	R0, #hi_addr(_GPS_Test+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1023 :: 		GPS_Test.LabelsCount               = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_GPS_Test+16)
MOVT	R0, #hi_addr(_GPS_Test+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1024 :: 		GPS_Test.Labels                    = Screen7_Labels;
MOVW	R1, #lo_addr(_Screen7_Labels+0)
MOVT	R1, #hi_addr(_Screen7_Labels+0)
MOVW	R0, #lo_addr(_GPS_Test+20)
MOVT	R0, #hi_addr(_GPS_Test+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1025 :: 		GPS_Test.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_GPS_Test+24)
MOVT	R0, #hi_addr(_GPS_Test+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1026 :: 		GPS_Test.Images                    = Screen7_Images;
MOVW	R1, #lo_addr(_Screen7_Images+0)
MOVT	R1, #hi_addr(_Screen7_Images+0)
MOVW	R0, #lo_addr(_GPS_Test+28)
MOVT	R0, #hi_addr(_GPS_Test+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1027 :: 		GPS_Test.CImagesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_GPS_Test+32)
MOVT	R0, #hi_addr(_GPS_Test+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1028 :: 		GPS_Test.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_GPS_Test+40)
MOVT	R0, #hi_addr(_GPS_Test+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1029 :: 		GPS_Test.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_GPS_Test+48)
MOVT	R0, #hi_addr(_GPS_Test+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1030 :: 		GPS_Test.BoxesCount                = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_GPS_Test+56)
MOVT	R0, #hi_addr(_GPS_Test+56)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1031 :: 		GPS_Test.Boxes                     = Screen7_Boxes;
MOVW	R1, #lo_addr(_Screen7_Boxes+0)
MOVT	R1, #hi_addr(_Screen7_Boxes+0)
MOVW	R0, #lo_addr(_GPS_Test+60)
MOVT	R0, #hi_addr(_GPS_Test+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1032 :: 		GPS_Test.CBoxesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_GPS_Test+64)
MOVT	R0, #hi_addr(_GPS_Test+64)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1033 :: 		GPS_Test.LinesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_GPS_Test+72)
MOVT	R0, #hi_addr(_GPS_Test+72)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1034 :: 		GPS_Test.ObjectsCount              = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_GPS_Test+6)
MOVT	R0, #hi_addr(_GPS_Test+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1036 :: 		Pressure_test.Color                     = 0x5AEB;
MOVW	R1, #23275
MOVW	R0, #lo_addr(_Pressure_test+0)
MOVT	R0, #hi_addr(_Pressure_test+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1037 :: 		Pressure_test.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Pressure_test+2)
MOVT	R0, #hi_addr(_Pressure_test+2)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1038 :: 		Pressure_test.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Pressure_test+4)
MOVT	R0, #hi_addr(_Pressure_test+4)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1039 :: 		Pressure_test.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pressure_test+8)
MOVT	R0, #hi_addr(_Pressure_test+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1040 :: 		Pressure_test.LabelsCount               = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Pressure_test+16)
MOVT	R0, #hi_addr(_Pressure_test+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1041 :: 		Pressure_test.Labels                    = Screen8_Labels;
MOVW	R1, #lo_addr(_Screen8_Labels+0)
MOVT	R1, #hi_addr(_Screen8_Labels+0)
MOVW	R0, #lo_addr(_Pressure_test+20)
MOVT	R0, #hi_addr(_Pressure_test+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1042 :: 		Pressure_test.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Pressure_test+24)
MOVT	R0, #hi_addr(_Pressure_test+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1043 :: 		Pressure_test.Images                    = Screen8_Images;
MOVW	R1, #lo_addr(_Screen8_Images+0)
MOVT	R1, #hi_addr(_Screen8_Images+0)
MOVW	R0, #lo_addr(_Pressure_test+28)
MOVT	R0, #hi_addr(_Pressure_test+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1044 :: 		Pressure_test.CImagesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pressure_test+32)
MOVT	R0, #hi_addr(_Pressure_test+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1045 :: 		Pressure_test.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pressure_test+40)
MOVT	R0, #hi_addr(_Pressure_test+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1046 :: 		Pressure_test.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pressure_test+48)
MOVT	R0, #hi_addr(_Pressure_test+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1047 :: 		Pressure_test.BoxesCount                = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Pressure_test+56)
MOVT	R0, #hi_addr(_Pressure_test+56)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1048 :: 		Pressure_test.Boxes                     = Screen8_Boxes;
MOVW	R1, #lo_addr(_Screen8_Boxes+0)
MOVT	R1, #hi_addr(_Screen8_Boxes+0)
MOVW	R0, #lo_addr(_Pressure_test+60)
MOVT	R0, #hi_addr(_Pressure_test+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1049 :: 		Pressure_test.CBoxesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pressure_test+64)
MOVT	R0, #hi_addr(_Pressure_test+64)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1050 :: 		Pressure_test.LinesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pressure_test+72)
MOVT	R0, #hi_addr(_Pressure_test+72)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1051 :: 		Pressure_test.ObjectsCount              = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Pressure_test+6)
MOVT	R0, #hi_addr(_Pressure_test+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1053 :: 		Humidity_test.Color                     = 0x5AEB;
MOVW	R1, #23275
MOVW	R0, #lo_addr(_Humidity_test+0)
MOVT	R0, #hi_addr(_Humidity_test+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1054 :: 		Humidity_test.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Humidity_test+2)
MOVT	R0, #hi_addr(_Humidity_test+2)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1055 :: 		Humidity_test.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Humidity_test+4)
MOVT	R0, #hi_addr(_Humidity_test+4)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1056 :: 		Humidity_test.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Humidity_test+8)
MOVT	R0, #hi_addr(_Humidity_test+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1057 :: 		Humidity_test.LabelsCount               = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Humidity_test+16)
MOVT	R0, #hi_addr(_Humidity_test+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1058 :: 		Humidity_test.Labels                    = Screen9_Labels;
MOVW	R1, #lo_addr(_Screen9_Labels+0)
MOVT	R1, #hi_addr(_Screen9_Labels+0)
MOVW	R0, #lo_addr(_Humidity_test+20)
MOVT	R0, #hi_addr(_Humidity_test+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1059 :: 		Humidity_test.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Humidity_test+24)
MOVT	R0, #hi_addr(_Humidity_test+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1060 :: 		Humidity_test.Images                    = Screen9_Images;
MOVW	R1, #lo_addr(_Screen9_Images+0)
MOVT	R1, #hi_addr(_Screen9_Images+0)
MOVW	R0, #lo_addr(_Humidity_test+28)
MOVT	R0, #hi_addr(_Humidity_test+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1061 :: 		Humidity_test.CImagesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Humidity_test+32)
MOVT	R0, #hi_addr(_Humidity_test+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1062 :: 		Humidity_test.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Humidity_test+40)
MOVT	R0, #hi_addr(_Humidity_test+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1063 :: 		Humidity_test.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Humidity_test+48)
MOVT	R0, #hi_addr(_Humidity_test+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1064 :: 		Humidity_test.BoxesCount                = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Humidity_test+56)
MOVT	R0, #hi_addr(_Humidity_test+56)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1065 :: 		Humidity_test.Boxes                     = Screen9_Boxes;
MOVW	R1, #lo_addr(_Screen9_Boxes+0)
MOVT	R1, #hi_addr(_Screen9_Boxes+0)
MOVW	R0, #lo_addr(_Humidity_test+60)
MOVT	R0, #hi_addr(_Humidity_test+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1066 :: 		Humidity_test.CBoxesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Humidity_test+64)
MOVT	R0, #hi_addr(_Humidity_test+64)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1067 :: 		Humidity_test.LinesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Humidity_test+72)
MOVT	R0, #hi_addr(_Humidity_test+72)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1068 :: 		Humidity_test.ObjectsCount              = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Humidity_test+6)
MOVT	R0, #hi_addr(_Humidity_test+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1071 :: 		Image1.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image1+0)
MOVT	R0, #hi_addr(_Image1+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1072 :: 		Image1.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+4)
MOVT	R0, #hi_addr(_Image1+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1073 :: 		Image1.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image1+6)
MOVT	R0, #hi_addr(_Image1+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1074 :: 		Image1.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+8)
MOVT	R0, #hi_addr(_Image1+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1075 :: 		Image1.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image1+10)
MOVT	R0, #hi_addr(_Image1+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1076 :: 		Image1.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image1+12)
MOVT	R0, #hi_addr(_Image1+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1077 :: 		Image1.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+22)
MOVT	R0, #hi_addr(_Image1+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1078 :: 		Image1.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+23)
MOVT	R0, #hi_addr(_Image1+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1079 :: 		Image1.Picture_Name    = logo00_jpg;
MOVW	R1, #28016
MOVT	R1, #1
MOVW	R0, #lo_addr(_Image1+16)
MOVT	R0, #hi_addr(_Image1+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1080 :: 		Image1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+20)
MOVT	R0, #hi_addr(_Image1+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1081 :: 		Image1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+21)
MOVT	R0, #hi_addr(_Image1+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1082 :: 		Image1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+24)
MOVT	R0, #hi_addr(_Image1+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1083 :: 		Image1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+28)
MOVT	R0, #hi_addr(_Image1+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1084 :: 		Image1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+32)
MOVT	R0, #hi_addr(_Image1+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1085 :: 		Image1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+36)
MOVT	R0, #hi_addr(_Image1+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1087 :: 		Image2.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image2+0)
MOVT	R0, #hi_addr(_Image2+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1088 :: 		Image2.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+4)
MOVT	R0, #hi_addr(_Image2+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1089 :: 		Image2.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image2+6)
MOVT	R0, #hi_addr(_Image2+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1090 :: 		Image2.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+8)
MOVT	R0, #hi_addr(_Image2+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1091 :: 		Image2.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image2+10)
MOVT	R0, #hi_addr(_Image2+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1092 :: 		Image2.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image2+12)
MOVT	R0, #hi_addr(_Image2+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1093 :: 		Image2.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+22)
MOVT	R0, #hi_addr(_Image2+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1094 :: 		Image2.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+23)
MOVT	R0, #hi_addr(_Image2+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1095 :: 		Image2.Picture_Name    = logo01_jpg;
MOVW	R1, #27924
MOVT	R1, #3
MOVW	R0, #lo_addr(_Image2+16)
MOVT	R0, #hi_addr(_Image2+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1096 :: 		Image2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+20)
MOVT	R0, #hi_addr(_Image2+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1097 :: 		Image2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+21)
MOVT	R0, #hi_addr(_Image2+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1098 :: 		Image2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+24)
MOVT	R0, #hi_addr(_Image2+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1099 :: 		Image2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+28)
MOVT	R0, #hi_addr(_Image2+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1100 :: 		Image2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+32)
MOVT	R0, #hi_addr(_Image2+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1101 :: 		Image2.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+36)
MOVT	R0, #hi_addr(_Image2+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1103 :: 		Image10.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1104 :: 		Image10.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image10+4)
MOVT	R0, #hi_addr(_Image10+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1105 :: 		Image10.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image10+6)
MOVT	R0, #hi_addr(_Image10+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1106 :: 		Image10.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+8)
MOVT	R0, #hi_addr(_Image10+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1107 :: 		Image10.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image10+10)
MOVT	R0, #hi_addr(_Image10+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1108 :: 		Image10.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image10+12)
MOVT	R0, #hi_addr(_Image10+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1109 :: 		Image10.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image10+22)
MOVT	R0, #hi_addr(_Image10+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1110 :: 		Image10.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image10+23)
MOVT	R0, #hi_addr(_Image10+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1111 :: 		Image10.Picture_Name    = logo02_jpg;
MOVW	R1, #27832
MOVT	R1, #5
MOVW	R0, #lo_addr(_Image10+16)
MOVT	R0, #hi_addr(_Image10+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1112 :: 		Image10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image10+20)
MOVT	R0, #hi_addr(_Image10+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1113 :: 		Image10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image10+21)
MOVT	R0, #hi_addr(_Image10+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1114 :: 		Image10.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+24)
MOVT	R0, #hi_addr(_Image10+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1115 :: 		Image10.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+28)
MOVT	R0, #hi_addr(_Image10+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1116 :: 		Image10.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+32)
MOVT	R0, #hi_addr(_Image10+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1117 :: 		Image10.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+36)
MOVT	R0, #hi_addr(_Image10+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1119 :: 		Image11.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image11+0)
MOVT	R0, #hi_addr(_Image11+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1120 :: 		Image11.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Image11+4)
MOVT	R0, #hi_addr(_Image11+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1121 :: 		Image11.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image11+6)
MOVT	R0, #hi_addr(_Image11+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1122 :: 		Image11.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image11+8)
MOVT	R0, #hi_addr(_Image11+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1123 :: 		Image11.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image11+10)
MOVT	R0, #hi_addr(_Image11+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1124 :: 		Image11.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image11+12)
MOVT	R0, #hi_addr(_Image11+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1125 :: 		Image11.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image11+22)
MOVT	R0, #hi_addr(_Image11+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1126 :: 		Image11.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image11+23)
MOVT	R0, #hi_addr(_Image11+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1127 :: 		Image11.Picture_Name    = logo03_jpg;
MOVW	R1, #27740
MOVT	R1, #7
MOVW	R0, #lo_addr(_Image11+16)
MOVT	R0, #hi_addr(_Image11+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1128 :: 		Image11.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image11+20)
MOVT	R0, #hi_addr(_Image11+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1129 :: 		Image11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image11+21)
MOVT	R0, #hi_addr(_Image11+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1130 :: 		Image11.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image11+24)
MOVT	R0, #hi_addr(_Image11+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1131 :: 		Image11.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image11+28)
MOVT	R0, #hi_addr(_Image11+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1132 :: 		Image11.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image11+32)
MOVT	R0, #hi_addr(_Image11+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1133 :: 		Image11.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image11+36)
MOVT	R0, #hi_addr(_Image11+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1135 :: 		Image12.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image12+0)
MOVT	R0, #hi_addr(_Image12+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1136 :: 		Image12.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Image12+4)
MOVT	R0, #hi_addr(_Image12+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1137 :: 		Image12.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image12+6)
MOVT	R0, #hi_addr(_Image12+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1138 :: 		Image12.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+8)
MOVT	R0, #hi_addr(_Image12+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1139 :: 		Image12.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image12+10)
MOVT	R0, #hi_addr(_Image12+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1140 :: 		Image12.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image12+12)
MOVT	R0, #hi_addr(_Image12+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1141 :: 		Image12.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image12+22)
MOVT	R0, #hi_addr(_Image12+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1142 :: 		Image12.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image12+23)
MOVT	R0, #hi_addr(_Image12+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1143 :: 		Image12.Picture_Name    = logo04_jpg;
MOVW	R1, #27648
MOVT	R1, #9
MOVW	R0, #lo_addr(_Image12+16)
MOVT	R0, #hi_addr(_Image12+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1144 :: 		Image12.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image12+20)
MOVT	R0, #hi_addr(_Image12+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1145 :: 		Image12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image12+21)
MOVT	R0, #hi_addr(_Image12+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1146 :: 		Image12.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+24)
MOVT	R0, #hi_addr(_Image12+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1147 :: 		Image12.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+28)
MOVT	R0, #hi_addr(_Image12+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1148 :: 		Image12.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+32)
MOVT	R0, #hi_addr(_Image12+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1149 :: 		Image12.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+36)
MOVT	R0, #hi_addr(_Image12+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1151 :: 		Image16.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image16+0)
MOVT	R0, #hi_addr(_Image16+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1152 :: 		Image16.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image16+4)
MOVT	R0, #hi_addr(_Image16+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1153 :: 		Image16.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image16+6)
MOVT	R0, #hi_addr(_Image16+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1154 :: 		Image16.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image16+8)
MOVT	R0, #hi_addr(_Image16+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1155 :: 		Image16.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image16+10)
MOVT	R0, #hi_addr(_Image16+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1156 :: 		Image16.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image16+12)
MOVT	R0, #hi_addr(_Image16+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1157 :: 		Image16.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image16+22)
MOVT	R0, #hi_addr(_Image16+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1158 :: 		Image16.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image16+23)
MOVT	R0, #hi_addr(_Image16+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1159 :: 		Image16.Picture_Name    = logo05_jpg;
MOVW	R1, #27556
MOVT	R1, #11
MOVW	R0, #lo_addr(_Image16+16)
MOVT	R0, #hi_addr(_Image16+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1160 :: 		Image16.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image16+20)
MOVT	R0, #hi_addr(_Image16+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1161 :: 		Image16.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image16+21)
MOVT	R0, #hi_addr(_Image16+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1162 :: 		Image16.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image16+24)
MOVT	R0, #hi_addr(_Image16+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1163 :: 		Image16.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image16+28)
MOVT	R0, #hi_addr(_Image16+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1164 :: 		Image16.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image16+32)
MOVT	R0, #hi_addr(_Image16+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1165 :: 		Image16.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image16+36)
MOVT	R0, #hi_addr(_Image16+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1167 :: 		Image17.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image17+0)
MOVT	R0, #hi_addr(_Image17+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1168 :: 		Image17.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image17+4)
MOVT	R0, #hi_addr(_Image17+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1169 :: 		Image17.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image17+6)
MOVT	R0, #hi_addr(_Image17+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1170 :: 		Image17.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+8)
MOVT	R0, #hi_addr(_Image17+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1171 :: 		Image17.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image17+10)
MOVT	R0, #hi_addr(_Image17+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1172 :: 		Image17.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image17+12)
MOVT	R0, #hi_addr(_Image17+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1173 :: 		Image17.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image17+22)
MOVT	R0, #hi_addr(_Image17+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1174 :: 		Image17.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image17+23)
MOVT	R0, #hi_addr(_Image17+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1175 :: 		Image17.Picture_Name    = logo06_jpg;
MOVW	R1, #27464
MOVT	R1, #13
MOVW	R0, #lo_addr(_Image17+16)
MOVT	R0, #hi_addr(_Image17+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1176 :: 		Image17.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image17+20)
MOVT	R0, #hi_addr(_Image17+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1177 :: 		Image17.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image17+21)
MOVT	R0, #hi_addr(_Image17+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1178 :: 		Image17.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+24)
MOVT	R0, #hi_addr(_Image17+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1179 :: 		Image17.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+28)
MOVT	R0, #hi_addr(_Image17+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1180 :: 		Image17.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+32)
MOVT	R0, #hi_addr(_Image17+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1181 :: 		Image17.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+36)
MOVT	R0, #hi_addr(_Image17+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1183 :: 		Image21.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image21+0)
MOVT	R0, #hi_addr(_Image21+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1184 :: 		Image21.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Image21+4)
MOVT	R0, #hi_addr(_Image21+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1185 :: 		Image21.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image21+6)
MOVT	R0, #hi_addr(_Image21+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1186 :: 		Image21.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+8)
MOVT	R0, #hi_addr(_Image21+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1187 :: 		Image21.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image21+10)
MOVT	R0, #hi_addr(_Image21+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1188 :: 		Image21.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image21+12)
MOVT	R0, #hi_addr(_Image21+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1189 :: 		Image21.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image21+22)
MOVT	R0, #hi_addr(_Image21+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1190 :: 		Image21.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image21+23)
MOVT	R0, #hi_addr(_Image21+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1191 :: 		Image21.Picture_Name    = logo07_jpg;
MOVW	R1, #27372
MOVT	R1, #15
MOVW	R0, #lo_addr(_Image21+16)
MOVT	R0, #hi_addr(_Image21+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1192 :: 		Image21.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image21+20)
MOVT	R0, #hi_addr(_Image21+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1193 :: 		Image21.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image21+21)
MOVT	R0, #hi_addr(_Image21+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1194 :: 		Image21.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+24)
MOVT	R0, #hi_addr(_Image21+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1195 :: 		Image21.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+28)
MOVT	R0, #hi_addr(_Image21+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1196 :: 		Image21.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+32)
MOVT	R0, #hi_addr(_Image21+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1197 :: 		Image21.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+36)
MOVT	R0, #hi_addr(_Image21+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1199 :: 		Image22.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image22+0)
MOVT	R0, #hi_addr(_Image22+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1200 :: 		Image22.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Image22+4)
MOVT	R0, #hi_addr(_Image22+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1201 :: 		Image22.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image22+6)
MOVT	R0, #hi_addr(_Image22+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1202 :: 		Image22.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+8)
MOVT	R0, #hi_addr(_Image22+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1203 :: 		Image22.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image22+10)
MOVT	R0, #hi_addr(_Image22+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1204 :: 		Image22.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image22+12)
MOVT	R0, #hi_addr(_Image22+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1205 :: 		Image22.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image22+22)
MOVT	R0, #hi_addr(_Image22+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1206 :: 		Image22.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image22+23)
MOVT	R0, #hi_addr(_Image22+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1207 :: 		Image22.Picture_Name    = logo08_jpg;
MOVW	R1, #27280
MOVT	R1, #17
MOVW	R0, #lo_addr(_Image22+16)
MOVT	R0, #hi_addr(_Image22+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1208 :: 		Image22.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image22+20)
MOVT	R0, #hi_addr(_Image22+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1209 :: 		Image22.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image22+21)
MOVT	R0, #hi_addr(_Image22+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1210 :: 		Image22.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+24)
MOVT	R0, #hi_addr(_Image22+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1211 :: 		Image22.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+28)
MOVT	R0, #hi_addr(_Image22+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1212 :: 		Image22.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+32)
MOVT	R0, #hi_addr(_Image22+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1213 :: 		Image22.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+36)
MOVT	R0, #hi_addr(_Image22+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1215 :: 		Image23.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image23+0)
MOVT	R0, #hi_addr(_Image23+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1216 :: 		Image23.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Image23+4)
MOVT	R0, #hi_addr(_Image23+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1217 :: 		Image23.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image23+6)
MOVT	R0, #hi_addr(_Image23+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1218 :: 		Image23.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image23+8)
MOVT	R0, #hi_addr(_Image23+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1219 :: 		Image23.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image23+10)
MOVT	R0, #hi_addr(_Image23+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1220 :: 		Image23.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image23+12)
MOVT	R0, #hi_addr(_Image23+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1221 :: 		Image23.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image23+22)
MOVT	R0, #hi_addr(_Image23+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1222 :: 		Image23.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image23+23)
MOVT	R0, #hi_addr(_Image23+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1223 :: 		Image23.Picture_Name    = logo09_jpg;
MOVW	R1, #27188
MOVT	R1, #19
MOVW	R0, #lo_addr(_Image23+16)
MOVT	R0, #hi_addr(_Image23+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1224 :: 		Image23.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image23+20)
MOVT	R0, #hi_addr(_Image23+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1225 :: 		Image23.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image23+21)
MOVT	R0, #hi_addr(_Image23+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1226 :: 		Image23.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image23+24)
MOVT	R0, #hi_addr(_Image23+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1227 :: 		Image23.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image23+28)
MOVT	R0, #hi_addr(_Image23+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1228 :: 		Image23.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image23+32)
MOVT	R0, #hi_addr(_Image23+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1229 :: 		Image23.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image23+36)
MOVT	R0, #hi_addr(_Image23+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1231 :: 		Image24.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image24+0)
MOVT	R0, #hi_addr(_Image24+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1232 :: 		Image24.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Image24+4)
MOVT	R0, #hi_addr(_Image24+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1233 :: 		Image24.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image24+6)
MOVT	R0, #hi_addr(_Image24+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1234 :: 		Image24.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+8)
MOVT	R0, #hi_addr(_Image24+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1235 :: 		Image24.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image24+10)
MOVT	R0, #hi_addr(_Image24+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1236 :: 		Image24.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image24+12)
MOVT	R0, #hi_addr(_Image24+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1237 :: 		Image24.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image24+22)
MOVT	R0, #hi_addr(_Image24+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1238 :: 		Image24.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image24+23)
MOVT	R0, #hi_addr(_Image24+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1239 :: 		Image24.Picture_Name    = logo10_jpg;
MOVW	R1, #27096
MOVT	R1, #21
MOVW	R0, #lo_addr(_Image24+16)
MOVT	R0, #hi_addr(_Image24+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1240 :: 		Image24.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image24+20)
MOVT	R0, #hi_addr(_Image24+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1241 :: 		Image24.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image24+21)
MOVT	R0, #hi_addr(_Image24+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1242 :: 		Image24.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+24)
MOVT	R0, #hi_addr(_Image24+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1243 :: 		Image24.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+28)
MOVT	R0, #hi_addr(_Image24+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1244 :: 		Image24.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+32)
MOVT	R0, #hi_addr(_Image24+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1245 :: 		Image24.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+36)
MOVT	R0, #hi_addr(_Image24+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1247 :: 		Image25.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image25+0)
MOVT	R0, #hi_addr(_Image25+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1248 :: 		Image25.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Image25+4)
MOVT	R0, #hi_addr(_Image25+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1249 :: 		Image25.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image25+6)
MOVT	R0, #hi_addr(_Image25+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1250 :: 		Image25.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+8)
MOVT	R0, #hi_addr(_Image25+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1251 :: 		Image25.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image25+10)
MOVT	R0, #hi_addr(_Image25+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1252 :: 		Image25.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image25+12)
MOVT	R0, #hi_addr(_Image25+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1253 :: 		Image25.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image25+22)
MOVT	R0, #hi_addr(_Image25+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1254 :: 		Image25.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image25+23)
MOVT	R0, #hi_addr(_Image25+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1255 :: 		Image25.Picture_Name    = logo11_jpg;
MOVW	R1, #27004
MOVT	R1, #23
MOVW	R0, #lo_addr(_Image25+16)
MOVT	R0, #hi_addr(_Image25+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1256 :: 		Image25.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image25+20)
MOVT	R0, #hi_addr(_Image25+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1257 :: 		Image25.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image25+21)
MOVT	R0, #hi_addr(_Image25+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1258 :: 		Image25.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+24)
MOVT	R0, #hi_addr(_Image25+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1259 :: 		Image25.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+28)
MOVT	R0, #hi_addr(_Image25+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1260 :: 		Image25.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+32)
MOVT	R0, #hi_addr(_Image25+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1261 :: 		Image25.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+36)
MOVT	R0, #hi_addr(_Image25+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1263 :: 		Image26.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image26+0)
MOVT	R0, #hi_addr(_Image26+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1264 :: 		Image26.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Image26+4)
MOVT	R0, #hi_addr(_Image26+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1265 :: 		Image26.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image26+6)
MOVT	R0, #hi_addr(_Image26+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1266 :: 		Image26.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image26+8)
MOVT	R0, #hi_addr(_Image26+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1267 :: 		Image26.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image26+10)
MOVT	R0, #hi_addr(_Image26+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1268 :: 		Image26.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image26+12)
MOVT	R0, #hi_addr(_Image26+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1269 :: 		Image26.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image26+22)
MOVT	R0, #hi_addr(_Image26+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1270 :: 		Image26.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image26+23)
MOVT	R0, #hi_addr(_Image26+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1271 :: 		Image26.Picture_Name    = logo12_jpg;
MOVW	R1, #26912
MOVT	R1, #25
MOVW	R0, #lo_addr(_Image26+16)
MOVT	R0, #hi_addr(_Image26+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1272 :: 		Image26.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image26+20)
MOVT	R0, #hi_addr(_Image26+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1273 :: 		Image26.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image26+21)
MOVT	R0, #hi_addr(_Image26+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1274 :: 		Image26.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image26+24)
MOVT	R0, #hi_addr(_Image26+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1275 :: 		Image26.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image26+28)
MOVT	R0, #hi_addr(_Image26+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1276 :: 		Image26.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image26+32)
MOVT	R0, #hi_addr(_Image26+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1277 :: 		Image26.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image26+36)
MOVT	R0, #hi_addr(_Image26+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1279 :: 		Image27.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image27+0)
MOVT	R0, #hi_addr(_Image27+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1280 :: 		Image27.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Image27+4)
MOVT	R0, #hi_addr(_Image27+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1281 :: 		Image27.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image27+6)
MOVT	R0, #hi_addr(_Image27+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1282 :: 		Image27.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+8)
MOVT	R0, #hi_addr(_Image27+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1283 :: 		Image27.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image27+10)
MOVT	R0, #hi_addr(_Image27+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1284 :: 		Image27.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image27+12)
MOVT	R0, #hi_addr(_Image27+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1285 :: 		Image27.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image27+22)
MOVT	R0, #hi_addr(_Image27+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1286 :: 		Image27.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image27+23)
MOVT	R0, #hi_addr(_Image27+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1287 :: 		Image27.Picture_Name    = logo13_jpg;
MOVW	R1, #26820
MOVT	R1, #27
MOVW	R0, #lo_addr(_Image27+16)
MOVT	R0, #hi_addr(_Image27+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1288 :: 		Image27.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image27+20)
MOVT	R0, #hi_addr(_Image27+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1289 :: 		Image27.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image27+21)
MOVT	R0, #hi_addr(_Image27+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1290 :: 		Image27.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+24)
MOVT	R0, #hi_addr(_Image27+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1291 :: 		Image27.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+28)
MOVT	R0, #hi_addr(_Image27+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1292 :: 		Image27.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+32)
MOVT	R0, #hi_addr(_Image27+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1293 :: 		Image27.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+36)
MOVT	R0, #hi_addr(_Image27+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1295 :: 		Image28.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image28+0)
MOVT	R0, #hi_addr(_Image28+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1296 :: 		Image28.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Image28+4)
MOVT	R0, #hi_addr(_Image28+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1297 :: 		Image28.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image28+6)
MOVT	R0, #hi_addr(_Image28+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1298 :: 		Image28.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image28+8)
MOVT	R0, #hi_addr(_Image28+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1299 :: 		Image28.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image28+10)
MOVT	R0, #hi_addr(_Image28+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1300 :: 		Image28.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image28+12)
MOVT	R0, #hi_addr(_Image28+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1301 :: 		Image28.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image28+22)
MOVT	R0, #hi_addr(_Image28+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1302 :: 		Image28.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image28+23)
MOVT	R0, #hi_addr(_Image28+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1303 :: 		Image28.Picture_Name    = logo14_jpg;
MOVW	R1, #26728
MOVT	R1, #29
MOVW	R0, #lo_addr(_Image28+16)
MOVT	R0, #hi_addr(_Image28+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1304 :: 		Image28.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image28+20)
MOVT	R0, #hi_addr(_Image28+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1305 :: 		Image28.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image28+21)
MOVT	R0, #hi_addr(_Image28+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1306 :: 		Image28.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image28+24)
MOVT	R0, #hi_addr(_Image28+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1307 :: 		Image28.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image28+28)
MOVT	R0, #hi_addr(_Image28+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1308 :: 		Image28.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image28+32)
MOVT	R0, #hi_addr(_Image28+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1309 :: 		Image28.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image28+36)
MOVT	R0, #hi_addr(_Image28+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1311 :: 		Image29.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image29+0)
MOVT	R0, #hi_addr(_Image29+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1312 :: 		Image29.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Image29+4)
MOVT	R0, #hi_addr(_Image29+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1313 :: 		Image29.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image29+6)
MOVT	R0, #hi_addr(_Image29+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1314 :: 		Image29.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+8)
MOVT	R0, #hi_addr(_Image29+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1315 :: 		Image29.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image29+10)
MOVT	R0, #hi_addr(_Image29+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1316 :: 		Image29.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image29+12)
MOVT	R0, #hi_addr(_Image29+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1317 :: 		Image29.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image29+22)
MOVT	R0, #hi_addr(_Image29+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1318 :: 		Image29.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image29+23)
MOVT	R0, #hi_addr(_Image29+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1319 :: 		Image29.Picture_Name    = logo15_jpg;
MOVW	R1, #26636
MOVT	R1, #31
MOVW	R0, #lo_addr(_Image29+16)
MOVT	R0, #hi_addr(_Image29+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1320 :: 		Image29.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image29+20)
MOVT	R0, #hi_addr(_Image29+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1321 :: 		Image29.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image29+21)
MOVT	R0, #hi_addr(_Image29+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1322 :: 		Image29.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+24)
MOVT	R0, #hi_addr(_Image29+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1323 :: 		Image29.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+28)
MOVT	R0, #hi_addr(_Image29+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1324 :: 		Image29.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+32)
MOVT	R0, #hi_addr(_Image29+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1325 :: 		Image29.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+36)
MOVT	R0, #hi_addr(_Image29+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1327 :: 		Image30.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image30+0)
MOVT	R0, #hi_addr(_Image30+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1328 :: 		Image30.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Image30+4)
MOVT	R0, #hi_addr(_Image30+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1329 :: 		Image30.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image30+6)
MOVT	R0, #hi_addr(_Image30+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1330 :: 		Image30.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image30+8)
MOVT	R0, #hi_addr(_Image30+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1331 :: 		Image30.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image30+10)
MOVT	R0, #hi_addr(_Image30+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1332 :: 		Image30.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image30+12)
MOVT	R0, #hi_addr(_Image30+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1333 :: 		Image30.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image30+22)
MOVT	R0, #hi_addr(_Image30+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1334 :: 		Image30.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image30+23)
MOVT	R0, #hi_addr(_Image30+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1335 :: 		Image30.Picture_Name    = logo16_jpg;
MOVW	R1, #26544
MOVT	R1, #33
MOVW	R0, #lo_addr(_Image30+16)
MOVT	R0, #hi_addr(_Image30+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1336 :: 		Image30.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image30+20)
MOVT	R0, #hi_addr(_Image30+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1337 :: 		Image30.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image30+21)
MOVT	R0, #hi_addr(_Image30+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1338 :: 		Image30.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image30+24)
MOVT	R0, #hi_addr(_Image30+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1339 :: 		Image30.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image30+28)
MOVT	R0, #hi_addr(_Image30+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1340 :: 		Image30.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image30+32)
MOVT	R0, #hi_addr(_Image30+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1341 :: 		Image30.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image30+36)
MOVT	R0, #hi_addr(_Image30+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1343 :: 		Image31.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image31+0)
MOVT	R0, #hi_addr(_Image31+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1344 :: 		Image31.Order           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Image31+4)
MOVT	R0, #hi_addr(_Image31+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1345 :: 		Image31.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image31+6)
MOVT	R0, #hi_addr(_Image31+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1346 :: 		Image31.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image31+8)
MOVT	R0, #hi_addr(_Image31+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1347 :: 		Image31.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image31+10)
MOVT	R0, #hi_addr(_Image31+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1348 :: 		Image31.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image31+12)
MOVT	R0, #hi_addr(_Image31+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1349 :: 		Image31.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image31+22)
MOVT	R0, #hi_addr(_Image31+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1350 :: 		Image31.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image31+23)
MOVT	R0, #hi_addr(_Image31+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1351 :: 		Image31.Picture_Name    = logo17_jpg;
MOVW	R1, #26452
MOVT	R1, #35
MOVW	R0, #lo_addr(_Image31+16)
MOVT	R0, #hi_addr(_Image31+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1352 :: 		Image31.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image31+20)
MOVT	R0, #hi_addr(_Image31+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1353 :: 		Image31.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image31+21)
MOVT	R0, #hi_addr(_Image31+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1354 :: 		Image31.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image31+24)
MOVT	R0, #hi_addr(_Image31+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1355 :: 		Image31.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image31+28)
MOVT	R0, #hi_addr(_Image31+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1356 :: 		Image31.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image31+32)
MOVT	R0, #hi_addr(_Image31+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1357 :: 		Image31.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image31+36)
MOVT	R0, #hi_addr(_Image31+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1359 :: 		Image32.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image32+0)
MOVT	R0, #hi_addr(_Image32+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1360 :: 		Image32.Order           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Image32+4)
MOVT	R0, #hi_addr(_Image32+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1361 :: 		Image32.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image32+6)
MOVT	R0, #hi_addr(_Image32+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1362 :: 		Image32.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image32+8)
MOVT	R0, #hi_addr(_Image32+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1363 :: 		Image32.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image32+10)
MOVT	R0, #hi_addr(_Image32+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1364 :: 		Image32.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image32+12)
MOVT	R0, #hi_addr(_Image32+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1365 :: 		Image32.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image32+22)
MOVT	R0, #hi_addr(_Image32+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1366 :: 		Image32.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image32+23)
MOVT	R0, #hi_addr(_Image32+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1367 :: 		Image32.Picture_Name    = logo18_jpg;
MOVW	R1, #26360
MOVT	R1, #37
MOVW	R0, #lo_addr(_Image32+16)
MOVT	R0, #hi_addr(_Image32+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1368 :: 		Image32.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image32+20)
MOVT	R0, #hi_addr(_Image32+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1369 :: 		Image32.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image32+21)
MOVT	R0, #hi_addr(_Image32+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1370 :: 		Image32.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image32+24)
MOVT	R0, #hi_addr(_Image32+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1371 :: 		Image32.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image32+28)
MOVT	R0, #hi_addr(_Image32+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1372 :: 		Image32.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image32+32)
MOVT	R0, #hi_addr(_Image32+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1373 :: 		Image32.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image32+36)
MOVT	R0, #hi_addr(_Image32+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1375 :: 		Image33.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image33+0)
MOVT	R0, #hi_addr(_Image33+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1376 :: 		Image33.Order           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Image33+4)
MOVT	R0, #hi_addr(_Image33+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1377 :: 		Image33.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image33+6)
MOVT	R0, #hi_addr(_Image33+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1378 :: 		Image33.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+8)
MOVT	R0, #hi_addr(_Image33+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1379 :: 		Image33.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image33+10)
MOVT	R0, #hi_addr(_Image33+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1380 :: 		Image33.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image33+12)
MOVT	R0, #hi_addr(_Image33+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1381 :: 		Image33.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image33+22)
MOVT	R0, #hi_addr(_Image33+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1382 :: 		Image33.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image33+23)
MOVT	R0, #hi_addr(_Image33+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1383 :: 		Image33.Picture_Name    = logo19_jpg;
MOVW	R1, #26268
MOVT	R1, #39
MOVW	R0, #lo_addr(_Image33+16)
MOVT	R0, #hi_addr(_Image33+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1384 :: 		Image33.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image33+20)
MOVT	R0, #hi_addr(_Image33+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1385 :: 		Image33.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image33+21)
MOVT	R0, #hi_addr(_Image33+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1386 :: 		Image33.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+24)
MOVT	R0, #hi_addr(_Image33+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1387 :: 		Image33.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+28)
MOVT	R0, #hi_addr(_Image33+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1388 :: 		Image33.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+32)
MOVT	R0, #hi_addr(_Image33+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1389 :: 		Image33.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+36)
MOVT	R0, #hi_addr(_Image33+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1391 :: 		Image34.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image34+0)
MOVT	R0, #hi_addr(_Image34+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1392 :: 		Image34.Order           = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Image34+4)
MOVT	R0, #hi_addr(_Image34+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1393 :: 		Image34.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image34+6)
MOVT	R0, #hi_addr(_Image34+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1394 :: 		Image34.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+8)
MOVT	R0, #hi_addr(_Image34+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1395 :: 		Image34.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image34+10)
MOVT	R0, #hi_addr(_Image34+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1396 :: 		Image34.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image34+12)
MOVT	R0, #hi_addr(_Image34+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1397 :: 		Image34.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image34+22)
MOVT	R0, #hi_addr(_Image34+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1398 :: 		Image34.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image34+23)
MOVT	R0, #hi_addr(_Image34+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1399 :: 		Image34.Picture_Name    = logo20_jpg;
MOVW	R1, #26176
MOVT	R1, #41
MOVW	R0, #lo_addr(_Image34+16)
MOVT	R0, #hi_addr(_Image34+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1400 :: 		Image34.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image34+20)
MOVT	R0, #hi_addr(_Image34+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1401 :: 		Image34.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image34+21)
MOVT	R0, #hi_addr(_Image34+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1402 :: 		Image34.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+24)
MOVT	R0, #hi_addr(_Image34+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1403 :: 		Image34.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+28)
MOVT	R0, #hi_addr(_Image34+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1404 :: 		Image34.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+32)
MOVT	R0, #hi_addr(_Image34+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1405 :: 		Image34.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+36)
MOVT	R0, #hi_addr(_Image34+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1407 :: 		Image35.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image35+0)
MOVT	R0, #hi_addr(_Image35+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1408 :: 		Image35.Order           = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Image35+4)
MOVT	R0, #hi_addr(_Image35+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1409 :: 		Image35.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image35+6)
MOVT	R0, #hi_addr(_Image35+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1410 :: 		Image35.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image35+8)
MOVT	R0, #hi_addr(_Image35+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1411 :: 		Image35.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image35+10)
MOVT	R0, #hi_addr(_Image35+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1412 :: 		Image35.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image35+12)
MOVT	R0, #hi_addr(_Image35+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1413 :: 		Image35.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image35+22)
MOVT	R0, #hi_addr(_Image35+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1414 :: 		Image35.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image35+23)
MOVT	R0, #hi_addr(_Image35+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1415 :: 		Image35.Picture_Name    = logo21_jpg;
MOVW	R1, #26084
MOVT	R1, #43
MOVW	R0, #lo_addr(_Image35+16)
MOVT	R0, #hi_addr(_Image35+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1416 :: 		Image35.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image35+20)
MOVT	R0, #hi_addr(_Image35+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1417 :: 		Image35.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image35+21)
MOVT	R0, #hi_addr(_Image35+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1418 :: 		Image35.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image35+24)
MOVT	R0, #hi_addr(_Image35+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1419 :: 		Image35.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image35+28)
MOVT	R0, #hi_addr(_Image35+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1420 :: 		Image35.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image35+32)
MOVT	R0, #hi_addr(_Image35+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1421 :: 		Image35.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image35+36)
MOVT	R0, #hi_addr(_Image35+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1423 :: 		Image36.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image36+0)
MOVT	R0, #hi_addr(_Image36+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1424 :: 		Image36.Order           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image36+4)
MOVT	R0, #hi_addr(_Image36+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1425 :: 		Image36.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image36+6)
MOVT	R0, #hi_addr(_Image36+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1426 :: 		Image36.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image36+8)
MOVT	R0, #hi_addr(_Image36+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1427 :: 		Image36.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image36+10)
MOVT	R0, #hi_addr(_Image36+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1428 :: 		Image36.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image36+12)
MOVT	R0, #hi_addr(_Image36+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1429 :: 		Image36.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image36+22)
MOVT	R0, #hi_addr(_Image36+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1430 :: 		Image36.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image36+23)
MOVT	R0, #hi_addr(_Image36+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1431 :: 		Image36.Picture_Name    = logo22_jpg;
MOVW	R1, #25992
MOVT	R1, #45
MOVW	R0, #lo_addr(_Image36+16)
MOVT	R0, #hi_addr(_Image36+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1432 :: 		Image36.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image36+20)
MOVT	R0, #hi_addr(_Image36+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1433 :: 		Image36.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image36+21)
MOVT	R0, #hi_addr(_Image36+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1434 :: 		Image36.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image36+24)
MOVT	R0, #hi_addr(_Image36+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1435 :: 		Image36.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image36+28)
MOVT	R0, #hi_addr(_Image36+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1436 :: 		Image36.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image36+32)
MOVT	R0, #hi_addr(_Image36+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1437 :: 		Image36.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image36+36)
MOVT	R0, #hi_addr(_Image36+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1439 :: 		Image37.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image37+0)
MOVT	R0, #hi_addr(_Image37+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1440 :: 		Image37.Order           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Image37+4)
MOVT	R0, #hi_addr(_Image37+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1441 :: 		Image37.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image37+6)
MOVT	R0, #hi_addr(_Image37+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1442 :: 		Image37.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image37+8)
MOVT	R0, #hi_addr(_Image37+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1443 :: 		Image37.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image37+10)
MOVT	R0, #hi_addr(_Image37+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1444 :: 		Image37.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image37+12)
MOVT	R0, #hi_addr(_Image37+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1445 :: 		Image37.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image37+22)
MOVT	R0, #hi_addr(_Image37+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1446 :: 		Image37.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image37+23)
MOVT	R0, #hi_addr(_Image37+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1447 :: 		Image37.Picture_Name    = logo23_jpg;
MOVW	R1, #25900
MOVT	R1, #47
MOVW	R0, #lo_addr(_Image37+16)
MOVT	R0, #hi_addr(_Image37+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1448 :: 		Image37.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image37+20)
MOVT	R0, #hi_addr(_Image37+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1449 :: 		Image37.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image37+21)
MOVT	R0, #hi_addr(_Image37+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1450 :: 		Image37.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image37+24)
MOVT	R0, #hi_addr(_Image37+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1451 :: 		Image37.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image37+28)
MOVT	R0, #hi_addr(_Image37+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1452 :: 		Image37.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image37+32)
MOVT	R0, #hi_addr(_Image37+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1453 :: 		Image37.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image37+36)
MOVT	R0, #hi_addr(_Image37+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1455 :: 		Image38.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image38+0)
MOVT	R0, #hi_addr(_Image38+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1456 :: 		Image38.Order           = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Image38+4)
MOVT	R0, #hi_addr(_Image38+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1457 :: 		Image38.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image38+6)
MOVT	R0, #hi_addr(_Image38+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1458 :: 		Image38.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image38+8)
MOVT	R0, #hi_addr(_Image38+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1459 :: 		Image38.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image38+10)
MOVT	R0, #hi_addr(_Image38+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1460 :: 		Image38.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image38+12)
MOVT	R0, #hi_addr(_Image38+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1461 :: 		Image38.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image38+22)
MOVT	R0, #hi_addr(_Image38+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1462 :: 		Image38.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image38+23)
MOVT	R0, #hi_addr(_Image38+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1463 :: 		Image38.Picture_Name    = logo24_jpg;
MOVW	R1, #25808
MOVT	R1, #49
MOVW	R0, #lo_addr(_Image38+16)
MOVT	R0, #hi_addr(_Image38+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1464 :: 		Image38.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image38+20)
MOVT	R0, #hi_addr(_Image38+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1465 :: 		Image38.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image38+21)
MOVT	R0, #hi_addr(_Image38+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1466 :: 		Image38.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image38+24)
MOVT	R0, #hi_addr(_Image38+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1467 :: 		Image38.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image38+28)
MOVT	R0, #hi_addr(_Image38+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1468 :: 		Image38.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image38+32)
MOVT	R0, #hi_addr(_Image38+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1469 :: 		Image38.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image38+36)
MOVT	R0, #hi_addr(_Image38+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1471 :: 		Image39.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image39+0)
MOVT	R0, #hi_addr(_Image39+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1472 :: 		Image39.Order           = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Image39+4)
MOVT	R0, #hi_addr(_Image39+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1473 :: 		Image39.Left            = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Image39+6)
MOVT	R0, #hi_addr(_Image39+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1474 :: 		Image39.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+8)
MOVT	R0, #hi_addr(_Image39+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1475 :: 		Image39.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Image39+10)
MOVT	R0, #hi_addr(_Image39+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1476 :: 		Image39.Height          = 263;
MOVW	R1, #263
MOVW	R0, #lo_addr(_Image39+12)
MOVT	R0, #hi_addr(_Image39+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1477 :: 		Image39.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image39+22)
MOVT	R0, #hi_addr(_Image39+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1478 :: 		Image39.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image39+23)
MOVT	R0, #hi_addr(_Image39+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1479 :: 		Image39.Picture_Name    = logo25_jpg;
MOVW	R1, #25716
MOVT	R1, #51
MOVW	R0, #lo_addr(_Image39+16)
MOVT	R0, #hi_addr(_Image39+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1480 :: 		Image39.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image39+20)
MOVT	R0, #hi_addr(_Image39+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1481 :: 		Image39.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image39+21)
MOVT	R0, #hi_addr(_Image39+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1482 :: 		Image39.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+24)
MOVT	R0, #hi_addr(_Image39+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1483 :: 		Image39.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+28)
MOVT	R0, #hi_addr(_Image39+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1484 :: 		Image39.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+32)
MOVT	R0, #hi_addr(_Image39+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1485 :: 		Image39.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+36)
MOVT	R0, #hi_addr(_Image39+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1487 :: 		Label19.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Label19+0)
MOVT	R0, #hi_addr(_Label19+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1488 :: 		Label19.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label19+4)
MOVT	R0, #hi_addr(_Label19+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1489 :: 		Label19.Left            = 365;
MOVW	R1, #365
MOVW	R0, #lo_addr(_Label19+6)
MOVT	R0, #hi_addr(_Label19+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1490 :: 		Label19.Top             = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label19+8)
MOVT	R0, #hi_addr(_Label19+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1491 :: 		Label19.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_Label19+10)
MOVT	R0, #hi_addr(_Label19+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1492 :: 		Label19.Height          = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label19+12)
MOVT	R0, #hi_addr(_Label19+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1493 :: 		Label19.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label19+26)
MOVT	R0, #hi_addr(_Label19+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1494 :: 		Label19.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label19+27)
MOVT	R0, #hi_addr(_Label19+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1495 :: 		Label19.Caption         = Label19_Caption;
MOVW	R1, #lo_addr(_Label19_Caption+0)
MOVT	R1, #hi_addr(_Label19_Caption+0)
MOVW	R0, #lo_addr(_Label19+16)
MOVT	R0, #hi_addr(_Label19+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1496 :: 		Label19.FontName        = Arial_Black21x30_Regular;
MOVW	R1, #8609
MOVW	R0, #lo_addr(_Label19+20)
MOVT	R0, #hi_addr(_Label19+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1497 :: 		Label19.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label19+24)
MOVT	R0, #hi_addr(_Label19+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1498 :: 		Label19.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+28)
MOVT	R0, #hi_addr(_Label19+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1499 :: 		Label19.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+32)
MOVT	R0, #hi_addr(_Label19+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1500 :: 		Label19.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+36)
MOVT	R0, #hi_addr(_Label19+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1501 :: 		Label19.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+40)
MOVT	R0, #hi_addr(_Label19+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1503 :: 		Image15.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Image15+0)
MOVT	R0, #hi_addr(_Image15+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1504 :: 		Image15.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image15+4)
MOVT	R0, #hi_addr(_Image15+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1505 :: 		Image15.Left            = 432;
MOVW	R1, #432
MOVW	R0, #lo_addr(_Image15+6)
MOVT	R0, #hi_addr(_Image15+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1506 :: 		Image15.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image15+8)
MOVT	R0, #hi_addr(_Image15+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1507 :: 		Image15.Width           = 44;
MOVS	R1, #44
MOVW	R0, #lo_addr(_Image15+10)
MOVT	R0, #hi_addr(_Image15+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1508 :: 		Image15.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Image15+12)
MOVT	R0, #hi_addr(_Image15+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1509 :: 		Image15.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+22)
MOVT	R0, #hi_addr(_Image15+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1510 :: 		Image15.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image15+23)
MOVT	R0, #hi_addr(_Image15+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1511 :: 		Image15.Picture_Name    = icon_battery_bmp;
MOVW	R1, #24606
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image15+16)
MOVT	R0, #hi_addr(_Image15+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1512 :: 		Image15.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image15+20)
MOVT	R0, #hi_addr(_Image15+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1513 :: 		Image15.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+21)
MOVT	R0, #hi_addr(_Image15+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1514 :: 		Image15.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+24)
MOVT	R0, #hi_addr(_Image15+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1515 :: 		Image15.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+28)
MOVT	R0, #hi_addr(_Image15+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1516 :: 		Image15.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+32)
MOVT	R0, #hi_addr(_Image15+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1517 :: 		Image15.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+36)
MOVT	R0, #hi_addr(_Image15+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1519 :: 		Image3.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Image3+0)
MOVT	R0, #hi_addr(_Image3+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1520 :: 		Image3.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Image3+4)
MOVT	R0, #hi_addr(_Image3+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1521 :: 		Image3.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+6)
MOVT	R0, #hi_addr(_Image3+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1522 :: 		Image3.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+8)
MOVT	R0, #hi_addr(_Image3+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1523 :: 		Image3.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image3+10)
MOVT	R0, #hi_addr(_Image3+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1524 :: 		Image3.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image3+12)
MOVT	R0, #hi_addr(_Image3+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1525 :: 		Image3.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+22)
MOVT	R0, #hi_addr(_Image3+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1526 :: 		Image3.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+23)
MOVT	R0, #hi_addr(_Image3+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1527 :: 		Image3.Picture_Name    = WaterTemperatureIcon_jpg;
MOVW	R1, #26372
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image3+16)
MOVT	R0, #hi_addr(_Image3+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1528 :: 		Image3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+20)
MOVT	R0, #hi_addr(_Image3+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1529 :: 		Image3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+21)
MOVT	R0, #hi_addr(_Image3+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1530 :: 		Image3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+24)
MOVT	R0, #hi_addr(_Image3+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1531 :: 		Image3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+28)
MOVT	R0, #hi_addr(_Image3+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1532 :: 		Image3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+32)
MOVT	R0, #hi_addr(_Image3+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1533 :: 		Image3.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+36)
MOVT	R0, #hi_addr(_Image3+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1535 :: 		Image4.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Image4+0)
MOVT	R0, #hi_addr(_Image4+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1536 :: 		Image4.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Image4+4)
MOVT	R0, #hi_addr(_Image4+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1537 :: 		Image4.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+6)
MOVT	R0, #hi_addr(_Image4+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1538 :: 		Image4.Top             = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Image4+8)
MOVT	R0, #hi_addr(_Image4+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1539 :: 		Image4.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image4+10)
MOVT	R0, #hi_addr(_Image4+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1540 :: 		Image4.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image4+12)
MOVT	R0, #hi_addr(_Image4+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1541 :: 		Image4.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+22)
MOVT	R0, #hi_addr(_Image4+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1542 :: 		Image4.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+23)
MOVT	R0, #hi_addr(_Image4+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1543 :: 		Image4.Picture_Name    = fuel_jpg;
MOVW	R1, #31378
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image4+16)
MOVT	R0, #hi_addr(_Image4+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1544 :: 		Image4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+20)
MOVT	R0, #hi_addr(_Image4+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1545 :: 		Image4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+21)
MOVT	R0, #hi_addr(_Image4+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1546 :: 		Image4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+24)
MOVT	R0, #hi_addr(_Image4+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1547 :: 		Image4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+28)
MOVT	R0, #hi_addr(_Image4+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1548 :: 		Image4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+32)
MOVT	R0, #hi_addr(_Image4+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1549 :: 		Image4.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+36)
MOVT	R0, #hi_addr(_Image4+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1551 :: 		Image5.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Image5+0)
MOVT	R0, #hi_addr(_Image5+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1552 :: 		Image5.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image5+4)
MOVT	R0, #hi_addr(_Image5+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1553 :: 		Image5.Left            = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Image5+6)
MOVT	R0, #hi_addr(_Image5+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1554 :: 		Image5.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+8)
MOVT	R0, #hi_addr(_Image5+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1555 :: 		Image5.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image5+10)
MOVT	R0, #hi_addr(_Image5+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1556 :: 		Image5.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image5+12)
MOVT	R0, #hi_addr(_Image5+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1557 :: 		Image5.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+22)
MOVT	R0, #hi_addr(_Image5+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1558 :: 		Image5.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+23)
MOVT	R0, #hi_addr(_Image5+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1559 :: 		Image5.Picture_Name    = HeadlightIcon_jpg;
MOVW	R1, #36384
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image5+16)
MOVT	R0, #hi_addr(_Image5+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1560 :: 		Image5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+20)
MOVT	R0, #hi_addr(_Image5+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1561 :: 		Image5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+21)
MOVT	R0, #hi_addr(_Image5+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1562 :: 		Image5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+24)
MOVT	R0, #hi_addr(_Image5+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1563 :: 		Image5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+28)
MOVT	R0, #hi_addr(_Image5+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1564 :: 		Image5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+32)
MOVT	R0, #hi_addr(_Image5+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1565 :: 		Image5.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+36)
MOVT	R0, #hi_addr(_Image5+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1567 :: 		Image6.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Image6+0)
MOVT	R0, #hi_addr(_Image6+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1568 :: 		Image6.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image6+4)
MOVT	R0, #hi_addr(_Image6+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1569 :: 		Image6.Left            = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Image6+6)
MOVT	R0, #hi_addr(_Image6+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1570 :: 		Image6.Top             = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Image6+8)
MOVT	R0, #hi_addr(_Image6+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1571 :: 		Image6.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image6+10)
MOVT	R0, #hi_addr(_Image6+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1572 :: 		Image6.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image6+12)
MOVT	R0, #hi_addr(_Image6+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1573 :: 		Image6.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+22)
MOVT	R0, #hi_addr(_Image6+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1574 :: 		Image6.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+23)
MOVT	R0, #hi_addr(_Image6+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1575 :: 		Image6.Picture_Name    = OilAlertIcon_jpg;
MOVW	R1, #41390
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image6+16)
MOVT	R0, #hi_addr(_Image6+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1576 :: 		Image6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+20)
MOVT	R0, #hi_addr(_Image6+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1577 :: 		Image6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+21)
MOVT	R0, #hi_addr(_Image6+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1578 :: 		Image6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image6+24)
MOVT	R0, #hi_addr(_Image6+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1579 :: 		Image6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image6+28)
MOVT	R0, #hi_addr(_Image6+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1580 :: 		Image6.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image6+32)
MOVT	R0, #hi_addr(_Image6+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1581 :: 		Image6.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image6+36)
MOVT	R0, #hi_addr(_Image6+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1583 :: 		Image7.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Image7+0)
MOVT	R0, #hi_addr(_Image7+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1584 :: 		Image7.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Image7+4)
MOVT	R0, #hi_addr(_Image7+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1585 :: 		Image7.Left            = 429;
MOVW	R1, #429
MOVW	R0, #lo_addr(_Image7+6)
MOVT	R0, #hi_addr(_Image7+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1586 :: 		Image7.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_Image7+8)
MOVT	R0, #hi_addr(_Image7+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1587 :: 		Image7.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image7+10)
MOVT	R0, #hi_addr(_Image7+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1588 :: 		Image7.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image7+12)
MOVT	R0, #hi_addr(_Image7+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1589 :: 		Image7.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image7+22)
MOVT	R0, #hi_addr(_Image7+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1590 :: 		Image7.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image7+23)
MOVT	R0, #hi_addr(_Image7+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1591 :: 		Image7.Picture_Name    = Settings_icon_JPG;
MOVW	R1, #46396
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image7+16)
MOVT	R0, #hi_addr(_Image7+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1592 :: 		Image7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image7+20)
MOVT	R0, #hi_addr(_Image7+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1593 :: 		Image7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image7+21)
MOVT	R0, #hi_addr(_Image7+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1594 :: 		Image7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+24)
MOVT	R0, #hi_addr(_Image7+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1595 :: 		Image7.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+28)
MOVT	R0, #hi_addr(_Image7+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1596 :: 		Image7.OnClickPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Image7+32)
MOVT	R0, #hi_addr(_Image7+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1597 :: 		Image7.OnPressPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Image7+36)
MOVT	R0, #hi_addr(_Image7+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1599 :: 		Image8.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Image8+0)
MOVT	R0, #hi_addr(_Image8+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1600 :: 		Image8.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Image8+4)
MOVT	R0, #hi_addr(_Image8+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1601 :: 		Image8.Left            = 55;
MOVS	R1, #55
MOVW	R0, #lo_addr(_Image8+6)
MOVT	R0, #hi_addr(_Image8+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1602 :: 		Image8.Top             = 116;
MOVS	R1, #116
MOVW	R0, #lo_addr(_Image8+8)
MOVT	R0, #hi_addr(_Image8+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1603 :: 		Image8.Width           = 51;
MOVS	R1, #51
MOVW	R0, #lo_addr(_Image8+10)
MOVT	R0, #hi_addr(_Image8+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1604 :: 		Image8.Height          = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Image8+12)
MOVT	R0, #hi_addr(_Image8+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1605 :: 		Image8.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image8+22)
MOVT	R0, #hi_addr(_Image8+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1606 :: 		Image8.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image8+23)
MOVT	R0, #hi_addr(_Image8+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1607 :: 		Image8.Picture_Name    = red_left_arrow_103_jpg;
MOVW	R1, #51402
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image8+16)
MOVT	R0, #hi_addr(_Image8+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1608 :: 		Image8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image8+20)
MOVT	R0, #hi_addr(_Image8+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1609 :: 		Image8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image8+21)
MOVT	R0, #hi_addr(_Image8+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1610 :: 		Image8.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+24)
MOVT	R0, #hi_addr(_Image8+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1611 :: 		Image8.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+28)
MOVT	R0, #hi_addr(_Image8+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1612 :: 		Image8.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+32)
MOVT	R0, #hi_addr(_Image8+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1613 :: 		Image8.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+36)
MOVT	R0, #hi_addr(_Image8+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1615 :: 		Image9.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Image9+0)
MOVT	R0, #hi_addr(_Image9+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1616 :: 		Image9.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Image9+4)
MOVT	R0, #hi_addr(_Image9+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1617 :: 		Image9.Left            = 373;
MOVW	R1, #373
MOVW	R0, #lo_addr(_Image9+6)
MOVT	R0, #hi_addr(_Image9+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1618 :: 		Image9.Top             = 116;
MOVS	R1, #116
MOVW	R0, #lo_addr(_Image9+8)
MOVT	R0, #hi_addr(_Image9+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1619 :: 		Image9.Width           = 51;
MOVS	R1, #51
MOVW	R0, #lo_addr(_Image9+10)
MOVT	R0, #hi_addr(_Image9+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1620 :: 		Image9.Height          = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Image9+12)
MOVT	R0, #hi_addr(_Image9+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1621 :: 		Image9.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image9+22)
MOVT	R0, #hi_addr(_Image9+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1622 :: 		Image9.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image9+23)
MOVT	R0, #hi_addr(_Image9+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1623 :: 		Image9.Picture_Name    = red_left_arrow_copy_jpg;
MOVW	R1, #55386
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image9+16)
MOVT	R0, #hi_addr(_Image9+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1624 :: 		Image9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image9+20)
MOVT	R0, #hi_addr(_Image9+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1625 :: 		Image9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image9+21)
MOVT	R0, #hi_addr(_Image9+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1626 :: 		Image9.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image9+24)
MOVT	R0, #hi_addr(_Image9+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1627 :: 		Image9.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image9+28)
MOVT	R0, #hi_addr(_Image9+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1628 :: 		Image9.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image9+32)
MOVT	R0, #hi_addr(_Image9+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1629 :: 		Image9.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image9+36)
MOVT	R0, #hi_addr(_Image9+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1631 :: 		Label10.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Label10+0)
MOVT	R0, #hi_addr(_Label10+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1632 :: 		Label10.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label10+4)
MOVT	R0, #hi_addr(_Label10+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1633 :: 		Label10.Left            = 373;
MOVW	R1, #373
MOVW	R0, #lo_addr(_Label10+6)
MOVT	R0, #hi_addr(_Label10+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1634 :: 		Label10.Top             = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Label10+8)
MOVT	R0, #hi_addr(_Label10+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1635 :: 		Label10.Width           = 56;
MOVS	R1, #56
MOVW	R0, #lo_addr(_Label10+10)
MOVT	R0, #hi_addr(_Label10+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1636 :: 		Label10.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label10+12)
MOVT	R0, #hi_addr(_Label10+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1637 :: 		Label10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+26)
MOVT	R0, #hi_addr(_Label10+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1638 :: 		Label10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+27)
MOVT	R0, #hi_addr(_Label10+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1639 :: 		Label10.Caption         = Label10_Caption;
MOVW	R1, #lo_addr(_Label10_Caption+0)
MOVT	R1, #hi_addr(_Label10_Caption+0)
MOVW	R0, #lo_addr(_Label10+16)
MOVT	R0, #hi_addr(_Label10+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1640 :: 		Label10.FontName        = Arial_Black16x23_Regular;
MOVW	R1, #2595
MOVW	R0, #lo_addr(_Label10+20)
MOVT	R0, #hi_addr(_Label10+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1641 :: 		Label10.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label10+24)
MOVT	R0, #hi_addr(_Label10+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1642 :: 		Label10.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+28)
MOVT	R0, #hi_addr(_Label10+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1643 :: 		Label10.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+32)
MOVT	R0, #hi_addr(_Label10+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1644 :: 		Label10.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+36)
MOVT	R0, #hi_addr(_Label10+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1645 :: 		Label10.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+40)
MOVT	R0, #hi_addr(_Label10+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1647 :: 		Label11.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Label11+0)
MOVT	R0, #hi_addr(_Label11+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1648 :: 		Label11.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Label11+4)
MOVT	R0, #hi_addr(_Label11+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1649 :: 		Label11.Left            = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label11+6)
MOVT	R0, #hi_addr(_Label11+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1650 :: 		Label11.Top             = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label11+8)
MOVT	R0, #hi_addr(_Label11+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1651 :: 		Label11.Width           = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Label11+10)
MOVT	R0, #hi_addr(_Label11+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1652 :: 		Label11.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label11+12)
MOVT	R0, #hi_addr(_Label11+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1653 :: 		Label11.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label11+26)
MOVT	R0, #hi_addr(_Label11+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1654 :: 		Label11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label11+27)
MOVT	R0, #hi_addr(_Label11+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1655 :: 		Label11.Caption         = Label11_Caption;
MOVW	R1, #lo_addr(_Label11_Caption+0)
MOVT	R1, #hi_addr(_Label11_Caption+0)
MOVW	R0, #lo_addr(_Label11+16)
MOVT	R0, #hi_addr(_Label11+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1656 :: 		Label11.FontName        = Arial_Black11x15_Regular;
MOVW	R1, #53011
MOVW	R0, #lo_addr(_Label11+20)
MOVT	R0, #hi_addr(_Label11+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1657 :: 		Label11.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label11+24)
MOVT	R0, #hi_addr(_Label11+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1658 :: 		Label11.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+28)
MOVT	R0, #hi_addr(_Label11+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1659 :: 		Label11.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+32)
MOVT	R0, #hi_addr(_Label11+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1660 :: 		Label11.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+36)
MOVT	R0, #hi_addr(_Label11+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1661 :: 		Label11.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+40)
MOVT	R0, #hi_addr(_Label11+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1663 :: 		CircleButton1.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_CircleButton1+0)
MOVT	R0, #hi_addr(_CircleButton1+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1664 :: 		CircleButton1.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_CircleButton1+4)
MOVT	R0, #hi_addr(_CircleButton1+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1665 :: 		CircleButton1.Left            = 216;
MOVS	R1, #216
MOVW	R0, #lo_addr(_CircleButton1+6)
MOVT	R0, #hi_addr(_CircleButton1+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1666 :: 		CircleButton1.Top             = 112;
MOVS	R1, #112
MOVW	R0, #lo_addr(_CircleButton1+8)
MOVT	R0, #hi_addr(_CircleButton1+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1667 :: 		CircleButton1.Radius          = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_CircleButton1+10)
MOVT	R0, #hi_addr(_CircleButton1+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1668 :: 		CircleButton1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+12)
MOVT	R0, #hi_addr(_CircleButton1+12)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1669 :: 		CircleButton1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+14)
MOVT	R0, #hi_addr(_CircleButton1+14)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1670 :: 		CircleButton1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+16)
MOVT	R0, #hi_addr(_CircleButton1+16)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1671 :: 		CircleButton1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+17)
MOVT	R0, #hi_addr(_CircleButton1+17)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1672 :: 		CircleButton1.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+18)
MOVT	R0, #hi_addr(_CircleButton1+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1673 :: 		CircleButton1.Caption         = CircleButton1_Caption;
MOVW	R1, #lo_addr(_CircleButton1_Caption+0)
MOVT	R1, #hi_addr(_CircleButton1_Caption+0)
MOVW	R0, #lo_addr(_CircleButton1+20)
MOVT	R0, #hi_addr(_CircleButton1+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1674 :: 		CircleButton1.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+24)
MOVT	R0, #hi_addr(_CircleButton1+24)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1675 :: 		CircleButton1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #25308
MOVT	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+28)
MOVT	R0, #hi_addr(_CircleButton1+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1676 :: 		CircleButton1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+42)
MOVT	R0, #hi_addr(_CircleButton1+42)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1677 :: 		CircleButton1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+32)
MOVT	R0, #hi_addr(_CircleButton1+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1678 :: 		CircleButton1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+34)
MOVT	R0, #hi_addr(_CircleButton1+34)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1679 :: 		CircleButton1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+35)
MOVT	R0, #hi_addr(_CircleButton1+35)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1680 :: 		CircleButton1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_CircleButton1+36)
MOVT	R0, #hi_addr(_CircleButton1+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1681 :: 		CircleButton1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CircleButton1+38)
MOVT	R0, #hi_addr(_CircleButton1+38)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1682 :: 		CircleButton1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CircleButton1+40)
MOVT	R0, #hi_addr(_CircleButton1+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1683 :: 		CircleButton1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_CircleButton1+44)
MOVT	R0, #hi_addr(_CircleButton1+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1684 :: 		CircleButton1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+48)
MOVT	R0, #hi_addr(_CircleButton1+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1685 :: 		CircleButton1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+52)
MOVT	R0, #hi_addr(_CircleButton1+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1686 :: 		CircleButton1.OnClickPtr      = doNextScreen;
MOVW	R1, #lo_addr(_doNextScreen+0)
MOVT	R1, #hi_addr(_doNextScreen+0)
MOVW	R0, #lo_addr(_CircleButton1+56)
MOVT	R0, #hi_addr(_CircleButton1+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1687 :: 		CircleButton1.OnPressPtr      = doNextScreen;
MOVW	R1, #lo_addr(_doNextScreen+0)
MOVT	R1, #hi_addr(_doNextScreen+0)
MOVW	R0, #lo_addr(_CircleButton1+60)
MOVT	R0, #hi_addr(_CircleButton1+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1689 :: 		Label12.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Label12+0)
MOVT	R0, #hi_addr(_Label12+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1690 :: 		Label12.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label12+4)
MOVT	R0, #hi_addr(_Label12+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1691 :: 		Label12.Left            = 33;
MOVS	R1, #33
MOVW	R0, #lo_addr(_Label12+6)
MOVT	R0, #hi_addr(_Label12+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1692 :: 		Label12.Top             = 189;
MOVS	R1, #189
MOVW	R0, #lo_addr(_Label12+8)
MOVT	R0, #hi_addr(_Label12+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1693 :: 		Label12.Width           = 68;
MOVS	R1, #68
MOVW	R0, #lo_addr(_Label12+10)
MOVT	R0, #hi_addr(_Label12+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1694 :: 		Label12.Height          = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_Label12+12)
MOVT	R0, #hi_addr(_Label12+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1695 :: 		Label12.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label12+26)
MOVT	R0, #hi_addr(_Label12+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1696 :: 		Label12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label12+27)
MOVT	R0, #hi_addr(_Label12+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1697 :: 		Label12.Caption         = Label12_Caption;
MOVW	R1, #lo_addr(_Label12_Caption+0)
MOVT	R1, #hi_addr(_Label12_Caption+0)
MOVW	R0, #lo_addr(_Label12+16)
MOVT	R0, #hi_addr(_Label12+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1698 :: 		Label12.FontName        = Arial_Black27x38_Regular;
MOVW	R1, #14431
MOVW	R0, #lo_addr(_Label12+20)
MOVT	R0, #hi_addr(_Label12+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1699 :: 		Label12.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label12+24)
MOVT	R0, #hi_addr(_Label12+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1700 :: 		Label12.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+28)
MOVT	R0, #hi_addr(_Label12+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1701 :: 		Label12.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+32)
MOVT	R0, #hi_addr(_Label12+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1702 :: 		Label12.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+36)
MOVT	R0, #hi_addr(_Label12+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1703 :: 		Label12.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+40)
MOVT	R0, #hi_addr(_Label12+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1705 :: 		Label13.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Label13+0)
MOVT	R0, #hi_addr(_Label13+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1706 :: 		Label13.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label13+4)
MOVT	R0, #hi_addr(_Label13+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1707 :: 		Label13.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+6)
MOVT	R0, #hi_addr(_Label13+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1708 :: 		Label13.Top             = 213;
MOVS	R1, #213
MOVW	R0, #lo_addr(_Label13+8)
MOVT	R0, #hi_addr(_Label13+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1709 :: 		Label13.Width           = 148;
MOVS	R1, #148
MOVW	R0, #lo_addr(_Label13+10)
MOVT	R0, #hi_addr(_Label13+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1710 :: 		Label13.Height          = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Label13+12)
MOVT	R0, #hi_addr(_Label13+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1711 :: 		Label13.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label13+26)
MOVT	R0, #hi_addr(_Label13+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1712 :: 		Label13.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label13+27)
MOVT	R0, #hi_addr(_Label13+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1713 :: 		Label13.Caption         = Label13_Caption;
MOVW	R1, #lo_addr(_Label13_Caption+0)
MOVT	R1, #hi_addr(_Label13_Caption+0)
MOVW	R0, #lo_addr(_Label13+16)
MOVT	R0, #hi_addr(_Label13+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1714 :: 		Label13.FontName        = Arial_Black43x60_Regular;
MOVW	R1, #31859
MOVW	R0, #lo_addr(_Label13+20)
MOVT	R0, #hi_addr(_Label13+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1715 :: 		Label13.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label13+24)
MOVT	R0, #hi_addr(_Label13+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1716 :: 		Label13.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+28)
MOVT	R0, #hi_addr(_Label13+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1717 :: 		Label13.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+32)
MOVT	R0, #hi_addr(_Label13+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1718 :: 		Label13.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+36)
MOVT	R0, #hi_addr(_Label13+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1719 :: 		Label13.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+40)
MOVT	R0, #hi_addr(_Label13+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1721 :: 		Box2.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Box2+0)
MOVT	R0, #hi_addr(_Box2+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1722 :: 		Box2.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Box2+4)
MOVT	R0, #hi_addr(_Box2+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1723 :: 		Box2.Left            = 350;
MOVW	R1, #350
MOVW	R0, #lo_addr(_Box2+6)
MOVT	R0, #hi_addr(_Box2+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1724 :: 		Box2.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_Box2+8)
MOVT	R0, #hi_addr(_Box2+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1725 :: 		Box2.Width           = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_Box2+10)
MOVT	R0, #hi_addr(_Box2+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1726 :: 		Box2.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Box2+12)
MOVT	R0, #hi_addr(_Box2+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1727 :: 		Box2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+14)
MOVT	R0, #hi_addr(_Box2+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1728 :: 		Box2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+16)
MOVT	R0, #hi_addr(_Box2+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1729 :: 		Box2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+18)
MOVT	R0, #hi_addr(_Box2+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1730 :: 		Box2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+19)
MOVT	R0, #hi_addr(_Box2+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1731 :: 		Box2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+20)
MOVT	R0, #hi_addr(_Box2+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1732 :: 		Box2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+21)
MOVT	R0, #hi_addr(_Box2+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1733 :: 		Box2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+22)
MOVT	R0, #hi_addr(_Box2+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1734 :: 		Box2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box2+24)
MOVT	R0, #hi_addr(_Box2+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1735 :: 		Box2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box2+26)
MOVT	R0, #hi_addr(_Box2+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1736 :: 		Box2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box2+28)
MOVT	R0, #hi_addr(_Box2+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1737 :: 		Box2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+30)
MOVT	R0, #hi_addr(_Box2+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1738 :: 		Box2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box2+32)
MOVT	R0, #hi_addr(_Box2+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1739 :: 		Box2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+36)
MOVT	R0, #hi_addr(_Box2+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1740 :: 		Box2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+40)
MOVT	R0, #hi_addr(_Box2+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1741 :: 		Box2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+44)
MOVT	R0, #hi_addr(_Box2+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1742 :: 		Box2.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+48)
MOVT	R0, #hi_addr(_Box2+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1744 :: 		Label14.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Label14+0)
MOVT	R0, #hi_addr(_Label14+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1745 :: 		Label14.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label14+4)
MOVT	R0, #hi_addr(_Label14+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1746 :: 		Label14.Left            = 358;
MOVW	R1, #358
MOVW	R0, #lo_addr(_Label14+6)
MOVT	R0, #hi_addr(_Label14+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1747 :: 		Label14.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_Label14+8)
MOVT	R0, #hi_addr(_Label14+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1748 :: 		Label14.Width           = 62;
MOVS	R1, #62
MOVW	R0, #lo_addr(_Label14+10)
MOVT	R0, #hi_addr(_Label14+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1749 :: 		Label14.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label14+12)
MOVT	R0, #hi_addr(_Label14+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1750 :: 		Label14.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label14+26)
MOVT	R0, #hi_addr(_Label14+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1751 :: 		Label14.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label14+27)
MOVT	R0, #hi_addr(_Label14+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1752 :: 		Label14.Caption         = Label14_Caption;
MOVW	R1, #lo_addr(_Label14_Caption+0)
MOVT	R1, #hi_addr(_Label14_Caption+0)
MOVW	R0, #lo_addr(_Label14+16)
MOVT	R0, #hi_addr(_Label14+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1753 :: 		Label14.FontName        = Arial_Black11x15_Regular;
MOVW	R1, #53011
MOVW	R0, #lo_addr(_Label14+20)
MOVT	R0, #hi_addr(_Label14+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1754 :: 		Label14.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+24)
MOVT	R0, #hi_addr(_Label14+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1755 :: 		Label14.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+28)
MOVT	R0, #hi_addr(_Label14+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1756 :: 		Label14.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+32)
MOVT	R0, #hi_addr(_Label14+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1757 :: 		Label14.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+36)
MOVT	R0, #hi_addr(_Label14+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1758 :: 		Label14.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+40)
MOVT	R0, #hi_addr(_Label14+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1760 :: 		Label15.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Label15+0)
MOVT	R0, #hi_addr(_Label15+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1761 :: 		Label15.Order           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label15+4)
MOVT	R0, #hi_addr(_Label15+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1762 :: 		Label15.Left            = 198;
MOVS	R1, #198
MOVW	R0, #lo_addr(_Label15+6)
MOVT	R0, #hi_addr(_Label15+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1763 :: 		Label15.Top             = 203;
MOVS	R1, #203
MOVW	R0, #lo_addr(_Label15+8)
MOVT	R0, #hi_addr(_Label15+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1764 :: 		Label15.Width           = 86;
MOVS	R1, #86
MOVW	R0, #lo_addr(_Label15+10)
MOVT	R0, #hi_addr(_Label15+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1765 :: 		Label15.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label15+12)
MOVT	R0, #hi_addr(_Label15+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1766 :: 		Label15.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label15+26)
MOVT	R0, #hi_addr(_Label15+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1767 :: 		Label15.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label15+27)
MOVT	R0, #hi_addr(_Label15+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1768 :: 		Label15.Caption         = Label15_Caption;
MOVW	R1, #lo_addr(_Label15_Caption+0)
MOVT	R1, #hi_addr(_Label15_Caption+0)
MOVW	R0, #lo_addr(_Label15+16)
MOVT	R0, #hi_addr(_Label15+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1769 :: 		Label15.FontName        = Arial_Black16x23_Regular;
MOVW	R1, #2595
MOVW	R0, #lo_addr(_Label15+20)
MOVT	R0, #hi_addr(_Label15+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1770 :: 		Label15.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+24)
MOVT	R0, #hi_addr(_Label15+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1771 :: 		Label15.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+28)
MOVT	R0, #hi_addr(_Label15+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1772 :: 		Label15.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+32)
MOVT	R0, #hi_addr(_Label15+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1773 :: 		Label15.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+36)
MOVT	R0, #hi_addr(_Label15+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1774 :: 		Label15.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+40)
MOVT	R0, #hi_addr(_Label15+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1776 :: 		Label16.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Label16+0)
MOVT	R0, #hi_addr(_Label16+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1777 :: 		Label16.Order           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Label16+4)
MOVT	R0, #hi_addr(_Label16+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1778 :: 		Label16.Left            = 218;
MOVS	R1, #218
MOVW	R0, #lo_addr(_Label16+6)
MOVT	R0, #hi_addr(_Label16+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1779 :: 		Label16.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_Label16+8)
MOVT	R0, #hi_addr(_Label16+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1780 :: 		Label16.Width           = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_Label16+10)
MOVT	R0, #hi_addr(_Label16+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1781 :: 		Label16.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label16+12)
MOVT	R0, #hi_addr(_Label16+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1782 :: 		Label16.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label16+26)
MOVT	R0, #hi_addr(_Label16+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1783 :: 		Label16.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label16+27)
MOVT	R0, #hi_addr(_Label16+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1784 :: 		Label16.Caption         = Label16_Caption;
MOVW	R1, #lo_addr(_Label16_Caption+0)
MOVT	R1, #hi_addr(_Label16_Caption+0)
MOVW	R0, #lo_addr(_Label16+16)
MOVT	R0, #hi_addr(_Label16+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1785 :: 		Label16.FontName        = Arial_Black11x15_Regular;
MOVW	R1, #53011
MOVW	R0, #lo_addr(_Label16+20)
MOVT	R0, #hi_addr(_Label16+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1786 :: 		Label16.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+24)
MOVT	R0, #hi_addr(_Label16+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1787 :: 		Label16.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+28)
MOVT	R0, #hi_addr(_Label16+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1788 :: 		Label16.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+32)
MOVT	R0, #hi_addr(_Label16+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1789 :: 		Label16.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+36)
MOVT	R0, #hi_addr(_Label16+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1790 :: 		Label16.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+40)
MOVT	R0, #hi_addr(_Label16+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1792 :: 		Label17.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Label17+0)
MOVT	R0, #hi_addr(_Label17+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1793 :: 		Label17.Order           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Label17+4)
MOVT	R0, #hi_addr(_Label17+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1794 :: 		Label17.Left            = 195;
MOVS	R1, #195
MOVW	R0, #lo_addr(_Label17+6)
MOVT	R0, #hi_addr(_Label17+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1795 :: 		Label17.Top             = 192;
MOVS	R1, #192
MOVW	R0, #lo_addr(_Label17+8)
MOVT	R0, #hi_addr(_Label17+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1796 :: 		Label17.Width           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label17+10)
MOVT	R0, #hi_addr(_Label17+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1797 :: 		Label17.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label17+12)
MOVT	R0, #hi_addr(_Label17+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1798 :: 		Label17.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label17+26)
MOVT	R0, #hi_addr(_Label17+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1799 :: 		Label17.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label17+27)
MOVT	R0, #hi_addr(_Label17+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1800 :: 		Label17.Caption         = Label17_Caption;
MOVW	R1, #lo_addr(_Label17_Caption+0)
MOVT	R1, #hi_addr(_Label17_Caption+0)
MOVW	R0, #lo_addr(_Label17+16)
MOVT	R0, #hi_addr(_Label17+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1801 :: 		Label17.FontName        = Arial_Black11x15_Regular;
MOVW	R1, #53011
MOVW	R0, #lo_addr(_Label17+20)
MOVT	R0, #hi_addr(_Label17+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1802 :: 		Label17.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+24)
MOVT	R0, #hi_addr(_Label17+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1803 :: 		Label17.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+28)
MOVT	R0, #hi_addr(_Label17+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1804 :: 		Label17.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+32)
MOVT	R0, #hi_addr(_Label17+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1805 :: 		Label17.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+36)
MOVT	R0, #hi_addr(_Label17+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1806 :: 		Label17.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+40)
MOVT	R0, #hi_addr(_Label17+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1808 :: 		Line1.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Line1+0)
MOVT	R0, #hi_addr(_Line1+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1809 :: 		Line1.Order           = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Line1+4)
MOVT	R0, #hi_addr(_Line1+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1810 :: 		Line1.First_Point_X   = 238;
MOVS	R1, #238
MOVW	R0, #lo_addr(_Line1+6)
MOVT	R0, #hi_addr(_Line1+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1811 :: 		Line1.First_Point_Y   = 135;
MOVS	R1, #135
MOVW	R0, #lo_addr(_Line1+8)
MOVT	R0, #hi_addr(_Line1+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1812 :: 		Line1.Second_Point_X  = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_Line1+10)
MOVT	R0, #hi_addr(_Line1+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1813 :: 		Line1.Second_Point_Y  = 214;
MOVS	R1, #214
MOVW	R0, #lo_addr(_Line1+12)
MOVT	R0, #hi_addr(_Line1+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1814 :: 		Line1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Line1+15)
MOVT	R0, #hi_addr(_Line1+15)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1815 :: 		Line1.Pen_Width       = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Line1+14)
MOVT	R0, #hi_addr(_Line1+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1816 :: 		Line1.Color           = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Line1+16)
MOVT	R0, #hi_addr(_Line1+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1818 :: 		Label18.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_Label18+0)
MOVT	R0, #hi_addr(_Label18+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1819 :: 		Label18.Order           = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label18+4)
MOVT	R0, #hi_addr(_Label18+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1820 :: 		Label18.Left            = 222;
MOVS	R1, #222
MOVW	R0, #lo_addr(_Label18+6)
MOVT	R0, #hi_addr(_Label18+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1821 :: 		Label18.Top             = 103;
MOVS	R1, #103
MOVW	R0, #lo_addr(_Label18+8)
MOVT	R0, #hi_addr(_Label18+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1822 :: 		Label18.Width           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Label18+10)
MOVT	R0, #hi_addr(_Label18+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1823 :: 		Label18.Height          = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Label18+12)
MOVT	R0, #hi_addr(_Label18+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1824 :: 		Label18.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label18+26)
MOVT	R0, #hi_addr(_Label18+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1825 :: 		Label18.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label18+27)
MOVT	R0, #hi_addr(_Label18+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1826 :: 		Label18.Caption         = Label18_Caption;
MOVW	R1, #lo_addr(_Label18_Caption+0)
MOVT	R1, #hi_addr(_Label18_Caption+0)
MOVW	R0, #lo_addr(_Label18+16)
MOVT	R0, #hi_addr(_Label18+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1827 :: 		Label18.FontName        = Arial_Black43x60_Regular;
MOVW	R1, #31859
MOVW	R0, #lo_addr(_Label18+20)
MOVT	R0, #hi_addr(_Label18+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1828 :: 		Label18.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_Label18+24)
MOVT	R0, #hi_addr(_Label18+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1829 :: 		Label18.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+28)
MOVT	R0, #hi_addr(_Label18+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1830 :: 		Label18.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+32)
MOVT	R0, #hi_addr(_Label18+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1831 :: 		Label18.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+36)
MOVT	R0, #hi_addr(_Label18+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1832 :: 		Label18.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+40)
MOVT	R0, #hi_addr(_Label18+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1834 :: 		ButtonRound8.OwnerScreen     = &Speedometer_graphics;
MOVW	R1, #lo_addr(_Speedometer_graphics+0)
MOVT	R1, #hi_addr(_Speedometer_graphics+0)
MOVW	R0, #lo_addr(_ButtonRound8+0)
MOVT	R0, #hi_addr(_ButtonRound8+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1835 :: 		ButtonRound8.Order           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_ButtonRound8+4)
MOVT	R0, #hi_addr(_ButtonRound8+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1836 :: 		ButtonRound8.Left            = 378;
MOVW	R1, #378
MOVW	R0, #lo_addr(_ButtonRound8+6)
MOVT	R0, #hi_addr(_ButtonRound8+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1837 :: 		ButtonRound8.Top             = 165;
MOVS	R1, #165
MOVW	R0, #lo_addr(_ButtonRound8+8)
MOVT	R0, #hi_addr(_ButtonRound8+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1838 :: 		ButtonRound8.Width           = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_ButtonRound8+10)
MOVT	R0, #hi_addr(_ButtonRound8+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1839 :: 		ButtonRound8.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_ButtonRound8+12)
MOVT	R0, #hi_addr(_ButtonRound8+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1840 :: 		ButtonRound8.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+14)
MOVT	R0, #hi_addr(_ButtonRound8+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1841 :: 		ButtonRound8.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+16)
MOVT	R0, #hi_addr(_ButtonRound8+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1842 :: 		ButtonRound8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+18)
MOVT	R0, #hi_addr(_ButtonRound8+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1843 :: 		ButtonRound8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+19)
MOVT	R0, #hi_addr(_ButtonRound8+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1844 :: 		ButtonRound8.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+20)
MOVT	R0, #hi_addr(_ButtonRound8+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1845 :: 		ButtonRound8.Caption         = ButtonRound8_Caption;
MOVW	R1, #lo_addr(_ButtonRound8_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound8_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound8+24)
MOVT	R0, #hi_addr(_ButtonRound8+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1846 :: 		ButtonRound8.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+28)
MOVT	R0, #hi_addr(_ButtonRound8+28)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1847 :: 		ButtonRound8.FontName        = Arial_Black11x15_Regular;
MOVW	R1, #53011
MOVW	R0, #lo_addr(_ButtonRound8+32)
MOVT	R0, #hi_addr(_ButtonRound8+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1848 :: 		ButtonRound8.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+47)
MOVT	R0, #hi_addr(_ButtonRound8+47)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1849 :: 		ButtonRound8.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+36)
MOVT	R0, #hi_addr(_ButtonRound8+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1850 :: 		ButtonRound8.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+38)
MOVT	R0, #hi_addr(_ButtonRound8+38)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1851 :: 		ButtonRound8.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+39)
MOVT	R0, #hi_addr(_ButtonRound8+39)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1852 :: 		ButtonRound8.Gradient_Start_Color = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_ButtonRound8+40)
MOVT	R0, #hi_addr(_ButtonRound8+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1853 :: 		ButtonRound8.Gradient_End_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+42)
MOVT	R0, #hi_addr(_ButtonRound8+42)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1854 :: 		ButtonRound8.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound8+44)
MOVT	R0, #hi_addr(_ButtonRound8+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1855 :: 		ButtonRound8.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound8+48)
MOVT	R0, #hi_addr(_ButtonRound8+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1856 :: 		ButtonRound8.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound8+46)
MOVT	R0, #hi_addr(_ButtonRound8+46)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1857 :: 		ButtonRound8.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+52)
MOVT	R0, #hi_addr(_ButtonRound8+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1858 :: 		ButtonRound8.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+56)
MOVT	R0, #hi_addr(_ButtonRound8+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1859 :: 		ButtonRound8.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+60)
MOVT	R0, #hi_addr(_ButtonRound8+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1860 :: 		ButtonRound8.OnPressPtr      = doLog;
MOVW	R1, #lo_addr(_doLog+0)
MOVT	R1, #hi_addr(_doLog+0)
MOVW	R0, #lo_addr(_ButtonRound8+64)
MOVT	R0, #hi_addr(_ButtonRound8+64)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1862 :: 		Image40.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Image40+0)
MOVT	R0, #hi_addr(_Image40+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1863 :: 		Image40.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image40+4)
MOVT	R0, #hi_addr(_Image40+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1864 :: 		Image40.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image40+6)
MOVT	R0, #hi_addr(_Image40+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1865 :: 		Image40.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image40+8)
MOVT	R0, #hi_addr(_Image40+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1866 :: 		Image40.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image40+10)
MOVT	R0, #hi_addr(_Image40+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1867 :: 		Image40.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image40+12)
MOVT	R0, #hi_addr(_Image40+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1868 :: 		Image40.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image40+22)
MOVT	R0, #hi_addr(_Image40+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1869 :: 		Image40.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image40+23)
MOVT	R0, #hi_addr(_Image40+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1870 :: 		Image40.Picture_Name    = WaterTemperatureIcon_jpg;
MOVW	R1, #26372
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image40+16)
MOVT	R0, #hi_addr(_Image40+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1871 :: 		Image40.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image40+20)
MOVT	R0, #hi_addr(_Image40+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1872 :: 		Image40.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image40+21)
MOVT	R0, #hi_addr(_Image40+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1873 :: 		Image40.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image40+24)
MOVT	R0, #hi_addr(_Image40+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1874 :: 		Image40.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image40+28)
MOVT	R0, #hi_addr(_Image40+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1875 :: 		Image40.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image40+32)
MOVT	R0, #hi_addr(_Image40+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1876 :: 		Image40.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image40+36)
MOVT	R0, #hi_addr(_Image40+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1878 :: 		Image41.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Image41+0)
MOVT	R0, #hi_addr(_Image41+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1879 :: 		Image41.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image41+4)
MOVT	R0, #hi_addr(_Image41+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1880 :: 		Image41.Left            = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Image41+6)
MOVT	R0, #hi_addr(_Image41+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1881 :: 		Image41.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image41+8)
MOVT	R0, #hi_addr(_Image41+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1882 :: 		Image41.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image41+10)
MOVT	R0, #hi_addr(_Image41+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1883 :: 		Image41.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image41+12)
MOVT	R0, #hi_addr(_Image41+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1884 :: 		Image41.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image41+22)
MOVT	R0, #hi_addr(_Image41+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1885 :: 		Image41.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image41+23)
MOVT	R0, #hi_addr(_Image41+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1886 :: 		Image41.Picture_Name    = HeadlightIcon_jpg;
MOVW	R1, #36384
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image41+16)
MOVT	R0, #hi_addr(_Image41+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1887 :: 		Image41.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image41+20)
MOVT	R0, #hi_addr(_Image41+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1888 :: 		Image41.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image41+21)
MOVT	R0, #hi_addr(_Image41+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1889 :: 		Image41.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image41+24)
MOVT	R0, #hi_addr(_Image41+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1890 :: 		Image41.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image41+28)
MOVT	R0, #hi_addr(_Image41+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1891 :: 		Image41.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image41+32)
MOVT	R0, #hi_addr(_Image41+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1892 :: 		Image41.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image41+36)
MOVT	R0, #hi_addr(_Image41+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1894 :: 		Image42.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Image42+0)
MOVT	R0, #hi_addr(_Image42+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1895 :: 		Image42.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Image42+4)
MOVT	R0, #hi_addr(_Image42+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1896 :: 		Image42.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image42+6)
MOVT	R0, #hi_addr(_Image42+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1897 :: 		Image42.Top             = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Image42+8)
MOVT	R0, #hi_addr(_Image42+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1898 :: 		Image42.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image42+10)
MOVT	R0, #hi_addr(_Image42+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1899 :: 		Image42.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image42+12)
MOVT	R0, #hi_addr(_Image42+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1900 :: 		Image42.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image42+22)
MOVT	R0, #hi_addr(_Image42+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1901 :: 		Image42.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image42+23)
MOVT	R0, #hi_addr(_Image42+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1902 :: 		Image42.Picture_Name    = fuel_jpg;
MOVW	R1, #31378
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image42+16)
MOVT	R0, #hi_addr(_Image42+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1903 :: 		Image42.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image42+20)
MOVT	R0, #hi_addr(_Image42+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1904 :: 		Image42.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image42+21)
MOVT	R0, #hi_addr(_Image42+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1905 :: 		Image42.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image42+24)
MOVT	R0, #hi_addr(_Image42+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1906 :: 		Image42.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image42+28)
MOVT	R0, #hi_addr(_Image42+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1907 :: 		Image42.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image42+32)
MOVT	R0, #hi_addr(_Image42+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1908 :: 		Image42.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image42+36)
MOVT	R0, #hi_addr(_Image42+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1910 :: 		Image43.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Image43+0)
MOVT	R0, #hi_addr(_Image43+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1911 :: 		Image43.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Image43+4)
MOVT	R0, #hi_addr(_Image43+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1912 :: 		Image43.Left            = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Image43+6)
MOVT	R0, #hi_addr(_Image43+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1913 :: 		Image43.Top             = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Image43+8)
MOVT	R0, #hi_addr(_Image43+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1914 :: 		Image43.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image43+10)
MOVT	R0, #hi_addr(_Image43+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1915 :: 		Image43.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image43+12)
MOVT	R0, #hi_addr(_Image43+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1916 :: 		Image43.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image43+22)
MOVT	R0, #hi_addr(_Image43+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1917 :: 		Image43.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image43+23)
MOVT	R0, #hi_addr(_Image43+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1918 :: 		Image43.Picture_Name    = OilAlertIcon_jpg;
MOVW	R1, #41390
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image43+16)
MOVT	R0, #hi_addr(_Image43+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1919 :: 		Image43.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image43+20)
MOVT	R0, #hi_addr(_Image43+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1920 :: 		Image43.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image43+21)
MOVT	R0, #hi_addr(_Image43+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1921 :: 		Image43.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image43+24)
MOVT	R0, #hi_addr(_Image43+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1922 :: 		Image43.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image43+28)
MOVT	R0, #hi_addr(_Image43+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1923 :: 		Image43.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image43+32)
MOVT	R0, #hi_addr(_Image43+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1924 :: 		Image43.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image43+36)
MOVT	R0, #hi_addr(_Image43+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1926 :: 		Image44.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Image44+0)
MOVT	R0, #hi_addr(_Image44+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1927 :: 		Image44.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image44+4)
MOVT	R0, #hi_addr(_Image44+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1928 :: 		Image44.Left            = 55;
MOVS	R1, #55
MOVW	R0, #lo_addr(_Image44+6)
MOVT	R0, #hi_addr(_Image44+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1929 :: 		Image44.Top             = 116;
MOVS	R1, #116
MOVW	R0, #lo_addr(_Image44+8)
MOVT	R0, #hi_addr(_Image44+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1930 :: 		Image44.Width           = 51;
MOVS	R1, #51
MOVW	R0, #lo_addr(_Image44+10)
MOVT	R0, #hi_addr(_Image44+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1931 :: 		Image44.Height          = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Image44+12)
MOVT	R0, #hi_addr(_Image44+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1932 :: 		Image44.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image44+22)
MOVT	R0, #hi_addr(_Image44+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1933 :: 		Image44.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image44+23)
MOVT	R0, #hi_addr(_Image44+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1934 :: 		Image44.Picture_Name    = red_left_arrow_103_jpg;
MOVW	R1, #51402
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image44+16)
MOVT	R0, #hi_addr(_Image44+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1935 :: 		Image44.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image44+20)
MOVT	R0, #hi_addr(_Image44+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1936 :: 		Image44.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image44+21)
MOVT	R0, #hi_addr(_Image44+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1937 :: 		Image44.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image44+24)
MOVT	R0, #hi_addr(_Image44+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1938 :: 		Image44.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image44+28)
MOVT	R0, #hi_addr(_Image44+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1939 :: 		Image44.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image44+32)
MOVT	R0, #hi_addr(_Image44+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1940 :: 		Image44.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image44+36)
MOVT	R0, #hi_addr(_Image44+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1942 :: 		Image45.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Image45+0)
MOVT	R0, #hi_addr(_Image45+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1943 :: 		Image45.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image45+4)
MOVT	R0, #hi_addr(_Image45+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1944 :: 		Image45.Left            = 373;
MOVW	R1, #373
MOVW	R0, #lo_addr(_Image45+6)
MOVT	R0, #hi_addr(_Image45+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1945 :: 		Image45.Top             = 116;
MOVS	R1, #116
MOVW	R0, #lo_addr(_Image45+8)
MOVT	R0, #hi_addr(_Image45+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1946 :: 		Image45.Width           = 51;
MOVS	R1, #51
MOVW	R0, #lo_addr(_Image45+10)
MOVT	R0, #hi_addr(_Image45+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1947 :: 		Image45.Height          = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Image45+12)
MOVT	R0, #hi_addr(_Image45+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1948 :: 		Image45.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image45+22)
MOVT	R0, #hi_addr(_Image45+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1949 :: 		Image45.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image45+23)
MOVT	R0, #hi_addr(_Image45+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1950 :: 		Image45.Picture_Name    = red_left_arrow_copy_jpg;
MOVW	R1, #55386
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image45+16)
MOVT	R0, #hi_addr(_Image45+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1951 :: 		Image45.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image45+20)
MOVT	R0, #hi_addr(_Image45+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1952 :: 		Image45.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image45+21)
MOVT	R0, #hi_addr(_Image45+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1953 :: 		Image45.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image45+24)
MOVT	R0, #hi_addr(_Image45+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1954 :: 		Image45.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image45+28)
MOVT	R0, #hi_addr(_Image45+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1955 :: 		Image45.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image45+32)
MOVT	R0, #hi_addr(_Image45+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1956 :: 		Image45.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image45+36)
MOVT	R0, #hi_addr(_Image45+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1958 :: 		Label20.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Label20+0)
MOVT	R0, #hi_addr(_Label20+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1959 :: 		Label20.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label20+4)
MOVT	R0, #hi_addr(_Label20+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1960 :: 		Label20.Left            = 33;
MOVS	R1, #33
MOVW	R0, #lo_addr(_Label20+6)
MOVT	R0, #hi_addr(_Label20+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1961 :: 		Label20.Top             = 189;
MOVS	R1, #189
MOVW	R0, #lo_addr(_Label20+8)
MOVT	R0, #hi_addr(_Label20+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1962 :: 		Label20.Width           = 69;
MOVS	R1, #69
MOVW	R0, #lo_addr(_Label20+10)
MOVT	R0, #hi_addr(_Label20+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1963 :: 		Label20.Height          = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_Label20+12)
MOVT	R0, #hi_addr(_Label20+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1964 :: 		Label20.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label20+26)
MOVT	R0, #hi_addr(_Label20+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1965 :: 		Label20.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label20+27)
MOVT	R0, #hi_addr(_Label20+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1966 :: 		Label20.Caption         = Label20_Caption;
MOVW	R1, #lo_addr(_Label20_Caption+0)
MOVT	R1, #hi_addr(_Label20_Caption+0)
MOVW	R0, #lo_addr(_Label20+16)
MOVT	R0, #hi_addr(_Label20+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1967 :: 		Label20.FontName        = Arial_Black27x38_Regular;
MOVW	R1, #14431
MOVW	R0, #lo_addr(_Label20+20)
MOVT	R0, #hi_addr(_Label20+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1968 :: 		Label20.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label20+24)
MOVT	R0, #hi_addr(_Label20+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1969 :: 		Label20.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+28)
MOVT	R0, #hi_addr(_Label20+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1970 :: 		Label20.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+32)
MOVT	R0, #hi_addr(_Label20+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1971 :: 		Label20.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+36)
MOVT	R0, #hi_addr(_Label20+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1972 :: 		Label20.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+40)
MOVT	R0, #hi_addr(_Label20+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1974 :: 		Label21.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Label21+0)
MOVT	R0, #hi_addr(_Label21+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1975 :: 		Label21.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Label21+4)
MOVT	R0, #hi_addr(_Label21+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1976 :: 		Label21.Left            = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Label21+6)
MOVT	R0, #hi_addr(_Label21+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1977 :: 		Label21.Top             = 213;
MOVS	R1, #213
MOVW	R0, #lo_addr(_Label21+8)
MOVT	R0, #hi_addr(_Label21+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1978 :: 		Label21.Width           = 89;
MOVS	R1, #89
MOVW	R0, #lo_addr(_Label21+10)
MOVT	R0, #hi_addr(_Label21+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1979 :: 		Label21.Height          = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Label21+12)
MOVT	R0, #hi_addr(_Label21+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1980 :: 		Label21.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label21+26)
MOVT	R0, #hi_addr(_Label21+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1981 :: 		Label21.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label21+27)
MOVT	R0, #hi_addr(_Label21+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1982 :: 		Label21.Caption         = Label21_Caption;
MOVW	R1, #lo_addr(_Label21_Caption+0)
MOVT	R1, #hi_addr(_Label21_Caption+0)
MOVW	R0, #lo_addr(_Label21+16)
MOVT	R0, #hi_addr(_Label21+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1983 :: 		Label21.FontName        = Arial_Black43x60_Regular;
MOVW	R1, #31859
MOVW	R0, #lo_addr(_Label21+20)
MOVT	R0, #hi_addr(_Label21+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1984 :: 		Label21.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label21+24)
MOVT	R0, #hi_addr(_Label21+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1985 :: 		Label21.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+28)
MOVT	R0, #hi_addr(_Label21+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1986 :: 		Label21.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+32)
MOVT	R0, #hi_addr(_Label21+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1987 :: 		Label21.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+36)
MOVT	R0, #hi_addr(_Label21+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1988 :: 		Label21.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+40)
MOVT	R0, #hi_addr(_Label21+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1990 :: 		Label22.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Label22+0)
MOVT	R0, #hi_addr(_Label22+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1991 :: 		Label22.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label22+4)
MOVT	R0, #hi_addr(_Label22+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1992 :: 		Label22.Left            = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label22+6)
MOVT	R0, #hi_addr(_Label22+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1993 :: 		Label22.Top             = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label22+8)
MOVT	R0, #hi_addr(_Label22+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1994 :: 		Label22.Width           = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Label22+10)
MOVT	R0, #hi_addr(_Label22+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1995 :: 		Label22.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label22+12)
MOVT	R0, #hi_addr(_Label22+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,1996 :: 		Label22.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label22+26)
MOVT	R0, #hi_addr(_Label22+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1997 :: 		Label22.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label22+27)
MOVT	R0, #hi_addr(_Label22+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,1998 :: 		Label22.Caption         = Label22_Caption;
MOVW	R1, #lo_addr(_Label22_Caption+0)
MOVT	R1, #hi_addr(_Label22_Caption+0)
MOVW	R0, #lo_addr(_Label22+16)
MOVT	R0, #hi_addr(_Label22+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,1999 :: 		Label22.FontName        = Arial_Black11x15_Regular;
MOVW	R1, #53011
MOVW	R0, #lo_addr(_Label22+20)
MOVT	R0, #hi_addr(_Label22+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2000 :: 		Label22.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label22+24)
MOVT	R0, #hi_addr(_Label22+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2001 :: 		Label22.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+28)
MOVT	R0, #hi_addr(_Label22+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2002 :: 		Label22.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+32)
MOVT	R0, #hi_addr(_Label22+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2003 :: 		Label22.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+36)
MOVT	R0, #hi_addr(_Label22+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2004 :: 		Label22.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+40)
MOVT	R0, #hi_addr(_Label22+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2006 :: 		Box12.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Box12+0)
MOVT	R0, #hi_addr(_Box12+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2007 :: 		Box12.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Box12+4)
MOVT	R0, #hi_addr(_Box12+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2008 :: 		Box12.Left            = 350;
MOVW	R1, #350
MOVW	R0, #lo_addr(_Box12+6)
MOVT	R0, #hi_addr(_Box12+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2009 :: 		Box12.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_Box12+8)
MOVT	R0, #hi_addr(_Box12+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2010 :: 		Box12.Width           = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_Box12+10)
MOVT	R0, #hi_addr(_Box12+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2011 :: 		Box12.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Box12+12)
MOVT	R0, #hi_addr(_Box12+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2012 :: 		Box12.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box12+14)
MOVT	R0, #hi_addr(_Box12+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2013 :: 		Box12.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+16)
MOVT	R0, #hi_addr(_Box12+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2014 :: 		Box12.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box12+18)
MOVT	R0, #hi_addr(_Box12+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2015 :: 		Box12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box12+19)
MOVT	R0, #hi_addr(_Box12+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2016 :: 		Box12.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box12+20)
MOVT	R0, #hi_addr(_Box12+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2017 :: 		Box12.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box12+21)
MOVT	R0, #hi_addr(_Box12+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2018 :: 		Box12.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+22)
MOVT	R0, #hi_addr(_Box12+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2019 :: 		Box12.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box12+24)
MOVT	R0, #hi_addr(_Box12+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2020 :: 		Box12.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box12+26)
MOVT	R0, #hi_addr(_Box12+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2021 :: 		Box12.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box12+28)
MOVT	R0, #hi_addr(_Box12+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2022 :: 		Box12.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box12+30)
MOVT	R0, #hi_addr(_Box12+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2023 :: 		Box12.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box12+32)
MOVT	R0, #hi_addr(_Box12+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2024 :: 		Box12.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+36)
MOVT	R0, #hi_addr(_Box12+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2025 :: 		Box12.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+40)
MOVT	R0, #hi_addr(_Box12+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2026 :: 		Box12.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+44)
MOVT	R0, #hi_addr(_Box12+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2027 :: 		Box12.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+48)
MOVT	R0, #hi_addr(_Box12+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2029 :: 		Label23.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Label23+0)
MOVT	R0, #hi_addr(_Label23+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2030 :: 		Label23.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Label23+4)
MOVT	R0, #hi_addr(_Label23+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2031 :: 		Label23.Left            = 353;
MOVW	R1, #353
MOVW	R0, #lo_addr(_Label23+6)
MOVT	R0, #hi_addr(_Label23+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2032 :: 		Label23.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_Label23+8)
MOVT	R0, #hi_addr(_Label23+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2033 :: 		Label23.Width           = 69;
MOVS	R1, #69
MOVW	R0, #lo_addr(_Label23+10)
MOVT	R0, #hi_addr(_Label23+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2034 :: 		Label23.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label23+12)
MOVT	R0, #hi_addr(_Label23+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2035 :: 		Label23.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label23+26)
MOVT	R0, #hi_addr(_Label23+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2036 :: 		Label23.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label23+27)
MOVT	R0, #hi_addr(_Label23+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2037 :: 		Label23.Caption         = Label23_Caption;
MOVW	R1, #lo_addr(_Label23_Caption+0)
MOVT	R1, #hi_addr(_Label23_Caption+0)
MOVW	R0, #lo_addr(_Label23+16)
MOVT	R0, #hi_addr(_Label23+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2038 :: 		Label23.FontName        = Arial_Black11x15_Regular;
MOVW	R1, #53011
MOVW	R0, #lo_addr(_Label23+20)
MOVT	R0, #hi_addr(_Label23+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2039 :: 		Label23.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+24)
MOVT	R0, #hi_addr(_Label23+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2040 :: 		Label23.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+28)
MOVT	R0, #hi_addr(_Label23+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2041 :: 		Label23.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+32)
MOVT	R0, #hi_addr(_Label23+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2042 :: 		Label23.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+36)
MOVT	R0, #hi_addr(_Label23+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2043 :: 		Label23.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+40)
MOVT	R0, #hi_addr(_Label23+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2045 :: 		Image46.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Image46+0)
MOVT	R0, #hi_addr(_Image46+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2046 :: 		Image46.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Image46+4)
MOVT	R0, #hi_addr(_Image46+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2047 :: 		Image46.Left            = 429;
MOVW	R1, #429
MOVW	R0, #lo_addr(_Image46+6)
MOVT	R0, #hi_addr(_Image46+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2048 :: 		Image46.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_Image46+8)
MOVT	R0, #hi_addr(_Image46+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2049 :: 		Image46.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image46+10)
MOVT	R0, #hi_addr(_Image46+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2050 :: 		Image46.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image46+12)
MOVT	R0, #hi_addr(_Image46+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2051 :: 		Image46.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image46+22)
MOVT	R0, #hi_addr(_Image46+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2052 :: 		Image46.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image46+23)
MOVT	R0, #hi_addr(_Image46+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2053 :: 		Image46.Picture_Name    = Settings_icon_JPG;
MOVW	R1, #46396
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image46+16)
MOVT	R0, #hi_addr(_Image46+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2054 :: 		Image46.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image46+20)
MOVT	R0, #hi_addr(_Image46+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2055 :: 		Image46.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image46+21)
MOVT	R0, #hi_addr(_Image46+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2056 :: 		Image46.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image46+24)
MOVT	R0, #hi_addr(_Image46+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2057 :: 		Image46.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image46+28)
MOVT	R0, #hi_addr(_Image46+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2058 :: 		Image46.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image46+32)
MOVT	R0, #hi_addr(_Image46+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2059 :: 		Image46.OnPressPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Image46+36)
MOVT	R0, #hi_addr(_Image46+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2061 :: 		ButtonRound9.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_ButtonRound9+0)
MOVT	R0, #hi_addr(_ButtonRound9+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2062 :: 		ButtonRound9.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_ButtonRound9+4)
MOVT	R0, #hi_addr(_ButtonRound9+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2063 :: 		ButtonRound9.Left            = 378;
MOVW	R1, #378
MOVW	R0, #lo_addr(_ButtonRound9+6)
MOVT	R0, #hi_addr(_ButtonRound9+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2064 :: 		ButtonRound9.Top             = 165;
MOVS	R1, #165
MOVW	R0, #lo_addr(_ButtonRound9+8)
MOVT	R0, #hi_addr(_ButtonRound9+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2065 :: 		ButtonRound9.Width           = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_ButtonRound9+10)
MOVT	R0, #hi_addr(_ButtonRound9+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2066 :: 		ButtonRound9.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_ButtonRound9+12)
MOVT	R0, #hi_addr(_ButtonRound9+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2067 :: 		ButtonRound9.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+14)
MOVT	R0, #hi_addr(_ButtonRound9+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2068 :: 		ButtonRound9.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+16)
MOVT	R0, #hi_addr(_ButtonRound9+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2069 :: 		ButtonRound9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+18)
MOVT	R0, #hi_addr(_ButtonRound9+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2070 :: 		ButtonRound9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+19)
MOVT	R0, #hi_addr(_ButtonRound9+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2071 :: 		ButtonRound9.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+20)
MOVT	R0, #hi_addr(_ButtonRound9+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2072 :: 		ButtonRound9.Caption         = ButtonRound9_Caption;
MOVW	R1, #lo_addr(_ButtonRound9_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound9_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound9+24)
MOVT	R0, #hi_addr(_ButtonRound9+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2073 :: 		ButtonRound9.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+28)
MOVT	R0, #hi_addr(_ButtonRound9+28)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2074 :: 		ButtonRound9.FontName        = Arial_Black11x15_Regular;
MOVW	R1, #53011
MOVW	R0, #lo_addr(_ButtonRound9+32)
MOVT	R0, #hi_addr(_ButtonRound9+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2075 :: 		ButtonRound9.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+47)
MOVT	R0, #hi_addr(_ButtonRound9+47)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2076 :: 		ButtonRound9.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+36)
MOVT	R0, #hi_addr(_ButtonRound9+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2077 :: 		ButtonRound9.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+38)
MOVT	R0, #hi_addr(_ButtonRound9+38)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2078 :: 		ButtonRound9.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+39)
MOVT	R0, #hi_addr(_ButtonRound9+39)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2079 :: 		ButtonRound9.Gradient_Start_Color = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_ButtonRound9+40)
MOVT	R0, #hi_addr(_ButtonRound9+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2080 :: 		ButtonRound9.Gradient_End_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+42)
MOVT	R0, #hi_addr(_ButtonRound9+42)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2081 :: 		ButtonRound9.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound9+44)
MOVT	R0, #hi_addr(_ButtonRound9+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2082 :: 		ButtonRound9.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound9+48)
MOVT	R0, #hi_addr(_ButtonRound9+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2083 :: 		ButtonRound9.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound9+46)
MOVT	R0, #hi_addr(_ButtonRound9+46)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2084 :: 		ButtonRound9.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+52)
MOVT	R0, #hi_addr(_ButtonRound9+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2085 :: 		ButtonRound9.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+56)
MOVT	R0, #hi_addr(_ButtonRound9+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2086 :: 		ButtonRound9.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+60)
MOVT	R0, #hi_addr(_ButtonRound9+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2087 :: 		ButtonRound9.OnPressPtr      = doLog;
MOVW	R1, #lo_addr(_doLog+0)
MOVT	R1, #hi_addr(_doLog+0)
MOVW	R0, #lo_addr(_ButtonRound9+64)
MOVT	R0, #hi_addr(_ButtonRound9+64)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2089 :: 		Label24.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Label24+0)
MOVT	R0, #hi_addr(_Label24+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2090 :: 		Label24.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label24+4)
MOVT	R0, #hi_addr(_Label24+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2091 :: 		Label24.Left            = 373;
MOVW	R1, #373
MOVW	R0, #lo_addr(_Label24+6)
MOVT	R0, #hi_addr(_Label24+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2092 :: 		Label24.Top             = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Label24+8)
MOVT	R0, #hi_addr(_Label24+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2093 :: 		Label24.Width           = 56;
MOVS	R1, #56
MOVW	R0, #lo_addr(_Label24+10)
MOVT	R0, #hi_addr(_Label24+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2094 :: 		Label24.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label24+12)
MOVT	R0, #hi_addr(_Label24+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2095 :: 		Label24.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label24+26)
MOVT	R0, #hi_addr(_Label24+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2096 :: 		Label24.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label24+27)
MOVT	R0, #hi_addr(_Label24+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2097 :: 		Label24.Caption         = Label24_Caption;
MOVW	R1, #lo_addr(_Label24_Caption+0)
MOVT	R1, #hi_addr(_Label24_Caption+0)
MOVW	R0, #lo_addr(_Label24+16)
MOVT	R0, #hi_addr(_Label24+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2098 :: 		Label24.FontName        = Arial_Black16x23_Regular;
MOVW	R1, #2595
MOVW	R0, #lo_addr(_Label24+20)
MOVT	R0, #hi_addr(_Label24+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2099 :: 		Label24.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label24+24)
MOVT	R0, #hi_addr(_Label24+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2100 :: 		Label24.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+28)
MOVT	R0, #hi_addr(_Label24+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2101 :: 		Label24.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+32)
MOVT	R0, #hi_addr(_Label24+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2102 :: 		Label24.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+36)
MOVT	R0, #hi_addr(_Label24+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2103 :: 		Label24.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+40)
MOVT	R0, #hi_addr(_Label24+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2105 :: 		Label25.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Label25+0)
MOVT	R0, #hi_addr(_Label25+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2106 :: 		Label25.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label25+4)
MOVT	R0, #hi_addr(_Label25+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2107 :: 		Label25.Left            = 365;
MOVW	R1, #365
MOVW	R0, #lo_addr(_Label25+6)
MOVT	R0, #hi_addr(_Label25+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2108 :: 		Label25.Top             = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label25+8)
MOVT	R0, #hi_addr(_Label25+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2109 :: 		Label25.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_Label25+10)
MOVT	R0, #hi_addr(_Label25+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2110 :: 		Label25.Height          = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label25+12)
MOVT	R0, #hi_addr(_Label25+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2111 :: 		Label25.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label25+26)
MOVT	R0, #hi_addr(_Label25+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2112 :: 		Label25.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label25+27)
MOVT	R0, #hi_addr(_Label25+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2113 :: 		Label25.Caption         = Label25_Caption;
MOVW	R1, #lo_addr(_Label25_Caption+0)
MOVT	R1, #hi_addr(_Label25_Caption+0)
MOVW	R0, #lo_addr(_Label25+16)
MOVT	R0, #hi_addr(_Label25+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2114 :: 		Label25.FontName        = Arial_Black21x30_Regular;
MOVW	R1, #8609
MOVW	R0, #lo_addr(_Label25+20)
MOVT	R0, #hi_addr(_Label25+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2115 :: 		Label25.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label25+24)
MOVT	R0, #hi_addr(_Label25+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2116 :: 		Label25.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+28)
MOVT	R0, #hi_addr(_Label25+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2117 :: 		Label25.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+32)
MOVT	R0, #hi_addr(_Label25+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2118 :: 		Label25.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+36)
MOVT	R0, #hi_addr(_Label25+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2119 :: 		Label25.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+40)
MOVT	R0, #hi_addr(_Label25+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2121 :: 		Image47.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Image47+0)
MOVT	R0, #hi_addr(_Image47+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2122 :: 		Image47.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Image47+4)
MOVT	R0, #hi_addr(_Image47+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2123 :: 		Image47.Left            = 432;
MOVW	R1, #432
MOVW	R0, #lo_addr(_Image47+6)
MOVT	R0, #hi_addr(_Image47+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2124 :: 		Image47.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image47+8)
MOVT	R0, #hi_addr(_Image47+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2125 :: 		Image47.Width           = 44;
MOVS	R1, #44
MOVW	R0, #lo_addr(_Image47+10)
MOVT	R0, #hi_addr(_Image47+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2126 :: 		Image47.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Image47+12)
MOVT	R0, #hi_addr(_Image47+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2127 :: 		Image47.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image47+22)
MOVT	R0, #hi_addr(_Image47+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2128 :: 		Image47.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image47+23)
MOVT	R0, #hi_addr(_Image47+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2129 :: 		Image47.Picture_Name    = icon_battery_bmp;
MOVW	R1, #24606
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image47+16)
MOVT	R0, #hi_addr(_Image47+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2130 :: 		Image47.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image47+20)
MOVT	R0, #hi_addr(_Image47+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2131 :: 		Image47.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image47+21)
MOVT	R0, #hi_addr(_Image47+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2132 :: 		Image47.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image47+24)
MOVT	R0, #hi_addr(_Image47+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2133 :: 		Image47.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image47+28)
MOVT	R0, #hi_addr(_Image47+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2134 :: 		Image47.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image47+32)
MOVT	R0, #hi_addr(_Image47+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2135 :: 		Image47.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image47+36)
MOVT	R0, #hi_addr(_Image47+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2137 :: 		Label26.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Label26+0)
MOVT	R0, #hi_addr(_Label26+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2138 :: 		Label26.Order           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label26+4)
MOVT	R0, #hi_addr(_Label26+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2139 :: 		Label26.Left            = 198;
MOVS	R1, #198
MOVW	R0, #lo_addr(_Label26+6)
MOVT	R0, #hi_addr(_Label26+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2140 :: 		Label26.Top             = 203;
MOVS	R1, #203
MOVW	R0, #lo_addr(_Label26+8)
MOVT	R0, #hi_addr(_Label26+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2141 :: 		Label26.Width           = 86;
MOVS	R1, #86
MOVW	R0, #lo_addr(_Label26+10)
MOVT	R0, #hi_addr(_Label26+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2142 :: 		Label26.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label26+12)
MOVT	R0, #hi_addr(_Label26+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2143 :: 		Label26.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label26+26)
MOVT	R0, #hi_addr(_Label26+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2144 :: 		Label26.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label26+27)
MOVT	R0, #hi_addr(_Label26+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2145 :: 		Label26.Caption         = Label26_Caption;
MOVW	R1, #lo_addr(_Label26_Caption+0)
MOVT	R1, #hi_addr(_Label26_Caption+0)
MOVW	R0, #lo_addr(_Label26+16)
MOVT	R0, #hi_addr(_Label26+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2146 :: 		Label26.FontName        = Arial_Black16x23_Regular;
MOVW	R1, #2595
MOVW	R0, #lo_addr(_Label26+20)
MOVT	R0, #hi_addr(_Label26+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2147 :: 		Label26.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+24)
MOVT	R0, #hi_addr(_Label26+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2148 :: 		Label26.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+28)
MOVT	R0, #hi_addr(_Label26+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2149 :: 		Label26.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+32)
MOVT	R0, #hi_addr(_Label26+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2150 :: 		Label26.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+36)
MOVT	R0, #hi_addr(_Label26+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2151 :: 		Label26.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+40)
MOVT	R0, #hi_addr(_Label26+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2153 :: 		Label27.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Label27+0)
MOVT	R0, #hi_addr(_Label27+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2154 :: 		Label27.Order           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Label27+4)
MOVT	R0, #hi_addr(_Label27+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2155 :: 		Label27.Left            = 218;
MOVS	R1, #218
MOVW	R0, #lo_addr(_Label27+6)
MOVT	R0, #hi_addr(_Label27+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2156 :: 		Label27.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_Label27+8)
MOVT	R0, #hi_addr(_Label27+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2157 :: 		Label27.Width           = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_Label27+10)
MOVT	R0, #hi_addr(_Label27+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2158 :: 		Label27.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label27+12)
MOVT	R0, #hi_addr(_Label27+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2159 :: 		Label27.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label27+26)
MOVT	R0, #hi_addr(_Label27+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2160 :: 		Label27.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label27+27)
MOVT	R0, #hi_addr(_Label27+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2161 :: 		Label27.Caption         = Label27_Caption;
MOVW	R1, #lo_addr(_Label27_Caption+0)
MOVT	R1, #hi_addr(_Label27_Caption+0)
MOVW	R0, #lo_addr(_Label27+16)
MOVT	R0, #hi_addr(_Label27+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2162 :: 		Label27.FontName        = Arial_Black11x15_Regular;
MOVW	R1, #53011
MOVW	R0, #lo_addr(_Label27+20)
MOVT	R0, #hi_addr(_Label27+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2163 :: 		Label27.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+24)
MOVT	R0, #hi_addr(_Label27+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2164 :: 		Label27.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+28)
MOVT	R0, #hi_addr(_Label27+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2165 :: 		Label27.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+32)
MOVT	R0, #hi_addr(_Label27+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2166 :: 		Label27.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+36)
MOVT	R0, #hi_addr(_Label27+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2167 :: 		Label27.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+40)
MOVT	R0, #hi_addr(_Label27+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2169 :: 		Label28.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Label28+0)
MOVT	R0, #hi_addr(_Label28+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2170 :: 		Label28.Order           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Label28+4)
MOVT	R0, #hi_addr(_Label28+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2171 :: 		Label28.Left            = 195;
MOVS	R1, #195
MOVW	R0, #lo_addr(_Label28+6)
MOVT	R0, #hi_addr(_Label28+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2172 :: 		Label28.Top             = 192;
MOVS	R1, #192
MOVW	R0, #lo_addr(_Label28+8)
MOVT	R0, #hi_addr(_Label28+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2173 :: 		Label28.Width           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label28+10)
MOVT	R0, #hi_addr(_Label28+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2174 :: 		Label28.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label28+12)
MOVT	R0, #hi_addr(_Label28+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2175 :: 		Label28.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label28+26)
MOVT	R0, #hi_addr(_Label28+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2176 :: 		Label28.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label28+27)
MOVT	R0, #hi_addr(_Label28+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2177 :: 		Label28.Caption         = Label28_Caption;
MOVW	R1, #lo_addr(_Label28_Caption+0)
MOVT	R1, #hi_addr(_Label28_Caption+0)
MOVW	R0, #lo_addr(_Label28+16)
MOVT	R0, #hi_addr(_Label28+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2178 :: 		Label28.FontName        = Arial_Black11x15_Regular;
MOVW	R1, #53011
MOVW	R0, #lo_addr(_Label28+20)
MOVT	R0, #hi_addr(_Label28+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2179 :: 		Label28.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+24)
MOVT	R0, #hi_addr(_Label28+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2180 :: 		Label28.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+28)
MOVT	R0, #hi_addr(_Label28+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2181 :: 		Label28.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+32)
MOVT	R0, #hi_addr(_Label28+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2182 :: 		Label28.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+36)
MOVT	R0, #hi_addr(_Label28+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2183 :: 		Label28.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+40)
MOVT	R0, #hi_addr(_Label28+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2185 :: 		CircleButton2.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_CircleButton2+0)
MOVT	R0, #hi_addr(_CircleButton2+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2186 :: 		CircleButton2.Order           = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_CircleButton2+4)
MOVT	R0, #hi_addr(_CircleButton2+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2187 :: 		CircleButton2.Left            = 216;
MOVS	R1, #216
MOVW	R0, #lo_addr(_CircleButton2+6)
MOVT	R0, #hi_addr(_CircleButton2+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2188 :: 		CircleButton2.Top             = 112;
MOVS	R1, #112
MOVW	R0, #lo_addr(_CircleButton2+8)
MOVT	R0, #hi_addr(_CircleButton2+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2189 :: 		CircleButton2.Radius          = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_CircleButton2+10)
MOVT	R0, #hi_addr(_CircleButton2+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2190 :: 		CircleButton2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+12)
MOVT	R0, #hi_addr(_CircleButton2+12)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2191 :: 		CircleButton2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+14)
MOVT	R0, #hi_addr(_CircleButton2+14)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2192 :: 		CircleButton2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+16)
MOVT	R0, #hi_addr(_CircleButton2+16)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2193 :: 		CircleButton2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+17)
MOVT	R0, #hi_addr(_CircleButton2+17)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2194 :: 		CircleButton2.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+18)
MOVT	R0, #hi_addr(_CircleButton2+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2195 :: 		CircleButton2.Caption         = CircleButton2_Caption;
MOVW	R1, #lo_addr(_CircleButton2_Caption+0)
MOVT	R1, #hi_addr(_CircleButton2_Caption+0)
MOVW	R0, #lo_addr(_CircleButton2+20)
MOVT	R0, #hi_addr(_CircleButton2+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2196 :: 		CircleButton2.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+24)
MOVT	R0, #hi_addr(_CircleButton2+24)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2197 :: 		CircleButton2.FontName        = Tahoma11x13_Regular;
MOVW	R1, #25308
MOVT	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+28)
MOVT	R0, #hi_addr(_CircleButton2+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2198 :: 		CircleButton2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+42)
MOVT	R0, #hi_addr(_CircleButton2+42)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2199 :: 		CircleButton2.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+32)
MOVT	R0, #hi_addr(_CircleButton2+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2200 :: 		CircleButton2.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+34)
MOVT	R0, #hi_addr(_CircleButton2+34)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2201 :: 		CircleButton2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+35)
MOVT	R0, #hi_addr(_CircleButton2+35)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2202 :: 		CircleButton2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_CircleButton2+36)
MOVT	R0, #hi_addr(_CircleButton2+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2203 :: 		CircleButton2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CircleButton2+38)
MOVT	R0, #hi_addr(_CircleButton2+38)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2204 :: 		CircleButton2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CircleButton2+40)
MOVT	R0, #hi_addr(_CircleButton2+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2205 :: 		CircleButton2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_CircleButton2+44)
MOVT	R0, #hi_addr(_CircleButton2+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2206 :: 		CircleButton2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+48)
MOVT	R0, #hi_addr(_CircleButton2+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2207 :: 		CircleButton2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+52)
MOVT	R0, #hi_addr(_CircleButton2+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2208 :: 		CircleButton2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+56)
MOVT	R0, #hi_addr(_CircleButton2+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2209 :: 		CircleButton2.OnPressPtr      = doPrevScreen;
MOVW	R1, #lo_addr(_doPrevScreen+0)
MOVT	R1, #hi_addr(_doPrevScreen+0)
MOVW	R0, #lo_addr(_CircleButton2+60)
MOVT	R0, #hi_addr(_CircleButton2+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2211 :: 		Line2.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Line2+0)
MOVT	R0, #hi_addr(_Line2+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2212 :: 		Line2.Order           = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Line2+4)
MOVT	R0, #hi_addr(_Line2+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2213 :: 		Line2.First_Point_X   = 238;
MOVS	R1, #238
MOVW	R0, #lo_addr(_Line2+6)
MOVT	R0, #hi_addr(_Line2+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2214 :: 		Line2.First_Point_Y   = 135;
MOVS	R1, #135
MOVW	R0, #lo_addr(_Line2+8)
MOVT	R0, #hi_addr(_Line2+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2215 :: 		Line2.Second_Point_X  = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_Line2+10)
MOVT	R0, #hi_addr(_Line2+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2216 :: 		Line2.Second_Point_Y  = 214;
MOVS	R1, #214
MOVW	R0, #lo_addr(_Line2+12)
MOVT	R0, #hi_addr(_Line2+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2217 :: 		Line2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Line2+15)
MOVT	R0, #hi_addr(_Line2+15)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2218 :: 		Line2.Pen_Width       = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Line2+14)
MOVT	R0, #hi_addr(_Line2+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2219 :: 		Line2.Color           = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Line2+16)
MOVT	R0, #hi_addr(_Line2+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2221 :: 		Label29.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Label29+0)
MOVT	R0, #hi_addr(_Label29+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2222 :: 		Label29.Order           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Label29+4)
MOVT	R0, #hi_addr(_Label29+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2223 :: 		Label29.Left            = 222;
MOVS	R1, #222
MOVW	R0, #lo_addr(_Label29+6)
MOVT	R0, #hi_addr(_Label29+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2224 :: 		Label29.Top             = 103;
MOVS	R1, #103
MOVW	R0, #lo_addr(_Label29+8)
MOVT	R0, #hi_addr(_Label29+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2225 :: 		Label29.Width           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Label29+10)
MOVT	R0, #hi_addr(_Label29+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2226 :: 		Label29.Height          = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Label29+12)
MOVT	R0, #hi_addr(_Label29+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2227 :: 		Label29.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label29+26)
MOVT	R0, #hi_addr(_Label29+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2228 :: 		Label29.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label29+27)
MOVT	R0, #hi_addr(_Label29+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2229 :: 		Label29.Caption         = Label29_Caption;
MOVW	R1, #lo_addr(_Label29_Caption+0)
MOVT	R1, #hi_addr(_Label29_Caption+0)
MOVW	R0, #lo_addr(_Label29+16)
MOVT	R0, #hi_addr(_Label29+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2230 :: 		Label29.FontName        = Arial_Black43x60_Regular;
MOVW	R1, #31859
MOVW	R0, #lo_addr(_Label29+20)
MOVT	R0, #hi_addr(_Label29+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2231 :: 		Label29.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_Label29+24)
MOVT	R0, #hi_addr(_Label29+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2232 :: 		Label29.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label29+28)
MOVT	R0, #hi_addr(_Label29+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2233 :: 		Label29.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label29+32)
MOVT	R0, #hi_addr(_Label29+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2234 :: 		Label29.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label29+36)
MOVT	R0, #hi_addr(_Label29+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2235 :: 		Label29.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label29+40)
MOVT	R0, #hi_addr(_Label29+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2237 :: 		Circle1.OwnerScreen     = &Tachometer_graphics;
MOVW	R1, #lo_addr(_Tachometer_graphics+0)
MOVT	R1, #hi_addr(_Tachometer_graphics+0)
MOVW	R0, #lo_addr(_Circle1+0)
MOVT	R0, #hi_addr(_Circle1+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2238 :: 		Circle1.Order           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Circle1+4)
MOVT	R0, #hi_addr(_Circle1+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2239 :: 		Circle1.Left            = 331;
MOVW	R1, #331
MOVW	R0, #lo_addr(_Circle1+6)
MOVT	R0, #hi_addr(_Circle1+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2240 :: 		Circle1.Top             = 138;
MOVS	R1, #138
MOVW	R0, #lo_addr(_Circle1+8)
MOVT	R0, #hi_addr(_Circle1+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2241 :: 		Circle1.Radius          = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Circle1+10)
MOVT	R0, #hi_addr(_Circle1+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2242 :: 		Circle1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+12)
MOVT	R0, #hi_addr(_Circle1+12)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2243 :: 		Circle1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+14)
MOVT	R0, #hi_addr(_Circle1+14)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2244 :: 		Circle1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+16)
MOVT	R0, #hi_addr(_Circle1+16)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2245 :: 		Circle1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+17)
MOVT	R0, #hi_addr(_Circle1+17)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2246 :: 		Circle1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+18)
MOVT	R0, #hi_addr(_Circle1+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2247 :: 		Circle1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+19)
MOVT	R0, #hi_addr(_Circle1+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2248 :: 		Circle1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+20)
MOVT	R0, #hi_addr(_Circle1+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2249 :: 		Circle1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Circle1+22)
MOVT	R0, #hi_addr(_Circle1+22)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2250 :: 		Circle1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Circle1+24)
MOVT	R0, #hi_addr(_Circle1+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2251 :: 		Circle1.Color           = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Circle1+26)
MOVT	R0, #hi_addr(_Circle1+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2252 :: 		Circle1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+28)
MOVT	R0, #hi_addr(_Circle1+28)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2253 :: 		Circle1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Circle1+30)
MOVT	R0, #hi_addr(_Circle1+30)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2254 :: 		Circle1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+32)
MOVT	R0, #hi_addr(_Circle1+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2255 :: 		Circle1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+36)
MOVT	R0, #hi_addr(_Circle1+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2256 :: 		Circle1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+40)
MOVT	R0, #hi_addr(_Circle1+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2257 :: 		Circle1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+44)
MOVT	R0, #hi_addr(_Circle1+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2259 :: 		ButtonRound1.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_ButtonRound1+0)
MOVT	R0, #hi_addr(_ButtonRound1+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2260 :: 		ButtonRound1.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+4)
MOVT	R0, #hi_addr(_ButtonRound1+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2261 :: 		ButtonRound1.Left            = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_ButtonRound1+6)
MOVT	R0, #hi_addr(_ButtonRound1+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2262 :: 		ButtonRound1.Top             = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_ButtonRound1+8)
MOVT	R0, #hi_addr(_ButtonRound1+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2263 :: 		ButtonRound1.Width           = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_ButtonRound1+10)
MOVT	R0, #hi_addr(_ButtonRound1+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2264 :: 		ButtonRound1.Height          = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_ButtonRound1+12)
MOVT	R0, #hi_addr(_ButtonRound1+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2265 :: 		ButtonRound1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+14)
MOVT	R0, #hi_addr(_ButtonRound1+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2266 :: 		ButtonRound1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+16)
MOVT	R0, #hi_addr(_ButtonRound1+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2267 :: 		ButtonRound1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+18)
MOVT	R0, #hi_addr(_ButtonRound1+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2268 :: 		ButtonRound1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+19)
MOVT	R0, #hi_addr(_ButtonRound1+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2269 :: 		ButtonRound1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+20)
MOVT	R0, #hi_addr(_ButtonRound1+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2270 :: 		ButtonRound1.Caption         = ButtonRound1_Caption;
MOVW	R1, #lo_addr(_ButtonRound1_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound1_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound1+24)
MOVT	R0, #hi_addr(_ButtonRound1+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2271 :: 		ButtonRound1.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+28)
MOVT	R0, #hi_addr(_ButtonRound1+28)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2272 :: 		ButtonRound1.FontName        = Impact13x20_Regular;
MOVW	R1, #57999
MOVW	R0, #lo_addr(_ButtonRound1+32)
MOVT	R0, #hi_addr(_ButtonRound1+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2273 :: 		ButtonRound1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+47)
MOVT	R0, #hi_addr(_ButtonRound1+47)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2274 :: 		ButtonRound1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+36)
MOVT	R0, #hi_addr(_ButtonRound1+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2275 :: 		ButtonRound1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+38)
MOVT	R0, #hi_addr(_ButtonRound1+38)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2276 :: 		ButtonRound1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+39)
MOVT	R0, #hi_addr(_ButtonRound1+39)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2277 :: 		ButtonRound1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound1+40)
MOVT	R0, #hi_addr(_ButtonRound1+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2278 :: 		ButtonRound1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound1+42)
MOVT	R0, #hi_addr(_ButtonRound1+42)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2279 :: 		ButtonRound1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound1+44)
MOVT	R0, #hi_addr(_ButtonRound1+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2280 :: 		ButtonRound1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound1+48)
MOVT	R0, #hi_addr(_ButtonRound1+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2281 :: 		ButtonRound1.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound1+46)
MOVT	R0, #hi_addr(_ButtonRound1+46)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2282 :: 		ButtonRound1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+52)
MOVT	R0, #hi_addr(_ButtonRound1+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2283 :: 		ButtonRound1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+56)
MOVT	R0, #hi_addr(_ButtonRound1+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2284 :: 		ButtonRound1.OnClickPtr      = doSetClock;
MOVW	R1, #lo_addr(_doSetClock+0)
MOVT	R1, #hi_addr(_doSetClock+0)
MOVW	R0, #lo_addr(_ButtonRound1+60)
MOVT	R0, #hi_addr(_ButtonRound1+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2285 :: 		ButtonRound1.OnPressPtr      = doSetClock;
MOVW	R1, #lo_addr(_doSetClock+0)
MOVT	R1, #hi_addr(_doSetClock+0)
MOVW	R0, #lo_addr(_ButtonRound1+64)
MOVT	R0, #hi_addr(_ButtonRound1+64)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2287 :: 		ButtonRound2.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_ButtonRound2+0)
MOVT	R0, #hi_addr(_ButtonRound2+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2288 :: 		ButtonRound2.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_ButtonRound2+4)
MOVT	R0, #hi_addr(_ButtonRound2+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2289 :: 		ButtonRound2.Left            = 52;
MOVS	R1, #52
MOVW	R0, #lo_addr(_ButtonRound2+6)
MOVT	R0, #hi_addr(_ButtonRound2+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2290 :: 		ButtonRound2.Top             = 60;
MOVS	R1, #60
MOVW	R0, #lo_addr(_ButtonRound2+8)
MOVT	R0, #hi_addr(_ButtonRound2+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2291 :: 		ButtonRound2.Width           = 164;
MOVS	R1, #164
MOVW	R0, #lo_addr(_ButtonRound2+10)
MOVT	R0, #hi_addr(_ButtonRound2+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2292 :: 		ButtonRound2.Height          = 48;
MOVS	R1, #48
MOVW	R0, #lo_addr(_ButtonRound2+12)
MOVT	R0, #hi_addr(_ButtonRound2+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2293 :: 		ButtonRound2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+14)
MOVT	R0, #hi_addr(_ButtonRound2+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2294 :: 		ButtonRound2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+16)
MOVT	R0, #hi_addr(_ButtonRound2+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2295 :: 		ButtonRound2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+18)
MOVT	R0, #hi_addr(_ButtonRound2+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2296 :: 		ButtonRound2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+19)
MOVT	R0, #hi_addr(_ButtonRound2+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2297 :: 		ButtonRound2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+20)
MOVT	R0, #hi_addr(_ButtonRound2+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2298 :: 		ButtonRound2.Caption         = ButtonRound2_Caption;
MOVW	R1, #lo_addr(_ButtonRound2_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound2_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound2+24)
MOVT	R0, #hi_addr(_ButtonRound2+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2299 :: 		ButtonRound2.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+28)
MOVT	R0, #hi_addr(_ButtonRound2+28)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2300 :: 		ButtonRound2.FontName        = Impact13x20_Regular;
MOVW	R1, #57999
MOVW	R0, #lo_addr(_ButtonRound2+32)
MOVT	R0, #hi_addr(_ButtonRound2+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2301 :: 		ButtonRound2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+47)
MOVT	R0, #hi_addr(_ButtonRound2+47)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2302 :: 		ButtonRound2.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+36)
MOVT	R0, #hi_addr(_ButtonRound2+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2303 :: 		ButtonRound2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+38)
MOVT	R0, #hi_addr(_ButtonRound2+38)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2304 :: 		ButtonRound2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+39)
MOVT	R0, #hi_addr(_ButtonRound2+39)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2305 :: 		ButtonRound2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound2+40)
MOVT	R0, #hi_addr(_ButtonRound2+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2306 :: 		ButtonRound2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound2+42)
MOVT	R0, #hi_addr(_ButtonRound2+42)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2307 :: 		ButtonRound2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound2+44)
MOVT	R0, #hi_addr(_ButtonRound2+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2308 :: 		ButtonRound2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound2+48)
MOVT	R0, #hi_addr(_ButtonRound2+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2309 :: 		ButtonRound2.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound2+46)
MOVT	R0, #hi_addr(_ButtonRound2+46)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2310 :: 		ButtonRound2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+52)
MOVT	R0, #hi_addr(_ButtonRound2+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2311 :: 		ButtonRound2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+56)
MOVT	R0, #hi_addr(_ButtonRound2+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2312 :: 		ButtonRound2.OnClickPtr      = doAccelerometerTest;
MOVW	R1, #lo_addr(_doAccelerometerTest+0)
MOVT	R1, #hi_addr(_doAccelerometerTest+0)
MOVW	R0, #lo_addr(_ButtonRound2+60)
MOVT	R0, #hi_addr(_ButtonRound2+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2313 :: 		ButtonRound2.OnPressPtr      = doAccelerometerTest;
MOVW	R1, #lo_addr(_doAccelerometerTest+0)
MOVT	R1, #hi_addr(_doAccelerometerTest+0)
MOVW	R0, #lo_addr(_ButtonRound2+64)
MOVT	R0, #hi_addr(_ButtonRound2+64)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2315 :: 		ButtonRound3.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_ButtonRound3+0)
MOVT	R0, #hi_addr(_ButtonRound3+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2316 :: 		ButtonRound3.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound3+4)
MOVT	R0, #hi_addr(_ButtonRound3+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2317 :: 		ButtonRound3.Left            = 262;
MOVW	R1, #262
MOVW	R0, #lo_addr(_ButtonRound3+6)
MOVT	R0, #hi_addr(_ButtonRound3+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2318 :: 		ButtonRound3.Top             = 60;
MOVS	R1, #60
MOVW	R0, #lo_addr(_ButtonRound3+8)
MOVT	R0, #hi_addr(_ButtonRound3+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2319 :: 		ButtonRound3.Width           = 164;
MOVS	R1, #164
MOVW	R0, #lo_addr(_ButtonRound3+10)
MOVT	R0, #hi_addr(_ButtonRound3+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2320 :: 		ButtonRound3.Height          = 48;
MOVS	R1, #48
MOVW	R0, #lo_addr(_ButtonRound3+12)
MOVT	R0, #hi_addr(_ButtonRound3+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2321 :: 		ButtonRound3.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+14)
MOVT	R0, #hi_addr(_ButtonRound3+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2322 :: 		ButtonRound3.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound3+16)
MOVT	R0, #hi_addr(_ButtonRound3+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2323 :: 		ButtonRound3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+18)
MOVT	R0, #hi_addr(_ButtonRound3+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2324 :: 		ButtonRound3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+19)
MOVT	R0, #hi_addr(_ButtonRound3+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2325 :: 		ButtonRound3.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+20)
MOVT	R0, #hi_addr(_ButtonRound3+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2326 :: 		ButtonRound3.Caption         = ButtonRound3_Caption;
MOVW	R1, #lo_addr(_ButtonRound3_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound3_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound3+24)
MOVT	R0, #hi_addr(_ButtonRound3+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2327 :: 		ButtonRound3.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+28)
MOVT	R0, #hi_addr(_ButtonRound3+28)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2328 :: 		ButtonRound3.FontName        = Impact13x20_Regular;
MOVW	R1, #57999
MOVW	R0, #lo_addr(_ButtonRound3+32)
MOVT	R0, #hi_addr(_ButtonRound3+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2329 :: 		ButtonRound3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+47)
MOVT	R0, #hi_addr(_ButtonRound3+47)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2330 :: 		ButtonRound3.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound3+36)
MOVT	R0, #hi_addr(_ButtonRound3+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2331 :: 		ButtonRound3.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+38)
MOVT	R0, #hi_addr(_ButtonRound3+38)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2332 :: 		ButtonRound3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound3+39)
MOVT	R0, #hi_addr(_ButtonRound3+39)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2333 :: 		ButtonRound3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound3+40)
MOVT	R0, #hi_addr(_ButtonRound3+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2334 :: 		ButtonRound3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound3+42)
MOVT	R0, #hi_addr(_ButtonRound3+42)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2335 :: 		ButtonRound3.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound3+44)
MOVT	R0, #hi_addr(_ButtonRound3+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2336 :: 		ButtonRound3.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound3+48)
MOVT	R0, #hi_addr(_ButtonRound3+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2337 :: 		ButtonRound3.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound3+46)
MOVT	R0, #hi_addr(_ButtonRound3+46)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2338 :: 		ButtonRound3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound3+52)
MOVT	R0, #hi_addr(_ButtonRound3+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2339 :: 		ButtonRound3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound3+56)
MOVT	R0, #hi_addr(_ButtonRound3+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2340 :: 		ButtonRound3.OnClickPtr      = doGPSTest;
MOVW	R1, #lo_addr(_doGPSTest+0)
MOVT	R1, #hi_addr(_doGPSTest+0)
MOVW	R0, #lo_addr(_ButtonRound3+60)
MOVT	R0, #hi_addr(_ButtonRound3+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2341 :: 		ButtonRound3.OnPressPtr      = doGPSTest;
MOVW	R1, #lo_addr(_doGPSTest+0)
MOVT	R1, #hi_addr(_doGPSTest+0)
MOVW	R0, #lo_addr(_ButtonRound3+64)
MOVT	R0, #hi_addr(_ButtonRound3+64)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2343 :: 		ButtonRound4.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_ButtonRound4+0)
MOVT	R0, #hi_addr(_ButtonRound4+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2344 :: 		ButtonRound4.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_ButtonRound4+4)
MOVT	R0, #hi_addr(_ButtonRound4+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2345 :: 		ButtonRound4.Left            = 52;
MOVS	R1, #52
MOVW	R0, #lo_addr(_ButtonRound4+6)
MOVT	R0, #hi_addr(_ButtonRound4+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2346 :: 		ButtonRound4.Top             = 208;
MOVS	R1, #208
MOVW	R0, #lo_addr(_ButtonRound4+8)
MOVT	R0, #hi_addr(_ButtonRound4+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2347 :: 		ButtonRound4.Width           = 164;
MOVS	R1, #164
MOVW	R0, #lo_addr(_ButtonRound4+10)
MOVT	R0, #hi_addr(_ButtonRound4+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2348 :: 		ButtonRound4.Height          = 48;
MOVS	R1, #48
MOVW	R0, #lo_addr(_ButtonRound4+12)
MOVT	R0, #hi_addr(_ButtonRound4+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2349 :: 		ButtonRound4.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+14)
MOVT	R0, #hi_addr(_ButtonRound4+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2350 :: 		ButtonRound4.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+16)
MOVT	R0, #hi_addr(_ButtonRound4+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2351 :: 		ButtonRound4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+18)
MOVT	R0, #hi_addr(_ButtonRound4+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2352 :: 		ButtonRound4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+19)
MOVT	R0, #hi_addr(_ButtonRound4+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2353 :: 		ButtonRound4.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+20)
MOVT	R0, #hi_addr(_ButtonRound4+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2354 :: 		ButtonRound4.Caption         = ButtonRound4_Caption;
MOVW	R1, #lo_addr(_ButtonRound4_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound4_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound4+24)
MOVT	R0, #hi_addr(_ButtonRound4+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2355 :: 		ButtonRound4.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+28)
MOVT	R0, #hi_addr(_ButtonRound4+28)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2356 :: 		ButtonRound4.FontName        = Impact13x20_Regular;
MOVW	R1, #57999
MOVW	R0, #lo_addr(_ButtonRound4+32)
MOVT	R0, #hi_addr(_ButtonRound4+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2357 :: 		ButtonRound4.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+47)
MOVT	R0, #hi_addr(_ButtonRound4+47)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2358 :: 		ButtonRound4.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+36)
MOVT	R0, #hi_addr(_ButtonRound4+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2359 :: 		ButtonRound4.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+38)
MOVT	R0, #hi_addr(_ButtonRound4+38)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2360 :: 		ButtonRound4.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+39)
MOVT	R0, #hi_addr(_ButtonRound4+39)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2361 :: 		ButtonRound4.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound4+40)
MOVT	R0, #hi_addr(_ButtonRound4+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2362 :: 		ButtonRound4.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound4+42)
MOVT	R0, #hi_addr(_ButtonRound4+42)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2363 :: 		ButtonRound4.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound4+44)
MOVT	R0, #hi_addr(_ButtonRound4+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2364 :: 		ButtonRound4.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound4+48)
MOVT	R0, #hi_addr(_ButtonRound4+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2365 :: 		ButtonRound4.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound4+46)
MOVT	R0, #hi_addr(_ButtonRound4+46)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2366 :: 		ButtonRound4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+52)
MOVT	R0, #hi_addr(_ButtonRound4+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2367 :: 		ButtonRound4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+56)
MOVT	R0, #hi_addr(_ButtonRound4+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2368 :: 		ButtonRound4.OnClickPtr      = doMagnetTest;
MOVW	R1, #lo_addr(_doMagnetTest+0)
MOVT	R1, #hi_addr(_doMagnetTest+0)
MOVW	R0, #lo_addr(_ButtonRound4+60)
MOVT	R0, #hi_addr(_ButtonRound4+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2369 :: 		ButtonRound4.OnPressPtr      = doMagnetTest;
MOVW	R1, #lo_addr(_doMagnetTest+0)
MOVT	R1, #hi_addr(_doMagnetTest+0)
MOVW	R0, #lo_addr(_ButtonRound4+64)
MOVT	R0, #hi_addr(_ButtonRound4+64)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2371 :: 		ButtonRound5.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_ButtonRound5+0)
MOVT	R0, #hi_addr(_ButtonRound5+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2372 :: 		ButtonRound5.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_ButtonRound5+4)
MOVT	R0, #hi_addr(_ButtonRound5+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2373 :: 		ButtonRound5.Left            = 262;
MOVW	R1, #262
MOVW	R0, #lo_addr(_ButtonRound5+6)
MOVT	R0, #hi_addr(_ButtonRound5+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2374 :: 		ButtonRound5.Top             = 208;
MOVS	R1, #208
MOVW	R0, #lo_addr(_ButtonRound5+8)
MOVT	R0, #hi_addr(_ButtonRound5+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2375 :: 		ButtonRound5.Width           = 164;
MOVS	R1, #164
MOVW	R0, #lo_addr(_ButtonRound5+10)
MOVT	R0, #hi_addr(_ButtonRound5+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2376 :: 		ButtonRound5.Height          = 48;
MOVS	R1, #48
MOVW	R0, #lo_addr(_ButtonRound5+12)
MOVT	R0, #hi_addr(_ButtonRound5+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2377 :: 		ButtonRound5.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+14)
MOVT	R0, #hi_addr(_ButtonRound5+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2378 :: 		ButtonRound5.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+16)
MOVT	R0, #hi_addr(_ButtonRound5+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2379 :: 		ButtonRound5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+18)
MOVT	R0, #hi_addr(_ButtonRound5+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2380 :: 		ButtonRound5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+19)
MOVT	R0, #hi_addr(_ButtonRound5+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2381 :: 		ButtonRound5.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+20)
MOVT	R0, #hi_addr(_ButtonRound5+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2382 :: 		ButtonRound5.Caption         = ButtonRound5_Caption;
MOVW	R1, #lo_addr(_ButtonRound5_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound5_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound5+24)
MOVT	R0, #hi_addr(_ButtonRound5+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2383 :: 		ButtonRound5.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+28)
MOVT	R0, #hi_addr(_ButtonRound5+28)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2384 :: 		ButtonRound5.FontName        = Impact13x20_Regular;
MOVW	R1, #57999
MOVW	R0, #lo_addr(_ButtonRound5+32)
MOVT	R0, #hi_addr(_ButtonRound5+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2385 :: 		ButtonRound5.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+47)
MOVT	R0, #hi_addr(_ButtonRound5+47)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2386 :: 		ButtonRound5.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+36)
MOVT	R0, #hi_addr(_ButtonRound5+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2387 :: 		ButtonRound5.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+38)
MOVT	R0, #hi_addr(_ButtonRound5+38)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2388 :: 		ButtonRound5.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+39)
MOVT	R0, #hi_addr(_ButtonRound5+39)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2389 :: 		ButtonRound5.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound5+40)
MOVT	R0, #hi_addr(_ButtonRound5+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2390 :: 		ButtonRound5.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound5+42)
MOVT	R0, #hi_addr(_ButtonRound5+42)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2391 :: 		ButtonRound5.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound5+44)
MOVT	R0, #hi_addr(_ButtonRound5+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2392 :: 		ButtonRound5.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound5+48)
MOVT	R0, #hi_addr(_ButtonRound5+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2393 :: 		ButtonRound5.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound5+46)
MOVT	R0, #hi_addr(_ButtonRound5+46)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2394 :: 		ButtonRound5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+52)
MOVT	R0, #hi_addr(_ButtonRound5+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2395 :: 		ButtonRound5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+56)
MOVT	R0, #hi_addr(_ButtonRound5+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2396 :: 		ButtonRound5.OnClickPtr      = doPressureTest;
MOVW	R1, #lo_addr(_doPressureTest+0)
MOVT	R1, #hi_addr(_doPressureTest+0)
MOVW	R0, #lo_addr(_ButtonRound5+60)
MOVT	R0, #hi_addr(_ButtonRound5+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2397 :: 		ButtonRound5.OnPressPtr      = doPressureTest;
MOVW	R1, #lo_addr(_doPressureTest+0)
MOVT	R1, #hi_addr(_doPressureTest+0)
MOVW	R0, #lo_addr(_ButtonRound5+64)
MOVT	R0, #hi_addr(_ButtonRound5+64)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2399 :: 		ButtonRound6.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_ButtonRound6+0)
MOVT	R0, #hi_addr(_ButtonRound6+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2400 :: 		ButtonRound6.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_ButtonRound6+4)
MOVT	R0, #hi_addr(_ButtonRound6+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2401 :: 		ButtonRound6.Left            = 52;
MOVS	R1, #52
MOVW	R0, #lo_addr(_ButtonRound6+6)
MOVT	R0, #hi_addr(_ButtonRound6+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2402 :: 		ButtonRound6.Top             = 134;
MOVS	R1, #134
MOVW	R0, #lo_addr(_ButtonRound6+8)
MOVT	R0, #hi_addr(_ButtonRound6+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2403 :: 		ButtonRound6.Width           = 164;
MOVS	R1, #164
MOVW	R0, #lo_addr(_ButtonRound6+10)
MOVT	R0, #hi_addr(_ButtonRound6+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2404 :: 		ButtonRound6.Height          = 48;
MOVS	R1, #48
MOVW	R0, #lo_addr(_ButtonRound6+12)
MOVT	R0, #hi_addr(_ButtonRound6+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2405 :: 		ButtonRound6.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+14)
MOVT	R0, #hi_addr(_ButtonRound6+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2406 :: 		ButtonRound6.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+16)
MOVT	R0, #hi_addr(_ButtonRound6+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2407 :: 		ButtonRound6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+18)
MOVT	R0, #hi_addr(_ButtonRound6+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2408 :: 		ButtonRound6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+19)
MOVT	R0, #hi_addr(_ButtonRound6+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2409 :: 		ButtonRound6.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+20)
MOVT	R0, #hi_addr(_ButtonRound6+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2410 :: 		ButtonRound6.Caption         = ButtonRound6_Caption;
MOVW	R1, #lo_addr(_ButtonRound6_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound6_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound6+24)
MOVT	R0, #hi_addr(_ButtonRound6+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2411 :: 		ButtonRound6.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+28)
MOVT	R0, #hi_addr(_ButtonRound6+28)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2412 :: 		ButtonRound6.FontName        = Impact13x20_Regular;
MOVW	R1, #57999
MOVW	R0, #lo_addr(_ButtonRound6+32)
MOVT	R0, #hi_addr(_ButtonRound6+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2413 :: 		ButtonRound6.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+47)
MOVT	R0, #hi_addr(_ButtonRound6+47)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2414 :: 		ButtonRound6.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+36)
MOVT	R0, #hi_addr(_ButtonRound6+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2415 :: 		ButtonRound6.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+38)
MOVT	R0, #hi_addr(_ButtonRound6+38)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2416 :: 		ButtonRound6.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+39)
MOVT	R0, #hi_addr(_ButtonRound6+39)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2417 :: 		ButtonRound6.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound6+40)
MOVT	R0, #hi_addr(_ButtonRound6+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2418 :: 		ButtonRound6.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound6+42)
MOVT	R0, #hi_addr(_ButtonRound6+42)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2419 :: 		ButtonRound6.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound6+44)
MOVT	R0, #hi_addr(_ButtonRound6+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2420 :: 		ButtonRound6.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound6+48)
MOVT	R0, #hi_addr(_ButtonRound6+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2421 :: 		ButtonRound6.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound6+46)
MOVT	R0, #hi_addr(_ButtonRound6+46)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2422 :: 		ButtonRound6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+52)
MOVT	R0, #hi_addr(_ButtonRound6+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2423 :: 		ButtonRound6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+56)
MOVT	R0, #hi_addr(_ButtonRound6+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2424 :: 		ButtonRound6.OnClickPtr      = doGyroTest;
MOVW	R1, #lo_addr(_doGyroTest+0)
MOVT	R1, #hi_addr(_doGyroTest+0)
MOVW	R0, #lo_addr(_ButtonRound6+60)
MOVT	R0, #hi_addr(_ButtonRound6+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2425 :: 		ButtonRound6.OnPressPtr      = doGyroTest;
MOVW	R1, #lo_addr(_doGyroTest+0)
MOVT	R1, #hi_addr(_doGyroTest+0)
MOVW	R0, #lo_addr(_ButtonRound6+64)
MOVT	R0, #hi_addr(_ButtonRound6+64)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2427 :: 		ButtonRound7.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_ButtonRound7+0)
MOVT	R0, #hi_addr(_ButtonRound7+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2428 :: 		ButtonRound7.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_ButtonRound7+4)
MOVT	R0, #hi_addr(_ButtonRound7+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2429 :: 		ButtonRound7.Left            = 262;
MOVW	R1, #262
MOVW	R0, #lo_addr(_ButtonRound7+6)
MOVT	R0, #hi_addr(_ButtonRound7+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2430 :: 		ButtonRound7.Top             = 134;
MOVS	R1, #134
MOVW	R0, #lo_addr(_ButtonRound7+8)
MOVT	R0, #hi_addr(_ButtonRound7+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2431 :: 		ButtonRound7.Width           = 164;
MOVS	R1, #164
MOVW	R0, #lo_addr(_ButtonRound7+10)
MOVT	R0, #hi_addr(_ButtonRound7+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2432 :: 		ButtonRound7.Height          = 48;
MOVS	R1, #48
MOVW	R0, #lo_addr(_ButtonRound7+12)
MOVT	R0, #hi_addr(_ButtonRound7+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2433 :: 		ButtonRound7.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+14)
MOVT	R0, #hi_addr(_ButtonRound7+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2434 :: 		ButtonRound7.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+16)
MOVT	R0, #hi_addr(_ButtonRound7+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2435 :: 		ButtonRound7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+18)
MOVT	R0, #hi_addr(_ButtonRound7+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2436 :: 		ButtonRound7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+19)
MOVT	R0, #hi_addr(_ButtonRound7+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2437 :: 		ButtonRound7.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+20)
MOVT	R0, #hi_addr(_ButtonRound7+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2438 :: 		ButtonRound7.Caption         = ButtonRound7_Caption;
MOVW	R1, #lo_addr(_ButtonRound7_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound7_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound7+24)
MOVT	R0, #hi_addr(_ButtonRound7+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2439 :: 		ButtonRound7.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+28)
MOVT	R0, #hi_addr(_ButtonRound7+28)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2440 :: 		ButtonRound7.FontName        = Impact13x20_Regular;
MOVW	R1, #57999
MOVW	R0, #lo_addr(_ButtonRound7+32)
MOVT	R0, #hi_addr(_ButtonRound7+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2441 :: 		ButtonRound7.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+47)
MOVT	R0, #hi_addr(_ButtonRound7+47)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2442 :: 		ButtonRound7.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+36)
MOVT	R0, #hi_addr(_ButtonRound7+36)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2443 :: 		ButtonRound7.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+38)
MOVT	R0, #hi_addr(_ButtonRound7+38)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2444 :: 		ButtonRound7.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+39)
MOVT	R0, #hi_addr(_ButtonRound7+39)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2445 :: 		ButtonRound7.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound7+40)
MOVT	R0, #hi_addr(_ButtonRound7+40)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2446 :: 		ButtonRound7.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound7+42)
MOVT	R0, #hi_addr(_ButtonRound7+42)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2447 :: 		ButtonRound7.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound7+44)
MOVT	R0, #hi_addr(_ButtonRound7+44)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2448 :: 		ButtonRound7.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound7+48)
MOVT	R0, #hi_addr(_ButtonRound7+48)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2449 :: 		ButtonRound7.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound7+46)
MOVT	R0, #hi_addr(_ButtonRound7+46)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2450 :: 		ButtonRound7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+52)
MOVT	R0, #hi_addr(_ButtonRound7+52)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2451 :: 		ButtonRound7.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+56)
MOVT	R0, #hi_addr(_ButtonRound7+56)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2452 :: 		ButtonRound7.OnClickPtr      = doCalibration;
MOVW	R1, #lo_addr(_doCalibration+0)
MOVT	R1, #hi_addr(_doCalibration+0)
MOVW	R0, #lo_addr(_ButtonRound7+60)
MOVT	R0, #hi_addr(_ButtonRound7+60)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2453 :: 		ButtonRound7.OnPressPtr      = doCalibration;
MOVW	R1, #lo_addr(_doCalibration+0)
MOVT	R1, #hi_addr(_doCalibration+0)
MOVW	R0, #lo_addr(_ButtonRound7+64)
MOVT	R0, #hi_addr(_ButtonRound7+64)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2455 :: 		Image48.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_Image48+0)
MOVT	R0, #hi_addr(_Image48+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2456 :: 		Image48.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Image48+4)
MOVT	R0, #hi_addr(_Image48+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2457 :: 		Image48.Left            = 432;
MOVW	R1, #432
MOVW	R0, #lo_addr(_Image48+6)
MOVT	R0, #hi_addr(_Image48+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2458 :: 		Image48.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image48+8)
MOVT	R0, #hi_addr(_Image48+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2459 :: 		Image48.Width           = 44;
MOVS	R1, #44
MOVW	R0, #lo_addr(_Image48+10)
MOVT	R0, #hi_addr(_Image48+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2460 :: 		Image48.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Image48+12)
MOVT	R0, #hi_addr(_Image48+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2461 :: 		Image48.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image48+22)
MOVT	R0, #hi_addr(_Image48+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2462 :: 		Image48.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image48+23)
MOVT	R0, #hi_addr(_Image48+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2463 :: 		Image48.Picture_Name    = icon_battery_bmp;
MOVW	R1, #24606
MOVT	R1, #57
MOVW	R0, #lo_addr(_Image48+16)
MOVT	R0, #hi_addr(_Image48+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2464 :: 		Image48.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image48+20)
MOVT	R0, #hi_addr(_Image48+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2465 :: 		Image48.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image48+21)
MOVT	R0, #hi_addr(_Image48+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2466 :: 		Image48.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image48+24)
MOVT	R0, #hi_addr(_Image48+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2467 :: 		Image48.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image48+28)
MOVT	R0, #hi_addr(_Image48+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2468 :: 		Image48.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image48+32)
MOVT	R0, #hi_addr(_Image48+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2469 :: 		Image48.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image48+36)
MOVT	R0, #hi_addr(_Image48+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2471 :: 		Label30.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_Label30+0)
MOVT	R0, #hi_addr(_Label30+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2472 :: 		Label30.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label30+4)
MOVT	R0, #hi_addr(_Label30+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2473 :: 		Label30.Left            = 365;
MOVW	R1, #365
MOVW	R0, #lo_addr(_Label30+6)
MOVT	R0, #hi_addr(_Label30+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2474 :: 		Label30.Top             = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label30+8)
MOVT	R0, #hi_addr(_Label30+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2475 :: 		Label30.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_Label30+10)
MOVT	R0, #hi_addr(_Label30+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2476 :: 		Label30.Height          = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label30+12)
MOVT	R0, #hi_addr(_Label30+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2477 :: 		Label30.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label30+26)
MOVT	R0, #hi_addr(_Label30+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2478 :: 		Label30.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label30+27)
MOVT	R0, #hi_addr(_Label30+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2479 :: 		Label30.Caption         = Label30_Caption;
MOVW	R1, #lo_addr(_Label30_Caption+0)
MOVT	R1, #hi_addr(_Label30_Caption+0)
MOVW	R0, #lo_addr(_Label30+16)
MOVT	R0, #hi_addr(_Label30+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2480 :: 		Label30.FontName        = Arial_Black21x30_Regular;
MOVW	R1, #8609
MOVW	R0, #lo_addr(_Label30+20)
MOVT	R0, #hi_addr(_Label30+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2481 :: 		Label30.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label30+24)
MOVT	R0, #hi_addr(_Label30+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2482 :: 		Label30.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label30+28)
MOVT	R0, #hi_addr(_Label30+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2483 :: 		Label30.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label30+32)
MOVT	R0, #hi_addr(_Label30+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2484 :: 		Label30.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label30+36)
MOVT	R0, #hi_addr(_Label30+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2485 :: 		Label30.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label30+40)
MOVT	R0, #hi_addr(_Label30+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2487 :: 		Box17.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_Box17+0)
MOVT	R0, #hi_addr(_Box17+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2488 :: 		Box17.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Box17+4)
MOVT	R0, #hi_addr(_Box17+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2489 :: 		Box17.Left            = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Box17+6)
MOVT	R0, #hi_addr(_Box17+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2490 :: 		Box17.Top             = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Box17+8)
MOVT	R0, #hi_addr(_Box17+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2491 :: 		Box17.Width           = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_Box17+10)
MOVT	R0, #hi_addr(_Box17+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2492 :: 		Box17.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Box17+12)
MOVT	R0, #hi_addr(_Box17+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2493 :: 		Box17.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box17+14)
MOVT	R0, #hi_addr(_Box17+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2494 :: 		Box17.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+16)
MOVT	R0, #hi_addr(_Box17+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2495 :: 		Box17.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+18)
MOVT	R0, #hi_addr(_Box17+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2496 :: 		Box17.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box17+19)
MOVT	R0, #hi_addr(_Box17+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2497 :: 		Box17.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box17+20)
MOVT	R0, #hi_addr(_Box17+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2498 :: 		Box17.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box17+21)
MOVT	R0, #hi_addr(_Box17+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2499 :: 		Box17.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+22)
MOVT	R0, #hi_addr(_Box17+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2500 :: 		Box17.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box17+24)
MOVT	R0, #hi_addr(_Box17+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2501 :: 		Box17.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box17+26)
MOVT	R0, #hi_addr(_Box17+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2502 :: 		Box17.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box17+28)
MOVT	R0, #hi_addr(_Box17+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2503 :: 		Box17.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+30)
MOVT	R0, #hi_addr(_Box17+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2504 :: 		Box17.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box17+32)
MOVT	R0, #hi_addr(_Box17+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2505 :: 		Box17.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+36)
MOVT	R0, #hi_addr(_Box17+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2506 :: 		Box17.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+40)
MOVT	R0, #hi_addr(_Box17+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2507 :: 		Box17.OnClickPtr      = Image18OnPress;
MOVW	R1, #lo_addr(_Image18OnPress+0)
MOVT	R1, #hi_addr(_Image18OnPress+0)
MOVW	R0, #lo_addr(_Box17+44)
MOVT	R0, #hi_addr(_Box17+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2508 :: 		Box17.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+48)
MOVT	R0, #hi_addr(_Box17+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2510 :: 		Image51.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_Image51+0)
MOVT	R0, #hi_addr(_Image51+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2511 :: 		Image51.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Image51+4)
MOVT	R0, #hi_addr(_Image51+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2512 :: 		Image51.Left            = 29;
MOVS	R1, #29
MOVW	R0, #lo_addr(_Image51+6)
MOVT	R0, #hi_addr(_Image51+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2513 :: 		Image51.Top             = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Image51+8)
MOVT	R0, #hi_addr(_Image51+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2514 :: 		Image51.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image51+10)
MOVT	R0, #hi_addr(_Image51+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2515 :: 		Image51.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image51+12)
MOVT	R0, #hi_addr(_Image51+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2516 :: 		Image51.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image51+22)
MOVT	R0, #hi_addr(_Image51+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2517 :: 		Image51.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image51+23)
MOVT	R0, #hi_addr(_Image51+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2518 :: 		Image51.Picture_Name    = icon_ok_bmp;
MOVW	R1, #58352
MOVT	R1, #61
MOVW	R0, #lo_addr(_Image51+16)
MOVT	R0, #hi_addr(_Image51+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2519 :: 		Image51.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image51+20)
MOVT	R0, #hi_addr(_Image51+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2520 :: 		Image51.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image51+21)
MOVT	R0, #hi_addr(_Image51+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2521 :: 		Image51.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image51+24)
MOVT	R0, #hi_addr(_Image51+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2522 :: 		Image51.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image51+28)
MOVT	R0, #hi_addr(_Image51+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2523 :: 		Image51.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image51+32)
MOVT	R0, #hi_addr(_Image51+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2524 :: 		Image51.OnPressPtr      = Image18OnPress;
MOVW	R1, #lo_addr(_Image18OnPress+0)
MOVT	R1, #hi_addr(_Image18OnPress+0)
MOVW	R0, #lo_addr(_Image51+36)
MOVT	R0, #hi_addr(_Image51+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2526 :: 		Label73.OwnerScreen     = &Settings;
MOVW	R1, #lo_addr(_Settings+0)
MOVT	R1, #hi_addr(_Settings+0)
MOVW	R0, #lo_addr(_Label73+0)
MOVT	R0, #hi_addr(_Label73+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2527 :: 		Label73.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Label73+4)
MOVT	R0, #hi_addr(_Label73+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2528 :: 		Label73.Left            = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_Label73+6)
MOVT	R0, #hi_addr(_Label73+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2529 :: 		Label73.Top             = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label73+8)
MOVT	R0, #hi_addr(_Label73+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2530 :: 		Label73.Width           = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Label73+10)
MOVT	R0, #hi_addr(_Label73+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2531 :: 		Label73.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label73+12)
MOVT	R0, #hi_addr(_Label73+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2532 :: 		Label73.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label73+26)
MOVT	R0, #hi_addr(_Label73+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2533 :: 		Label73.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label73+27)
MOVT	R0, #hi_addr(_Label73+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2534 :: 		Label73.Caption         = Label73_Caption;
MOVW	R1, #lo_addr(_Label73_Caption+0)
MOVT	R1, #hi_addr(_Label73_Caption+0)
MOVW	R0, #lo_addr(_Label73+16)
MOVT	R0, #hi_addr(_Label73+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2535 :: 		Label73.FontName        = Arial_Black16x23_Regular;
MOVW	R1, #2595
MOVW	R0, #lo_addr(_Label73+20)
MOVT	R0, #hi_addr(_Label73+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2536 :: 		Label73.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label73+24)
MOVT	R0, #hi_addr(_Label73+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2537 :: 		Label73.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label73+28)
MOVT	R0, #hi_addr(_Label73+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2538 :: 		Label73.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label73+32)
MOVT	R0, #hi_addr(_Label73+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2539 :: 		Label73.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label73+36)
MOVT	R0, #hi_addr(_Label73+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2540 :: 		Label73.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label73+40)
MOVT	R0, #hi_addr(_Label73+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2542 :: 		Box7.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Box7+0)
MOVT	R0, #hi_addr(_Box7+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2543 :: 		Box7.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+4)
MOVT	R0, #hi_addr(_Box7+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2544 :: 		Box7.Left            = 376;
MOVW	R1, #376
MOVW	R0, #lo_addr(_Box7+6)
MOVT	R0, #hi_addr(_Box7+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2545 :: 		Box7.Top             = 234;
MOVS	R1, #234
MOVW	R0, #lo_addr(_Box7+8)
MOVT	R0, #hi_addr(_Box7+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2546 :: 		Box7.Width           = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_Box7+10)
MOVT	R0, #hi_addr(_Box7+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2547 :: 		Box7.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Box7+12)
MOVT	R0, #hi_addr(_Box7+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2548 :: 		Box7.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box7+14)
MOVT	R0, #hi_addr(_Box7+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2549 :: 		Box7.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+16)
MOVT	R0, #hi_addr(_Box7+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2550 :: 		Box7.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+18)
MOVT	R0, #hi_addr(_Box7+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2551 :: 		Box7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box7+19)
MOVT	R0, #hi_addr(_Box7+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2552 :: 		Box7.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box7+20)
MOVT	R0, #hi_addr(_Box7+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2553 :: 		Box7.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box7+21)
MOVT	R0, #hi_addr(_Box7+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2554 :: 		Box7.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+22)
MOVT	R0, #hi_addr(_Box7+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2555 :: 		Box7.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box7+24)
MOVT	R0, #hi_addr(_Box7+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2556 :: 		Box7.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box7+26)
MOVT	R0, #hi_addr(_Box7+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2557 :: 		Box7.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box7+28)
MOVT	R0, #hi_addr(_Box7+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2558 :: 		Box7.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+30)
MOVT	R0, #hi_addr(_Box7+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2559 :: 		Box7.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box7+32)
MOVT	R0, #hi_addr(_Box7+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2560 :: 		Box7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+36)
MOVT	R0, #hi_addr(_Box7+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2561 :: 		Box7.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+40)
MOVT	R0, #hi_addr(_Box7+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2562 :: 		Box7.OnClickPtr      = Image18OnPress;
MOVW	R1, #lo_addr(_Image18OnPress+0)
MOVT	R1, #hi_addr(_Image18OnPress+0)
MOVW	R0, #lo_addr(_Box7+44)
MOVT	R0, #hi_addr(_Box7+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2563 :: 		Box7.OnPressPtr      = Image18OnPress;
MOVW	R1, #lo_addr(_Image18OnPress+0)
MOVT	R1, #hi_addr(_Image18OnPress+0)
MOVW	R0, #lo_addr(_Box7+48)
MOVT	R0, #hi_addr(_Box7+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2565 :: 		Box8.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Box8+0)
MOVT	R0, #hi_addr(_Box8+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2566 :: 		Box8.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box8+4)
MOVT	R0, #hi_addr(_Box8+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2567 :: 		Box8.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+6)
MOVT	R0, #hi_addr(_Box8+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2568 :: 		Box8.Top             = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_Box8+8)
MOVT	R0, #hi_addr(_Box8+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2569 :: 		Box8.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Box8+10)
MOVT	R0, #hi_addr(_Box8+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2570 :: 		Box8.Height          = 193;
MOVS	R1, #193
MOVW	R0, #lo_addr(_Box8+12)
MOVT	R0, #hi_addr(_Box8+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2571 :: 		Box8.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+14)
MOVT	R0, #hi_addr(_Box8+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2572 :: 		Box8.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+16)
MOVT	R0, #hi_addr(_Box8+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2573 :: 		Box8.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+18)
MOVT	R0, #hi_addr(_Box8+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2574 :: 		Box8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box8+19)
MOVT	R0, #hi_addr(_Box8+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2575 :: 		Box8.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+20)
MOVT	R0, #hi_addr(_Box8+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2576 :: 		Box8.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+21)
MOVT	R0, #hi_addr(_Box8+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2577 :: 		Box8.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+22)
MOVT	R0, #hi_addr(_Box8+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2578 :: 		Box8.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box8+24)
MOVT	R0, #hi_addr(_Box8+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2579 :: 		Box8.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box8+26)
MOVT	R0, #hi_addr(_Box8+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2580 :: 		Box8.Color           = 0x54C3;
MOVW	R1, #21699
MOVW	R0, #lo_addr(_Box8+28)
MOVT	R0, #hi_addr(_Box8+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2581 :: 		Box8.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+30)
MOVT	R0, #hi_addr(_Box8+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2582 :: 		Box8.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box8+32)
MOVT	R0, #hi_addr(_Box8+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2583 :: 		Box8.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+36)
MOVT	R0, #hi_addr(_Box8+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2584 :: 		Box8.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+40)
MOVT	R0, #hi_addr(_Box8+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2585 :: 		Box8.OnClickPtr      = Box8OnClick;
MOVW	R1, #lo_addr(_Box8OnClick+0)
MOVT	R1, #hi_addr(_Box8OnClick+0)
MOVW	R0, #lo_addr(_Box8+44)
MOVT	R0, #hi_addr(_Box8+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2586 :: 		Box8.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+48)
MOVT	R0, #hi_addr(_Box8+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2588 :: 		Label2.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Label2+0)
MOVT	R0, #hi_addr(_Label2+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2589 :: 		Label2.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label2+4)
MOVT	R0, #hi_addr(_Label2+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2590 :: 		Label2.Left            = 191;
MOVS	R1, #191
MOVW	R0, #lo_addr(_Label2+6)
MOVT	R0, #hi_addr(_Label2+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2591 :: 		Label2.Top             = 94;
MOVS	R1, #94
MOVW	R0, #lo_addr(_Label2+8)
MOVT	R0, #hi_addr(_Label2+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2592 :: 		Label2.Width           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label2+10)
MOVT	R0, #hi_addr(_Label2+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2593 :: 		Label2.Height          = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Label2+12)
MOVT	R0, #hi_addr(_Label2+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2594 :: 		Label2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+26)
MOVT	R0, #hi_addr(_Label2+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2595 :: 		Label2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+27)
MOVT	R0, #hi_addr(_Label2+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2596 :: 		Label2.Caption         = Label2_Caption;
MOVW	R1, #lo_addr(_Label2_Caption+0)
MOVT	R1, #hi_addr(_Label2_Caption+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2597 :: 		Label2.FontName        = Open_Sans_Light51x78_Regular;
MOVW	R1, #5349
MOVT	R1, #1
MOVW	R0, #lo_addr(_Label2+20)
MOVT	R0, #hi_addr(_Label2+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2598 :: 		Label2.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2599 :: 		Label2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+28)
MOVT	R0, #hi_addr(_Label2+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2600 :: 		Label2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+32)
MOVT	R0, #hi_addr(_Label2+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2601 :: 		Label2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+36)
MOVT	R0, #hi_addr(_Label2+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2602 :: 		Label2.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+40)
MOVT	R0, #hi_addr(_Label2+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2604 :: 		Box10.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Box10+0)
MOVT	R0, #hi_addr(_Box10+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2605 :: 		Box10.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Box10+4)
MOVT	R0, #hi_addr(_Box10+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2606 :: 		Box10.Left            = 108;
MOVS	R1, #108
MOVW	R0, #lo_addr(_Box10+6)
MOVT	R0, #hi_addr(_Box10+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2607 :: 		Box10.Top             = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box10+8)
MOVT	R0, #hi_addr(_Box10+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2608 :: 		Box10.Width           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Box10+10)
MOVT	R0, #hi_addr(_Box10+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2609 :: 		Box10.Height          = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Box10+12)
MOVT	R0, #hi_addr(_Box10+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2610 :: 		Box10.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+14)
MOVT	R0, #hi_addr(_Box10+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2611 :: 		Box10.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+16)
MOVT	R0, #hi_addr(_Box10+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2612 :: 		Box10.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+18)
MOVT	R0, #hi_addr(_Box10+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2613 :: 		Box10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box10+19)
MOVT	R0, #hi_addr(_Box10+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2614 :: 		Box10.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+20)
MOVT	R0, #hi_addr(_Box10+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2615 :: 		Box10.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+21)
MOVT	R0, #hi_addr(_Box10+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2616 :: 		Box10.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+22)
MOVT	R0, #hi_addr(_Box10+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2617 :: 		Box10.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box10+24)
MOVT	R0, #hi_addr(_Box10+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2618 :: 		Box10.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box10+26)
MOVT	R0, #hi_addr(_Box10+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2619 :: 		Box10.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box10+28)
MOVT	R0, #hi_addr(_Box10+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2620 :: 		Box10.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box10+30)
MOVT	R0, #hi_addr(_Box10+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2621 :: 		Box10.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box10+32)
MOVT	R0, #hi_addr(_Box10+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2622 :: 		Box10.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+36)
MOVT	R0, #hi_addr(_Box10+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2623 :: 		Box10.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+40)
MOVT	R0, #hi_addr(_Box10+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2624 :: 		Box10.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+44)
MOVT	R0, #hi_addr(_Box10+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2625 :: 		Box10.OnPressPtr      = Box10OnPress;
MOVW	R1, #lo_addr(_Box10OnPress+0)
MOVT	R1, #hi_addr(_Box10OnPress+0)
MOVW	R0, #lo_addr(_Box10+48)
MOVT	R0, #hi_addr(_Box10+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2627 :: 		Box11.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Box11+0)
MOVT	R0, #hi_addr(_Box11+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2628 :: 		Box11.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box11+4)
MOVT	R0, #hi_addr(_Box11+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2629 :: 		Box11.Left            = 146;
MOVS	R1, #146
MOVW	R0, #lo_addr(_Box11+6)
MOVT	R0, #hi_addr(_Box11+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2630 :: 		Box11.Top             = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box11+8)
MOVT	R0, #hi_addr(_Box11+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2631 :: 		Box11.Width           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Box11+10)
MOVT	R0, #hi_addr(_Box11+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2632 :: 		Box11.Height          = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Box11+12)
MOVT	R0, #hi_addr(_Box11+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2633 :: 		Box11.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+14)
MOVT	R0, #hi_addr(_Box11+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2634 :: 		Box11.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+16)
MOVT	R0, #hi_addr(_Box11+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2635 :: 		Box11.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+18)
MOVT	R0, #hi_addr(_Box11+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2636 :: 		Box11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box11+19)
MOVT	R0, #hi_addr(_Box11+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2637 :: 		Box11.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+20)
MOVT	R0, #hi_addr(_Box11+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2638 :: 		Box11.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+21)
MOVT	R0, #hi_addr(_Box11+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2639 :: 		Box11.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+22)
MOVT	R0, #hi_addr(_Box11+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2640 :: 		Box11.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box11+24)
MOVT	R0, #hi_addr(_Box11+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2641 :: 		Box11.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box11+26)
MOVT	R0, #hi_addr(_Box11+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2642 :: 		Box11.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box11+28)
MOVT	R0, #hi_addr(_Box11+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2643 :: 		Box11.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box11+30)
MOVT	R0, #hi_addr(_Box11+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2644 :: 		Box11.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box11+32)
MOVT	R0, #hi_addr(_Box11+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2645 :: 		Box11.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+36)
MOVT	R0, #hi_addr(_Box11+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2646 :: 		Box11.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+40)
MOVT	R0, #hi_addr(_Box11+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2647 :: 		Box11.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+44)
MOVT	R0, #hi_addr(_Box11+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2648 :: 		Box11.OnPressPtr      = Box11OnPress;
MOVW	R1, #lo_addr(_Box11OnPress+0)
MOVT	R1, #hi_addr(_Box11OnPress+0)
MOVW	R0, #lo_addr(_Box11+48)
MOVT	R0, #hi_addr(_Box11+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2650 :: 		Label5.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Label5+0)
MOVT	R0, #hi_addr(_Label5+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2651 :: 		Label5.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label5+4)
MOVT	R0, #hi_addr(_Label5+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2652 :: 		Label5.Left            = 408;
MOVW	R1, #408
MOVW	R0, #lo_addr(_Label5+6)
MOVT	R0, #hi_addr(_Label5+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2653 :: 		Label5.Top             = 236;
MOVS	R1, #236
MOVW	R0, #lo_addr(_Label5+8)
MOVT	R0, #hi_addr(_Label5+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2654 :: 		Label5.Width           = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Label5+10)
MOVT	R0, #hi_addr(_Label5+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2655 :: 		Label5.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label5+12)
MOVT	R0, #hi_addr(_Label5+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2656 :: 		Label5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+26)
MOVT	R0, #hi_addr(_Label5+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2657 :: 		Label5.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+27)
MOVT	R0, #hi_addr(_Label5+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2658 :: 		Label5.Caption         = Label5_Caption;
MOVW	R1, #lo_addr(_Label5_Caption+0)
MOVT	R1, #hi_addr(_Label5_Caption+0)
MOVW	R0, #lo_addr(_Label5+16)
MOVT	R0, #hi_addr(_Label5+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2659 :: 		Label5.FontName        = Arial_Black16x23_Regular;
MOVW	R1, #2595
MOVW	R0, #lo_addr(_Label5+20)
MOVT	R0, #hi_addr(_Label5+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2660 :: 		Label5.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+24)
MOVT	R0, #hi_addr(_Label5+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2661 :: 		Label5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+28)
MOVT	R0, #hi_addr(_Label5+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2662 :: 		Label5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+32)
MOVT	R0, #hi_addr(_Label5+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2663 :: 		Label5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+36)
MOVT	R0, #hi_addr(_Label5+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2664 :: 		Label5.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+40)
MOVT	R0, #hi_addr(_Label5+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2666 :: 		Image18.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Image18+0)
MOVT	R0, #hi_addr(_Image18+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2667 :: 		Image18.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image18+4)
MOVT	R0, #hi_addr(_Image18+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2668 :: 		Image18.Left            = 380;
MOVW	R1, #380
MOVW	R0, #lo_addr(_Image18+6)
MOVT	R0, #hi_addr(_Image18+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2669 :: 		Image18.Top             = 236;
MOVS	R1, #236
MOVW	R0, #lo_addr(_Image18+8)
MOVT	R0, #hi_addr(_Image18+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2670 :: 		Image18.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image18+10)
MOVT	R0, #hi_addr(_Image18+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2671 :: 		Image18.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image18+12)
MOVT	R0, #hi_addr(_Image18+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2672 :: 		Image18.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+22)
MOVT	R0, #hi_addr(_Image18+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2673 :: 		Image18.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image18+23)
MOVT	R0, #hi_addr(_Image18+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2674 :: 		Image18.Picture_Name    = icon_ok_bmp_1;
MOVW	R1, #59326
MOVT	R1, #61
MOVW	R0, #lo_addr(_Image18+16)
MOVT	R0, #hi_addr(_Image18+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2675 :: 		Image18.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image18+20)
MOVT	R0, #hi_addr(_Image18+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2676 :: 		Image18.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+21)
MOVT	R0, #hi_addr(_Image18+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2677 :: 		Image18.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+24)
MOVT	R0, #hi_addr(_Image18+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2678 :: 		Image18.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+28)
MOVT	R0, #hi_addr(_Image18+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2679 :: 		Image18.OnClickPtr      = Image18OnPress;
MOVW	R1, #lo_addr(_Image18OnPress+0)
MOVT	R1, #hi_addr(_Image18OnPress+0)
MOVW	R0, #lo_addr(_Image18+32)
MOVT	R0, #hi_addr(_Image18+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2680 :: 		Image18.OnPressPtr      = Image18OnPress;
MOVW	R1, #lo_addr(_Image18OnPress+0)
MOVT	R1, #hi_addr(_Image18OnPress+0)
MOVW	R0, #lo_addr(_Image18+36)
MOVT	R0, #hi_addr(_Image18+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2682 :: 		Box3.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Box3+0)
MOVT	R0, #hi_addr(_Box3+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2683 :: 		Box3.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Box3+4)
MOVT	R0, #hi_addr(_Box3+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2684 :: 		Box3.Left            = 212;
MOVS	R1, #212
MOVW	R0, #lo_addr(_Box3+6)
MOVT	R0, #hi_addr(_Box3+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2685 :: 		Box3.Top             = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box3+8)
MOVT	R0, #hi_addr(_Box3+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2686 :: 		Box3.Width           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Box3+10)
MOVT	R0, #hi_addr(_Box3+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2687 :: 		Box3.Height          = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Box3+12)
MOVT	R0, #hi_addr(_Box3+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2688 :: 		Box3.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+14)
MOVT	R0, #hi_addr(_Box3+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2689 :: 		Box3.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+16)
MOVT	R0, #hi_addr(_Box3+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2690 :: 		Box3.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+18)
MOVT	R0, #hi_addr(_Box3+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2691 :: 		Box3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+19)
MOVT	R0, #hi_addr(_Box3+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2692 :: 		Box3.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+20)
MOVT	R0, #hi_addr(_Box3+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2693 :: 		Box3.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+21)
MOVT	R0, #hi_addr(_Box3+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2694 :: 		Box3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+22)
MOVT	R0, #hi_addr(_Box3+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2695 :: 		Box3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box3+24)
MOVT	R0, #hi_addr(_Box3+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2696 :: 		Box3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box3+26)
MOVT	R0, #hi_addr(_Box3+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2697 :: 		Box3.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box3+28)
MOVT	R0, #hi_addr(_Box3+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2698 :: 		Box3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+30)
MOVT	R0, #hi_addr(_Box3+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2699 :: 		Box3.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box3+32)
MOVT	R0, #hi_addr(_Box3+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2700 :: 		Box3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+36)
MOVT	R0, #hi_addr(_Box3+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2701 :: 		Box3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+40)
MOVT	R0, #hi_addr(_Box3+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2702 :: 		Box3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+44)
MOVT	R0, #hi_addr(_Box3+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2703 :: 		Box3.OnPressPtr      = Box3OnPress;
MOVW	R1, #lo_addr(_Box3OnPress+0)
MOVT	R1, #hi_addr(_Box3OnPress+0)
MOVW	R0, #lo_addr(_Box3+48)
MOVT	R0, #hi_addr(_Box3+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2705 :: 		Box4.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Box4+0)
MOVT	R0, #hi_addr(_Box4+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2706 :: 		Box4.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Box4+4)
MOVT	R0, #hi_addr(_Box4+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2707 :: 		Box4.Left            = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Box4+6)
MOVT	R0, #hi_addr(_Box4+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2708 :: 		Box4.Top             = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box4+8)
MOVT	R0, #hi_addr(_Box4+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2709 :: 		Box4.Width           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Box4+10)
MOVT	R0, #hi_addr(_Box4+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2710 :: 		Box4.Height          = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Box4+12)
MOVT	R0, #hi_addr(_Box4+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2711 :: 		Box4.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+14)
MOVT	R0, #hi_addr(_Box4+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2712 :: 		Box4.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+16)
MOVT	R0, #hi_addr(_Box4+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2713 :: 		Box4.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+18)
MOVT	R0, #hi_addr(_Box4+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2714 :: 		Box4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box4+19)
MOVT	R0, #hi_addr(_Box4+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2715 :: 		Box4.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+20)
MOVT	R0, #hi_addr(_Box4+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2716 :: 		Box4.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+21)
MOVT	R0, #hi_addr(_Box4+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2717 :: 		Box4.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+22)
MOVT	R0, #hi_addr(_Box4+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2718 :: 		Box4.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box4+24)
MOVT	R0, #hi_addr(_Box4+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2719 :: 		Box4.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box4+26)
MOVT	R0, #hi_addr(_Box4+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2720 :: 		Box4.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box4+28)
MOVT	R0, #hi_addr(_Box4+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2721 :: 		Box4.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box4+30)
MOVT	R0, #hi_addr(_Box4+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2722 :: 		Box4.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box4+32)
MOVT	R0, #hi_addr(_Box4+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2723 :: 		Box4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+36)
MOVT	R0, #hi_addr(_Box4+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2724 :: 		Box4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+40)
MOVT	R0, #hi_addr(_Box4+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2725 :: 		Box4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+44)
MOVT	R0, #hi_addr(_Box4+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2726 :: 		Box4.OnPressPtr      = Box4OnPress;
MOVW	R1, #lo_addr(_Box4OnPress+0)
MOVT	R1, #hi_addr(_Box4OnPress+0)
MOVW	R0, #lo_addr(_Box4+48)
MOVT	R0, #hi_addr(_Box4+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2728 :: 		Image19.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Image19+0)
MOVT	R0, #hi_addr(_Image19+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2729 :: 		Image19.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Image19+4)
MOVT	R0, #hi_addr(_Image19+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2730 :: 		Image19.Left            = 475;
MOVW	R1, #475
MOVW	R0, #lo_addr(_Image19+6)
MOVT	R0, #hi_addr(_Image19+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2731 :: 		Image19.Top             = 248;
MOVS	R1, #248
MOVW	R0, #lo_addr(_Image19+8)
MOVT	R0, #hi_addr(_Image19+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2732 :: 		Image19.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Image19+10)
MOVT	R0, #hi_addr(_Image19+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2733 :: 		Image19.Height          = 740;
MOVW	R1, #740
MOVW	R0, #lo_addr(_Image19+12)
MOVT	R0, #hi_addr(_Image19+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2734 :: 		Image19.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image19+22)
MOVT	R0, #hi_addr(_Image19+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2735 :: 		Image19.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image19+23)
MOVT	R0, #hi_addr(_Image19+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2736 :: 		Image19.Picture_Name    = stripe_black_bmp;
MOVW	R1, #60300
MOVT	R1, #61
MOVW	R0, #lo_addr(_Image19+16)
MOVT	R0, #hi_addr(_Image19+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2737 :: 		Image19.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image19+20)
MOVT	R0, #hi_addr(_Image19+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2738 :: 		Image19.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image19+21)
MOVT	R0, #hi_addr(_Image19+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2739 :: 		Image19.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image19+24)
MOVT	R0, #hi_addr(_Image19+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2740 :: 		Image19.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image19+28)
MOVT	R0, #hi_addr(_Image19+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2741 :: 		Image19.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image19+32)
MOVT	R0, #hi_addr(_Image19+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2742 :: 		Image19.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image19+36)
MOVT	R0, #hi_addr(_Image19+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2744 :: 		Label6.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Label6+0)
MOVT	R0, #hi_addr(_Label6+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2745 :: 		Label6.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label6+4)
MOVT	R0, #hi_addr(_Label6+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2746 :: 		Label6.Left            = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label6+6)
MOVT	R0, #hi_addr(_Label6+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2747 :: 		Label6.Top             = 235;
MOVS	R1, #235
MOVW	R0, #lo_addr(_Label6+8)
MOVT	R0, #hi_addr(_Label6+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2748 :: 		Label6.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Label6+10)
MOVT	R0, #hi_addr(_Label6+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2749 :: 		Label6.Height          = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Label6+12)
MOVT	R0, #hi_addr(_Label6+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2750 :: 		Label6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+26)
MOVT	R0, #hi_addr(_Label6+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2751 :: 		Label6.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+27)
MOVT	R0, #hi_addr(_Label6+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2752 :: 		Label6.Caption         = Label6_Caption;
MOVW	R1, #lo_addr(_Label6_Caption+0)
MOVT	R1, #hi_addr(_Label6_Caption+0)
MOVW	R0, #lo_addr(_Label6+16)
MOVT	R0, #hi_addr(_Label6+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2753 :: 		Label6.FontName        = Open_Sans_Light12x18_Regular;
MOVW	R1, #60511
MOVW	R0, #lo_addr(_Label6+20)
MOVT	R0, #hi_addr(_Label6+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2754 :: 		Label6.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label6+24)
MOVT	R0, #hi_addr(_Label6+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2755 :: 		Label6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+28)
MOVT	R0, #hi_addr(_Label6+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2756 :: 		Label6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+32)
MOVT	R0, #hi_addr(_Label6+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2757 :: 		Label6.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+36)
MOVT	R0, #hi_addr(_Label6+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2758 :: 		Label6.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+40)
MOVT	R0, #hi_addr(_Label6+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2760 :: 		Image20.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Image20+0)
MOVT	R0, #hi_addr(_Image20+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2761 :: 		Image20.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Image20+4)
MOVT	R0, #hi_addr(_Image20+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2762 :: 		Image20.Left            = 475;
MOVW	R1, #475
MOVW	R0, #lo_addr(_Image20+6)
MOVT	R0, #hi_addr(_Image20+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2763 :: 		Image20.Top             = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Image20+8)
MOVT	R0, #hi_addr(_Image20+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2764 :: 		Image20.Width           = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_Image20+10)
MOVT	R0, #hi_addr(_Image20+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2765 :: 		Image20.Height          = 151;
MOVS	R1, #151
MOVW	R0, #lo_addr(_Image20+12)
MOVT	R0, #hi_addr(_Image20+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2766 :: 		Image20.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+22)
MOVT	R0, #hi_addr(_Image20+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2767 :: 		Image20.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image20+23)
MOVT	R0, #hi_addr(_Image20+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2768 :: 		Image20.Picture_Name    = am_pm_bmp;
MOVW	R1, #48050
MOVT	R1, #62
MOVW	R0, #lo_addr(_Image20+16)
MOVT	R0, #hi_addr(_Image20+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2769 :: 		Image20.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+20)
MOVT	R0, #hi_addr(_Image20+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2770 :: 		Image20.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+21)
MOVT	R0, #hi_addr(_Image20+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2771 :: 		Image20.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+24)
MOVT	R0, #hi_addr(_Image20+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2772 :: 		Image20.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+28)
MOVT	R0, #hi_addr(_Image20+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2773 :: 		Image20.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+32)
MOVT	R0, #hi_addr(_Image20+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2774 :: 		Image20.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+36)
MOVT	R0, #hi_addr(_Image20+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2776 :: 		Box5.OwnerScreen     = &Set_clock;
MOVW	R1, #lo_addr(_Set_clock+0)
MOVT	R1, #hi_addr(_Set_clock+0)
MOVW	R0, #lo_addr(_Box5+0)
MOVT	R0, #hi_addr(_Box5+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2777 :: 		Box5.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Box5+4)
MOVT	R0, #hi_addr(_Box5+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2778 :: 		Box5.Left            = 305;
MOVW	R1, #305
MOVW	R0, #lo_addr(_Box5+6)
MOVT	R0, #hi_addr(_Box5+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2779 :: 		Box5.Top             = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box5+8)
MOVT	R0, #hi_addr(_Box5+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2780 :: 		Box5.Width           = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_Box5+10)
MOVT	R0, #hi_addr(_Box5+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2781 :: 		Box5.Height          = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Box5+12)
MOVT	R0, #hi_addr(_Box5+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2782 :: 		Box5.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+14)
MOVT	R0, #hi_addr(_Box5+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2783 :: 		Box5.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+16)
MOVT	R0, #hi_addr(_Box5+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2784 :: 		Box5.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+18)
MOVT	R0, #hi_addr(_Box5+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2785 :: 		Box5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box5+19)
MOVT	R0, #hi_addr(_Box5+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2786 :: 		Box5.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+20)
MOVT	R0, #hi_addr(_Box5+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2787 :: 		Box5.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+21)
MOVT	R0, #hi_addr(_Box5+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2788 :: 		Box5.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+22)
MOVT	R0, #hi_addr(_Box5+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2789 :: 		Box5.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box5+24)
MOVT	R0, #hi_addr(_Box5+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2790 :: 		Box5.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box5+26)
MOVT	R0, #hi_addr(_Box5+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2791 :: 		Box5.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box5+28)
MOVT	R0, #hi_addr(_Box5+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2792 :: 		Box5.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box5+30)
MOVT	R0, #hi_addr(_Box5+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2793 :: 		Box5.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box5+32)
MOVT	R0, #hi_addr(_Box5+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2794 :: 		Box5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+36)
MOVT	R0, #hi_addr(_Box5+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2795 :: 		Box5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+40)
MOVT	R0, #hi_addr(_Box5+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2796 :: 		Box5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+44)
MOVT	R0, #hi_addr(_Box5+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2797 :: 		Box5.OnPressPtr      = Box5OnPress;
MOVW	R1, #lo_addr(_Box5OnPress+0)
MOVT	R1, #hi_addr(_Box5OnPress+0)
MOVW	R0, #lo_addr(_Box5+48)
MOVT	R0, #hi_addr(_Box5+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2799 :: 		Box23.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Box23+0)
MOVT	R0, #hi_addr(_Box23+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2800 :: 		Box23.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+4)
MOVT	R0, #hi_addr(_Box23+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2801 :: 		Box23.Left            = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box23+6)
MOVT	R0, #hi_addr(_Box23+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2802 :: 		Box23.Top             = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Box23+8)
MOVT	R0, #hi_addr(_Box23+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2803 :: 		Box23.Width           = 236;
MOVS	R1, #236
MOVW	R0, #lo_addr(_Box23+10)
MOVT	R0, #hi_addr(_Box23+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2804 :: 		Box23.Height          = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Box23+12)
MOVT	R0, #hi_addr(_Box23+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2805 :: 		Box23.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box23+14)
MOVT	R0, #hi_addr(_Box23+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2806 :: 		Box23.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+16)
MOVT	R0, #hi_addr(_Box23+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2807 :: 		Box23.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+18)
MOVT	R0, #hi_addr(_Box23+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2808 :: 		Box23.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box23+19)
MOVT	R0, #hi_addr(_Box23+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2809 :: 		Box23.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box23+20)
MOVT	R0, #hi_addr(_Box23+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2810 :: 		Box23.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+21)
MOVT	R0, #hi_addr(_Box23+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2811 :: 		Box23.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+22)
MOVT	R0, #hi_addr(_Box23+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2812 :: 		Box23.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box23+24)
MOVT	R0, #hi_addr(_Box23+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2813 :: 		Box23.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box23+26)
MOVT	R0, #hi_addr(_Box23+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2814 :: 		Box23.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box23+28)
MOVT	R0, #hi_addr(_Box23+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2815 :: 		Box23.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+30)
MOVT	R0, #hi_addr(_Box23+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2816 :: 		Box23.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box23+32)
MOVT	R0, #hi_addr(_Box23+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2817 :: 		Box23.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+36)
MOVT	R0, #hi_addr(_Box23+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2818 :: 		Box23.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+40)
MOVT	R0, #hi_addr(_Box23+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2819 :: 		Box23.OnClickPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Box23+44)
MOVT	R0, #hi_addr(_Box23+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2820 :: 		Box23.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+48)
MOVT	R0, #hi_addr(_Box23+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2822 :: 		Image49.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Image49+0)
MOVT	R0, #hi_addr(_Image49+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2823 :: 		Image49.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image49+4)
MOVT	R0, #hi_addr(_Image49+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2824 :: 		Image49.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image49+6)
MOVT	R0, #hi_addr(_Image49+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2825 :: 		Image49.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image49+8)
MOVT	R0, #hi_addr(_Image49+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2826 :: 		Image49.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image49+10)
MOVT	R0, #hi_addr(_Image49+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2827 :: 		Image49.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image49+12)
MOVT	R0, #hi_addr(_Image49+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2828 :: 		Image49.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image49+22)
MOVT	R0, #hi_addr(_Image49+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2829 :: 		Image49.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image49+23)
MOVT	R0, #hi_addr(_Image49+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2830 :: 		Image49.Picture_Name    = icon_back_accel_bmp;
MOVW	R1, #9700
MOVT	R1, #63
MOVW	R0, #lo_addr(_Image49+16)
MOVT	R0, #hi_addr(_Image49+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2831 :: 		Image49.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image49+20)
MOVT	R0, #hi_addr(_Image49+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2832 :: 		Image49.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image49+21)
MOVT	R0, #hi_addr(_Image49+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2833 :: 		Image49.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image49+24)
MOVT	R0, #hi_addr(_Image49+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2834 :: 		Image49.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image49+28)
MOVT	R0, #hi_addr(_Image49+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2835 :: 		Image49.OnClickPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Image49+32)
MOVT	R0, #hi_addr(_Image49+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2836 :: 		Image49.OnPressPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Image49+36)
MOVT	R0, #hi_addr(_Image49+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2838 :: 		Box6.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Box6+0)
MOVT	R0, #hi_addr(_Box6+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2839 :: 		Box6.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Box6+4)
MOVT	R0, #hi_addr(_Box6+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2840 :: 		Box6.Left            = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_Box6+6)
MOVT	R0, #hi_addr(_Box6+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2841 :: 		Box6.Top             = 176;
MOVS	R1, #176
MOVW	R0, #lo_addr(_Box6+8)
MOVT	R0, #hi_addr(_Box6+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2842 :: 		Box6.Width           = 220;
MOVS	R1, #220
MOVW	R0, #lo_addr(_Box6+10)
MOVT	R0, #hi_addr(_Box6+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2843 :: 		Box6.Height          = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_Box6+12)
MOVT	R0, #hi_addr(_Box6+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2844 :: 		Box6.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+14)
MOVT	R0, #hi_addr(_Box6+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2845 :: 		Box6.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+16)
MOVT	R0, #hi_addr(_Box6+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2846 :: 		Box6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+18)
MOVT	R0, #hi_addr(_Box6+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2847 :: 		Box6.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+19)
MOVT	R0, #hi_addr(_Box6+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2848 :: 		Box6.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+20)
MOVT	R0, #hi_addr(_Box6+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2849 :: 		Box6.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+21)
MOVT	R0, #hi_addr(_Box6+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2850 :: 		Box6.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+22)
MOVT	R0, #hi_addr(_Box6+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2851 :: 		Box6.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box6+24)
MOVT	R0, #hi_addr(_Box6+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2852 :: 		Box6.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box6+26)
MOVT	R0, #hi_addr(_Box6+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2853 :: 		Box6.Color           = 0xAEB8;
MOVW	R1, #44728
MOVW	R0, #lo_addr(_Box6+28)
MOVT	R0, #hi_addr(_Box6+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2854 :: 		Box6.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+30)
MOVT	R0, #hi_addr(_Box6+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2855 :: 		Box6.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box6+32)
MOVT	R0, #hi_addr(_Box6+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2856 :: 		Box6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+36)
MOVT	R0, #hi_addr(_Box6+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2857 :: 		Box6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+40)
MOVT	R0, #hi_addr(_Box6+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2858 :: 		Box6.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+44)
MOVT	R0, #hi_addr(_Box6+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2859 :: 		Box6.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+48)
MOVT	R0, #hi_addr(_Box6+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2861 :: 		Box24.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Box24+0)
MOVT	R0, #hi_addr(_Box24+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2862 :: 		Box24.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Box24+4)
MOVT	R0, #hi_addr(_Box24+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2863 :: 		Box24.Left            = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_Box24+6)
MOVT	R0, #hi_addr(_Box24+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2864 :: 		Box24.Top             = 121;
MOVS	R1, #121
MOVW	R0, #lo_addr(_Box24+8)
MOVT	R0, #hi_addr(_Box24+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2865 :: 		Box24.Width           = 220;
MOVS	R1, #220
MOVW	R0, #lo_addr(_Box24+10)
MOVT	R0, #hi_addr(_Box24+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2866 :: 		Box24.Height          = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_Box24+12)
MOVT	R0, #hi_addr(_Box24+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2867 :: 		Box24.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box24+14)
MOVT	R0, #hi_addr(_Box24+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2868 :: 		Box24.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box24+16)
MOVT	R0, #hi_addr(_Box24+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2869 :: 		Box24.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box24+18)
MOVT	R0, #hi_addr(_Box24+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2870 :: 		Box24.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box24+19)
MOVT	R0, #hi_addr(_Box24+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2871 :: 		Box24.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box24+20)
MOVT	R0, #hi_addr(_Box24+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2872 :: 		Box24.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box24+21)
MOVT	R0, #hi_addr(_Box24+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2873 :: 		Box24.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box24+22)
MOVT	R0, #hi_addr(_Box24+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2874 :: 		Box24.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box24+24)
MOVT	R0, #hi_addr(_Box24+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2875 :: 		Box24.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box24+26)
MOVT	R0, #hi_addr(_Box24+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2876 :: 		Box24.Color           = 0xAEB8;
MOVW	R1, #44728
MOVW	R0, #lo_addr(_Box24+28)
MOVT	R0, #hi_addr(_Box24+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2877 :: 		Box24.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box24+30)
MOVT	R0, #hi_addr(_Box24+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2878 :: 		Box24.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box24+32)
MOVT	R0, #hi_addr(_Box24+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2879 :: 		Box24.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box24+36)
MOVT	R0, #hi_addr(_Box24+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2880 :: 		Box24.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box24+40)
MOVT	R0, #hi_addr(_Box24+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2881 :: 		Box24.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box24+44)
MOVT	R0, #hi_addr(_Box24+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2882 :: 		Box24.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box24+48)
MOVT	R0, #hi_addr(_Box24+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2884 :: 		Box25.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Box25+0)
MOVT	R0, #hi_addr(_Box25+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2885 :: 		Box25.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box25+4)
MOVT	R0, #hi_addr(_Box25+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2886 :: 		Box25.Left            = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_Box25+6)
MOVT	R0, #hi_addr(_Box25+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2887 :: 		Box25.Top             = 65;
MOVS	R1, #65
MOVW	R0, #lo_addr(_Box25+8)
MOVT	R0, #hi_addr(_Box25+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2888 :: 		Box25.Width           = 220;
MOVS	R1, #220
MOVW	R0, #lo_addr(_Box25+10)
MOVT	R0, #hi_addr(_Box25+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2889 :: 		Box25.Height          = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_Box25+12)
MOVT	R0, #hi_addr(_Box25+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2890 :: 		Box25.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box25+14)
MOVT	R0, #hi_addr(_Box25+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2891 :: 		Box25.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box25+16)
MOVT	R0, #hi_addr(_Box25+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2892 :: 		Box25.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box25+18)
MOVT	R0, #hi_addr(_Box25+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2893 :: 		Box25.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box25+19)
MOVT	R0, #hi_addr(_Box25+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2894 :: 		Box25.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box25+20)
MOVT	R0, #hi_addr(_Box25+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2895 :: 		Box25.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box25+21)
MOVT	R0, #hi_addr(_Box25+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2896 :: 		Box25.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box25+22)
MOVT	R0, #hi_addr(_Box25+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2897 :: 		Box25.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box25+24)
MOVT	R0, #hi_addr(_Box25+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2898 :: 		Box25.Gradient_End_Color = 0xAEB8;
MOVW	R1, #44728
MOVW	R0, #lo_addr(_Box25+26)
MOVT	R0, #hi_addr(_Box25+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2899 :: 		Box25.Color           = 0xAEB8;
MOVW	R1, #44728
MOVW	R0, #lo_addr(_Box25+28)
MOVT	R0, #hi_addr(_Box25+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2900 :: 		Box25.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box25+30)
MOVT	R0, #hi_addr(_Box25+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2901 :: 		Box25.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box25+32)
MOVT	R0, #hi_addr(_Box25+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2902 :: 		Box25.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box25+36)
MOVT	R0, #hi_addr(_Box25+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2903 :: 		Box25.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box25+40)
MOVT	R0, #hi_addr(_Box25+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2904 :: 		Box25.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box25+44)
MOVT	R0, #hi_addr(_Box25+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2905 :: 		Box25.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box25+48)
MOVT	R0, #hi_addr(_Box25+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2907 :: 		Label1.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2908 :: 		Label1.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label1+4)
MOVT	R0, #hi_addr(_Label1+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2909 :: 		Label1.Left            = 176;
MOVS	R1, #176
MOVW	R0, #lo_addr(_Label1+6)
MOVT	R0, #hi_addr(_Label1+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2910 :: 		Label1.Top             = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label1+8)
MOVT	R0, #hi_addr(_Label1+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2911 :: 		Label1.Width           = 161;
MOVS	R1, #161
MOVW	R0, #lo_addr(_Label1+10)
MOVT	R0, #hi_addr(_Label1+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2912 :: 		Label1.Height          = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_Label1+12)
MOVT	R0, #hi_addr(_Label1+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2913 :: 		Label1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+26)
MOVT	R0, #hi_addr(_Label1+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2914 :: 		Label1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+27)
MOVT	R0, #hi_addr(_Label1+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2915 :: 		Label1.Caption         = Label1_Caption;
MOVW	R1, #lo_addr(_Label1_Caption+0)
MOVT	R1, #hi_addr(_Label1_Caption+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2916 :: 		Label1.FontName        = Arial_Black27x38_Bold;
MOVW	R1, #23145
MOVW	R0, #lo_addr(_Label1+20)
MOVT	R0, #hi_addr(_Label1+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2917 :: 		Label1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+24)
MOVT	R0, #hi_addr(_Label1+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2918 :: 		Label1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+28)
MOVT	R0, #hi_addr(_Label1+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2919 :: 		Label1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+32)
MOVT	R0, #hi_addr(_Label1+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2920 :: 		Label1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+36)
MOVT	R0, #hi_addr(_Label1+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2921 :: 		Label1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+40)
MOVT	R0, #hi_addr(_Label1+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2923 :: 		Line3.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Line3+0)
MOVT	R0, #hi_addr(_Line3+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2924 :: 		Line3.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Line3+4)
MOVT	R0, #hi_addr(_Line3+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2925 :: 		Line3.First_Point_X   = 138;
MOVS	R1, #138
MOVW	R0, #lo_addr(_Line3+6)
MOVT	R0, #hi_addr(_Line3+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2926 :: 		Line3.First_Point_Y   = 122;
MOVS	R1, #122
MOVW	R0, #lo_addr(_Line3+8)
MOVT	R0, #hi_addr(_Line3+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2927 :: 		Line3.Second_Point_X  = 362;
MOVW	R1, #362
MOVW	R0, #lo_addr(_Line3+10)
MOVT	R0, #hi_addr(_Line3+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2928 :: 		Line3.Second_Point_Y  = 222;
MOVS	R1, #222
MOVW	R0, #lo_addr(_Line3+12)
MOVT	R0, #hi_addr(_Line3+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2929 :: 		Line3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Line3+15)
MOVT	R0, #hi_addr(_Line3+15)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2930 :: 		Line3.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Line3+14)
MOVT	R0, #hi_addr(_Line3+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2931 :: 		Line3.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Line3+16)
MOVT	R0, #hi_addr(_Line3+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2933 :: 		Label3.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2934 :: 		Label3.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label3+4)
MOVT	R0, #hi_addr(_Label3+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2935 :: 		Label3.Left            = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_Label3+6)
MOVT	R0, #hi_addr(_Label3+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2936 :: 		Label3.Top             = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Label3+8)
MOVT	R0, #hi_addr(_Label3+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2937 :: 		Label3.Width           = 92;
MOVS	R1, #92
MOVW	R0, #lo_addr(_Label3+10)
MOVT	R0, #hi_addr(_Label3+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2938 :: 		Label3.Height          = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label3+12)
MOVT	R0, #hi_addr(_Label3+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2939 :: 		Label3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+26)
MOVT	R0, #hi_addr(_Label3+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2940 :: 		Label3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+27)
MOVT	R0, #hi_addr(_Label3+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2941 :: 		Label3.Caption         = Label3_Caption;
MOVW	R1, #lo_addr(_Label3_Caption+0)
MOVT	R1, #hi_addr(_Label3_Caption+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2942 :: 		Label3.FontName        = Arial11x14_Bold;
MOVW	R1, #56193
MOVW	R0, #lo_addr(_Label3+20)
MOVT	R0, #hi_addr(_Label3+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2943 :: 		Label3.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+24)
MOVT	R0, #hi_addr(_Label3+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2944 :: 		Label3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+28)
MOVT	R0, #hi_addr(_Label3+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2945 :: 		Label3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+32)
MOVT	R0, #hi_addr(_Label3+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2946 :: 		Label3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+36)
MOVT	R0, #hi_addr(_Label3+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2947 :: 		Label3.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+40)
MOVT	R0, #hi_addr(_Label3+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2949 :: 		Label4.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Label4+0)
MOVT	R0, #hi_addr(_Label4+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2950 :: 		Label4.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Label4+4)
MOVT	R0, #hi_addr(_Label4+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2951 :: 		Label4.Left            = 270;
MOVW	R1, #270
MOVW	R0, #lo_addr(_Label4+6)
MOVT	R0, #hi_addr(_Label4+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2952 :: 		Label4.Top             = 115;
MOVS	R1, #115
MOVW	R0, #lo_addr(_Label4+8)
MOVT	R0, #hi_addr(_Label4+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2953 :: 		Label4.Width           = 93;
MOVS	R1, #93
MOVW	R0, #lo_addr(_Label4+10)
MOVT	R0, #hi_addr(_Label4+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2954 :: 		Label4.Height          = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label4+12)
MOVT	R0, #hi_addr(_Label4+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2955 :: 		Label4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+26)
MOVT	R0, #hi_addr(_Label4+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2956 :: 		Label4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+27)
MOVT	R0, #hi_addr(_Label4+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2957 :: 		Label4.Caption         = Label4_Caption;
MOVW	R1, #lo_addr(_Label4_Caption+0)
MOVT	R1, #hi_addr(_Label4_Caption+0)
MOVW	R0, #lo_addr(_Label4+16)
MOVT	R0, #hi_addr(_Label4+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2958 :: 		Label4.FontName        = Arial11x14_Bold;
MOVW	R1, #56193
MOVW	R0, #lo_addr(_Label4+20)
MOVT	R0, #hi_addr(_Label4+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2959 :: 		Label4.Font_Color      = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label4+24)
MOVT	R0, #hi_addr(_Label4+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2960 :: 		Label4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+28)
MOVT	R0, #hi_addr(_Label4+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2961 :: 		Label4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+32)
MOVT	R0, #hi_addr(_Label4+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2962 :: 		Label4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+36)
MOVT	R0, #hi_addr(_Label4+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2963 :: 		Label4.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+40)
MOVT	R0, #hi_addr(_Label4+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2965 :: 		Box26.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Box26+0)
MOVT	R0, #hi_addr(_Box26+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2966 :: 		Box26.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Box26+4)
MOVT	R0, #hi_addr(_Box26+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2967 :: 		Box26.Left            = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_Box26+6)
MOVT	R0, #hi_addr(_Box26+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2968 :: 		Box26.Top             = 70;
MOVS	R1, #70
MOVW	R0, #lo_addr(_Box26+8)
MOVT	R0, #hi_addr(_Box26+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2969 :: 		Box26.Width           = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box26+10)
MOVT	R0, #hi_addr(_Box26+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2970 :: 		Box26.Height          = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Box26+12)
MOVT	R0, #hi_addr(_Box26+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2971 :: 		Box26.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box26+14)
MOVT	R0, #hi_addr(_Box26+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2972 :: 		Box26.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box26+16)
MOVT	R0, #hi_addr(_Box26+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2973 :: 		Box26.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box26+18)
MOVT	R0, #hi_addr(_Box26+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2974 :: 		Box26.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box26+19)
MOVT	R0, #hi_addr(_Box26+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2975 :: 		Box26.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box26+20)
MOVT	R0, #hi_addr(_Box26+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2976 :: 		Box26.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box26+21)
MOVT	R0, #hi_addr(_Box26+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2977 :: 		Box26.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box26+22)
MOVT	R0, #hi_addr(_Box26+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2978 :: 		Box26.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box26+24)
MOVT	R0, #hi_addr(_Box26+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2979 :: 		Box26.Gradient_End_Color = 0xAEB8;
MOVW	R1, #44728
MOVW	R0, #lo_addr(_Box26+26)
MOVT	R0, #hi_addr(_Box26+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2980 :: 		Box26.Color           = 0x75D2;
MOVW	R1, #30162
MOVW	R0, #lo_addr(_Box26+28)
MOVT	R0, #hi_addr(_Box26+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2981 :: 		Box26.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box26+30)
MOVT	R0, #hi_addr(_Box26+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2982 :: 		Box26.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box26+32)
MOVT	R0, #hi_addr(_Box26+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2983 :: 		Box26.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box26+36)
MOVT	R0, #hi_addr(_Box26+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2984 :: 		Box26.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box26+40)
MOVT	R0, #hi_addr(_Box26+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2985 :: 		Box26.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box26+44)
MOVT	R0, #hi_addr(_Box26+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2986 :: 		Box26.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box26+48)
MOVT	R0, #hi_addr(_Box26+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2988 :: 		Label7.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Label7+0)
MOVT	R0, #hi_addr(_Label7+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2989 :: 		Label7.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label7+4)
MOVT	R0, #hi_addr(_Label7+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2990 :: 		Label7.Left            = 146;
MOVS	R1, #146
MOVW	R0, #lo_addr(_Label7+6)
MOVT	R0, #hi_addr(_Label7+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2991 :: 		Label7.Top             = 72;
MOVS	R1, #72
MOVW	R0, #lo_addr(_Label7+8)
MOVT	R0, #hi_addr(_Label7+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2992 :: 		Label7.Width           = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Label7+10)
MOVT	R0, #hi_addr(_Label7+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2993 :: 		Label7.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label7+12)
MOVT	R0, #hi_addr(_Label7+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2994 :: 		Label7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+26)
MOVT	R0, #hi_addr(_Label7+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2995 :: 		Label7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+27)
MOVT	R0, #hi_addr(_Label7+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,2996 :: 		Label7.Caption         = Label7_Caption;
MOVW	R1, #lo_addr(_Label7_Caption+0)
MOVT	R1, #hi_addr(_Label7_Caption+0)
MOVW	R0, #lo_addr(_Label7+16)
MOVT	R0, #hi_addr(_Label7+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2997 :: 		Label7.FontName        = Tahoma11x13_Regular;
MOVW	R1, #25308
MOVT	R1, #1
MOVW	R0, #lo_addr(_Label7+20)
MOVT	R0, #hi_addr(_Label7+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,2998 :: 		Label7.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label7+24)
MOVT	R0, #hi_addr(_Label7+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,2999 :: 		Label7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+28)
MOVT	R0, #hi_addr(_Label7+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3000 :: 		Label7.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+32)
MOVT	R0, #hi_addr(_Label7+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3001 :: 		Label7.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+36)
MOVT	R0, #hi_addr(_Label7+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3002 :: 		Label7.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+40)
MOVT	R0, #hi_addr(_Label7+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3004 :: 		Box27.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Box27+0)
MOVT	R0, #hi_addr(_Box27+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3005 :: 		Box27.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Box27+4)
MOVT	R0, #hi_addr(_Box27+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3006 :: 		Box27.Left            = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_Box27+6)
MOVT	R0, #hi_addr(_Box27+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3007 :: 		Box27.Top             = 126;
MOVS	R1, #126
MOVW	R0, #lo_addr(_Box27+8)
MOVT	R0, #hi_addr(_Box27+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3008 :: 		Box27.Width           = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box27+10)
MOVT	R0, #hi_addr(_Box27+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3009 :: 		Box27.Height          = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Box27+12)
MOVT	R0, #hi_addr(_Box27+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3010 :: 		Box27.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box27+14)
MOVT	R0, #hi_addr(_Box27+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3011 :: 		Box27.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box27+16)
MOVT	R0, #hi_addr(_Box27+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3012 :: 		Box27.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box27+18)
MOVT	R0, #hi_addr(_Box27+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3013 :: 		Box27.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box27+19)
MOVT	R0, #hi_addr(_Box27+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3014 :: 		Box27.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box27+20)
MOVT	R0, #hi_addr(_Box27+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3015 :: 		Box27.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box27+21)
MOVT	R0, #hi_addr(_Box27+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3016 :: 		Box27.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box27+22)
MOVT	R0, #hi_addr(_Box27+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3017 :: 		Box27.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box27+24)
MOVT	R0, #hi_addr(_Box27+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3018 :: 		Box27.Gradient_End_Color = 0xAEB8;
MOVW	R1, #44728
MOVW	R0, #lo_addr(_Box27+26)
MOVT	R0, #hi_addr(_Box27+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3019 :: 		Box27.Color           = 0x75D2;
MOVW	R1, #30162
MOVW	R0, #lo_addr(_Box27+28)
MOVT	R0, #hi_addr(_Box27+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3020 :: 		Box27.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box27+30)
MOVT	R0, #hi_addr(_Box27+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3021 :: 		Box27.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box27+32)
MOVT	R0, #hi_addr(_Box27+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3022 :: 		Box27.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box27+36)
MOVT	R0, #hi_addr(_Box27+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3023 :: 		Box27.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box27+40)
MOVT	R0, #hi_addr(_Box27+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3024 :: 		Box27.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box27+44)
MOVT	R0, #hi_addr(_Box27+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3025 :: 		Box27.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box27+48)
MOVT	R0, #hi_addr(_Box27+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3027 :: 		Label46.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Label46+0)
MOVT	R0, #hi_addr(_Label46+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3028 :: 		Label46.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Label46+4)
MOVT	R0, #hi_addr(_Label46+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3029 :: 		Label46.Left            = 148;
MOVS	R1, #148
MOVW	R0, #lo_addr(_Label46+6)
MOVT	R0, #hi_addr(_Label46+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3030 :: 		Label46.Top             = 128;
MOVS	R1, #128
MOVW	R0, #lo_addr(_Label46+8)
MOVT	R0, #hi_addr(_Label46+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3031 :: 		Label46.Width           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Label46+10)
MOVT	R0, #hi_addr(_Label46+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3032 :: 		Label46.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label46+12)
MOVT	R0, #hi_addr(_Label46+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3033 :: 		Label46.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label46+26)
MOVT	R0, #hi_addr(_Label46+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3034 :: 		Label46.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label46+27)
MOVT	R0, #hi_addr(_Label46+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3035 :: 		Label46.Caption         = Label46_Caption;
MOVW	R1, #lo_addr(_Label46_Caption+0)
MOVT	R1, #hi_addr(_Label46_Caption+0)
MOVW	R0, #lo_addr(_Label46+16)
MOVT	R0, #hi_addr(_Label46+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3036 :: 		Label46.FontName        = Tahoma11x13_Regular;
MOVW	R1, #25308
MOVT	R1, #1
MOVW	R0, #lo_addr(_Label46+20)
MOVT	R0, #hi_addr(_Label46+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3037 :: 		Label46.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label46+24)
MOVT	R0, #hi_addr(_Label46+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3038 :: 		Label46.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label46+28)
MOVT	R0, #hi_addr(_Label46+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3039 :: 		Label46.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label46+32)
MOVT	R0, #hi_addr(_Label46+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3040 :: 		Label46.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label46+36)
MOVT	R0, #hi_addr(_Label46+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3041 :: 		Label46.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label46+40)
MOVT	R0, #hi_addr(_Label46+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3043 :: 		Box28.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Box28+0)
MOVT	R0, #hi_addr(_Box28+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3044 :: 		Box28.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Box28+4)
MOVT	R0, #hi_addr(_Box28+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3045 :: 		Box28.Left            = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_Box28+6)
MOVT	R0, #hi_addr(_Box28+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3046 :: 		Box28.Top             = 181;
MOVS	R1, #181
MOVW	R0, #lo_addr(_Box28+8)
MOVT	R0, #hi_addr(_Box28+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3047 :: 		Box28.Width           = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box28+10)
MOVT	R0, #hi_addr(_Box28+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3048 :: 		Box28.Height          = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Box28+12)
MOVT	R0, #hi_addr(_Box28+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3049 :: 		Box28.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box28+14)
MOVT	R0, #hi_addr(_Box28+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3050 :: 		Box28.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box28+16)
MOVT	R0, #hi_addr(_Box28+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3051 :: 		Box28.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box28+18)
MOVT	R0, #hi_addr(_Box28+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3052 :: 		Box28.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box28+19)
MOVT	R0, #hi_addr(_Box28+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3053 :: 		Box28.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box28+20)
MOVT	R0, #hi_addr(_Box28+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3054 :: 		Box28.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box28+21)
MOVT	R0, #hi_addr(_Box28+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3055 :: 		Box28.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box28+22)
MOVT	R0, #hi_addr(_Box28+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3056 :: 		Box28.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box28+24)
MOVT	R0, #hi_addr(_Box28+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3057 :: 		Box28.Gradient_End_Color = 0x75D2;
MOVW	R1, #30162
MOVW	R0, #lo_addr(_Box28+26)
MOVT	R0, #hi_addr(_Box28+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3058 :: 		Box28.Color           = 0x75D2;
MOVW	R1, #30162
MOVW	R0, #lo_addr(_Box28+28)
MOVT	R0, #hi_addr(_Box28+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3059 :: 		Box28.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box28+30)
MOVT	R0, #hi_addr(_Box28+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3060 :: 		Box28.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box28+32)
MOVT	R0, #hi_addr(_Box28+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3061 :: 		Box28.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box28+36)
MOVT	R0, #hi_addr(_Box28+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3062 :: 		Box28.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box28+40)
MOVT	R0, #hi_addr(_Box28+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3063 :: 		Box28.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box28+44)
MOVT	R0, #hi_addr(_Box28+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3064 :: 		Box28.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box28+48)
MOVT	R0, #hi_addr(_Box28+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3066 :: 		Label47.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Label47+0)
MOVT	R0, #hi_addr(_Label47+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3067 :: 		Label47.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label47+4)
MOVT	R0, #hi_addr(_Label47+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3068 :: 		Label47.Left            = 149;
MOVS	R1, #149
MOVW	R0, #lo_addr(_Label47+6)
MOVT	R0, #hi_addr(_Label47+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3069 :: 		Label47.Top             = 183;
MOVS	R1, #183
MOVW	R0, #lo_addr(_Label47+8)
MOVT	R0, #hi_addr(_Label47+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3070 :: 		Label47.Width           = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label47+10)
MOVT	R0, #hi_addr(_Label47+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3071 :: 		Label47.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label47+12)
MOVT	R0, #hi_addr(_Label47+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3072 :: 		Label47.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label47+26)
MOVT	R0, #hi_addr(_Label47+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3073 :: 		Label47.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label47+27)
MOVT	R0, #hi_addr(_Label47+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3074 :: 		Label47.Caption         = Label47_Caption;
MOVW	R1, #lo_addr(_Label47_Caption+0)
MOVT	R1, #hi_addr(_Label47_Caption+0)
MOVW	R0, #lo_addr(_Label47+16)
MOVT	R0, #hi_addr(_Label47+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3075 :: 		Label47.FontName        = Tahoma11x13_Regular;
MOVW	R1, #25308
MOVT	R1, #1
MOVW	R0, #lo_addr(_Label47+20)
MOVT	R0, #hi_addr(_Label47+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3076 :: 		Label47.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label47+24)
MOVT	R0, #hi_addr(_Label47+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3077 :: 		Label47.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label47+28)
MOVT	R0, #hi_addr(_Label47+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3078 :: 		Label47.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label47+32)
MOVT	R0, #hi_addr(_Label47+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3079 :: 		Label47.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label47+36)
MOVT	R0, #hi_addr(_Label47+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3080 :: 		Label47.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label47+40)
MOVT	R0, #hi_addr(_Label47+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3082 :: 		Box29.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Box29+0)
MOVT	R0, #hi_addr(_Box29+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3083 :: 		Box29.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Box29+4)
MOVT	R0, #hi_addr(_Box29+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3084 :: 		Box29.Left            = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_Box29+6)
MOVT	R0, #hi_addr(_Box29+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3085 :: 		Box29.Top             = 231;
MOVS	R1, #231
MOVW	R0, #lo_addr(_Box29+8)
MOVT	R0, #hi_addr(_Box29+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3086 :: 		Box29.Width           = 220;
MOVS	R1, #220
MOVW	R0, #lo_addr(_Box29+10)
MOVT	R0, #hi_addr(_Box29+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3087 :: 		Box29.Height          = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_Box29+12)
MOVT	R0, #hi_addr(_Box29+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3088 :: 		Box29.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box29+14)
MOVT	R0, #hi_addr(_Box29+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3089 :: 		Box29.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box29+16)
MOVT	R0, #hi_addr(_Box29+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3090 :: 		Box29.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box29+18)
MOVT	R0, #hi_addr(_Box29+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3091 :: 		Box29.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box29+19)
MOVT	R0, #hi_addr(_Box29+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3092 :: 		Box29.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box29+20)
MOVT	R0, #hi_addr(_Box29+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3093 :: 		Box29.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box29+21)
MOVT	R0, #hi_addr(_Box29+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3094 :: 		Box29.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box29+22)
MOVT	R0, #hi_addr(_Box29+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3095 :: 		Box29.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box29+24)
MOVT	R0, #hi_addr(_Box29+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3096 :: 		Box29.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box29+26)
MOVT	R0, #hi_addr(_Box29+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3097 :: 		Box29.Color           = 0xAEB8;
MOVW	R1, #44728
MOVW	R0, #lo_addr(_Box29+28)
MOVT	R0, #hi_addr(_Box29+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3098 :: 		Box29.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box29+30)
MOVT	R0, #hi_addr(_Box29+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3099 :: 		Box29.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box29+32)
MOVT	R0, #hi_addr(_Box29+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3100 :: 		Box29.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box29+36)
MOVT	R0, #hi_addr(_Box29+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3101 :: 		Box29.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box29+40)
MOVT	R0, #hi_addr(_Box29+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3102 :: 		Box29.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box29+44)
MOVT	R0, #hi_addr(_Box29+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3103 :: 		Box29.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box29+48)
MOVT	R0, #hi_addr(_Box29+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3105 :: 		Box30.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Box30+0)
MOVT	R0, #hi_addr(_Box30+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3106 :: 		Box30.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Box30+4)
MOVT	R0, #hi_addr(_Box30+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3107 :: 		Box30.Left            = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_Box30+6)
MOVT	R0, #hi_addr(_Box30+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3108 :: 		Box30.Top             = 236;
MOVS	R1, #236
MOVW	R0, #lo_addr(_Box30+8)
MOVT	R0, #hi_addr(_Box30+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3109 :: 		Box30.Width           = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box30+10)
MOVT	R0, #hi_addr(_Box30+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3110 :: 		Box30.Height          = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Box30+12)
MOVT	R0, #hi_addr(_Box30+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3111 :: 		Box30.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box30+14)
MOVT	R0, #hi_addr(_Box30+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3112 :: 		Box30.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box30+16)
MOVT	R0, #hi_addr(_Box30+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3113 :: 		Box30.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box30+18)
MOVT	R0, #hi_addr(_Box30+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3114 :: 		Box30.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box30+19)
MOVT	R0, #hi_addr(_Box30+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3115 :: 		Box30.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box30+20)
MOVT	R0, #hi_addr(_Box30+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3116 :: 		Box30.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box30+21)
MOVT	R0, #hi_addr(_Box30+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3117 :: 		Box30.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box30+22)
MOVT	R0, #hi_addr(_Box30+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3118 :: 		Box30.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box30+24)
MOVT	R0, #hi_addr(_Box30+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3119 :: 		Box30.Gradient_End_Color = 0x75D2;
MOVW	R1, #30162
MOVW	R0, #lo_addr(_Box30+26)
MOVT	R0, #hi_addr(_Box30+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3120 :: 		Box30.Color           = 0x75D2;
MOVW	R1, #30162
MOVW	R0, #lo_addr(_Box30+28)
MOVT	R0, #hi_addr(_Box30+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3121 :: 		Box30.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box30+30)
MOVT	R0, #hi_addr(_Box30+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3122 :: 		Box30.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box30+32)
MOVT	R0, #hi_addr(_Box30+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3123 :: 		Box30.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box30+36)
MOVT	R0, #hi_addr(_Box30+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3124 :: 		Box30.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box30+40)
MOVT	R0, #hi_addr(_Box30+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3125 :: 		Box30.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box30+44)
MOVT	R0, #hi_addr(_Box30+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3126 :: 		Box30.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box30+48)
MOVT	R0, #hi_addr(_Box30+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3128 :: 		Label48.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Label48+0)
MOVT	R0, #hi_addr(_Label48+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3129 :: 		Label48.Order           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label48+4)
MOVT	R0, #hi_addr(_Label48+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3130 :: 		Label48.Left            = 146;
MOVS	R1, #146
MOVW	R0, #lo_addr(_Label48+6)
MOVT	R0, #hi_addr(_Label48+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3131 :: 		Label48.Top             = 237;
MOVS	R1, #237
MOVW	R0, #lo_addr(_Label48+8)
MOVT	R0, #hi_addr(_Label48+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3132 :: 		Label48.Width           = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Label48+10)
MOVT	R0, #hi_addr(_Label48+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3133 :: 		Label48.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label48+12)
MOVT	R0, #hi_addr(_Label48+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3134 :: 		Label48.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label48+26)
MOVT	R0, #hi_addr(_Label48+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3135 :: 		Label48.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label48+27)
MOVT	R0, #hi_addr(_Label48+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3136 :: 		Label48.Caption         = Label48_Caption;
MOVW	R1, #lo_addr(_Label48_Caption+0)
MOVT	R1, #hi_addr(_Label48_Caption+0)
MOVW	R0, #lo_addr(_Label48+16)
MOVT	R0, #hi_addr(_Label48+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3137 :: 		Label48.FontName        = Tahoma11x13_Regular;
MOVW	R1, #25308
MOVT	R1, #1
MOVW	R0, #lo_addr(_Label48+20)
MOVT	R0, #hi_addr(_Label48+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3138 :: 		Label48.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label48+24)
MOVT	R0, #hi_addr(_Label48+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3139 :: 		Label48.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label48+28)
MOVT	R0, #hi_addr(_Label48+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3140 :: 		Label48.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label48+32)
MOVT	R0, #hi_addr(_Label48+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3141 :: 		Label48.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label48+36)
MOVT	R0, #hi_addr(_Label48+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3142 :: 		Label48.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label48+40)
MOVT	R0, #hi_addr(_Label48+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3144 :: 		Label49.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Label49+0)
MOVT	R0, #hi_addr(_Label49+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3145 :: 		Label49.Order           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Label49+4)
MOVT	R0, #hi_addr(_Label49+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3146 :: 		Label49.Left            = 317;
MOVW	R1, #317
MOVW	R0, #lo_addr(_Label49+6)
MOVT	R0, #hi_addr(_Label49+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3147 :: 		Label49.Top             = 70;
MOVS	R1, #70
MOVW	R0, #lo_addr(_Label49+8)
MOVT	R0, #hi_addr(_Label49+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3148 :: 		Label49.Width           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label49+10)
MOVT	R0, #hi_addr(_Label49+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3149 :: 		Label49.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label49+12)
MOVT	R0, #hi_addr(_Label49+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3150 :: 		Label49.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label49+26)
MOVT	R0, #hi_addr(_Label49+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3151 :: 		Label49.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label49+27)
MOVT	R0, #hi_addr(_Label49+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3152 :: 		Label49.Caption         = Label49_Caption;
MOVW	R1, #lo_addr(_Label49_Caption+0)
MOVT	R1, #hi_addr(_Label49_Caption+0)
MOVW	R0, #lo_addr(_Label49+16)
MOVT	R0, #hi_addr(_Label49+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3153 :: 		Label49.FontName        = Tahoma11x13_Regular;
MOVW	R1, #25308
MOVT	R1, #1
MOVW	R0, #lo_addr(_Label49+20)
MOVT	R0, #hi_addr(_Label49+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3154 :: 		Label49.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label49+24)
MOVT	R0, #hi_addr(_Label49+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3155 :: 		Label49.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label49+28)
MOVT	R0, #hi_addr(_Label49+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3156 :: 		Label49.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label49+32)
MOVT	R0, #hi_addr(_Label49+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3157 :: 		Label49.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label49+36)
MOVT	R0, #hi_addr(_Label49+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3158 :: 		Label49.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label49+40)
MOVT	R0, #hi_addr(_Label49+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3160 :: 		Label50.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Label50+0)
MOVT	R0, #hi_addr(_Label50+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3161 :: 		Label50.Order           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Label50+4)
MOVT	R0, #hi_addr(_Label50+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3162 :: 		Label50.Left            = 205;
MOVS	R1, #205
MOVW	R0, #lo_addr(_Label50+6)
MOVT	R0, #hi_addr(_Label50+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3163 :: 		Label50.Top             = 70;
MOVS	R1, #70
MOVW	R0, #lo_addr(_Label50+8)
MOVT	R0, #hi_addr(_Label50+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3164 :: 		Label50.Width           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Label50+10)
MOVT	R0, #hi_addr(_Label50+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3165 :: 		Label50.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label50+12)
MOVT	R0, #hi_addr(_Label50+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3166 :: 		Label50.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label50+26)
MOVT	R0, #hi_addr(_Label50+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3167 :: 		Label50.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label50+27)
MOVT	R0, #hi_addr(_Label50+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3168 :: 		Label50.Caption         = Label50_Caption;
MOVW	R1, #lo_addr(_Label50_Caption+0)
MOVT	R1, #hi_addr(_Label50_Caption+0)
MOVW	R0, #lo_addr(_Label50+16)
MOVT	R0, #hi_addr(_Label50+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3169 :: 		Label50.FontName        = Tahoma11x13_Regular;
MOVW	R1, #25308
MOVT	R1, #1
MOVW	R0, #lo_addr(_Label50+20)
MOVT	R0, #hi_addr(_Label50+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3170 :: 		Label50.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label50+24)
MOVT	R0, #hi_addr(_Label50+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3171 :: 		Label50.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label50+28)
MOVT	R0, #hi_addr(_Label50+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3172 :: 		Label50.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label50+32)
MOVT	R0, #hi_addr(_Label50+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3173 :: 		Label50.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label50+36)
MOVT	R0, #hi_addr(_Label50+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3174 :: 		Label50.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label50+40)
MOVT	R0, #hi_addr(_Label50+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3176 :: 		Label51.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Label51+0)
MOVT	R0, #hi_addr(_Label51+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3177 :: 		Label51.Order           = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label51+4)
MOVT	R0, #hi_addr(_Label51+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3178 :: 		Label51.Left            = 262;
MOVW	R1, #262
MOVW	R0, #lo_addr(_Label51+6)
MOVT	R0, #hi_addr(_Label51+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3179 :: 		Label51.Top             = 70;
MOVS	R1, #70
MOVW	R0, #lo_addr(_Label51+8)
MOVT	R0, #hi_addr(_Label51+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3180 :: 		Label51.Width           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Label51+10)
MOVT	R0, #hi_addr(_Label51+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3181 :: 		Label51.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label51+12)
MOVT	R0, #hi_addr(_Label51+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3182 :: 		Label51.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label51+26)
MOVT	R0, #hi_addr(_Label51+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3183 :: 		Label51.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label51+27)
MOVT	R0, #hi_addr(_Label51+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3184 :: 		Label51.Caption         = Label51_Caption;
MOVW	R1, #lo_addr(_Label51_Caption+0)
MOVT	R1, #hi_addr(_Label51_Caption+0)
MOVW	R0, #lo_addr(_Label51+16)
MOVT	R0, #hi_addr(_Label51+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3185 :: 		Label51.FontName        = Tahoma11x13_Regular;
MOVW	R1, #25308
MOVT	R1, #1
MOVW	R0, #lo_addr(_Label51+20)
MOVT	R0, #hi_addr(_Label51+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3186 :: 		Label51.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label51+24)
MOVT	R0, #hi_addr(_Label51+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3187 :: 		Label51.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label51+28)
MOVT	R0, #hi_addr(_Label51+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3188 :: 		Label51.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label51+32)
MOVT	R0, #hi_addr(_Label51+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3189 :: 		Label51.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label51+36)
MOVT	R0, #hi_addr(_Label51+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3190 :: 		Label51.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label51+40)
MOVT	R0, #hi_addr(_Label51+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3192 :: 		accelX.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_accelX+0)
MOVT	R0, #hi_addr(_accelX+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3193 :: 		accelX.Order           = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_accelX+4)
MOVT	R0, #hi_addr(_accelX+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3194 :: 		accelX.Left            = 192;
MOVS	R1, #192
MOVW	R0, #lo_addr(_accelX+6)
MOVT	R0, #hi_addr(_accelX+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3195 :: 		accelX.Top             = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_accelX+8)
MOVT	R0, #hi_addr(_accelX+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3196 :: 		accelX.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_accelX+10)
MOVT	R0, #hi_addr(_accelX+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3197 :: 		accelX.Height          = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_accelX+12)
MOVT	R0, #hi_addr(_accelX+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3198 :: 		accelX.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_accelX+26)
MOVT	R0, #hi_addr(_accelX+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3199 :: 		accelX.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_accelX+27)
MOVT	R0, #hi_addr(_accelX+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3200 :: 		accelX.Caption         = accelX_Caption;
MOVW	R1, #lo_addr(_accelX_Caption+0)
MOVT	R1, #hi_addr(_accelX_Caption+0)
MOVW	R0, #lo_addr(_accelX+16)
MOVT	R0, #hi_addr(_accelX+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3201 :: 		accelX.FontName        = Tahoma16x19_Regular;
MOVW	R1, #16573
MOVT	R1, #1
MOVW	R0, #lo_addr(_accelX+20)
MOVT	R0, #hi_addr(_accelX+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3202 :: 		accelX.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_accelX+24)
MOVT	R0, #hi_addr(_accelX+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3203 :: 		accelX.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_accelX+28)
MOVT	R0, #hi_addr(_accelX+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3204 :: 		accelX.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_accelX+32)
MOVT	R0, #hi_addr(_accelX+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3205 :: 		accelX.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_accelX+36)
MOVT	R0, #hi_addr(_accelX+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3206 :: 		accelX.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_accelX+40)
MOVT	R0, #hi_addr(_accelX+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3208 :: 		accelY.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_accelY+0)
MOVT	R0, #hi_addr(_accelY+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3209 :: 		accelY.Order           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_accelY+4)
MOVT	R0, #hi_addr(_accelY+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3210 :: 		accelY.Left            = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_accelY+6)
MOVT	R0, #hi_addr(_accelY+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3211 :: 		accelY.Top             = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_accelY+8)
MOVT	R0, #hi_addr(_accelY+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3212 :: 		accelY.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_accelY+10)
MOVT	R0, #hi_addr(_accelY+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3213 :: 		accelY.Height          = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_accelY+12)
MOVT	R0, #hi_addr(_accelY+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3214 :: 		accelY.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_accelY+26)
MOVT	R0, #hi_addr(_accelY+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3215 :: 		accelY.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_accelY+27)
MOVT	R0, #hi_addr(_accelY+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3216 :: 		accelY.Caption         = accelY_Caption;
MOVW	R1, #lo_addr(_accelY_Caption+0)
MOVT	R1, #hi_addr(_accelY_Caption+0)
MOVW	R0, #lo_addr(_accelY+16)
MOVT	R0, #hi_addr(_accelY+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3217 :: 		accelY.FontName        = Tahoma16x19_Regular;
MOVW	R1, #16573
MOVT	R1, #1
MOVW	R0, #lo_addr(_accelY+20)
MOVT	R0, #hi_addr(_accelY+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3218 :: 		accelY.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_accelY+24)
MOVT	R0, #hi_addr(_accelY+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3219 :: 		accelY.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_accelY+28)
MOVT	R0, #hi_addr(_accelY+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3220 :: 		accelY.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_accelY+32)
MOVT	R0, #hi_addr(_accelY+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3221 :: 		accelY.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_accelY+36)
MOVT	R0, #hi_addr(_accelY+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3222 :: 		accelY.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_accelY+40)
MOVT	R0, #hi_addr(_accelY+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3224 :: 		accelZ.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_accelZ+0)
MOVT	R0, #hi_addr(_accelZ+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3225 :: 		accelZ.Order           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_accelZ+4)
MOVT	R0, #hi_addr(_accelZ+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3226 :: 		accelZ.Left            = 303;
MOVW	R1, #303
MOVW	R0, #lo_addr(_accelZ+6)
MOVT	R0, #hi_addr(_accelZ+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3227 :: 		accelZ.Top             = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_accelZ+8)
MOVT	R0, #hi_addr(_accelZ+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3228 :: 		accelZ.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_accelZ+10)
MOVT	R0, #hi_addr(_accelZ+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3229 :: 		accelZ.Height          = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_accelZ+12)
MOVT	R0, #hi_addr(_accelZ+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3230 :: 		accelZ.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_accelZ+26)
MOVT	R0, #hi_addr(_accelZ+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3231 :: 		accelZ.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_accelZ+27)
MOVT	R0, #hi_addr(_accelZ+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3232 :: 		accelZ.Caption         = accelZ_Caption;
MOVW	R1, #lo_addr(_accelZ_Caption+0)
MOVT	R1, #hi_addr(_accelZ_Caption+0)
MOVW	R0, #lo_addr(_accelZ+16)
MOVT	R0, #hi_addr(_accelZ+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3233 :: 		accelZ.FontName        = Tahoma16x19_Regular;
MOVW	R1, #16573
MOVT	R1, #1
MOVW	R0, #lo_addr(_accelZ+20)
MOVT	R0, #hi_addr(_accelZ+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3234 :: 		accelZ.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_accelZ+24)
MOVT	R0, #hi_addr(_accelZ+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3235 :: 		accelZ.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_accelZ+28)
MOVT	R0, #hi_addr(_accelZ+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3236 :: 		accelZ.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_accelZ+32)
MOVT	R0, #hi_addr(_accelZ+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3237 :: 		accelZ.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_accelZ+36)
MOVT	R0, #hi_addr(_accelZ+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3238 :: 		accelZ.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_accelZ+40)
MOVT	R0, #hi_addr(_accelZ+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3240 :: 		Label52.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Label52+0)
MOVT	R0, #hi_addr(_Label52+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3241 :: 		Label52.Order           = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label52+4)
MOVT	R0, #hi_addr(_Label52+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3242 :: 		Label52.Left            = 314;
MOVW	R1, #314
MOVW	R0, #lo_addr(_Label52+6)
MOVT	R0, #hi_addr(_Label52+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3243 :: 		Label52.Top             = 124;
MOVS	R1, #124
MOVW	R0, #lo_addr(_Label52+8)
MOVT	R0, #hi_addr(_Label52+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3244 :: 		Label52.Width           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label52+10)
MOVT	R0, #hi_addr(_Label52+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3245 :: 		Label52.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label52+12)
MOVT	R0, #hi_addr(_Label52+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3246 :: 		Label52.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label52+26)
MOVT	R0, #hi_addr(_Label52+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3247 :: 		Label52.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label52+27)
MOVT	R0, #hi_addr(_Label52+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3248 :: 		Label52.Caption         = Label52_Caption;
MOVW	R1, #lo_addr(_Label52_Caption+0)
MOVT	R1, #hi_addr(_Label52_Caption+0)
MOVW	R0, #lo_addr(_Label52+16)
MOVT	R0, #hi_addr(_Label52+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3249 :: 		Label52.FontName        = Tahoma11x13_Regular;
MOVW	R1, #25308
MOVT	R1, #1
MOVW	R0, #lo_addr(_Label52+20)
MOVT	R0, #hi_addr(_Label52+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3250 :: 		Label52.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label52+24)
MOVT	R0, #hi_addr(_Label52+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3251 :: 		Label52.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label52+28)
MOVT	R0, #hi_addr(_Label52+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3252 :: 		Label52.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label52+32)
MOVT	R0, #hi_addr(_Label52+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3253 :: 		Label52.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label52+36)
MOVT	R0, #hi_addr(_Label52+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3254 :: 		Label52.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label52+40)
MOVT	R0, #hi_addr(_Label52+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3256 :: 		Label74.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Label74+0)
MOVT	R0, #hi_addr(_Label74+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3257 :: 		Label74.Order           = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label74+4)
MOVT	R0, #hi_addr(_Label74+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3258 :: 		Label74.Left            = 204;
MOVS	R1, #204
MOVW	R0, #lo_addr(_Label74+6)
MOVT	R0, #hi_addr(_Label74+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3259 :: 		Label74.Top             = 125;
MOVS	R1, #125
MOVW	R0, #lo_addr(_Label74+8)
MOVT	R0, #hi_addr(_Label74+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3260 :: 		Label74.Width           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Label74+10)
MOVT	R0, #hi_addr(_Label74+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3261 :: 		Label74.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label74+12)
MOVT	R0, #hi_addr(_Label74+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3262 :: 		Label74.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label74+26)
MOVT	R0, #hi_addr(_Label74+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3263 :: 		Label74.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label74+27)
MOVT	R0, #hi_addr(_Label74+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3264 :: 		Label74.Caption         = Label74_Caption;
MOVW	R1, #lo_addr(_Label74_Caption+0)
MOVT	R1, #hi_addr(_Label74_Caption+0)
MOVW	R0, #lo_addr(_Label74+16)
MOVT	R0, #hi_addr(_Label74+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3265 :: 		Label74.FontName        = Tahoma11x13_Regular;
MOVW	R1, #25308
MOVT	R1, #1
MOVW	R0, #lo_addr(_Label74+20)
MOVT	R0, #hi_addr(_Label74+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3266 :: 		Label74.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label74+24)
MOVT	R0, #hi_addr(_Label74+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3267 :: 		Label74.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label74+28)
MOVT	R0, #hi_addr(_Label74+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3268 :: 		Label74.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label74+32)
MOVT	R0, #hi_addr(_Label74+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3269 :: 		Label74.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label74+36)
MOVT	R0, #hi_addr(_Label74+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3270 :: 		Label74.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label74+40)
MOVT	R0, #hi_addr(_Label74+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3272 :: 		Label75.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Label75+0)
MOVT	R0, #hi_addr(_Label75+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3273 :: 		Label75.Order           = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Label75+4)
MOVT	R0, #hi_addr(_Label75+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3274 :: 		Label75.Left            = 260;
MOVW	R1, #260
MOVW	R0, #lo_addr(_Label75+6)
MOVT	R0, #hi_addr(_Label75+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3275 :: 		Label75.Top             = 125;
MOVS	R1, #125
MOVW	R0, #lo_addr(_Label75+8)
MOVT	R0, #hi_addr(_Label75+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3276 :: 		Label75.Width           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Label75+10)
MOVT	R0, #hi_addr(_Label75+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3277 :: 		Label75.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label75+12)
MOVT	R0, #hi_addr(_Label75+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3278 :: 		Label75.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label75+26)
MOVT	R0, #hi_addr(_Label75+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3279 :: 		Label75.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label75+27)
MOVT	R0, #hi_addr(_Label75+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3280 :: 		Label75.Caption         = Label75_Caption;
MOVW	R1, #lo_addr(_Label75_Caption+0)
MOVT	R1, #hi_addr(_Label75_Caption+0)
MOVW	R0, #lo_addr(_Label75+16)
MOVT	R0, #hi_addr(_Label75+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3281 :: 		Label75.FontName        = Tahoma11x13_Regular;
MOVW	R1, #25308
MOVT	R1, #1
MOVW	R0, #lo_addr(_Label75+20)
MOVT	R0, #hi_addr(_Label75+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3282 :: 		Label75.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label75+24)
MOVT	R0, #hi_addr(_Label75+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3283 :: 		Label75.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label75+28)
MOVT	R0, #hi_addr(_Label75+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3284 :: 		Label75.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label75+32)
MOVT	R0, #hi_addr(_Label75+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3285 :: 		Label75.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label75+36)
MOVT	R0, #hi_addr(_Label75+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3286 :: 		Label75.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label75+40)
MOVT	R0, #hi_addr(_Label75+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3288 :: 		gyroX.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_gyroX+0)
MOVT	R0, #hi_addr(_gyroX+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3289 :: 		gyroX.Order           = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_gyroX+4)
MOVT	R0, #hi_addr(_gyroX+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3290 :: 		gyroX.Left            = 190;
MOVS	R1, #190
MOVW	R0, #lo_addr(_gyroX+6)
MOVT	R0, #hi_addr(_gyroX+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3291 :: 		gyroX.Top             = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_gyroX+8)
MOVT	R0, #hi_addr(_gyroX+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3292 :: 		gyroX.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_gyroX+10)
MOVT	R0, #hi_addr(_gyroX+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3293 :: 		gyroX.Height          = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_gyroX+12)
MOVT	R0, #hi_addr(_gyroX+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3294 :: 		gyroX.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_gyroX+26)
MOVT	R0, #hi_addr(_gyroX+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3295 :: 		gyroX.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_gyroX+27)
MOVT	R0, #hi_addr(_gyroX+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3296 :: 		gyroX.Caption         = gyroX_Caption;
MOVW	R1, #lo_addr(_gyroX_Caption+0)
MOVT	R1, #hi_addr(_gyroX_Caption+0)
MOVW	R0, #lo_addr(_gyroX+16)
MOVT	R0, #hi_addr(_gyroX+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3297 :: 		gyroX.FontName        = Tahoma16x19_Regular;
MOVW	R1, #16573
MOVT	R1, #1
MOVW	R0, #lo_addr(_gyroX+20)
MOVT	R0, #hi_addr(_gyroX+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3298 :: 		gyroX.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_gyroX+24)
MOVT	R0, #hi_addr(_gyroX+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3299 :: 		gyroX.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_gyroX+28)
MOVT	R0, #hi_addr(_gyroX+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3300 :: 		gyroX.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_gyroX+32)
MOVT	R0, #hi_addr(_gyroX+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3301 :: 		gyroX.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_gyroX+36)
MOVT	R0, #hi_addr(_gyroX+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3302 :: 		gyroX.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_gyroX+40)
MOVT	R0, #hi_addr(_gyroX+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3304 :: 		gyroY.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_gyroY+0)
MOVT	R0, #hi_addr(_gyroY+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3305 :: 		gyroY.Order           = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_gyroY+4)
MOVT	R0, #hi_addr(_gyroY+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3306 :: 		gyroY.Left            = 247;
MOVS	R1, #247
MOVW	R0, #lo_addr(_gyroY+6)
MOVT	R0, #hi_addr(_gyroY+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3307 :: 		gyroY.Top             = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_gyroY+8)
MOVT	R0, #hi_addr(_gyroY+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3308 :: 		gyroY.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_gyroY+10)
MOVT	R0, #hi_addr(_gyroY+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3309 :: 		gyroY.Height          = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_gyroY+12)
MOVT	R0, #hi_addr(_gyroY+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3310 :: 		gyroY.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_gyroY+26)
MOVT	R0, #hi_addr(_gyroY+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3311 :: 		gyroY.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_gyroY+27)
MOVT	R0, #hi_addr(_gyroY+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3312 :: 		gyroY.Caption         = gyroY_Caption;
MOVW	R1, #lo_addr(_gyroY_Caption+0)
MOVT	R1, #hi_addr(_gyroY_Caption+0)
MOVW	R0, #lo_addr(_gyroY+16)
MOVT	R0, #hi_addr(_gyroY+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3313 :: 		gyroY.FontName        = Tahoma16x19_Regular;
MOVW	R1, #16573
MOVT	R1, #1
MOVW	R0, #lo_addr(_gyroY+20)
MOVT	R0, #hi_addr(_gyroY+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3314 :: 		gyroY.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_gyroY+24)
MOVT	R0, #hi_addr(_gyroY+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3315 :: 		gyroY.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_gyroY+28)
MOVT	R0, #hi_addr(_gyroY+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3316 :: 		gyroY.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_gyroY+32)
MOVT	R0, #hi_addr(_gyroY+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3317 :: 		gyroY.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_gyroY+36)
MOVT	R0, #hi_addr(_gyroY+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3318 :: 		gyroY.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_gyroY+40)
MOVT	R0, #hi_addr(_gyroY+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3320 :: 		gyroZ.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_gyroZ+0)
MOVT	R0, #hi_addr(_gyroZ+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3321 :: 		gyroZ.Order           = 29;
MOVS	R1, #29
MOVW	R0, #lo_addr(_gyroZ+4)
MOVT	R0, #hi_addr(_gyroZ+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3322 :: 		gyroZ.Left            = 302;
MOVW	R1, #302
MOVW	R0, #lo_addr(_gyroZ+6)
MOVT	R0, #hi_addr(_gyroZ+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3323 :: 		gyroZ.Top             = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_gyroZ+8)
MOVT	R0, #hi_addr(_gyroZ+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3324 :: 		gyroZ.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_gyroZ+10)
MOVT	R0, #hi_addr(_gyroZ+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3325 :: 		gyroZ.Height          = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_gyroZ+12)
MOVT	R0, #hi_addr(_gyroZ+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3326 :: 		gyroZ.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_gyroZ+26)
MOVT	R0, #hi_addr(_gyroZ+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3327 :: 		gyroZ.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_gyroZ+27)
MOVT	R0, #hi_addr(_gyroZ+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3328 :: 		gyroZ.Caption         = gyroZ_Caption;
MOVW	R1, #lo_addr(_gyroZ_Caption+0)
MOVT	R1, #hi_addr(_gyroZ_Caption+0)
MOVW	R0, #lo_addr(_gyroZ+16)
MOVT	R0, #hi_addr(_gyroZ+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3329 :: 		gyroZ.FontName        = Tahoma16x19_Regular;
MOVW	R1, #16573
MOVT	R1, #1
MOVW	R0, #lo_addr(_gyroZ+20)
MOVT	R0, #hi_addr(_gyroZ+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3330 :: 		gyroZ.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_gyroZ+24)
MOVT	R0, #hi_addr(_gyroZ+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3331 :: 		gyroZ.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_gyroZ+28)
MOVT	R0, #hi_addr(_gyroZ+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3332 :: 		gyroZ.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_gyroZ+32)
MOVT	R0, #hi_addr(_gyroZ+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3333 :: 		gyroZ.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_gyroZ+36)
MOVT	R0, #hi_addr(_gyroZ+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3334 :: 		gyroZ.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_gyroZ+40)
MOVT	R0, #hi_addr(_gyroZ+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3336 :: 		lblTemp.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_lblTemp+0)
MOVT	R0, #hi_addr(_lblTemp+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3337 :: 		lblTemp.Order           = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_lblTemp+4)
MOVT	R0, #hi_addr(_lblTemp+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3338 :: 		lblTemp.Left            = 222;
MOVS	R1, #222
MOVW	R0, #lo_addr(_lblTemp+6)
MOVT	R0, #hi_addr(_lblTemp+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3339 :: 		lblTemp.Top             = 242;
MOVS	R1, #242
MOVW	R0, #lo_addr(_lblTemp+8)
MOVT	R0, #hi_addr(_lblTemp+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3340 :: 		lblTemp.Width           = 65;
MOVS	R1, #65
MOVW	R0, #lo_addr(_lblTemp+10)
MOVT	R0, #hi_addr(_lblTemp+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3341 :: 		lblTemp.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_lblTemp+12)
MOVT	R0, #hi_addr(_lblTemp+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3342 :: 		lblTemp.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_lblTemp+26)
MOVT	R0, #hi_addr(_lblTemp+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3343 :: 		lblTemp.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_lblTemp+27)
MOVT	R0, #hi_addr(_lblTemp+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3344 :: 		lblTemp.Caption         = lblTemp_Caption;
MOVW	R1, #lo_addr(_lblTemp_Caption+0)
MOVT	R1, #hi_addr(_lblTemp_Caption+0)
MOVW	R0, #lo_addr(_lblTemp+16)
MOVT	R0, #hi_addr(_lblTemp+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3345 :: 		lblTemp.FontName        = Tahoma19x23_Regular;
MOVW	R1, #19321
MOVT	R1, #1
MOVW	R0, #lo_addr(_lblTemp+20)
MOVT	R0, #hi_addr(_lblTemp+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3346 :: 		lblTemp.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_lblTemp+24)
MOVT	R0, #hi_addr(_lblTemp+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3347 :: 		lblTemp.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_lblTemp+28)
MOVT	R0, #hi_addr(_lblTemp+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3348 :: 		lblTemp.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_lblTemp+32)
MOVT	R0, #hi_addr(_lblTemp+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3349 :: 		lblTemp.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_lblTemp+36)
MOVT	R0, #hi_addr(_lblTemp+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3350 :: 		lblTemp.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_lblTemp+40)
MOVT	R0, #hi_addr(_lblTemp+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3352 :: 		Label76.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Label76+0)
MOVT	R0, #hi_addr(_Label76+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3353 :: 		Label76.Order           = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label76+4)
MOVT	R0, #hi_addr(_Label76+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3354 :: 		Label76.Left            = 314;
MOVW	R1, #314
MOVW	R0, #lo_addr(_Label76+6)
MOVT	R0, #hi_addr(_Label76+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3355 :: 		Label76.Top             = 180;
MOVS	R1, #180
MOVW	R0, #lo_addr(_Label76+8)
MOVT	R0, #hi_addr(_Label76+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3356 :: 		Label76.Width           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label76+10)
MOVT	R0, #hi_addr(_Label76+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3357 :: 		Label76.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label76+12)
MOVT	R0, #hi_addr(_Label76+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3358 :: 		Label76.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label76+26)
MOVT	R0, #hi_addr(_Label76+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3359 :: 		Label76.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label76+27)
MOVT	R0, #hi_addr(_Label76+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3360 :: 		Label76.Caption         = Label76_Caption;
MOVW	R1, #lo_addr(_Label76_Caption+0)
MOVT	R1, #hi_addr(_Label76_Caption+0)
MOVW	R0, #lo_addr(_Label76+16)
MOVT	R0, #hi_addr(_Label76+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3361 :: 		Label76.FontName        = Tahoma11x13_Regular;
MOVW	R1, #25308
MOVT	R1, #1
MOVW	R0, #lo_addr(_Label76+20)
MOVT	R0, #hi_addr(_Label76+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3362 :: 		Label76.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label76+24)
MOVT	R0, #hi_addr(_Label76+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3363 :: 		Label76.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label76+28)
MOVT	R0, #hi_addr(_Label76+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3364 :: 		Label76.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label76+32)
MOVT	R0, #hi_addr(_Label76+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3365 :: 		Label76.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label76+36)
MOVT	R0, #hi_addr(_Label76+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3366 :: 		Label76.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label76+40)
MOVT	R0, #hi_addr(_Label76+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3368 :: 		Label77.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Label77+0)
MOVT	R0, #hi_addr(_Label77+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3369 :: 		Label77.Order           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label77+4)
MOVT	R0, #hi_addr(_Label77+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3370 :: 		Label77.Left            = 204;
MOVS	R1, #204
MOVW	R0, #lo_addr(_Label77+6)
MOVT	R0, #hi_addr(_Label77+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3371 :: 		Label77.Top             = 181;
MOVS	R1, #181
MOVW	R0, #lo_addr(_Label77+8)
MOVT	R0, #hi_addr(_Label77+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3372 :: 		Label77.Width           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Label77+10)
MOVT	R0, #hi_addr(_Label77+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3373 :: 		Label77.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label77+12)
MOVT	R0, #hi_addr(_Label77+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3374 :: 		Label77.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label77+26)
MOVT	R0, #hi_addr(_Label77+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3375 :: 		Label77.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label77+27)
MOVT	R0, #hi_addr(_Label77+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3376 :: 		Label77.Caption         = Label77_Caption;
MOVW	R1, #lo_addr(_Label77_Caption+0)
MOVT	R1, #hi_addr(_Label77_Caption+0)
MOVW	R0, #lo_addr(_Label77+16)
MOVT	R0, #hi_addr(_Label77+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3377 :: 		Label77.FontName        = Tahoma11x13_Regular;
MOVW	R1, #25308
MOVT	R1, #1
MOVW	R0, #lo_addr(_Label77+20)
MOVT	R0, #hi_addr(_Label77+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3378 :: 		Label77.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label77+24)
MOVT	R0, #hi_addr(_Label77+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3379 :: 		Label77.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label77+28)
MOVT	R0, #hi_addr(_Label77+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3380 :: 		Label77.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label77+32)
MOVT	R0, #hi_addr(_Label77+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3381 :: 		Label77.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label77+36)
MOVT	R0, #hi_addr(_Label77+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3382 :: 		Label77.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label77+40)
MOVT	R0, #hi_addr(_Label77+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3384 :: 		Label78.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Label78+0)
MOVT	R0, #hi_addr(_Label78+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3385 :: 		Label78.Order           = 33;
MOVS	R1, #33
MOVW	R0, #lo_addr(_Label78+4)
MOVT	R0, #hi_addr(_Label78+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3386 :: 		Label78.Left            = 260;
MOVW	R1, #260
MOVW	R0, #lo_addr(_Label78+6)
MOVT	R0, #hi_addr(_Label78+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3387 :: 		Label78.Top             = 181;
MOVS	R1, #181
MOVW	R0, #lo_addr(_Label78+8)
MOVT	R0, #hi_addr(_Label78+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3388 :: 		Label78.Width           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Label78+10)
MOVT	R0, #hi_addr(_Label78+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3389 :: 		Label78.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label78+12)
MOVT	R0, #hi_addr(_Label78+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3390 :: 		Label78.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label78+26)
MOVT	R0, #hi_addr(_Label78+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3391 :: 		Label78.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label78+27)
MOVT	R0, #hi_addr(_Label78+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3392 :: 		Label78.Caption         = Label78_Caption;
MOVW	R1, #lo_addr(_Label78_Caption+0)
MOVT	R1, #hi_addr(_Label78_Caption+0)
MOVW	R0, #lo_addr(_Label78+16)
MOVT	R0, #hi_addr(_Label78+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3393 :: 		Label78.FontName        = Tahoma11x13_Regular;
MOVW	R1, #25308
MOVT	R1, #1
MOVW	R0, #lo_addr(_Label78+20)
MOVT	R0, #hi_addr(_Label78+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3394 :: 		Label78.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label78+24)
MOVT	R0, #hi_addr(_Label78+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3395 :: 		Label78.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label78+28)
MOVT	R0, #hi_addr(_Label78+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3396 :: 		Label78.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label78+32)
MOVT	R0, #hi_addr(_Label78+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3397 :: 		Label78.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label78+36)
MOVT	R0, #hi_addr(_Label78+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3398 :: 		Label78.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label78+40)
MOVT	R0, #hi_addr(_Label78+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3400 :: 		magX.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_magX+0)
MOVT	R0, #hi_addr(_magX+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3401 :: 		magX.Order           = 34;
MOVS	R1, #34
MOVW	R0, #lo_addr(_magX+4)
MOVT	R0, #hi_addr(_magX+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3402 :: 		magX.Left            = 190;
MOVS	R1, #190
MOVW	R0, #lo_addr(_magX+6)
MOVT	R0, #hi_addr(_magX+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3403 :: 		magX.Top             = 195;
MOVS	R1, #195
MOVW	R0, #lo_addr(_magX+8)
MOVT	R0, #hi_addr(_magX+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3404 :: 		magX.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_magX+10)
MOVT	R0, #hi_addr(_magX+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3405 :: 		magX.Height          = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_magX+12)
MOVT	R0, #hi_addr(_magX+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3406 :: 		magX.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_magX+26)
MOVT	R0, #hi_addr(_magX+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3407 :: 		magX.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_magX+27)
MOVT	R0, #hi_addr(_magX+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3408 :: 		magX.Caption         = magX_Caption;
MOVW	R1, #lo_addr(_magX_Caption+0)
MOVT	R1, #hi_addr(_magX_Caption+0)
MOVW	R0, #lo_addr(_magX+16)
MOVT	R0, #hi_addr(_magX+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3409 :: 		magX.FontName        = Tahoma16x19_Regular;
MOVW	R1, #16573
MOVT	R1, #1
MOVW	R0, #lo_addr(_magX+20)
MOVT	R0, #hi_addr(_magX+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3410 :: 		magX.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_magX+24)
MOVT	R0, #hi_addr(_magX+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3411 :: 		magX.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_magX+28)
MOVT	R0, #hi_addr(_magX+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3412 :: 		magX.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_magX+32)
MOVT	R0, #hi_addr(_magX+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3413 :: 		magX.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_magX+36)
MOVT	R0, #hi_addr(_magX+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3414 :: 		magX.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_magX+40)
MOVT	R0, #hi_addr(_magX+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3416 :: 		magY.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_magY+0)
MOVT	R0, #hi_addr(_magY+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3417 :: 		magY.Order           = 35;
MOVS	R1, #35
MOVW	R0, #lo_addr(_magY+4)
MOVT	R0, #hi_addr(_magY+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3418 :: 		magY.Left            = 247;
MOVS	R1, #247
MOVW	R0, #lo_addr(_magY+6)
MOVT	R0, #hi_addr(_magY+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3419 :: 		magY.Top             = 195;
MOVS	R1, #195
MOVW	R0, #lo_addr(_magY+8)
MOVT	R0, #hi_addr(_magY+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3420 :: 		magY.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_magY+10)
MOVT	R0, #hi_addr(_magY+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3421 :: 		magY.Height          = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_magY+12)
MOVT	R0, #hi_addr(_magY+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3422 :: 		magY.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_magY+26)
MOVT	R0, #hi_addr(_magY+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3423 :: 		magY.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_magY+27)
MOVT	R0, #hi_addr(_magY+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3424 :: 		magY.Caption         = magY_Caption;
MOVW	R1, #lo_addr(_magY_Caption+0)
MOVT	R1, #hi_addr(_magY_Caption+0)
MOVW	R0, #lo_addr(_magY+16)
MOVT	R0, #hi_addr(_magY+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3425 :: 		magY.FontName        = Tahoma16x19_Regular;
MOVW	R1, #16573
MOVT	R1, #1
MOVW	R0, #lo_addr(_magY+20)
MOVT	R0, #hi_addr(_magY+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3426 :: 		magY.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_magY+24)
MOVT	R0, #hi_addr(_magY+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3427 :: 		magY.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_magY+28)
MOVT	R0, #hi_addr(_magY+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3428 :: 		magY.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_magY+32)
MOVT	R0, #hi_addr(_magY+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3429 :: 		magY.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_magY+36)
MOVT	R0, #hi_addr(_magY+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3430 :: 		magY.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_magY+40)
MOVT	R0, #hi_addr(_magY+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3432 :: 		magZ.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_magZ+0)
MOVT	R0, #hi_addr(_magZ+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3433 :: 		magZ.Order           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_magZ+4)
MOVT	R0, #hi_addr(_magZ+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3434 :: 		magZ.Left            = 302;
MOVW	R1, #302
MOVW	R0, #lo_addr(_magZ+6)
MOVT	R0, #hi_addr(_magZ+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3435 :: 		magZ.Top             = 195;
MOVS	R1, #195
MOVW	R0, #lo_addr(_magZ+8)
MOVT	R0, #hi_addr(_magZ+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3436 :: 		magZ.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_magZ+10)
MOVT	R0, #hi_addr(_magZ+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3437 :: 		magZ.Height          = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_magZ+12)
MOVT	R0, #hi_addr(_magZ+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3438 :: 		magZ.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_magZ+26)
MOVT	R0, #hi_addr(_magZ+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3439 :: 		magZ.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_magZ+27)
MOVT	R0, #hi_addr(_magZ+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3440 :: 		magZ.Caption         = magZ_Caption;
MOVW	R1, #lo_addr(_magZ_Caption+0)
MOVT	R1, #hi_addr(_magZ_Caption+0)
MOVW	R0, #lo_addr(_magZ+16)
MOVT	R0, #hi_addr(_magZ+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3441 :: 		magZ.FontName        = Tahoma16x19_Regular;
MOVW	R1, #16573
MOVT	R1, #1
MOVW	R0, #lo_addr(_magZ+20)
MOVT	R0, #hi_addr(_magZ+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3442 :: 		magZ.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_magZ+24)
MOVT	R0, #hi_addr(_magZ+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3443 :: 		magZ.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_magZ+28)
MOVT	R0, #hi_addr(_magZ+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3444 :: 		magZ.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_magZ+32)
MOVT	R0, #hi_addr(_magZ+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3445 :: 		magZ.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_magZ+36)
MOVT	R0, #hi_addr(_magZ+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3446 :: 		magZ.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_magZ+40)
MOVT	R0, #hi_addr(_magZ+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3448 :: 		Label79.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Label79+0)
MOVT	R0, #hi_addr(_Label79+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3449 :: 		Label79.Order           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Label79+4)
MOVT	R0, #hi_addr(_Label79+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3450 :: 		Label79.Left            = 148;
MOVS	R1, #148
MOVW	R0, #lo_addr(_Label79+6)
MOVT	R0, #hi_addr(_Label79+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3451 :: 		Label79.Top             = 92;
MOVS	R1, #92
MOVW	R0, #lo_addr(_Label79+8)
MOVT	R0, #hi_addr(_Label79+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3452 :: 		Label79.Width           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label79+10)
MOVT	R0, #hi_addr(_Label79+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3453 :: 		Label79.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label79+12)
MOVT	R0, #hi_addr(_Label79+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3454 :: 		Label79.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label79+26)
MOVT	R0, #hi_addr(_Label79+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3455 :: 		Label79.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label79+27)
MOVT	R0, #hi_addr(_Label79+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3456 :: 		Label79.Caption         = Label79_Caption;
MOVW	R1, #lo_addr(_Label79_Caption+0)
MOVT	R1, #hi_addr(_Label79_Caption+0)
MOVW	R0, #lo_addr(_Label79+16)
MOVT	R0, #hi_addr(_Label79+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3457 :: 		Label79.FontName        = Tahoma11x13_Regular;
MOVW	R1, #25308
MOVT	R1, #1
MOVW	R0, #lo_addr(_Label79+20)
MOVT	R0, #hi_addr(_Label79+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3458 :: 		Label79.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label79+24)
MOVT	R0, #hi_addr(_Label79+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3459 :: 		Label79.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label79+28)
MOVT	R0, #hi_addr(_Label79+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3460 :: 		Label79.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label79+32)
MOVT	R0, #hi_addr(_Label79+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3461 :: 		Label79.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label79+36)
MOVT	R0, #hi_addr(_Label79+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3462 :: 		Label79.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label79+40)
MOVT	R0, #hi_addr(_Label79+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3464 :: 		Label80.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Label80+0)
MOVT	R0, #hi_addr(_Label80+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3465 :: 		Label80.Order           = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_Label80+4)
MOVT	R0, #hi_addr(_Label80+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3466 :: 		Label80.Left            = 144;
MOVS	R1, #144
MOVW	R0, #lo_addr(_Label80+6)
MOVT	R0, #hi_addr(_Label80+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3467 :: 		Label80.Top             = 148;
MOVS	R1, #148
MOVW	R0, #lo_addr(_Label80+8)
MOVT	R0, #hi_addr(_Label80+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3468 :: 		Label80.Width           = 35;
MOVS	R1, #35
MOVW	R0, #lo_addr(_Label80+10)
MOVT	R0, #hi_addr(_Label80+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3469 :: 		Label80.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label80+12)
MOVT	R0, #hi_addr(_Label80+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3470 :: 		Label80.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label80+26)
MOVT	R0, #hi_addr(_Label80+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3471 :: 		Label80.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label80+27)
MOVT	R0, #hi_addr(_Label80+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3472 :: 		Label80.Caption         = Label80_Caption;
MOVW	R1, #lo_addr(_Label80_Caption+0)
MOVT	R1, #hi_addr(_Label80_Caption+0)
MOVW	R0, #lo_addr(_Label80+16)
MOVT	R0, #hi_addr(_Label80+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3473 :: 		Label80.FontName        = Tahoma11x13_Regular;
MOVW	R1, #25308
MOVT	R1, #1
MOVW	R0, #lo_addr(_Label80+20)
MOVT	R0, #hi_addr(_Label80+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3474 :: 		Label80.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label80+24)
MOVT	R0, #hi_addr(_Label80+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3475 :: 		Label80.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label80+28)
MOVT	R0, #hi_addr(_Label80+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3476 :: 		Label80.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label80+32)
MOVT	R0, #hi_addr(_Label80+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3477 :: 		Label80.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label80+36)
MOVT	R0, #hi_addr(_Label80+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3478 :: 		Label80.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label80+40)
MOVT	R0, #hi_addr(_Label80+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3480 :: 		Label81.OwnerScreen     = &IMU_test;
MOVW	R1, #lo_addr(_IMU_test+0)
MOVT	R1, #hi_addr(_IMU_test+0)
MOVW	R0, #lo_addr(_Label81+0)
MOVT	R0, #hi_addr(_Label81+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3481 :: 		Label81.Order           = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Label81+4)
MOVT	R0, #hi_addr(_Label81+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3482 :: 		Label81.Left            = 148;
MOVS	R1, #148
MOVW	R0, #lo_addr(_Label81+6)
MOVT	R0, #hi_addr(_Label81+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3483 :: 		Label81.Top             = 202;
MOVS	R1, #202
MOVW	R0, #lo_addr(_Label81+8)
MOVT	R0, #hi_addr(_Label81+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3484 :: 		Label81.Width           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Label81+10)
MOVT	R0, #hi_addr(_Label81+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3485 :: 		Label81.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label81+12)
MOVT	R0, #hi_addr(_Label81+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3486 :: 		Label81.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label81+26)
MOVT	R0, #hi_addr(_Label81+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3487 :: 		Label81.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label81+27)
MOVT	R0, #hi_addr(_Label81+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3488 :: 		Label81.Caption         = Label81_Caption;
MOVW	R1, #lo_addr(_Label81_Caption+0)
MOVT	R1, #hi_addr(_Label81_Caption+0)
MOVW	R0, #lo_addr(_Label81+16)
MOVT	R0, #hi_addr(_Label81+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3489 :: 		Label81.FontName        = Tahoma11x13_Regular;
MOVW	R1, #25308
MOVT	R1, #1
MOVW	R0, #lo_addr(_Label81+20)
MOVT	R0, #hi_addr(_Label81+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3490 :: 		Label81.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label81+24)
MOVT	R0, #hi_addr(_Label81+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3491 :: 		Label81.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label81+28)
MOVT	R0, #hi_addr(_Label81+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3492 :: 		Label81.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label81+32)
MOVT	R0, #hi_addr(_Label81+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3493 :: 		Label81.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label81+36)
MOVT	R0, #hi_addr(_Label81+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3494 :: 		Label81.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label81+40)
MOVT	R0, #hi_addr(_Label81+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3496 :: 		Box9.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Box9+0)
MOVT	R0, #hi_addr(_Box9+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3497 :: 		Box9.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+4)
MOVT	R0, #hi_addr(_Box9+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3498 :: 		Box9.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+6)
MOVT	R0, #hi_addr(_Box9+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3499 :: 		Box9.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+8)
MOVT	R0, #hi_addr(_Box9+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3500 :: 		Box9.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Box9+10)
MOVT	R0, #hi_addr(_Box9+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3501 :: 		Box9.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Box9+12)
MOVT	R0, #hi_addr(_Box9+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3502 :: 		Box9.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box9+14)
MOVT	R0, #hi_addr(_Box9+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3503 :: 		Box9.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+16)
MOVT	R0, #hi_addr(_Box9+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3504 :: 		Box9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box9+18)
MOVT	R0, #hi_addr(_Box9+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3505 :: 		Box9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box9+19)
MOVT	R0, #hi_addr(_Box9+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3506 :: 		Box9.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box9+20)
MOVT	R0, #hi_addr(_Box9+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3507 :: 		Box9.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box9+21)
MOVT	R0, #hi_addr(_Box9+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3508 :: 		Box9.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+22)
MOVT	R0, #hi_addr(_Box9+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3509 :: 		Box9.Gradient_Start_Color = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Box9+24)
MOVT	R0, #hi_addr(_Box9+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3510 :: 		Box9.Gradient_End_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_Box9+26)
MOVT	R0, #hi_addr(_Box9+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3511 :: 		Box9.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box9+28)
MOVT	R0, #hi_addr(_Box9+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3512 :: 		Box9.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box9+30)
MOVT	R0, #hi_addr(_Box9+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3513 :: 		Box9.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box9+32)
MOVT	R0, #hi_addr(_Box9+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3514 :: 		Box9.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+36)
MOVT	R0, #hi_addr(_Box9+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3515 :: 		Box9.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+40)
MOVT	R0, #hi_addr(_Box9+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3516 :: 		Box9.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+44)
MOVT	R0, #hi_addr(_Box9+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3517 :: 		Box9.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+48)
MOVT	R0, #hi_addr(_Box9+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3519 :: 		Box16.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Box16+0)
MOVT	R0, #hi_addr(_Box16+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3520 :: 		Box16.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box16+4)
MOVT	R0, #hi_addr(_Box16+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3521 :: 		Box16.Left            = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Box16+6)
MOVT	R0, #hi_addr(_Box16+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3522 :: 		Box16.Top             = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Box16+8)
MOVT	R0, #hi_addr(_Box16+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3523 :: 		Box16.Width           = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_Box16+10)
MOVT	R0, #hi_addr(_Box16+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3524 :: 		Box16.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Box16+12)
MOVT	R0, #hi_addr(_Box16+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3525 :: 		Box16.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box16+14)
MOVT	R0, #hi_addr(_Box16+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3526 :: 		Box16.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+16)
MOVT	R0, #hi_addr(_Box16+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3527 :: 		Box16.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+18)
MOVT	R0, #hi_addr(_Box16+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3528 :: 		Box16.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box16+19)
MOVT	R0, #hi_addr(_Box16+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3529 :: 		Box16.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box16+20)
MOVT	R0, #hi_addr(_Box16+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3530 :: 		Box16.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box16+21)
MOVT	R0, #hi_addr(_Box16+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3531 :: 		Box16.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+22)
MOVT	R0, #hi_addr(_Box16+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3532 :: 		Box16.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box16+24)
MOVT	R0, #hi_addr(_Box16+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3533 :: 		Box16.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box16+26)
MOVT	R0, #hi_addr(_Box16+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3534 :: 		Box16.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box16+28)
MOVT	R0, #hi_addr(_Box16+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3535 :: 		Box16.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+30)
MOVT	R0, #hi_addr(_Box16+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3536 :: 		Box16.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box16+32)
MOVT	R0, #hi_addr(_Box16+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3537 :: 		Box16.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+36)
MOVT	R0, #hi_addr(_Box16+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3538 :: 		Box16.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+40)
MOVT	R0, #hi_addr(_Box16+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3539 :: 		Box16.OnClickPtr      = Image18OnPress;
MOVW	R1, #lo_addr(_Image18OnPress+0)
MOVT	R1, #hi_addr(_Image18OnPress+0)
MOVW	R0, #lo_addr(_Box16+44)
MOVT	R0, #hi_addr(_Box16+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3540 :: 		Box16.OnPressPtr      = Image18OnPress;
MOVW	R1, #lo_addr(_Image18OnPress+0)
MOVT	R1, #hi_addr(_Image18OnPress+0)
MOVW	R0, #lo_addr(_Box16+48)
MOVT	R0, #hi_addr(_Box16+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3542 :: 		Image50.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Image50+0)
MOVT	R0, #hi_addr(_Image50+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3543 :: 		Image50.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image50+4)
MOVT	R0, #hi_addr(_Image50+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3544 :: 		Image50.Left            = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Image50+6)
MOVT	R0, #hi_addr(_Image50+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3545 :: 		Image50.Top             = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Image50+8)
MOVT	R0, #hi_addr(_Image50+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3546 :: 		Image50.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image50+10)
MOVT	R0, #hi_addr(_Image50+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3547 :: 		Image50.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image50+12)
MOVT	R0, #hi_addr(_Image50+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3548 :: 		Image50.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image50+22)
MOVT	R0, #hi_addr(_Image50+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3549 :: 		Image50.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image50+23)
MOVT	R0, #hi_addr(_Image50+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3550 :: 		Image50.Picture_Name    = icon_ok_bmp_1;
MOVW	R1, #59326
MOVT	R1, #61
MOVW	R0, #lo_addr(_Image50+16)
MOVT	R0, #hi_addr(_Image50+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3551 :: 		Image50.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image50+20)
MOVT	R0, #hi_addr(_Image50+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3552 :: 		Image50.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image50+21)
MOVT	R0, #hi_addr(_Image50+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3553 :: 		Image50.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image50+24)
MOVT	R0, #hi_addr(_Image50+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3554 :: 		Image50.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image50+28)
MOVT	R0, #hi_addr(_Image50+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3555 :: 		Image50.OnClickPtr      = Image18OnPress;
MOVW	R1, #lo_addr(_Image18OnPress+0)
MOVT	R1, #hi_addr(_Image18OnPress+0)
MOVW	R0, #lo_addr(_Image50+32)
MOVT	R0, #hi_addr(_Image50+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3556 :: 		Image50.OnPressPtr      = Image18OnPress;
MOVW	R1, #lo_addr(_Image18OnPress+0)
MOVT	R1, #hi_addr(_Image18OnPress+0)
MOVW	R0, #lo_addr(_Image50+36)
MOVT	R0, #hi_addr(_Image50+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3558 :: 		Label32.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label32+0)
MOVT	R0, #hi_addr(_Label32+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3559 :: 		Label32.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label32+4)
MOVT	R0, #hi_addr(_Label32+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3560 :: 		Label32.Left            = 44;
MOVS	R1, #44
MOVW	R0, #lo_addr(_Label32+6)
MOVT	R0, #hi_addr(_Label32+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3561 :: 		Label32.Top             = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label32+8)
MOVT	R0, #hi_addr(_Label32+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3562 :: 		Label32.Width           = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Label32+10)
MOVT	R0, #hi_addr(_Label32+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3563 :: 		Label32.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label32+12)
MOVT	R0, #hi_addr(_Label32+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3564 :: 		Label32.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label32+26)
MOVT	R0, #hi_addr(_Label32+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3565 :: 		Label32.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+27)
MOVT	R0, #hi_addr(_Label32+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3566 :: 		Label32.Caption         = Label32_Caption;
MOVW	R1, #lo_addr(_Label32_Caption+0)
MOVT	R1, #hi_addr(_Label32_Caption+0)
MOVW	R0, #lo_addr(_Label32+16)
MOVT	R0, #hi_addr(_Label32+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3567 :: 		Label32.FontName        = Arial_Black16x23_Regular;
MOVW	R1, #2595
MOVW	R0, #lo_addr(_Label32+20)
MOVT	R0, #hi_addr(_Label32+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3568 :: 		Label32.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+24)
MOVT	R0, #hi_addr(_Label32+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3569 :: 		Label32.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+28)
MOVT	R0, #hi_addr(_Label32+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3570 :: 		Label32.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+32)
MOVT	R0, #hi_addr(_Label32+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3571 :: 		Label32.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+36)
MOVT	R0, #hi_addr(_Label32+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3572 :: 		Label32.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+40)
MOVT	R0, #hi_addr(_Label32+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3574 :: 		Label53.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label53+0)
MOVT	R0, #hi_addr(_Label53+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3575 :: 		Label53.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label53+4)
MOVT	R0, #hi_addr(_Label53+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3576 :: 		Label53.Left            = 159;
MOVS	R1, #159
MOVW	R0, #lo_addr(_Label53+6)
MOVT	R0, #hi_addr(_Label53+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3577 :: 		Label53.Top             = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Label53+8)
MOVT	R0, #hi_addr(_Label53+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3578 :: 		Label53.Width           = 65;
MOVS	R1, #65
MOVW	R0, #lo_addr(_Label53+10)
MOVT	R0, #hi_addr(_Label53+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3579 :: 		Label53.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label53+12)
MOVT	R0, #hi_addr(_Label53+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3580 :: 		Label53.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label53+26)
MOVT	R0, #hi_addr(_Label53+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3581 :: 		Label53.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label53+27)
MOVT	R0, #hi_addr(_Label53+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3582 :: 		Label53.Caption         = Label53_Caption;
MOVW	R1, #lo_addr(_Label53_Caption+0)
MOVT	R1, #hi_addr(_Label53_Caption+0)
MOVW	R0, #lo_addr(_Label53+16)
MOVT	R0, #hi_addr(_Label53+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3583 :: 		Label53.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label53+20)
MOVT	R0, #hi_addr(_Label53+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3584 :: 		Label53.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label53+24)
MOVT	R0, #hi_addr(_Label53+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3585 :: 		Label53.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label53+28)
MOVT	R0, #hi_addr(_Label53+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3586 :: 		Label53.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label53+32)
MOVT	R0, #hi_addr(_Label53+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3587 :: 		Label53.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label53+36)
MOVT	R0, #hi_addr(_Label53+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3588 :: 		Label53.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label53+40)
MOVT	R0, #hi_addr(_Label53+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3590 :: 		Label54.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label54+0)
MOVT	R0, #hi_addr(_Label54+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3591 :: 		Label54.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label54+4)
MOVT	R0, #hi_addr(_Label54+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3592 :: 		Label54.Left            = 243;
MOVS	R1, #243
MOVW	R0, #lo_addr(_Label54+6)
MOVT	R0, #hi_addr(_Label54+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3593 :: 		Label54.Top             = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Label54+8)
MOVT	R0, #hi_addr(_Label54+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3594 :: 		Label54.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label54+10)
MOVT	R0, #hi_addr(_Label54+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3595 :: 		Label54.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label54+12)
MOVT	R0, #hi_addr(_Label54+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3596 :: 		Label54.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label54+26)
MOVT	R0, #hi_addr(_Label54+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3597 :: 		Label54.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label54+27)
MOVT	R0, #hi_addr(_Label54+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3598 :: 		Label54.Caption         = Label54_Caption;
MOVW	R1, #lo_addr(_Label54_Caption+0)
MOVT	R1, #hi_addr(_Label54_Caption+0)
MOVW	R0, #lo_addr(_Label54+16)
MOVT	R0, #hi_addr(_Label54+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3599 :: 		Label54.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label54+20)
MOVT	R0, #hi_addr(_Label54+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3600 :: 		Label54.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label54+24)
MOVT	R0, #hi_addr(_Label54+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3601 :: 		Label54.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label54+28)
MOVT	R0, #hi_addr(_Label54+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3602 :: 		Label54.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label54+32)
MOVT	R0, #hi_addr(_Label54+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3603 :: 		Label54.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label54+36)
MOVT	R0, #hi_addr(_Label54+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3604 :: 		Label54.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label54+40)
MOVT	R0, #hi_addr(_Label54+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3606 :: 		Label55.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label55+0)
MOVT	R0, #hi_addr(_Label55+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3607 :: 		Label55.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label55+4)
MOVT	R0, #hi_addr(_Label55+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3608 :: 		Label55.Left            = 284;
MOVW	R1, #284
MOVW	R0, #lo_addr(_Label55+6)
MOVT	R0, #hi_addr(_Label55+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3609 :: 		Label55.Top             = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Label55+8)
MOVT	R0, #hi_addr(_Label55+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3610 :: 		Label55.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label55+10)
MOVT	R0, #hi_addr(_Label55+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3611 :: 		Label55.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label55+12)
MOVT	R0, #hi_addr(_Label55+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3612 :: 		Label55.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label55+26)
MOVT	R0, #hi_addr(_Label55+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3613 :: 		Label55.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label55+27)
MOVT	R0, #hi_addr(_Label55+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3614 :: 		Label55.Caption         = Label55_Caption;
MOVW	R1, #lo_addr(_Label55_Caption+0)
MOVT	R1, #hi_addr(_Label55_Caption+0)
MOVW	R0, #lo_addr(_Label55+16)
MOVT	R0, #hi_addr(_Label55+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3615 :: 		Label55.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label55+20)
MOVT	R0, #hi_addr(_Label55+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3616 :: 		Label55.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label55+24)
MOVT	R0, #hi_addr(_Label55+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3617 :: 		Label55.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label55+28)
MOVT	R0, #hi_addr(_Label55+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3618 :: 		Label55.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label55+32)
MOVT	R0, #hi_addr(_Label55+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3619 :: 		Label55.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label55+36)
MOVT	R0, #hi_addr(_Label55+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3620 :: 		Label55.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label55+40)
MOVT	R0, #hi_addr(_Label55+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3622 :: 		Label56.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label56+0)
MOVT	R0, #hi_addr(_Label56+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3623 :: 		Label56.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label56+4)
MOVT	R0, #hi_addr(_Label56+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3624 :: 		Label56.Left            = 279;
MOVW	R1, #279
MOVW	R0, #lo_addr(_Label56+6)
MOVT	R0, #hi_addr(_Label56+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3625 :: 		Label56.Top             = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Label56+8)
MOVT	R0, #hi_addr(_Label56+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3626 :: 		Label56.Width           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label56+10)
MOVT	R0, #hi_addr(_Label56+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3627 :: 		Label56.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label56+12)
MOVT	R0, #hi_addr(_Label56+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3628 :: 		Label56.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label56+26)
MOVT	R0, #hi_addr(_Label56+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3629 :: 		Label56.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label56+27)
MOVT	R0, #hi_addr(_Label56+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3630 :: 		Label56.Caption         = Label56_Caption;
MOVW	R1, #lo_addr(_Label56_Caption+0)
MOVT	R1, #hi_addr(_Label56_Caption+0)
MOVW	R0, #lo_addr(_Label56+16)
MOVT	R0, #hi_addr(_Label56+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3631 :: 		Label56.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label56+20)
MOVT	R0, #hi_addr(_Label56+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3632 :: 		Label56.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label56+24)
MOVT	R0, #hi_addr(_Label56+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3633 :: 		Label56.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label56+28)
MOVT	R0, #hi_addr(_Label56+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3634 :: 		Label56.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label56+32)
MOVT	R0, #hi_addr(_Label56+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3635 :: 		Label56.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label56+36)
MOVT	R0, #hi_addr(_Label56+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3636 :: 		Label56.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label56+40)
MOVT	R0, #hi_addr(_Label56+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3638 :: 		Label57.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label57+0)
MOVT	R0, #hi_addr(_Label57+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3639 :: 		Label57.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Label57+4)
MOVT	R0, #hi_addr(_Label57+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3640 :: 		Label57.Left            = 159;
MOVS	R1, #159
MOVW	R0, #lo_addr(_Label57+6)
MOVT	R0, #hi_addr(_Label57+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3641 :: 		Label57.Top             = 108;
MOVS	R1, #108
MOVW	R0, #lo_addr(_Label57+8)
MOVT	R0, #hi_addr(_Label57+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3642 :: 		Label57.Width           = 77;
MOVS	R1, #77
MOVW	R0, #lo_addr(_Label57+10)
MOVT	R0, #hi_addr(_Label57+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3643 :: 		Label57.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label57+12)
MOVT	R0, #hi_addr(_Label57+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3644 :: 		Label57.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label57+26)
MOVT	R0, #hi_addr(_Label57+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3645 :: 		Label57.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label57+27)
MOVT	R0, #hi_addr(_Label57+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3646 :: 		Label57.Caption         = Label57_Caption;
MOVW	R1, #lo_addr(_Label57_Caption+0)
MOVT	R1, #hi_addr(_Label57_Caption+0)
MOVW	R0, #lo_addr(_Label57+16)
MOVT	R0, #hi_addr(_Label57+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3647 :: 		Label57.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label57+20)
MOVT	R0, #hi_addr(_Label57+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3648 :: 		Label57.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label57+24)
MOVT	R0, #hi_addr(_Label57+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3649 :: 		Label57.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label57+28)
MOVT	R0, #hi_addr(_Label57+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3650 :: 		Label57.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label57+32)
MOVT	R0, #hi_addr(_Label57+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3651 :: 		Label57.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label57+36)
MOVT	R0, #hi_addr(_Label57+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3652 :: 		Label57.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label57+40)
MOVT	R0, #hi_addr(_Label57+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3654 :: 		Label58.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label58+0)
MOVT	R0, #hi_addr(_Label58+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3655 :: 		Label58.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label58+4)
MOVT	R0, #hi_addr(_Label58+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3656 :: 		Label58.Left            = 243;
MOVS	R1, #243
MOVW	R0, #lo_addr(_Label58+6)
MOVT	R0, #hi_addr(_Label58+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3657 :: 		Label58.Top             = 108;
MOVS	R1, #108
MOVW	R0, #lo_addr(_Label58+8)
MOVT	R0, #hi_addr(_Label58+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3658 :: 		Label58.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label58+10)
MOVT	R0, #hi_addr(_Label58+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3659 :: 		Label58.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label58+12)
MOVT	R0, #hi_addr(_Label58+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3660 :: 		Label58.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label58+26)
MOVT	R0, #hi_addr(_Label58+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3661 :: 		Label58.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label58+27)
MOVT	R0, #hi_addr(_Label58+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3662 :: 		Label58.Caption         = Label58_Caption;
MOVW	R1, #lo_addr(_Label58_Caption+0)
MOVT	R1, #hi_addr(_Label58_Caption+0)
MOVW	R0, #lo_addr(_Label58+16)
MOVT	R0, #hi_addr(_Label58+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3663 :: 		Label58.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label58+20)
MOVT	R0, #hi_addr(_Label58+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3664 :: 		Label58.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label58+24)
MOVT	R0, #hi_addr(_Label58+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3665 :: 		Label58.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label58+28)
MOVT	R0, #hi_addr(_Label58+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3666 :: 		Label58.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label58+32)
MOVT	R0, #hi_addr(_Label58+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3667 :: 		Label58.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label58+36)
MOVT	R0, #hi_addr(_Label58+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3668 :: 		Label58.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label58+40)
MOVT	R0, #hi_addr(_Label58+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3670 :: 		Label59.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label59+0)
MOVT	R0, #hi_addr(_Label59+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3671 :: 		Label59.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label59+4)
MOVT	R0, #hi_addr(_Label59+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3672 :: 		Label59.Left            = 284;
MOVW	R1, #284
MOVW	R0, #lo_addr(_Label59+6)
MOVT	R0, #hi_addr(_Label59+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3673 :: 		Label59.Top             = 108;
MOVS	R1, #108
MOVW	R0, #lo_addr(_Label59+8)
MOVT	R0, #hi_addr(_Label59+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3674 :: 		Label59.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label59+10)
MOVT	R0, #hi_addr(_Label59+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3675 :: 		Label59.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label59+12)
MOVT	R0, #hi_addr(_Label59+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3676 :: 		Label59.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label59+26)
MOVT	R0, #hi_addr(_Label59+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3677 :: 		Label59.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label59+27)
MOVT	R0, #hi_addr(_Label59+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3678 :: 		Label59.Caption         = Label59_Caption;
MOVW	R1, #lo_addr(_Label59_Caption+0)
MOVT	R1, #hi_addr(_Label59_Caption+0)
MOVW	R0, #lo_addr(_Label59+16)
MOVT	R0, #hi_addr(_Label59+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3679 :: 		Label59.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label59+20)
MOVT	R0, #hi_addr(_Label59+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3680 :: 		Label59.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label59+24)
MOVT	R0, #hi_addr(_Label59+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3681 :: 		Label59.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label59+28)
MOVT	R0, #hi_addr(_Label59+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3682 :: 		Label59.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label59+32)
MOVT	R0, #hi_addr(_Label59+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3683 :: 		Label59.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label59+36)
MOVT	R0, #hi_addr(_Label59+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3684 :: 		Label59.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label59+40)
MOVT	R0, #hi_addr(_Label59+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3686 :: 		Label60.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label60+0)
MOVT	R0, #hi_addr(_Label60+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3687 :: 		Label60.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Label60+4)
MOVT	R0, #hi_addr(_Label60+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3688 :: 		Label60.Left            = 279;
MOVW	R1, #279
MOVW	R0, #lo_addr(_Label60+6)
MOVT	R0, #hi_addr(_Label60+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3689 :: 		Label60.Top             = 108;
MOVS	R1, #108
MOVW	R0, #lo_addr(_Label60+8)
MOVT	R0, #hi_addr(_Label60+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3690 :: 		Label60.Width           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label60+10)
MOVT	R0, #hi_addr(_Label60+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3691 :: 		Label60.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label60+12)
MOVT	R0, #hi_addr(_Label60+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3692 :: 		Label60.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label60+26)
MOVT	R0, #hi_addr(_Label60+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3693 :: 		Label60.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label60+27)
MOVT	R0, #hi_addr(_Label60+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3694 :: 		Label60.Caption         = Label60_Caption;
MOVW	R1, #lo_addr(_Label60_Caption+0)
MOVT	R1, #hi_addr(_Label60_Caption+0)
MOVW	R0, #lo_addr(_Label60+16)
MOVT	R0, #hi_addr(_Label60+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3695 :: 		Label60.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label60+20)
MOVT	R0, #hi_addr(_Label60+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3696 :: 		Label60.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label60+24)
MOVT	R0, #hi_addr(_Label60+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3697 :: 		Label60.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label60+28)
MOVT	R0, #hi_addr(_Label60+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3698 :: 		Label60.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label60+32)
MOVT	R0, #hi_addr(_Label60+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3699 :: 		Label60.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label60+36)
MOVT	R0, #hi_addr(_Label60+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3700 :: 		Label60.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label60+40)
MOVT	R0, #hi_addr(_Label60+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3702 :: 		Label61.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label61+0)
MOVT	R0, #hi_addr(_Label61+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3703 :: 		Label61.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Label61+4)
MOVT	R0, #hi_addr(_Label61+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3704 :: 		Label61.Left            = 159;
MOVS	R1, #159
MOVW	R0, #lo_addr(_Label61+6)
MOVT	R0, #hi_addr(_Label61+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3705 :: 		Label61.Top             = 131;
MOVS	R1, #131
MOVW	R0, #lo_addr(_Label61+8)
MOVT	R0, #hi_addr(_Label61+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3706 :: 		Label61.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Label61+10)
MOVT	R0, #hi_addr(_Label61+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3707 :: 		Label61.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label61+12)
MOVT	R0, #hi_addr(_Label61+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3708 :: 		Label61.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label61+26)
MOVT	R0, #hi_addr(_Label61+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3709 :: 		Label61.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label61+27)
MOVT	R0, #hi_addr(_Label61+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3710 :: 		Label61.Caption         = Label61_Caption;
MOVW	R1, #lo_addr(_Label61_Caption+0)
MOVT	R1, #hi_addr(_Label61_Caption+0)
MOVW	R0, #lo_addr(_Label61+16)
MOVT	R0, #hi_addr(_Label61+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3711 :: 		Label61.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label61+20)
MOVT	R0, #hi_addr(_Label61+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3712 :: 		Label61.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label61+24)
MOVT	R0, #hi_addr(_Label61+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3713 :: 		Label61.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label61+28)
MOVT	R0, #hi_addr(_Label61+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3714 :: 		Label61.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label61+32)
MOVT	R0, #hi_addr(_Label61+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3715 :: 		Label61.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label61+36)
MOVT	R0, #hi_addr(_Label61+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3716 :: 		Label61.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label61+40)
MOVT	R0, #hi_addr(_Label61+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3718 :: 		Label62.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label62+0)
MOVT	R0, #hi_addr(_Label62+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3719 :: 		Label62.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label62+4)
MOVT	R0, #hi_addr(_Label62+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3720 :: 		Label62.Left            = 243;
MOVS	R1, #243
MOVW	R0, #lo_addr(_Label62+6)
MOVT	R0, #hi_addr(_Label62+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3721 :: 		Label62.Top             = 131;
MOVS	R1, #131
MOVW	R0, #lo_addr(_Label62+8)
MOVT	R0, #hi_addr(_Label62+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3722 :: 		Label62.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label62+10)
MOVT	R0, #hi_addr(_Label62+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3723 :: 		Label62.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label62+12)
MOVT	R0, #hi_addr(_Label62+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3724 :: 		Label62.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label62+26)
MOVT	R0, #hi_addr(_Label62+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3725 :: 		Label62.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label62+27)
MOVT	R0, #hi_addr(_Label62+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3726 :: 		Label62.Caption         = Label62_Caption;
MOVW	R1, #lo_addr(_Label62_Caption+0)
MOVT	R1, #hi_addr(_Label62_Caption+0)
MOVW	R0, #lo_addr(_Label62+16)
MOVT	R0, #hi_addr(_Label62+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3727 :: 		Label62.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label62+20)
MOVT	R0, #hi_addr(_Label62+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3728 :: 		Label62.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label62+24)
MOVT	R0, #hi_addr(_Label62+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3729 :: 		Label62.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label62+28)
MOVT	R0, #hi_addr(_Label62+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3730 :: 		Label62.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label62+32)
MOVT	R0, #hi_addr(_Label62+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3731 :: 		Label62.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label62+36)
MOVT	R0, #hi_addr(_Label62+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3732 :: 		Label62.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label62+40)
MOVT	R0, #hi_addr(_Label62+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3734 :: 		Label63.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label63+0)
MOVT	R0, #hi_addr(_Label63+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3735 :: 		Label63.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label63+4)
MOVT	R0, #hi_addr(_Label63+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3736 :: 		Label63.Left            = 284;
MOVW	R1, #284
MOVW	R0, #lo_addr(_Label63+6)
MOVT	R0, #hi_addr(_Label63+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3737 :: 		Label63.Top             = 131;
MOVS	R1, #131
MOVW	R0, #lo_addr(_Label63+8)
MOVT	R0, #hi_addr(_Label63+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3738 :: 		Label63.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label63+10)
MOVT	R0, #hi_addr(_Label63+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3739 :: 		Label63.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label63+12)
MOVT	R0, #hi_addr(_Label63+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3740 :: 		Label63.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label63+26)
MOVT	R0, #hi_addr(_Label63+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3741 :: 		Label63.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label63+27)
MOVT	R0, #hi_addr(_Label63+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3742 :: 		Label63.Caption         = Label63_Caption;
MOVW	R1, #lo_addr(_Label63_Caption+0)
MOVT	R1, #hi_addr(_Label63_Caption+0)
MOVW	R0, #lo_addr(_Label63+16)
MOVT	R0, #hi_addr(_Label63+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3743 :: 		Label63.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label63+20)
MOVT	R0, #hi_addr(_Label63+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3744 :: 		Label63.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label63+24)
MOVT	R0, #hi_addr(_Label63+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3745 :: 		Label63.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label63+28)
MOVT	R0, #hi_addr(_Label63+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3746 :: 		Label63.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label63+32)
MOVT	R0, #hi_addr(_Label63+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3747 :: 		Label63.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label63+36)
MOVT	R0, #hi_addr(_Label63+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3748 :: 		Label63.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label63+40)
MOVT	R0, #hi_addr(_Label63+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3750 :: 		Label64.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label64+0)
MOVT	R0, #hi_addr(_Label64+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3751 :: 		Label64.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label64+4)
MOVT	R0, #hi_addr(_Label64+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3752 :: 		Label64.Left            = 279;
MOVW	R1, #279
MOVW	R0, #lo_addr(_Label64+6)
MOVT	R0, #hi_addr(_Label64+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3753 :: 		Label64.Top             = 131;
MOVS	R1, #131
MOVW	R0, #lo_addr(_Label64+8)
MOVT	R0, #hi_addr(_Label64+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3754 :: 		Label64.Width           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label64+10)
MOVT	R0, #hi_addr(_Label64+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3755 :: 		Label64.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label64+12)
MOVT	R0, #hi_addr(_Label64+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3756 :: 		Label64.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label64+26)
MOVT	R0, #hi_addr(_Label64+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3757 :: 		Label64.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label64+27)
MOVT	R0, #hi_addr(_Label64+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3758 :: 		Label64.Caption         = Label64_Caption;
MOVW	R1, #lo_addr(_Label64_Caption+0)
MOVT	R1, #hi_addr(_Label64_Caption+0)
MOVW	R0, #lo_addr(_Label64+16)
MOVT	R0, #hi_addr(_Label64+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3759 :: 		Label64.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label64+20)
MOVT	R0, #hi_addr(_Label64+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3760 :: 		Label64.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label64+24)
MOVT	R0, #hi_addr(_Label64+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3761 :: 		Label64.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label64+28)
MOVT	R0, #hi_addr(_Label64+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3762 :: 		Label64.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label64+32)
MOVT	R0, #hi_addr(_Label64+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3763 :: 		Label64.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label64+36)
MOVT	R0, #hi_addr(_Label64+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3764 :: 		Label64.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label64+40)
MOVT	R0, #hi_addr(_Label64+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3766 :: 		Label65.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label65+0)
MOVT	R0, #hi_addr(_Label65+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3767 :: 		Label65.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label65+4)
MOVT	R0, #hi_addr(_Label65+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3768 :: 		Label65.Left            = 159;
MOVS	R1, #159
MOVW	R0, #lo_addr(_Label65+6)
MOVT	R0, #hi_addr(_Label65+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3769 :: 		Label65.Top             = 154;
MOVS	R1, #154
MOVW	R0, #lo_addr(_Label65+8)
MOVT	R0, #hi_addr(_Label65+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3770 :: 		Label65.Width           = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_Label65+10)
MOVT	R0, #hi_addr(_Label65+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3771 :: 		Label65.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label65+12)
MOVT	R0, #hi_addr(_Label65+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3772 :: 		Label65.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label65+26)
MOVT	R0, #hi_addr(_Label65+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3773 :: 		Label65.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label65+27)
MOVT	R0, #hi_addr(_Label65+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3774 :: 		Label65.Caption         = Label65_Caption;
MOVW	R1, #lo_addr(_Label65_Caption+0)
MOVT	R1, #hi_addr(_Label65_Caption+0)
MOVW	R0, #lo_addr(_Label65+16)
MOVT	R0, #hi_addr(_Label65+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3775 :: 		Label65.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label65+20)
MOVT	R0, #hi_addr(_Label65+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3776 :: 		Label65.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label65+24)
MOVT	R0, #hi_addr(_Label65+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3777 :: 		Label65.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label65+28)
MOVT	R0, #hi_addr(_Label65+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3778 :: 		Label65.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label65+32)
MOVT	R0, #hi_addr(_Label65+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3779 :: 		Label65.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label65+36)
MOVT	R0, #hi_addr(_Label65+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3780 :: 		Label65.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label65+40)
MOVT	R0, #hi_addr(_Label65+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3782 :: 		Label66.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label66+0)
MOVT	R0, #hi_addr(_Label66+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3783 :: 		Label66.Order           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label66+4)
MOVT	R0, #hi_addr(_Label66+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3784 :: 		Label66.Left            = 243;
MOVS	R1, #243
MOVW	R0, #lo_addr(_Label66+6)
MOVT	R0, #hi_addr(_Label66+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3785 :: 		Label66.Top             = 154;
MOVS	R1, #154
MOVW	R0, #lo_addr(_Label66+8)
MOVT	R0, #hi_addr(_Label66+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3786 :: 		Label66.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label66+10)
MOVT	R0, #hi_addr(_Label66+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3787 :: 		Label66.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label66+12)
MOVT	R0, #hi_addr(_Label66+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3788 :: 		Label66.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label66+26)
MOVT	R0, #hi_addr(_Label66+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3789 :: 		Label66.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label66+27)
MOVT	R0, #hi_addr(_Label66+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3790 :: 		Label66.Caption         = Label66_Caption;
MOVW	R1, #lo_addr(_Label66_Caption+0)
MOVT	R1, #hi_addr(_Label66_Caption+0)
MOVW	R0, #lo_addr(_Label66+16)
MOVT	R0, #hi_addr(_Label66+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3791 :: 		Label66.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label66+20)
MOVT	R0, #hi_addr(_Label66+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3792 :: 		Label66.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label66+24)
MOVT	R0, #hi_addr(_Label66+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3793 :: 		Label66.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label66+28)
MOVT	R0, #hi_addr(_Label66+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3794 :: 		Label66.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label66+32)
MOVT	R0, #hi_addr(_Label66+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3795 :: 		Label66.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label66+36)
MOVT	R0, #hi_addr(_Label66+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3796 :: 		Label66.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label66+40)
MOVT	R0, #hi_addr(_Label66+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3798 :: 		Label67.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label67+0)
MOVT	R0, #hi_addr(_Label67+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3799 :: 		Label67.Order           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Label67+4)
MOVT	R0, #hi_addr(_Label67+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3800 :: 		Label67.Left            = 284;
MOVW	R1, #284
MOVW	R0, #lo_addr(_Label67+6)
MOVT	R0, #hi_addr(_Label67+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3801 :: 		Label67.Top             = 154;
MOVS	R1, #154
MOVW	R0, #lo_addr(_Label67+8)
MOVT	R0, #hi_addr(_Label67+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3802 :: 		Label67.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label67+10)
MOVT	R0, #hi_addr(_Label67+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3803 :: 		Label67.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label67+12)
MOVT	R0, #hi_addr(_Label67+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3804 :: 		Label67.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label67+26)
MOVT	R0, #hi_addr(_Label67+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3805 :: 		Label67.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label67+27)
MOVT	R0, #hi_addr(_Label67+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3806 :: 		Label67.Caption         = Label67_Caption;
MOVW	R1, #lo_addr(_Label67_Caption+0)
MOVT	R1, #hi_addr(_Label67_Caption+0)
MOVW	R0, #lo_addr(_Label67+16)
MOVT	R0, #hi_addr(_Label67+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3807 :: 		Label67.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label67+20)
MOVT	R0, #hi_addr(_Label67+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3808 :: 		Label67.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label67+24)
MOVT	R0, #hi_addr(_Label67+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3809 :: 		Label67.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label67+28)
MOVT	R0, #hi_addr(_Label67+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3810 :: 		Label67.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label67+32)
MOVT	R0, #hi_addr(_Label67+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3811 :: 		Label67.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label67+36)
MOVT	R0, #hi_addr(_Label67+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3812 :: 		Label67.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label67+40)
MOVT	R0, #hi_addr(_Label67+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3814 :: 		Label68.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label68+0)
MOVT	R0, #hi_addr(_Label68+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3815 :: 		Label68.Order           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Label68+4)
MOVT	R0, #hi_addr(_Label68+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3816 :: 		Label68.Left            = 279;
MOVW	R1, #279
MOVW	R0, #lo_addr(_Label68+6)
MOVT	R0, #hi_addr(_Label68+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3817 :: 		Label68.Top             = 154;
MOVS	R1, #154
MOVW	R0, #lo_addr(_Label68+8)
MOVT	R0, #hi_addr(_Label68+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3818 :: 		Label68.Width           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label68+10)
MOVT	R0, #hi_addr(_Label68+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3819 :: 		Label68.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label68+12)
MOVT	R0, #hi_addr(_Label68+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3820 :: 		Label68.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label68+26)
MOVT	R0, #hi_addr(_Label68+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3821 :: 		Label68.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label68+27)
MOVT	R0, #hi_addr(_Label68+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3822 :: 		Label68.Caption         = Label68_Caption;
MOVW	R1, #lo_addr(_Label68_Caption+0)
MOVT	R1, #hi_addr(_Label68_Caption+0)
MOVW	R0, #lo_addr(_Label68+16)
MOVT	R0, #hi_addr(_Label68+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3823 :: 		Label68.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label68+20)
MOVT	R0, #hi_addr(_Label68+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3824 :: 		Label68.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label68+24)
MOVT	R0, #hi_addr(_Label68+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3825 :: 		Label68.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label68+28)
MOVT	R0, #hi_addr(_Label68+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3826 :: 		Label68.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label68+32)
MOVT	R0, #hi_addr(_Label68+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3827 :: 		Label68.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label68+36)
MOVT	R0, #hi_addr(_Label68+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3828 :: 		Label68.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label68+40)
MOVT	R0, #hi_addr(_Label68+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3830 :: 		Label69.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label69+0)
MOVT	R0, #hi_addr(_Label69+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3831 :: 		Label69.Order           = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label69+4)
MOVT	R0, #hi_addr(_Label69+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3832 :: 		Label69.Left            = 159;
MOVS	R1, #159
MOVW	R0, #lo_addr(_Label69+6)
MOVT	R0, #hi_addr(_Label69+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3833 :: 		Label69.Top             = 177;
MOVS	R1, #177
MOVW	R0, #lo_addr(_Label69+8)
MOVT	R0, #hi_addr(_Label69+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3834 :: 		Label69.Width           = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_Label69+10)
MOVT	R0, #hi_addr(_Label69+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3835 :: 		Label69.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label69+12)
MOVT	R0, #hi_addr(_Label69+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3836 :: 		Label69.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label69+26)
MOVT	R0, #hi_addr(_Label69+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3837 :: 		Label69.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label69+27)
MOVT	R0, #hi_addr(_Label69+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3838 :: 		Label69.Caption         = Label69_Caption;
MOVW	R1, #lo_addr(_Label69_Caption+0)
MOVT	R1, #hi_addr(_Label69_Caption+0)
MOVW	R0, #lo_addr(_Label69+16)
MOVT	R0, #hi_addr(_Label69+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3839 :: 		Label69.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label69+20)
MOVT	R0, #hi_addr(_Label69+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3840 :: 		Label69.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label69+24)
MOVT	R0, #hi_addr(_Label69+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3841 :: 		Label69.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label69+28)
MOVT	R0, #hi_addr(_Label69+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3842 :: 		Label69.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label69+32)
MOVT	R0, #hi_addr(_Label69+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3843 :: 		Label69.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label69+36)
MOVT	R0, #hi_addr(_Label69+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3844 :: 		Label69.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label69+40)
MOVT	R0, #hi_addr(_Label69+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3846 :: 		Label70.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label70+0)
MOVT	R0, #hi_addr(_Label70+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3847 :: 		Label70.Order           = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label70+4)
MOVT	R0, #hi_addr(_Label70+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3848 :: 		Label70.Left            = 243;
MOVS	R1, #243
MOVW	R0, #lo_addr(_Label70+6)
MOVT	R0, #hi_addr(_Label70+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3849 :: 		Label70.Top             = 177;
MOVS	R1, #177
MOVW	R0, #lo_addr(_Label70+8)
MOVT	R0, #hi_addr(_Label70+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3850 :: 		Label70.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label70+10)
MOVT	R0, #hi_addr(_Label70+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3851 :: 		Label70.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label70+12)
MOVT	R0, #hi_addr(_Label70+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3852 :: 		Label70.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label70+26)
MOVT	R0, #hi_addr(_Label70+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3853 :: 		Label70.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label70+27)
MOVT	R0, #hi_addr(_Label70+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3854 :: 		Label70.Caption         = Label70_Caption;
MOVW	R1, #lo_addr(_Label70_Caption+0)
MOVT	R1, #hi_addr(_Label70_Caption+0)
MOVW	R0, #lo_addr(_Label70+16)
MOVT	R0, #hi_addr(_Label70+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3855 :: 		Label70.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label70+20)
MOVT	R0, #hi_addr(_Label70+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3856 :: 		Label70.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label70+24)
MOVT	R0, #hi_addr(_Label70+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3857 :: 		Label70.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label70+28)
MOVT	R0, #hi_addr(_Label70+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3858 :: 		Label70.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label70+32)
MOVT	R0, #hi_addr(_Label70+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3859 :: 		Label70.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label70+36)
MOVT	R0, #hi_addr(_Label70+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3860 :: 		Label70.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label70+40)
MOVT	R0, #hi_addr(_Label70+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3862 :: 		Label71.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label71+0)
MOVT	R0, #hi_addr(_Label71+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3863 :: 		Label71.Order           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Label71+4)
MOVT	R0, #hi_addr(_Label71+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3864 :: 		Label71.Left            = 284;
MOVW	R1, #284
MOVW	R0, #lo_addr(_Label71+6)
MOVT	R0, #hi_addr(_Label71+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3865 :: 		Label71.Top             = 177;
MOVS	R1, #177
MOVW	R0, #lo_addr(_Label71+8)
MOVT	R0, #hi_addr(_Label71+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3866 :: 		Label71.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label71+10)
MOVT	R0, #hi_addr(_Label71+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3867 :: 		Label71.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label71+12)
MOVT	R0, #hi_addr(_Label71+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3868 :: 		Label71.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label71+26)
MOVT	R0, #hi_addr(_Label71+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3869 :: 		Label71.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label71+27)
MOVT	R0, #hi_addr(_Label71+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3870 :: 		Label71.Caption         = Label71_Caption;
MOVW	R1, #lo_addr(_Label71_Caption+0)
MOVT	R1, #hi_addr(_Label71_Caption+0)
MOVW	R0, #lo_addr(_Label71+16)
MOVT	R0, #hi_addr(_Label71+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3871 :: 		Label71.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label71+20)
MOVT	R0, #hi_addr(_Label71+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3872 :: 		Label71.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label71+24)
MOVT	R0, #hi_addr(_Label71+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3873 :: 		Label71.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label71+28)
MOVT	R0, #hi_addr(_Label71+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3874 :: 		Label71.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label71+32)
MOVT	R0, #hi_addr(_Label71+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3875 :: 		Label71.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label71+36)
MOVT	R0, #hi_addr(_Label71+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3876 :: 		Label71.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label71+40)
MOVT	R0, #hi_addr(_Label71+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3878 :: 		Label72.OwnerScreen     = &GPS_Test;
MOVW	R1, #lo_addr(_GPS_Test+0)
MOVT	R1, #hi_addr(_GPS_Test+0)
MOVW	R0, #lo_addr(_Label72+0)
MOVT	R0, #hi_addr(_Label72+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3879 :: 		Label72.Order           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Label72+4)
MOVT	R0, #hi_addr(_Label72+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3880 :: 		Label72.Left            = 279;
MOVW	R1, #279
MOVW	R0, #lo_addr(_Label72+6)
MOVT	R0, #hi_addr(_Label72+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3881 :: 		Label72.Top             = 177;
MOVS	R1, #177
MOVW	R0, #lo_addr(_Label72+8)
MOVT	R0, #hi_addr(_Label72+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3882 :: 		Label72.Width           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label72+10)
MOVT	R0, #hi_addr(_Label72+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3883 :: 		Label72.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label72+12)
MOVT	R0, #hi_addr(_Label72+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3884 :: 		Label72.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label72+26)
MOVT	R0, #hi_addr(_Label72+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3885 :: 		Label72.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label72+27)
MOVT	R0, #hi_addr(_Label72+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3886 :: 		Label72.Caption         = Label72_Caption;
MOVW	R1, #lo_addr(_Label72_Caption+0)
MOVT	R1, #hi_addr(_Label72_Caption+0)
MOVW	R0, #lo_addr(_Label72+16)
MOVT	R0, #hi_addr(_Label72+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3887 :: 		Label72.FontName        = Arial_Black13x18_Regular;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label72+20)
MOVT	R0, #hi_addr(_Label72+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3888 :: 		Label72.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label72+24)
MOVT	R0, #hi_addr(_Label72+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3889 :: 		Label72.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label72+28)
MOVT	R0, #hi_addr(_Label72+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3890 :: 		Label72.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label72+32)
MOVT	R0, #hi_addr(_Label72+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3891 :: 		Label72.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label72+36)
MOVT	R0, #hi_addr(_Label72+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3892 :: 		Label72.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label72+40)
MOVT	R0, #hi_addr(_Label72+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3894 :: 		Box19.OwnerScreen     = &Pressure_test;
MOVW	R1, #lo_addr(_Pressure_test+0)
MOVT	R1, #hi_addr(_Pressure_test+0)
MOVW	R0, #lo_addr(_Box19+0)
MOVT	R0, #hi_addr(_Box19+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3895 :: 		Box19.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+4)
MOVT	R0, #hi_addr(_Box19+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3896 :: 		Box19.Left            = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box19+6)
MOVT	R0, #hi_addr(_Box19+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3897 :: 		Box19.Top             = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Box19+8)
MOVT	R0, #hi_addr(_Box19+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3898 :: 		Box19.Width           = 265;
MOVW	R1, #265
MOVW	R0, #lo_addr(_Box19+10)
MOVT	R0, #hi_addr(_Box19+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3899 :: 		Box19.Height          = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Box19+12)
MOVT	R0, #hi_addr(_Box19+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3900 :: 		Box19.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box19+14)
MOVT	R0, #hi_addr(_Box19+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3901 :: 		Box19.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+16)
MOVT	R0, #hi_addr(_Box19+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3902 :: 		Box19.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+18)
MOVT	R0, #hi_addr(_Box19+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3903 :: 		Box19.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box19+19)
MOVT	R0, #hi_addr(_Box19+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3904 :: 		Box19.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box19+20)
MOVT	R0, #hi_addr(_Box19+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3905 :: 		Box19.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+21)
MOVT	R0, #hi_addr(_Box19+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3906 :: 		Box19.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+22)
MOVT	R0, #hi_addr(_Box19+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3907 :: 		Box19.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box19+24)
MOVT	R0, #hi_addr(_Box19+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3908 :: 		Box19.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box19+26)
MOVT	R0, #hi_addr(_Box19+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3909 :: 		Box19.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box19+28)
MOVT	R0, #hi_addr(_Box19+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3910 :: 		Box19.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+30)
MOVT	R0, #hi_addr(_Box19+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3911 :: 		Box19.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box19+32)
MOVT	R0, #hi_addr(_Box19+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3912 :: 		Box19.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+36)
MOVT	R0, #hi_addr(_Box19+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3913 :: 		Box19.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+40)
MOVT	R0, #hi_addr(_Box19+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3914 :: 		Box19.OnClickPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Box19+44)
MOVT	R0, #hi_addr(_Box19+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3915 :: 		Box19.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+48)
MOVT	R0, #hi_addr(_Box19+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3917 :: 		Box20.OwnerScreen     = &Pressure_test;
MOVW	R1, #lo_addr(_Pressure_test+0)
MOVT	R1, #hi_addr(_Pressure_test+0)
MOVW	R0, #lo_addr(_Box20+0)
MOVT	R0, #hi_addr(_Box20+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3918 :: 		Box20.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box20+4)
MOVT	R0, #hi_addr(_Box20+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3919 :: 		Box20.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+6)
MOVT	R0, #hi_addr(_Box20+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3920 :: 		Box20.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Box20+8)
MOVT	R0, #hi_addr(_Box20+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3921 :: 		Box20.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Box20+10)
MOVT	R0, #hi_addr(_Box20+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3922 :: 		Box20.Height          = 207;
MOVS	R1, #207
MOVW	R0, #lo_addr(_Box20+12)
MOVT	R0, #hi_addr(_Box20+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3923 :: 		Box20.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box20+14)
MOVT	R0, #hi_addr(_Box20+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3924 :: 		Box20.Pen_Color       = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box20+16)
MOVT	R0, #hi_addr(_Box20+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3925 :: 		Box20.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box20+18)
MOVT	R0, #hi_addr(_Box20+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3926 :: 		Box20.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box20+19)
MOVT	R0, #hi_addr(_Box20+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3927 :: 		Box20.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box20+20)
MOVT	R0, #hi_addr(_Box20+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3928 :: 		Box20.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+21)
MOVT	R0, #hi_addr(_Box20+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3929 :: 		Box20.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+22)
MOVT	R0, #hi_addr(_Box20+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3930 :: 		Box20.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box20+24)
MOVT	R0, #hi_addr(_Box20+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3931 :: 		Box20.Gradient_End_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box20+26)
MOVT	R0, #hi_addr(_Box20+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3932 :: 		Box20.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box20+28)
MOVT	R0, #hi_addr(_Box20+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3933 :: 		Box20.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+30)
MOVT	R0, #hi_addr(_Box20+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3934 :: 		Box20.Press_Color     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box20+32)
MOVT	R0, #hi_addr(_Box20+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3935 :: 		Box20.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+36)
MOVT	R0, #hi_addr(_Box20+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3936 :: 		Box20.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+40)
MOVT	R0, #hi_addr(_Box20+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3937 :: 		Box20.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+44)
MOVT	R0, #hi_addr(_Box20+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3938 :: 		Box20.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+48)
MOVT	R0, #hi_addr(_Box20+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3940 :: 		Image54.OwnerScreen     = &Pressure_test;
MOVW	R1, #lo_addr(_Pressure_test+0)
MOVT	R1, #hi_addr(_Pressure_test+0)
MOVW	R0, #lo_addr(_Image54+0)
MOVT	R0, #hi_addr(_Image54+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3941 :: 		Image54.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image54+4)
MOVT	R0, #hi_addr(_Image54+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3942 :: 		Image54.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image54+6)
MOVT	R0, #hi_addr(_Image54+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3943 :: 		Image54.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image54+8)
MOVT	R0, #hi_addr(_Image54+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3944 :: 		Image54.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image54+10)
MOVT	R0, #hi_addr(_Image54+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3945 :: 		Image54.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image54+12)
MOVT	R0, #hi_addr(_Image54+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3946 :: 		Image54.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image54+22)
MOVT	R0, #hi_addr(_Image54+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3947 :: 		Image54.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image54+23)
MOVT	R0, #hi_addr(_Image54+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3948 :: 		Image54.Picture_Name    = icon_back_pressure_bmp;
MOVW	R1, #10674
MOVT	R1, #63
MOVW	R0, #lo_addr(_Image54+16)
MOVT	R0, #hi_addr(_Image54+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3949 :: 		Image54.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image54+20)
MOVT	R0, #hi_addr(_Image54+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3950 :: 		Image54.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image54+21)
MOVT	R0, #hi_addr(_Image54+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3951 :: 		Image54.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image54+24)
MOVT	R0, #hi_addr(_Image54+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3952 :: 		Image54.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image54+28)
MOVT	R0, #hi_addr(_Image54+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3953 :: 		Image54.OnClickPtr      = doPrevScreen;
MOVW	R1, #lo_addr(_doPrevScreen+0)
MOVT	R1, #hi_addr(_doPrevScreen+0)
MOVW	R0, #lo_addr(_Image54+32)
MOVT	R0, #hi_addr(_Image54+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3954 :: 		Image54.OnPressPtr      = doPrevScreen;
MOVW	R1, #lo_addr(_doPrevScreen+0)
MOVT	R1, #hi_addr(_doPrevScreen+0)
MOVW	R0, #lo_addr(_Image54+36)
MOVT	R0, #hi_addr(_Image54+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3956 :: 		Label38.OwnerScreen     = &Pressure_test;
MOVW	R1, #lo_addr(_Pressure_test+0)
MOVT	R1, #hi_addr(_Pressure_test+0)
MOVW	R0, #lo_addr(_Label38+0)
MOVT	R0, #hi_addr(_Label38+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3957 :: 		Label38.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label38+4)
MOVT	R0, #hi_addr(_Label38+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3958 :: 		Label38.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label38+6)
MOVT	R0, #hi_addr(_Label38+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3959 :: 		Label38.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label38+8)
MOVT	R0, #hi_addr(_Label38+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3960 :: 		Label38.Width           = 226;
MOVS	R1, #226
MOVW	R0, #lo_addr(_Label38+10)
MOVT	R0, #hi_addr(_Label38+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3961 :: 		Label38.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label38+12)
MOVT	R0, #hi_addr(_Label38+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3962 :: 		Label38.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label38+26)
MOVT	R0, #hi_addr(_Label38+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3963 :: 		Label38.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label38+27)
MOVT	R0, #hi_addr(_Label38+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3964 :: 		Label38.Caption         = Label38_Caption;
MOVW	R1, #lo_addr(_Label38_Caption+0)
MOVT	R1, #hi_addr(_Label38_Caption+0)
MOVW	R0, #lo_addr(_Label38+16)
MOVT	R0, #hi_addr(_Label38+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3965 :: 		Label38.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R1, #337
MOVT	R1, #1
MOVW	R0, #lo_addr(_Label38+20)
MOVT	R0, #hi_addr(_Label38+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3966 :: 		Label38.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label38+24)
MOVT	R0, #hi_addr(_Label38+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3967 :: 		Label38.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label38+28)
MOVT	R0, #hi_addr(_Label38+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3968 :: 		Label38.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label38+32)
MOVT	R0, #hi_addr(_Label38+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3969 :: 		Label38.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label38+36)
MOVT	R0, #hi_addr(_Label38+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3970 :: 		Label38.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label38+40)
MOVT	R0, #hi_addr(_Label38+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3972 :: 		Label39.OwnerScreen     = &Pressure_test;
MOVW	R1, #lo_addr(_Pressure_test+0)
MOVT	R1, #hi_addr(_Pressure_test+0)
MOVW	R0, #lo_addr(_Label39+0)
MOVT	R0, #hi_addr(_Label39+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3973 :: 		Label39.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label39+4)
MOVT	R0, #hi_addr(_Label39+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3974 :: 		Label39.Left            = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_Label39+6)
MOVT	R0, #hi_addr(_Label39+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3975 :: 		Label39.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label39+8)
MOVT	R0, #hi_addr(_Label39+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3976 :: 		Label39.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label39+10)
MOVT	R0, #hi_addr(_Label39+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3977 :: 		Label39.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label39+12)
MOVT	R0, #hi_addr(_Label39+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3978 :: 		Label39.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label39+26)
MOVT	R0, #hi_addr(_Label39+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3979 :: 		Label39.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label39+27)
MOVT	R0, #hi_addr(_Label39+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3980 :: 		Label39.Caption         = Label39_Caption;
MOVW	R1, #lo_addr(_Label39_Caption+0)
MOVT	R1, #hi_addr(_Label39_Caption+0)
MOVW	R0, #lo_addr(_Label39+16)
MOVT	R0, #hi_addr(_Label39+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3981 :: 		Label39.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #62775
MOVW	R0, #lo_addr(_Label39+20)
MOVT	R0, #hi_addr(_Label39+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3982 :: 		Label39.Font_Color      = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label39+24)
MOVT	R0, #hi_addr(_Label39+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3983 :: 		Label39.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label39+28)
MOVT	R0, #hi_addr(_Label39+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3984 :: 		Label39.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label39+32)
MOVT	R0, #hi_addr(_Label39+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3985 :: 		Label39.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label39+36)
MOVT	R0, #hi_addr(_Label39+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3986 :: 		Label39.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label39+40)
MOVT	R0, #hi_addr(_Label39+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3988 :: 		Label40.OwnerScreen     = &Pressure_test;
MOVW	R1, #lo_addr(_Pressure_test+0)
MOVT	R1, #hi_addr(_Pressure_test+0)
MOVW	R0, #lo_addr(_Label40+0)
MOVT	R0, #hi_addr(_Label40+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3989 :: 		Label40.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label40+4)
MOVT	R0, #hi_addr(_Label40+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3990 :: 		Label40.Left            = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Label40+6)
MOVT	R0, #hi_addr(_Label40+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3991 :: 		Label40.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label40+8)
MOVT	R0, #hi_addr(_Label40+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3992 :: 		Label40.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label40+10)
MOVT	R0, #hi_addr(_Label40+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3993 :: 		Label40.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label40+12)
MOVT	R0, #hi_addr(_Label40+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3994 :: 		Label40.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label40+26)
MOVT	R0, #hi_addr(_Label40+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3995 :: 		Label40.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label40+27)
MOVT	R0, #hi_addr(_Label40+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,3996 :: 		Label40.Caption         = Label40_Caption;
MOVW	R1, #lo_addr(_Label40_Caption+0)
MOVT	R1, #hi_addr(_Label40_Caption+0)
MOVW	R0, #lo_addr(_Label40+16)
MOVT	R0, #hi_addr(_Label40+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3997 :: 		Label40.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #62775
MOVW	R0, #lo_addr(_Label40+20)
MOVT	R0, #hi_addr(_Label40+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,3998 :: 		Label40.Font_Color      = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label40+24)
MOVT	R0, #hi_addr(_Label40+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,3999 :: 		Label40.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label40+28)
MOVT	R0, #hi_addr(_Label40+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4000 :: 		Label40.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label40+32)
MOVT	R0, #hi_addr(_Label40+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4001 :: 		Label40.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label40+36)
MOVT	R0, #hi_addr(_Label40+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4002 :: 		Label40.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label40+40)
MOVT	R0, #hi_addr(_Label40+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4004 :: 		Label41.OwnerScreen     = &Pressure_test;
MOVW	R1, #lo_addr(_Pressure_test+0)
MOVT	R1, #hi_addr(_Pressure_test+0)
MOVW	R0, #lo_addr(_Label41+0)
MOVT	R0, #hi_addr(_Label41+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4005 :: 		Label41.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label41+4)
MOVT	R0, #hi_addr(_Label41+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4006 :: 		Label41.Left            = 375;
MOVW	R1, #375
MOVW	R0, #lo_addr(_Label41+6)
MOVT	R0, #hi_addr(_Label41+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4007 :: 		Label41.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label41+8)
MOVT	R0, #hi_addr(_Label41+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4008 :: 		Label41.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label41+10)
MOVT	R0, #hi_addr(_Label41+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4009 :: 		Label41.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label41+12)
MOVT	R0, #hi_addr(_Label41+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4010 :: 		Label41.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label41+26)
MOVT	R0, #hi_addr(_Label41+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4011 :: 		Label41.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label41+27)
MOVT	R0, #hi_addr(_Label41+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4012 :: 		Label41.Caption         = Label41_Caption;
MOVW	R1, #lo_addr(_Label41_Caption+0)
MOVT	R1, #hi_addr(_Label41_Caption+0)
MOVW	R0, #lo_addr(_Label41+16)
MOVT	R0, #hi_addr(_Label41+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4013 :: 		Label41.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #62775
MOVW	R0, #lo_addr(_Label41+20)
MOVT	R0, #hi_addr(_Label41+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4014 :: 		Label41.Font_Color      = 0x0400;
MOVW	R1, #1024
MOVW	R0, #lo_addr(_Label41+24)
MOVT	R0, #hi_addr(_Label41+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4015 :: 		Label41.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label41+28)
MOVT	R0, #hi_addr(_Label41+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4016 :: 		Label41.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label41+32)
MOVT	R0, #hi_addr(_Label41+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4017 :: 		Label41.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label41+36)
MOVT	R0, #hi_addr(_Label41+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4018 :: 		Label41.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label41+40)
MOVT	R0, #hi_addr(_Label41+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4020 :: 		Box21.OwnerScreen     = &Humidity_test;
MOVW	R1, #lo_addr(_Humidity_test+0)
MOVT	R1, #hi_addr(_Humidity_test+0)
MOVW	R0, #lo_addr(_Box21+0)
MOVT	R0, #hi_addr(_Box21+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4021 :: 		Box21.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+4)
MOVT	R0, #hi_addr(_Box21+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4022 :: 		Box21.Left            = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box21+6)
MOVT	R0, #hi_addr(_Box21+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4023 :: 		Box21.Top             = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Box21+8)
MOVT	R0, #hi_addr(_Box21+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4024 :: 		Box21.Width           = 265;
MOVW	R1, #265
MOVW	R0, #lo_addr(_Box21+10)
MOVT	R0, #hi_addr(_Box21+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4025 :: 		Box21.Height          = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Box21+12)
MOVT	R0, #hi_addr(_Box21+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4026 :: 		Box21.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box21+14)
MOVT	R0, #hi_addr(_Box21+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4027 :: 		Box21.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+16)
MOVT	R0, #hi_addr(_Box21+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4028 :: 		Box21.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+18)
MOVT	R0, #hi_addr(_Box21+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4029 :: 		Box21.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box21+19)
MOVT	R0, #hi_addr(_Box21+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4030 :: 		Box21.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box21+20)
MOVT	R0, #hi_addr(_Box21+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4031 :: 		Box21.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+21)
MOVT	R0, #hi_addr(_Box21+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4032 :: 		Box21.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+22)
MOVT	R0, #hi_addr(_Box21+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4033 :: 		Box21.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box21+24)
MOVT	R0, #hi_addr(_Box21+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4034 :: 		Box21.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box21+26)
MOVT	R0, #hi_addr(_Box21+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4035 :: 		Box21.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box21+28)
MOVT	R0, #hi_addr(_Box21+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4036 :: 		Box21.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+30)
MOVT	R0, #hi_addr(_Box21+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4037 :: 		Box21.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box21+32)
MOVT	R0, #hi_addr(_Box21+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4038 :: 		Box21.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+36)
MOVT	R0, #hi_addr(_Box21+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4039 :: 		Box21.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+40)
MOVT	R0, #hi_addr(_Box21+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4040 :: 		Box21.OnClickPtr      = doSettings;
MOVW	R1, #lo_addr(_doSettings+0)
MOVT	R1, #hi_addr(_doSettings+0)
MOVW	R0, #lo_addr(_Box21+44)
MOVT	R0, #hi_addr(_Box21+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4041 :: 		Box21.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+48)
MOVT	R0, #hi_addr(_Box21+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4043 :: 		Box22.OwnerScreen     = &Humidity_test;
MOVW	R1, #lo_addr(_Humidity_test+0)
MOVT	R1, #hi_addr(_Humidity_test+0)
MOVW	R0, #lo_addr(_Box22+0)
MOVT	R0, #hi_addr(_Box22+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4044 :: 		Box22.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box22+4)
MOVT	R0, #hi_addr(_Box22+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4045 :: 		Box22.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+6)
MOVT	R0, #hi_addr(_Box22+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4046 :: 		Box22.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Box22+8)
MOVT	R0, #hi_addr(_Box22+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4047 :: 		Box22.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Box22+10)
MOVT	R0, #hi_addr(_Box22+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4048 :: 		Box22.Height          = 207;
MOVS	R1, #207
MOVW	R0, #lo_addr(_Box22+12)
MOVT	R0, #hi_addr(_Box22+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4049 :: 		Box22.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box22+14)
MOVT	R0, #hi_addr(_Box22+14)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4050 :: 		Box22.Pen_Color       = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box22+16)
MOVT	R0, #hi_addr(_Box22+16)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4051 :: 		Box22.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box22+18)
MOVT	R0, #hi_addr(_Box22+18)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4052 :: 		Box22.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box22+19)
MOVT	R0, #hi_addr(_Box22+19)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4053 :: 		Box22.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box22+20)
MOVT	R0, #hi_addr(_Box22+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4054 :: 		Box22.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+21)
MOVT	R0, #hi_addr(_Box22+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4055 :: 		Box22.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+22)
MOVT	R0, #hi_addr(_Box22+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4056 :: 		Box22.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box22+24)
MOVT	R0, #hi_addr(_Box22+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4057 :: 		Box22.Gradient_End_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box22+26)
MOVT	R0, #hi_addr(_Box22+26)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4058 :: 		Box22.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box22+28)
MOVT	R0, #hi_addr(_Box22+28)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4059 :: 		Box22.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+30)
MOVT	R0, #hi_addr(_Box22+30)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4060 :: 		Box22.Press_Color     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box22+32)
MOVT	R0, #hi_addr(_Box22+32)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4061 :: 		Box22.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+36)
MOVT	R0, #hi_addr(_Box22+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4062 :: 		Box22.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+40)
MOVT	R0, #hi_addr(_Box22+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4063 :: 		Box22.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+44)
MOVT	R0, #hi_addr(_Box22+44)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4064 :: 		Box22.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+48)
MOVT	R0, #hi_addr(_Box22+48)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4066 :: 		Image55.OwnerScreen     = &Humidity_test;
MOVW	R1, #lo_addr(_Humidity_test+0)
MOVT	R1, #hi_addr(_Humidity_test+0)
MOVW	R0, #lo_addr(_Image55+0)
MOVT	R0, #hi_addr(_Image55+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4067 :: 		Image55.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image55+4)
MOVT	R0, #hi_addr(_Image55+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4068 :: 		Image55.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image55+6)
MOVT	R0, #hi_addr(_Image55+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4069 :: 		Image55.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image55+8)
MOVT	R0, #hi_addr(_Image55+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4070 :: 		Image55.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image55+10)
MOVT	R0, #hi_addr(_Image55+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4071 :: 		Image55.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image55+12)
MOVT	R0, #hi_addr(_Image55+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4072 :: 		Image55.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image55+22)
MOVT	R0, #hi_addr(_Image55+22)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4073 :: 		Image55.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image55+23)
MOVT	R0, #hi_addr(_Image55+23)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4074 :: 		Image55.Picture_Name    = icon_back_pressure_bmp;
MOVW	R1, #10674
MOVT	R1, #63
MOVW	R0, #lo_addr(_Image55+16)
MOVT	R0, #hi_addr(_Image55+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4075 :: 		Image55.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image55+20)
MOVT	R0, #hi_addr(_Image55+20)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4076 :: 		Image55.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image55+21)
MOVT	R0, #hi_addr(_Image55+21)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4077 :: 		Image55.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image55+24)
MOVT	R0, #hi_addr(_Image55+24)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4078 :: 		Image55.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image55+28)
MOVT	R0, #hi_addr(_Image55+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4079 :: 		Image55.OnClickPtr      = doPrevScreen;
MOVW	R1, #lo_addr(_doPrevScreen+0)
MOVT	R1, #hi_addr(_doPrevScreen+0)
MOVW	R0, #lo_addr(_Image55+32)
MOVT	R0, #hi_addr(_Image55+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4080 :: 		Image55.OnPressPtr      = doPrevScreen;
MOVW	R1, #lo_addr(_doPrevScreen+0)
MOVT	R1, #hi_addr(_doPrevScreen+0)
MOVW	R0, #lo_addr(_Image55+36)
MOVT	R0, #hi_addr(_Image55+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4082 :: 		Label42.OwnerScreen     = &Humidity_test;
MOVW	R1, #lo_addr(_Humidity_test+0)
MOVT	R1, #hi_addr(_Humidity_test+0)
MOVW	R0, #lo_addr(_Label42+0)
MOVT	R0, #hi_addr(_Label42+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4083 :: 		Label42.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label42+4)
MOVT	R0, #hi_addr(_Label42+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4084 :: 		Label42.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label42+6)
MOVT	R0, #hi_addr(_Label42+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4085 :: 		Label42.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label42+8)
MOVT	R0, #hi_addr(_Label42+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4086 :: 		Label42.Width           = 227;
MOVS	R1, #227
MOVW	R0, #lo_addr(_Label42+10)
MOVT	R0, #hi_addr(_Label42+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4087 :: 		Label42.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label42+12)
MOVT	R0, #hi_addr(_Label42+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4088 :: 		Label42.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label42+26)
MOVT	R0, #hi_addr(_Label42+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4089 :: 		Label42.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label42+27)
MOVT	R0, #hi_addr(_Label42+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4090 :: 		Label42.Caption         = Label42_Caption;
MOVW	R1, #lo_addr(_Label42_Caption+0)
MOVT	R1, #hi_addr(_Label42_Caption+0)
MOVW	R0, #lo_addr(_Label42+16)
MOVT	R0, #hi_addr(_Label42+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4091 :: 		Label42.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R1, #337
MOVT	R1, #1
MOVW	R0, #lo_addr(_Label42+20)
MOVT	R0, #hi_addr(_Label42+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4092 :: 		Label42.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label42+24)
MOVT	R0, #hi_addr(_Label42+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4093 :: 		Label42.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label42+28)
MOVT	R0, #hi_addr(_Label42+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4094 :: 		Label42.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label42+32)
MOVT	R0, #hi_addr(_Label42+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4095 :: 		Label42.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label42+36)
MOVT	R0, #hi_addr(_Label42+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4096 :: 		Label42.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label42+40)
MOVT	R0, #hi_addr(_Label42+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4098 :: 		Label43.OwnerScreen     = &Humidity_test;
MOVW	R1, #lo_addr(_Humidity_test+0)
MOVT	R1, #hi_addr(_Humidity_test+0)
MOVW	R0, #lo_addr(_Label43+0)
MOVT	R0, #hi_addr(_Label43+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4099 :: 		Label43.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label43+4)
MOVT	R0, #hi_addr(_Label43+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4100 :: 		Label43.Left            = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_Label43+6)
MOVT	R0, #hi_addr(_Label43+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4101 :: 		Label43.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label43+8)
MOVT	R0, #hi_addr(_Label43+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4102 :: 		Label43.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label43+10)
MOVT	R0, #hi_addr(_Label43+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4103 :: 		Label43.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label43+12)
MOVT	R0, #hi_addr(_Label43+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4104 :: 		Label43.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label43+26)
MOVT	R0, #hi_addr(_Label43+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4105 :: 		Label43.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label43+27)
MOVT	R0, #hi_addr(_Label43+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4106 :: 		Label43.Caption         = Label43_Caption;
MOVW	R1, #lo_addr(_Label43_Caption+0)
MOVT	R1, #hi_addr(_Label43_Caption+0)
MOVW	R0, #lo_addr(_Label43+16)
MOVT	R0, #hi_addr(_Label43+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4107 :: 		Label43.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #62775
MOVW	R0, #lo_addr(_Label43+20)
MOVT	R0, #hi_addr(_Label43+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4108 :: 		Label43.Font_Color      = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label43+24)
MOVT	R0, #hi_addr(_Label43+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4109 :: 		Label43.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label43+28)
MOVT	R0, #hi_addr(_Label43+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4110 :: 		Label43.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label43+32)
MOVT	R0, #hi_addr(_Label43+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4111 :: 		Label43.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label43+36)
MOVT	R0, #hi_addr(_Label43+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4112 :: 		Label43.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label43+40)
MOVT	R0, #hi_addr(_Label43+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4114 :: 		Label44.OwnerScreen     = &Humidity_test;
MOVW	R1, #lo_addr(_Humidity_test+0)
MOVT	R1, #hi_addr(_Humidity_test+0)
MOVW	R0, #lo_addr(_Label44+0)
MOVT	R0, #hi_addr(_Label44+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4115 :: 		Label44.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label44+4)
MOVT	R0, #hi_addr(_Label44+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4116 :: 		Label44.Left            = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Label44+6)
MOVT	R0, #hi_addr(_Label44+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4117 :: 		Label44.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label44+8)
MOVT	R0, #hi_addr(_Label44+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4118 :: 		Label44.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label44+10)
MOVT	R0, #hi_addr(_Label44+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4119 :: 		Label44.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label44+12)
MOVT	R0, #hi_addr(_Label44+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4120 :: 		Label44.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label44+26)
MOVT	R0, #hi_addr(_Label44+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4121 :: 		Label44.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label44+27)
MOVT	R0, #hi_addr(_Label44+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4122 :: 		Label44.Caption         = Label44_Caption;
MOVW	R1, #lo_addr(_Label44_Caption+0)
MOVT	R1, #hi_addr(_Label44_Caption+0)
MOVW	R0, #lo_addr(_Label44+16)
MOVT	R0, #hi_addr(_Label44+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4123 :: 		Label44.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #62775
MOVW	R0, #lo_addr(_Label44+20)
MOVT	R0, #hi_addr(_Label44+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4124 :: 		Label44.Font_Color      = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label44+24)
MOVT	R0, #hi_addr(_Label44+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4125 :: 		Label44.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label44+28)
MOVT	R0, #hi_addr(_Label44+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4126 :: 		Label44.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label44+32)
MOVT	R0, #hi_addr(_Label44+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4127 :: 		Label44.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label44+36)
MOVT	R0, #hi_addr(_Label44+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4128 :: 		Label44.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label44+40)
MOVT	R0, #hi_addr(_Label44+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4130 :: 		Label45.OwnerScreen     = &Humidity_test;
MOVW	R1, #lo_addr(_Humidity_test+0)
MOVT	R1, #hi_addr(_Humidity_test+0)
MOVW	R0, #lo_addr(_Label45+0)
MOVT	R0, #hi_addr(_Label45+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4131 :: 		Label45.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label45+4)
MOVT	R0, #hi_addr(_Label45+4)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4132 :: 		Label45.Left            = 375;
MOVW	R1, #375
MOVW	R0, #lo_addr(_Label45+6)
MOVT	R0, #hi_addr(_Label45+6)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4133 :: 		Label45.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label45+8)
MOVT	R0, #hi_addr(_Label45+8)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4134 :: 		Label45.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label45+10)
MOVT	R0, #hi_addr(_Label45+10)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4135 :: 		Label45.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label45+12)
MOVT	R0, #hi_addr(_Label45+12)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4136 :: 		Label45.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label45+26)
MOVT	R0, #hi_addr(_Label45+26)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4137 :: 		Label45.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label45+27)
MOVT	R0, #hi_addr(_Label45+27)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4138 :: 		Label45.Caption         = Label45_Caption;
MOVW	R1, #lo_addr(_Label45_Caption+0)
MOVT	R1, #hi_addr(_Label45_Caption+0)
MOVW	R0, #lo_addr(_Label45+16)
MOVT	R0, #hi_addr(_Label45+16)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4139 :: 		Label45.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R1, #62775
MOVW	R0, #lo_addr(_Label45+20)
MOVT	R0, #hi_addr(_Label45+20)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4140 :: 		Label45.Font_Color      = 0x0400;
MOVW	R1, #1024
MOVW	R0, #lo_addr(_Label45+24)
MOVT	R0, #hi_addr(_Label45+24)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,4141 :: 		Label45.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label45+28)
MOVT	R0, #hi_addr(_Label45+28)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4142 :: 		Label45.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label45+32)
MOVT	R0, #hi_addr(_Label45+32)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4143 :: 		Label45.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label45+36)
MOVT	R0, #hi_addr(_Label45+36)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4144 :: 		Label45.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label45+40)
MOVT	R0, #hi_addr(_Label45+40)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4145 :: 		}
L_end_InitializeObjects:
BX	LR
; end of Ducati_logger_driver_InitializeObjects
Ducati_logger_driver_IsInsideObject:
;Ducati_logger_driver.c,4147 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
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
;Ducati_logger_driver.c,4148 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
CMP	R2, R0
IT	HI
BHI	L_Ducati_logger_driver_IsInsideObject265
ADDS	R4, R2, R5
UXTH	R4, R4
; Left end address is: 8 (R2)
; Width end address is: 20 (R5)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R0
IT	CC
BCC	L_Ducati_logger_driver_IsInsideObject264
; X end address is: 0 (R0)
;Ducati_logger_driver.c,4149 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
CMP	R3, R1
IT	HI
BHI	L_Ducati_logger_driver_IsInsideObject263
ADDS	R4, R3, R6
UXTH	R4, R4
; Top end address is: 12 (R3)
; Height end address is: 24 (R6)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R1
IT	CC
BCC	L_Ducati_logger_driver_IsInsideObject262
; Y end address is: 4 (R1)
L_Ducati_logger_driver_IsInsideObject261:
;Ducati_logger_driver.c,4150 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_IsInsideObject
;Ducati_logger_driver.c,4148 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
L_Ducati_logger_driver_IsInsideObject265:
L_Ducati_logger_driver_IsInsideObject264:
;Ducati_logger_driver.c,4149 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
L_Ducati_logger_driver_IsInsideObject263:
L_Ducati_logger_driver_IsInsideObject262:
;Ducati_logger_driver.c,4152 :: 		return 0;
MOVS	R0, #0
;Ducati_logger_driver.c,4153 :: 		}
L_end_IsInsideObject:
BX	LR
; end of Ducati_logger_driver_IsInsideObject
_DrawRoundButton:
;Ducati_logger_driver.c,4167 :: 		void DrawRoundButton(TButton_Round *Around_button) {
; Around_button start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Around_button end address is: 0 (R0)
; Around_button start address is: 0 (R0)
;Ducati_logger_driver.c,4168 :: 		if (Around_button->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton18
;Ducati_logger_driver.c,4169 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton19
;Ducati_logger_driver.c,4170 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;Ducati_logger_driver.c,4172 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
;Ducati_logger_driver.c,4171 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
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
;Ducati_logger_driver.c,4172 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Ducati_logger_driver.c,4171 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,4173 :: 		}
IT	AL
BAL	L_DrawRoundButton20
L_DrawRoundButton19:
;Ducati_logger_driver.c,4176 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R5, R1
;Ducati_logger_driver.c,4175 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
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
;Ducati_logger_driver.c,4176 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Ducati_logger_driver.c,4175 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,4177 :: 		}
L_DrawRoundButton20:
;Ducati_logger_driver.c,4178 :: 		TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
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
;Ducati_logger_driver.c,4181 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
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
;Ducati_logger_driver.c,4180 :: 		Around_button->Left + Around_button->Width - 2,
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #2
;Ducati_logger_driver.c,4179 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ADDS	R2, R2, #1
ADDS	R1, R4, #1
;Ducati_logger_driver.c,4181 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
STR	R0, [SP, #4]
;Ducati_logger_driver.c,4179 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
UXTH	R0, R1
UXTH	R1, R2
;Ducati_logger_driver.c,4180 :: 		Around_button->Left + Around_button->Width - 2,
UXTH	R2, R3
;Ducati_logger_driver.c,4181 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
UXTH	R3, R5
PUSH	(R6)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,4182 :: 		TFT_Set_Ext_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
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
;Ducati_logger_driver.c,4183 :: 		TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
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
;Ducati_logger_driver.c,4184 :: 		if (Around_button->TextAlign == _taLeft)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRoundButton21
;Ducati_logger_driver.c,4185 :: 		TFT_Write_Text(Around_button->Caption, Around_button->Left + 4, (Around_button->Top + ((Around_button->Height - caption_height) / 2)));
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
;Ducati_logger_driver.c,4186 :: 		else if (Around_button->TextAlign == _taCenter)
; Around_button start address is: 0 (R0)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton23
;Ducati_logger_driver.c,4187 :: 		TFT_Write_Text(Around_button->Caption, (Around_button->Left + (Around_button->Width - caption_length) / 2), (Around_button->Top + ((Around_button->Height - caption_height) / 2)));
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
;Ducati_logger_driver.c,4188 :: 		else if (Around_button->TextAlign == _taRight)
; Around_button start address is: 0 (R0)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawRoundButton25
;Ducati_logger_driver.c,4189 :: 		TFT_Write_Text(Around_button->Caption, Around_button->Left + (Around_button->Width - caption_length - 4), (Around_button->Top + (Around_button->Height - caption_height) / 2));
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
;Ducati_logger_driver.c,4190 :: 		}
L_DrawRoundButton18:
;Ducati_logger_driver.c,4191 :: 		}
L_end_DrawRoundButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawRoundButton
_DrawLabel:
;Ducati_logger_driver.c,4193 :: 		void DrawLabel(TLabel *ALabel) {
; ALabel start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ALabel end address is: 0 (R0)
; ALabel start address is: 0 (R0)
;Ducati_logger_driver.c,4194 :: 		if (ALabel->Visible == 1) {
ADDW	R1, R0, #26
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawLabel26
;Ducati_logger_driver.c,4195 :: 		TFT_Set_Ext_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
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
;Ducati_logger_driver.c,4196 :: 		TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
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
;Ducati_logger_driver.c,4197 :: 		}
L_DrawLabel26:
;Ducati_logger_driver.c,4198 :: 		}
L_end_DrawLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawLabel
_DrawImage:
;Ducati_logger_driver.c,4200 :: 		void DrawImage(TImage *AImage) {
; AImage start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; AImage end address is: 0 (R0)
; AImage start address is: 0 (R0)
;Ducati_logger_driver.c,4201 :: 		if (AImage->Visible) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawImage27
;Ducati_logger_driver.c,4202 :: 		TFT_Ext_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
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
;Ducati_logger_driver.c,4203 :: 		}
L_DrawImage27:
;Ducati_logger_driver.c,4204 :: 		}
L_end_DrawImage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawImage
_DrawCImage:
;Ducati_logger_driver.c,4206 :: 		void DrawCImage(TCImage *AImage) {
; AImage start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; AImage end address is: 0 (R0)
; AImage start address is: 0 (R0)
;Ducati_logger_driver.c,4207 :: 		if (AImage->Visible) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawCImage28
;Ducati_logger_driver.c,4208 :: 		TFT_Ext_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
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
;Ducati_logger_driver.c,4209 :: 		}
L_DrawCImage28:
;Ducati_logger_driver.c,4210 :: 		}
L_end_DrawCImage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawCImage
_DrawCircle:
;Ducati_logger_driver.c,4212 :: 		void DrawCircle(TCircle *ACircle) {
; ACircle start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ACircle end address is: 0 (R0)
; ACircle start address is: 0 (R0)
;Ducati_logger_driver.c,4213 :: 		if (ACircle->Visible == 1) {
ADDW	R1, R0, #16
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircle29
;Ducati_logger_driver.c,4214 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircle30
;Ducati_logger_driver.c,4215 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;Ducati_logger_driver.c,4217 :: 		ACircle->Gradient_End_Color, ACircle->Gradient_Start_Color);
ADDW	R1, R0, #22
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R5, R1
;Ducati_logger_driver.c,4216 :: 		TFT_Set_Brush(ACircle->Transparent, ACircle->Press_Color, ACircle->Gradient, ACircle->Gradient_Orientation,
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
;Ducati_logger_driver.c,4217 :: 		ACircle->Gradient_End_Color, ACircle->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Ducati_logger_driver.c,4216 :: 		TFT_Set_Brush(ACircle->Transparent, ACircle->Press_Color, ACircle->Gradient, ACircle->Gradient_Orientation,
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,4218 :: 		}
IT	AL
BAL	L_DrawCircle31
L_DrawCircle30:
;Ducati_logger_driver.c,4221 :: 		ACircle->Gradient_Start_Color, ACircle->Gradient_End_Color);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #22
LDRH	R1, [R1, #0]
UXTH	R5, R1
;Ducati_logger_driver.c,4220 :: 		TFT_Set_Brush(ACircle->Transparent, ACircle->Color, ACircle->Gradient, ACircle->Gradient_Orientation,
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
;Ducati_logger_driver.c,4221 :: 		ACircle->Gradient_Start_Color, ACircle->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Ducati_logger_driver.c,4220 :: 		TFT_Set_Brush(ACircle->Transparent, ACircle->Color, ACircle->Gradient, ACircle->Gradient_Orientation,
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,4222 :: 		}
L_DrawCircle31:
;Ducati_logger_driver.c,4223 :: 		TFT_Set_Pen(ACircle->Pen_Color, ACircle->Pen_Width);
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
;Ducati_logger_driver.c,4226 :: 		ACircle->Radius);
ADDW	R1, R0, #10
LDRH	R4, [R1, #0]
SXTH	R3, R4
;Ducati_logger_driver.c,4225 :: 		ACircle->Top + ACircle->Radius,
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R2, R1, R4
;Ducati_logger_driver.c,4224 :: 		TFT_Circle(ACircle->Left + ACircle->Radius,
ADDS	R1, R0, #6
; ACircle end address is: 0 (R0)
LDRH	R1, [R1, #0]
ADDS	R1, R1, R4
SXTH	R0, R1
;Ducati_logger_driver.c,4225 :: 		ACircle->Top + ACircle->Radius,
SXTH	R1, R2
;Ducati_logger_driver.c,4226 :: 		ACircle->Radius);
SXTH	R2, R3
BL	_TFT_Circle+0
;Ducati_logger_driver.c,4227 :: 		}
L_DrawCircle29:
;Ducati_logger_driver.c,4228 :: 		}
L_end_DrawCircle:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawCircle
_DrawCircleButton:
;Ducati_logger_driver.c,4230 :: 		void DrawCircleButton(TCircleButton *ACircle_button) {
; ACircle_button start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ACircle_button end address is: 0 (R0)
; ACircle_button start address is: 0 (R0)
;Ducati_logger_driver.c,4231 :: 		if (ACircle_button->Visible == 1) {
ADDW	R1, R0, #16
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircleButton32
;Ducati_logger_driver.c,4232 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircleButton33
;Ducati_logger_driver.c,4233 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;Ducati_logger_driver.c,4235 :: 		ACircle_button->Gradient_End_Color, ACircle_button->Gradient_Start_Color);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #38
LDRH	R1, [R1, #0]
UXTH	R5, R1
;Ducati_logger_driver.c,4234 :: 		TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Press_Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
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
;Ducati_logger_driver.c,4235 :: 		ACircle_button->Gradient_End_Color, ACircle_button->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Ducati_logger_driver.c,4234 :: 		TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Press_Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,4236 :: 		}
IT	AL
BAL	L_DrawCircleButton34
L_DrawCircleButton33:
;Ducati_logger_driver.c,4239 :: 		ACircle_button->Gradient_Start_Color, ACircle_button->Gradient_End_Color);
ADDW	R1, R0, #38
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R5, R1
;Ducati_logger_driver.c,4238 :: 		TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
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
;Ducati_logger_driver.c,4239 :: 		ACircle_button->Gradient_Start_Color, ACircle_button->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Ducati_logger_driver.c,4238 :: 		TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,4240 :: 		}
L_DrawCircleButton34:
;Ducati_logger_driver.c,4241 :: 		TFT_Set_Pen(ACircle_button->Pen_Color, ACircle_button->Pen_Width);
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
;Ducati_logger_driver.c,4244 :: 		ACircle_button->Radius);
ADDW	R1, R0, #10
LDRH	R4, [R1, #0]
SXTH	R3, R4
;Ducati_logger_driver.c,4243 :: 		ACircle_button->Top + ACircle_button->Radius,
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R2, R1, R4
;Ducati_logger_driver.c,4242 :: 		TFT_Circle(ACircle_button->Left + ACircle_button->Radius,
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, R4
;Ducati_logger_driver.c,4244 :: 		ACircle_button->Radius);
STR	R0, [SP, #4]
;Ducati_logger_driver.c,4242 :: 		TFT_Circle(ACircle_button->Left + ACircle_button->Radius,
SXTH	R0, R1
;Ducati_logger_driver.c,4243 :: 		ACircle_button->Top + ACircle_button->Radius,
SXTH	R1, R2
;Ducati_logger_driver.c,4244 :: 		ACircle_button->Radius);
SXTH	R2, R3
BL	_TFT_Circle+0
LDR	R0, [SP, #4]
;Ducati_logger_driver.c,4245 :: 		TFT_Set_Ext_Font(ACircle_button->FontName, ACircle_button->Font_Color, FO_HORIZONTAL);
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
;Ducati_logger_driver.c,4246 :: 		TFT_Write_Text_Return_Pos(ACircle_button->Caption, ACircle_button->Left, ACircle_button->Top);
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
;Ducati_logger_driver.c,4247 :: 		if (ACircle_button->TextAlign == _taLeft)
ADDW	R1, R0, #24
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawCircleButton35
;Ducati_logger_driver.c,4248 :: 		TFT_Write_Text(ACircle_button->Caption, ACircle_button->Left + 4, (ACircle_button->Top + ACircle_button->Radius - caption_height / 2));
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
;Ducati_logger_driver.c,4249 :: 		else if (ACircle_button->TextAlign == _taCenter)
; ACircle_button start address is: 0 (R0)
ADDW	R1, R0, #24
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircleButton37
;Ducati_logger_driver.c,4250 :: 		TFT_Write_Text(ACircle_button->Caption, (ACircle_button->Left + (ACircle_button->Radius*2 - caption_length) / 2), (ACircle_button->Top + ACircle_button->Radius - caption_height / 2));
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
;Ducati_logger_driver.c,4251 :: 		else if (ACircle_button->TextAlign == _taRight)
; ACircle_button start address is: 0 (R0)
ADDW	R1, R0, #24
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawCircleButton39
;Ducati_logger_driver.c,4252 :: 		TFT_Write_Text(ACircle_button->Caption, ACircle_button->Left + (ACircle_button->Radius*2 - caption_length - 4), (ACircle_button->Top + ACircle_button->Radius - caption_height / 2));
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
;Ducati_logger_driver.c,4253 :: 		}
L_DrawCircleButton32:
;Ducati_logger_driver.c,4254 :: 		}
L_end_DrawCircleButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawCircleButton
_DrawBox:
;Ducati_logger_driver.c,4256 :: 		void DrawBox(TBox *ABox) {
; ABox start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ABox end address is: 0 (R0)
; ABox start address is: 0 (R0)
;Ducati_logger_driver.c,4257 :: 		if (ABox->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawBox40
;Ducati_logger_driver.c,4258 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawBox41
;Ducati_logger_driver.c,4259 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;Ducati_logger_driver.c,4260 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
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
;Ducati_logger_driver.c,4261 :: 		}
IT	AL
BAL	L_DrawBox42
L_DrawBox41:
;Ducati_logger_driver.c,4263 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
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
;Ducati_logger_driver.c,4264 :: 		}
L_DrawBox42:
;Ducati_logger_driver.c,4265 :: 		TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
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
;Ducati_logger_driver.c,4266 :: 		TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
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
;Ducati_logger_driver.c,4267 :: 		}
L_DrawBox40:
;Ducati_logger_driver.c,4268 :: 		}
L_end_DrawBox:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawBox
_DrawCBox:
;Ducati_logger_driver.c,4270 :: 		void DrawCBox(TCBox *ABox) {
; ABox start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ABox end address is: 0 (R0)
; ABox start address is: 0 (R0)
;Ducati_logger_driver.c,4271 :: 		if (ABox->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCBox43
;Ducati_logger_driver.c,4272 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCBox44
;Ducati_logger_driver.c,4273 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;Ducati_logger_driver.c,4274 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
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
;Ducati_logger_driver.c,4275 :: 		}
IT	AL
BAL	L_DrawCBox45
L_DrawCBox44:
;Ducati_logger_driver.c,4277 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
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
;Ducati_logger_driver.c,4278 :: 		}
L_DrawCBox45:
;Ducati_logger_driver.c,4279 :: 		TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
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
;Ducati_logger_driver.c,4280 :: 		TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
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
;Ducati_logger_driver.c,4281 :: 		}
L_DrawCBox43:
;Ducati_logger_driver.c,4282 :: 		}
L_end_DrawCBox:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawCBox
_DrawLine:
;Ducati_logger_driver.c,4284 :: 		void DrawLine(TLine *Aline) {
; Aline start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R5, R0
; Aline end address is: 0 (R0)
; Aline start address is: 20 (R5)
;Ducati_logger_driver.c,4285 :: 		if (Aline->Visible == 1) {
ADDW	R1, R5, #15
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawLine46
;Ducati_logger_driver.c,4286 :: 		TFT_Set_Pen(Aline->Color, Aline->Pen_Width);
ADDW	R1, R5, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R5, #16
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
;Ducati_logger_driver.c,4287 :: 		TFT_Line(Aline->First_Point_X, Aline->First_Point_Y, Aline->Second_Point_X, Aline->Second_Point_Y);
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
;Ducati_logger_driver.c,4288 :: 		}
L_DrawLine46:
;Ducati_logger_driver.c,4289 :: 		}
L_end_DrawLine:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawLine
_DrawScreen:
;Ducati_logger_driver.c,4291 :: 		void DrawScreen(TScreen *aScreen) {
; aScreen start address is: 0 (R0)
SUB	SP, SP, #120
STR	LR, [SP, #0]
; aScreen end address is: 0 (R0)
; aScreen start address is: 0 (R0)
;Ducati_logger_driver.c,4313 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;Ducati_logger_driver.c,4314 :: 		order = 0;
MOVS	R1, #0
STRH	R1, [SP, #4]
;Ducati_logger_driver.c,4315 :: 		round_button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #6]
;Ducati_logger_driver.c,4316 :: 		label_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #12]
;Ducati_logger_driver.c,4317 :: 		image_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #20]
;Ducati_logger_driver.c,4318 :: 		cimage_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #28]
;Ducati_logger_driver.c,4319 :: 		circle_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #36]
;Ducati_logger_driver.c,4320 :: 		circle_button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #44]
;Ducati_logger_driver.c,4321 :: 		box_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #52]
;Ducati_logger_driver.c,4322 :: 		cbox_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #60]
;Ducati_logger_driver.c,4323 :: 		line_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #68]
;Ducati_logger_driver.c,4324 :: 		CurrentScreen = aScreen;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
STR	R0, [R1, #0]
;Ducati_logger_driver.c,4326 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
ADDS	R1, R0, #2
; aScreen end address is: 0 (R0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen268
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
BNE	L__DrawScreen267
IT	AL
BAL	L_DrawScreen49
L__DrawScreen268:
L__DrawScreen267:
;Ducati_logger_driver.c,4327 :: 		save_bled = TFT_BLED;
MOVW	R2, #lo_addr(GPIOF_ODR+0)
MOVT	R2, #hi_addr(GPIOF_ODR+0)
STR	R2, [SP, #116]
LDR	R1, [R2, #0]
STRB	R1, [SP, #76]
;Ducati_logger_driver.c,4328 :: 		TFT_BLED           = 0;
MOVS	R1, #0
SXTB	R1, R1
STR	R1, [R2, #0]
;Ducati_logger_driver.c,4329 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
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
;Ducati_logger_driver.c,4330 :: 		TFT_Init(CurrentScreen->Width, CurrentScreen->Height);
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
BL	_TFT_Init+0
;Ducati_logger_driver.c,4331 :: 		STMPE610_SetSize(CurrentScreen->Width, CurrentScreen->Height);
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
;Ducati_logger_driver.c,4332 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
MOVW	R1, #lo_addr(_TFT_Get_Data+0)
MOVT	R1, #hi_addr(_TFT_Get_Data+0)
MOV	R0, R1
BL	_TFT_Set_Ext_Buffer+0
;Ducati_logger_driver.c,4333 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
;Ducati_logger_driver.c,4334 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;Ducati_logger_driver.c,4335 :: 		display_width = CurrentScreen->Width;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
STRH	R2, [R1, #0]
;Ducati_logger_driver.c,4336 :: 		display_height = CurrentScreen->Height;
LDR	R1, [SP, #112]
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
STRH	R2, [R1, #0]
;Ducati_logger_driver.c,4337 :: 		TFT_BLED           = save_bled;
LDRB	R2, [SP, #76]
LDR	R1, [SP, #116]
STR	R2, [R1, #0]
;Ducati_logger_driver.c,4338 :: 		}
IT	AL
BAL	L_DrawScreen50
L_DrawScreen49:
;Ducati_logger_driver.c,4340 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
L_DrawScreen50:
;Ducati_logger_driver.c,4343 :: 		while (order < CurrentScreen->ObjectsCount) {
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
;Ducati_logger_driver.c,4344 :: 		if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #8
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #6]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen53
;Ducati_logger_driver.c,4345 :: 		local_round_button = GetRoundButton(round_button_idx);
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
;Ducati_logger_driver.c,4346 :: 		if (order == local_round_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen54
;Ducati_logger_driver.c,4347 :: 		round_button_idx++;
LDRB	R1, [SP, #6]
ADDS	R1, R1, #1
STRB	R1, [SP, #6]
;Ducati_logger_driver.c,4348 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;Ducati_logger_driver.c,4349 :: 		DrawRoundButton(local_round_button);
LDR	R0, [SP, #8]
BL	_DrawRoundButton+0
;Ducati_logger_driver.c,4350 :: 		}
L_DrawScreen54:
;Ducati_logger_driver.c,4351 :: 		}
L_DrawScreen53:
;Ducati_logger_driver.c,4353 :: 		if (label_idx < CurrentScreen->LabelsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #16
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #12]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen55
;Ducati_logger_driver.c,4354 :: 		local_label = GetLabel(label_idx);
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
;Ducati_logger_driver.c,4355 :: 		if (order == local_label->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen56
;Ducati_logger_driver.c,4356 :: 		label_idx++;
LDRB	R1, [SP, #12]
ADDS	R1, R1, #1
STRB	R1, [SP, #12]
;Ducati_logger_driver.c,4357 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;Ducati_logger_driver.c,4358 :: 		DrawLabel(local_label);
LDR	R0, [SP, #16]
BL	_DrawLabel+0
;Ducati_logger_driver.c,4359 :: 		}
L_DrawScreen56:
;Ducati_logger_driver.c,4360 :: 		}
L_DrawScreen55:
;Ducati_logger_driver.c,4362 :: 		if (circle_idx < CurrentScreen->CirclesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #40
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #36]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen57
;Ducati_logger_driver.c,4363 :: 		local_circle = GetCircle(circle_idx);
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
;Ducati_logger_driver.c,4364 :: 		if (order == local_circle->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen58
;Ducati_logger_driver.c,4365 :: 		circle_idx++;
LDRB	R1, [SP, #36]
ADDS	R1, R1, #1
STRB	R1, [SP, #36]
;Ducati_logger_driver.c,4366 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;Ducati_logger_driver.c,4367 :: 		DrawCircle(local_circle);
LDR	R0, [SP, #40]
BL	_DrawCircle+0
;Ducati_logger_driver.c,4368 :: 		}
L_DrawScreen58:
;Ducati_logger_driver.c,4369 :: 		}
L_DrawScreen57:
;Ducati_logger_driver.c,4371 :: 		if (circle_button_idx < CurrentScreen->CircleButtonsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #48
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #44]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen59
;Ducati_logger_driver.c,4372 :: 		local_circle_button = GetCircleButton(circle_button_idx);
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
;Ducati_logger_driver.c,4373 :: 		if (order == local_circle_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen60
;Ducati_logger_driver.c,4374 :: 		circle_button_idx++;
LDRB	R1, [SP, #44]
ADDS	R1, R1, #1
STRB	R1, [SP, #44]
;Ducati_logger_driver.c,4375 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;Ducati_logger_driver.c,4376 :: 		DrawCircleButton(local_circle_button);
LDR	R0, [SP, #48]
BL	_DrawCircleButton+0
;Ducati_logger_driver.c,4377 :: 		}
L_DrawScreen60:
;Ducati_logger_driver.c,4378 :: 		}
L_DrawScreen59:
;Ducati_logger_driver.c,4380 :: 		if (box_idx < CurrentScreen->BoxesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #56
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #52]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen61
;Ducati_logger_driver.c,4381 :: 		local_box = GetBox(box_idx);
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
;Ducati_logger_driver.c,4382 :: 		if (order == local_box->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen62
;Ducati_logger_driver.c,4383 :: 		box_idx++;
LDRB	R1, [SP, #52]
ADDS	R1, R1, #1
STRB	R1, [SP, #52]
;Ducati_logger_driver.c,4384 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;Ducati_logger_driver.c,4385 :: 		DrawBox(local_box);
LDR	R0, [SP, #56]
BL	_DrawBox+0
;Ducati_logger_driver.c,4386 :: 		}
L_DrawScreen62:
;Ducati_logger_driver.c,4387 :: 		}
L_DrawScreen61:
;Ducati_logger_driver.c,4389 :: 		if (cbox_idx < CurrentScreen->CBoxesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #64
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #60]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen63
;Ducati_logger_driver.c,4390 :: 		local_cbox = GetCBox(cbox_idx);
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
;Ducati_logger_driver.c,4391 :: 		if (order == local_cbox->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen64
;Ducati_logger_driver.c,4392 :: 		cbox_idx++;
LDRB	R1, [SP, #60]
ADDS	R1, R1, #1
STRB	R1, [SP, #60]
;Ducati_logger_driver.c,4393 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;Ducati_logger_driver.c,4394 :: 		DrawCBox(local_cbox);
LDR	R0, [SP, #64]
BL	_DrawCBox+0
;Ducati_logger_driver.c,4395 :: 		}
L_DrawScreen64:
;Ducati_logger_driver.c,4396 :: 		}
L_DrawScreen63:
;Ducati_logger_driver.c,4398 :: 		if (line_idx < CurrentScreen->LinesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #72
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #68]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen65
;Ducati_logger_driver.c,4399 :: 		local_line = GetLine(line_idx);
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
;Ducati_logger_driver.c,4400 :: 		if (order == local_line->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen66
;Ducati_logger_driver.c,4401 :: 		line_idx++;
LDRB	R1, [SP, #68]
ADDS	R1, R1, #1
STRB	R1, [SP, #68]
;Ducati_logger_driver.c,4402 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;Ducati_logger_driver.c,4403 :: 		DrawLine(local_line);
LDR	R0, [SP, #72]
BL	_DrawLine+0
;Ducati_logger_driver.c,4404 :: 		}
L_DrawScreen66:
;Ducati_logger_driver.c,4405 :: 		}
L_DrawScreen65:
;Ducati_logger_driver.c,4407 :: 		if (image_idx < CurrentScreen->ImagesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #24
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #20]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen67
;Ducati_logger_driver.c,4408 :: 		local_image = GetImage(image_idx);
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
;Ducati_logger_driver.c,4409 :: 		if (order == local_image->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen68
;Ducati_logger_driver.c,4410 :: 		image_idx++;
LDRB	R1, [SP, #20]
ADDS	R1, R1, #1
STRB	R1, [SP, #20]
;Ducati_logger_driver.c,4411 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;Ducati_logger_driver.c,4412 :: 		DrawImage(local_image);
LDR	R0, [SP, #24]
BL	_DrawImage+0
;Ducati_logger_driver.c,4413 :: 		}
L_DrawScreen68:
;Ducati_logger_driver.c,4414 :: 		}
L_DrawScreen67:
;Ducati_logger_driver.c,4416 :: 		if (cimage_idx < CurrentScreen->CImagesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #32
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #28]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen69
;Ducati_logger_driver.c,4417 :: 		local_cimage = GetCImage(cimage_idx);
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
;Ducati_logger_driver.c,4418 :: 		if (order == local_cimage->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen70
;Ducati_logger_driver.c,4419 :: 		cimage_idx++;
LDRB	R1, [SP, #28]
ADDS	R1, R1, #1
STRB	R1, [SP, #28]
;Ducati_logger_driver.c,4420 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;Ducati_logger_driver.c,4421 :: 		DrawCImage(local_cimage);
LDR	R0, [SP, #32]
BL	_DrawCImage+0
;Ducati_logger_driver.c,4422 :: 		}
L_DrawScreen70:
;Ducati_logger_driver.c,4423 :: 		}
L_DrawScreen69:
;Ducati_logger_driver.c,4425 :: 		}
IT	AL
BAL	L_DrawScreen51
L_DrawScreen52:
;Ducati_logger_driver.c,4426 :: 		}
L_end_DrawScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #120
BX	LR
; end of _DrawScreen
_Get_Object:
;Ducati_logger_driver.c,4428 :: 		void Get_Object(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;Ducati_logger_driver.c,4429 :: 		round_button_order  = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4430 :: 		label_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4431 :: 		image_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4432 :: 		cimage_order        = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_cimage_order+0)
MOVT	R2, #hi_addr(_cimage_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4433 :: 		circle_order        = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4434 :: 		circle_button_order = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4435 :: 		box_order           = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4436 :: 		cbox_order          = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_cbox_order+0)
MOVT	R2, #hi_addr(_cbox_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4438 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
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
;Ducati_logger_driver.c,4439 :: 		local_round_button = GetRoundButton(_object_count);
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
;Ducati_logger_driver.c,4440 :: 		if (local_round_button->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object74
;Ducati_logger_driver.c,4442 :: 		local_round_button->Width, local_round_button->Height) == 1) {
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
;Ducati_logger_driver.c,4441 :: 		if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
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
;Ducati_logger_driver.c,4442 :: 		local_round_button->Width, local_round_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	Ducati_logger_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object75
;Ducati_logger_driver.c,4443 :: 		round_button_order = local_round_button->Order;
MOVW	R4, #lo_addr(_local_round_button+0)
MOVT	R4, #hi_addr(_local_round_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4444 :: 		exec_round_button = local_round_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4445 :: 		}
L_Get_Object75:
;Ducati_logger_driver.c,4446 :: 		}
L_Get_Object74:
;Ducati_logger_driver.c,4438 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;Ducati_logger_driver.c,4447 :: 		}
IT	AL
BAL	L_Get_Object71
L_Get_Object72:
;Ducati_logger_driver.c,4450 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
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
;Ducati_logger_driver.c,4451 :: 		local_label = GetLabel(_object_count);
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
;Ducati_logger_driver.c,4452 :: 		if (local_label->Active == 1) {
ADDW	R2, R3, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object79
;Ducati_logger_driver.c,4454 :: 		local_label->Width, local_label->Height) == 1) {
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
;Ducati_logger_driver.c,4453 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
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
;Ducati_logger_driver.c,4454 :: 		local_label->Width, local_label->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	Ducati_logger_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object80
;Ducati_logger_driver.c,4455 :: 		label_order = local_label->Order;
MOVW	R4, #lo_addr(_local_label+0)
MOVT	R4, #hi_addr(_local_label+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4456 :: 		exec_label = local_label;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4457 :: 		}
L_Get_Object80:
;Ducati_logger_driver.c,4458 :: 		}
L_Get_Object79:
;Ducati_logger_driver.c,4450 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;Ducati_logger_driver.c,4459 :: 		}
IT	AL
BAL	L_Get_Object76
L_Get_Object77:
;Ducati_logger_driver.c,4462 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
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
;Ducati_logger_driver.c,4463 :: 		local_image = GetImage(_object_count);
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
;Ducati_logger_driver.c,4464 :: 		if (local_image->Active == 1) {
ADDW	R2, R3, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object84
;Ducati_logger_driver.c,4466 :: 		local_image->Width, local_image->Height) == 1) {
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
;Ducati_logger_driver.c,4465 :: 		if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
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
;Ducati_logger_driver.c,4466 :: 		local_image->Width, local_image->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	Ducati_logger_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object85
;Ducati_logger_driver.c,4467 :: 		image_order = local_image->Order;
MOVW	R4, #lo_addr(_local_image+0)
MOVT	R4, #hi_addr(_local_image+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4468 :: 		exec_image = local_image;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4469 :: 		}
L_Get_Object85:
;Ducati_logger_driver.c,4470 :: 		}
L_Get_Object84:
;Ducati_logger_driver.c,4462 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;Ducati_logger_driver.c,4471 :: 		}
IT	AL
BAL	L_Get_Object81
L_Get_Object82:
;Ducati_logger_driver.c,4474 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CImagesCount ; _object_count++ ) {
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
;Ducati_logger_driver.c,4475 :: 		local_cimage = GetCImage(_object_count);
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
;Ducati_logger_driver.c,4476 :: 		if (local_cimage->Active == 1) {
ADDW	R2, R3, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object89
;Ducati_logger_driver.c,4478 :: 		local_cimage->Width, local_cimage->Height) == 1) {
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
;Ducati_logger_driver.c,4477 :: 		if (IsInsideObject(X, Y, local_cimage->Left, local_cimage->Top,
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
;Ducati_logger_driver.c,4478 :: 		local_cimage->Width, local_cimage->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	Ducati_logger_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object90
;Ducati_logger_driver.c,4479 :: 		cimage_order = local_cimage->Order;
MOVW	R4, #lo_addr(_local_cimage+0)
MOVT	R4, #hi_addr(_local_cimage+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_cimage_order+0)
MOVT	R2, #hi_addr(_cimage_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4480 :: 		exec_cimage = local_cimage;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_cimage+0)
MOVT	R2, #hi_addr(_exec_cimage+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4481 :: 		}
L_Get_Object90:
;Ducati_logger_driver.c,4482 :: 		}
L_Get_Object89:
;Ducati_logger_driver.c,4474 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CImagesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;Ducati_logger_driver.c,4483 :: 		}
IT	AL
BAL	L_Get_Object86
L_Get_Object87:
;Ducati_logger_driver.c,4486 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CirclesCount ; _object_count++ ) {
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
;Ducati_logger_driver.c,4487 :: 		local_circle = GetCircle(_object_count);
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
;Ducati_logger_driver.c,4488 :: 		if (local_circle->Active == 1) {
ADDW	R2, R3, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object94
;Ducati_logger_driver.c,4490 :: 		(local_circle->Radius * 2), (local_circle->Radius * 2)) == 1) {
MOVW	R5, #lo_addr(_local_circle+0)
MOVT	R5, #hi_addr(_local_circle+0)
LDR	R2, [R5, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
LSLS	R4, R2, #1
UXTH	R4, R4
;Ducati_logger_driver.c,4489 :: 		if (IsInsideObject(X, Y, local_circle->Left, local_circle->Top,
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
;Ducati_logger_driver.c,4490 :: 		(local_circle->Radius * 2), (local_circle->Radius * 2)) == 1) {
PUSH	(R4)
PUSH	(R4)
BL	Ducati_logger_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object95
;Ducati_logger_driver.c,4491 :: 		circle_order = local_circle->Order;
MOVW	R4, #lo_addr(_local_circle+0)
MOVT	R4, #hi_addr(_local_circle+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4492 :: 		exec_circle = local_circle;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4493 :: 		}
L_Get_Object95:
;Ducati_logger_driver.c,4494 :: 		}
L_Get_Object94:
;Ducati_logger_driver.c,4486 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CirclesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;Ducati_logger_driver.c,4495 :: 		}
IT	AL
BAL	L_Get_Object91
L_Get_Object92:
;Ducati_logger_driver.c,4498 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CircleButtonsCount ; _object_count++ ) {
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
;Ducati_logger_driver.c,4499 :: 		local_circle_button = GetCircleButton(_object_count);
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
;Ducati_logger_driver.c,4500 :: 		if (local_circle_button->Active == 1) {
ADDW	R2, R3, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object99
;Ducati_logger_driver.c,4502 :: 		(local_circle_button->Radius * 2), (local_circle_button->Radius * 2)) == 1) {
MOVW	R5, #lo_addr(_local_circle_button+0)
MOVT	R5, #hi_addr(_local_circle_button+0)
LDR	R2, [R5, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
LSLS	R4, R2, #1
UXTH	R4, R4
;Ducati_logger_driver.c,4501 :: 		if (IsInsideObject(X, Y, local_circle_button->Left, local_circle_button->Top,
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
;Ducati_logger_driver.c,4502 :: 		(local_circle_button->Radius * 2), (local_circle_button->Radius * 2)) == 1) {
PUSH	(R4)
PUSH	(R4)
BL	Ducati_logger_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object100
;Ducati_logger_driver.c,4503 :: 		circle_button_order = local_circle_button->Order;
MOVW	R4, #lo_addr(_local_circle_button+0)
MOVT	R4, #hi_addr(_local_circle_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4504 :: 		exec_circle_button = local_circle_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4505 :: 		}
L_Get_Object100:
;Ducati_logger_driver.c,4506 :: 		}
L_Get_Object99:
;Ducati_logger_driver.c,4498 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CircleButtonsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;Ducati_logger_driver.c,4507 :: 		}
IT	AL
BAL	L_Get_Object96
L_Get_Object97:
;Ducati_logger_driver.c,4510 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
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
;Ducati_logger_driver.c,4511 :: 		local_box = GetBox(_object_count);
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
;Ducati_logger_driver.c,4512 :: 		if (local_box->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object104
;Ducati_logger_driver.c,4514 :: 		local_box->Width, local_box->Height) == 1) {
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
;Ducati_logger_driver.c,4513 :: 		if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
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
;Ducati_logger_driver.c,4514 :: 		local_box->Width, local_box->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	Ducati_logger_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object105
;Ducati_logger_driver.c,4515 :: 		box_order = local_box->Order;
MOVW	R4, #lo_addr(_local_box+0)
MOVT	R4, #hi_addr(_local_box+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4516 :: 		exec_box = local_box;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4517 :: 		}
L_Get_Object105:
;Ducati_logger_driver.c,4518 :: 		}
L_Get_Object104:
;Ducati_logger_driver.c,4510 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;Ducati_logger_driver.c,4519 :: 		}
IT	AL
BAL	L_Get_Object101
L_Get_Object102:
;Ducati_logger_driver.c,4522 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CBoxesCount ; _object_count++ ) {
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
;Ducati_logger_driver.c,4523 :: 		local_cbox = GetCBox(_object_count);
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
;Ducati_logger_driver.c,4524 :: 		if (local_cbox->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object109
;Ducati_logger_driver.c,4526 :: 		local_cbox->Width, local_cbox->Height) == 1) {
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
;Ducati_logger_driver.c,4525 :: 		if (IsInsideObject(X, Y, local_cbox->Left, local_cbox->Top,
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
;Ducati_logger_driver.c,4526 :: 		local_cbox->Width, local_cbox->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	Ducati_logger_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object110
;Ducati_logger_driver.c,4527 :: 		cbox_order = local_cbox->Order;
MOVW	R4, #lo_addr(_local_cbox+0)
MOVT	R4, #hi_addr(_local_cbox+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_cbox_order+0)
MOVT	R2, #hi_addr(_cbox_order+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4528 :: 		exec_cbox = local_cbox;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4529 :: 		}
L_Get_Object110:
;Ducati_logger_driver.c,4530 :: 		}
L_Get_Object109:
;Ducati_logger_driver.c,4522 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CBoxesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;Ducati_logger_driver.c,4531 :: 		}
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
IT	AL
BAL	L_Get_Object106
L_Get_Object107:
;Ducati_logger_driver.c,4533 :: 		_object_count = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4534 :: 		if (round_button_order >  _object_count )
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	LE
BLE	L_Get_Object111
;Ducati_logger_driver.c,4535 :: 		_object_count = round_button_order;
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object111:
;Ducati_logger_driver.c,4536 :: 		if (label_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object112
;Ducati_logger_driver.c,4537 :: 		_object_count = label_order;
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object112:
;Ducati_logger_driver.c,4538 :: 		if (image_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object113
;Ducati_logger_driver.c,4539 :: 		_object_count = image_order;
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object113:
;Ducati_logger_driver.c,4540 :: 		if (cimage_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_cimage_order+0)
MOVT	R2, #hi_addr(_cimage_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object114
;Ducati_logger_driver.c,4541 :: 		_object_count = cimage_order;
MOVW	R2, #lo_addr(_cimage_order+0)
MOVT	R2, #hi_addr(_cimage_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object114:
;Ducati_logger_driver.c,4542 :: 		if (circle_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object115
;Ducati_logger_driver.c,4543 :: 		_object_count = circle_order;
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object115:
;Ducati_logger_driver.c,4544 :: 		if (circle_button_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object116
;Ducati_logger_driver.c,4545 :: 		_object_count = circle_button_order;
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object116:
;Ducati_logger_driver.c,4546 :: 		if (box_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object117
;Ducati_logger_driver.c,4547 :: 		_object_count = box_order;
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object117:
;Ducati_logger_driver.c,4548 :: 		if (cbox_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_cbox_order+0)
MOVT	R2, #hi_addr(_cbox_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object118
;Ducati_logger_driver.c,4549 :: 		_object_count = cbox_order;
MOVW	R2, #lo_addr(_cbox_order+0)
MOVT	R2, #hi_addr(_cbox_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object118:
;Ducati_logger_driver.c,4550 :: 		}
L_end_Get_Object:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Get_Object
_Process_TP_Press:
;Ducati_logger_driver.c,4553 :: 		void Process_TP_Press(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;Ducati_logger_driver.c,4554 :: 		exec_round_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4555 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4556 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4557 :: 		exec_cimage         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_cimage+0)
MOVT	R2, #hi_addr(_exec_cimage+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4558 :: 		exec_circle         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4559 :: 		exec_circle_button  = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4560 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4561 :: 		exec_cbox           = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4563 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;Ducati_logger_driver.c,4565 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Press119
;Ducati_logger_driver.c,4566 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press120
;Ducati_logger_driver.c,4567 :: 		if (exec_round_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press121
;Ducati_logger_driver.c,4568 :: 		if (exec_round_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press122
;Ducati_logger_driver.c,4569 :: 		exec_round_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4570 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;Ducati_logger_driver.c,4571 :: 		}
L_Process_TP_Press122:
;Ducati_logger_driver.c,4572 :: 		}
L_Process_TP_Press121:
;Ducati_logger_driver.c,4573 :: 		}
L_Process_TP_Press120:
;Ducati_logger_driver.c,4575 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press123
;Ducati_logger_driver.c,4576 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press124
;Ducati_logger_driver.c,4577 :: 		if (exec_label->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press125
;Ducati_logger_driver.c,4578 :: 		exec_label->OnPressPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4579 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;Ducati_logger_driver.c,4580 :: 		}
L_Process_TP_Press125:
;Ducati_logger_driver.c,4581 :: 		}
L_Process_TP_Press124:
;Ducati_logger_driver.c,4582 :: 		}
L_Process_TP_Press123:
;Ducati_logger_driver.c,4584 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press126
;Ducati_logger_driver.c,4585 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press127
;Ducati_logger_driver.c,4586 :: 		if (exec_image->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press128
;Ducati_logger_driver.c,4587 :: 		exec_image->OnPressPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4588 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;Ducati_logger_driver.c,4589 :: 		}
L_Process_TP_Press128:
;Ducati_logger_driver.c,4590 :: 		}
L_Process_TP_Press127:
;Ducati_logger_driver.c,4591 :: 		}
L_Process_TP_Press126:
;Ducati_logger_driver.c,4593 :: 		if (_object_count == cimage_order) {
MOVW	R2, #lo_addr(_cimage_order+0)
MOVT	R2, #hi_addr(_cimage_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press129
;Ducati_logger_driver.c,4594 :: 		if (exec_cimage->Active == 1) {
MOVW	R2, #lo_addr(_exec_cimage+0)
MOVT	R2, #hi_addr(_exec_cimage+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press130
;Ducati_logger_driver.c,4595 :: 		if (exec_cimage->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_cimage+0)
MOVT	R4, #hi_addr(_exec_cimage+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press131
;Ducati_logger_driver.c,4596 :: 		exec_cimage->OnPressPtr();
MOVW	R4, #lo_addr(_exec_cimage+0)
MOVT	R4, #hi_addr(_exec_cimage+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4597 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;Ducati_logger_driver.c,4598 :: 		}
L_Process_TP_Press131:
;Ducati_logger_driver.c,4599 :: 		}
L_Process_TP_Press130:
;Ducati_logger_driver.c,4600 :: 		}
L_Process_TP_Press129:
;Ducati_logger_driver.c,4602 :: 		if (_object_count == circle_order) {
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press132
;Ducati_logger_driver.c,4603 :: 		if (exec_circle->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press133
;Ducati_logger_driver.c,4604 :: 		if (exec_circle->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press134
;Ducati_logger_driver.c,4605 :: 		exec_circle->OnPressPtr();
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4606 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;Ducati_logger_driver.c,4607 :: 		}
L_Process_TP_Press134:
;Ducati_logger_driver.c,4608 :: 		}
L_Process_TP_Press133:
;Ducati_logger_driver.c,4609 :: 		}
L_Process_TP_Press132:
;Ducati_logger_driver.c,4611 :: 		if (_object_count == circle_button_order) {
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press135
;Ducati_logger_driver.c,4612 :: 		if (exec_circle_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press136
;Ducati_logger_driver.c,4613 :: 		if (exec_circle_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press137
;Ducati_logger_driver.c,4614 :: 		exec_circle_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4615 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;Ducati_logger_driver.c,4616 :: 		}
L_Process_TP_Press137:
;Ducati_logger_driver.c,4617 :: 		}
L_Process_TP_Press136:
;Ducati_logger_driver.c,4618 :: 		}
L_Process_TP_Press135:
;Ducati_logger_driver.c,4620 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press138
;Ducati_logger_driver.c,4621 :: 		if (exec_box->Active == 1) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press139
;Ducati_logger_driver.c,4622 :: 		if (exec_box->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press140
;Ducati_logger_driver.c,4623 :: 		exec_box->OnPressPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4624 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;Ducati_logger_driver.c,4625 :: 		}
L_Process_TP_Press140:
;Ducati_logger_driver.c,4626 :: 		}
L_Process_TP_Press139:
;Ducati_logger_driver.c,4627 :: 		}
L_Process_TP_Press138:
;Ducati_logger_driver.c,4629 :: 		if (_object_count == cbox_order) {
MOVW	R2, #lo_addr(_cbox_order+0)
MOVT	R2, #hi_addr(_cbox_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press141
;Ducati_logger_driver.c,4630 :: 		if (exec_cbox->Active == 1) {
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press142
;Ducati_logger_driver.c,4631 :: 		if (exec_cbox->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_cbox+0)
MOVT	R4, #hi_addr(_exec_cbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press143
;Ducati_logger_driver.c,4632 :: 		exec_cbox->OnPressPtr();
MOVW	R4, #lo_addr(_exec_cbox+0)
MOVT	R4, #hi_addr(_exec_cbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4633 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;Ducati_logger_driver.c,4634 :: 		}
L_Process_TP_Press143:
;Ducati_logger_driver.c,4635 :: 		}
L_Process_TP_Press142:
;Ducati_logger_driver.c,4636 :: 		}
L_Process_TP_Press141:
;Ducati_logger_driver.c,4638 :: 		}
L_Process_TP_Press119:
;Ducati_logger_driver.c,4639 :: 		}
L_end_Process_TP_Press:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Press
_Process_TP_Up:
;Ducati_logger_driver.c,4641 :: 		void Process_TP_Up(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;Ducati_logger_driver.c,4643 :: 		switch (PressedObjectType) {
IT	AL
BAL	L_Process_TP_Up144
;Ducati_logger_driver.c,4645 :: 		case 1: {
L_Process_TP_Up146:
;Ducati_logger_driver.c,4646 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up147
;Ducati_logger_driver.c,4647 :: 		exec_round_button = (TButton_Round*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4648 :: 		if ((exec_round_button->PressColEnabled == 1) && (exec_round_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #47
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L__Process_TP_Up275
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up274
L__Process_TP_Up273:
;Ducati_logger_driver.c,4649 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawRoundButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;Ducati_logger_driver.c,4648 :: 		if ((exec_round_button->PressColEnabled == 1) && (exec_round_button->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up275:
L__Process_TP_Up274:
;Ducati_logger_driver.c,4651 :: 		break;
IT	AL
BAL	L_Process_TP_Up145
;Ducati_logger_driver.c,4652 :: 		}
L_Process_TP_Up147:
;Ducati_logger_driver.c,4653 :: 		break;
IT	AL
BAL	L_Process_TP_Up145
;Ducati_logger_driver.c,4656 :: 		case 4: {
L_Process_TP_Up151:
;Ducati_logger_driver.c,4657 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up152
;Ducati_logger_driver.c,4658 :: 		exec_circle = (TCircle*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4659 :: 		if ((exec_circle->PressColEnabled == 1) && (exec_circle->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L__Process_TP_Up277
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up276
L__Process_TP_Up272:
;Ducati_logger_driver.c,4660 :: 		DrawCircle(exec_circle);
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawCircle+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;Ducati_logger_driver.c,4659 :: 		if ((exec_circle->PressColEnabled == 1) && (exec_circle->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up277:
L__Process_TP_Up276:
;Ducati_logger_driver.c,4662 :: 		break;
IT	AL
BAL	L_Process_TP_Up145
;Ducati_logger_driver.c,4663 :: 		}
L_Process_TP_Up152:
;Ducati_logger_driver.c,4664 :: 		break;
IT	AL
BAL	L_Process_TP_Up145
;Ducati_logger_driver.c,4667 :: 		case 5: {
L_Process_TP_Up156:
;Ducati_logger_driver.c,4668 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up157
;Ducati_logger_driver.c,4669 :: 		exec_circle_button = (TCircleButton*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4670 :: 		if ((exec_circle_button->PressColEnabled == 1) && (exec_circle_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #42
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L__Process_TP_Up279
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up278
L__Process_TP_Up271:
;Ducati_logger_driver.c,4671 :: 		DrawCircleButton(exec_circle_button);
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawCircleButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;Ducati_logger_driver.c,4670 :: 		if ((exec_circle_button->PressColEnabled == 1) && (exec_circle_button->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up279:
L__Process_TP_Up278:
;Ducati_logger_driver.c,4673 :: 		break;
IT	AL
BAL	L_Process_TP_Up145
;Ducati_logger_driver.c,4674 :: 		}
L_Process_TP_Up157:
;Ducati_logger_driver.c,4675 :: 		break;
IT	AL
BAL	L_Process_TP_Up145
;Ducati_logger_driver.c,4678 :: 		case 6: {
L_Process_TP_Up161:
;Ducati_logger_driver.c,4679 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up162
;Ducati_logger_driver.c,4680 :: 		exec_box = (TBox*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4681 :: 		if ((exec_box->PressColEnabled == 1) && (exec_box->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L__Process_TP_Up281
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up280
L__Process_TP_Up270:
;Ducati_logger_driver.c,4682 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawBox+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;Ducati_logger_driver.c,4681 :: 		if ((exec_box->PressColEnabled == 1) && (exec_box->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up281:
L__Process_TP_Up280:
;Ducati_logger_driver.c,4684 :: 		break;
IT	AL
BAL	L_Process_TP_Up145
;Ducati_logger_driver.c,4685 :: 		}
L_Process_TP_Up162:
;Ducati_logger_driver.c,4686 :: 		break;
IT	AL
BAL	L_Process_TP_Up145
;Ducati_logger_driver.c,4689 :: 		case 14: {
L_Process_TP_Up166:
;Ducati_logger_driver.c,4690 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up167
;Ducati_logger_driver.c,4691 :: 		exec_cbox = (TCBox*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4692 :: 		if ((exec_cbox->PressColEnabled == 1) && (exec_cbox->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L__Process_TP_Up283
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up282
L__Process_TP_Up269:
;Ducati_logger_driver.c,4693 :: 		DrawCBox(exec_cbox);
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawCBox+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;Ducati_logger_driver.c,4692 :: 		if ((exec_cbox->PressColEnabled == 1) && (exec_cbox->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up283:
L__Process_TP_Up282:
;Ducati_logger_driver.c,4695 :: 		break;
IT	AL
BAL	L_Process_TP_Up145
;Ducati_logger_driver.c,4696 :: 		}
L_Process_TP_Up167:
;Ducati_logger_driver.c,4697 :: 		break;
IT	AL
BAL	L_Process_TP_Up145
;Ducati_logger_driver.c,4699 :: 		}
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
;Ducati_logger_driver.c,4701 :: 		exec_label          = 0;
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4702 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4703 :: 		exec_cimage          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_cimage+0)
MOVT	R2, #hi_addr(_exec_cimage+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4705 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;Ducati_logger_driver.c,4708 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Up171
;Ducati_logger_driver.c,4710 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up172
;Ducati_logger_driver.c,4711 :: 		if (exec_round_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up173
;Ducati_logger_driver.c,4712 :: 		if (exec_round_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up174
;Ducati_logger_driver.c,4713 :: 		exec_round_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up174:
;Ducati_logger_driver.c,4714 :: 		if (PressedObject == (TPointer)exec_round_button)
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up175
;Ducati_logger_driver.c,4715 :: 		if (exec_round_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up176
;Ducati_logger_driver.c,4716 :: 		exec_round_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up176:
L_Process_TP_Up175:
;Ducati_logger_driver.c,4717 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4718 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4719 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;Ducati_logger_driver.c,4720 :: 		}
L_Process_TP_Up173:
;Ducati_logger_driver.c,4721 :: 		}
L_Process_TP_Up172:
;Ducati_logger_driver.c,4724 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up177
;Ducati_logger_driver.c,4725 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up178
;Ducati_logger_driver.c,4726 :: 		if (exec_label->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up179
;Ducati_logger_driver.c,4727 :: 		exec_label->OnUpPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up179:
;Ducati_logger_driver.c,4728 :: 		if (PressedObject == (TPointer)exec_label)
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up180
;Ducati_logger_driver.c,4729 :: 		if (exec_label->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up181
;Ducati_logger_driver.c,4730 :: 		exec_label->OnClickPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up181:
L_Process_TP_Up180:
;Ducati_logger_driver.c,4731 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4732 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4733 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;Ducati_logger_driver.c,4734 :: 		}
L_Process_TP_Up178:
;Ducati_logger_driver.c,4735 :: 		}
L_Process_TP_Up177:
;Ducati_logger_driver.c,4738 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up182
;Ducati_logger_driver.c,4739 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up183
;Ducati_logger_driver.c,4740 :: 		if (exec_image->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up184
;Ducati_logger_driver.c,4741 :: 		exec_image->OnUpPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up184:
;Ducati_logger_driver.c,4742 :: 		if (PressedObject == (TPointer)exec_image)
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up185
;Ducati_logger_driver.c,4743 :: 		if (exec_image->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up186
;Ducati_logger_driver.c,4744 :: 		exec_image->OnClickPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up186:
L_Process_TP_Up185:
;Ducati_logger_driver.c,4745 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4746 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4747 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;Ducati_logger_driver.c,4748 :: 		}
L_Process_TP_Up183:
;Ducati_logger_driver.c,4749 :: 		}
L_Process_TP_Up182:
;Ducati_logger_driver.c,4752 :: 		if (_object_count == cimage_order) {
MOVW	R2, #lo_addr(_cimage_order+0)
MOVT	R2, #hi_addr(_cimage_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up187
;Ducati_logger_driver.c,4753 :: 		if (exec_cimage->Active == 1) {
MOVW	R2, #lo_addr(_exec_cimage+0)
MOVT	R2, #hi_addr(_exec_cimage+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up188
;Ducati_logger_driver.c,4754 :: 		if (exec_cimage->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_cimage+0)
MOVT	R4, #hi_addr(_exec_cimage+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up189
;Ducati_logger_driver.c,4755 :: 		exec_cimage->OnUpPtr();
MOVW	R4, #lo_addr(_exec_cimage+0)
MOVT	R4, #hi_addr(_exec_cimage+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up189:
;Ducati_logger_driver.c,4756 :: 		if (PressedObject == (TPointer)exec_cimage)
MOVW	R2, #lo_addr(_exec_cimage+0)
MOVT	R2, #hi_addr(_exec_cimage+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up190
;Ducati_logger_driver.c,4757 :: 		if (exec_cimage->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_cimage+0)
MOVT	R4, #hi_addr(_exec_cimage+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up191
;Ducati_logger_driver.c,4758 :: 		exec_cimage->OnClickPtr();
MOVW	R4, #lo_addr(_exec_cimage+0)
MOVT	R4, #hi_addr(_exec_cimage+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up191:
L_Process_TP_Up190:
;Ducati_logger_driver.c,4759 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4760 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4761 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;Ducati_logger_driver.c,4762 :: 		}
L_Process_TP_Up188:
;Ducati_logger_driver.c,4763 :: 		}
L_Process_TP_Up187:
;Ducati_logger_driver.c,4766 :: 		if (_object_count == circle_order) {
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up192
;Ducati_logger_driver.c,4767 :: 		if (exec_circle->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up193
;Ducati_logger_driver.c,4768 :: 		if (exec_circle->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up194
;Ducati_logger_driver.c,4769 :: 		exec_circle->OnUpPtr();
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up194:
;Ducati_logger_driver.c,4770 :: 		if (PressedObject == (TPointer)exec_circle)
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up195
;Ducati_logger_driver.c,4771 :: 		if (exec_circle->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up196
;Ducati_logger_driver.c,4772 :: 		exec_circle->OnClickPtr();
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up196:
L_Process_TP_Up195:
;Ducati_logger_driver.c,4773 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4774 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4775 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;Ducati_logger_driver.c,4776 :: 		}
L_Process_TP_Up193:
;Ducati_logger_driver.c,4777 :: 		}
L_Process_TP_Up192:
;Ducati_logger_driver.c,4780 :: 		if (_object_count == circle_button_order) {
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up197
;Ducati_logger_driver.c,4781 :: 		if (exec_circle_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up198
;Ducati_logger_driver.c,4782 :: 		if (exec_circle_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up199
;Ducati_logger_driver.c,4783 :: 		exec_circle_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up199:
;Ducati_logger_driver.c,4784 :: 		if (PressedObject == (TPointer)exec_circle_button)
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up200
;Ducati_logger_driver.c,4785 :: 		if (exec_circle_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up201
;Ducati_logger_driver.c,4786 :: 		exec_circle_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up201:
L_Process_TP_Up200:
;Ducati_logger_driver.c,4787 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4788 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4789 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;Ducati_logger_driver.c,4790 :: 		}
L_Process_TP_Up198:
;Ducati_logger_driver.c,4791 :: 		}
L_Process_TP_Up197:
;Ducati_logger_driver.c,4794 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up202
;Ducati_logger_driver.c,4795 :: 		if (exec_box->Active == 1) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up203
;Ducati_logger_driver.c,4796 :: 		if (exec_box->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up204
;Ducati_logger_driver.c,4797 :: 		exec_box->OnUpPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up204:
;Ducati_logger_driver.c,4798 :: 		if (PressedObject == (TPointer)exec_box)
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up205
;Ducati_logger_driver.c,4799 :: 		if (exec_box->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up206
;Ducati_logger_driver.c,4800 :: 		exec_box->OnClickPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up206:
L_Process_TP_Up205:
;Ducati_logger_driver.c,4801 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4802 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4803 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;Ducati_logger_driver.c,4804 :: 		}
L_Process_TP_Up203:
;Ducati_logger_driver.c,4805 :: 		}
L_Process_TP_Up202:
;Ducati_logger_driver.c,4808 :: 		if (_object_count == cbox_order) {
MOVW	R2, #lo_addr(_cbox_order+0)
MOVT	R2, #hi_addr(_cbox_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up207
;Ducati_logger_driver.c,4809 :: 		if (exec_cbox->Active == 1) {
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up208
;Ducati_logger_driver.c,4810 :: 		if (exec_cbox->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_cbox+0)
MOVT	R4, #hi_addr(_exec_cbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up209
;Ducati_logger_driver.c,4811 :: 		exec_cbox->OnUpPtr();
MOVW	R4, #lo_addr(_exec_cbox+0)
MOVT	R4, #hi_addr(_exec_cbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up209:
;Ducati_logger_driver.c,4812 :: 		if (PressedObject == (TPointer)exec_cbox)
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up210
;Ducati_logger_driver.c,4813 :: 		if (exec_cbox->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_cbox+0)
MOVT	R4, #hi_addr(_exec_cbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up211
;Ducati_logger_driver.c,4814 :: 		exec_cbox->OnClickPtr();
MOVW	R4, #lo_addr(_exec_cbox+0)
MOVT	R4, #hi_addr(_exec_cbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up211:
L_Process_TP_Up210:
;Ducati_logger_driver.c,4815 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4816 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4817 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;Ducati_logger_driver.c,4818 :: 		}
L_Process_TP_Up208:
;Ducati_logger_driver.c,4819 :: 		}
L_Process_TP_Up207:
;Ducati_logger_driver.c,4821 :: 		}
L_Process_TP_Up171:
;Ducati_logger_driver.c,4822 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4823 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4824 :: 		}
L_end_Process_TP_Up:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Process_TP_Up
_Process_TP_Down:
;Ducati_logger_driver.c,4826 :: 		void Process_TP_Down(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;Ducati_logger_driver.c,4828 :: 		object_pressed      = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;Ducati_logger_driver.c,4829 :: 		exec_round_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4830 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4831 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4832 :: 		exec_cimage         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_cimage+0)
MOVT	R2, #hi_addr(_exec_cimage+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4833 :: 		exec_circle         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4834 :: 		exec_circle_button  = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4835 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4836 :: 		exec_cbox           = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4838 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;Ducati_logger_driver.c,4840 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Down212
;Ducati_logger_driver.c,4841 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down213
;Ducati_logger_driver.c,4842 :: 		if (exec_round_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down214
;Ducati_logger_driver.c,4843 :: 		if (exec_round_button->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #47
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down215
;Ducati_logger_driver.c,4844 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;Ducati_logger_driver.c,4845 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawRoundButton+0
;Ducati_logger_driver.c,4846 :: 		}
L_Process_TP_Down215:
;Ducati_logger_driver.c,4847 :: 		PressedObject = (TPointer)exec_round_button;
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4848 :: 		PressedObjectType = 1;
MOVS	R3, #1
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4849 :: 		if (exec_round_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down216
;Ducati_logger_driver.c,4850 :: 		exec_round_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4851 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;Ducati_logger_driver.c,4852 :: 		}
L_Process_TP_Down216:
;Ducati_logger_driver.c,4853 :: 		}
L_Process_TP_Down214:
;Ducati_logger_driver.c,4854 :: 		}
L_Process_TP_Down213:
;Ducati_logger_driver.c,4856 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down217
;Ducati_logger_driver.c,4857 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down218
;Ducati_logger_driver.c,4858 :: 		PressedObject = (TPointer)exec_label;
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4859 :: 		PressedObjectType = 2;
MOVS	R3, #2
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4860 :: 		if (exec_label->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down219
;Ducati_logger_driver.c,4861 :: 		exec_label->OnDownPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4862 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;Ducati_logger_driver.c,4863 :: 		}
L_Process_TP_Down219:
;Ducati_logger_driver.c,4864 :: 		}
L_Process_TP_Down218:
;Ducati_logger_driver.c,4865 :: 		}
L_Process_TP_Down217:
;Ducati_logger_driver.c,4867 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down220
;Ducati_logger_driver.c,4868 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down221
;Ducati_logger_driver.c,4869 :: 		PressedObject = (TPointer)exec_image;
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4870 :: 		PressedObjectType = 3;
MOVS	R3, #3
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4871 :: 		if (exec_image->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down222
;Ducati_logger_driver.c,4872 :: 		exec_image->OnDownPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4873 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;Ducati_logger_driver.c,4874 :: 		}
L_Process_TP_Down222:
;Ducati_logger_driver.c,4875 :: 		}
L_Process_TP_Down221:
;Ducati_logger_driver.c,4876 :: 		}
L_Process_TP_Down220:
;Ducati_logger_driver.c,4878 :: 		if (_object_count == cimage_order) {
MOVW	R2, #lo_addr(_cimage_order+0)
MOVT	R2, #hi_addr(_cimage_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down223
;Ducati_logger_driver.c,4879 :: 		if (exec_cimage->Active == 1) {
MOVW	R2, #lo_addr(_exec_cimage+0)
MOVT	R2, #hi_addr(_exec_cimage+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down224
;Ducati_logger_driver.c,4880 :: 		PressedObject = (TPointer)exec_cimage;
MOVW	R4, #lo_addr(_exec_cimage+0)
MOVT	R4, #hi_addr(_exec_cimage+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4881 :: 		PressedObjectType = 11;
MOVS	R3, #11
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4882 :: 		if (exec_cimage->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down225
;Ducati_logger_driver.c,4883 :: 		exec_cimage->OnDownPtr();
MOVW	R4, #lo_addr(_exec_cimage+0)
MOVT	R4, #hi_addr(_exec_cimage+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4884 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;Ducati_logger_driver.c,4885 :: 		}
L_Process_TP_Down225:
;Ducati_logger_driver.c,4886 :: 		}
L_Process_TP_Down224:
;Ducati_logger_driver.c,4887 :: 		}
L_Process_TP_Down223:
;Ducati_logger_driver.c,4889 :: 		if (_object_count == circle_order) {
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down226
;Ducati_logger_driver.c,4890 :: 		if (exec_circle->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down227
;Ducati_logger_driver.c,4891 :: 		if (exec_circle->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down228
;Ducati_logger_driver.c,4892 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;Ducati_logger_driver.c,4893 :: 		DrawCircle(exec_circle);
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawCircle+0
;Ducati_logger_driver.c,4894 :: 		}
L_Process_TP_Down228:
;Ducati_logger_driver.c,4895 :: 		PressedObject = (TPointer)exec_circle;
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4896 :: 		PressedObjectType = 4;
MOVS	R3, #4
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4897 :: 		if (exec_circle->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down229
;Ducati_logger_driver.c,4898 :: 		exec_circle->OnDownPtr();
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4899 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;Ducati_logger_driver.c,4900 :: 		}
L_Process_TP_Down229:
;Ducati_logger_driver.c,4901 :: 		}
L_Process_TP_Down227:
;Ducati_logger_driver.c,4902 :: 		}
L_Process_TP_Down226:
;Ducati_logger_driver.c,4904 :: 		if (_object_count == circle_button_order) {
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down230
;Ducati_logger_driver.c,4905 :: 		if (exec_circle_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down231
;Ducati_logger_driver.c,4906 :: 		if (exec_circle_button->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #42
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down232
;Ducati_logger_driver.c,4907 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;Ducati_logger_driver.c,4908 :: 		DrawCircleButton(exec_circle_button);
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawCircleButton+0
;Ducati_logger_driver.c,4909 :: 		}
L_Process_TP_Down232:
;Ducati_logger_driver.c,4910 :: 		PressedObject = (TPointer)exec_circle_button;
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4911 :: 		PressedObjectType = 5;
MOVS	R3, #5
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4912 :: 		if (exec_circle_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down233
;Ducati_logger_driver.c,4913 :: 		exec_circle_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4914 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;Ducati_logger_driver.c,4915 :: 		}
L_Process_TP_Down233:
;Ducati_logger_driver.c,4916 :: 		}
L_Process_TP_Down231:
;Ducati_logger_driver.c,4917 :: 		}
L_Process_TP_Down230:
;Ducati_logger_driver.c,4919 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down234
;Ducati_logger_driver.c,4920 :: 		if (exec_box->Active == 1) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down235
;Ducati_logger_driver.c,4921 :: 		if (exec_box->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down236
;Ducati_logger_driver.c,4922 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;Ducati_logger_driver.c,4923 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawBox+0
;Ducati_logger_driver.c,4924 :: 		}
L_Process_TP_Down236:
;Ducati_logger_driver.c,4925 :: 		PressedObject = (TPointer)exec_box;
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4926 :: 		PressedObjectType = 6;
MOVS	R3, #6
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4927 :: 		if (exec_box->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down237
;Ducati_logger_driver.c,4928 :: 		exec_box->OnDownPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4929 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;Ducati_logger_driver.c,4930 :: 		}
L_Process_TP_Down237:
;Ducati_logger_driver.c,4931 :: 		}
L_Process_TP_Down235:
;Ducati_logger_driver.c,4932 :: 		}
L_Process_TP_Down234:
;Ducati_logger_driver.c,4934 :: 		if (_object_count == cbox_order) {
MOVW	R2, #lo_addr(_cbox_order+0)
MOVT	R2, #hi_addr(_cbox_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down238
;Ducati_logger_driver.c,4935 :: 		if (exec_cbox->Active == 1) {
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down239
;Ducati_logger_driver.c,4936 :: 		if (exec_cbox->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down240
;Ducati_logger_driver.c,4937 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;Ducati_logger_driver.c,4938 :: 		DrawCBox(exec_cbox);
MOVW	R2, #lo_addr(_exec_cbox+0)
MOVT	R2, #hi_addr(_exec_cbox+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawCBox+0
;Ducati_logger_driver.c,4939 :: 		}
L_Process_TP_Down240:
;Ducati_logger_driver.c,4940 :: 		PressedObject = (TPointer)exec_cbox;
MOVW	R4, #lo_addr(_exec_cbox+0)
MOVT	R4, #hi_addr(_exec_cbox+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Ducati_logger_driver.c,4941 :: 		PressedObjectType = 14;
MOVS	R3, #14
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Ducati_logger_driver.c,4942 :: 		if (exec_cbox->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down241
;Ducati_logger_driver.c,4943 :: 		exec_cbox->OnDownPtr();
MOVW	R4, #lo_addr(_exec_cbox+0)
MOVT	R4, #hi_addr(_exec_cbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;Ducati_logger_driver.c,4944 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;Ducati_logger_driver.c,4945 :: 		}
L_Process_TP_Down241:
;Ducati_logger_driver.c,4946 :: 		}
L_Process_TP_Down239:
;Ducati_logger_driver.c,4947 :: 		}
L_Process_TP_Down238:
;Ducati_logger_driver.c,4949 :: 		}
L_Process_TP_Down212:
;Ducati_logger_driver.c,4950 :: 		}
L_end_Process_TP_Down:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Down
_Check_TP:
;Ducati_logger_driver.c,4952 :: 		void Check_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_driver.c,4953 :: 		if (STMPE610_PressDetect()) {
BL	_STMPE610_PressDetect+0
CMP	R0, #0
IT	EQ
BEQ	L_Check_TP242
;Ducati_logger_driver.c,4954 :: 		if (STMPE610_GetLastCoordinates(&Xcoord, &Ycoord) == 0) {
MOVW	R1, #lo_addr(_Ycoord+0)
MOVT	R1, #hi_addr(_Ycoord+0)
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
BL	_STMPE610_GetLastCoordinates+0
CMP	R0, #0
IT	NE
BNE	L_Check_TP243
;Ducati_logger_driver.c,4956 :: 		Process_TP_Press(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Press+0
;Ducati_logger_driver.c,4957 :: 		if (PenDown == 0) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Check_TP244
;Ducati_logger_driver.c,4958 :: 		PenDown = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4959 :: 		Process_TP_Down(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Down+0
;Ducati_logger_driver.c,4960 :: 		}
L_Check_TP244:
;Ducati_logger_driver.c,4961 :: 		}
L_Check_TP243:
;Ducati_logger_driver.c,4962 :: 		}
IT	AL
BAL	L_Check_TP245
L_Check_TP242:
;Ducati_logger_driver.c,4963 :: 		else if (PenDown == 1) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Check_TP246
;Ducati_logger_driver.c,4964 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;Ducati_logger_driver.c,4965 :: 		Process_TP_Up(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Up+0
;Ducati_logger_driver.c,4966 :: 		}
L_Check_TP246:
L_Check_TP245:
;Ducati_logger_driver.c,4967 :: 		}
L_end_Check_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Check_TP
_Init_MCU:
;Ducati_logger_driver.c,4969 :: 		void Init_MCU() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_driver.c,4973 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;Ducati_logger_driver.c,4974 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;Ducati_logger_driver.c,4975 :: 		GPIOB_ODR.B6 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4976 :: 		while (GPIOB_IDR.B7 == 0) {
L_Init_MCU247:
MOVW	R1, #lo_addr(GPIOB_IDR+0)
MOVT	R1, #hi_addr(GPIOB_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_Init_MCU248
;Ducati_logger_driver.c,4977 :: 		GPIOB_ODR.B6 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4978 :: 		Delay_us(10);
MOVW	R7, #498
MOVT	R7, #0
NOP
NOP
L_Init_MCU249:
SUBS	R7, R7, #1
BNE	L_Init_MCU249
NOP
NOP
NOP
;Ducati_logger_driver.c,4979 :: 		GPIOB_ODR.B6 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4980 :: 		Delay_us(10);
MOVW	R7, #498
MOVT	R7, #0
NOP
NOP
L_Init_MCU251:
SUBS	R7, R7, #1
BNE	L_Init_MCU251
NOP
NOP
NOP
;Ducati_logger_driver.c,4981 :: 		}
IT	AL
BAL	L_Init_MCU247
L_Init_MCU248:
;Ducati_logger_driver.c,4982 :: 		I2C1_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB67);
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVW	R0, #6784
MOVT	R0, #6
BL	_I2C1_Init_Advanced+0
;Ducati_logger_driver.c,4984 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;Ducati_logger_driver.c,4985 :: 		GPIO_Digital_Output(&GPIOG_BASE, 0x00FF);
MOVS	R1, #255
MOVW	R0, #lo_addr(GPIOG_BASE+0)
MOVT	R0, #hi_addr(GPIOG_BASE+0)
BL	_GPIO_Digital_Output+0
;Ducati_logger_driver.c,4986 :: 		GPIO_Digital_Output(&GPIOE_BASE, 0xFF00);
MOVW	R1, #65280
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Ducati_logger_driver.c,4987 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;Ducati_logger_driver.c,4988 :: 		GPIOB_ODR.B4 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;Ducati_logger_driver.c,4989 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;Ducati_logger_driver.c,4990 :: 		TFT_Set_MM_Plus();
BL	_TFT_Set_MM_Plus+0
;Ducati_logger_driver.c,4991 :: 		STMPE610_SetDefaultMode();
BL	_STMPE610_SetDefaultMode+0
;Ducati_logger_driver.c,4992 :: 		}
L_end_Init_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_MCU
_Init_Ext_Mem:
;Ducati_logger_driver.c,4994 :: 		void Init_Ext_Mem() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_driver.c,4996 :: 		SDIO_Reset();
BL	_SDIO_Reset+0
;Ducati_logger_driver.c,4999 :: 		| _SDIO_CFG_CLOCK_RISING_EDGE | _SDIO_CFG_HW_FLOW_DISABLE, 125, &_GPIO_MODULE_SDIO_D0_D3);
MOVW	R2, #lo_addr(__GPIO_MODULE_SDIO_D0_D3+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SDIO_D0_D3+0)
MOVS	R1, #125
MOVW	R0, #2048
BL	_SDIO_Init+0
;Ducati_logger_driver.c,5002 :: 		GPIOD_PUPDRbits.PUPDR2 = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOD_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOD_PUPDRbits+0)
LDRB	R0, [R1, #0]
BFI	R0, R2, #4, #2
STRB	R0, [R1, #0]
;Ducati_logger_driver.c,5003 :: 		GPIOC_PUPDRbits.PUPDR8 = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOC_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOC_PUPDRbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #16, #2
STR	R0, [R1, #0]
;Ducati_logger_driver.c,5004 :: 		GPIOC_PUPDRbits.PUPDR9 = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOC_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOC_PUPDRbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #18, #2
STR	R0, [R1, #0]
;Ducati_logger_driver.c,5005 :: 		GPIOC_PUPDRbits.PUPDR10 = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOC_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOC_PUPDRbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #20, #2
STR	R0, [R1, #0]
;Ducati_logger_driver.c,5006 :: 		GPIOC_PUPDRbits.PUPDR11 = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOC_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOC_PUPDRbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #22, #2
STR	R0, [R1, #0]
;Ducati_logger_driver.c,5008 :: 		Mmc_Set_Interface(_MMC_INTERFACE_SDIO);
MOVS	R0, #1
BL	_Mmc_Set_Interface+0
;Ducati_logger_driver.c,5011 :: 		if (!Mmc_Fat_Init()) {
BL	_Mmc_Fat_Init+0
CMP	R0, #0
IT	NE
BNE	L_Init_Ext_Mem253
;Ducati_logger_driver.c,5014 :: 		| _SDIO_CFG_CLOCK_RISING_EDGE | _SDIO_CFG_HW_FLOW_DISABLE, 1, &_GPIO_MODULE_SDIO_D0_D3);
MOVW	R2, #lo_addr(__GPIO_MODULE_SDIO_D0_D3+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SDIO_D0_D3+0)
MOVS	R1, #1
MOVW	R0, #2048
BL	_SDIO_Init+0
;Ducati_logger_driver.c,5017 :: 		Mmc_Fat_Assign("Ducati_l.RES", 0);
MOVW	R0, #lo_addr(?lstr3_Ducati_logger_driver+0)
MOVT	R0, #hi_addr(?lstr3_Ducati_logger_driver+0)
MOVS	R1, #0
BL	_Mmc_Fat_Assign+0
;Ducati_logger_driver.c,5018 :: 		Mmc_Fat_Reset(&res_file_size);
MOVW	R0, #lo_addr(_res_file_size+0)
MOVT	R0, #hi_addr(_res_file_size+0)
BL	_Mmc_Fat_Reset+0
;Ducati_logger_driver.c,5019 :: 		}
L_Init_Ext_Mem253:
;Ducati_logger_driver.c,5020 :: 		}
L_end_Init_Ext_Mem:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_Ext_Mem
_STMPE610_Config:
;Ducati_logger_driver.c,5022 :: 		char STMPE610_Config()  {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_driver.c,5023 :: 		STMPE610_SetI2CAddress(STMPE610_I2C_ADDR1);
MOVS	R0, #136
BL	_STMPE610_SetI2CAddress+0
;Ducati_logger_driver.c,5024 :: 		if (STMPE610_IsOperational() != 0){
BL	_STMPE610_IsOperational+0
CMP	R0, #0
IT	EQ
BEQ	L_STMPE610_Config254
;Ducati_logger_driver.c,5025 :: 		return STMPE610_IO_NOT_OPERATIONAL;
MOVS	R0, #4
IT	AL
BAL	L_end_STMPE610_Config
;Ducati_logger_driver.c,5026 :: 		}
L_STMPE610_Config254:
;Ducati_logger_driver.c,5028 :: 		STMPE610_Reset();
BL	_STMPE610_Reset+0
;Ducati_logger_driver.c,5029 :: 		STMPE610_Module(STMPE610_MODULE_TS | STMPE610_MODULE_ADC, STMPE610_ENABLE);
MOVS	R1, #1
MOVS	R0, #3
BL	_STMPE610_Module+0
;Ducati_logger_driver.c,5030 :: 		STMPE610_AlternateFunction(STMPE610_GPIO_PIN1, STMPE610_ENABLE);
MOVS	R1, #1
MOVS	R0, #2
BL	_STMPE610_AlternateFunction+0
;Ducati_logger_driver.c,5031 :: 		STMPE610_SetGPIOPin(STMPE610_GPIO_PIN1, 0);   // IN1 to "0" -> I2C communication
MOVS	R1, #0
MOVS	R0, #2
BL	_STMPE610_SetGPIOPin+0
;Ducati_logger_driver.c,5032 :: 		STMPE610_SetSize(480,272);
MOVW	R1, #272
MOVW	R0, #480
BL	_STMPE610_SetSize+0
;Ducati_logger_driver.c,5033 :: 		STMPE610_Module(STMPE610_MODULE_TS | STMPE610_MODULE_ADC, STMPE610_ENABLE);
MOVS	R1, #1
MOVS	R0, #3
BL	_STMPE610_Module+0
;Ducati_logger_driver.c,5034 :: 		STMPE610_EnableInterrupt(STMPE610_IE_TOUCH_DET | STMPE610_IE_FIFO_TH | STMPE610_IE_FIFO_0FLOW, STMPE610_ENABLE);
MOVS	R1, #1
MOVS	R0, #7
BL	_STMPE610_EnableInterrupt+0
;Ducati_logger_driver.c,5035 :: 		STMPE610_ConfigureInterrupt(STMPE610_INT_POLARITY_ACTIVE_HIGH | STMPE610_INT_TYPE_EDGE | STMPE610_INT_ENABLE_ALL);
MOVS	R0, #7
BL	_STMPE610_ConfigureInterrupt+0
;Ducati_logger_driver.c,5036 :: 		STMPE610_SetADC(STMPE610_ADC_CTRL1_SAMPLETIME_44 | STMPE610_ADC_CTRL1_ADC_12BIT | STMPE610_ADC_CTRL1_INT_REFERENCE);
MOVS	R0, #20
BL	_STMPE610_SetADC+0
;Ducati_logger_driver.c,5037 :: 		Delay_10ms(); Delay_10ms();
BL	_Delay_10ms+0
BL	_Delay_10ms+0
;Ducati_logger_driver.c,5038 :: 		STMPE610_SetADCClock(STMPE610_ADC_CTRL2_3250_kHZ);
MOVS	R0, #1
BL	_STMPE610_SetADCClock+0
;Ducati_logger_driver.c,5039 :: 		STMPE610_AlternateFunction(STMPE610_GPIO_PIN4 | STMPE610_GPIO_PIN5 | STMPE610_GPIO_PIN6 | STMPE610_GPIO_PIN7, STMPE610_DISABLE);
MOVS	R1, #0
MOVS	R0, #240
BL	_STMPE610_AlternateFunction+0
;Ducati_logger_driver.c,5040 :: 		STMPE610_ConfigureTSC(STMPE610_TSC_CFG_AVE_CTRL_4S, STMPE610_TSC_CFG_TOUCH_DET_DELAY_500uS, STMPE610_TSC_CFG_TOUCH_SETTLING_500uS);
MOVS	R2, #2
MOVS	R1, #24
MOVS	R0, #128
BL	_STMPE610_ConfigureTSC+0
;Ducati_logger_driver.c,5041 :: 		STMPE610_SetFIFOThreshold(1);
MOVS	R0, #1
BL	_STMPE610_SetFIFOThreshold+0
;Ducati_logger_driver.c,5042 :: 		STMPE610_ResetFIFO();
BL	_STMPE610_ResetFIFO+0
;Ducati_logger_driver.c,5043 :: 		STMPE610_TSIDrive(STMPE610_TSC_I_DRIVE_20mA);
MOVS	R0, #0
BL	_STMPE610_TSIDrive+0
;Ducati_logger_driver.c,5044 :: 		STMPE610_TSControl(STMPE610_TSC_CTRL_TRACK0 | STMPE610_TSC_CTRL_ACQU_XYZ | STMPE610_TSC_CTRL_ENABLE);
MOVS	R0, #1
BL	_STMPE610_TSControl+0
;Ducati_logger_driver.c,5045 :: 		STMPE610_ZDataFraction(STMPE610_FRACP4_WHOLP4);
MOVS	R0, #4
BL	_STMPE610_ZDataFraction+0
;Ducati_logger_driver.c,5046 :: 		STMPE610_SetTouchPressureThreshold(70);
MOVS	R0, #70
BL	_STMPE610_SetTouchPressureThreshold+0
;Ducati_logger_driver.c,5047 :: 		STMPE610_ClearInterrupts();
BL	_STMPE610_ClearInterrupts+0
;Ducati_logger_driver.c,5048 :: 		STMPE610_WriteReg(STMPE610_INT_CTRL_REG, 0x01);
MOVS	R1, #1
MOVS	R0, #9
BL	_STMPE610_WriteReg+0
;Ducati_logger_driver.c,5049 :: 		return STMPE610_OK;
MOVS	R0, #0
;Ducati_logger_driver.c,5050 :: 		}
L_end_STMPE610_Config:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _STMPE610_Config
_Start_TP:
;Ducati_logger_driver.c,5053 :: 		void Start_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_driver.c,5054 :: 		Init_MCU();
BL	_Init_MCU+0
;Ducati_logger_driver.c,5056 :: 		Init_Ext_Mem();
BL	_Init_Ext_Mem+0
;Ducati_logger_driver.c,5058 :: 		InitializeTouchPanel();
BL	Ducati_logger_driver_InitializeTouchPanel+0
;Ducati_logger_driver.c,5059 :: 		if (STMPE610_Config() == STMPE610_OK) {
BL	_STMPE610_Config+0
CMP	R0, #0
IT	NE
BNE	L_Start_TP255
;Ducati_logger_driver.c,5060 :: 		} else {
IT	AL
BAL	L_Start_TP256
L_Start_TP255:
;Ducati_logger_driver.c,5061 :: 		while(1);
L_Start_TP257:
IT	AL
BAL	L_Start_TP257
;Ducati_logger_driver.c,5062 :: 		}
L_Start_TP256:
;Ducati_logger_driver.c,5065 :: 		Delay_ms(1000);
MOVW	R7, #61566
MOVT	R7, #762
NOP
NOP
L_Start_TP259:
SUBS	R7, R7, #1
BNE	L_Start_TP259
NOP
NOP
NOP
;Ducati_logger_driver.c,5066 :: 		TFT_Fill_Screen(0);
MOVS	R0, #0
BL	_TFT_Fill_Screen+0
;Ducati_logger_driver.c,5067 :: 		Calibrate();
BL	_Calibrate+0
;Ducati_logger_driver.c,5068 :: 		TFT_Fill_Screen(0);
MOVS	R0, #0
BL	_TFT_Fill_Screen+0
;Ducati_logger_driver.c,5070 :: 		InitializeObjects();
BL	Ducati_logger_driver_InitializeObjects+0
;Ducati_logger_driver.c,5071 :: 		display_width = Tachometer_graphics.Width;
MOVW	R0, #lo_addr(_Tachometer_graphics+2)
MOVT	R0, #hi_addr(_Tachometer_graphics+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_width+0)
MOVT	R0, #hi_addr(_display_width+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,5072 :: 		display_height = Tachometer_graphics.Height;
MOVW	R0, #lo_addr(_Tachometer_graphics+4)
MOVT	R0, #hi_addr(_Tachometer_graphics+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_height+0)
MOVT	R0, #hi_addr(_display_height+0)
STRH	R1, [R0, #0]
;Ducati_logger_driver.c,5073 :: 		DrawScreen(&Tachometer_graphics);
MOVW	R0, #lo_addr(_Tachometer_graphics+0)
MOVT	R0, #hi_addr(_Tachometer_graphics+0)
BL	_DrawScreen+0
;Ducati_logger_driver.c,5074 :: 		}
L_end_Start_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Start_TP
Ducati_logger_driver____?ag:
L_end_Ducati_logger_driver___?ag:
BX	LR
; end of Ducati_logger_driver____?ag
