Slide_Show_DrawImageLine:
;Slide_Show.c,73 :: 		static void DrawImageLine(unsigned long image, int line){
; line start address is: 4 (R1)
; image start address is: 0 (R0)
SUB	SP, SP, #24
STR	LR, [SP, #0]
; line end address is: 4 (R1)
; image end address is: 0 (R0)
; image start address is: 0 (R0)
; line start address is: 4 (R1)
;Slide_Show.c,78 :: 		TFT_CS = 0;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(TFT_CS+0)
MOVT	R2, #hi_addr(TFT_CS+0)
STR	R3, [R2, #0]
;Slide_Show.c,79 :: 		offset = image + 6 + (unsigned long)line*960;
ADDS	R4, R0, #6
; image end address is: 0 (R0)
SXTH	R3, R1
; line end address is: 4 (R1)
MOVW	R2, #960
MULS	R2, R3, R2
ADDS	R2, R4, R2
STR	R2, [SP, #8]
;Slide_Show.c,80 :: 		count = 960;
MOVW	R2, #960
STRH	R2, [SP, #16]
;Slide_Show.c,81 :: 		TFT_SSD1963_Set_Address_Ptr(0, Slides_disp_scroll, 479, Slides_disp_scroll);
MOVW	R2, #lo_addr(Slide_Show_Slides_disp_scroll+0)
MOVT	R2, #hi_addr(Slide_Show_Slides_disp_scroll+0)
LDRSH	R4, [R2, #0]
LDRSH	R2, [R2, #0]
UXTH	R3, R4
UXTH	R1, R2
MOVW	R2, #479
MOVS	R0, #0
MOVW	R4, #lo_addr(_TFT_SSD1963_Set_Address_Ptr+0)
MOVT	R4, #hi_addr(_TFT_SSD1963_Set_Address_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
;Slide_Show.c,82 :: 		while(count>0){
L_Slide_Show_DrawImageLine0:
LDRH	R2, [SP, #16]
CMP	R2, #0
IT	LS
BLS	L_Slide_Show_DrawImageLine1
;Slide_Show.c,83 :: 		ptr = MyTFT_Get_Data(offset,count,&readed);
ADD	R2, SP, #12
LDRH	R1, [SP, #16]
LDR	R0, [SP, #8]
BL	_MyTFT_Get_Data+0
STR	R0, [SP, #20]
;Slide_Show.c,84 :: 		count -= readed;
LDR	R3, [SP, #12]
LDRH	R2, [SP, #16]
SUB	R2, R2, R3
STRH	R2, [SP, #16]
;Slide_Show.c,85 :: 		offset += readed;
LDR	R3, [SP, #12]
LDR	R2, [SP, #8]
ADDS	R2, R2, R3
STR	R2, [SP, #8]
;Slide_Show.c,86 :: 		readed /= 2;
LDR	R2, [SP, #12]
LSRS	R2, R2, #1
STR	R2, [SP, #12]
;Slide_Show.c,87 :: 		for (i = 0;i<readed;i++){
; i start address is: 20 (R5)
MOVS	R5, #0
; i end address is: 20 (R5)
UXTH	R0, R5
L_Slide_Show_DrawImageLine2:
; i start address is: 0 (R0)
LDR	R2, [SP, #12]
CMP	R0, R2
IT	CS
BCS	L_Slide_Show_DrawImageLine3
;Slide_Show.c,88 :: 		color = *ptr++;
LDR	R2, [SP, #20]
LDRB	R2, [R2, #0]
; color start address is: 4 (R1)
UXTB	R1, R2
LDR	R2, [SP, #20]
ADDS	R3, R2, #1
;Slide_Show.c,89 :: 		color += (*ptr++) << 8;
LDRB	R2, [R3, #0]
LSLS	R2, R2, #8
UXTH	R2, R2
ADDS	R4, R1, R2
; color end address is: 4 (R1)
ADDS	R2, R3, #1
STR	R2, [SP, #20]
;Slide_Show.c,90 :: 		TFT_Write_Data_Ptr(color);
STRH	R0, [SP, #4]
UXTH	R0, R4
MOVW	R4, #lo_addr(_TFT_Write_Data_Ptr+0)
MOVT	R4, #hi_addr(_TFT_Write_Data_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
LDRH	R0, [SP, #4]
;Slide_Show.c,87 :: 		for (i = 0;i<readed;i++){
ADDS	R2, R0, #1
; i end address is: 0 (R0)
; i start address is: 20 (R5)
UXTH	R5, R2
;Slide_Show.c,91 :: 		}
UXTH	R0, R5
; i end address is: 20 (R5)
IT	AL
BAL	L_Slide_Show_DrawImageLine2
L_Slide_Show_DrawImageLine3:
;Slide_Show.c,92 :: 		}
IT	AL
BAL	L_Slide_Show_DrawImageLine0
L_Slide_Show_DrawImageLine1:
;Slide_Show.c,94 :: 		TFT_CS = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(TFT_CS+0)
MOVT	R2, #hi_addr(TFT_CS+0)
STR	R3, [R2, #0]
;Slide_Show.c,95 :: 		}
L_end_DrawImageLine:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of Slide_Show_DrawImageLine
Slide_Show_Slides_Scroll:
;Slide_Show.c,104 :: 		static void Slides_Scroll(char Adir) {
; Adir start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Adir end address is: 0 (R0)
; Adir start address is: 0 (R0)
;Slide_Show.c,107 :: 		if (Adir == 1) {
CMP	R0, #1
IT	NE
BNE	L_Slide_Show_Slides_Scroll5
; Adir end address is: 0 (R0)
;Slide_Show.c,108 :: 		if (Slides_disp_scroll != _SLIDES_SCROLL_LAST_LINE - 1)
MOVW	R1, #lo_addr(Slide_Show_Slides_disp_scroll+0)
MOVT	R1, #hi_addr(Slide_Show_Slides_disp_scroll+0)
LDRSH	R1, [R1, #0]
CMP	R1, #246
IT	EQ
BEQ	L_Slide_Show_Slides_Scroll6
;Slide_Show.c,109 :: 		Slides_disp_scroll++;
MOVW	R2, #lo_addr(Slide_Show_Slides_disp_scroll+0)
MOVT	R2, #hi_addr(Slide_Show_Slides_disp_scroll+0)
LDRSH	R1, [R2, #0]
ADDS	R1, R1, #1
STRH	R1, [R2, #0]
IT	AL
BAL	L_Slide_Show_Slides_Scroll7
L_Slide_Show_Slides_Scroll6:
;Slide_Show.c,111 :: 		Slides_disp_scroll = _SLIDES_SCROLL_FIRST_LINE;
MOVW	R2, #38
SXTH	R2, R2
MOVW	R1, #lo_addr(Slide_Show_Slides_disp_scroll+0)
MOVT	R1, #hi_addr(Slide_Show_Slides_disp_scroll+0)
STRH	R2, [R1, #0]
;Slide_Show.c,112 :: 		}
L_Slide_Show_Slides_Scroll7:
;Slide_Show.c,113 :: 		}
IT	AL
BAL	L_Slide_Show_Slides_Scroll8
L_Slide_Show_Slides_Scroll5:
;Slide_Show.c,115 :: 		if (Slides_disp_scroll != _SLIDES_SCROLL_FIRST_LINE)
MOVW	R1, #lo_addr(Slide_Show_Slides_disp_scroll+0)
MOVT	R1, #hi_addr(Slide_Show_Slides_disp_scroll+0)
LDRSH	R1, [R1, #0]
CMP	R1, #38
IT	EQ
BEQ	L_Slide_Show_Slides_Scroll9
;Slide_Show.c,116 :: 		Slides_disp_scroll--;
MOVW	R2, #lo_addr(Slide_Show_Slides_disp_scroll+0)
MOVT	R2, #hi_addr(Slide_Show_Slides_disp_scroll+0)
LDRSH	R1, [R2, #0]
SUBS	R1, R1, #1
STRH	R1, [R2, #0]
IT	AL
BAL	L_Slide_Show_Slides_Scroll10
L_Slide_Show_Slides_Scroll9:
;Slide_Show.c,118 :: 		Slides_disp_scroll = _SLIDES_SCROLL_LAST_LINE - 1;
MOVS	R2, #246
SXTH	R2, R2
MOVW	R1, #lo_addr(Slide_Show_Slides_disp_scroll+0)
MOVT	R1, #hi_addr(Slide_Show_Slides_disp_scroll+0)
STRH	R2, [R1, #0]
;Slide_Show.c,119 :: 		}
L_Slide_Show_Slides_Scroll10:
;Slide_Show.c,120 :: 		}
L_Slide_Show_Slides_Scroll8:
;Slide_Show.c,122 :: 		Scroll(Slides_disp_scroll);
MOVW	R1, #lo_addr(Slide_Show_Slides_disp_scroll+0)
MOVT	R1, #hi_addr(Slide_Show_Slides_disp_scroll+0)
LDRSH	R1, [R1, #0]
UXTH	R0, R1
BL	_Scroll+0
;Slide_Show.c,123 :: 		}
L_end_Slides_Scroll:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of Slide_Show_Slides_Scroll
Slide_Show_GetNextImage:
;Slide_Show.c,132 :: 		static void GetNextImage(){
;Slide_Show.c,133 :: 		left_image = right_image;
MOVW	R2, #lo_addr(Slide_Show_right_image+0)
MOVT	R2, #hi_addr(Slide_Show_right_image+0)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(Slide_Show_left_image+0)
MOVT	R0, #hi_addr(Slide_Show_left_image+0)
STR	R1, [R0, #0]
;Slide_Show.c,134 :: 		right_image = Slides[Slide_Index];
MOVW	R0, #lo_addr(_Slide_Index+0)
MOVT	R0, #hi_addr(_Slide_Index+0)
LDRSB	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_Slides+0)
MOVT	R0, #hi_addr(_Slides+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Slide_Show.c,136 :: 		Slides_imageLine = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(Slide_Show_Slides_imageLine+0)
MOVT	R0, #hi_addr(Slide_Show_Slides_imageLine+0)
STRH	R1, [R0, #0]
;Slide_Show.c,137 :: 		}
L_end_GetNextImage:
BX	LR
; end of Slide_Show_GetNextImage
Slide_Show_GetPreviousImage:
;Slide_Show.c,146 :: 		static void GetPreviousImage(){
;Slide_Show.c,147 :: 		right_image = left_image;
MOVW	R2, #lo_addr(Slide_Show_left_image+0)
MOVT	R2, #hi_addr(Slide_Show_left_image+0)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(Slide_Show_right_image+0)
MOVT	R0, #hi_addr(Slide_Show_right_image+0)
STR	R1, [R0, #0]
;Slide_Show.c,148 :: 		left_image = Slides[Slide_Index];
MOVW	R0, #lo_addr(_Slide_Index+0)
MOVT	R0, #hi_addr(_Slide_Index+0)
LDRSB	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_Slides+0)
MOVT	R0, #hi_addr(_Slides+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Slide_Show.c,150 :: 		Slides_imageLine = 209;
MOVS	R1, #209
SXTH	R1, R1
MOVW	R0, #lo_addr(Slide_Show_Slides_imageLine+0)
MOVT	R0, #hi_addr(Slide_Show_Slides_imageLine+0)
STRH	R1, [R0, #0]
;Slide_Show.c,151 :: 		}
L_end_GetPreviousImage:
BX	LR
; end of Slide_Show_GetPreviousImage
Slide_Show_Slides_ScrollUp:
;Slide_Show.c,160 :: 		static void Slides_ScrollUp(int scroll){
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRH	R0, [SP, #4]
;Slide_Show.c,161 :: 		while(scroll--){
L_Slide_Show_Slides_ScrollUp11:
LDRSH	R2, [SP, #4]
LDRSH	R1, [SP, #4]
SUBS	R1, R1, #1
STRH	R1, [SP, #4]
CMP	R2, #0
IT	EQ
BEQ	L_Slide_Show_Slides_ScrollUp12
;Slide_Show.c,162 :: 		Slides_Scroll(1);              // Scroll image
MOVS	R0, #1
BL	Slide_Show_Slides_Scroll+0
;Slide_Show.c,163 :: 		DrawImageLine(right_image,Slides_imageLine); //  and draw next image line
MOVW	R1, #lo_addr(Slide_Show_Slides_imageLine+0)
MOVT	R1, #hi_addr(Slide_Show_Slides_imageLine+0)
LDRSH	R2, [R1, #0]
MOVW	R1, #lo_addr(Slide_Show_right_image+0)
MOVT	R1, #hi_addr(Slide_Show_right_image+0)
LDR	R1, [R1, #0]
MOV	R0, R1
SXTH	R1, R2
BL	Slide_Show_DrawImageLine+0
;Slide_Show.c,164 :: 		Slides_imageLine++;
MOVW	R2, #lo_addr(Slide_Show_Slides_imageLine+0)
MOVT	R2, #hi_addr(Slide_Show_Slides_imageLine+0)
LDRSH	R1, [R2, #0]
ADDS	R1, R1, #1
STRH	R1, [R2, #0]
;Slide_Show.c,165 :: 		}
IT	AL
BAL	L_Slide_Show_Slides_ScrollUp11
L_Slide_Show_Slides_ScrollUp12:
;Slide_Show.c,166 :: 		}
L_end_Slides_ScrollUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of Slide_Show_Slides_ScrollUp
Slide_Show_Slides_ScrollDown:
;Slide_Show.c,175 :: 		static void Slides_ScrollDown(int scroll){
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRH	R0, [SP, #4]
;Slide_Show.c,176 :: 		while(scroll--){
L_Slide_Show_Slides_ScrollDown13:
LDRSH	R2, [SP, #4]
LDRSH	R1, [SP, #4]
SUBS	R1, R1, #1
STRH	R1, [SP, #4]
CMP	R2, #0
IT	EQ
BEQ	L_Slide_Show_Slides_ScrollDown14
;Slide_Show.c,177 :: 		Slides_imageLine--;
MOVW	R2, #lo_addr(Slide_Show_Slides_imageLine+0)
MOVT	R2, #hi_addr(Slide_Show_Slides_imageLine+0)
LDRSH	R1, [R2, #0]
SUBS	R1, R1, #1
STRH	R1, [R2, #0]
;Slide_Show.c,178 :: 		DrawImageLine(left_image,Slides_imageLine);
SXTH	R2, R1
MOVW	R1, #lo_addr(Slide_Show_left_image+0)
MOVT	R1, #hi_addr(Slide_Show_left_image+0)
LDR	R1, [R1, #0]
MOV	R0, R1
SXTH	R1, R2
BL	Slide_Show_DrawImageLine+0
;Slide_Show.c,179 :: 		Slides_Scroll(0);
MOVS	R0, #0
BL	Slide_Show_Slides_Scroll+0
;Slide_Show.c,180 :: 		}
IT	AL
BAL	L_Slide_Show_Slides_ScrollDown13
L_Slide_Show_Slides_ScrollDown14:
;Slide_Show.c,181 :: 		}
L_end_Slides_ScrollDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of Slide_Show_Slides_ScrollDown
_ScrollImageUp:
;Slide_Show.c,190 :: 		void ScrollImageUp(int scroll){
; scroll start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; scroll end address is: 0 (R0)
; scroll start address is: 0 (R0)
;Slide_Show.c,191 :: 		if (Slides_imageLine == 0){
MOVW	R1, #lo_addr(Slide_Show_Slides_imageLine+0)
MOVT	R1, #hi_addr(Slide_Show_Slides_imageLine+0)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_ScrollImageUp15
;Slide_Show.c,192 :: 		if (Slide_Dir == 1)
MOVW	R1, #lo_addr(Slide_Show_Slide_Dir+0)
MOVT	R1, #hi_addr(Slide_Show_Slide_Dir+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_ScrollImageUp16
;Slide_Show.c,193 :: 		GetPreviousImage();
STRH	R0, [SP, #4]
BL	Slide_Show_GetPreviousImage+0
LDRSH	R0, [SP, #4]
L_ScrollImageUp16:
;Slide_Show.c,194 :: 		}
L_ScrollImageUp15:
;Slide_Show.c,195 :: 		Slide_Dir = 2;
MOVS	R2, #2
MOVW	R1, #lo_addr(Slide_Show_Slide_Dir+0)
MOVT	R1, #hi_addr(Slide_Show_Slide_Dir+0)
STRB	R2, [R1, #0]
;Slide_Show.c,197 :: 		if((Slides_imageLine+scroll > 210)){
MOVW	R1, #lo_addr(Slide_Show_Slides_imageLine+0)
MOVT	R1, #hi_addr(Slide_Show_Slides_imageLine+0)
LDRSH	R1, [R1, #0]
ADDS	R1, R1, R0
SXTH	R1, R1
CMP	R1, #210
IT	LE
BLE	L_ScrollImageUp17
;Slide_Show.c,198 :: 		Slide_Index ++;
MOVW	R2, #lo_addr(_Slide_Index+0)
MOVT	R2, #hi_addr(_Slide_Index+0)
LDRSB	R1, [R2, #0]
ADDS	R1, R1, #1
SXTB	R1, R1
STRB	R1, [R2, #0]
;Slide_Show.c,199 :: 		if (Slide_Index > 7)
CMP	R1, #7
IT	LE
BLE	L_ScrollImageUp18
;Slide_Show.c,200 :: 		Slide_Index = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(_Slide_Index+0)
MOVT	R1, #hi_addr(_Slide_Index+0)
STRB	R2, [R1, #0]
L_ScrollImageUp18:
;Slide_Show.c,202 :: 		GetNextImage();
STRH	R0, [SP, #4]
BL	Slide_Show_GetNextImage+0
LDRSH	R0, [SP, #4]
;Slide_Show.c,203 :: 		Slides_ScrollUp(scroll);
; scroll end address is: 0 (R0)
BL	Slide_Show_Slides_ScrollUp+0
;Slide_Show.c,204 :: 		}
IT	AL
BAL	L_ScrollImageUp19
L_ScrollImageUp17:
;Slide_Show.c,206 :: 		Slides_ScrollUp(scroll);
; scroll start address is: 0 (R0)
; scroll end address is: 0 (R0)
BL	Slide_Show_Slides_ScrollUp+0
;Slide_Show.c,207 :: 		}
L_ScrollImageUp19:
;Slide_Show.c,208 :: 		}
L_end_ScrollImageUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _ScrollImageUp
_ScrollImageDown:
;Slide_Show.c,217 :: 		void ScrollImageDown(int scroll){
; scroll start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; scroll end address is: 0 (R0)
; scroll start address is: 0 (R0)
;Slide_Show.c,218 :: 		if (Slides_imageLine == 209){
MOVW	R1, #lo_addr(Slide_Show_Slides_imageLine+0)
MOVT	R1, #hi_addr(Slide_Show_Slides_imageLine+0)
LDRSH	R1, [R1, #0]
CMP	R1, #209
IT	NE
BNE	L_ScrollImageDown20
;Slide_Show.c,219 :: 		if (Slide_Dir == 2)
MOVW	R1, #lo_addr(Slide_Show_Slide_Dir+0)
MOVT	R1, #hi_addr(Slide_Show_Slide_Dir+0)
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_ScrollImageDown21
;Slide_Show.c,220 :: 		GetNextImage();
STRH	R0, [SP, #4]
BL	Slide_Show_GetNextImage+0
LDRSH	R0, [SP, #4]
L_ScrollImageDown21:
;Slide_Show.c,221 :: 		}
L_ScrollImageDown20:
;Slide_Show.c,222 :: 		Slide_Dir = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(Slide_Show_Slide_Dir+0)
MOVT	R1, #hi_addr(Slide_Show_Slide_Dir+0)
STRB	R2, [R1, #0]
;Slide_Show.c,224 :: 		if((Slides_imageLine-scroll < 0)){// || (Slides_imageLine == 209)){
MOVW	R1, #lo_addr(Slide_Show_Slides_imageLine+0)
MOVT	R1, #hi_addr(Slide_Show_Slides_imageLine+0)
LDRSH	R1, [R1, #0]
SUB	R1, R1, R0
SXTH	R1, R1
CMP	R1, #0
IT	GE
BGE	L_ScrollImageDown22
;Slide_Show.c,225 :: 		Slide_Index--;
MOVW	R2, #lo_addr(_Slide_Index+0)
MOVT	R2, #hi_addr(_Slide_Index+0)
LDRSB	R1, [R2, #0]
SUBS	R1, R1, #1
SXTB	R1, R1
STRB	R1, [R2, #0]
;Slide_Show.c,226 :: 		if (Slide_Index < 0)
CMP	R1, #0
IT	GE
BGE	L_ScrollImageDown23
;Slide_Show.c,227 :: 		Slide_Index = 7;
MOVS	R2, #7
SXTB	R2, R2
MOVW	R1, #lo_addr(_Slide_Index+0)
MOVT	R1, #hi_addr(_Slide_Index+0)
STRB	R2, [R1, #0]
L_ScrollImageDown23:
;Slide_Show.c,229 :: 		GetPreviousImage();
STRH	R0, [SP, #4]
BL	Slide_Show_GetPreviousImage+0
LDRSH	R0, [SP, #4]
;Slide_Show.c,230 :: 		Slides_ScrollDown(scroll);
; scroll end address is: 0 (R0)
BL	Slide_Show_Slides_ScrollDown+0
;Slide_Show.c,231 :: 		}
IT	AL
BAL	L_ScrollImageDown24
L_ScrollImageDown22:
;Slide_Show.c,233 :: 		Slides_ScrollDown(scroll);
; scroll start address is: 0 (R0)
; scroll end address is: 0 (R0)
BL	Slide_Show_Slides_ScrollDown+0
;Slide_Show.c,234 :: 		}
L_ScrollImageDown24:
;Slide_Show.c,235 :: 		}
L_end_ScrollImageDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _ScrollImageDown
_Start_Slide_Show:
;Slide_Show.c,244 :: 		void Start_Slide_Show(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Slide_Show.c,246 :: 		Scroll_Undone(_SLIDES_SCROLL_FIRST_LINE, _SLIDES_SCROLL_LAST_LINE);
MOVW	R1, #247
MOVW	R0, #38
BL	_Scroll_Undone+0
;Slide_Show.c,247 :: 		Slide_Dir = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(Slide_Show_Slide_Dir+0)
MOVT	R0, #hi_addr(Slide_Show_Slide_Dir+0)
STRB	R1, [R0, #0]
;Slide_Show.c,248 :: 		left_image = Slides[0];
MOVW	R0, #lo_addr(_Slides+0)
MOVT	R0, #hi_addr(_Slides+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(Slide_Show_left_image+0)
MOVT	R0, #hi_addr(Slide_Show_left_image+0)
STR	R1, [R0, #0]
;Slide_Show.c,249 :: 		right_image = Slides[7];
MOVW	R0, #lo_addr(_Slides+28)
MOVT	R0, #hi_addr(_Slides+28)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(Slide_Show_right_image+0)
MOVT	R0, #hi_addr(Slide_Show_right_image+0)
STR	R1, [R0, #0]
;Slide_Show.c,250 :: 		Slide_Index = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_Slide_Index+0)
MOVT	R0, #hi_addr(_Slide_Index+0)
STRB	R1, [R0, #0]
;Slide_Show.c,251 :: 		Slide_Dir_Old = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(Slide_Show_Slide_Dir_Old+0)
MOVT	R0, #hi_addr(Slide_Show_Slide_Dir_Old+0)
STRB	R1, [R0, #0]
;Slide_Show.c,253 :: 		if(Init_FAT()){
BL	_Init_FAT+0
CMP	R0, #0
IT	EQ
BEQ	L_Start_Slide_Show25
;Slide_Show.c,254 :: 		TFT_Ext_Image(0, 38, Slides[0], 1);
MOVW	R0, #lo_addr(_Slides+0)
MOVT	R0, #hi_addr(_Slides+0)
LDR	R0, [R0, #0]
MOVS	R3, #1
MOV	R2, R0
MOVS	R1, #38
MOVS	R0, #0
BL	_TFT_Ext_Image+0
;Slide_Show.c,255 :: 		}
L_Start_Slide_Show25:
;Slide_Show.c,256 :: 		}
L_end_Start_Slide_Show:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Start_Slide_Show
_Slide_scroll:
;Slide_Show.c,265 :: 		void Slide_scroll(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Slide_Show.c,269 :: 		if (Slide_Flag == 0){
MOVW	R0, #lo_addr(Slide_Show_Slide_Flag+0)
MOVT	R0, #hi_addr(Slide_Show_Slide_Flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Slide_scroll26
;Slide_Show.c,270 :: 		Slide_Flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(Slide_Show_Slide_Flag+0)
MOVT	R0, #hi_addr(Slide_Show_Slide_Flag+0)
STRB	R1, [R0, #0]
;Slide_Show.c,271 :: 		OldYcoo = Ycoord;
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(Slide_Show_OldYcoo+0)
MOVT	R0, #hi_addr(Slide_Show_OldYcoo+0)
STRH	R1, [R0, #0]
;Slide_Show.c,272 :: 		OldDelta = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(Slide_Show_OldDelta+0)
MOVT	R0, #hi_addr(Slide_Show_OldDelta+0)
STRH	R1, [R0, #0]
;Slide_Show.c,273 :: 		return;
IT	AL
BAL	L_end_Slide_scroll
;Slide_Show.c,274 :: 		}
L_Slide_scroll26:
;Slide_Show.c,275 :: 		delta = Ycoord - OldYcoo;
MOVW	R0, #lo_addr(Slide_Show_OldYcoo+0)
MOVT	R0, #hi_addr(Slide_Show_OldYcoo+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R0, [R0, #0]
SUB	R0, R0, R1
; delta start address is: 4 (R1)
SXTH	R1, R0
;Slide_Show.c,276 :: 		if (delta > 0){
SXTH	R0, R0
CMP	R0, #0
IT	LE
BLE	L_Slide_scroll27
;Slide_Show.c,277 :: 		dir = 0;
MOVS	R0, #0
STRB	R0, [SP, #8]
;Slide_Show.c,278 :: 		}
L_Slide_scroll27:
;Slide_Show.c,279 :: 		if (delta < 0){
CMP	R1, #0
IT	GE
BGE	L__Slide_scroll51
;Slide_Show.c,280 :: 		dir = 1;
MOVS	R0, #1
STRB	R0, [SP, #8]
;Slide_Show.c,281 :: 		delta = - delta;
RSBS	R1, R1, #0
SXTH	R1, R1
; delta end address is: 4 (R1)
;Slide_Show.c,282 :: 		}
IT	AL
BAL	L_Slide_scroll28
L__Slide_scroll51:
;Slide_Show.c,279 :: 		if (delta < 0){
;Slide_Show.c,282 :: 		}
L_Slide_scroll28:
;Slide_Show.c,283 :: 		if (delta < 4){
; delta start address is: 4 (R1)
CMP	R1, #4
IT	GE
BGE	L_Slide_scroll29
;Slide_Show.c,284 :: 		OldDelta = delta;
MOVW	R0, #lo_addr(Slide_Show_OldDelta+0)
MOVT	R0, #hi_addr(Slide_Show_OldDelta+0)
STRH	R1, [R0, #0]
; delta end address is: 4 (R1)
;Slide_Show.c,285 :: 		return;
IT	AL
BAL	L_end_Slide_scroll
;Slide_Show.c,286 :: 		}
L_Slide_scroll29:
;Slide_Show.c,288 :: 		while (delta > 0){
; delta start address is: 4 (R1)
L_Slide_scroll30:
; delta end address is: 4 (R1)
; delta start address is: 4 (R1)
CMP	R1, #0
IT	LE
BLE	L_Slide_scroll31
;Slide_Show.c,289 :: 		if (dir == 1)
LDRB	R0, [SP, #8]
CMP	R0, #1
IT	NE
BNE	L_Slide_scroll32
;Slide_Show.c,290 :: 		ScrollImageUp(1);
STRH	R1, [SP, #4]
MOVS	R0, #1
SXTH	R0, R0
BL	_ScrollImageUp+0
LDRSH	R1, [SP, #4]
IT	AL
BAL	L_Slide_scroll33
L_Slide_scroll32:
;Slide_Show.c,292 :: 		ScrollImageDown(1);
STRH	R1, [SP, #4]
MOVS	R0, #1
SXTH	R0, R0
BL	_ScrollImageDown+0
LDRSH	R1, [SP, #4]
L_Slide_scroll33:
;Slide_Show.c,293 :: 		delta = delta - 1;
SUBS	R1, R1, #1
SXTH	R1, R1
;Slide_Show.c,294 :: 		}
; delta end address is: 4 (R1)
IT	AL
BAL	L_Slide_scroll30
L_Slide_scroll31:
;Slide_Show.c,296 :: 		OldYcoo = Ycoord;
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(Slide_Show_OldYcoo+0)
MOVT	R0, #hi_addr(Slide_Show_OldYcoo+0)
STRH	R1, [R0, #0]
;Slide_Show.c,297 :: 		}
L_end_Slide_scroll:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Slide_scroll
_doSlide:
;Slide_Show.c,306 :: 		void doSlide(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Slide_Show.c,307 :: 		if (STMPE610_PressDetect() == 0){
BL	_STMPE610_PressDetect+0
CMP	R0, #0
IT	NE
BNE	L_doSlide34
;Slide_Show.c,308 :: 		Slide_Flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(Slide_Show_Slide_Flag+0)
MOVT	R0, #hi_addr(Slide_Show_Slide_Flag+0)
STRB	R1, [R0, #0]
;Slide_Show.c,309 :: 		if ((Slides_imageLine > 0) && (Slides_imageLine < 209)){
MOVW	R0, #lo_addr(Slide_Show_Slides_imageLine+0)
MOVT	R0, #hi_addr(Slide_Show_Slides_imageLine+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LE
BLE	L__doSlide66
MOVW	R0, #lo_addr(Slide_Show_Slides_imageLine+0)
MOVT	R0, #hi_addr(Slide_Show_Slides_imageLine+0)
LDRSH	R0, [R0, #0]
CMP	R0, #209
IT	GE
BGE	L__doSlide65
L__doSlide56:
;Slide_Show.c,310 :: 		if ((Slides_imageLine > 20) && (Slide_Dir == 2))
MOVW	R0, #lo_addr(Slide_Show_Slides_imageLine+0)
MOVT	R0, #hi_addr(Slide_Show_Slides_imageLine+0)
LDRSH	R0, [R0, #0]
CMP	R0, #20
IT	LE
BLE	L__doSlide58
MOVW	R0, #lo_addr(Slide_Show_Slide_Dir+0)
MOVT	R0, #hi_addr(Slide_Show_Slide_Dir+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L__doSlide57
L__doSlide55:
;Slide_Show.c,311 :: 		ScrollImageUp(209 - Slides_imageLine);
MOVW	R0, #lo_addr(Slide_Show_Slides_imageLine+0)
MOVT	R0, #hi_addr(Slide_Show_Slides_imageLine+0)
LDRSH	R0, [R0, #0]
RSB	R0, R0, #209
BL	_ScrollImageUp+0
;Slide_Show.c,310 :: 		if ((Slides_imageLine > 20) && (Slide_Dir == 2))
L__doSlide58:
L__doSlide57:
;Slide_Show.c,312 :: 		if ((Slides_imageLine < 21) && (Slide_Dir == 2))
MOVW	R0, #lo_addr(Slide_Show_Slides_imageLine+0)
MOVT	R0, #hi_addr(Slide_Show_Slides_imageLine+0)
LDRSH	R0, [R0, #0]
CMP	R0, #21
IT	GE
BGE	L__doSlide60
MOVW	R0, #lo_addr(Slide_Show_Slide_Dir+0)
MOVT	R0, #hi_addr(Slide_Show_Slide_Dir+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L__doSlide59
L__doSlide54:
;Slide_Show.c,313 :: 		ScrollImageDown(Slide_Index);
MOVW	R0, #lo_addr(_Slide_Index+0)
MOVT	R0, #hi_addr(_Slide_Index+0)
LDRSB	R0, [R0, #0]
BL	_ScrollImageDown+0
;Slide_Show.c,312 :: 		if ((Slides_imageLine < 21) && (Slide_Dir == 2))
L__doSlide60:
L__doSlide59:
;Slide_Show.c,314 :: 		if ((Slides_imageLine < 189) &&  (Slide_Dir == 1))
MOVW	R0, #lo_addr(Slide_Show_Slides_imageLine+0)
MOVT	R0, #hi_addr(Slide_Show_Slides_imageLine+0)
LDRSH	R0, [R0, #0]
CMP	R0, #189
IT	GE
BGE	L__doSlide62
MOVW	R0, #lo_addr(Slide_Show_Slide_Dir+0)
MOVT	R0, #hi_addr(Slide_Show_Slide_Dir+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__doSlide61
L__doSlide53:
;Slide_Show.c,315 :: 		ScrollImageDown(Slides_imageLine);
MOVW	R0, #lo_addr(Slide_Show_Slides_imageLine+0)
MOVT	R0, #hi_addr(Slide_Show_Slides_imageLine+0)
LDRSH	R0, [R0, #0]
BL	_ScrollImageDown+0
;Slide_Show.c,314 :: 		if ((Slides_imageLine < 189) &&  (Slide_Dir == 1))
L__doSlide62:
L__doSlide61:
;Slide_Show.c,316 :: 		if ((Slides_imageLine > 188) &&  (Slide_Dir == 1))
MOVW	R0, #lo_addr(Slide_Show_Slides_imageLine+0)
MOVT	R0, #hi_addr(Slide_Show_Slides_imageLine+0)
LDRSH	R0, [R0, #0]
CMP	R0, #188
IT	LE
BLE	L__doSlide64
MOVW	R0, #lo_addr(Slide_Show_Slide_Dir+0)
MOVT	R0, #hi_addr(Slide_Show_Slide_Dir+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__doSlide63
L__doSlide52:
;Slide_Show.c,317 :: 		ScrollImageUp(209 - Slides_imageLine);
MOVW	R0, #lo_addr(Slide_Show_Slides_imageLine+0)
MOVT	R0, #hi_addr(Slide_Show_Slides_imageLine+0)
LDRSH	R0, [R0, #0]
RSB	R0, R0, #209
BL	_ScrollImageUp+0
;Slide_Show.c,316 :: 		if ((Slides_imageLine > 188) &&  (Slide_Dir == 1))
L__doSlide64:
L__doSlide63:
;Slide_Show.c,309 :: 		if ((Slides_imageLine > 0) && (Slides_imageLine < 209)){
L__doSlide66:
L__doSlide65:
;Slide_Show.c,319 :: 		}
L_doSlide34:
;Slide_Show.c,320 :: 		if (Slide_Index_Old != Slide_Index){
MOVW	R0, #lo_addr(_Slide_Index+0)
MOVT	R0, #hi_addr(_Slide_Index+0)
LDRSB	R1, [R0, #0]
MOVW	R0, #lo_addr(Slide_Show_Slide_Index_Old+0)
MOVT	R0, #hi_addr(Slide_Show_Slide_Index_Old+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L_doSlide50
;Slide_Show.c,321 :: 		ByteToStr(Slide_Index + 1, Label35_caption);
MOVW	R0, #lo_addr(_Slide_Index+0)
MOVT	R0, #hi_addr(_Slide_Index+0)
LDRSB	R0, [R0, #0]
ADDS	R0, R0, #1
MOVW	R1, #lo_addr(_Label35_Caption+0)
MOVT	R1, #hi_addr(_Label35_Caption+0)
UXTB	R0, R0
BL	_ByteToStr+0
;Slide_Show.c,322 :: 		RedrawLabel(SlideShow.Color, &Label35, 20, 30);
MOVW	R0, #lo_addr(_SlideShow+0)
MOVT	R0, #hi_addr(_SlideShow+0)
LDRH	R0, [R0, #0]
MOVS	R3, #30
MOVS	R2, #20
MOVW	R1, #lo_addr(_Label35+0)
MOVT	R1, #hi_addr(_Label35+0)
BL	_RedrawLabel+0
;Slide_Show.c,323 :: 		Slide_Index_Old = Slide_Index;
MOVW	R0, #lo_addr(_Slide_Index+0)
MOVT	R0, #hi_addr(_Slide_Index+0)
LDRSB	R1, [R0, #0]
MOVW	R0, #lo_addr(Slide_Show_Slide_Index_Old+0)
MOVT	R0, #hi_addr(Slide_Show_Slide_Index_Old+0)
STRB	R1, [R0, #0]
;Slide_Show.c,324 :: 		}
L_doSlide50:
;Slide_Show.c,325 :: 		}
L_end_doSlide:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doSlide
