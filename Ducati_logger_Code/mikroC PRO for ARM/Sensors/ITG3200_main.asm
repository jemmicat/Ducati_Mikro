ITG3200_main_Gyro_Average:
;ITG3200_main.c,44 :: 		static void Gyro_Average() {
SUB	SP, SP, #20
STR	LR, [SP, #0]
;ITG3200_main.c,48 :: 		sx = sy = sz = 0;
; sz start address is: 16 (R4)
MOVS	R4, #0
SXTH	R4, R4
; sy start address is: 20 (R5)
MOVW	R5, #0
SXTH	R5, R5
; sx start address is: 24 (R6)
MOVW	R6, #0
SXTH	R6, R6
;ITG3200_main.c,51 :: 		for (i=0; i<16; i++) {
; i start address is: 12 (R3)
MOVS	R3, #0
SXTH	R3, R3
; sx end address is: 24 (R6)
; sy end address is: 20 (R5)
; sz end address is: 16 (R4)
; i end address is: 12 (R3)
L_ITG3200_main_Gyro_Average0:
; i start address is: 12 (R3)
; sx start address is: 24 (R6)
; sy start address is: 20 (R5)
; sz start address is: 16 (R4)
CMP	R3, #16
IT	GE
BGE	L_ITG3200_main_Gyro_Average1
;ITG3200_main.c,52 :: 		ITG3200_Read(&xx, &yy, &zz);
ADD	R2, SP, #16
ADD	R1, SP, #14
ADD	R0, SP, #12
STRH	R4, [SP, #4]
STRH	R5, [SP, #6]
STRH	R6, [SP, #8]
STRH	R3, [SP, #10]
BL	_ITG3200_Read+0
LDRSH	R3, [SP, #10]
LDRSH	R6, [SP, #8]
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #4]
;ITG3200_main.c,53 :: 		sx += xx;
LDRSH	R0, [SP, #12]
ADDS	R6, R6, R0
SXTH	R6, R6
;ITG3200_main.c,54 :: 		sy += yy;
LDRSH	R0, [SP, #14]
ADDS	R5, R5, R0
SXTH	R5, R5
;ITG3200_main.c,55 :: 		sz += zz;
LDRSH	R0, [SP, #16]
ADDS	R4, R4, R0
SXTH	R4, R4
;ITG3200_main.c,51 :: 		for (i=0; i<16; i++) {
ADDS	R3, R3, #1
SXTH	R3, R3
;ITG3200_main.c,56 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_ITG3200_main_Gyro_Average0
L_ITG3200_main_Gyro_Average1:
;ITG3200_main.c,58 :: 		gyroreadings[0] = sx >> 4;
ASRS	R1, R6, #4
; sx end address is: 24 (R6)
MOVW	R0, #lo_addr(_gyroreadings+0)
MOVT	R0, #hi_addr(_gyroreadings+0)
STRH	R1, [R0, #0]
;ITG3200_main.c,59 :: 		gyroreadings[1] = sy >> 4;
ASRS	R1, R5, #4
; sy end address is: 20 (R5)
MOVW	R0, #lo_addr(_gyroreadings+2)
MOVT	R0, #hi_addr(_gyroreadings+2)
STRH	R1, [R0, #0]
;ITG3200_main.c,60 :: 		gyroreadings[2] = sz >> 4;
ASRS	R1, R4, #4
; sz end address is: 16 (R4)
MOVW	R0, #lo_addr(_gyroreadings+4)
MOVT	R0, #hi_addr(_gyroreadings+4)
STRH	R1, [R0, #0]
;ITG3200_main.c,61 :: 		}
L_end_Gyro_Average:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of ITG3200_main_Gyro_Average
ITG3200_main_Display_Value:
;ITG3200_main.c,70 :: 		static void Display_Value(TLabel *label, int val) {
; val start address is: 4 (R1)
SUB	SP, SP, #32
STR	LR, [SP, #0]
STR	R0, [SP, #28]
SXTH	R7, R1
; val end address is: 4 (R1)
; val start address is: 28 (R7)
;ITG3200_main.c,74 :: 		ptr = label->Caption;
LDR	R2, [SP, #28]
ADDS	R2, #16
LDR	R2, [R2, #0]
STR	R2, [SP, #24]
;ITG3200_main.c,75 :: 		TFT_Set_Pen(Gyro_test.Color,  0);
MOVW	R2, #lo_addr(_Gyro_test+0)
MOVT	R2, #hi_addr(_Gyro_test+0)
LDRH	R2, [R2, #0]
MOVS	R1, #0
UXTH	R0, R2
BL	_TFT_Set_Pen+0
;ITG3200_main.c,76 :: 		TFT_Set_Brush(1, Gyro_test.Color, 0, 0, 0, 0);
MOVS	R4, #0
MOVS	R3, #0
MOVW	R2, #lo_addr(_Gyro_test+0)
MOVT	R2, #hi_addr(_Gyro_test+0)
LDRH	R2, [R2, #0]
PUSH	(R4)
PUSH	(R3)
MOVS	R3, #0
UXTH	R1, R2
MOVS	R2, #0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;ITG3200_main.c,77 :: 		IntToStr(val & 0xFE, text);
ADD	R3, SP, #4
AND	R2, R7, #254
; val end address is: 28 (R7)
MOV	R1, R3
SXTH	R0, R2
BL	_IntToStr+0
;ITG3200_main.c,78 :: 		strcpy(text1, ptr);
ADD	R2, SP, #11
LDR	R1, [SP, #24]
MOV	R0, R2
BL	_strcpy+0
;ITG3200_main.c,79 :: 		strcat(text1, text);
ADD	R3, SP, #4
ADD	R2, SP, #11
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;ITG3200_main.c,80 :: 		TFT_Rectangle(label->Left, Label->Top, label->Left + 55, Label->Top + 20);
LDR	R2, [SP, #28]
ADDS	R2, #8
LDRH	R3, [R2, #0]
ADDW	R5, R3, #20
LDR	R2, [SP, #28]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
ADDW	R4, R2, #55
SXTH	R3, R3
SXTH	R2, R2
SXTH	R1, R3
SXTH	R3, R5
SXTH	R0, R2
SXTH	R2, R4
BL	_TFT_Rectangle+0
;ITG3200_main.c,81 :: 		label->Caption = text1;
LDR	R2, [SP, #28]
ADDW	R3, R2, #16
ADD	R2, SP, #11
STR	R2, [R3, #0]
;ITG3200_main.c,82 :: 		Drawlabel(label);
LDR	R0, [SP, #28]
BL	_DrawLabel+0
;ITG3200_main.c,83 :: 		label->Caption = ptr;
LDR	R2, [SP, #28]
ADDW	R3, R2, #16
LDR	R2, [SP, #24]
STR	R2, [R3, #0]
;ITG3200_main.c,84 :: 		}
L_end_Display_Value:
LDR	LR, [SP, #0]
ADD	SP, SP, #32
BX	LR
; end of ITG3200_main_Display_Value
ITG3200_main_Scroll_Gyro:
;ITG3200_main.c,95 :: 		static void Scroll_Gyro(char Adir) {
; Adir start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Adir end address is: 0 (R0)
; Adir start address is: 0 (R0)
;ITG3200_main.c,98 :: 		if (Adir == _Gyro_UP) {
CMP	R0, #1
IT	NE
BNE	L_ITG3200_main_Scroll_Gyro3
; Adir end address is: 0 (R0)
;ITG3200_main.c,99 :: 		if (_disp_gyro_scroll != _SCROLL_GYRO_FIRST_LINE)
MOVW	R1, #lo_addr(__disp_gyro_scroll+0)
MOVT	R1, #hi_addr(__disp_gyro_scroll+0)
LDRSH	R1, [R1, #0]
CMP	R1, #41
IT	EQ
BEQ	L_ITG3200_main_Scroll_Gyro4
;ITG3200_main.c,100 :: 		_disp_gyro_scroll--;
MOVW	R2, #lo_addr(__disp_gyro_scroll+0)
MOVT	R2, #hi_addr(__disp_gyro_scroll+0)
LDRSH	R1, [R2, #0]
SUBS	R1, R1, #1
STRH	R1, [R2, #0]
IT	AL
BAL	L_ITG3200_main_Scroll_Gyro5
L_ITG3200_main_Scroll_Gyro4:
;ITG3200_main.c,102 :: 		_disp_gyro_scroll = _SCROLL_GYRO_LAST_LINE - 1;
MOVS	R2, #245
SXTH	R2, R2
MOVW	R1, #lo_addr(__disp_gyro_scroll+0)
MOVT	R1, #hi_addr(__disp_gyro_scroll+0)
STRH	R2, [R1, #0]
;ITG3200_main.c,103 :: 		}
L_ITG3200_main_Scroll_Gyro5:
;ITG3200_main.c,104 :: 		}
IT	AL
BAL	L_ITG3200_main_Scroll_Gyro6
L_ITG3200_main_Scroll_Gyro3:
;ITG3200_main.c,106 :: 		if (_disp_gyro_scroll != _SCROLL_GYRO_LAST_LINE - 1)
MOVW	R1, #lo_addr(__disp_gyro_scroll+0)
MOVT	R1, #hi_addr(__disp_gyro_scroll+0)
LDRSH	R1, [R1, #0]
CMP	R1, #245
IT	EQ
BEQ	L_ITG3200_main_Scroll_Gyro7
;ITG3200_main.c,107 :: 		_disp_gyro_scroll++;
MOVW	R2, #lo_addr(__disp_gyro_scroll+0)
MOVT	R2, #hi_addr(__disp_gyro_scroll+0)
LDRSH	R1, [R2, #0]
ADDS	R1, R1, #1
STRH	R1, [R2, #0]
IT	AL
BAL	L_ITG3200_main_Scroll_Gyro8
L_ITG3200_main_Scroll_Gyro7:
;ITG3200_main.c,109 :: 		_disp_gyro_scroll = _SCROLL_GYRO_FIRST_LINE;
MOVW	R2, #41
SXTH	R2, R2
MOVW	R1, #lo_addr(__disp_gyro_scroll+0)
MOVT	R1, #hi_addr(__disp_gyro_scroll+0)
STRH	R2, [R1, #0]
;ITG3200_main.c,110 :: 		}
L_ITG3200_main_Scroll_Gyro8:
;ITG3200_main.c,111 :: 		}
L_ITG3200_main_Scroll_Gyro6:
;ITG3200_main.c,113 :: 		Scroll(_disp_gyro_scroll);
MOVW	R1, #lo_addr(__disp_gyro_scroll+0)
MOVT	R1, #hi_addr(__disp_gyro_scroll+0)
LDRSH	R1, [R1, #0]
UXTH	R0, R1
BL	_Scroll+0
;ITG3200_main.c,114 :: 		}
L_end_Scroll_Gyro:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of ITG3200_main_Scroll_Gyro
ITG3200_main_WriteGraph:
;ITG3200_main.c,123 :: 		static void WriteGraph(TGyro_values *old, TGyro_values *new){
SUB	SP, SP, #12
STR	LR, [SP, #0]
STR	R0, [SP, #4]
STR	R1, [SP, #8]
;ITG3200_main.c,125 :: 		if ((_disp_gyro_scroll < _SCROLL_GYRO_LAST_LINE - 2) && (_disp_gyro_scroll > _SCROLL_GYRO_FIRST_LINE)){
MOVW	R2, #lo_addr(__disp_gyro_scroll+0)
MOVT	R2, #hi_addr(__disp_gyro_scroll+0)
LDRSH	R2, [R2, #0]
CMP	R2, #244
IT	GE
BGE	L_ITG3200_main_WriteGraph28
MOVW	R2, #lo_addr(__disp_gyro_scroll+0)
MOVT	R2, #hi_addr(__disp_gyro_scroll+0)
LDRSH	R2, [R2, #0]
CMP	R2, #41
IT	LE
BLE	L_ITG3200_main_WriteGraph27
L_ITG3200_main_WriteGraph26:
;ITG3200_main.c,126 :: 		TFT_Set_Pen(CL_RED, 2);
MOVS	R1, #2
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
;ITG3200_main.c,127 :: 		temp1 = (old->GyroXvalue * 30) / 256 + 90;
LDR	R2, [SP, #4]
LDRSH	R3, [R2, #0]
MOVS	R2, #30
SXTH	R2, R2
MUL	R0, R3, R2
SXTH	R0, R0
ASRS	R0, R0, #8
SXTH	R0, R0
ADDS	R0, #90
SXTH	R0, R0
; temp1 start address is: 0 (R0)
;ITG3200_main.c,128 :: 		temp2 = (new->GyroXvalue * 30) / 256 + 90;
LDR	R2, [SP, #8]
LDRSH	R3, [R2, #0]
MOVS	R2, #30
SXTH	R2, R2
MULS	R2, R3, R2
SXTH	R2, R2
ASRS	R2, R2, #8
SXTH	R2, R2
ADDW	R5, R2, #90
;ITG3200_main.c,129 :: 		TFT_Line(temp1, _disp_gyro_scroll + 2, temp2, _disp_gyro_scroll + 1);
MOVW	R4, #lo_addr(__disp_gyro_scroll+0)
MOVT	R4, #hi_addr(__disp_gyro_scroll+0)
LDRSH	R2, [R4, #0]
ADDS	R3, R2, #1
MOV	R2, R4
LDRSH	R2, [R2, #0]
ADDS	R2, R2, #2
SXTH	R1, R2
SXTH	R2, R5
; temp1 end address is: 0 (R0)
BL	_TFT_Line+0
;ITG3200_main.c,131 :: 		TFT_Set_Pen(CL_BLUE, 2);
MOVS	R1, #2
MOVW	R0, #31
BL	_TFT_Set_Pen+0
;ITG3200_main.c,132 :: 		temp1 = (old->GyroYvalue * 30) / 256 + 240;
LDR	R2, [SP, #4]
ADDS	R2, R2, #2
LDRSH	R3, [R2, #0]
MOVS	R2, #30
SXTH	R2, R2
MUL	R0, R3, R2
SXTH	R0, R0
ASRS	R0, R0, #8
SXTH	R0, R0
ADDS	R0, #240
SXTH	R0, R0
; temp1 start address is: 0 (R0)
;ITG3200_main.c,133 :: 		temp2 = (new->GyroYvalue * 30) / 256 + 240;
LDR	R2, [SP, #8]
ADDS	R2, R2, #2
LDRSH	R3, [R2, #0]
MOVS	R2, #30
SXTH	R2, R2
MULS	R2, R3, R2
SXTH	R2, R2
ASRS	R2, R2, #8
SXTH	R2, R2
ADDW	R5, R2, #240
;ITG3200_main.c,134 :: 		TFT_Line(temp1, _disp_gyro_scroll + 2, temp2, _disp_gyro_scroll + 1);
MOVW	R4, #lo_addr(__disp_gyro_scroll+0)
MOVT	R4, #hi_addr(__disp_gyro_scroll+0)
LDRSH	R2, [R4, #0]
ADDS	R3, R2, #1
MOV	R2, R4
LDRSH	R2, [R2, #0]
ADDS	R2, R2, #2
SXTH	R1, R2
SXTH	R2, R5
; temp1 end address is: 0 (R0)
BL	_TFT_Line+0
;ITG3200_main.c,136 :: 		TFT_Set_Pen(CL_GREEN, 2);
MOVS	R1, #2
MOVW	R0, #1024
BL	_TFT_Set_Pen+0
;ITG3200_main.c,137 :: 		temp1 = (old->GyroZvalue * 30) / 256 + 390;
LDR	R2, [SP, #4]
ADDS	R2, R2, #4
LDRSH	R3, [R2, #0]
MOVS	R2, #30
SXTH	R2, R2
MULS	R2, R3, R2
SXTH	R2, R2
ASRS	R2, R2, #8
SXTH	R2, R2
ADD	R2, R2, #390
; temp1 start address is: 0 (R0)
SXTH	R0, R2
;ITG3200_main.c,138 :: 		temp2 = (new->GyroZvalue * 30) / 256 + 390;
LDR	R2, [SP, #8]
ADDS	R2, R2, #4
LDRSH	R3, [R2, #0]
MOVS	R2, #30
SXTH	R2, R2
MULS	R2, R3, R2
SXTH	R2, R2
ASRS	R2, R2, #8
SXTH	R2, R2
ADD	R5, R2, #390
;ITG3200_main.c,139 :: 		TFT_Line(temp1, _disp_gyro_scroll + 2, temp2, _disp_gyro_scroll + 1);
MOVW	R4, #lo_addr(__disp_gyro_scroll+0)
MOVT	R4, #hi_addr(__disp_gyro_scroll+0)
LDRSH	R2, [R4, #0]
ADDS	R3, R2, #1
MOV	R2, R4
LDRSH	R2, [R2, #0]
ADDS	R2, R2, #2
SXTH	R1, R2
SXTH	R2, R5
; temp1 end address is: 0 (R0)
BL	_TFT_Line+0
;ITG3200_main.c,125 :: 		if ((_disp_gyro_scroll < _SCROLL_GYRO_LAST_LINE - 2) && (_disp_gyro_scroll > _SCROLL_GYRO_FIRST_LINE)){
L_ITG3200_main_WriteGraph28:
L_ITG3200_main_WriteGraph27:
;ITG3200_main.c,141 :: 		}
L_end_WriteGraph:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of ITG3200_main_WriteGraph
ITG3200_main_Scroll_Add_Line:
;ITG3200_main.c,150 :: 		static void Scroll_Add_Line(char ScrollDiection){
; ScrollDiection start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ScrollDiection end address is: 0 (R0)
; ScrollDiection start address is: 0 (R0)
;ITG3200_main.c,152 :: 		if (ScrollDiection > 0){
CMP	R0, #0
IT	LS
BLS	L_ITG3200_main_Scroll_Add_Line12
; ScrollDiection end address is: 0 (R0)
;ITG3200_main.c,153 :: 		temp = _disp_gyro_scroll + 1;
MOVW	R1, #lo_addr(__disp_gyro_scroll+0)
MOVT	R1, #hi_addr(__disp_gyro_scroll+0)
LDRSH	R1, [R1, #0]
ADDS	R1, R1, #1
SXTH	R1, R1
; temp start address is: 0 (R0)
SXTH	R0, R1
;ITG3200_main.c,154 :: 		if (temp > _SCROLL_GYRO_LAST_LINE - 1)
CMP	R1, #245
IT	LE
BLE	L_ITG3200_main_Scroll_Add_Line29
;ITG3200_main.c,155 :: 		temp = _SCROLL_GYRO_FIRST_LINE;
MOVW	R0, #41
SXTH	R0, R0
; temp end address is: 0 (R0)
IT	AL
BAL	L_ITG3200_main_Scroll_Add_Line13
L_ITG3200_main_Scroll_Add_Line29:
;ITG3200_main.c,154 :: 		if (temp > _SCROLL_GYRO_LAST_LINE - 1)
;ITG3200_main.c,155 :: 		temp = _SCROLL_GYRO_FIRST_LINE;
L_ITG3200_main_Scroll_Add_Line13:
;ITG3200_main.c,156 :: 		TFT_CS = 0;
; temp start address is: 0 (R0)
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(TFT_CS+0)
MOVT	R1, #hi_addr(TFT_CS+0)
STR	R2, [R1, #0]
;ITG3200_main.c,157 :: 		TFT_SSD1963_Set_Address_Ptr(0, temp, 480, temp);
UXTH	R3, R0
MOVW	R2, #480
UXTH	R1, R3
; temp end address is: 0 (R0)
MOVS	R0, #0
MOVW	R4, #lo_addr(_TFT_SSD1963_Set_Address_Ptr+0)
MOVT	R4, #hi_addr(_TFT_SSD1963_Set_Address_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
;ITG3200_main.c,158 :: 		for (i = 0; i < 480; i++)
; i start address is: 0 (R0)
MOVS	R0, #0
SXTH	R0, R0
; i end address is: 0 (R0)
L_ITG3200_main_Scroll_Add_Line14:
; i start address is: 0 (R0)
CMP	R0, #480
IT	GE
BGE	L_ITG3200_main_Scroll_Add_Line15
;ITG3200_main.c,159 :: 		if ((i == 90) | (i == 240) | (i == 390))
CMP	R0, #90
MOVW	R2, #0
BNE	L_ITG3200_main_Scroll_Add_Line35
MOVS	R2, #1
L_ITG3200_main_Scroll_Add_Line35:
UXTB	R2, R2
CMP	R0, #240
MOVW	R1, #0
BNE	L_ITG3200_main_Scroll_Add_Line36
MOVS	R1, #1
L_ITG3200_main_Scroll_Add_Line36:
UXTB	R1, R1
ORRS	R2, R1
UXTB	R2, R2
CMP	R0, #390
MOVW	R1, #0
BNE	L_ITG3200_main_Scroll_Add_Line37
MOVS	R1, #1
L_ITG3200_main_Scroll_Add_Line37:
UXTB	R1, R1
ORR	R1, R2, R1, LSL #0
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_ITG3200_main_Scroll_Add_Line17
;ITG3200_main.c,160 :: 		TFT_Write_Data_Ptr(CL_SILVER);
STRH	R0, [SP, #4]
MOVW	R0, #50712
MOVW	R4, #lo_addr(_TFT_Write_Data_Ptr+0)
MOVT	R4, #hi_addr(_TFT_Write_Data_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
LDRSH	R0, [SP, #4]
IT	AL
BAL	L_ITG3200_main_Scroll_Add_Line18
L_ITG3200_main_Scroll_Add_Line17:
;ITG3200_main.c,162 :: 		TFT_Write_Data_Ptr(CL_WHITE);
STRH	R0, [SP, #4]
MOVW	R0, #65535
MOVW	R4, #lo_addr(_TFT_Write_Data_Ptr+0)
MOVT	R4, #hi_addr(_TFT_Write_Data_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
LDRSH	R0, [SP, #4]
L_ITG3200_main_Scroll_Add_Line18:
;ITG3200_main.c,158 :: 		for (i = 0; i < 480; i++)
ADDS	R0, R0, #1
SXTH	R0, R0
;ITG3200_main.c,162 :: 		TFT_Write_Data_Ptr(CL_WHITE);
; i end address is: 0 (R0)
IT	AL
BAL	L_ITG3200_main_Scroll_Add_Line14
L_ITG3200_main_Scroll_Add_Line15:
;ITG3200_main.c,163 :: 		TFT_CS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(TFT_CS+0)
MOVT	R1, #hi_addr(TFT_CS+0)
STR	R2, [R1, #0]
;ITG3200_main.c,164 :: 		}
L_ITG3200_main_Scroll_Add_Line12:
;ITG3200_main.c,165 :: 		}
L_end_Scroll_Add_Line:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of ITG3200_main_Scroll_Add_Line
_Gyro_Stop:
;ITG3200_main.c,174 :: 		void Gyro_Stop(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ITG3200_main.c,175 :: 		Scroll_Undone(_SCROLL_GYRO_FIRST_LINE, _SCROLL_GYRO_LAST_LINE);
MOVW	R1, #246
MOVW	R0, #41
BL	_Scroll_Undone+0
;ITG3200_main.c,176 :: 		}
L_end_Gyro_Stop:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Gyro_Stop
_GYRO_Start:
;ITG3200_main.c,185 :: 		void GYRO_Start(char *test) {
; test start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R2, R0
; test end address is: 0 (R0)
; test start address is: 8 (R2)
;ITG3200_main.c,187 :: 		*test = 0;
MOVS	R1, #0
STRB	R1, [R2, #0]
;ITG3200_main.c,190 :: 		I2C2_Init_Advanced(400000, &_GPIO_MODULE_I2C2_PF01);
STR	R2, [SP, #4]
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C2_PF01+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C2_PF01+0)
MOVW	R0, #6784
MOVT	R0, #6
BL	_I2C2_Init_Advanced+0
;ITG3200_main.c,191 :: 		Delay_ms(100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_GYRO_Start19:
SUBS	R7, R7, #1
BNE	L_GYRO_Start19
NOP
NOP
NOP
;ITG3200_main.c,193 :: 		if (ITG3200_Init() == 0) {
BL	_ITG3200_Init+0
LDR	R2, [SP, #4]
CMP	R0, #0
IT	NE
BNE	L_GYRO_Start21
;ITG3200_main.c,194 :: 		*test = 1;
MOVS	R1, #1
STRB	R1, [R2, #0]
; test end address is: 8 (R2)
;ITG3200_main.c,195 :: 		Delay_ms(500);
MOVW	R7, #30782
MOVT	R7, #381
NOP
NOP
L_GYRO_Start22:
SUBS	R7, R7, #1
BNE	L_GYRO_Start22
NOP
NOP
NOP
;ITG3200_main.c,196 :: 		}
IT	AL
BAL	L_GYRO_Start24
L_GYRO_Start21:
;ITG3200_main.c,198 :: 		*test = 2;
; test start address is: 8 (R2)
MOVS	R1, #2
STRB	R1, [R2, #0]
; test end address is: 8 (R2)
;ITG3200_main.c,199 :: 		}
L_GYRO_Start24:
;ITG3200_main.c,200 :: 		Scroll_Undone(_SCROLL_GYRO_FIRST_LINE, _SCROLL_GYRO_LAST_LINE);
MOVW	R1, #246
MOVW	R0, #41
BL	_Scroll_Undone+0
;ITG3200_main.c,201 :: 		}
L_end_GYRO_Start:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _GYRO_Start
ITG3200_main_GYRO_Test:
;ITG3200_main.c,210 :: 		static void GYRO_Test(TGyro_values *values) {
; values start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; values end address is: 0 (R0)
; values start address is: 0 (R0)
;ITG3200_main.c,211 :: 		Gyro_Average();               // Calculate average X, Y and Z reads
STR	R0, [SP, #4]
BL	ITG3200_main_Gyro_Average+0
LDR	R0, [SP, #4]
;ITG3200_main.c,213 :: 		values->GyroXvalue = gyroreadings[0];
MOVW	R1, #lo_addr(_gyroreadings+0)
MOVT	R1, #hi_addr(_gyroreadings+0)
LDRSH	R1, [R1, #0]
STRH	R1, [R0, #0]
;ITG3200_main.c,214 :: 		values->GyroYvalue = gyroreadings[1];
ADDS	R2, R0, #2
MOVW	R1, #lo_addr(_gyroreadings+2)
MOVT	R1, #hi_addr(_gyroreadings+2)
LDRSH	R1, [R1, #0]
STRH	R1, [R2, #0]
;ITG3200_main.c,215 :: 		values->GyroZvalue = gyroreadings[2];
ADDS	R2, R0, #4
; values end address is: 0 (R0)
MOVW	R1, #lo_addr(_gyroreadings+4)
MOVT	R1, #hi_addr(_gyroreadings+4)
LDRSH	R1, [R1, #0]
STRH	R1, [R2, #0]
;ITG3200_main.c,216 :: 		}
L_end_GYRO_Test:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of ITG3200_main_GYRO_Test
_doGyro:
;ITG3200_main.c,227 :: 		void doGyro(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ITG3200_main.c,228 :: 		GYRO_Test(&Gyro_vals);
MOVW	R0, #lo_addr(_Gyro_vals+0)
MOVT	R0, #hi_addr(_Gyro_vals+0)
BL	ITG3200_main_GYRO_Test+0
;ITG3200_main.c,229 :: 		Scroll_GYRO(_GYRO_UP);
MOVS	R0, #1
BL	ITG3200_main_Scroll_Gyro+0
;ITG3200_main.c,230 :: 		Scroll_Add_Line(_GYRO_UP);
MOVS	R0, #1
BL	ITG3200_main_Scroll_Add_Line+0
;ITG3200_main.c,231 :: 		WriteGraph(&Old_Gyro_vals, &Gyro_vals);
MOVW	R1, #lo_addr(_Gyro_vals+0)
MOVT	R1, #hi_addr(_Gyro_vals+0)
MOVW	R0, #lo_addr(_Old_Gyro_vals+0)
MOVT	R0, #hi_addr(_Old_Gyro_vals+0)
BL	ITG3200_main_WriteGraph+0
;ITG3200_main.c,232 :: 		Old_gyro_vals = Gyro_vals;
MOVS	R3, #6
MOVW	R2, #lo_addr(_Old_Gyro_vals+0)
MOVT	R2, #hi_addr(_Old_Gyro_vals+0)
MOVW	R1, #lo_addr(_Gyro_vals+0)
MOVT	R1, #hi_addr(_Gyro_vals+0)
L_doGyro25:
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
UXTB	R3, R3
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L_doGyro25
;ITG3200_main.c,234 :: 		Display_Value(&LAbel2, Gyro_vals.GyroXvalue);
MOVW	R0, #lo_addr(_Gyro_vals+0)
MOVT	R0, #hi_addr(_Gyro_vals+0)
LDRSH	R0, [R0, #0]
SXTH	R1, R0
MOVW	R0, #lo_addr(_Label2+0)
MOVT	R0, #hi_addr(_Label2+0)
BL	ITG3200_main_Display_Value+0
;ITG3200_main.c,235 :: 		Display_Value(&LAbel3, Gyro_vals.GyroYvalue);
MOVW	R0, #lo_addr(_Gyro_vals+2)
MOVT	R0, #hi_addr(_Gyro_vals+2)
LDRSH	R0, [R0, #0]
SXTH	R1, R0
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
BL	ITG3200_main_Display_Value+0
;ITG3200_main.c,236 :: 		Display_Value(&LAbel4, Gyro_vals.GyroZvalue);
MOVW	R0, #lo_addr(_Gyro_vals+4)
MOVT	R0, #hi_addr(_Gyro_vals+4)
LDRSH	R0, [R0, #0]
SXTH	R1, R0
MOVW	R0, #lo_addr(_Label4+0)
MOVT	R0, #hi_addr(_Label4+0)
BL	ITG3200_main_Display_Value+0
;ITG3200_main.c,237 :: 		}
L_end_doGyro:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doGyro
