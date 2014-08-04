BMP085_main_Display_Value:
;BMP085_main.c,70 :: 		static void Display_Value(TLabel *label, int val) {
; val start address is: 4 (R1)
SUB	SP, SP, #32
STR	LR, [SP, #0]
STR	R0, [SP, #28]
SXTH	R7, R1
; val end address is: 4 (R1)
; val start address is: 28 (R7)
;BMP085_main.c,74 :: 		ptr = label->Caption;
LDR	R2, [SP, #28]
ADDS	R2, #16
LDR	R2, [R2, #0]
STR	R2, [SP, #24]
;BMP085_main.c,75 :: 		TFT_Set_Pen(Pressure_test.Color,  0);
MOVW	R2, #lo_addr(_Pressure_test+0)
MOVT	R2, #hi_addr(_Pressure_test+0)
LDRH	R2, [R2, #0]
MOVS	R1, #0
UXTH	R0, R2
BL	_TFT_Set_Pen+0
;BMP085_main.c,76 :: 		TFT_Set_Brush(1, Pressure_test.Color, 0, 0, 0, 0);
MOVS	R4, #0
MOVS	R3, #0
MOVW	R2, #lo_addr(_Pressure_test+0)
MOVT	R2, #hi_addr(_Pressure_test+0)
LDRH	R2, [R2, #0]
PUSH	(R4)
PUSH	(R3)
MOVS	R3, #0
UXTH	R1, R2
MOVS	R2, #0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;BMP085_main.c,77 :: 		IntToStr(val & 0xFE, text);
ADD	R3, SP, #4
AND	R2, R7, #254
; val end address is: 28 (R7)
MOV	R1, R3
SXTH	R0, R2
BL	_IntToStr+0
;BMP085_main.c,78 :: 		strcpy(text1, ptr);
ADD	R2, SP, #11
LDR	R1, [SP, #24]
MOV	R0, R2
BL	_strcpy+0
;BMP085_main.c,79 :: 		strcat(text1, text);
ADD	R3, SP, #4
ADD	R2, SP, #11
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;BMP085_main.c,80 :: 		TFT_Rectangle(label->Left, Label->Top, label->Left + 55, Label->Top + 20);
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
;BMP085_main.c,81 :: 		label->Caption = text1;
LDR	R2, [SP, #28]
ADDW	R3, R2, #16
ADD	R2, SP, #11
STR	R2, [R3, #0]
;BMP085_main.c,82 :: 		Drawlabel(label);
LDR	R0, [SP, #28]
BL	_DrawLabel+0
;BMP085_main.c,83 :: 		label->Caption = ptr;
LDR	R2, [SP, #28]
ADDW	R3, R2, #16
LDR	R2, [SP, #24]
STR	R2, [R3, #0]
;BMP085_main.c,84 :: 		}
L_end_Display_Value:
LDR	LR, [SP, #0]
ADD	SP, SP, #32
BX	LR
; end of BMP085_main_Display_Value
