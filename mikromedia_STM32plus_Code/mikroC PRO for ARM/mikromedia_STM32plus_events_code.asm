_Run_Example:
;mikromedia_STM32plus_events_code.c,106 :: 		void Run_Example(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,107 :: 		switch (Example_State) {
IT	AL
BAL	L_Run_Example0
;mikromedia_STM32plus_events_code.c,108 :: 		case 0 : {
L_Run_Example2:
;mikromedia_STM32plus_events_code.c,109 :: 		checkRTC();            // Home screen
BL	_checkRTC+0
;mikromedia_STM32plus_events_code.c,110 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,111 :: 		}; break;
IT	AL
BAL	L_Run_Example1
;mikromedia_STM32plus_events_code.c,112 :: 		case 1 : {
L_Run_Example3:
;mikromedia_STM32plus_events_code.c,113 :: 		doAccel();             // Accel Screen
BL	_doAccel+0
;mikromedia_STM32plus_events_code.c,114 :: 		}; break;
IT	AL
BAL	L_Run_Example1
;mikromedia_STM32plus_events_code.c,115 :: 		case 2 : {                       // RTCC screen
L_Run_Example4:
;mikromedia_STM32plus_events_code.c,116 :: 		if (PenDown == 0)
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Run_Example5
;mikromedia_STM32plus_events_code.c,117 :: 		doRTC_Example();
BL	_doRTC_Example+0
L_Run_Example5:
;mikromedia_STM32plus_events_code.c,118 :: 		}; break;
IT	AL
BAL	L_Run_Example1
;mikromedia_STM32plus_events_code.c,119 :: 		case 3 : break;                  // RGB screen
L_Run_Example6:
IT	AL
BAL	L_Run_Example1
;mikromedia_STM32plus_events_code.c,120 :: 		case 4 : {
L_Run_Example7:
;mikromedia_STM32plus_events_code.c,121 :: 		Sensors_Read();        // Sensors screen
BL	_Sensors_Read+0
;mikromedia_STM32plus_events_code.c,122 :: 		}; break;
IT	AL
BAL	L_Run_Example1
;mikromedia_STM32plus_events_code.c,123 :: 		case 5 : {
L_Run_Example8:
;mikromedia_STM32plus_events_code.c,124 :: 		doMp3();               // MP3
BL	_doMP3+0
;mikromedia_STM32plus_events_code.c,125 :: 		}; break;
IT	AL
BAL	L_Run_Example1
;mikromedia_STM32plus_events_code.c,126 :: 		case 6 : break;
L_Run_Example9:
IT	AL
BAL	L_Run_Example1
;mikromedia_STM32plus_events_code.c,127 :: 		case 7 : {                       // Slide Show
L_Run_Example10:
;mikromedia_STM32plus_events_code.c,128 :: 		doSlide();
BL	_doSlide+0
;mikromedia_STM32plus_events_code.c,129 :: 		}; break;
IT	AL
BAL	L_Run_Example1
;mikromedia_STM32plus_events_code.c,130 :: 		case 8 : {                       // Tic Tac Toe
L_Run_Example11:
;mikromedia_STM32plus_events_code.c,131 :: 		doTicTacToe();
BL	_doTicTacToe+0
;mikromedia_STM32plus_events_code.c,132 :: 		}; break;
IT	AL
BAL	L_Run_Example1
;mikromedia_STM32plus_events_code.c,133 :: 		}
L_Run_Example0:
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_Run_Example2
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_Run_Example3
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_Run_Example4
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_Run_Example6
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_Run_Example7
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #5
IT	EQ
BEQ	L_Run_Example8
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #6
IT	EQ
BEQ	L_Run_Example9
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #7
IT	EQ
BEQ	L_Run_Example10
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #8
IT	EQ
BEQ	L_Run_Example11
L_Run_Example1:
;mikromedia_STM32plus_events_code.c,134 :: 		}
L_end_Run_Example:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Run_Example
_BLED_Fade_Out:
;mikromedia_STM32plus_events_code.c,136 :: 		void BLED_Fade_Out(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,139 :: 		for ( i = 255; i > 0 ; i-- ){
; i start address is: 4 (R1)
MOVS	R1, #255
SXTH	R1, R1
; i end address is: 4 (R1)
L_BLED_Fade_Out12:
; i start address is: 4 (R1)
CMP	R1, #0
IT	LE
BLE	L_BLED_Fade_Out13
;mikromedia_STM32plus_events_code.c,140 :: 		TFT_Set_DBC_SSD1963(i);
STRH	R1, [SP, #4]
UXTB	R0, R1
BL	_TFT_Set_DBC_SSD1963+0
LDRSH	R1, [SP, #4]
;mikromedia_STM32plus_events_code.c,141 :: 		Delay_ms(1);
MOVW	R7, #49998
MOVT	R7, #0
NOP
NOP
L_BLED_Fade_Out15:
SUBS	R7, R7, #1
BNE	L_BLED_Fade_Out15
NOP
NOP
NOP
;mikromedia_STM32plus_events_code.c,139 :: 		for ( i = 255; i > 0 ; i-- ){
SUBS	R1, R1, #1
SXTH	R1, R1
;mikromedia_STM32plus_events_code.c,142 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_BLED_Fade_Out12
L_BLED_Fade_Out13:
;mikromedia_STM32plus_events_code.c,143 :: 		TFT_Set_DBC_SSD1963(0);
MOVS	R0, #0
BL	_TFT_Set_DBC_SSD1963+0
;mikromedia_STM32plus_events_code.c,144 :: 		}
L_end_BLED_Fade_Out:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _BLED_Fade_Out
_BLED_Fade_In:
;mikromedia_STM32plus_events_code.c,146 :: 		void BLED_Fade_In(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,149 :: 		for (i = 1; i < 255; i++){
; i start address is: 4 (R1)
MOVS	R1, #1
SXTH	R1, R1
; i end address is: 4 (R1)
L_BLED_Fade_In17:
; i start address is: 4 (R1)
CMP	R1, #255
IT	GE
BGE	L_BLED_Fade_In18
;mikromedia_STM32plus_events_code.c,150 :: 		TFT_Set_DBC_SSD1963(i);
STRH	R1, [SP, #4]
UXTB	R0, R1
BL	_TFT_Set_DBC_SSD1963+0
LDRSH	R1, [SP, #4]
;mikromedia_STM32plus_events_code.c,151 :: 		Delay_ms(1);
MOVW	R7, #49998
MOVT	R7, #0
NOP
NOP
L_BLED_Fade_In20:
SUBS	R7, R7, #1
BNE	L_BLED_Fade_In20
NOP
NOP
NOP
;mikromedia_STM32plus_events_code.c,149 :: 		for (i = 1; i < 255; i++){
ADDS	R1, R1, #1
SXTH	R1, R1
;mikromedia_STM32plus_events_code.c,152 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_BLED_Fade_In17
L_BLED_Fade_In18:
;mikromedia_STM32plus_events_code.c,153 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;mikromedia_STM32plus_events_code.c,154 :: 		}
L_end_BLED_Fade_In:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _BLED_Fade_In
_UpdateVolumeBar:
;mikromedia_STM32plus_events_code.c,157 :: 		void UpdateVolumeBar(char vol, char old_vol){
; vol start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; vol end address is: 0 (R0)
; vol start address is: 0 (R0)
;mikromedia_STM32plus_events_code.c,160 :: 		xcoo = (vol*3)/4 + VolmeBar.Left;
MOVS	R2, #3
SXTH	R2, R2
MULS	R2, R0, R2
SXTH	R2, R2
; vol end address is: 0 (R0)
ASRS	R3, R2, #2
SXTH	R3, R3
MOVW	R4, #lo_addr(_VolmeBar+6)
MOVT	R4, #hi_addr(_VolmeBar+6)
LDRH	R2, [R4, #0]
ADDS	R3, R3, R2
UXTH	R3, R3
STRH	R3, [SP, #4]
;mikromedia_STM32plus_events_code.c,162 :: 		if (xcoo < VolmeBar.Left)
MOV	R2, R4
LDRH	R2, [R2, #0]
CMP	R3, R2
IT	CS
BCS	L_UpdateVolumeBar22
;mikromedia_STM32plus_events_code.c,163 :: 		xcoo = VolmeBar.Left;
MOVW	R2, #lo_addr(_VolmeBar+6)
MOVT	R2, #hi_addr(_VolmeBar+6)
LDRH	R2, [R2, #0]
STRH	R2, [SP, #4]
L_UpdateVolumeBar22:
;mikromedia_STM32plus_events_code.c,165 :: 		if (xcoo > VolmeBar.Left + VolmeBar.Width)
MOVW	R2, #lo_addr(_VolmeBar+10)
MOVT	R2, #hi_addr(_VolmeBar+10)
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(_VolmeBar+6)
MOVT	R2, #hi_addr(_VolmeBar+6)
LDRH	R2, [R2, #0]
ADDS	R3, R2, R3
UXTH	R3, R3
LDRH	R2, [SP, #4]
CMP	R2, R3
IT	LS
BLS	L_UpdateVolumeBar23
;mikromedia_STM32plus_events_code.c,166 :: 		xcoo = VolmeBar.Left + VolmeBar.Width;
MOVW	R2, #lo_addr(_VolmeBar+10)
MOVT	R2, #hi_addr(_VolmeBar+10)
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(_VolmeBar+6)
MOVT	R2, #hi_addr(_VolmeBar+6)
LDRH	R2, [R2, #0]
ADDS	R2, R2, R3
STRH	R2, [SP, #4]
L_UpdateVolumeBar23:
;mikromedia_STM32plus_events_code.c,169 :: 		TFT_Set_Brush(1, 0x55FF, 0, 0, 0, 0);
MOVS	R3, #0
MOVS	R2, #0
PUSH	(R3)
PUSH	(R2)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #22015
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;mikromedia_STM32plus_events_code.c,170 :: 		TFT_Set_Pen(0x55FF, 0);
MOVS	R1, #0
MOVW	R0, #22015
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,171 :: 		TFT_Rectangle(VolmeBar.Left, VolmeBar.Top, xcoo, VolmeBar.Top + VolmeBar.Height);
MOVW	R2, #lo_addr(_VolmeBar+12)
MOVT	R2, #hi_addr(_VolmeBar+12)
LDRH	R4, [R2, #0]
MOVW	R3, #lo_addr(_VolmeBar+8)
MOVT	R3, #hi_addr(_VolmeBar+8)
LDRH	R2, [R3, #0]
ADDS	R4, R2, R4
MOV	R2, R3
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(_VolmeBar+6)
MOVT	R2, #hi_addr(_VolmeBar+6)
LDRH	R2, [R2, #0]
SXTH	R1, R3
SXTH	R3, R4
SXTH	R0, R2
LDRH	R2, [SP, #4]
BL	_TFT_Rectangle+0
;mikromedia_STM32plus_events_code.c,174 :: 		TFT_Set_Brush(1, VolmeBar.Color, 0, 0, 0, 0);
MOVS	R4, #0
MOVS	R3, #0
MOVW	R2, #lo_addr(_VolmeBar+28)
MOVT	R2, #hi_addr(_VolmeBar+28)
LDRH	R2, [R2, #0]
PUSH	(R4)
PUSH	(R3)
MOVS	R3, #0
UXTH	R1, R2
MOVS	R2, #0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;mikromedia_STM32plus_events_code.c,175 :: 		TFT_Set_Pen(VolmeBar.Color, 0);
MOVW	R2, #lo_addr(_VolmeBar+28)
MOVT	R2, #hi_addr(_VolmeBar+28)
LDRH	R2, [R2, #0]
MOVS	R1, #0
UXTH	R0, R2
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,176 :: 		TFT_Rectangle(xcoo + 1, VolmeBar.Top, VolmeBar.Left + VolmeBar.Width + 1, VolmeBar.Top + VolmeBar.Height);
MOVW	R2, #lo_addr(_VolmeBar+12)
MOVT	R2, #hi_addr(_VolmeBar+12)
LDRH	R3, [R2, #0]
MOVW	R6, #lo_addr(_VolmeBar+8)
MOVT	R6, #hi_addr(_VolmeBar+8)
LDRH	R2, [R6, #0]
ADDS	R5, R2, R3
MOVW	R2, #lo_addr(_VolmeBar+10)
MOVT	R2, #hi_addr(_VolmeBar+10)
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(_VolmeBar+6)
MOVT	R2, #hi_addr(_VolmeBar+6)
LDRH	R2, [R2, #0]
ADDS	R2, R2, R3
UXTH	R2, R2
ADDS	R4, R2, #1
MOV	R2, R6
LDRH	R3, [R2, #0]
LDRH	R2, [SP, #4]
ADDS	R2, R2, #1
SXTH	R1, R3
SXTH	R3, R5
SXTH	R0, R2
SXTH	R2, R4
BL	_TFT_Rectangle+0
;mikromedia_STM32plus_events_code.c,178 :: 		}
L_end_UpdateVolumeBar:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _UpdateVolumeBar
_Image2OnPress:
;mikromedia_STM32plus_events_code.c,184 :: 		void Image2OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,185 :: 		Example_State = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,186 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,187 :: 		Accel_Stop();
BL	_Accel_Stop+0
;mikromedia_STM32plus_events_code.c,188 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,189 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,190 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,191 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,192 :: 		}
L_end_Image2OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image2OnPress
_Image1OnPress:
;mikromedia_STM32plus_events_code.c,194 :: 		void Image1OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,195 :: 		Example_State = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,196 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,197 :: 		DrawScreen(&Accelerometer);
MOVW	R0, #lo_addr(_Accelerometer+0)
MOVT	R0, #hi_addr(_Accelerometer+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,198 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,199 :: 		ACCEL_Start(&cACCEL_test_status);
MOVW	R0, #lo_addr(_cACCEL_test_status+0)
MOVT	R0, #hi_addr(_cACCEL_test_status+0)
BL	_ACCEL_Start+0
;mikromedia_STM32plus_events_code.c,200 :: 		}
L_end_Image1OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image1OnPress
_Image3OnPress:
;mikromedia_STM32plus_events_code.c,202 :: 		void Image3OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,203 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,204 :: 		DrawScreen(&RGBLight);
MOVW	R0, #lo_addr(_RGBLight+0)
MOVT	R0, #hi_addr(_RGBLight+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,205 :: 		RGB_Init();
BL	_RGB_Init+0
;mikromedia_STM32plus_events_code.c,206 :: 		Example_State = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,207 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,209 :: 		}
L_end_Image3OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image3OnPress
_Image5OnPress:
;mikromedia_STM32plus_events_code.c,211 :: 		void Image5OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,212 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,213 :: 		RGB_OFF();
BL	_RGB_OFF+0
;mikromedia_STM32plus_events_code.c,214 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,215 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,216 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,217 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,218 :: 		Example_state = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,219 :: 		}
L_end_Image5OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image5OnPress
_Image4OnPress:
;mikromedia_STM32plus_events_code.c,221 :: 		void Image4OnPress() {
;mikromedia_STM32plus_events_code.c,223 :: 		}
L_end_Image4OnPress:
BX	LR
; end of _Image4OnPress
_Image6OnClick:
;mikromedia_STM32plus_events_code.c,225 :: 		void Image6OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,226 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,227 :: 		DrawScreen(&Clock);
MOVW	R0, #lo_addr(_Clock+0)
MOVT	R0, #hi_addr(_Clock+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,228 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,229 :: 		RTC_Example_init();
BL	_RTC_Example_init+0
;mikromedia_STM32plus_events_code.c,230 :: 		Example_State = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,231 :: 		}
L_end_Image6OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image6OnClick
_Box2OnPress:
;mikromedia_STM32plus_events_code.c,233 :: 		void Box2OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,234 :: 		HoursTens();
BL	_HoursTens+0
;mikromedia_STM32plus_events_code.c,235 :: 		}
L_end_Box2OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box2OnPress
_Box3OnPress:
;mikromedia_STM32plus_events_code.c,237 :: 		void Box3OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,238 :: 		HoursOnes();
BL	_HoursOnes+0
;mikromedia_STM32plus_events_code.c,239 :: 		}
L_end_Box3OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box3OnPress
_Box4OnPress:
;mikromedia_STM32plus_events_code.c,241 :: 		void Box4OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,242 :: 		MinutesTens();
BL	_MinutesTens+0
;mikromedia_STM32plus_events_code.c,243 :: 		}
L_end_Box4OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box4OnPress
_Box5OnPress:
;mikromedia_STM32plus_events_code.c,245 :: 		void Box5OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,246 :: 		MinutesOnes();
BL	_MinutesOnes+0
;mikromedia_STM32plus_events_code.c,247 :: 		}
L_end_Box5OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box5OnPress
_ClockBackOnPress:
;mikromedia_STM32plus_events_code.c,249 :: 		void ClockBackOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,250 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,251 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,252 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,253 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,254 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,255 :: 		Example_State = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,256 :: 		}
L_end_ClockBackOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ClockBackOnPress
_Image8OnPress:
;mikromedia_STM32plus_events_code.c,258 :: 		void Image8OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,259 :: 		if (Set_MyRTCC() == 0)
BL	_Set_MyRTCC+0
CMP	R0, #0
IT	NE
BNE	L_Image8OnPress24
;mikromedia_STM32plus_events_code.c,260 :: 		return;
IT	AL
BAL	L_end_Image8OnPress
L_Image8OnPress24:
;mikromedia_STM32plus_events_code.c,261 :: 		Example_State = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,262 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,263 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,264 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,265 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,266 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,267 :: 		}
L_end_Image8OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image8OnPress
_BackIconSensorsOnPress:
;mikromedia_STM32plus_events_code.c,269 :: 		void BackIconSensorsOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,270 :: 		Stop_sensors();
BL	_Stop_sensors+0
;mikromedia_STM32plus_events_code.c,271 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,272 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,273 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,274 :: 		Example_state = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,275 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,276 :: 		}
L_end_BackIconSensorsOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _BackIconSensorsOnPress
_Image9OnPress:
;mikromedia_STM32plus_events_code.c,278 :: 		void Image9OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,279 :: 		Sensors_Init();
BL	_Sensors_Init+0
;mikromedia_STM32plus_events_code.c,280 :: 		Example_state = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,281 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,282 :: 		DrawScreen(&Sensors);
MOVW	R0, #lo_addr(_Sensors+0)
MOVT	R0, #hi_addr(_Sensors+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,283 :: 		Sensors_Read();
BL	_Sensors_Read+0
;mikromedia_STM32plus_events_code.c,284 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,285 :: 		}
L_end_Image9OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image9OnPress
_Image16OnClick:
;mikromedia_STM32plus_events_code.c,287 :: 		void Image16OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,288 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,289 :: 		DrawScreen(&MP3_SongList);
MOVW	R0, #lo_addr(_MP3_SongList+0)
MOVT	R0, #hi_addr(_MP3_SongList+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,290 :: 		Mp3_Init();
BL	_Mp3_Init+0
;mikromedia_STM32plus_events_code.c,291 :: 		Example_state = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,292 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,293 :: 		}
L_end_Image16OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image16OnClick
_mp3_back_iconOnPress:
;mikromedia_STM32plus_events_code.c,295 :: 		void mp3_back_iconOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,296 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,297 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,298 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,299 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,300 :: 		Example_state = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,301 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,302 :: 		}
L_end_mp3_back_iconOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mp3_back_iconOnPress
_Label22OnPress:
;mikromedia_STM32plus_events_code.c,304 :: 		void Label22OnPress() {
;mikromedia_STM32plus_events_code.c,306 :: 		}
L_end_Label22OnPress:
BX	LR
; end of _Label22OnPress
_Image15OnPress:
;mikromedia_STM32plus_events_code.c,308 :: 		void Image15OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,309 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,310 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,311 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,312 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,313 :: 		Example_state = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,314 :: 		Stop_Scroll();
BL	_Stop_Scroll+0
;mikromedia_STM32plus_events_code.c,315 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,316 :: 		}
L_end_Image15OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image15OnPress
_Label24OnPress:
;mikromedia_STM32plus_events_code.c,318 :: 		void Label24OnPress() {
;mikromedia_STM32plus_events_code.c,320 :: 		}
L_end_Label24OnPress:
BX	LR
; end of _Label24OnPress
_Box6OnPress:
;mikromedia_STM32plus_events_code.c,322 :: 		void Box6OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,323 :: 		ScrollPress();
BL	_ScrollPress+0
;mikromedia_STM32plus_events_code.c,324 :: 		}
L_end_Box6OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box6OnPress
_Box6OnClick:
;mikromedia_STM32plus_events_code.c,326 :: 		void Box6OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,327 :: 		ScrollOnClick();
BL	_ScrollOnClick+0
;mikromedia_STM32plus_events_code.c,328 :: 		}
L_end_Box6OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box6OnClick
_Icon_back_mp3OnClick:
;mikromedia_STM32plus_events_code.c,330 :: 		void Icon_back_mp3OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,331 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,332 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,333 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,334 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,335 :: 		Example_state = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,336 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,337 :: 		}
L_end_Icon_back_mp3OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Icon_back_mp3OnClick
_Label27OnPress:
;mikromedia_STM32plus_events_code.c,339 :: 		void Label27OnPress() {
;mikromedia_STM32plus_events_code.c,341 :: 		}
L_end_Label27OnPress:
BX	LR
; end of _Label27OnPress
_DrawingAreaOnPress:
;mikromedia_STM32plus_events_code.c,344 :: 		void DrawingAreaOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,345 :: 		if ((Xcoord >= DrawingArea.Left+drawingTool.pen_size) && (Ycoord >= DrawingArea.Top+drawingTool.pen_size)){
MOVW	R0, #lo_addr(_drawingTool+0)
MOVT	R0, #hi_addr(_drawingTool+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_DrawingArea+6)
MOVT	R0, #hi_addr(_DrawingArea+6)
LDRH	R0, [R0, #0]
ADDS	R1, R0, R1
UXTH	R1, R1
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CC
BCC	L__DrawingAreaOnPress45
MOVW	R0, #lo_addr(_drawingTool+0)
MOVT	R0, #hi_addr(_drawingTool+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_DrawingArea+8)
MOVT	R0, #hi_addr(_DrawingArea+8)
LDRH	R0, [R0, #0]
ADDS	R1, R0, R1
UXTH	R1, R1
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CC
BCC	L__DrawingAreaOnPress44
L__DrawingAreaOnPress43:
;mikromedia_STM32plus_events_code.c,346 :: 		if (drawingTool.EraserSelected){
MOVW	R0, #lo_addr(_drawingTool+2)
MOVT	R0, #hi_addr(_drawingTool+2)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_DrawingAreaOnPress28
;mikromedia_STM32plus_events_code.c,347 :: 		TFT_Set_Pen(DrawingArea.Color, 0);
MOVW	R0, #lo_addr(_DrawingArea+28)
MOVT	R0, #hi_addr(_DrawingArea+28)
LDRH	R0, [R0, #0]
MOVS	R1, #0
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,348 :: 		TFT_Set_Brush(1, DrawingArea.Color, 0, 0, 0, 0);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_DrawingArea+28)
MOVT	R0, #hi_addr(_DrawingArea+28)
LDRH	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;mikromedia_STM32plus_events_code.c,349 :: 		}
L_DrawingAreaOnPress28:
;mikromedia_STM32plus_events_code.c,350 :: 		TFT_Circle(Xcoord, Ycoord, drawingTool.pen_size);
MOVW	R0, #lo_addr(_drawingTool+0)
MOVT	R0, #hi_addr(_drawingTool+0)
LDRH	R2, [R0, #0]
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_TFT_Circle+0
;mikromedia_STM32plus_events_code.c,345 :: 		if ((Xcoord >= DrawingArea.Left+drawingTool.pen_size) && (Ycoord >= DrawingArea.Top+drawingTool.pen_size)){
L__DrawingAreaOnPress45:
L__DrawingAreaOnPress44:
;mikromedia_STM32plus_events_code.c,352 :: 		}
L_end_DrawingAreaOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawingAreaOnPress
_Color01OnPress:
;mikromedia_STM32plus_events_code.c,354 :: 		void Color01OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,355 :: 		SelectColor(&Color01);
MOVW	R0, #lo_addr(_Color01+0)
MOVT	R0, #hi_addr(_Color01+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,356 :: 		}
L_end_Color01OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color01OnPress
_Color02OnPress:
;mikromedia_STM32plus_events_code.c,358 :: 		void Color02OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,359 :: 		SelectColor(&Color02);
MOVW	R0, #lo_addr(_Color02+0)
MOVT	R0, #hi_addr(_Color02+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,360 :: 		}
L_end_Color02OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color02OnPress
_Color03OnPress:
;mikromedia_STM32plus_events_code.c,362 :: 		void Color03OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,363 :: 		SelectColor(&Color03);
MOVW	R0, #lo_addr(_Color03+0)
MOVT	R0, #hi_addr(_Color03+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,364 :: 		}
L_end_Color03OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color03OnPress
_Color04OnPress:
;mikromedia_STM32plus_events_code.c,366 :: 		void Color04OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,367 :: 		SelectColor(&Color04);
MOVW	R0, #lo_addr(_Color04+0)
MOVT	R0, #hi_addr(_Color04+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,368 :: 		}
L_end_Color04OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color04OnPress
_Color05OnPress:
;mikromedia_STM32plus_events_code.c,370 :: 		void Color05OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,371 :: 		SelectColor(&Color05);
MOVW	R0, #lo_addr(_Color05+0)
MOVT	R0, #hi_addr(_Color05+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,372 :: 		}
L_end_Color05OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color05OnPress
_Color06OnPress:
;mikromedia_STM32plus_events_code.c,374 :: 		void Color06OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,375 :: 		SelectColor(&Color06);
MOVW	R0, #lo_addr(_Color06+0)
MOVT	R0, #hi_addr(_Color06+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,376 :: 		}
L_end_Color06OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color06OnPress
_Color07OnPress:
;mikromedia_STM32plus_events_code.c,378 :: 		void Color07OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,379 :: 		SelectColor(&Color07);
MOVW	R0, #lo_addr(_Color07+0)
MOVT	R0, #hi_addr(_Color07+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,380 :: 		}
L_end_Color07OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color07OnPress
_Color08OnPress:
;mikromedia_STM32plus_events_code.c,382 :: 		void Color08OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,383 :: 		SelectColor(&Color08);
MOVW	R0, #lo_addr(_Color08+0)
MOVT	R0, #hi_addr(_Color08+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,384 :: 		}
L_end_Color08OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color08OnPress
_Color09OnPress:
;mikromedia_STM32plus_events_code.c,386 :: 		void Color09OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,387 :: 		SelectColor(&Color09);
MOVW	R0, #lo_addr(_Color09+0)
MOVT	R0, #hi_addr(_Color09+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,388 :: 		}
L_end_Color09OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color09OnPress
_Color10OnPress:
;mikromedia_STM32plus_events_code.c,390 :: 		void Color10OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,391 :: 		SelectColor(&Color10);
MOVW	R0, #lo_addr(_Color10+0)
MOVT	R0, #hi_addr(_Color10+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,392 :: 		}
L_end_Color10OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color10OnPress
_Color11OnPress:
;mikromedia_STM32plus_events_code.c,394 :: 		void Color11OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,395 :: 		SelectColor(&Color11);
MOVW	R0, #lo_addr(_Color11+0)
MOVT	R0, #hi_addr(_Color11+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,396 :: 		}
L_end_Color11OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color11OnPress
_Color12OnPress:
;mikromedia_STM32plus_events_code.c,398 :: 		void Color12OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,399 :: 		SelectColor(&Color12);
MOVW	R0, #lo_addr(_Color12+0)
MOVT	R0, #hi_addr(_Color12+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,400 :: 		}
L_end_Color12OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color12OnPress
_Color13OnPress:
;mikromedia_STM32plus_events_code.c,402 :: 		void Color13OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,403 :: 		SelectColor(&Color13);
MOVW	R0, #lo_addr(_Color13+0)
MOVT	R0, #hi_addr(_Color13+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,404 :: 		}
L_end_Color13OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color13OnPress
_Color14OnPress:
;mikromedia_STM32plus_events_code.c,406 :: 		void Color14OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,407 :: 		SelectColor(&Color14);
MOVW	R0, #lo_addr(_Color14+0)
MOVT	R0, #hi_addr(_Color14+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,408 :: 		}
L_end_Color14OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color14OnPress
_Color15OnPress:
;mikromedia_STM32plus_events_code.c,410 :: 		void Color15OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,411 :: 		SelectColor(&Color15);
MOVW	R0, #lo_addr(_Color15+0)
MOVT	R0, #hi_addr(_Color15+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,412 :: 		}
L_end_Color15OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color15OnPress
_Color16OnPress:
;mikromedia_STM32plus_events_code.c,414 :: 		void Color16OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,415 :: 		SelectColor(&Color16);
MOVW	R0, #lo_addr(_Color16+0)
MOVT	R0, #hi_addr(_Color16+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,416 :: 		}
L_end_Color16OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color16OnPress
_Color17OnPress:
;mikromedia_STM32plus_events_code.c,418 :: 		void Color17OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,419 :: 		SelectColor(&Color17);
MOVW	R0, #lo_addr(_Color17+0)
MOVT	R0, #hi_addr(_Color17+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,420 :: 		}
L_end_Color17OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color17OnPress
_Color18OnPress:
;mikromedia_STM32plus_events_code.c,422 :: 		void Color18OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,423 :: 		SelectColor(&Color18);
MOVW	R0, #lo_addr(_Color18+0)
MOVT	R0, #hi_addr(_Color18+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,424 :: 		}
L_end_Color18OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color18OnPress
_Color19OnPress:
;mikromedia_STM32plus_events_code.c,426 :: 		void Color19OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,427 :: 		SelectColor(&Color19);
MOVW	R0, #lo_addr(_Color19+0)
MOVT	R0, #hi_addr(_Color19+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,428 :: 		}
L_end_Color19OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color19OnPress
_Color20OnPress:
;mikromedia_STM32plus_events_code.c,430 :: 		void Color20OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,431 :: 		SelectColor(&Color20);
MOVW	R0, #lo_addr(_Color20+0)
MOVT	R0, #hi_addr(_Color20+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,432 :: 		}
L_end_Color20OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color20OnPress
_Color21OnPress:
;mikromedia_STM32plus_events_code.c,434 :: 		void Color21OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,435 :: 		SelectColor(&Color21);
MOVW	R0, #lo_addr(_Color21+0)
MOVT	R0, #hi_addr(_Color21+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,436 :: 		}
L_end_Color21OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color21OnPress
_Color22OnPress:
;mikromedia_STM32plus_events_code.c,438 :: 		void Color22OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,439 :: 		SelectColor(&Color22);
MOVW	R0, #lo_addr(_Color22+0)
MOVT	R0, #hi_addr(_Color22+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,440 :: 		}
L_end_Color22OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color22OnPress
_Color23OnPress:
;mikromedia_STM32plus_events_code.c,442 :: 		void Color23OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,443 :: 		SelectColor(&Color23);
MOVW	R0, #lo_addr(_Color23+0)
MOVT	R0, #hi_addr(_Color23+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,444 :: 		}
L_end_Color23OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color23OnPress
_Color24OnPress:
;mikromedia_STM32plus_events_code.c,446 :: 		void Color24OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,447 :: 		SelectColor(&Color24);
MOVW	R0, #lo_addr(_Color24+0)
MOVT	R0, #hi_addr(_Color24+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,448 :: 		}
L_end_Color24OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color24OnPress
_Color25OnPress:
;mikromedia_STM32plus_events_code.c,450 :: 		void Color25OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,451 :: 		SelectColor(&Color25);
MOVW	R0, #lo_addr(_Color25+0)
MOVT	R0, #hi_addr(_Color25+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,452 :: 		}
L_end_Color25OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color25OnPress
_Color26OnPress:
;mikromedia_STM32plus_events_code.c,454 :: 		void Color26OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,455 :: 		SelectColor(&Color26);
MOVW	R0, #lo_addr(_Color26+0)
MOVT	R0, #hi_addr(_Color26+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,456 :: 		}
L_end_Color26OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color26OnPress
_Color27OnPress:
;mikromedia_STM32plus_events_code.c,458 :: 		void Color27OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,459 :: 		SelectColor(&Color27);
MOVW	R0, #lo_addr(_Color27+0)
MOVT	R0, #hi_addr(_Color27+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,460 :: 		}
L_end_Color27OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color27OnPress
_Color28OnPress:
;mikromedia_STM32plus_events_code.c,462 :: 		void Color28OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,463 :: 		SelectColor(&Color28);
MOVW	R0, #lo_addr(_Color28+0)
MOVT	R0, #hi_addr(_Color28+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,464 :: 		}
L_end_Color28OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color28OnPress
_Color29OnPress:
;mikromedia_STM32plus_events_code.c,466 :: 		void Color29OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,467 :: 		SelectColor(&Color29);
MOVW	R0, #lo_addr(_Color29+0)
MOVT	R0, #hi_addr(_Color29+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,468 :: 		}
L_end_Color29OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color29OnPress
_Color30OnPress:
;mikromedia_STM32plus_events_code.c,470 :: 		void Color30OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,471 :: 		SelectColor(&Color30);
MOVW	R0, #lo_addr(_Color30+0)
MOVT	R0, #hi_addr(_Color30+0)
BL	_SelectColor+0
;mikromedia_STM32plus_events_code.c,472 :: 		}
L_end_Color30OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Color30OnPress
_Pen1OnPress:
;mikromedia_STM32plus_events_code.c,474 :: 		void Pen1OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,475 :: 		if (drawingTool.CurrentPen != &Pen1){
MOVW	R0, #lo_addr(_drawingTool+4)
MOVT	R0, #hi_addr(_drawingTool+4)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Pen1+0)
MOVT	R0, #hi_addr(_Pen1+0)
CMP	R1, R0
IT	EQ
BEQ	L_Pen1OnPress29
;mikromedia_STM32plus_events_code.c,476 :: 		drawingTool.pen_size = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_drawingTool+0)
MOVT	R0, #hi_addr(_drawingTool+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,477 :: 		drawingTool.PreviousPen = drawingTool.CurrentPen;
MOVW	R2, #lo_addr(_drawingTool+4)
MOVT	R2, #hi_addr(_drawingTool+4)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_drawingTool+8)
MOVT	R0, #hi_addr(_drawingTool+8)
STR	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,478 :: 		drawingTool.CurrentPen = &Pen1;
MOVW	R0, #lo_addr(_Pen1+0)
MOVT	R0, #hi_addr(_Pen1+0)
STR	R0, [R2, #0]
;mikromedia_STM32plus_events_code.c,479 :: 		UpdatePenSelection();
BL	_UpdatePenSelection+0
;mikromedia_STM32plus_events_code.c,480 :: 		}
L_Pen1OnPress29:
;mikromedia_STM32plus_events_code.c,481 :: 		}
L_end_Pen1OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Pen1OnPress
_Pen2OnPress:
;mikromedia_STM32plus_events_code.c,483 :: 		void Pen2OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,484 :: 		if (drawingTool.CurrentPen != &Pen2){
MOVW	R0, #lo_addr(_drawingTool+4)
MOVT	R0, #hi_addr(_drawingTool+4)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Pen2+0)
MOVT	R0, #hi_addr(_Pen2+0)
CMP	R1, R0
IT	EQ
BEQ	L_Pen2OnPress30
;mikromedia_STM32plus_events_code.c,485 :: 		drawingTool.pen_size = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_drawingTool+0)
MOVT	R0, #hi_addr(_drawingTool+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,486 :: 		drawingTool.PreviousPen = drawingTool.CurrentPen;
MOVW	R2, #lo_addr(_drawingTool+4)
MOVT	R2, #hi_addr(_drawingTool+4)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_drawingTool+8)
MOVT	R0, #hi_addr(_drawingTool+8)
STR	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,487 :: 		drawingTool.CurrentPen = &Pen2;
MOVW	R0, #lo_addr(_Pen2+0)
MOVT	R0, #hi_addr(_Pen2+0)
STR	R0, [R2, #0]
;mikromedia_STM32plus_events_code.c,488 :: 		UpdatePenSelection();
BL	_UpdatePenSelection+0
;mikromedia_STM32plus_events_code.c,489 :: 		}
L_Pen2OnPress30:
;mikromedia_STM32plus_events_code.c,490 :: 		}
L_end_Pen2OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Pen2OnPress
_Pen3OnPress:
;mikromedia_STM32plus_events_code.c,492 :: 		void Pen3OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,493 :: 		if (drawingTool.CurrentPen != &Pen3){
MOVW	R0, #lo_addr(_drawingTool+4)
MOVT	R0, #hi_addr(_drawingTool+4)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Pen3+0)
MOVT	R0, #hi_addr(_Pen3+0)
CMP	R1, R0
IT	EQ
BEQ	L_Pen3OnPress31
;mikromedia_STM32plus_events_code.c,494 :: 		drawingTool.pen_size = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_drawingTool+0)
MOVT	R0, #hi_addr(_drawingTool+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,495 :: 		drawingTool.PreviousPen = drawingTool.CurrentPen;
MOVW	R2, #lo_addr(_drawingTool+4)
MOVT	R2, #hi_addr(_drawingTool+4)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_drawingTool+8)
MOVT	R0, #hi_addr(_drawingTool+8)
STR	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,496 :: 		drawingTool.CurrentPen = &Pen3;
MOVW	R0, #lo_addr(_Pen3+0)
MOVT	R0, #hi_addr(_Pen3+0)
STR	R0, [R2, #0]
;mikromedia_STM32plus_events_code.c,497 :: 		UpdatePenSelection();
BL	_UpdatePenSelection+0
;mikromedia_STM32plus_events_code.c,498 :: 		}
L_Pen3OnPress31:
;mikromedia_STM32plus_events_code.c,499 :: 		}
L_end_Pen3OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Pen3OnPress
_NewScreenOnPress:
;mikromedia_STM32plus_events_code.c,501 :: 		void NewScreenOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,502 :: 		DrawBox(&DrawingArea);
MOVW	R0, #lo_addr(_DrawingArea+0)
MOVT	R0, #hi_addr(_DrawingArea+0)
BL	_DrawBox+0
;mikromedia_STM32plus_events_code.c,503 :: 		UpdatePenColor();
BL	_UpdatePenColor+0
;mikromedia_STM32plus_events_code.c,504 :: 		}
L_end_NewScreenOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _NewScreenOnPress
_BackGroundColorOnPress:
;mikromedia_STM32plus_events_code.c,506 :: 		void BackGroundColorOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,507 :: 		DrawingArea.Color = drawingTool.CurrentColor->Color;
MOVW	R0, #lo_addr(_drawingTool+12)
MOVT	R0, #hi_addr(_drawingTool+12)
LDR	R0, [R0, #0]
ADDS	R0, #28
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_DrawingArea+28)
MOVT	R0, #hi_addr(_DrawingArea+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,508 :: 		DrawBox(&DrawingArea);
MOVW	R0, #lo_addr(_DrawingArea+0)
MOVT	R0, #hi_addr(_DrawingArea+0)
BL	_DrawBox+0
;mikromedia_STM32plus_events_code.c,509 :: 		}
L_end_BackGroundColorOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _BackGroundColorOnPress
_EraserOnPress:
;mikromedia_STM32plus_events_code.c,511 :: 		void EraserOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,512 :: 		if (drawingTool.EraserSelected != 1){
MOVW	R0, #lo_addr(_drawingTool+2)
MOVT	R0, #hi_addr(_drawingTool+2)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_EraserOnPress32
;mikromedia_STM32plus_events_code.c,513 :: 		Pen.Picture_Name = icon_brush_bmp;
MOVW	R1, #lo_addr(_icon_brush_bmp+0)
MOVT	R1, #hi_addr(_icon_brush_bmp+0)
MOVW	R0, #lo_addr(_Pen+16)
MOVT	R0, #hi_addr(_Pen+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,514 :: 		DrawImage(&Pen);
MOVW	R0, #lo_addr(_Pen+0)
MOVT	R0, #hi_addr(_Pen+0)
BL	_DrawImage+0
;mikromedia_STM32plus_events_code.c,515 :: 		Eraser.Picture_Name = icon_eraser_selected_bmp;
MOVW	R1, #lo_addr(_icon_eraser_selected_bmp+0)
MOVT	R1, #hi_addr(_icon_eraser_selected_bmp+0)
MOVW	R0, #lo_addr(_Eraser+16)
MOVT	R0, #hi_addr(_Eraser+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,516 :: 		DrawImage(&Eraser);
MOVW	R0, #lo_addr(_Eraser+0)
MOVT	R0, #hi_addr(_Eraser+0)
BL	_DrawImage+0
;mikromedia_STM32plus_events_code.c,517 :: 		drawingTool.EraserSelected = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_drawingTool+2)
MOVT	R0, #hi_addr(_drawingTool+2)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,518 :: 		UpdatePenColor();
BL	_UpdatePenColor+0
;mikromedia_STM32plus_events_code.c,519 :: 		}
L_EraserOnPress32:
;mikromedia_STM32plus_events_code.c,520 :: 		}
L_end_EraserOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _EraserOnPress
_PenOnPress:
;mikromedia_STM32plus_events_code.c,522 :: 		void PenOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,523 :: 		if (drawingTool.EraserSelected != 0){
MOVW	R0, #lo_addr(_drawingTool+2)
MOVT	R0, #hi_addr(_drawingTool+2)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_PenOnPress33
;mikromedia_STM32plus_events_code.c,524 :: 		drawingTool.EraserSelected = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_drawingTool+2)
MOVT	R0, #hi_addr(_drawingTool+2)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,525 :: 		Eraser.Picture_Name = icon_eraser_bmp;
MOVW	R1, #lo_addr(_icon_eraser_bmp+0)
MOVT	R1, #hi_addr(_icon_eraser_bmp+0)
MOVW	R0, #lo_addr(_Eraser+16)
MOVT	R0, #hi_addr(_Eraser+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,526 :: 		DrawImage(&Eraser);
MOVW	R0, #lo_addr(_Eraser+0)
MOVT	R0, #hi_addr(_Eraser+0)
BL	_DrawImage+0
;mikromedia_STM32plus_events_code.c,527 :: 		Pen.Picture_Name = icon_brush_selected_bmp;
MOVW	R1, #lo_addr(_icon_brush_selected_bmp+0)
MOVT	R1, #hi_addr(_icon_brush_selected_bmp+0)
MOVW	R0, #lo_addr(_Pen+16)
MOVT	R0, #hi_addr(_Pen+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,528 :: 		DrawImage(&Pen);
MOVW	R0, #lo_addr(_Pen+0)
MOVT	R0, #hi_addr(_Pen+0)
BL	_DrawImage+0
;mikromedia_STM32plus_events_code.c,529 :: 		UpdatePenColor();
BL	_UpdatePenColor+0
;mikromedia_STM32plus_events_code.c,530 :: 		}
L_PenOnPress33:
;mikromedia_STM32plus_events_code.c,531 :: 		}
L_end_PenOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PenOnPress
_Image24OnPress:
;mikromedia_STM32plus_events_code.c,533 :: 		void Image24OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,534 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,535 :: 		SetDefaults();
BL	_SetDefaults+0
;mikromedia_STM32plus_events_code.c,536 :: 		DrawScreen(&Paint);
MOVW	R0, #lo_addr(_Paint+0)
MOVT	R0, #hi_addr(_Paint+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,537 :: 		Example_state = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,538 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,539 :: 		}
L_end_Image24OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image24OnPress
_icon_paint_backOnPress:
;mikromedia_STM32plus_events_code.c,541 :: 		void icon_paint_backOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,542 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,543 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,544 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,545 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,546 :: 		Example_state = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,547 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,548 :: 		}
L_end_icon_paint_backOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _icon_paint_backOnPress
_pause_iconOnPress:
;mikromedia_STM32plus_events_code.c,550 :: 		void pause_iconOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,551 :: 		TFT_Set_Pen(ProgressBar.Color, 1);
MOVW	R0, #lo_addr(_ProgressBar+28)
MOVT	R0, #hi_addr(_ProgressBar+28)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,552 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;mikromedia_STM32plus_events_code.c,553 :: 		TFT_Rectangle(pause_icon.Left - 2, 220, pause_icon.Left + pause_icon.Width + 2, 243);
MOVW	R0, #lo_addr(_pause_icon+10)
MOVT	R0, #hi_addr(_pause_icon+10)
LDRH	R1, [R0, #0]
MOVW	R2, #lo_addr(_pause_icon+6)
MOVT	R2, #hi_addr(_pause_icon+6)
LDRH	R0, [R2, #0]
ADDS	R0, R0, R1
UXTH	R0, R0
ADDS	R1, R0, #2
MOV	R0, R2
LDRH	R0, [R0, #0]
SUBS	R0, R0, #2
MOVS	R3, #243
SXTH	R3, R3
SXTH	R2, R1
MOVS	R1, #220
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Rectangle+0
;mikromedia_STM32plus_events_code.c,554 :: 		MP3_Example_State = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_MP3_Example_State+0)
MOVT	R0, #hi_addr(_MP3_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,555 :: 		pause_icon.Active = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_pause_icon+21)
MOVT	R0, #hi_addr(_pause_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,556 :: 		Play_icon.Active = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Play_icon+21)
MOVT	R0, #hi_addr(_Play_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,557 :: 		DrawImage(&play_icon);
MOVW	R0, #lo_addr(_Play_icon+0)
MOVT	R0, #hi_addr(_Play_icon+0)
BL	_DrawImage+0
;mikromedia_STM32plus_events_code.c,558 :: 		TFT_Set_Pen(MP3_Player.Color, 1);
MOVW	R0, #lo_addr(_MP3_Player+0)
MOVT	R0, #hi_addr(_MP3_Player+0)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,559 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;mikromedia_STM32plus_events_code.c,560 :: 		TFT_Rectangle(pause_icon.Left - 2, 220, pause_icon.Left + pause_icon.Width + 2, 243);
MOVW	R0, #lo_addr(_pause_icon+10)
MOVT	R0, #hi_addr(_pause_icon+10)
LDRH	R1, [R0, #0]
MOVW	R2, #lo_addr(_pause_icon+6)
MOVT	R2, #hi_addr(_pause_icon+6)
LDRH	R0, [R2, #0]
ADDS	R0, R0, R1
UXTH	R0, R0
ADDS	R1, R0, #2
MOV	R0, R2
LDRH	R0, [R0, #0]
SUBS	R0, R0, #2
MOVS	R3, #243
SXTH	R3, R3
SXTH	R2, R1
MOVS	R1, #220
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Rectangle+0
;mikromedia_STM32plus_events_code.c,561 :: 		}
L_end_pause_iconOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _pause_iconOnPress
_songlist_iconOnPress:
;mikromedia_STM32plus_events_code.c,563 :: 		void songlist_iconOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,564 :: 		TFT_Set_Pen(ProgressBar.Color, 1);
MOVW	R0, #lo_addr(_ProgressBar+28)
MOVT	R0, #hi_addr(_ProgressBar+28)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,565 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;mikromedia_STM32plus_events_code.c,566 :: 		TFT_Rectangle(songlist_icon.Left - 2, 220, songlist_icon.Left + songlist_icon.Width + 2, 243);
MOVW	R0, #lo_addr(_songlist_icon+10)
MOVT	R0, #hi_addr(_songlist_icon+10)
LDRH	R1, [R0, #0]
MOVW	R2, #lo_addr(_songlist_icon+6)
MOVT	R2, #hi_addr(_songlist_icon+6)
LDRH	R0, [R2, #0]
ADDS	R0, R0, R1
UXTH	R0, R0
ADDS	R1, R0, #2
MOV	R0, R2
LDRH	R0, [R0, #0]
SUBS	R0, R0, #2
MOVS	R3, #243
SXTH	R3, R3
SXTH	R2, R1
MOVS	R1, #220
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Rectangle+0
;mikromedia_STM32plus_events_code.c,567 :: 		StopMP3_File();
BL	_StopMP3_File+0
;mikromedia_STM32plus_events_code.c,569 :: 		Example_state = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,570 :: 		MP3_Example_State = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_MP3_Example_State+0)
MOVT	R0, #hi_addr(_MP3_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,571 :: 		TFT_Set_Pen(MP3_Player.Color, 1);
MOVW	R0, #lo_addr(_MP3_Player+0)
MOVT	R0, #hi_addr(_MP3_Player+0)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,572 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;mikromedia_STM32plus_events_code.c,573 :: 		TFT_Rectangle(songlist_icon.Left - 2, 220, songlist_icon.Left + songlist_icon.Width + 2, 243);
MOVW	R0, #lo_addr(_songlist_icon+10)
MOVT	R0, #hi_addr(_songlist_icon+10)
LDRH	R1, [R0, #0]
MOVW	R2, #lo_addr(_songlist_icon+6)
MOVT	R2, #hi_addr(_songlist_icon+6)
LDRH	R0, [R2, #0]
ADDS	R0, R0, R1
UXTH	R0, R0
ADDS	R1, R0, #2
MOV	R0, R2
LDRH	R0, [R0, #0]
SUBS	R0, R0, #2
MOVS	R3, #243
SXTH	R3, R3
SXTH	R2, R1
MOVS	R1, #220
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Rectangle+0
;mikromedia_STM32plus_events_code.c,574 :: 		}
L_end_songlist_iconOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _songlist_iconOnPress
_stop_iconOnDown:
;mikromedia_STM32plus_events_code.c,576 :: 		void stop_iconOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,577 :: 		TFT_Set_Pen(ProgressBar.Color, 1);
MOVW	R0, #lo_addr(_ProgressBar+28)
MOVT	R0, #hi_addr(_ProgressBar+28)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,578 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;mikromedia_STM32plus_events_code.c,579 :: 		TFT_Rectangle(stop_icon.Left - 2, 220, stop_icon.Left + stop_icon.Width + 2, 243);
MOVW	R0, #lo_addr(_stop_icon+10)
MOVT	R0, #hi_addr(_stop_icon+10)
LDRH	R1, [R0, #0]
MOVW	R2, #lo_addr(_stop_icon+6)
MOVT	R2, #hi_addr(_stop_icon+6)
LDRH	R0, [R2, #0]
ADDS	R0, R0, R1
UXTH	R0, R0
ADDS	R1, R0, #2
MOV	R0, R2
LDRH	R0, [R0, #0]
SUBS	R0, R0, #2
MOVS	R3, #243
SXTH	R3, R3
SXTH	R2, R1
MOVS	R1, #220
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Rectangle+0
;mikromedia_STM32plus_events_code.c,580 :: 		StopMP3_File();
BL	_StopMP3_File+0
;mikromedia_STM32plus_events_code.c,581 :: 		MP3_Example_State = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_MP3_Example_State+0)
MOVT	R0, #hi_addr(_MP3_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,582 :: 		pause_icon.Active = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_pause_icon+21)
MOVT	R0, #hi_addr(_pause_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,583 :: 		Play_icon.Active = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Play_icon+21)
MOVT	R0, #hi_addr(_Play_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,584 :: 		DrawImage(&stop_icon);
MOVW	R0, #lo_addr(_stop_icon+0)
MOVT	R0, #hi_addr(_stop_icon+0)
BL	_DrawImage+0
;mikromedia_STM32plus_events_code.c,585 :: 		DrawImage(&play_icon);
MOVW	R0, #lo_addr(_Play_icon+0)
MOVT	R0, #hi_addr(_Play_icon+0)
BL	_DrawImage+0
;mikromedia_STM32plus_events_code.c,586 :: 		TFT_Set_Pen(MP3_Player.Color, 1);
MOVW	R0, #lo_addr(_MP3_Player+0)
MOVT	R0, #hi_addr(_MP3_Player+0)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,587 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;mikromedia_STM32plus_events_code.c,588 :: 		TFT_Rectangle(stop_icon.Left - 2, 220, stop_icon.Left + stop_icon.Width + 2, 243);
MOVW	R0, #lo_addr(_stop_icon+10)
MOVT	R0, #hi_addr(_stop_icon+10)
LDRH	R1, [R0, #0]
MOVW	R2, #lo_addr(_stop_icon+6)
MOVT	R2, #hi_addr(_stop_icon+6)
LDRH	R0, [R2, #0]
ADDS	R0, R0, R1
UXTH	R0, R0
ADDS	R1, R0, #2
MOV	R0, R2
LDRH	R0, [R0, #0]
SUBS	R0, R0, #2
MOVS	R3, #243
SXTH	R3, R3
SXTH	R2, R1
MOVS	R1, #220
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Rectangle+0
;mikromedia_STM32plus_events_code.c,589 :: 		}
L_end_stop_iconOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _stop_iconOnDown
_next_iconOnDown:
;mikromedia_STM32plus_events_code.c,591 :: 		void next_iconOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,592 :: 		TFT_Set_Pen(ProgressBar.Color, 1);
MOVW	R0, #lo_addr(_ProgressBar+28)
MOVT	R0, #hi_addr(_ProgressBar+28)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,593 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;mikromedia_STM32plus_events_code.c,594 :: 		TFT_Rectangle(next_icon.Left - 2, 220, next_icon.Left + next_icon.Width + 2, 243);
MOVW	R0, #lo_addr(_next_icon+10)
MOVT	R0, #hi_addr(_next_icon+10)
LDRH	R1, [R0, #0]
MOVW	R2, #lo_addr(_next_icon+6)
MOVT	R2, #hi_addr(_next_icon+6)
LDRH	R0, [R2, #0]
ADDS	R0, R0, R1
UXTH	R0, R0
ADDS	R1, R0, #2
MOV	R0, R2
LDRH	R0, [R0, #0]
SUBS	R0, R0, #2
MOVS	R3, #243
SXTH	R3, R3
SXTH	R2, R1
MOVS	R1, #220
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Rectangle+0
;mikromedia_STM32plus_events_code.c,595 :: 		GetNext_mp3_File(1);
MOVS	R0, #1
BL	_GetNext_mp3_File+0
;mikromedia_STM32plus_events_code.c,596 :: 		DrawImage(&next_icon);
MOVW	R0, #lo_addr(_next_icon+0)
MOVT	R0, #hi_addr(_next_icon+0)
BL	_DrawImage+0
;mikromedia_STM32plus_events_code.c,597 :: 		pause_icon.Active = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pause_icon+21)
MOVT	R0, #hi_addr(_pause_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,598 :: 		Play_icon.Active = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Play_icon+21)
MOVT	R0, #hi_addr(_Play_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,599 :: 		DrawImage(&pause_icon);
MOVW	R0, #lo_addr(_pause_icon+0)
MOVT	R0, #hi_addr(_pause_icon+0)
BL	_DrawImage+0
;mikromedia_STM32plus_events_code.c,600 :: 		TFT_Set_Pen(MP3_Player.Color, 1);
MOVW	R0, #lo_addr(_MP3_Player+0)
MOVT	R0, #hi_addr(_MP3_Player+0)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,601 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;mikromedia_STM32plus_events_code.c,602 :: 		TFT_Rectangle(next_icon.Left - 2, 220, next_icon.Left + next_icon.Width + 2, 243);
MOVW	R0, #lo_addr(_next_icon+10)
MOVT	R0, #hi_addr(_next_icon+10)
LDRH	R1, [R0, #0]
MOVW	R2, #lo_addr(_next_icon+6)
MOVT	R2, #hi_addr(_next_icon+6)
LDRH	R0, [R2, #0]
ADDS	R0, R0, R1
UXTH	R0, R0
ADDS	R1, R0, #2
MOV	R0, R2
LDRH	R0, [R0, #0]
SUBS	R0, R0, #2
MOVS	R3, #243
SXTH	R3, R3
SXTH	R2, R1
MOVS	R1, #220
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Rectangle+0
;mikromedia_STM32plus_events_code.c,603 :: 		}
L_end_next_iconOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _next_iconOnDown
_previous_iconOnDown:
;mikromedia_STM32plus_events_code.c,605 :: 		void previous_iconOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,606 :: 		TFT_Set_Pen(ProgressBar.Color, 1);
MOVW	R0, #lo_addr(_ProgressBar+28)
MOVT	R0, #hi_addr(_ProgressBar+28)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,607 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;mikromedia_STM32plus_events_code.c,608 :: 		TFT_Rectangle(previous_icon.Left - 2, 220, previous_icon.Left + previous_icon.Width + 2, 243);
MOVW	R0, #lo_addr(_previous_icon+10)
MOVT	R0, #hi_addr(_previous_icon+10)
LDRH	R1, [R0, #0]
MOVW	R2, #lo_addr(_previous_icon+6)
MOVT	R2, #hi_addr(_previous_icon+6)
LDRH	R0, [R2, #0]
ADDS	R0, R0, R1
UXTH	R0, R0
ADDS	R1, R0, #2
MOV	R0, R2
LDRH	R0, [R0, #0]
SUBS	R0, R0, #2
MOVS	R3, #243
SXTH	R3, R3
SXTH	R2, R1
MOVS	R1, #220
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Rectangle+0
;mikromedia_STM32plus_events_code.c,609 :: 		GetNext_mp3_File(0);
MOVS	R0, #0
BL	_GetNext_mp3_File+0
;mikromedia_STM32plus_events_code.c,610 :: 		DrawImage(&previous_icon);
MOVW	R0, #lo_addr(_previous_icon+0)
MOVT	R0, #hi_addr(_previous_icon+0)
BL	_DrawImage+0
;mikromedia_STM32plus_events_code.c,611 :: 		pause_icon.Active = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pause_icon+21)
MOVT	R0, #hi_addr(_pause_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,612 :: 		Play_icon.Active = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Play_icon+21)
MOVT	R0, #hi_addr(_Play_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,613 :: 		DrawImage(&pause_icon);
MOVW	R0, #lo_addr(_pause_icon+0)
MOVT	R0, #hi_addr(_pause_icon+0)
BL	_DrawImage+0
;mikromedia_STM32plus_events_code.c,614 :: 		TFT_Set_Pen(MP3_Player.Color, 1);
MOVW	R0, #lo_addr(_MP3_Player+0)
MOVT	R0, #hi_addr(_MP3_Player+0)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,615 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;mikromedia_STM32plus_events_code.c,616 :: 		TFT_Rectangle(previous_icon.Left - 2, 220, previous_icon.Left + previous_icon.Width + 2, 243);
MOVW	R0, #lo_addr(_previous_icon+10)
MOVT	R0, #hi_addr(_previous_icon+10)
LDRH	R1, [R0, #0]
MOVW	R2, #lo_addr(_previous_icon+6)
MOVT	R2, #hi_addr(_previous_icon+6)
LDRH	R0, [R2, #0]
ADDS	R0, R0, R1
UXTH	R0, R0
ADDS	R1, R0, #2
MOV	R0, R2
LDRH	R0, [R0, #0]
SUBS	R0, R0, #2
MOVS	R3, #243
SXTH	R3, R3
SXTH	R2, R1
MOVS	R1, #220
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Rectangle+0
;mikromedia_STM32plus_events_code.c,617 :: 		}
L_end_previous_iconOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _previous_iconOnDown
_VolmeBarOnPress:
;mikromedia_STM32plus_events_code.c,619 :: 		void VolmeBarOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,622 :: 		temp = Xcoord - VolmeBar.Left;
MOVW	R0, #lo_addr(_VolmeBar+6)
MOVT	R0, #hi_addr(_VolmeBar+6)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
SUB	R1, R0, R1
UXTH	R1, R1
;mikromedia_STM32plus_events_code.c,623 :: 		temp = temp * 100;
MOVS	R0, #100
MULS	R1, R0, R1
UXTH	R1, R1
;mikromedia_STM32plus_events_code.c,624 :: 		level = temp / VolmeBar.Width;
MOVW	R0, #lo_addr(_VolmeBar+10)
MOVT	R0, #hi_addr(_VolmeBar+10)
LDRH	R0, [R0, #0]
UDIV	R1, R1, R0
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,625 :: 		MP3_Set_Volume(100 - level, 100 - level);
UXTB	R0, R1
RSB	R0, R0, #100
UXTB	R1, R0
UXTB	R0, R0
BL	_MP3_Set_Volume+0
;mikromedia_STM32plus_events_code.c,627 :: 		UpdateVolumeBar(level, old_level);
MOVW	R0, #lo_addr(_old_level+0)
MOVT	R0, #hi_addr(_old_level+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRB	R0, [R0, #0]
BL	_UpdateVolumeBar+0
;mikromedia_STM32plus_events_code.c,628 :: 		old_level = level;
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_old_level+0)
MOVT	R0, #hi_addr(_old_level+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,629 :: 		}
L_end_VolmeBarOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _VolmeBarOnPress
_ProgreesBarOnPress:
;mikromedia_STM32plus_events_code.c,631 :: 		void ProgreesBarOnPress() {
;mikromedia_STM32plus_events_code.c,633 :: 		}
L_end_ProgreesBarOnPress:
BX	LR
; end of _ProgreesBarOnPress
_Play_iconOnDown:
;mikromedia_STM32plus_events_code.c,635 :: 		void Play_iconOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,636 :: 		TFT_Set_Pen(ProgressBar.Color, 1);
MOVW	R0, #lo_addr(_ProgressBar+28)
MOVT	R0, #hi_addr(_ProgressBar+28)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,637 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;mikromedia_STM32plus_events_code.c,638 :: 		TFT_Rectangle(Play_icon.Left - 2, 220, Play_icon.Left + Play_icon.Width + 2, 243);
MOVW	R0, #lo_addr(_Play_icon+10)
MOVT	R0, #hi_addr(_Play_icon+10)
LDRH	R1, [R0, #0]
MOVW	R2, #lo_addr(_Play_icon+6)
MOVT	R2, #hi_addr(_Play_icon+6)
LDRH	R0, [R2, #0]
ADDS	R0, R0, R1
UXTH	R0, R0
ADDS	R1, R0, #2
MOV	R0, R2
LDRH	R0, [R0, #0]
SUBS	R0, R0, #2
MOVS	R3, #243
SXTH	R3, R3
SXTH	R2, R1
MOVS	R1, #220
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Rectangle+0
;mikromedia_STM32plus_events_code.c,639 :: 		pause_icon.Active = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pause_icon+21)
MOVT	R0, #hi_addr(_pause_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,640 :: 		Play_icon.Active = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Play_icon+21)
MOVT	R0, #hi_addr(_Play_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,641 :: 		if (MP3_Example_State == 1)
MOVW	R0, #lo_addr(_MP3_Example_State+0)
MOVT	R0, #hi_addr(_MP3_Example_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Play_iconOnDown34
;mikromedia_STM32plus_events_code.c,642 :: 		MP3_play(Label28_Caption, current_file);
MOVW	R0, #lo_addr(_current_file+0)
MOVT	R0, #hi_addr(_current_file+0)
LDRSB	R0, [R0, #0]
UXTB	R1, R0
MOVW	R0, #lo_addr(_Label28_Caption+0)
MOVT	R0, #hi_addr(_Label28_Caption+0)
BL	_MP3_play+0
L_Play_iconOnDown34:
;mikromedia_STM32plus_events_code.c,643 :: 		MP3_Example_State = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_MP3_Example_State+0)
MOVT	R0, #hi_addr(_MP3_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,644 :: 		DrawImage(&pause_icon);
MOVW	R0, #lo_addr(_pause_icon+0)
MOVT	R0, #hi_addr(_pause_icon+0)
BL	_DrawImage+0
;mikromedia_STM32plus_events_code.c,645 :: 		TFT_Set_Pen(MP3_Player.Color, 1);
MOVW	R0, #lo_addr(_MP3_Player+0)
MOVT	R0, #hi_addr(_MP3_Player+0)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,646 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;mikromedia_STM32plus_events_code.c,647 :: 		TFT_Rectangle(Play_icon.Left - 2, 220, Play_icon.Left + Play_icon.Width + 2, 243);
MOVW	R0, #lo_addr(_Play_icon+10)
MOVT	R0, #hi_addr(_Play_icon+10)
LDRH	R1, [R0, #0]
MOVW	R2, #lo_addr(_Play_icon+6)
MOVT	R2, #hi_addr(_Play_icon+6)
LDRH	R0, [R2, #0]
ADDS	R0, R0, R1
UXTH	R0, R0
ADDS	R1, R0, #2
MOV	R0, R2
LDRH	R0, [R0, #0]
SUBS	R0, R0, #2
MOVS	R3, #243
SXTH	R3, R3
SXTH	R2, R1
MOVS	R1, #220
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Rectangle+0
;mikromedia_STM32plus_events_code.c,648 :: 		}
L_end_Play_iconOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Play_iconOnDown
_Icon_next_boxOnPress:
;mikromedia_STM32plus_events_code.c,650 :: 		void Icon_next_boxOnPress() {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,656 :: 		for (i = 0; i < 209; i ++)
; i start address is: 4 (R1)
MOVS	R1, #0
; i end address is: 4 (R1)
L_Icon_next_boxOnPress35:
; i start address is: 4 (R1)
CMP	R1, #209
IT	CS
BCS	L_Icon_next_boxOnPress36
;mikromedia_STM32plus_events_code.c,657 :: 		ScrollImageDown(1);
STRB	R1, [SP, #4]
MOVS	R0, #1
SXTH	R0, R0
BL	_ScrollImageDown+0
LDRB	R1, [SP, #4]
;mikromedia_STM32plus_events_code.c,656 :: 		for (i = 0; i < 209; i ++)
ADDS	R1, R1, #1
UXTB	R1, R1
;mikromedia_STM32plus_events_code.c,657 :: 		ScrollImageDown(1);
; i end address is: 4 (R1)
IT	AL
BAL	L_Icon_next_boxOnPress35
L_Icon_next_boxOnPress36:
;mikromedia_STM32plus_events_code.c,658 :: 		}
L_end_Icon_next_boxOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Icon_next_boxOnPress
_icon_previous_boxOnPress:
;mikromedia_STM32plus_events_code.c,660 :: 		void icon_previous_boxOnPress() {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,666 :: 		for (i = 0; i < 209; i ++)
; i start address is: 4 (R1)
MOVS	R1, #0
; i end address is: 4 (R1)
L_icon_previous_boxOnPress38:
; i start address is: 4 (R1)
CMP	R1, #209
IT	CS
BCS	L_icon_previous_boxOnPress39
;mikromedia_STM32plus_events_code.c,667 :: 		ScrollImageUp(1);
STRB	R1, [SP, #4]
MOVS	R0, #1
SXTH	R0, R0
BL	_ScrollImageUp+0
LDRB	R1, [SP, #4]
;mikromedia_STM32plus_events_code.c,666 :: 		for (i = 0; i < 209; i ++)
ADDS	R1, R1, #1
UXTB	R1, R1
;mikromedia_STM32plus_events_code.c,667 :: 		ScrollImageUp(1);
; i end address is: 4 (R1)
IT	AL
BAL	L_icon_previous_boxOnPress38
L_icon_previous_boxOnPress39:
;mikromedia_STM32plus_events_code.c,668 :: 		}
L_end_icon_previous_boxOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _icon_previous_boxOnPress
_Image18OnClick:
;mikromedia_STM32plus_events_code.c,670 :: 		void Image18OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,671 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,672 :: 		DrawScreen(&SlideShow);
MOVW	R0, #lo_addr(_SlideShow+0)
MOVT	R0, #hi_addr(_SlideShow+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,673 :: 		Start_Slide_Show();
BL	_Start_Slide_Show+0
;mikromedia_STM32plus_events_code.c,674 :: 		Example_state = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,675 :: 		ByteToStr(Slide_Index + 1, Label35_caption);
MOVW	R0, #lo_addr(_Slide_Index+0)
MOVT	R0, #hi_addr(_Slide_Index+0)
LDRSB	R0, [R0, #0]
ADDS	R0, R0, #1
MOVW	R1, #lo_addr(_Label35_Caption+0)
MOVT	R1, #hi_addr(_Label35_Caption+0)
UXTB	R0, R0
BL	_ByteToStr+0
;mikromedia_STM32plus_events_code.c,676 :: 		RedrawLabel(SlideShow.Color, &Label35, 20, 30);
MOVW	R0, #lo_addr(_SlideShow+0)
MOVT	R0, #hi_addr(_SlideShow+0)
LDRH	R0, [R0, #0]
MOVS	R3, #30
MOVS	R2, #20
MOVW	R1, #lo_addr(_Label35+0)
MOVT	R1, #hi_addr(_Label35+0)
BL	_RedrawLabel+0
;mikromedia_STM32plus_events_code.c,677 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,678 :: 		}
L_end_Image18OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image18OnClick
_Box7OnDown:
;mikromedia_STM32plus_events_code.c,680 :: 		void Box7OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,681 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,682 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,683 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,684 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,685 :: 		Example_state = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,686 :: 		Stop_Scroll();
BL	_Stop_Scroll+0
;mikromedia_STM32plus_events_code.c,687 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,688 :: 		}
L_end_Box7OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box7OnDown
_RGB_Active_areaOnPress:
;mikromedia_STM32plus_events_code.c,690 :: 		void RGB_Active_areaOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,691 :: 		PickColor();
BL	_PickColor+0
;mikromedia_STM32plus_events_code.c,692 :: 		}
L_end_RGB_Active_areaOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RGB_Active_areaOnPress
_Box9OnPress:
;mikromedia_STM32plus_events_code.c,694 :: 		void Box9OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,695 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,696 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,697 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,698 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,699 :: 		Example_state = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,700 :: 		NVIC_IntDisable(IVT_INT_TIM5);
MOVW	R0, #66
BL	_NVIC_IntDisable+0
;mikromedia_STM32plus_events_code.c,701 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,702 :: 		LED_R = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(LED_R+0)
MOVT	R0, #hi_addr(LED_R+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,703 :: 		LED_B = 0;
MOVW	R0, #lo_addr(LED_B+0)
MOVT	R0, #hi_addr(LED_B+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,704 :: 		LED_G = 0;
MOVW	R0, #lo_addr(LED_G+0)
MOVT	R0, #hi_addr(LED_G+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,705 :: 		}
L_end_Box9OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box9OnPress
_Box11OnPress:
;mikromedia_STM32plus_events_code.c,707 :: 		void Box11OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,708 :: 		XO_Reset();
BL	_XO_Reset+0
;mikromedia_STM32plus_events_code.c,709 :: 		}
L_end_Box11OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box11OnPress
_Button1OnClick:
;mikromedia_STM32plus_events_code.c,711 :: 		void Button1OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,712 :: 		ButtonClick(ButtonArray[0], 0);
MOVW	R0, #lo_addr(_ButtonArray+0)
MOVT	R0, #hi_addr(_ButtonArray+0)
LDR	R0, [R0, #0]
MOVS	R1, #0
BL	_ButtonClick+0
;mikromedia_STM32plus_events_code.c,713 :: 		}
L_end_Button1OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button1OnClick
_Button2OnClick:
;mikromedia_STM32plus_events_code.c,715 :: 		void Button2OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,716 :: 		ButtonClick(ButtonArray[1], 1);
MOVW	R0, #lo_addr(_ButtonArray+4)
MOVT	R0, #hi_addr(_ButtonArray+4)
LDR	R0, [R0, #0]
MOVS	R1, #1
BL	_ButtonClick+0
;mikromedia_STM32plus_events_code.c,717 :: 		}
L_end_Button2OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button2OnClick
_Button3OnClick:
;mikromedia_STM32plus_events_code.c,719 :: 		void Button3OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,720 :: 		ButtonClick(ButtonArray[2], 2);
MOVW	R0, #lo_addr(_ButtonArray+8)
MOVT	R0, #hi_addr(_ButtonArray+8)
LDR	R0, [R0, #0]
MOVS	R1, #2
BL	_ButtonClick+0
;mikromedia_STM32plus_events_code.c,721 :: 		}
L_end_Button3OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button3OnClick
_Button4OnClick:
;mikromedia_STM32plus_events_code.c,723 :: 		void Button4OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,724 :: 		ButtonClick(ButtonArray[3], 3);
MOVW	R0, #lo_addr(_ButtonArray+12)
MOVT	R0, #hi_addr(_ButtonArray+12)
LDR	R0, [R0, #0]
MOVS	R1, #3
BL	_ButtonClick+0
;mikromedia_STM32plus_events_code.c,725 :: 		}
L_end_Button4OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button4OnClick
_Button5OnClick:
;mikromedia_STM32plus_events_code.c,727 :: 		void Button5OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,728 :: 		ButtonClick(ButtonArray[4], 4);
MOVW	R0, #lo_addr(_ButtonArray+16)
MOVT	R0, #hi_addr(_ButtonArray+16)
LDR	R0, [R0, #0]
MOVS	R1, #4
BL	_ButtonClick+0
;mikromedia_STM32plus_events_code.c,729 :: 		}
L_end_Button5OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button5OnClick
_Button6OnClick:
;mikromedia_STM32plus_events_code.c,731 :: 		void Button6OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,732 :: 		ButtonClick(ButtonArray[5], 5);
MOVW	R0, #lo_addr(_ButtonArray+20)
MOVT	R0, #hi_addr(_ButtonArray+20)
LDR	R0, [R0, #0]
MOVS	R1, #5
BL	_ButtonClick+0
;mikromedia_STM32plus_events_code.c,733 :: 		}
L_end_Button6OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button6OnClick
_Button7OnClick:
;mikromedia_STM32plus_events_code.c,735 :: 		void Button7OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,736 :: 		ButtonClick(ButtonArray[6], 6);
MOVW	R0, #lo_addr(_ButtonArray+24)
MOVT	R0, #hi_addr(_ButtonArray+24)
LDR	R0, [R0, #0]
MOVS	R1, #6
BL	_ButtonClick+0
;mikromedia_STM32plus_events_code.c,737 :: 		}
L_end_Button7OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button7OnClick
_Button8OnClick:
;mikromedia_STM32plus_events_code.c,739 :: 		void Button8OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,740 :: 		ButtonClick(ButtonArray[7], 7);
MOVW	R0, #lo_addr(_ButtonArray+28)
MOVT	R0, #hi_addr(_ButtonArray+28)
LDR	R0, [R0, #0]
MOVS	R1, #7
BL	_ButtonClick+0
;mikromedia_STM32plus_events_code.c,741 :: 		}
L_end_Button8OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button8OnClick
_Button9OnClick:
;mikromedia_STM32plus_events_code.c,743 :: 		void Button9OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,744 :: 		ButtonClick(ButtonArray[8], 8);
MOVW	R0, #lo_addr(_ButtonArray+32)
MOVT	R0, #hi_addr(_ButtonArray+32)
LDR	R0, [R0, #0]
MOVS	R1, #8
BL	_ButtonClick+0
;mikromedia_STM32plus_events_code.c,745 :: 		}
L_end_Button9OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button9OnClick
_Image22OnClick:
;mikromedia_STM32plus_events_code.c,747 :: 		void Image22OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,748 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,749 :: 		DrawScreen(&Tic_Tac_Toe);
MOVW	R0, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R0, #hi_addr(_Tic_Tac_Toe+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,750 :: 		Example_state = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,752 :: 		GPIO_Digital_Output(&GPIOG_BASE, _GPIO_PINMASK_15);
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOG_BASE+0)
MOVT	R0, #hi_addr(GPIOG_BASE+0)
BL	_GPIO_Digital_Output+0
;mikromedia_STM32plus_events_code.c,753 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4);
MOVS	R1, #24
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;mikromedia_STM32plus_events_code.c,754 :: 		Init_FAT();
BL	_Init_FAT+0
;mikromedia_STM32plus_events_code.c,755 :: 		XO_Reset();
BL	_XO_Reset+0
;mikromedia_STM32plus_events_code.c,756 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,757 :: 		}
L_end_Image22OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image22OnClick
_Box12OnPress:
;mikromedia_STM32plus_events_code.c,759 :: 		void Box12OnPress() {
;mikromedia_STM32plus_events_code.c,761 :: 		}
L_end_Box12OnPress:
BX	LR
; end of _Box12OnPress
_Slide_Active_areaOnPress:
;mikromedia_STM32plus_events_code.c,763 :: 		void Slide_Active_areaOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,764 :: 		Slide_scroll();
BL	_Slide_scroll+0
;mikromedia_STM32plus_events_code.c,765 :: 		}
L_end_Slide_Active_areaOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Slide_Active_areaOnPress
_CheckBox1OnClick:
;mikromedia_STM32plus_events_code.c,767 :: 		void CheckBox1OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,768 :: 		Start_nRF();
BL	_Start_nRF+0
;mikromedia_STM32plus_events_code.c,769 :: 		}
L_end_CheckBox1OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _CheckBox1OnClick
_Box10OnClick:
;mikromedia_STM32plus_events_code.c,771 :: 		void Box10OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,772 :: 		if (CheckBox1.Checked == 0)
MOVW	R0, #lo_addr(_CheckBox1+20)
MOVT	R0, #hi_addr(_CheckBox1+20)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Box10OnClick41
;mikromedia_STM32plus_events_code.c,773 :: 		CheckBox1.Checked = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CheckBox1+20)
MOVT	R0, #hi_addr(_CheckBox1+20)
STRB	R1, [R0, #0]
IT	AL
BAL	L_Box10OnClick42
L_Box10OnClick41:
;mikromedia_STM32plus_events_code.c,775 :: 		CheckBox1.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CheckBox1+20)
MOVT	R0, #hi_addr(_CheckBox1+20)
STRB	R1, [R0, #0]
L_Box10OnClick42:
;mikromedia_STM32plus_events_code.c,776 :: 		DrawCheckBox(&CheckBox1);
MOVW	R0, #lo_addr(_CheckBox1+0)
MOVT	R0, #hi_addr(_CheckBox1+0)
BL	_DrawCheckBox+0
;mikromedia_STM32plus_events_code.c,777 :: 		Start_nRF();
BL	_Start_nRF+0
;mikromedia_STM32plus_events_code.c,778 :: 		}
L_end_Box10OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box10OnClick
_Box12OnClick:
;mikromedia_STM32plus_events_code.c,781 :: 		void Box12OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,782 :: 		Deactivate_All_Rollers();
BL	_Deactivate_All_Rollers+0
;mikromedia_STM32plus_events_code.c,783 :: 		Start_Ethernet();
BL	_Start_Ethernet+0
;mikromedia_STM32plus_events_code.c,784 :: 		}
L_end_Box12OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box12OnClick
_Box13OnClick:
;mikromedia_STM32plus_events_code.c,786 :: 		void Box13OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,787 :: 		Deactivate_All_Rollers();
BL	_Deactivate_All_Rollers+0
;mikromedia_STM32plus_events_code.c,788 :: 		}
L_end_Box13OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box13OnClick
_Box14OnPress:
;mikromedia_STM32plus_events_code.c,790 :: 		void Box14OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,791 :: 		AmPmRun();
BL	_AmPmRun+0
;mikromedia_STM32plus_events_code.c,792 :: 		}
L_end_Box14OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box14OnPress
