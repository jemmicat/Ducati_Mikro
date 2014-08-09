_UpdatePenSelection:
;Paint.c,40 :: 		void UpdatePenSelection(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Paint.c,41 :: 		drawingTool.CurrentPen->Pen_Color = CL_SELECTED;
MOVW	R0, #lo_addr(_drawingTool+4)
MOVT	R0, #hi_addr(_drawingTool+4)
LDR	R0, [R0, #0]
ADDW	R1, R0, #16
MOVW	R0, #65535
STRH	R0, [R1, #0]
;Paint.c,42 :: 		if (drawingTool.PreviousPen > 0)
MOVW	R0, #lo_addr(_drawingTool+8)
MOVT	R0, #hi_addr(_drawingTool+8)
LDR	R0, [R0, #0]
CMP	R0, #0
IT	LS
BLS	L_UpdatePenSelection0
;Paint.c,43 :: 		drawingTool.PreviousPen->Pen_Color = drawingTool.PreviousPen->Color;
MOVW	R2, #lo_addr(_drawingTool+8)
MOVT	R2, #hi_addr(_drawingTool+8)
LDR	R0, [R2, #0]
ADDW	R1, R0, #16
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, #28
LDRH	R0, [R0, #0]
STRH	R0, [R1, #0]
L_UpdatePenSelection0:
;Paint.c,44 :: 		DrawBox(&Pen1);
MOVW	R0, #lo_addr(_Pen1+0)
MOVT	R0, #hi_addr(_Pen1+0)
BL	_DrawBox+0
;Paint.c,45 :: 		DrawBox(&Pen2);
MOVW	R0, #lo_addr(_Pen2+0)
MOVT	R0, #hi_addr(_Pen2+0)
BL	_DrawBox+0
;Paint.c,46 :: 		DrawBox(&Pen3);
MOVW	R0, #lo_addr(_Pen3+0)
MOVT	R0, #hi_addr(_Pen3+0)
BL	_DrawBox+0
;Paint.c,47 :: 		TFT_Set_Pen(drawingTool.CurrentColor->Color, 0);
MOVW	R0, #lo_addr(_drawingTool+12)
MOVT	R0, #hi_addr(_drawingTool+12)
LDR	R0, [R0, #0]
ADDS	R0, #28
LDRH	R0, [R0, #0]
MOVS	R1, #0
BL	_TFT_Set_Pen+0
;Paint.c,48 :: 		TFT_Set_Brush(1, drawingTool.CurrentColor->Color, 0, 0, 0, 0);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_drawingTool+12)
MOVT	R0, #hi_addr(_drawingTool+12)
LDR	R0, [R0, #0]
ADDS	R0, #28
LDRH	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Paint.c,49 :: 		}
L_end_UpdatePenSelection:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _UpdatePenSelection
_UpdatePenColor:
;Paint.c,58 :: 		void UpdatePenColor(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Paint.c,59 :: 		drawingTool.CurrentColor->Pen_Color = CL_SELECTED;
MOVW	R2, #lo_addr(_drawingTool+12)
MOVT	R2, #hi_addr(_drawingTool+12)
LDR	R0, [R2, #0]
ADDW	R1, R0, #16
MOVW	R0, #65535
STRH	R0, [R1, #0]
;Paint.c,60 :: 		DrawBox(drawingTool.CurrentColor);
MOV	R0, R2
LDR	R0, [R0, #0]
BL	_DrawBox+0
;Paint.c,62 :: 		if (drawingTool.PreviousColor > 0){
MOVW	R0, #lo_addr(_drawingTool+16)
MOVT	R0, #hi_addr(_drawingTool+16)
LDR	R0, [R0, #0]
CMP	R0, #0
IT	LS
BLS	L_UpdatePenColor1
;Paint.c,63 :: 		drawingTool.PreviousColor->Pen_Color = drawingTool.PreviousColor->Color;
MOVW	R2, #lo_addr(_drawingTool+16)
MOVT	R2, #hi_addr(_drawingTool+16)
LDR	R0, [R2, #0]
ADDW	R1, R0, #16
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, #28
LDRH	R0, [R0, #0]
STRH	R0, [R1, #0]
;Paint.c,64 :: 		DrawBox(drawingTool.PreviousColor);
MOV	R0, R2
LDR	R0, [R0, #0]
BL	_DrawBox+0
;Paint.c,65 :: 		}
L_UpdatePenColor1:
;Paint.c,67 :: 		if (drawingTool.EraserSelected){
MOVW	R0, #lo_addr(_drawingTool+2)
MOVT	R0, #hi_addr(_drawingTool+2)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_UpdatePenColor2
;Paint.c,68 :: 		Pen1.Color = DrawingArea.Color;
MOVW	R2, #lo_addr(_DrawingArea+28)
MOVT	R2, #hi_addr(_DrawingArea+28)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_Pen1+28)
MOVT	R0, #hi_addr(_Pen1+28)
STRH	R1, [R0, #0]
;Paint.c,69 :: 		Pen2.Color = DrawingArea.Color;
MOV	R0, R2
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Pen2+28)
MOVT	R0, #hi_addr(_Pen2+28)
STRH	R1, [R0, #0]
;Paint.c,70 :: 		Pen3.Color = DrawingArea.Color;
MOV	R0, R2
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Pen3+28)
MOVT	R0, #hi_addr(_Pen3+28)
STRH	R1, [R0, #0]
;Paint.c,71 :: 		}
IT	AL
BAL	L_UpdatePenColor3
L_UpdatePenColor2:
;Paint.c,73 :: 		Pen1.Color = drawingTool.CurrentColor->Color;
MOVW	R0, #lo_addr(_drawingTool+12)
MOVT	R0, #hi_addr(_drawingTool+12)
LDR	R0, [R0, #0]
ADDW	R2, R0, #28
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_Pen1+28)
MOVT	R0, #hi_addr(_Pen1+28)
STRH	R1, [R0, #0]
;Paint.c,74 :: 		Pen1.Pen_Color = drawingTool.CurrentColor->Color;
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_Pen1+16)
MOVT	R0, #hi_addr(_Pen1+16)
STRH	R1, [R0, #0]
;Paint.c,76 :: 		Pen2.Color = drawingTool.CurrentColor->Color;
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_Pen2+28)
MOVT	R0, #hi_addr(_Pen2+28)
STRH	R1, [R0, #0]
;Paint.c,77 :: 		Pen2.Pen_Color = drawingTool.CurrentColor->Color;
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_Pen2+16)
MOVT	R0, #hi_addr(_Pen2+16)
STRH	R1, [R0, #0]
;Paint.c,79 :: 		Pen3.Color = drawingTool.CurrentColor->Color;
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_Pen3+28)
MOVT	R0, #hi_addr(_Pen3+28)
STRH	R1, [R0, #0]
;Paint.c,80 :: 		Pen3.Pen_Color = drawingTool.CurrentColor->Color;
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_Pen3+16)
MOVT	R0, #hi_addr(_Pen3+16)
STRH	R1, [R0, #0]
;Paint.c,81 :: 		}
L_UpdatePenColor3:
;Paint.c,82 :: 		UpdatePenSelection();
BL	_UpdatePenSelection+0
;Paint.c,83 :: 		}
L_end_UpdatePenColor:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _UpdatePenColor
_SetDefaults:
;Paint.c,92 :: 		void SetDefaults(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Paint.c,95 :: 		for (color_cnt = 0; color_cnt < 30; color_cnt++)
; color_cnt start address is: 8 (R2)
MOVS	R2, #0
; color_cnt end address is: 8 (R2)
L_SetDefaults4:
; color_cnt start address is: 8 (R2)
CMP	R2, #30
IT	CS
BCS	L_SetDefaults5
;Paint.c,96 :: 		ColorArray[color_cnt]->Pen_Color = ColorArray[color_cnt]->Color;
LSLS	R1, R2, #2
MOVW	R0, #lo_addr(_ColorArray+0)
MOVT	R0, #hi_addr(_ColorArray+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
ADDW	R1, R0, #16
ADDS	R0, #28
LDRH	R0, [R0, #0]
STRH	R0, [R1, #0]
;Paint.c,95 :: 		for (color_cnt = 0; color_cnt < 30; color_cnt++)
ADDS	R2, R2, #1
UXTB	R2, R2
;Paint.c,96 :: 		ColorArray[color_cnt]->Pen_Color = ColorArray[color_cnt]->Color;
; color_cnt end address is: 8 (R2)
IT	AL
BAL	L_SetDefaults4
L_SetDefaults5:
;Paint.c,98 :: 		drawingTool.pen_size = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_drawingTool+0)
MOVT	R0, #hi_addr(_drawingTool+0)
STRH	R1, [R0, #0]
;Paint.c,99 :: 		drawingTool.PreviousPen = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_drawingTool+8)
MOVT	R0, #hi_addr(_drawingTool+8)
STR	R1, [R0, #0]
;Paint.c,100 :: 		drawingTool.CurrentPen  = &Pen1;
MOVW	R1, #lo_addr(_Pen1+0)
MOVT	R1, #hi_addr(_Pen1+0)
MOVW	R0, #lo_addr(_drawingTool+4)
MOVT	R0, #hi_addr(_drawingTool+4)
STR	R1, [R0, #0]
;Paint.c,101 :: 		drawingTool.PreviousColor = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_drawingTool+16)
MOVT	R0, #hi_addr(_drawingTool+16)
STR	R1, [R0, #0]
;Paint.c,102 :: 		drawingTool.CurrentColor = &Color01;
MOVW	R1, #lo_addr(_Color01+0)
MOVT	R1, #hi_addr(_Color01+0)
MOVW	R0, #lo_addr(_drawingTool+12)
MOVT	R0, #hi_addr(_drawingTool+12)
STR	R1, [R0, #0]
;Paint.c,103 :: 		drawingTool.EraserSelected = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_drawingTool+2)
MOVT	R0, #hi_addr(_drawingTool+2)
STRB	R1, [R0, #0]
;Paint.c,104 :: 		Eraser.Picture_Name = icon_eraser_bmp;
MOVW	R1, #lo_addr(_icon_eraser_bmp+0)
MOVT	R1, #hi_addr(_icon_eraser_bmp+0)
MOVW	R0, #lo_addr(_Eraser+16)
MOVT	R0, #hi_addr(_Eraser+16)
STR	R1, [R0, #0]
;Paint.c,105 :: 		DrawImage(&Eraser);
MOVW	R0, #lo_addr(_Eraser+0)
MOVT	R0, #hi_addr(_Eraser+0)
BL	_DrawImage+0
;Paint.c,106 :: 		Pen.Picture_Name = icon_brush_selected_bmp;
MOVW	R1, #lo_addr(_icon_brush_selected_bmp+0)
MOVT	R1, #hi_addr(_icon_brush_selected_bmp+0)
MOVW	R0, #lo_addr(_Pen+16)
MOVT	R0, #hi_addr(_Pen+16)
STR	R1, [R0, #0]
;Paint.c,107 :: 		DrawImage(&Pen);
MOVW	R0, #lo_addr(_Pen+0)
MOVT	R0, #hi_addr(_Pen+0)
BL	_DrawImage+0
;Paint.c,108 :: 		UpdatePenColor();
BL	_UpdatePenColor+0
;Paint.c,109 :: 		}
L_end_SetDefaults:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _SetDefaults
_SelectColor:
;Paint.c,118 :: 		void SelectColor(TBox *ColorBox){
; ColorBox start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ColorBox end address is: 0 (R0)
; ColorBox start address is: 0 (R0)
;Paint.c,119 :: 		if (drawingTool.CurrentColor != ColorBox){
MOVW	R1, #lo_addr(_drawingTool+12)
MOVT	R1, #hi_addr(_drawingTool+12)
LDR	R1, [R1, #0]
CMP	R1, R0
IT	EQ
BEQ	L_SelectColor7
;Paint.c,120 :: 		drawingTool.PreviousColor->Pen_Color = drawingTool.PreviousColor->Color;
MOVW	R3, #lo_addr(_drawingTool+16)
MOVT	R3, #hi_addr(_drawingTool+16)
LDR	R1, [R3, #0]
ADDW	R2, R1, #16
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, #28
LDRH	R1, [R1, #0]
STRH	R1, [R2, #0]
;Paint.c,121 :: 		DrawBox(drawingTool.PreviousColor);
MOV	R1, R3
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
BL	_DrawBox+0
LDR	R0, [SP, #4]
;Paint.c,123 :: 		drawingTool.PreviousColor = drawingTool.CurrentColor;
MOVW	R3, #lo_addr(_drawingTool+12)
MOVT	R3, #hi_addr(_drawingTool+12)
LDR	R2, [R3, #0]
MOVW	R1, #lo_addr(_drawingTool+16)
MOVT	R1, #hi_addr(_drawingTool+16)
STR	R2, [R1, #0]
;Paint.c,124 :: 		drawingTool.CurrentColor = ColorBox;
STR	R0, [R3, #0]
; ColorBox end address is: 0 (R0)
;Paint.c,125 :: 		UpdatePenColor();
BL	_UpdatePenColor+0
;Paint.c,126 :: 		}
L_SelectColor7:
;Paint.c,127 :: 		}
L_end_SelectColor:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _SelectColor
Paint____?ag:
L_end_Paint___?ag:
BX	LR
; end of Paint____?ag
