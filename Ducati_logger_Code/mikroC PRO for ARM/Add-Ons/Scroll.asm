_Scroll_Init_Scroll_area:
;Scroll.c,43 :: 		void Scroll_Init_Scroll_area(unsigned int first, unsigned int last){
SUB	SP, SP, #16
STR	LR, [SP, #0]
STRH	R0, [SP, #8]
STRH	R1, [SP, #12]
;Scroll.c,45 :: 		TFT_CS = 0;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(TFT_CS+0)
MOVT	R2, #hi_addr(TFT_CS+0)
STR	R3, [R2, #0]
;Scroll.c,46 :: 		Set_Index(0x33);
MOVS	R0, #51
BL	_Set_Index+0
;Scroll.c,47 :: 		Write_Command(Hi(first));
ADD	R2, SP, #8
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	_Write_Command+0
;Scroll.c,48 :: 		Write_Command(Lo(first));
ADD	R2, SP, #8
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	_Write_Command+0
;Scroll.c,49 :: 		temp = last - first;
LDRH	R3, [SP, #8]
LDRH	R2, [SP, #12]
SUB	R2, R2, R3
STRH	R2, [SP, #4]
;Scroll.c,50 :: 		Write_Command(Hi(temp));
ADD	R2, SP, #4
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	_Write_Command+0
;Scroll.c,51 :: 		Write_Command(Lo(temp));
ADD	R2, SP, #4
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	_Write_Command+0
;Scroll.c,52 :: 		temp = _DISPLAY_HEIGHT - last;
LDRH	R2, [SP, #12]
RSB	R2, R2, #272
STRH	R2, [SP, #4]
;Scroll.c,53 :: 		Write_Command(Hi(temp));
ADD	R2, SP, #4
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	_Write_Command+0
;Scroll.c,54 :: 		Write_Command(Lo(temp));
ADD	R2, SP, #4
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	_Write_Command+0
;Scroll.c,55 :: 		TFT_CS = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(TFT_CS+0)
MOVT	R2, #hi_addr(TFT_CS+0)
STR	R3, [R2, #0]
;Scroll.c,56 :: 		}
L_end_Scroll_Init_Scroll_area:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _Scroll_Init_Scroll_area
_Scroll_Undone:
;Scroll.c,65 :: 		void Scroll_Undone(unsigned int first, unsigned int last){
; last start address is: 4 (R1)
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRH	R0, [SP, #4]
; last end address is: 4 (R1)
; last start address is: 4 (R1)
;Scroll.c,66 :: 		Scroll_Init_Scroll_area(first, last);
; last end address is: 4 (R1)
LDRH	R0, [SP, #4]
BL	_Scroll_Init_Scroll_area+0
;Scroll.c,67 :: 		TFT_CS = 0;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(TFT_CS+0)
MOVT	R2, #hi_addr(TFT_CS+0)
STR	R3, [R2, #0]
;Scroll.c,68 :: 		Set_Index(0x36);
MOVS	R0, #54
BL	_Set_Index+0
;Scroll.c,69 :: 		Write_Command(0x00);
MOVS	R0, #0
BL	_Write_Command+0
;Scroll.c,71 :: 		Set_Index(0x37);
MOVS	R0, #55
BL	_Set_Index+0
;Scroll.c,72 :: 		Write_Command(Hi(first));
ADD	R2, SP, #4
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	_Write_Command+0
;Scroll.c,73 :: 		Write_Command(Lo(first));
ADD	R2, SP, #4
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	_Write_Command+0
;Scroll.c,75 :: 		TFT_CS = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(TFT_CS+0)
MOVT	R2, #hi_addr(TFT_CS+0)
STR	R3, [R2, #0]
;Scroll.c,76 :: 		}
L_end_Scroll_Undone:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Scroll_Undone
_Scroll:
;Scroll.c,85 :: 		void Scroll(unsigned int scroll) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRH	R0, [SP, #4]
;Scroll.c,86 :: 		TFT_CS = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(TFT_CS+0)
MOVT	R1, #hi_addr(TFT_CS+0)
STR	R2, [R1, #0]
;Scroll.c,88 :: 		Set_Index(0x36);
MOVS	R0, #54
BL	_Set_Index+0
;Scroll.c,89 :: 		Write_Command(0x00);
MOVS	R0, #0
BL	_Write_Command+0
;Scroll.c,91 :: 		Set_Index(0x37);
MOVS	R0, #55
BL	_Set_Index+0
;Scroll.c,92 :: 		Write_Command(Hi(scroll));
ADD	R1, SP, #4
ADDS	R1, R1, #1
LDRB	R1, [R1, #0]
UXTB	R0, R1
BL	_Write_Command+0
;Scroll.c,93 :: 		Write_Command(Lo(scroll));
ADD	R1, SP, #4
LDRB	R1, [R1, #0]
UXTB	R0, R1
BL	_Write_Command+0
;Scroll.c,95 :: 		TFT_CS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(TFT_CS+0)
MOVT	R1, #hi_addr(TFT_CS+0)
STR	R2, [R1, #0]
;Scroll.c,96 :: 		}
L_end_Scroll:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Scroll
