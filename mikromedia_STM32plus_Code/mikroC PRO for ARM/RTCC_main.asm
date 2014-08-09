_MyBoxOnPress:
;RTCC_main.c,59 :: 		void MyBoxOnPress(TRoller *Roller){
; Roller start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
; Roller end address is: 0 (R0)
; Roller start address is: 0 (R0)
;RTCC_main.c,63 :: 		if (Roll_Flag == 0){
MOVW	R1, #lo_addr(_Roll_flag+0)
MOVT	R1, #hi_addr(_Roll_flag+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_MyBoxOnPress0
; Roller end address is: 0 (R0)
;RTCC_main.c,64 :: 		Roll_Flag = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(_Roll_flag+0)
MOVT	R1, #hi_addr(_Roll_flag+0)
STRB	R2, [R1, #0]
;RTCC_main.c,65 :: 		OldYcoo = Ycoord;
MOVW	R1, #lo_addr(_Ycoord+0)
MOVT	R1, #hi_addr(_Ycoord+0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_OldYcoo+0)
MOVT	R1, #hi_addr(_OldYcoo+0)
STRH	R2, [R1, #0]
;RTCC_main.c,66 :: 		OldDelta = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_OldDelta+0)
MOVT	R1, #hi_addr(_OldDelta+0)
STRH	R2, [R1, #0]
;RTCC_main.c,67 :: 		return;
IT	AL
BAL	L_end_MyBoxOnPress
;RTCC_main.c,68 :: 		}
L_MyBoxOnPress0:
;RTCC_main.c,70 :: 		delta = Ycoord - OldYcoo;
; Roller start address is: 0 (R0)
MOVW	R1, #lo_addr(_OldYcoo+0)
MOVT	R1, #hi_addr(_OldYcoo+0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_Ycoord+0)
MOVT	R1, #hi_addr(_Ycoord+0)
LDRH	R1, [R1, #0]
SUB	R1, R1, R2
; delta start address is: 12 (R3)
SXTH	R3, R1
;RTCC_main.c,71 :: 		if (delta > 0){
SXTH	R1, R1
CMP	R1, #0
IT	LE
BLE	L_MyBoxOnPress1
;RTCC_main.c,72 :: 		dir = 0;
MOVS	R1, #0
STRB	R1, [SP, #16]
;RTCC_main.c,73 :: 		}
L_MyBoxOnPress1:
;RTCC_main.c,74 :: 		if (delta < 0){
CMP	R3, #0
IT	GE
BGE	L__MyBoxOnPress84
;RTCC_main.c,75 :: 		dir = 1;
MOVS	R1, #1
STRB	R1, [SP, #16]
;RTCC_main.c,76 :: 		delta = - delta;
RSBS	R3, R3, #0
SXTH	R3, R3
; delta end address is: 12 (R3)
;RTCC_main.c,77 :: 		}
IT	AL
BAL	L_MyBoxOnPress2
L__MyBoxOnPress84:
;RTCC_main.c,74 :: 		if (delta < 0){
;RTCC_main.c,77 :: 		}
L_MyBoxOnPress2:
;RTCC_main.c,79 :: 		if (delta < 4){
; delta start address is: 12 (R3)
CMP	R3, #4
IT	GE
BGE	L_MyBoxOnPress3
; Roller end address is: 0 (R0)
;RTCC_main.c,80 :: 		OldDelta = delta;
MOVW	R1, #lo_addr(_OldDelta+0)
MOVT	R1, #hi_addr(_OldDelta+0)
STRH	R3, [R1, #0]
; delta end address is: 12 (R3)
;RTCC_main.c,81 :: 		return;
IT	AL
BAL	L_end_MyBoxOnPress
;RTCC_main.c,82 :: 		}
L_MyBoxOnPress3:
;RTCC_main.c,84 :: 		step = 2;
; delta start address is: 12 (R3)
; step start address is: 8 (R2)
; Roller start address is: 0 (R0)
MOVS	R2, #2
;RTCC_main.c,86 :: 		if ((delta - OldDelta) > 5)
MOVW	R1, #lo_addr(_OldDelta+0)
MOVT	R1, #hi_addr(_OldDelta+0)
LDRH	R1, [R1, #0]
SUB	R1, R3, R1
UXTH	R1, R1
CMP	R1, #5
IT	LS
BLS	L_MyBoxOnPress4
;RTCC_main.c,87 :: 		delta += OldDelta + 5;
MOVW	R1, #lo_addr(_OldDelta+0)
MOVT	R1, #hi_addr(_OldDelta+0)
LDRH	R1, [R1, #0]
ADDS	R1, R1, #5
UXTH	R1, R1
ADDS	R3, R3, R1
SXTH	R3, R3
IT	AL
BAL	L_MyBoxOnPress5
L_MyBoxOnPress4:
;RTCC_main.c,89 :: 		delta = delta + OldDelta;
MOVW	R1, #lo_addr(_OldDelta+0)
MOVT	R1, #hi_addr(_OldDelta+0)
LDRH	R1, [R1, #0]
ADDS	R3, R3, R1
SXTH	R3, R3
; delta end address is: 12 (R3)
L_MyBoxOnPress5:
;RTCC_main.c,91 :: 		if (delta > 25){
; delta start address is: 12 (R3)
CMP	R3, #25
IT	LE
BLE	L__MyBoxOnPress86
;RTCC_main.c,92 :: 		step = 3;
MOVS	R2, #3
;RTCC_main.c,93 :: 		if (delta > 40)
CMP	R3, #40
IT	LE
BLE	L__MyBoxOnPress85
; step end address is: 8 (R2)
;RTCC_main.c,94 :: 		step = 4;
; step start address is: 4 (R1)
MOVS	R1, #4
; step end address is: 4 (R1)
UXTB	R2, R1
IT	AL
BAL	L_MyBoxOnPress7
L__MyBoxOnPress85:
;RTCC_main.c,93 :: 		if (delta > 40)
;RTCC_main.c,94 :: 		step = 4;
L_MyBoxOnPress7:
;RTCC_main.c,95 :: 		delta = 3 * delta;
; step start address is: 8 (R2)
MOVS	R1, #3
SXTH	R1, R1
MULS	R3, R1, R3
SXTH	R3, R3
; step end address is: 8 (R2)
; delta end address is: 12 (R3)
;RTCC_main.c,96 :: 		}
IT	AL
BAL	L_MyBoxOnPress6
L__MyBoxOnPress86:
;RTCC_main.c,91 :: 		if (delta > 25){
;RTCC_main.c,96 :: 		}
L_MyBoxOnPress6:
;RTCC_main.c,97 :: 		delta = delta / 2;
; delta start address is: 12 (R3)
; step start address is: 8 (R2)
ASRS	R3, R3, #1
SXTH	R3, R3
; Roller end address is: 0 (R0)
; step end address is: 8 (R2)
; delta end address is: 12 (R3)
STRB	R2, [SP, #4]
MOV	R2, R0
LDRB	R0, [SP, #4]
;RTCC_main.c,99 :: 		while (delta > 0){
L_MyBoxOnPress8:
; delta start address is: 12 (R3)
; Roller start address is: 8 (R2)
; step start address is: 0 (R0)
; step start address is: 0 (R0)
; step end address is: 0 (R0)
; Roller start address is: 8 (R2)
; Roller end address is: 8 (R2)
CMP	R3, #0
IT	LE
BLE	L_MyBoxOnPress9
; step end address is: 0 (R0)
; Roller end address is: 8 (R2)
;RTCC_main.c,100 :: 		Roll_Roller(Roller, dir, step);
; Roller start address is: 8 (R2)
; step start address is: 0 (R0)
STR	R2, [SP, #4]
STRB	R0, [SP, #8]
STRH	R3, [SP, #10]
STR	R2, [SP, #12]
LDRB	R1, [SP, #16]
UXTB	R2, R0
LDR	R0, [SP, #12]
BL	_Roll_Roller+0
LDRSH	R3, [SP, #10]
LDRB	R0, [SP, #8]
LDR	R2, [SP, #4]
;RTCC_main.c,101 :: 		delta = delta - step;
SUB	R3, R3, R0
SXTH	R3, R3
;RTCC_main.c,102 :: 		}
; step end address is: 0 (R0)
; Roller end address is: 8 (R2)
; delta end address is: 12 (R3)
IT	AL
BAL	L_MyBoxOnPress8
L_MyBoxOnPress9:
;RTCC_main.c,104 :: 		OldYcoo = Ycoord;
MOVW	R1, #lo_addr(_Ycoord+0)
MOVT	R1, #hi_addr(_Ycoord+0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_OldYcoo+0)
MOVT	R1, #hi_addr(_OldYcoo+0)
STRH	R2, [R1, #0]
;RTCC_main.c,105 :: 		OldDelta = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_OldDelta+0)
MOVT	R1, #hi_addr(_OldDelta+0)
STRH	R2, [R1, #0]
;RTCC_main.c,106 :: 		}
L_end_MyBoxOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _MyBoxOnPress
_DrawPictureLine:
;RTCC_main.c,130 :: 		void DrawPictureLine(TRoller *Image, int line, int xcoo, int ycoo){
; ycoo start address is: 12 (R3)
; xcoo start address is: 8 (R2)
; line start address is: 4 (R1)
; Image start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; ycoo end address is: 12 (R3)
; xcoo end address is: 8 (R2)
; line end address is: 4 (R1)
; Image end address is: 0 (R0)
; Image start address is: 0 (R0)
; line start address is: 4 (R1)
; xcoo start address is: 8 (R2)
; ycoo start address is: 12 (R3)
;RTCC_main.c,135 :: 		TFT_CS = 0;
MOVS	R5, #0
SXTB	R5, R5
MOVW	R4, #lo_addr(TFT_CS+0)
MOVT	R4, #hi_addr(TFT_CS+0)
STR	R5, [R4, #0]
;RTCC_main.c,136 :: 		count = (Image->Width * 2);
ADDS	R4, R0, #4
LDRH	R7, [R4, #0]
LSLS	R4, R7, #1
UXTH	R4, R4
STR	R4, [SP, #4]
;RTCC_main.c,137 :: 		ptr = Image->Picture_Name + 6 + (unsigned long)line * count;
ADDW	R4, R0, #12
; Image end address is: 0 (R0)
LDR	R4, [R4, #0]
ADDS	R6, R4, #6
SXTH	R5, R1
; line end address is: 4 (R1)
LDR	R4, [SP, #4]
MULS	R4, R5, R4
ADDS	R4, R6, R4
STR	R4, [SP, #8]
;RTCC_main.c,138 :: 		TFT_SSD1963_Set_Address_Ptr(xcoo, ycoo, xcoo + Image->Width - 1, ycoo);
ADDS	R4, R2, R7
UXTH	R4, R4
SUBS	R4, R4, #1
UXTH	R1, R3
UXTH	R3, R3
UXTH	R0, R2
; ycoo end address is: 12 (R3)
UXTH	R2, R4
; xcoo end address is: 8 (R2)
MOVW	R4, #lo_addr(_TFT_SSD1963_Set_Address_Ptr+0)
MOVT	R4, #hi_addr(_TFT_SSD1963_Set_Address_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
;RTCC_main.c,139 :: 		while(count>0){
L_DrawPictureLine10:
LDR	R4, [SP, #4]
CMP	R4, #0
IT	LE
BLE	L_DrawPictureLine11
;RTCC_main.c,140 :: 		color = (*ptr++);
LDR	R4, [SP, #8]
LDRB	R4, [R4, #0]
; color start address is: 0 (R0)
UXTB	R0, R4
LDR	R4, [SP, #8]
ADDS	R6, R4, #1
;RTCC_main.c,141 :: 		color += (*ptr++) << 8;
LDRB	R4, [R6, #0]
LSLS	R4, R4, #8
UXTH	R4, R4
ADDS	R5, R0, R4
UXTH	R5, R5
; color end address is: 0 (R0)
ADDS	R4, R6, #1
STR	R4, [SP, #8]
;RTCC_main.c,142 :: 		TFT_Write_Data_Ptr(color & *pFilter);
MOVW	R4, #lo_addr(_pFilter+0)
MOVT	R4, #hi_addr(_pFilter+0)
LDR	R4, [R4, #0]
LDRH	R4, [R4, #0]
AND	R4, R5, R4, LSL #0
UXTH	R0, R4
MOVW	R4, #lo_addr(_TFT_Write_Data_Ptr+0)
MOVT	R4, #hi_addr(_TFT_Write_Data_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
;RTCC_main.c,143 :: 		count = count-2;
LDR	R4, [SP, #4]
SUBS	R4, R4, #2
STR	R4, [SP, #4]
;RTCC_main.c,144 :: 		}
IT	AL
BAL	L_DrawPictureLine10
L_DrawPictureLine11:
;RTCC_main.c,145 :: 		TFT_CS = 1;
MOVS	R5, #1
SXTB	R5, R5
MOVW	R4, #lo_addr(TFT_CS+0)
MOVT	R4, #hi_addr(TFT_CS+0)
STR	R5, [R4, #0]
;RTCC_main.c,146 :: 		}
L_end_DrawPictureLine:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DrawPictureLine
_Draw_Picture:
;RTCC_main.c,155 :: 		void Draw_Picture(TRoller *Image, int line, int xcoo, int ycoo){
; ycoo start address is: 12 (R3)
; xcoo start address is: 8 (R2)
; line start address is: 4 (R1)
; Image start address is: 0 (R0)
SUB	SP, SP, #28
STR	LR, [SP, #0]
; ycoo end address is: 12 (R3)
; xcoo end address is: 8 (R2)
; line end address is: 4 (R1)
; Image end address is: 0 (R0)
; Image start address is: 0 (R0)
; line start address is: 4 (R1)
; xcoo start address is: 8 (R2)
; ycoo start address is: 12 (R3)
;RTCC_main.c,158 :: 		pFilter = filter;
MOVW	R5, #lo_addr(_filter+0)
MOVT	R5, #hi_addr(_filter+0)
MOVW	R4, #lo_addr(_pFilter+0)
MOVT	R4, #hi_addr(_pFilter+0)
STR	R5, [R4, #0]
;RTCC_main.c,159 :: 		for (i = 0; i < (Image->Height)/2 - 2; i ++){
; i start address is: 16 (R4)
MOVS	R4, #0
SXTB	R4, R4
; Image end address is: 0 (R0)
; line end address is: 4 (R1)
; i end address is: 16 (R4)
; xcoo end address is: 8 (R2)
; ycoo end address is: 12 (R3)
SXTH	R7, R1
MOV	R1, R0
SXTH	R0, R2
SXTB	R2, R4
L_Draw_Picture12:
; i start address is: 8 (R2)
; ycoo start address is: 12 (R3)
; xcoo start address is: 0 (R0)
; line start address is: 28 (R7)
; Image start address is: 4 (R1)
ADDS	R4, R1, #6
LDRH	R4, [R4, #0]
LSRS	R4, R4, #1
UXTH	R4, R4
SUBS	R4, R4, #2
UXTH	R4, R4
CMP	R2, R4
IT	CS
BCS	L_Draw_Picture13
;RTCC_main.c,160 :: 		temp = line - table[i];
LSLS	R5, R2, #1
MOVW	R4, #lo_addr(_table+0)
MOVT	R4, #hi_addr(_table+0)
ADDS	R4, R4, R5
LDRH	R4, [R4, #0]
SUB	R6, R7, R4
STRH	R6, [SP, #24]
;RTCC_main.c,161 :: 		if ((temp) > (signed int)(Image->ImageHeight - 1))
ADDW	R4, R1, #8
LDRH	R4, [R4, #0]
SUBS	R4, R4, #1
SXTH	R5, R4
SXTH	R4, R6
CMP	R4, R5
IT	LE
BLE	L_Draw_Picture15
;RTCC_main.c,162 :: 		temp = temp - Image->ImageHeight - 1;
ADDW	R4, R1, #8
LDRH	R5, [R4, #0]
LDRSH	R4, [SP, #24]
SUB	R4, R4, R5
UXTH	R4, R4
SUBS	R4, R4, #1
STRH	R4, [SP, #24]
L_Draw_Picture15:
;RTCC_main.c,163 :: 		if (temp < 0)
LDRSH	R4, [SP, #24]
CMP	R4, #0
IT	GE
BGE	L_Draw_Picture16
;RTCC_main.c,164 :: 		temp = Image->ImageHeight - 1 + temp;
ADDW	R4, R1, #8
LDRH	R4, [R4, #0]
SUBS	R5, R4, #1
UXTH	R5, R5
LDRSH	R4, [SP, #24]
ADDS	R4, R5, R4
STRH	R4, [SP, #24]
L_Draw_Picture16:
;RTCC_main.c,165 :: 		DrawPictureLine(Image, temp, xcoo, ycoo);
STR	R1, [SP, #4]
STRH	R7, [SP, #8]
STRH	R0, [SP, #12]
STRH	R3, [SP, #16]
STRB	R2, [SP, #18]
SXTH	R2, R0
MOV	R0, R1
LDRSH	R1, [SP, #24]
BL	_DrawPictureLine+0
LDRSB	R2, [SP, #18]
LDRSH	R3, [SP, #16]
LDRSH	R0, [SP, #12]
LDRSH	R7, [SP, #8]
LDR	R1, [SP, #4]
;RTCC_main.c,166 :: 		line ++;
ADDS	R7, R7, #1
SXTH	R7, R7
;RTCC_main.c,167 :: 		ycoo ++;
ADDS	R3, R3, #1
SXTH	R3, R3
;RTCC_main.c,168 :: 		pFilter ++;
MOVW	R5, #lo_addr(_pFilter+0)
MOVT	R5, #hi_addr(_pFilter+0)
LDR	R4, [R5, #0]
ADDS	R4, R4, #2
STR	R4, [R5, #0]
;RTCC_main.c,159 :: 		for (i = 0; i < (Image->Height)/2 - 2; i ++){
ADDS	R2, R2, #1
SXTB	R2, R2
;RTCC_main.c,169 :: 		}
; i end address is: 8 (R2)
IT	AL
BAL	L_Draw_Picture12
L_Draw_Picture13:
;RTCC_main.c,170 :: 		pFilter = &filter[(Image->Height)/2 - 2];
ADDS	R4, R1, #6
LDRH	R4, [R4, #0]
LSRS	R4, R4, #1
UXTH	R4, R4
SUBS	R4, R4, #2
UXTH	R4, R4
LSLS	R5, R4, #1
MOVW	R4, #lo_addr(_filter+0)
MOVT	R4, #hi_addr(_filter+0)
ADDS	R5, R4, R5
MOVW	R4, #lo_addr(_pFilter+0)
MOVT	R4, #hi_addr(_pFilter+0)
STR	R5, [R4, #0]
;RTCC_main.c,171 :: 		for (i = 95; i >= 0; i --){
; i start address is: 8 (R2)
MOVS	R2, #95
SXTB	R2, R2
; xcoo end address is: 0 (R0)
; i end address is: 8 (R2)
; line end address is: 28 (R7)
; ycoo end address is: 12 (R3)
STRB	R2, [SP, #4]
SXTH	R2, R0
LDRSB	R0, [SP, #4]
L_Draw_Picture17:
; i start address is: 0 (R0)
; xcoo start address is: 8 (R2)
; Image start address is: 4 (R1)
; Image end address is: 4 (R1)
; line start address is: 28 (R7)
; xcoo start address is: 8 (R2)
; xcoo end address is: 8 (R2)
; ycoo start address is: 12 (R3)
CMP	R0, #0
IT	LT
BLT	L_Draw_Picture18
; Image end address is: 4 (R1)
; xcoo end address is: 8 (R2)
;RTCC_main.c,172 :: 		temp = line + table[i];
; xcoo start address is: 8 (R2)
; Image start address is: 4 (R1)
LSLS	R5, R0, #1
MOVW	R4, #lo_addr(_table+0)
MOVT	R4, #hi_addr(_table+0)
ADDS	R4, R4, R5
LDRH	R4, [R4, #0]
ADDS	R6, R7, R4
STRH	R6, [SP, #24]
;RTCC_main.c,173 :: 		if (temp > (signed int)(Image->ImageHeight - 1))
ADDW	R4, R1, #8
LDRH	R4, [R4, #0]
SUBS	R4, R4, #1
SXTH	R5, R4
SXTH	R4, R6
CMP	R4, R5
IT	LE
BLE	L_Draw_Picture20
;RTCC_main.c,174 :: 		temp = temp - Image->ImageHeight - 1;
ADDW	R4, R1, #8
LDRH	R5, [R4, #0]
LDRSH	R4, [SP, #24]
SUB	R4, R4, R5
UXTH	R4, R4
SUBS	R4, R4, #1
STRH	R4, [SP, #24]
L_Draw_Picture20:
;RTCC_main.c,175 :: 		if (temp < 0)
LDRSH	R4, [SP, #24]
CMP	R4, #0
IT	GE
BGE	L_Draw_Picture21
;RTCC_main.c,176 :: 		temp = Image->ImageHeight - 1 + temp;
ADDW	R4, R1, #8
LDRH	R4, [R4, #0]
SUBS	R5, R4, #1
UXTH	R5, R5
LDRSH	R4, [SP, #24]
ADDS	R4, R5, R4
STRH	R4, [SP, #24]
L_Draw_Picture21:
;RTCC_main.c,177 :: 		DrawPictureLine(Image, temp, xcoo, ycoo);
STRH	R3, [SP, #4]
STRH	R2, [SP, #8]
STRH	R7, [SP, #12]
STR	R1, [SP, #16]
STRB	R0, [SP, #20]
MOV	R0, R1
LDRSH	R1, [SP, #24]
BL	_DrawPictureLine+0
LDRSB	R0, [SP, #20]
LDR	R1, [SP, #16]
LDRSH	R7, [SP, #12]
LDRSH	R2, [SP, #8]
LDRSH	R3, [SP, #4]
;RTCC_main.c,178 :: 		line ++;
ADDS	R4, R7, #1
; line end address is: 28 (R7)
; line start address is: 24 (R6)
SXTH	R6, R4
;RTCC_main.c,179 :: 		ycoo ++;
ADDS	R3, R3, #1
SXTH	R3, R3
;RTCC_main.c,180 :: 		pFilter --;
MOVW	R5, #lo_addr(_pFilter+0)
MOVT	R5, #hi_addr(_pFilter+0)
LDR	R4, [R5, #0]
SUBS	R4, R4, #2
STR	R4, [R5, #0]
;RTCC_main.c,171 :: 		for (i = 95; i >= 0; i --){
SUBS	R0, R0, #1
SXTB	R0, R0
;RTCC_main.c,181 :: 		}
; Image end address is: 4 (R1)
; xcoo end address is: 8 (R2)
; line end address is: 24 (R6)
; ycoo end address is: 12 (R3)
; i end address is: 0 (R0)
SXTH	R7, R6
IT	AL
BAL	L_Draw_Picture17
L_Draw_Picture18:
;RTCC_main.c,182 :: 		}
L_end_Draw_Picture:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _Draw_Picture
_Roll_Get_Level:
;RTCC_main.c,191 :: 		char Roll_Get_Level(TRoller *Roller){
; Roller start address is: 0 (R0)
; Roller end address is: 0 (R0)
; Roller start address is: 0 (R0)
;RTCC_main.c,192 :: 		Roller->currentlevel = Roller->position / (Roller->ImageHeight / Roller->levels);
ADDW	R4, R0, #16
ADDW	R1, R0, #20
LDRSH	R3, [R1, #0]
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UDIV	R1, R2, R1
UXTH	R1, R1
UDIV	R1, R3, R1
STRH	R1, [R4, #0]
;RTCC_main.c,193 :: 		return Roller->currentlevel;
ADDW	R1, R0, #16
; Roller end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTB	R0, R1
;RTCC_main.c,194 :: 		}
L_end_Roll_Get_Level:
BX	LR
; end of _Roll_Get_Level
_Roll_Set_Level:
;RTCC_main.c,203 :: 		void Roll_Set_Level(TRoller *Roller, char level){
; level start address is: 4 (R1)
; Roller start address is: 0 (R0)
; level end address is: 4 (R1)
; Roller end address is: 0 (R0)
; Roller start address is: 0 (R0)
; level start address is: 4 (R1)
;RTCC_main.c,204 :: 		Roller->currentlevel = level;
ADDW	R2, R0, #16
STRH	R1, [R2, #0]
;RTCC_main.c,205 :: 		Roller->position = Roller->ImageHeight * level / Roller->levels;
ADDW	R4, R0, #20
ADDW	R2, R0, #8
LDRH	R2, [R2, #0]
MUL	R3, R2, R1
UXTH	R3, R3
; level end address is: 4 (R1)
ADDW	R2, R0, #22
; Roller end address is: 0 (R0)
LDRB	R2, [R2, #0]
UDIV	R2, R3, R2
STRH	R2, [R4, #0]
;RTCC_main.c,206 :: 		}
L_end_Roll_Set_Level:
BX	LR
; end of _Roll_Set_Level
_Roll_Roller:
;RTCC_main.c,215 :: 		void Roll_Roller(TRoller *Roller, char dir, char step){
; step start address is: 8 (R2)
; dir start address is: 4 (R1)
; Roller start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; step end address is: 8 (R2)
; dir end address is: 4 (R1)
; Roller end address is: 0 (R0)
; Roller start address is: 0 (R0)
; dir start address is: 4 (R1)
; step start address is: 8 (R2)
;RTCC_main.c,218 :: 		if (dir)
CMP	R1, #0
IT	EQ
BEQ	L_Roll_Roller22
; dir end address is: 4 (R1)
;RTCC_main.c,219 :: 		Roller->position += step;
ADDW	R4, R0, #20
LDRSH	R3, [R4, #0]
ADDS	R3, R3, R2
; step end address is: 8 (R2)
STRH	R3, [R4, #0]
IT	AL
BAL	L_Roll_Roller23
L_Roll_Roller22:
;RTCC_main.c,221 :: 		Roller->position -= step;
; step start address is: 8 (R2)
ADDW	R4, R0, #20
LDRSH	R3, [R4, #0]
SUB	R3, R3, R2
; step end address is: 8 (R2)
STRH	R3, [R4, #0]
L_Roll_Roller23:
;RTCC_main.c,223 :: 		if (Roller->position > (signed int)Roller->ImageHeight - 1)
ADDW	R3, R0, #20
LDRSH	R4, [R3, #0]
ADDW	R3, R0, #8
LDRH	R3, [R3, #0]
SXTH	R3, R3
SUBS	R3, R3, #1
SXTH	R3, R3
CMP	R4, R3
IT	LE
BLE	L_Roll_Roller24
;RTCC_main.c,224 :: 		Roller->position = 0;
ADDW	R4, R0, #20
MOVS	R3, #0
SXTH	R3, R3
STRH	R3, [R4, #0]
L_Roll_Roller24:
;RTCC_main.c,225 :: 		if (Roller->position < 0)
ADDW	R3, R0, #20
LDRSH	R3, [R3, #0]
CMP	R3, #0
IT	GE
BGE	L_Roll_Roller25
;RTCC_main.c,226 :: 		Roller->position = Roller->ImageHeight - 1;
ADDW	R4, R0, #20
ADDW	R3, R0, #8
LDRH	R3, [R3, #0]
SUBS	R3, R3, #1
STRH	R3, [R4, #0]
L_Roll_Roller25:
;RTCC_main.c,227 :: 		Draw_Picture(Roller, Roller->position - Roller->Height/2, Roller->Left, Roller->Top);
ADDS	R3, R0, #2
LDRH	R3, [R3, #0]
SXTH	R6, R3
LDRH	R3, [R0, #0]
SXTH	R5, R3
ADDW	R3, R0, #20
LDRSH	R4, [R3, #0]
ADDS	R3, R0, #6
LDRH	R3, [R3, #0]
LSRS	R3, R3, #1
UXTH	R3, R3
SUB	R3, R4, R3
SXTH	R2, R5
SXTH	R1, R3
SXTH	R3, R6
; Roller end address is: 0 (R0)
BL	_Draw_Picture+0
;RTCC_main.c,228 :: 		}
L_end_Roll_Roller:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Roll_Roller
_Set_Roller:
;RTCC_main.c,237 :: 		void Set_Roller(TRoller *Roller, int pos, char step){
; step start address is: 8 (R2)
; pos start address is: 4 (R1)
; Roller start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
; step end address is: 8 (R2)
; pos end address is: 4 (R1)
; Roller end address is: 0 (R0)
; Roller start address is: 0 (R0)
; pos start address is: 4 (R1)
; step start address is: 8 (R2)
;RTCC_main.c,240 :: 		temp = pos * Roller->ImageHeight / Roller->levels + Roller->ImageHeight / Roller->levels / 2;
ADDW	R3, R0, #8
LDRH	R5, [R3, #0]
MUL	R4, R1, R5
UXTH	R4, R4
; pos end address is: 4 (R1)
ADDW	R3, R0, #22
LDRB	R3, [R3, #0]
UDIV	R4, R4, R3
UXTH	R4, R4
UDIV	R3, R5, R3
UXTH	R3, R3
LSRS	R3, R3, #1
UXTH	R3, R3
ADDS	R5, R4, R3
;RTCC_main.c,241 :: 		temp = temp - Roller->position;
ADDW	R3, R0, #20
LDRSH	R4, [R3, #0]
SXTH	R3, R5
SUB	R3, R3, R4
SXTH	R3, R3
; temp start address is: 16 (R4)
SXTH	R4, R3
;RTCC_main.c,242 :: 		if (temp > 0)
CMP	R3, #0
IT	LE
BLE	L_Set_Roller26
;RTCC_main.c,243 :: 		direction = 1;
; direction start address is: 4 (R1)
MOVS	R1, #1
; direction end address is: 4 (R1)
IT	AL
BAL	L_Set_Roller27
L_Set_Roller26:
;RTCC_main.c,245 :: 		direction = 0;
; direction start address is: 4 (R1)
MOVS	R1, #0
;RTCC_main.c,246 :: 		temp = -temp;
RSBS	R4, R4, #0
SXTH	R4, R4
; direction end address is: 4 (R1)
; temp end address is: 16 (R4)
;RTCC_main.c,247 :: 		}
L_Set_Roller27:
;RTCC_main.c,248 :: 		while (temp > step){
; temp start address is: 16 (R4)
; direction start address is: 4 (R1)
STRB	R1, [SP, #4]
; Roller end address is: 0 (R0)
; step end address is: 8 (R2)
; direction end address is: 4 (R1)
; temp end address is: 16 (R4)
UXTB	R1, R2
MOV	R2, R0
LDRB	R0, [SP, #4]
L_Set_Roller28:
; direction start address is: 0 (R0)
; temp start address is: 16 (R4)
; step start address is: 4 (R1)
; Roller start address is: 8 (R2)
CMP	R4, R1
IT	LE
BLE	L_Set_Roller29
;RTCC_main.c,249 :: 		Roll_Roller(Roller, direction, step);
STR	R2, [SP, #4]
STRB	R1, [SP, #8]
STRH	R4, [SP, #10]
STRB	R0, [SP, #12]
STRB	R0, [SP, #13]
MOV	R0, R2
UXTB	R2, R1
LDRB	R1, [SP, #13]
BL	_Roll_Roller+0
LDRB	R0, [SP, #12]
LDRSH	R4, [SP, #10]
LDRB	R1, [SP, #8]
LDR	R2, [SP, #4]
;RTCC_main.c,250 :: 		temp -= step;
SUB	R4, R4, R1
SXTH	R4, R4
;RTCC_main.c,251 :: 		}
; step end address is: 4 (R1)
IT	AL
BAL	L_Set_Roller28
L_Set_Roller29:
;RTCC_main.c,252 :: 		Roll_Roller(Roller, direction, temp);
UXTB	R1, R0
; temp end address is: 16 (R4)
MOV	R0, R2
; direction end address is: 0 (R0)
UXTB	R2, R4
; Roller end address is: 8 (R2)
BL	_Roll_Roller+0
;RTCC_main.c,253 :: 		}
L_end_Set_Roller:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _Set_Roller
_Roller_Deactivate:
;RTCC_main.c,262 :: 		void Roller_Deactivate(TRoller *Roller, unsigned int xpos, unsigned int ypos){
; Roller start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
STRH	R1, [SP, #12]
STRH	R2, [SP, #16]
; Roller end address is: 0 (R0)
; Roller start address is: 0 (R0)
;RTCC_main.c,264 :: 		TFT_Set_Pen(Clock.Color, 0);
MOVW	R3, #lo_addr(_Clock+0)
MOVT	R3, #hi_addr(_Clock+0)
LDRH	R3, [R3, #0]
STR	R0, [SP, #4]
MOVS	R1, #0
UXTH	R0, R3
BL	_TFT_Set_Pen+0
;RTCC_main.c,265 :: 		TFT_Set_Brush(1, Clock.Color, 0, 0, 0, 0);
MOVS	R5, #0
MOVS	R4, #0
MOVW	R3, #lo_addr(_Clock+0)
MOVT	R3, #hi_addr(_Clock+0)
LDRH	R3, [R3, #0]
MOVS	R2, #0
UXTH	R1, R3
MOVS	R3, #0
MOVS	R0, #1
PUSH	(R5)
PUSH	(R4)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;RTCC_main.c,266 :: 		TFT_Rectangle(Roller->Left, Roller->Top, Roller->Left + Roller->Width, Roller->Top + Roller->Height);
ADDS	R3, R0, #2
LDRH	R4, [R3, #0]
ADDS	R3, R0, #6
LDRH	R3, [R3, #0]
ADDS	R7, R4, R3
LDRH	R6, [R0, #0]
ADDS	R3, R0, #4
LDRH	R3, [R3, #0]
ADDS	R5, R6, R3
SXTH	R4, R4
SXTH	R3, R6
STR	R0, [SP, #4]
SXTH	R2, R5
SXTH	R1, R4
SXTH	R0, R3
SXTH	R3, R7
BL	_TFT_Rectangle+0
LDR	R0, [SP, #4]
;RTCC_main.c,267 :: 		text[0] = Roller->currentlevel + 48;
ADD	R4, SP, #8
ADDW	R3, R0, #16
LDRH	R3, [R3, #0]
ADDS	R3, #48
STRB	R3, [R4, #0]
;RTCC_main.c,268 :: 		text[1] = 0;
ADDS	R4, R4, #1
MOVS	R3, #0
STRB	R3, [R4, #0]
;RTCC_main.c,269 :: 		TFT_Set_Font(Label15.FontName, CL_WHITE, FO_HORIZONTAL);
MOVW	R3, #lo_addr(_Label15+20)
MOVT	R3, #hi_addr(_Label15+20)
LDR	R3, [R3, #0]
STR	R0, [SP, #4]
MOVS	R2, #0
MOVW	R1, #65535
MOV	R0, R3
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
;RTCC_main.c,270 :: 		if (Roller == &AmPm){
MOVW	R3, #lo_addr(_AmPm+0)
MOVT	R3, #hi_addr(_AmPm+0)
CMP	R0, R3
IT	NE
BNE	L_Roller_Deactivate30
;RTCC_main.c,271 :: 		if (Roller->currentlevel == 0)
ADDW	R3, R0, #16
LDRH	R3, [R3, #0]
CMP	R3, #0
IT	NE
BNE	L_Roller_Deactivate31
; Roller end address is: 0 (R0)
;RTCC_main.c,272 :: 		TFT_Write_Text("AM", xpos, ypos);
MOVW	R3, #lo_addr(?lstr1_RTCC_main+0)
MOVT	R3, #hi_addr(?lstr1_RTCC_main+0)
LDRH	R2, [SP, #16]
LDRH	R1, [SP, #12]
MOV	R0, R3
BL	_TFT_Write_Text+0
IT	AL
BAL	L_Roller_Deactivate32
L_Roller_Deactivate31:
;RTCC_main.c,273 :: 		else if (Roller->currentlevel == 1)
; Roller start address is: 0 (R0)
ADDW	R3, R0, #16
; Roller end address is: 0 (R0)
LDRH	R3, [R3, #0]
CMP	R3, #1
IT	NE
BNE	L_Roller_Deactivate33
;RTCC_main.c,274 :: 		TFT_Write_Text("PM", xpos, ypos);
MOVW	R3, #lo_addr(?lstr2_RTCC_main+0)
MOVT	R3, #hi_addr(?lstr2_RTCC_main+0)
LDRH	R2, [SP, #16]
LDRH	R1, [SP, #12]
MOV	R0, R3
BL	_TFT_Write_Text+0
L_Roller_Deactivate33:
L_Roller_Deactivate32:
;RTCC_main.c,275 :: 		}
IT	AL
BAL	L_Roller_Deactivate34
L_Roller_Deactivate30:
;RTCC_main.c,277 :: 		TFT_Write_Text(text, xpos, ypos);
ADD	R3, SP, #8
LDRH	R2, [SP, #16]
LDRH	R1, [SP, #12]
MOV	R0, R3
BL	_TFT_Write_Text+0
L_Roller_Deactivate34:
;RTCC_main.c,278 :: 		}
L_end_Roller_Deactivate:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _Roller_Deactivate
_Roller_Init:
;RTCC_main.c,287 :: 		void Roller_Init(){
;RTCC_main.c,288 :: 		Hour1Roll.Left = 108;
MOVS	R1, #108
MOVW	R0, #lo_addr(_Hour1Roll+0)
MOVT	R0, #hi_addr(_Hour1Roll+0)
STRH	R1, [R0, #0]
;RTCC_main.c,289 :: 		Hour1Roll.Top  = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Hour1Roll+2)
MOVT	R0, #hi_addr(_Hour1Roll+2)
STRH	R1, [R0, #0]
;RTCC_main.c,290 :: 		Hour1Roll.Width = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Hour1Roll+4)
MOVT	R0, #hi_addr(_Hour1Roll+4)
STRH	R1, [R0, #0]
;RTCC_main.c,291 :: 		Hour1Roll.Height = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Hour1Roll+6)
MOVT	R0, #hi_addr(_Hour1Roll+6)
STRH	R1, [R0, #0]
;RTCC_main.c,292 :: 		Hour1Roll.ImageHeight = 148;
MOVS	R1, #148
MOVW	R0, #lo_addr(_Hour1Roll+8)
MOVT	R0, #hi_addr(_Hour1Roll+8)
STRH	R1, [R0, #0]
;RTCC_main.c,293 :: 		Hour1Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Hour1Roll+18)
MOVT	R0, #hi_addr(_Hour1Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,294 :: 		Hour1Roll.Picture_Name = stripe_green_bmp;
MOVW	R2, #lo_addr(_stripe_green_bmp+0)
MOVT	R2, #hi_addr(_stripe_green_bmp+0)
MOVW	R0, #lo_addr(_Hour1Roll+12)
MOVT	R0, #hi_addr(_Hour1Roll+12)
STR	R2, [R0, #0]
;RTCC_main.c,295 :: 		Hour1Roll.position = 148 / 2 / 2; // 740 / 10 / 2;
MOVS	R1, #37
SXTH	R1, R1
MOVW	R0, #lo_addr(_Hour1Roll+20)
MOVT	R0, #hi_addr(_Hour1Roll+20)
STRH	R1, [R0, #0]
;RTCC_main.c,296 :: 		Hour1Roll.levels = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Hour1Roll+22)
MOVT	R0, #hi_addr(_Hour1Roll+22)
STRB	R1, [R0, #0]
;RTCC_main.c,298 :: 		Hour2Roll.Left = 146;
MOVS	R1, #146
MOVW	R0, #lo_addr(_Hour2Roll+0)
MOVT	R0, #hi_addr(_Hour2Roll+0)
STRH	R1, [R0, #0]
;RTCC_main.c,299 :: 		Hour2Roll.Top  = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Hour2Roll+2)
MOVT	R0, #hi_addr(_Hour2Roll+2)
STRH	R1, [R0, #0]
;RTCC_main.c,300 :: 		Hour2Roll.Width = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Hour2Roll+4)
MOVT	R0, #hi_addr(_Hour2Roll+4)
STRH	R1, [R0, #0]
;RTCC_main.c,301 :: 		Hour2Roll.Height = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Hour2Roll+6)
MOVT	R0, #hi_addr(_Hour2Roll+6)
STRH	R1, [R0, #0]
;RTCC_main.c,302 :: 		Hour2Roll.ImageHeight = 740;
MOVW	R1, #740
MOVW	R0, #lo_addr(_Hour2Roll+8)
MOVT	R0, #hi_addr(_Hour2Roll+8)
STRH	R1, [R0, #0]
;RTCC_main.c,303 :: 		Hour2Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Hour2Roll+18)
MOVT	R0, #hi_addr(_Hour2Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,304 :: 		Hour2Roll.Picture_Name = stripe_green_bmp;
MOVW	R0, #lo_addr(_Hour2Roll+12)
MOVT	R0, #hi_addr(_Hour2Roll+12)
STR	R2, [R0, #0]
;RTCC_main.c,305 :: 		Hour2Roll.position =  740 / 10 / 2;
MOVS	R1, #37
SXTH	R1, R1
MOVW	R0, #lo_addr(_Hour2Roll+20)
MOVT	R0, #hi_addr(_Hour2Roll+20)
STRH	R1, [R0, #0]
;RTCC_main.c,306 :: 		Hour2Roll.levels = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Hour2Roll+22)
MOVT	R0, #hi_addr(_Hour2Roll+22)
STRB	R1, [R0, #0]
;RTCC_main.c,308 :: 		Minute1Roll.Left = 212;
MOVS	R1, #212
MOVW	R0, #lo_addr(_Minute1Roll+0)
MOVT	R0, #hi_addr(_Minute1Roll+0)
STRH	R1, [R0, #0]
;RTCC_main.c,309 :: 		Minute1Roll.Top  = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Minute1Roll+2)
MOVT	R0, #hi_addr(_Minute1Roll+2)
STRH	R1, [R0, #0]
;RTCC_main.c,310 :: 		Minute1Roll.Width = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Minute1Roll+4)
MOVT	R0, #hi_addr(_Minute1Roll+4)
STRH	R1, [R0, #0]
;RTCC_main.c,311 :: 		Minute1Roll.Height = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Minute1Roll+6)
MOVT	R0, #hi_addr(_Minute1Roll+6)
STRH	R1, [R0, #0]
;RTCC_main.c,312 :: 		Minute1Roll.ImageHeight = 444;
MOVW	R1, #444
MOVW	R0, #lo_addr(_Minute1Roll+8)
MOVT	R0, #hi_addr(_Minute1Roll+8)
STRH	R1, [R0, #0]
;RTCC_main.c,313 :: 		Minute1Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Minute1Roll+18)
MOVT	R0, #hi_addr(_Minute1Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,314 :: 		Minute1Roll.Picture_Name = stripe_green_bmp;
MOVW	R0, #lo_addr(_Minute1Roll+12)
MOVT	R0, #hi_addr(_Minute1Roll+12)
STR	R2, [R0, #0]
;RTCC_main.c,315 :: 		Minute1Roll.position =  444 / 6 / 2;
MOVS	R1, #37
SXTH	R1, R1
MOVW	R0, #lo_addr(_Minute1Roll+20)
MOVT	R0, #hi_addr(_Minute1Roll+20)
STRH	R1, [R0, #0]
;RTCC_main.c,316 :: 		Minute1Roll.levels = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Minute1Roll+22)
MOVT	R0, #hi_addr(_Minute1Roll+22)
STRB	R1, [R0, #0]
;RTCC_main.c,318 :: 		Minute2Roll.Left = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Minute2Roll+0)
MOVT	R0, #hi_addr(_Minute2Roll+0)
STRH	R1, [R0, #0]
;RTCC_main.c,319 :: 		Minute2Roll.Top  = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Minute2Roll+2)
MOVT	R0, #hi_addr(_Minute2Roll+2)
STRH	R1, [R0, #0]
;RTCC_main.c,320 :: 		Minute2Roll.Width = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Minute2Roll+4)
MOVT	R0, #hi_addr(_Minute2Roll+4)
STRH	R1, [R0, #0]
;RTCC_main.c,321 :: 		Minute2Roll.Height = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Minute2Roll+6)
MOVT	R0, #hi_addr(_Minute2Roll+6)
STRH	R1, [R0, #0]
;RTCC_main.c,322 :: 		Minute2Roll.ImageHeight = 740;
MOVW	R1, #740
MOVW	R0, #lo_addr(_Minute2Roll+8)
MOVT	R0, #hi_addr(_Minute2Roll+8)
STRH	R1, [R0, #0]
;RTCC_main.c,323 :: 		Minute2Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Minute2Roll+18)
MOVT	R0, #hi_addr(_Minute2Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,324 :: 		Minute2Roll.Picture_Name = stripe_green_bmp;
MOVW	R0, #lo_addr(_Minute2Roll+12)
MOVT	R0, #hi_addr(_Minute2Roll+12)
STR	R2, [R0, #0]
;RTCC_main.c,325 :: 		Minute2Roll.position =  740 / 10 / 2;
MOVS	R1, #37
SXTH	R1, R1
MOVW	R0, #lo_addr(_Minute2Roll+20)
MOVT	R0, #hi_addr(_Minute2Roll+20)
STRH	R1, [R0, #0]
;RTCC_main.c,326 :: 		Minute2Roll.levels = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Minute2Roll+22)
MOVT	R0, #hi_addr(_Minute2Roll+22)
STRB	R1, [R0, #0]
;RTCC_main.c,328 :: 		AmPm.Left         = 305;
MOVW	R1, #305
MOVW	R0, #lo_addr(_AmPm+0)
MOVT	R0, #hi_addr(_AmPm+0)
STRH	R1, [R0, #0]
;RTCC_main.c,329 :: 		AmPm.Top          = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_AmPm+2)
MOVT	R0, #hi_addr(_AmPm+2)
STRH	R1, [R0, #0]
;RTCC_main.c,330 :: 		AmPm.Width        = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_AmPm+4)
MOVT	R0, #hi_addr(_AmPm+4)
STRH	R1, [R0, #0]
;RTCC_main.c,331 :: 		AmPm.Height       = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_AmPm+6)
MOVT	R0, #hi_addr(_AmPm+6)
STRH	R1, [R0, #0]
;RTCC_main.c,332 :: 		AmPm.ImageHeight  = 151;
MOVS	R1, #151
MOVW	R0, #lo_addr(_AmPm+8)
MOVT	R0, #hi_addr(_AmPm+8)
STRH	R1, [R0, #0]
;RTCC_main.c,333 :: 		AmPm.Picture_Name = am_pm_bmp;
MOVW	R1, #lo_addr(_am_pm_bmp+0)
MOVT	R1, #hi_addr(_am_pm_bmp+0)
MOVW	R0, #lo_addr(_AmPm+12)
MOVT	R0, #hi_addr(_AmPm+12)
STR	R1, [R0, #0]
;RTCC_main.c,334 :: 		AmPm.currentlevel = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_AmPm+16)
MOVT	R0, #hi_addr(_AmPm+16)
STRH	R1, [R0, #0]
;RTCC_main.c,335 :: 		AmPm.active       = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_AmPm+18)
MOVT	R0, #hi_addr(_AmPm+18)
STRH	R1, [R0, #0]
;RTCC_main.c,336 :: 		AmPm.position     = 151 / 2 / 2;
MOVS	R1, #37
SXTH	R1, R1
MOVW	R0, #lo_addr(_AmPm+20)
MOVT	R0, #hi_addr(_AmPm+20)
STRH	R1, [R0, #0]
;RTCC_main.c,337 :: 		AmPm.levels       = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_AmPm+22)
MOVT	R0, #hi_addr(_AmPm+22)
STRB	R1, [R0, #0]
;RTCC_main.c,338 :: 		}
L_end_Roller_Init:
BX	LR
; end of _Roller_Init
_HoursTens:
;RTCC_main.c,347 :: 		void HoursTens(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;RTCC_main.c,349 :: 		if (Hour1Roll.active == 0){
MOVW	R0, #lo_addr(_Hour1Roll+18)
MOVT	R0, #hi_addr(_Hour1Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_HoursTens35
;RTCC_main.c,350 :: 		if (Hour2Roll.active == 1){
MOVW	R0, #lo_addr(_Hour2Roll+18)
MOVT	R0, #hi_addr(_Hour2Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_HoursTens36
;RTCC_main.c,351 :: 		Roller_Deactivate(&Hour2Roll, 149, 96);
MOVS	R2, #96
MOVS	R1, #149
MOVW	R0, #lo_addr(_Hour2Roll+0)
MOVT	R0, #hi_addr(_Hour2Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,352 :: 		Hour2Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Hour2Roll+18)
MOVT	R0, #hi_addr(_Hour2Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,353 :: 		}
L_HoursTens36:
;RTCC_main.c,354 :: 		if (Minute1Roll.active == 1){
MOVW	R0, #lo_addr(_Minute1Roll+18)
MOVT	R0, #hi_addr(_Minute1Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_HoursTens37
;RTCC_main.c,355 :: 		Roller_Deactivate(&Minute1Roll, 215, 96);
MOVS	R2, #96
MOVS	R1, #215
MOVW	R0, #lo_addr(_Minute1Roll+0)
MOVT	R0, #hi_addr(_Minute1Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,356 :: 		Minute1Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Minute1Roll+18)
MOVT	R0, #hi_addr(_Minute1Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,357 :: 		}
L_HoursTens37:
;RTCC_main.c,358 :: 		if (Minute2Roll.active == 1){
MOVW	R0, #lo_addr(_Minute2Roll+18)
MOVT	R0, #hi_addr(_Minute2Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_HoursTens38
;RTCC_main.c,359 :: 		Roller_Deactivate(&Minute2Roll, 253, 96);
MOVS	R2, #96
MOVS	R1, #253
MOVW	R0, #lo_addr(_Minute2Roll+0)
MOVT	R0, #hi_addr(_Minute2Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,360 :: 		Minute2Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Minute2Roll+18)
MOVT	R0, #hi_addr(_Minute2Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,361 :: 		}
L_HoursTens38:
;RTCC_main.c,362 :: 		if (AmPm.active == 1){
MOVW	R0, #lo_addr(_AmPm+18)
MOVT	R0, #hi_addr(_AmPm+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_HoursTens39
;RTCC_main.c,363 :: 		Roller_Deactivate(&AmPm, 307, 96);
MOVS	R2, #96
MOVW	R1, #307
MOVW	R0, #lo_addr(_AmPm+0)
MOVT	R0, #hi_addr(_AmPm+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,364 :: 		AmPm.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_AmPm+18)
MOVT	R0, #hi_addr(_AmPm+18)
STRH	R1, [R0, #0]
;RTCC_main.c,365 :: 		}
L_HoursTens39:
;RTCC_main.c,367 :: 		Draw_Picture(&Hour1Roll, Hour1Roll.position - 96, Hour1Roll.Left, Hour1Roll.Top);
MOVW	R0, #lo_addr(_Hour1Roll+2)
MOVT	R0, #hi_addr(_Hour1Roll+2)
LDRH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Hour1Roll+0)
MOVT	R0, #hi_addr(_Hour1Roll+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Hour1Roll+20)
MOVT	R0, #hi_addr(_Hour1Roll+20)
LDRSH	R0, [R0, #0]
SUBS	R0, #96
SXTH	R3, R2
SXTH	R2, R1
SXTH	R1, R0
MOVW	R0, #lo_addr(_Hour1Roll+0)
MOVT	R0, #hi_addr(_Hour1Roll+0)
BL	_Draw_Picture+0
;RTCC_main.c,368 :: 		}
L_HoursTens35:
;RTCC_main.c,370 :: 		MyBoxOnPress(&Hour1Roll);
MOVW	R0, #lo_addr(_Hour1Roll+0)
MOVT	R0, #hi_addr(_Hour1Roll+0)
BL	_MyBoxOnPress+0
;RTCC_main.c,371 :: 		Hour1Roll.active = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_Hour1Roll+18)
MOVT	R0, #hi_addr(_Hour1Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,372 :: 		}
L_end_HoursTens:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _HoursTens
_HoursOnes:
;RTCC_main.c,381 :: 		void HoursOnes(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;RTCC_main.c,383 :: 		if (Hour2Roll.active == 0){
MOVW	R0, #lo_addr(_Hour2Roll+18)
MOVT	R0, #hi_addr(_Hour2Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_HoursOnes40
;RTCC_main.c,384 :: 		if (Hour1Roll.active == 1){
MOVW	R0, #lo_addr(_Hour1Roll+18)
MOVT	R0, #hi_addr(_Hour1Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_HoursOnes41
;RTCC_main.c,385 :: 		Roller_Deactivate(&Hour1Roll, 111, 96);
MOVS	R2, #96
MOVS	R1, #111
MOVW	R0, #lo_addr(_Hour1Roll+0)
MOVT	R0, #hi_addr(_Hour1Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,386 :: 		Hour1Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Hour1Roll+18)
MOVT	R0, #hi_addr(_Hour1Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,387 :: 		}
L_HoursOnes41:
;RTCC_main.c,388 :: 		if (Minute1Roll.active == 1){
MOVW	R0, #lo_addr(_Minute1Roll+18)
MOVT	R0, #hi_addr(_Minute1Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_HoursOnes42
;RTCC_main.c,389 :: 		Roller_Deactivate(&Minute1Roll, 215, 96);
MOVS	R2, #96
MOVS	R1, #215
MOVW	R0, #lo_addr(_Minute1Roll+0)
MOVT	R0, #hi_addr(_Minute1Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,390 :: 		Minute1Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Minute1Roll+18)
MOVT	R0, #hi_addr(_Minute1Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,391 :: 		}
L_HoursOnes42:
;RTCC_main.c,392 :: 		if (Minute2Roll.active == 1){
MOVW	R0, #lo_addr(_Minute2Roll+18)
MOVT	R0, #hi_addr(_Minute2Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_HoursOnes43
;RTCC_main.c,393 :: 		Roller_Deactivate(&Minute2Roll, 253, 96);
MOVS	R2, #96
MOVS	R1, #253
MOVW	R0, #lo_addr(_Minute2Roll+0)
MOVT	R0, #hi_addr(_Minute2Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,394 :: 		Minute2Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Minute2Roll+18)
MOVT	R0, #hi_addr(_Minute2Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,395 :: 		}
L_HoursOnes43:
;RTCC_main.c,396 :: 		if (AmPm.active == 1){
MOVW	R0, #lo_addr(_AmPm+18)
MOVT	R0, #hi_addr(_AmPm+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_HoursOnes44
;RTCC_main.c,397 :: 		Roller_Deactivate(&AmPm, 307, 96);
MOVS	R2, #96
MOVW	R1, #307
MOVW	R0, #lo_addr(_AmPm+0)
MOVT	R0, #hi_addr(_AmPm+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,398 :: 		AmPm.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_AmPm+18)
MOVT	R0, #hi_addr(_AmPm+18)
STRH	R1, [R0, #0]
;RTCC_main.c,399 :: 		}
L_HoursOnes44:
;RTCC_main.c,401 :: 		Draw_Picture(&Hour2Roll, Hour2Roll.position - 96, Hour2Roll.Left, Hour2Roll.Top);
MOVW	R0, #lo_addr(_Hour2Roll+2)
MOVT	R0, #hi_addr(_Hour2Roll+2)
LDRH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Hour2Roll+0)
MOVT	R0, #hi_addr(_Hour2Roll+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Hour2Roll+20)
MOVT	R0, #hi_addr(_Hour2Roll+20)
LDRSH	R0, [R0, #0]
SUBS	R0, #96
SXTH	R3, R2
SXTH	R2, R1
SXTH	R1, R0
MOVW	R0, #lo_addr(_Hour2Roll+0)
MOVT	R0, #hi_addr(_Hour2Roll+0)
BL	_Draw_Picture+0
;RTCC_main.c,402 :: 		}
L_HoursOnes40:
;RTCC_main.c,404 :: 		MyBoxOnPress(&Hour2Roll);
MOVW	R0, #lo_addr(_Hour2Roll+0)
MOVT	R0, #hi_addr(_Hour2Roll+0)
BL	_MyBoxOnPress+0
;RTCC_main.c,405 :: 		Hour2Roll.active = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_Hour2Roll+18)
MOVT	R0, #hi_addr(_Hour2Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,406 :: 		}
L_end_HoursOnes:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _HoursOnes
_MinutesTens:
;RTCC_main.c,415 :: 		void MinutesTens(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;RTCC_main.c,417 :: 		if (Minute1Roll.active == 0){
MOVW	R0, #lo_addr(_Minute1Roll+18)
MOVT	R0, #hi_addr(_Minute1Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_MinutesTens45
;RTCC_main.c,418 :: 		if (Hour1Roll.active == 1){
MOVW	R0, #lo_addr(_Hour1Roll+18)
MOVT	R0, #hi_addr(_Hour1Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_MinutesTens46
;RTCC_main.c,419 :: 		Roller_Deactivate(&Hour1Roll, 111, 96);
MOVS	R2, #96
MOVS	R1, #111
MOVW	R0, #lo_addr(_Hour1Roll+0)
MOVT	R0, #hi_addr(_Hour1Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,420 :: 		Hour1Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Hour1Roll+18)
MOVT	R0, #hi_addr(_Hour1Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,421 :: 		}
L_MinutesTens46:
;RTCC_main.c,422 :: 		if (Hour2Roll.active == 1){
MOVW	R0, #lo_addr(_Hour2Roll+18)
MOVT	R0, #hi_addr(_Hour2Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_MinutesTens47
;RTCC_main.c,423 :: 		Roller_Deactivate(&Hour2Roll, 149, 96);
MOVS	R2, #96
MOVS	R1, #149
MOVW	R0, #lo_addr(_Hour2Roll+0)
MOVT	R0, #hi_addr(_Hour2Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,424 :: 		Hour2Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Hour2Roll+18)
MOVT	R0, #hi_addr(_Hour2Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,425 :: 		}
L_MinutesTens47:
;RTCC_main.c,426 :: 		if (Minute2Roll.active == 1){
MOVW	R0, #lo_addr(_Minute2Roll+18)
MOVT	R0, #hi_addr(_Minute2Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_MinutesTens48
;RTCC_main.c,427 :: 		Roller_Deactivate(&Minute2Roll, 253, 96);
MOVS	R2, #96
MOVS	R1, #253
MOVW	R0, #lo_addr(_Minute2Roll+0)
MOVT	R0, #hi_addr(_Minute2Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,428 :: 		Minute2Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Minute2Roll+18)
MOVT	R0, #hi_addr(_Minute2Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,429 :: 		}
L_MinutesTens48:
;RTCC_main.c,430 :: 		if (AmPm.active == 1){
MOVW	R0, #lo_addr(_AmPm+18)
MOVT	R0, #hi_addr(_AmPm+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_MinutesTens49
;RTCC_main.c,431 :: 		Roller_Deactivate(&AmPm, 307, 96);
MOVS	R2, #96
MOVW	R1, #307
MOVW	R0, #lo_addr(_AmPm+0)
MOVT	R0, #hi_addr(_AmPm+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,432 :: 		AmPm.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_AmPm+18)
MOVT	R0, #hi_addr(_AmPm+18)
STRH	R1, [R0, #0]
;RTCC_main.c,433 :: 		}
L_MinutesTens49:
;RTCC_main.c,435 :: 		Draw_Picture(&Minute1Roll, Minute1Roll.position - 95, Minute1Roll.Left, Minute1Roll.Top);
MOVW	R0, #lo_addr(_Minute1Roll+2)
MOVT	R0, #hi_addr(_Minute1Roll+2)
LDRH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Minute1Roll+0)
MOVT	R0, #hi_addr(_Minute1Roll+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Minute1Roll+20)
MOVT	R0, #hi_addr(_Minute1Roll+20)
LDRSH	R0, [R0, #0]
SUBS	R0, #95
SXTH	R3, R2
SXTH	R2, R1
SXTH	R1, R0
MOVW	R0, #lo_addr(_Minute1Roll+0)
MOVT	R0, #hi_addr(_Minute1Roll+0)
BL	_Draw_Picture+0
;RTCC_main.c,436 :: 		}
L_MinutesTens45:
;RTCC_main.c,438 :: 		MyBoxOnPress(&Minute1Roll);
MOVW	R0, #lo_addr(_Minute1Roll+0)
MOVT	R0, #hi_addr(_Minute1Roll+0)
BL	_MyBoxOnPress+0
;RTCC_main.c,439 :: 		Minute1Roll.active = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_Minute1Roll+18)
MOVT	R0, #hi_addr(_Minute1Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,440 :: 		}
L_end_MinutesTens:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MinutesTens
_MinutesOnes:
;RTCC_main.c,449 :: 		void MinutesOnes(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;RTCC_main.c,451 :: 		if (Minute2Roll.active == 0){
MOVW	R0, #lo_addr(_Minute2Roll+18)
MOVT	R0, #hi_addr(_Minute2Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_MinutesOnes50
;RTCC_main.c,452 :: 		if (Hour1Roll.active == 1){
MOVW	R0, #lo_addr(_Hour1Roll+18)
MOVT	R0, #hi_addr(_Hour1Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_MinutesOnes51
;RTCC_main.c,453 :: 		Roller_Deactivate(&Hour1Roll, 111, 96);
MOVS	R2, #96
MOVS	R1, #111
MOVW	R0, #lo_addr(_Hour1Roll+0)
MOVT	R0, #hi_addr(_Hour1Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,454 :: 		Hour1Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Hour1Roll+18)
MOVT	R0, #hi_addr(_Hour1Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,455 :: 		}
L_MinutesOnes51:
;RTCC_main.c,456 :: 		if (Hour2Roll.active == 1){
MOVW	R0, #lo_addr(_Hour2Roll+18)
MOVT	R0, #hi_addr(_Hour2Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_MinutesOnes52
;RTCC_main.c,457 :: 		Roller_Deactivate(&Hour2Roll, 149, 96);
MOVS	R2, #96
MOVS	R1, #149
MOVW	R0, #lo_addr(_Hour2Roll+0)
MOVT	R0, #hi_addr(_Hour2Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,458 :: 		Hour2Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Hour2Roll+18)
MOVT	R0, #hi_addr(_Hour2Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,459 :: 		}
L_MinutesOnes52:
;RTCC_main.c,460 :: 		if (Minute1Roll.active == 1){
MOVW	R0, #lo_addr(_Minute1Roll+18)
MOVT	R0, #hi_addr(_Minute1Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_MinutesOnes53
;RTCC_main.c,461 :: 		Roller_Deactivate(&Minute1Roll, 215, 96);
MOVS	R2, #96
MOVS	R1, #215
MOVW	R0, #lo_addr(_Minute1Roll+0)
MOVT	R0, #hi_addr(_Minute1Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,462 :: 		Minute1Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Minute1Roll+18)
MOVT	R0, #hi_addr(_Minute1Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,463 :: 		}
L_MinutesOnes53:
;RTCC_main.c,464 :: 		if (AmPm.active == 1){
MOVW	R0, #lo_addr(_AmPm+18)
MOVT	R0, #hi_addr(_AmPm+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_MinutesOnes54
;RTCC_main.c,465 :: 		Roller_Deactivate(&AmPm, 307, 96);
MOVS	R2, #96
MOVW	R1, #307
MOVW	R0, #lo_addr(_AmPm+0)
MOVT	R0, #hi_addr(_AmPm+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,466 :: 		AmPm.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_AmPm+18)
MOVT	R0, #hi_addr(_AmPm+18)
STRH	R1, [R0, #0]
;RTCC_main.c,467 :: 		}
L_MinutesOnes54:
;RTCC_main.c,469 :: 		Draw_Picture(&Minute2Roll, Minute2Roll.position - 95, Minute2Roll.Left, Minute2Roll.Top);
MOVW	R0, #lo_addr(_Minute2Roll+2)
MOVT	R0, #hi_addr(_Minute2Roll+2)
LDRH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Minute2Roll+0)
MOVT	R0, #hi_addr(_Minute2Roll+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Minute2Roll+20)
MOVT	R0, #hi_addr(_Minute2Roll+20)
LDRSH	R0, [R0, #0]
SUBS	R0, #95
SXTH	R3, R2
SXTH	R2, R1
SXTH	R1, R0
MOVW	R0, #lo_addr(_Minute2Roll+0)
MOVT	R0, #hi_addr(_Minute2Roll+0)
BL	_Draw_Picture+0
;RTCC_main.c,470 :: 		}
L_MinutesOnes50:
;RTCC_main.c,472 :: 		MyBoxOnPress(&Minute2Roll);
MOVW	R0, #lo_addr(_Minute2Roll+0)
MOVT	R0, #hi_addr(_Minute2Roll+0)
BL	_MyBoxOnPress+0
;RTCC_main.c,473 :: 		Minute2Roll.active = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_Minute2Roll+18)
MOVT	R0, #hi_addr(_Minute2Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,474 :: 		}
L_end_MinutesOnes:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MinutesOnes
_AmPmRun:
;RTCC_main.c,483 :: 		void AmPmRun(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;RTCC_main.c,485 :: 		if (AmPm.active == 0){
MOVW	R0, #lo_addr(_AmPm+18)
MOVT	R0, #hi_addr(_AmPm+18)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_AmPmRun55
;RTCC_main.c,486 :: 		if (Hour1Roll.active == 1){
MOVW	R0, #lo_addr(_Hour1Roll+18)
MOVT	R0, #hi_addr(_Hour1Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_AmPmRun56
;RTCC_main.c,487 :: 		Roller_Deactivate(&Hour1Roll, 111, 96);
MOVS	R2, #96
MOVS	R1, #111
MOVW	R0, #lo_addr(_Hour1Roll+0)
MOVT	R0, #hi_addr(_Hour1Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,488 :: 		Hour1Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Hour1Roll+18)
MOVT	R0, #hi_addr(_Hour1Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,489 :: 		}
L_AmPmRun56:
;RTCC_main.c,490 :: 		if (Hour2Roll.active == 1){
MOVW	R0, #lo_addr(_Hour2Roll+18)
MOVT	R0, #hi_addr(_Hour2Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_AmPmRun57
;RTCC_main.c,491 :: 		Roller_Deactivate(&Hour2Roll, 149, 96);
MOVS	R2, #96
MOVS	R1, #149
MOVW	R0, #lo_addr(_Hour2Roll+0)
MOVT	R0, #hi_addr(_Hour2Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,492 :: 		Hour2Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Hour2Roll+18)
MOVT	R0, #hi_addr(_Hour2Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,493 :: 		}
L_AmPmRun57:
;RTCC_main.c,494 :: 		if (Minute1Roll.active == 1){
MOVW	R0, #lo_addr(_Minute1Roll+18)
MOVT	R0, #hi_addr(_Minute1Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_AmPmRun58
;RTCC_main.c,495 :: 		Roller_Deactivate(&Minute1Roll, 215, 96);
MOVS	R2, #96
MOVS	R1, #215
MOVW	R0, #lo_addr(_Minute1Roll+0)
MOVT	R0, #hi_addr(_Minute1Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,496 :: 		Minute1Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Minute1Roll+18)
MOVT	R0, #hi_addr(_Minute1Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,497 :: 		}
L_AmPmRun58:
;RTCC_main.c,498 :: 		if (Minute2Roll.active == 1){
MOVW	R0, #lo_addr(_Minute2Roll+18)
MOVT	R0, #hi_addr(_Minute2Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_AmPmRun59
;RTCC_main.c,499 :: 		Roller_Deactivate(&Minute2Roll, 253, 96);
MOVS	R2, #96
MOVS	R1, #253
MOVW	R0, #lo_addr(_Minute2Roll+0)
MOVT	R0, #hi_addr(_Minute2Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,500 :: 		Minute2Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Minute2Roll+18)
MOVT	R0, #hi_addr(_Minute2Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,501 :: 		}
L_AmPmRun59:
;RTCC_main.c,503 :: 		Draw_Picture(&AmPm, AmPm.position - 75, AmPm.Left, AmPm.Top);
MOVW	R0, #lo_addr(_AmPm+2)
MOVT	R0, #hi_addr(_AmPm+2)
LDRH	R2, [R0, #0]
MOVW	R0, #lo_addr(_AmPm+0)
MOVT	R0, #hi_addr(_AmPm+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_AmPm+20)
MOVT	R0, #hi_addr(_AmPm+20)
LDRSH	R0, [R0, #0]
SUBS	R0, #75
SXTH	R3, R2
SXTH	R2, R1
SXTH	R1, R0
MOVW	R0, #lo_addr(_AmPm+0)
MOVT	R0, #hi_addr(_AmPm+0)
BL	_Draw_Picture+0
;RTCC_main.c,504 :: 		}
L_AmPmRun55:
;RTCC_main.c,506 :: 		MyBoxOnPress(&AmPm);
MOVW	R0, #lo_addr(_AmPm+0)
MOVT	R0, #hi_addr(_AmPm+0)
BL	_MyBoxOnPress+0
;RTCC_main.c,507 :: 		AmPm.active = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_AmPm+18)
MOVT	R0, #hi_addr(_AmPm+18)
STRH	R1, [R0, #0]
;RTCC_main.c,508 :: 		}
L_end_AmPmRun:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _AmPmRun
_Deactivate_All_Rollers:
;RTCC_main.c,517 :: 		void Deactivate_All_Rollers(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;RTCC_main.c,518 :: 		if (Hour1Roll.active == 1){
MOVW	R0, #lo_addr(_Hour1Roll+18)
MOVT	R0, #hi_addr(_Hour1Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Deactivate_All_Rollers60
;RTCC_main.c,519 :: 		Roller_Deactivate(&Hour1Roll, 111, 96);
MOVS	R2, #96
MOVS	R1, #111
MOVW	R0, #lo_addr(_Hour1Roll+0)
MOVT	R0, #hi_addr(_Hour1Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,520 :: 		Hour1Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Hour1Roll+18)
MOVT	R0, #hi_addr(_Hour1Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,521 :: 		}
L_Deactivate_All_Rollers60:
;RTCC_main.c,522 :: 		if (Hour2Roll.active == 1){
MOVW	R0, #lo_addr(_Hour2Roll+18)
MOVT	R0, #hi_addr(_Hour2Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Deactivate_All_Rollers61
;RTCC_main.c,523 :: 		Roller_Deactivate(&Hour2Roll, 149, 96);
MOVS	R2, #96
MOVS	R1, #149
MOVW	R0, #lo_addr(_Hour2Roll+0)
MOVT	R0, #hi_addr(_Hour2Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,524 :: 		Hour2Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Hour2Roll+18)
MOVT	R0, #hi_addr(_Hour2Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,525 :: 		}
L_Deactivate_All_Rollers61:
;RTCC_main.c,526 :: 		if (Minute1Roll.active == 1){
MOVW	R0, #lo_addr(_Minute1Roll+18)
MOVT	R0, #hi_addr(_Minute1Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Deactivate_All_Rollers62
;RTCC_main.c,527 :: 		Roller_Deactivate(&Minute1Roll, 215, 96);
MOVS	R2, #96
MOVS	R1, #215
MOVW	R0, #lo_addr(_Minute1Roll+0)
MOVT	R0, #hi_addr(_Minute1Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,528 :: 		Minute1Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Minute1Roll+18)
MOVT	R0, #hi_addr(_Minute1Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,529 :: 		}
L_Deactivate_All_Rollers62:
;RTCC_main.c,530 :: 		if (Minute2Roll.active == 1){
MOVW	R0, #lo_addr(_Minute2Roll+18)
MOVT	R0, #hi_addr(_Minute2Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Deactivate_All_Rollers63
;RTCC_main.c,531 :: 		Roller_Deactivate(&Minute2Roll, 253, 96);
MOVS	R2, #96
MOVS	R1, #253
MOVW	R0, #lo_addr(_Minute2Roll+0)
MOVT	R0, #hi_addr(_Minute2Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,532 :: 		Minute2Roll.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_Minute2Roll+18)
MOVT	R0, #hi_addr(_Minute2Roll+18)
STRH	R1, [R0, #0]
;RTCC_main.c,533 :: 		}
L_Deactivate_All_Rollers63:
;RTCC_main.c,534 :: 		if (AmPm.active == 1){
MOVW	R0, #lo_addr(_AmPm+18)
MOVT	R0, #hi_addr(_AmPm+18)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Deactivate_All_Rollers64
;RTCC_main.c,535 :: 		Roller_Deactivate(&AmPm, 307, 96);
MOVS	R2, #96
MOVW	R1, #307
MOVW	R0, #lo_addr(_AmPm+0)
MOVT	R0, #hi_addr(_AmPm+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,536 :: 		AmPm.active = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_AmPm+18)
MOVT	R0, #hi_addr(_AmPm+18)
STRH	R1, [R0, #0]
;RTCC_main.c,537 :: 		}
L_Deactivate_All_Rollers64:
;RTCC_main.c,538 :: 		}
L_end_Deactivate_All_Rollers:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Deactivate_All_Rollers
_RTC_Example_init:
;RTCC_main.c,548 :: 		void RTC_Example_init(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;RTCC_main.c,549 :: 		Roller_Init();
BL	_Roller_Init+0
;RTCC_main.c,550 :: 		Ethernet_Message(" ");
MOVW	R0, #lo_addr(?lstr3_RTCC_main+0)
MOVT	R0, #hi_addr(?lstr3_RTCC_main+0)
BL	_Ethernet_Message+0
;RTCC_main.c,551 :: 		RTCC_Read(&MyTime);
MOVW	R0, #lo_addr(_MyTime+0)
MOVT	R0, #hi_addr(_MyTime+0)
BL	_RTCC_Read+0
;RTCC_main.c,552 :: 		Roll_Set_Level(&Hour1Roll, MyTime.hours / 10);
MOVW	R0, #lo_addr(_MyTime+3)
MOVT	R0, #hi_addr(_MyTime+3)
LDRSB	R1, [R0, #0]
MOVS	R0, #10
SXTB	R0, R0
SDIV	R0, R1, R0
UXTB	R1, R0
MOVW	R0, #lo_addr(_Hour1Roll+0)
MOVT	R0, #hi_addr(_Hour1Roll+0)
BL	_Roll_Set_Level+0
;RTCC_main.c,553 :: 		Roll_Set_Level(&Hour2Roll, MyTime.hours % 10);
MOVW	R0, #lo_addr(_MyTime+3)
MOVT	R0, #hi_addr(_MyTime+3)
LDRSB	R2, [R0, #0]
MOVS	R1, #10
SXTB	R1, R1
SDIV	R0, R2, R1
MLS	R0, R1, R0, R2
UXTB	R1, R0
MOVW	R0, #lo_addr(_Hour2Roll+0)
MOVT	R0, #hi_addr(_Hour2Roll+0)
BL	_Roll_Set_Level+0
;RTCC_main.c,554 :: 		Roll_Set_Level(&Minute1Roll, MyTime.minutes / 10);
MOVW	R0, #lo_addr(_MyTime+2)
MOVT	R0, #hi_addr(_MyTime+2)
LDRSB	R1, [R0, #0]
MOVS	R0, #10
SXTB	R0, R0
SDIV	R0, R1, R0
UXTB	R1, R0
MOVW	R0, #lo_addr(_Minute1Roll+0)
MOVT	R0, #hi_addr(_Minute1Roll+0)
BL	_Roll_Set_Level+0
;RTCC_main.c,555 :: 		Roll_Set_Level(&Minute2Roll, MyTime.minutes % 10);
MOVW	R0, #lo_addr(_MyTime+2)
MOVT	R0, #hi_addr(_MyTime+2)
LDRSB	R2, [R0, #0]
MOVS	R1, #10
SXTB	R1, R1
SDIV	R0, R2, R1
MLS	R0, R1, R0, R2
UXTB	R1, R0
MOVW	R0, #lo_addr(_Minute2Roll+0)
MOVT	R0, #hi_addr(_Minute2Roll+0)
BL	_Roll_Set_Level+0
;RTCC_main.c,556 :: 		Roll_Set_Level(&AmPm, MyTime.ampm);
MOVW	R0, #lo_addr(_MyTime+0)
MOVT	R0, #hi_addr(_MyTime+0)
LDRSB	R0, [R0, #0]
UXTB	R1, R0
MOVW	R0, #lo_addr(_AmPm+0)
MOVT	R0, #hi_addr(_AmPm+0)
BL	_Roll_Set_Level+0
;RTCC_main.c,557 :: 		Roller_Deactivate(&Hour1Roll, 111, 96);
MOVS	R2, #96
MOVS	R1, #111
MOVW	R0, #lo_addr(_Hour1Roll+0)
MOVT	R0, #hi_addr(_Hour1Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,558 :: 		Roller_Deactivate(&Hour2Roll, 149, 96);
MOVS	R2, #96
MOVS	R1, #149
MOVW	R0, #lo_addr(_Hour2Roll+0)
MOVT	R0, #hi_addr(_Hour2Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,559 :: 		Roller_Deactivate(&Minute1Roll, 215, 96);
MOVS	R2, #96
MOVS	R1, #215
MOVW	R0, #lo_addr(_Minute1Roll+0)
MOVT	R0, #hi_addr(_Minute1Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,560 :: 		Roller_Deactivate(&Minute2Roll, 253, 96);
MOVS	R2, #96
MOVS	R1, #253
MOVW	R0, #lo_addr(_Minute2Roll+0)
MOVT	R0, #hi_addr(_Minute2Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,561 :: 		Roller_Deactivate(&AmPM, 307, 96);
MOVS	R2, #96
MOVW	R1, #307
MOVW	R0, #lo_addr(_AmPm+0)
MOVT	R0, #hi_addr(_AmPm+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,562 :: 		}
L_end_RTC_Example_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RTC_Example_init
_doRTC_Example:
;RTCC_main.c,571 :: 		void doRTC_Example(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;RTCC_main.c,573 :: 		Roll_Flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Roll_flag+0)
MOVT	R0, #hi_addr(_Roll_flag+0)
STRB	R1, [R0, #0]
;RTCC_main.c,575 :: 		if (Hour1Roll.active){
MOVW	R0, #lo_addr(_Hour1Roll+18)
MOVT	R0, #hi_addr(_Hour1Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_doRTC_Example65
;RTCC_main.c,576 :: 		Roll_Get_Level(&Hour1Roll);
MOVW	R0, #lo_addr(_Hour1Roll+0)
MOVT	R0, #hi_addr(_Hour1Roll+0)
BL	_Roll_Get_Level+0
;RTCC_main.c,577 :: 		Set_Roller(&Hour1Roll, Hour1Roll.currentlevel, 1);
MOVW	R0, #lo_addr(_Hour1Roll+16)
MOVT	R0, #hi_addr(_Hour1Roll+16)
LDRH	R0, [R0, #0]
MOVS	R2, #1
SXTH	R1, R0
MOVW	R0, #lo_addr(_Hour1Roll+0)
MOVT	R0, #hi_addr(_Hour1Roll+0)
BL	_Set_Roller+0
;RTCC_main.c,578 :: 		}
L_doRTC_Example65:
;RTCC_main.c,580 :: 		if (Hour2Roll.active){
MOVW	R0, #lo_addr(_Hour2Roll+18)
MOVT	R0, #hi_addr(_Hour2Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_doRTC_Example66
;RTCC_main.c,581 :: 		Roll_Get_Level(&Hour2Roll);
MOVW	R0, #lo_addr(_Hour2Roll+0)
MOVT	R0, #hi_addr(_Hour2Roll+0)
BL	_Roll_Get_Level+0
;RTCC_main.c,582 :: 		Set_Roller(&Hour2Roll, Hour2Roll.currentlevel, 1);
MOVW	R0, #lo_addr(_Hour2Roll+16)
MOVT	R0, #hi_addr(_Hour2Roll+16)
LDRH	R0, [R0, #0]
MOVS	R2, #1
SXTH	R1, R0
MOVW	R0, #lo_addr(_Hour2Roll+0)
MOVT	R0, #hi_addr(_Hour2Roll+0)
BL	_Set_Roller+0
;RTCC_main.c,583 :: 		}
L_doRTC_Example66:
;RTCC_main.c,585 :: 		if (Minute1Roll.active){
MOVW	R0, #lo_addr(_Minute1Roll+18)
MOVT	R0, #hi_addr(_Minute1Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_doRTC_Example67
;RTCC_main.c,586 :: 		Roll_Get_Level(&Minute1Roll);
MOVW	R0, #lo_addr(_Minute1Roll+0)
MOVT	R0, #hi_addr(_Minute1Roll+0)
BL	_Roll_Get_Level+0
;RTCC_main.c,587 :: 		Set_Roller(&Minute1Roll, Minute1Roll.currentlevel, 1);
MOVW	R0, #lo_addr(_Minute1Roll+16)
MOVT	R0, #hi_addr(_Minute1Roll+16)
LDRH	R0, [R0, #0]
MOVS	R2, #1
SXTH	R1, R0
MOVW	R0, #lo_addr(_Minute1Roll+0)
MOVT	R0, #hi_addr(_Minute1Roll+0)
BL	_Set_Roller+0
;RTCC_main.c,588 :: 		}
L_doRTC_Example67:
;RTCC_main.c,590 :: 		if (Minute2Roll.active){
MOVW	R0, #lo_addr(_Minute2Roll+18)
MOVT	R0, #hi_addr(_Minute2Roll+18)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_doRTC_Example68
;RTCC_main.c,591 :: 		Roll_Get_Level(&Minute2Roll);
MOVW	R0, #lo_addr(_Minute2Roll+0)
MOVT	R0, #hi_addr(_Minute2Roll+0)
BL	_Roll_Get_Level+0
;RTCC_main.c,592 :: 		Set_Roller(&Minute2Roll, Minute2Roll.currentlevel, 1);
MOVW	R0, #lo_addr(_Minute2Roll+16)
MOVT	R0, #hi_addr(_Minute2Roll+16)
LDRH	R0, [R0, #0]
MOVS	R2, #1
SXTH	R1, R0
MOVW	R0, #lo_addr(_Minute2Roll+0)
MOVT	R0, #hi_addr(_Minute2Roll+0)
BL	_Set_Roller+0
;RTCC_main.c,593 :: 		}
L_doRTC_Example68:
;RTCC_main.c,595 :: 		if (AmPm.active){
MOVW	R0, #lo_addr(_AmPm+18)
MOVT	R0, #hi_addr(_AmPm+18)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_doRTC_Example69
;RTCC_main.c,596 :: 		Roll_Get_Level(&AmPm);
MOVW	R0, #lo_addr(_AmPm+0)
MOVT	R0, #hi_addr(_AmPm+0)
BL	_Roll_Get_Level+0
;RTCC_main.c,597 :: 		Set_Roller(&AmPm, AmPm.currentlevel, 1);
MOVW	R0, #lo_addr(_AmPm+16)
MOVT	R0, #hi_addr(_AmPm+16)
LDRH	R0, [R0, #0]
MOVS	R2, #1
SXTH	R1, R0
MOVW	R0, #lo_addr(_AmPm+0)
MOVT	R0, #hi_addr(_AmPm+0)
BL	_Set_Roller+0
;RTCC_main.c,598 :: 		}
L_doRTC_Example69:
;RTCC_main.c,600 :: 		check_time_server();
BL	_check_time_server+0
;RTCC_main.c,601 :: 		}
L_end_doRTC_Example:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doRTC_Example
_Set_MyRTCC:
;RTCC_main.c,610 :: 		char Set_MyRTCC(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;RTCC_main.c,612 :: 		RTCC_Read(&MyTime);
MOVW	R0, #lo_addr(_MyTime+0)
MOVT	R0, #hi_addr(_MyTime+0)
BL	_RTCC_Read+0
;RTCC_main.c,613 :: 		temp = Hour1Roll.currentlevel * 10 + Hour2Roll.currentlevel;
MOVW	R0, #lo_addr(_Hour1Roll+16)
MOVT	R0, #hi_addr(_Hour1Roll+16)
LDRH	R1, [R0, #0]
MOVS	R0, #10
MULS	R1, R0, R1
UXTH	R1, R1
MOVW	R0, #lo_addr(_Hour2Roll+16)
MOVT	R0, #hi_addr(_Hour2Roll+16)
LDRH	R0, [R0, #0]
ADDS	R0, R1, R0
; temp start address is: 4 (R1)
UXTB	R1, R0
;RTCC_main.c,614 :: 		if (temp > 12)
UXTB	R0, R0
CMP	R0, #12
IT	LS
BLS	L_Set_MyRTCC70
; temp end address is: 4 (R1)
;RTCC_main.c,615 :: 		return 0;
MOVS	R0, #0
IT	AL
BAL	L_end_Set_MyRTCC
L_Set_MyRTCC70:
;RTCC_main.c,616 :: 		MyTime.hours = temp;
; temp start address is: 4 (R1)
MOVW	R0, #lo_addr(_MyTime+3)
MOVT	R0, #hi_addr(_MyTime+3)
STRB	R1, [R0, #0]
; temp end address is: 4 (R1)
;RTCC_main.c,617 :: 		MyTime.minutes = Minute1Roll.currentlevel * 10 + Minute2Roll.currentlevel;
MOVW	R0, #lo_addr(_Minute1Roll+16)
MOVT	R0, #hi_addr(_Minute1Roll+16)
LDRH	R1, [R0, #0]
MOVS	R0, #10
MULS	R1, R0, R1
UXTH	R1, R1
MOVW	R0, #lo_addr(_Minute2Roll+16)
MOVT	R0, #hi_addr(_Minute2Roll+16)
LDRH	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_MyTime+2)
MOVT	R0, #hi_addr(_MyTime+2)
STRB	R1, [R0, #0]
;RTCC_main.c,618 :: 		MyTime.ampm = AmPm.currentlevel;
MOVW	R0, #lo_addr(_AmPm+16)
MOVT	R0, #hi_addr(_AmPm+16)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_MyTime+0)
MOVT	R0, #hi_addr(_MyTime+0)
STRB	R1, [R0, #0]
;RTCC_main.c,619 :: 		Set_RTC(&MyTime);
MOVW	R0, #lo_addr(_MyTime+0)
MOVT	R0, #hi_addr(_MyTime+0)
BL	_Set_RTC+0
;RTCC_main.c,620 :: 		return 1;
MOVS	R0, #1
;RTCC_main.c,621 :: 		}
L_end_Set_MyRTCC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_MyRTCC
_UpdateTime:
;RTCC_main.c,630 :: 		void UpdateTime(TTime *RTCC_Time){
; RTCC_Time start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; RTCC_Time end address is: 0 (R0)
; RTCC_Time start address is: 0 (R0)
;RTCC_main.c,631 :: 		Label19_Caption[0] = (RTCC_Time->hours / 10) + 48;
ADDS	R3, R0, #3
LDRSB	R2, [R3, #0]
MOVS	R1, #10
SXTB	R1, R1
SDIV	R1, R2, R1
SXTB	R1, R1
ADDW	R2, R1, #48
MOVW	R1, #lo_addr(_Label19_Caption+0)
MOVT	R1, #hi_addr(_Label19_Caption+0)
STRB	R2, [R1, #0]
;RTCC_main.c,632 :: 		Label19_Caption[1] = (RTCC_Time->hours % 10) + 48;
LDRSB	R3, [R3, #0]
MOVS	R2, #10
SXTB	R2, R2
SDIV	R1, R3, R2
MLS	R1, R2, R1, R3
SXTB	R1, R1
ADDW	R2, R1, #48
MOVW	R1, #lo_addr(_Label19_Caption+1)
MOVT	R1, #hi_addr(_Label19_Caption+1)
STRB	R2, [R1, #0]
;RTCC_main.c,633 :: 		Label19_Caption[2] = ':';
MOVS	R2, #58
MOVW	R1, #lo_addr(_Label19_Caption+2)
MOVT	R1, #hi_addr(_Label19_Caption+2)
STRB	R2, [R1, #0]
;RTCC_main.c,634 :: 		Label19_Caption[3] = (RTCC_Time->minutes / 10) + 48;
ADDS	R3, R0, #2
LDRSB	R2, [R3, #0]
MOVS	R1, #10
SXTB	R1, R1
SDIV	R1, R2, R1
SXTB	R1, R1
ADDW	R2, R1, #48
MOVW	R1, #lo_addr(_Label19_Caption+3)
MOVT	R1, #hi_addr(_Label19_Caption+3)
STRB	R2, [R1, #0]
;RTCC_main.c,635 :: 		Label19_Caption[4] = (RTCC_Time->minutes % 10) + 48;
LDRSB	R3, [R3, #0]
MOVS	R2, #10
SXTB	R2, R2
SDIV	R1, R3, R2
MLS	R1, R2, R1, R3
SXTB	R1, R1
ADDW	R2, R1, #48
MOVW	R1, #lo_addr(_Label19_Caption+4)
MOVT	R1, #hi_addr(_Label19_Caption+4)
STRB	R2, [R1, #0]
;RTCC_main.c,636 :: 		Label19_Caption[5] = ' ';
MOVS	R2, #32
MOVW	R1, #lo_addr(_Label19_Caption+5)
MOVT	R1, #hi_addr(_Label19_Caption+5)
STRB	R2, [R1, #0]
;RTCC_main.c,637 :: 		if (RTCC_Time->ampm == 0){
LDRSB	R1, [R0, #0]
CMP	R1, #0
IT	NE
BNE	L_UpdateTime71
; RTCC_Time end address is: 0 (R0)
;RTCC_main.c,638 :: 		Label19_Caption[6] = 'A';
MOVS	R2, #65
MOVW	R1, #lo_addr(_Label19_Caption+6)
MOVT	R1, #hi_addr(_Label19_Caption+6)
STRB	R2, [R1, #0]
;RTCC_main.c,639 :: 		Label19_Caption[7] = 'M';
MOVS	R2, #77
MOVW	R1, #lo_addr(_Label19_Caption+7)
MOVT	R1, #hi_addr(_Label19_Caption+7)
STRB	R2, [R1, #0]
;RTCC_main.c,640 :: 		}
IT	AL
BAL	L_UpdateTime72
L_UpdateTime71:
;RTCC_main.c,641 :: 		else if (RTCC_Time->ampm == 1){
; RTCC_Time start address is: 0 (R0)
LDRSB	R1, [R0, #0]
; RTCC_Time end address is: 0 (R0)
CMP	R1, #1
IT	NE
BNE	L_UpdateTime73
;RTCC_main.c,642 :: 		Label19_Caption[6] = 'P';
MOVS	R2, #80
MOVW	R1, #lo_addr(_Label19_Caption+6)
MOVT	R1, #hi_addr(_Label19_Caption+6)
STRB	R2, [R1, #0]
;RTCC_main.c,643 :: 		Label19_Caption[7] = 'M';
MOVS	R2, #77
MOVW	R1, #lo_addr(_Label19_Caption+7)
MOVT	R1, #hi_addr(_Label19_Caption+7)
STRB	R2, [R1, #0]
;RTCC_main.c,644 :: 		}
L_UpdateTime73:
L_UpdateTime72:
;RTCC_main.c,645 :: 		Label19_Caption[8] = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_Label19_Caption+8)
MOVT	R1, #hi_addr(_Label19_Caption+8)
STRB	R2, [R1, #0]
;RTCC_main.c,646 :: 		TFT_Set_Brush(1, Home.Color, 0, 0, 0, 0);
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
LDRH	R1, [R1, #0]
PUSH	(R3)
PUSH	(R2)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;RTCC_main.c,647 :: 		TFT_Set_Pen(Home.Color, 0);
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
MOVS	R1, #0
BL	_TFT_Set_Pen+0
;RTCC_main.c,648 :: 		TFT_Rectangle(Label19.Left, Label19.Top, Label19.Left + 60, Label19.Top + 20);
MOVW	R2, #lo_addr(_Label19+8)
MOVT	R2, #hi_addr(_Label19+8)
LDRH	R1, [R2, #0]
ADDW	R5, R1, #20
MOVW	R4, #lo_addr(_Label19+6)
MOVT	R4, #hi_addr(_Label19+6)
LDRH	R1, [R4, #0]
ADDW	R3, R1, #60
MOV	R1, R2
LDRH	R2, [R1, #0]
MOV	R1, R4
LDRH	R1, [R1, #0]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
;RTCC_main.c,649 :: 		DrawLabel(&Label19);
MOVW	R0, #lo_addr(_Label19+0)
MOVT	R0, #hi_addr(_Label19+0)
BL	_DrawLabel+0
;RTCC_main.c,650 :: 		}
L_end_UpdateTime:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _UpdateTime
_checkRTC:
;RTCC_main.c,660 :: 		void checkRTC(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;RTCC_main.c,661 :: 		if (RTCC_Read(&MyTime)){
MOVW	R0, #lo_addr(_MyTime+0)
MOVT	R0, #hi_addr(_MyTime+0)
BL	_RTCC_Read+0
CMP	R0, #0
IT	EQ
BEQ	L_checkRTC74
;RTCC_main.c,662 :: 		if ((MyTime.minutes != OldMyTime.minutes) || (MyTime.hours != OldMyTime.hours) || (MyTime.ampm != OldMyTime.ampm)){
MOVW	R0, #lo_addr(_OldMyTime+2)
MOVT	R0, #hi_addr(_OldMyTime+2)
LDRSB	R1, [R0, #0]
MOVW	R0, #lo_addr(_MyTime+2)
MOVT	R0, #hi_addr(_MyTime+2)
LDRSB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__checkRTC90
MOVW	R0, #lo_addr(_OldMyTime+3)
MOVT	R0, #hi_addr(_OldMyTime+3)
LDRSB	R1, [R0, #0]
MOVW	R0, #lo_addr(_MyTime+3)
MOVT	R0, #hi_addr(_MyTime+3)
LDRSB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__checkRTC89
MOVW	R0, #lo_addr(_OldMyTime+0)
MOVT	R0, #hi_addr(_OldMyTime+0)
LDRSB	R1, [R0, #0]
MOVW	R0, #lo_addr(_MyTime+0)
MOVT	R0, #hi_addr(_MyTime+0)
LDRSB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__checkRTC88
IT	AL
BAL	L_checkRTC77
L__checkRTC90:
L__checkRTC89:
L__checkRTC88:
;RTCC_main.c,663 :: 		UpdateTime(&MyTime);
MOVW	R0, #lo_addr(_MyTime+0)
MOVT	R0, #hi_addr(_MyTime+0)
BL	_UpdateTime+0
;RTCC_main.c,664 :: 		OldMyTime = MyTime;
MOVS	R3, #8
MOVW	R2, #lo_addr(_OldMyTime+0)
MOVT	R2, #hi_addr(_OldMyTime+0)
MOVW	R1, #lo_addr(_MyTime+0)
MOVT	R1, #hi_addr(_MyTime+0)
L_checkRTC78:
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
UXTB	R3, R3
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L_checkRTC78
;RTCC_main.c,665 :: 		}
L_checkRTC77:
;RTCC_main.c,666 :: 		}
L_checkRTC74:
;RTCC_main.c,667 :: 		}
L_end_checkRTC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _checkRTC
_check_time_server:
;RTCC_main.c,678 :: 		void check_time_server(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;RTCC_main.c,679 :: 		if (Time_Obtained == 1){
MOVW	R0, #lo_addr(_Time_Obtained+0)
MOVT	R0, #hi_addr(_Time_Obtained+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_check_time_server79
;RTCC_main.c,680 :: 		Time_Obtained = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Time_Obtained+0)
MOVT	R0, #hi_addr(_Time_Obtained+0)
STRB	R1, [R0, #0]
;RTCC_main.c,681 :: 		MyTime.seconds = my_time.ss;
MOVW	R0, #lo_addr(_my_time+0)
MOVT	R0, #hi_addr(_my_time+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_MyTime+1)
MOVT	R0, #hi_addr(_MyTime+1)
STRB	R1, [R0, #0]
;RTCC_main.c,682 :: 		MyTime.minutes = my_time.mn;
MOVW	R0, #lo_addr(_my_time+1)
MOVT	R0, #hi_addr(_my_time+1)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_MyTime+2)
MOVT	R0, #hi_addr(_MyTime+2)
STRB	R1, [R0, #0]
;RTCC_main.c,683 :: 		if (my_time.hh == 0){
MOVW	R0, #lo_addr(_my_time+2)
MOVT	R0, #hi_addr(_my_time+2)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_check_time_server80
;RTCC_main.c,684 :: 		MyTime.ampm  = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_MyTime+0)
MOVT	R0, #hi_addr(_MyTime+0)
STRB	R1, [R0, #0]
;RTCC_main.c,685 :: 		MyTime.hours = 12;
MOVS	R1, #12
SXTB	R1, R1
MOVW	R0, #lo_addr(_MyTime+3)
MOVT	R0, #hi_addr(_MyTime+3)
STRB	R1, [R0, #0]
;RTCC_main.c,686 :: 		}
IT	AL
BAL	L_check_time_server81
L_check_time_server80:
;RTCC_main.c,687 :: 		else if (my_time.hh == 12){
MOVW	R0, #lo_addr(_my_time+2)
MOVT	R0, #hi_addr(_my_time+2)
LDRB	R0, [R0, #0]
CMP	R0, #12
IT	NE
BNE	L_check_time_server82
;RTCC_main.c,688 :: 		MyTime.ampm  = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_MyTime+0)
MOVT	R0, #hi_addr(_MyTime+0)
STRB	R1, [R0, #0]
;RTCC_main.c,689 :: 		MyTime.hours = 12;
MOVS	R1, #12
SXTB	R1, R1
MOVW	R0, #lo_addr(_MyTime+3)
MOVT	R0, #hi_addr(_MyTime+3)
STRB	R1, [R0, #0]
;RTCC_main.c,690 :: 		}
IT	AL
BAL	L_check_time_server83
L_check_time_server82:
;RTCC_main.c,692 :: 		MyTime.hours   = my_time.hh % 12;
MOVW	R3, #lo_addr(_my_time+2)
MOVT	R3, #hi_addr(_my_time+2)
LDRB	R2, [R3, #0]
MOVS	R0, #12
UDIV	R1, R2, R0
MLS	R1, R0, R1, R2
MOVW	R0, #lo_addr(_MyTime+3)
MOVT	R0, #hi_addr(_MyTime+3)
STRB	R1, [R0, #0]
;RTCC_main.c,693 :: 		MyTime.ampm    = my_time.hh / 12;
MOV	R0, R3
LDRB	R1, [R0, #0]
MOVS	R0, #12
UDIV	R1, R1, R0
MOVW	R0, #lo_addr(_MyTime+0)
MOVT	R0, #hi_addr(_MyTime+0)
STRB	R1, [R0, #0]
;RTCC_main.c,694 :: 		}
L_check_time_server83:
L_check_time_server81:
;RTCC_main.c,695 :: 		MyTime.day     = my_time.md;
MOVW	R0, #lo_addr(_my_time+3)
MOVT	R0, #hi_addr(_my_time+3)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_MyTime+4)
MOVT	R0, #hi_addr(_MyTime+4)
STRB	R1, [R0, #0]
;RTCC_main.c,696 :: 		MyTime.month   = my_time.mo;
MOVW	R0, #lo_addr(_my_time+5)
MOVT	R0, #hi_addr(_my_time+5)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_MyTime+5)
MOVT	R0, #hi_addr(_MyTime+5)
STRB	R1, [R0, #0]
;RTCC_main.c,697 :: 		MyTime.year    = my_time.yy;
MOVW	R0, #lo_addr(_my_time+6)
MOVT	R0, #hi_addr(_my_time+6)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_MyTime+6)
MOVT	R0, #hi_addr(_MyTime+6)
STRH	R1, [R0, #0]
;RTCC_main.c,698 :: 		Set_RTC(&MyTime);
MOVW	R0, #lo_addr(_MyTime+0)
MOVT	R0, #hi_addr(_MyTime+0)
BL	_Set_RTC+0
;RTCC_main.c,700 :: 		Ethernet_Message("Synchronized with GMT");
MOVW	R0, #lo_addr(?lstr4_RTCC_main+0)
MOVT	R0, #hi_addr(?lstr4_RTCC_main+0)
BL	_Ethernet_Message+0
;RTCC_main.c,701 :: 		Roll_Set_Level(&Hour1Roll, MyTime.hours / 10);
MOVW	R0, #lo_addr(_MyTime+3)
MOVT	R0, #hi_addr(_MyTime+3)
LDRSB	R1, [R0, #0]
MOVS	R0, #10
SXTB	R0, R0
SDIV	R0, R1, R0
UXTB	R1, R0
MOVW	R0, #lo_addr(_Hour1Roll+0)
MOVT	R0, #hi_addr(_Hour1Roll+0)
BL	_Roll_Set_Level+0
;RTCC_main.c,702 :: 		Roll_Set_Level(&Hour2Roll, MyTime.hours % 10);
MOVW	R0, #lo_addr(_MyTime+3)
MOVT	R0, #hi_addr(_MyTime+3)
LDRSB	R2, [R0, #0]
MOVS	R1, #10
SXTB	R1, R1
SDIV	R0, R2, R1
MLS	R0, R1, R0, R2
UXTB	R1, R0
MOVW	R0, #lo_addr(_Hour2Roll+0)
MOVT	R0, #hi_addr(_Hour2Roll+0)
BL	_Roll_Set_Level+0
;RTCC_main.c,703 :: 		Roll_Set_Level(&Minute1Roll, MyTime.minutes / 10);
MOVW	R0, #lo_addr(_MyTime+2)
MOVT	R0, #hi_addr(_MyTime+2)
LDRSB	R1, [R0, #0]
MOVS	R0, #10
SXTB	R0, R0
SDIV	R0, R1, R0
UXTB	R1, R0
MOVW	R0, #lo_addr(_Minute1Roll+0)
MOVT	R0, #hi_addr(_Minute1Roll+0)
BL	_Roll_Set_Level+0
;RTCC_main.c,704 :: 		Roll_Set_Level(&Minute2Roll, MyTime.minutes % 10);
MOVW	R0, #lo_addr(_MyTime+2)
MOVT	R0, #hi_addr(_MyTime+2)
LDRSB	R2, [R0, #0]
MOVS	R1, #10
SXTB	R1, R1
SDIV	R0, R2, R1
MLS	R0, R1, R0, R2
UXTB	R1, R0
MOVW	R0, #lo_addr(_Minute2Roll+0)
MOVT	R0, #hi_addr(_Minute2Roll+0)
BL	_Roll_Set_Level+0
;RTCC_main.c,705 :: 		Roll_Set_Level(&AmPm, MyTime.ampm % 10);
MOVW	R0, #lo_addr(_MyTime+0)
MOVT	R0, #hi_addr(_MyTime+0)
LDRSB	R2, [R0, #0]
MOVS	R1, #10
SXTB	R1, R1
SDIV	R0, R2, R1
MLS	R0, R1, R0, R2
UXTB	R1, R0
MOVW	R0, #lo_addr(_AmPm+0)
MOVT	R0, #hi_addr(_AmPm+0)
BL	_Roll_Set_Level+0
;RTCC_main.c,707 :: 		Set_Roller(&Hour1Roll, Hour1Roll.currentlevel, 5);
MOVW	R0, #lo_addr(_Hour1Roll+16)
MOVT	R0, #hi_addr(_Hour1Roll+16)
LDRH	R0, [R0, #0]
MOVS	R2, #5
SXTH	R1, R0
MOVW	R0, #lo_addr(_Hour1Roll+0)
MOVT	R0, #hi_addr(_Hour1Roll+0)
BL	_Set_Roller+0
;RTCC_main.c,708 :: 		Roller_Deactivate(&Hour1Roll, 111, 96);
MOVS	R2, #96
MOVS	R1, #111
MOVW	R0, #lo_addr(_Hour1Roll+0)
MOVT	R0, #hi_addr(_Hour1Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,709 :: 		Set_Roller(&Hour2Roll, Hour1Roll.currentlevel, 5);
MOVW	R0, #lo_addr(_Hour1Roll+16)
MOVT	R0, #hi_addr(_Hour1Roll+16)
LDRH	R0, [R0, #0]
MOVS	R2, #5
SXTH	R1, R0
MOVW	R0, #lo_addr(_Hour2Roll+0)
MOVT	R0, #hi_addr(_Hour2Roll+0)
BL	_Set_Roller+0
;RTCC_main.c,710 :: 		Roller_Deactivate(&Hour2Roll, 149, 96);
MOVS	R2, #96
MOVS	R1, #149
MOVW	R0, #lo_addr(_Hour2Roll+0)
MOVT	R0, #hi_addr(_Hour2Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,711 :: 		Set_Roller(&Minute1Roll, Hour1Roll.currentlevel, 5);
MOVW	R0, #lo_addr(_Hour1Roll+16)
MOVT	R0, #hi_addr(_Hour1Roll+16)
LDRH	R0, [R0, #0]
MOVS	R2, #5
SXTH	R1, R0
MOVW	R0, #lo_addr(_Minute1Roll+0)
MOVT	R0, #hi_addr(_Minute1Roll+0)
BL	_Set_Roller+0
;RTCC_main.c,712 :: 		Roller_Deactivate(&Minute1Roll, 215, 96);
MOVS	R2, #96
MOVS	R1, #215
MOVW	R0, #lo_addr(_Minute1Roll+0)
MOVT	R0, #hi_addr(_Minute1Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,713 :: 		Set_Roller(&Minute2Roll, Hour1Roll.currentlevel, 5);
MOVW	R0, #lo_addr(_Hour1Roll+16)
MOVT	R0, #hi_addr(_Hour1Roll+16)
LDRH	R0, [R0, #0]
MOVS	R2, #5
SXTH	R1, R0
MOVW	R0, #lo_addr(_Minute2Roll+0)
MOVT	R0, #hi_addr(_Minute2Roll+0)
BL	_Set_Roller+0
;RTCC_main.c,714 :: 		Roller_Deactivate(&Minute2Roll, 253, 96);
MOVS	R2, #96
MOVS	R1, #253
MOVW	R0, #lo_addr(_Minute2Roll+0)
MOVT	R0, #hi_addr(_Minute2Roll+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,715 :: 		Set_Roller(&AmPm, AmPm.currentlevel, 5);
MOVW	R0, #lo_addr(_AmPm+16)
MOVT	R0, #hi_addr(_AmPm+16)
LDRH	R0, [R0, #0]
MOVS	R2, #5
SXTH	R1, R0
MOVW	R0, #lo_addr(_AmPm+0)
MOVT	R0, #hi_addr(_AmPm+0)
BL	_Set_Roller+0
;RTCC_main.c,716 :: 		Roller_Deactivate(&AmPm, 307, 96);
MOVS	R2, #96
MOVW	R1, #307
MOVW	R0, #lo_addr(_AmPm+0)
MOVT	R0, #hi_addr(_AmPm+0)
BL	_Roller_Deactivate+0
;RTCC_main.c,717 :: 		}
L_check_time_server79:
;RTCC_main.c,718 :: 		}
L_end_check_time_server:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _check_time_server
