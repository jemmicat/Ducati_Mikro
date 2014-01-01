_Run_Example:
;mikromedia_STM32plus_events_code.c,104 :: 		void Run_Example(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,105 :: 		switch (Example_State) {
IT	AL
BAL	L_Run_Example0
;mikromedia_STM32plus_events_code.c,106 :: 		case 0 : {
L_Run_Example2:
;mikromedia_STM32plus_events_code.c,107 :: 		checkRTC();            // Home screen
BL	_checkRTC+0
;mikromedia_STM32plus_events_code.c,108 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,109 :: 		}; break;
IT	AL
BAL	L_Run_Example1
;mikromedia_STM32plus_events_code.c,110 :: 		case 1 : {
L_Run_Example3:
;mikromedia_STM32plus_events_code.c,111 :: 		doAccel();             // Accel Screen
BL	_doAccel+0
;mikromedia_STM32plus_events_code.c,112 :: 		}; break;
IT	AL
BAL	L_Run_Example1
;mikromedia_STM32plus_events_code.c,113 :: 		case 2 : {                       // RTCC screen
L_Run_Example4:
;mikromedia_STM32plus_events_code.c,114 :: 		if (PenDown == 0)
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Run_Example5
;mikromedia_STM32plus_events_code.c,115 :: 		doRTC_Example();
BL	_doRTC_Example+0
L_Run_Example5:
;mikromedia_STM32plus_events_code.c,116 :: 		}; break;
IT	AL
BAL	L_Run_Example1
;mikromedia_STM32plus_events_code.c,117 :: 		case 3 : break;                  // RGB screen
L_Run_Example6:
IT	AL
BAL	L_Run_Example1
;mikromedia_STM32plus_events_code.c,118 :: 		case 4 : {
L_Run_Example7:
;mikromedia_STM32plus_events_code.c,119 :: 		Sensors_Read();        // Sensors screen
BL	_Sensors_Read+0
;mikromedia_STM32plus_events_code.c,120 :: 		}; break;
IT	AL
BAL	L_Run_Example1
;mikromedia_STM32plus_events_code.c,121 :: 		case 5 : {
L_Run_Example8:
;mikromedia_STM32plus_events_code.c,122 :: 		doMp3();               // MP3
BL	_doMP3+0
;mikromedia_STM32plus_events_code.c,123 :: 		}; break;
IT	AL
BAL	L_Run_Example1
;mikromedia_STM32plus_events_code.c,124 :: 		case 6 : break;
L_Run_Example9:
IT	AL
BAL	L_Run_Example1
;mikromedia_STM32plus_events_code.c,125 :: 		case 7 : {                       // Slide Show
L_Run_Example10:
;mikromedia_STM32plus_events_code.c,126 :: 		doSlide();
BL	_doSlide+0
;mikromedia_STM32plus_events_code.c,127 :: 		}; break;
IT	AL
BAL	L_Run_Example1
;mikromedia_STM32plus_events_code.c,128 :: 		}
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
L_Run_Example1:
;mikromedia_STM32plus_events_code.c,129 :: 		}
L_end_Run_Example:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Run_Example
_BLED_Fade_Out:
;mikromedia_STM32plus_events_code.c,131 :: 		void BLED_Fade_Out(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,134 :: 		for ( i = 255; i > 0 ; i-- ){
; i start address is: 4 (R1)
MOVS	R1, #255
SXTH	R1, R1
; i end address is: 4 (R1)
L_BLED_Fade_Out11:
; i start address is: 4 (R1)
CMP	R1, #0
IT	LE
BLE	L_BLED_Fade_Out12
;mikromedia_STM32plus_events_code.c,135 :: 		TFT_Set_DBC_SSD1963(i);
STRH	R1, [SP, #4]
UXTB	R0, R1
BL	_TFT_Set_DBC_SSD1963+0
LDRSH	R1, [SP, #4]
;mikromedia_STM32plus_events_code.c,136 :: 		Delay_ms(1);
MOVW	R7, #49998
MOVT	R7, #0
NOP
NOP
L_BLED_Fade_Out14:
SUBS	R7, R7, #1
BNE	L_BLED_Fade_Out14
NOP
NOP
NOP
;mikromedia_STM32plus_events_code.c,134 :: 		for ( i = 255; i > 0 ; i-- ){
SUBS	R1, R1, #1
SXTH	R1, R1
;mikromedia_STM32plus_events_code.c,137 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_BLED_Fade_Out11
L_BLED_Fade_Out12:
;mikromedia_STM32plus_events_code.c,138 :: 		TFT_Set_DBC_SSD1963(0);
MOVS	R0, #0
BL	_TFT_Set_DBC_SSD1963+0
;mikromedia_STM32plus_events_code.c,139 :: 		}
L_end_BLED_Fade_Out:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _BLED_Fade_Out
_BLED_Fade_In:
;mikromedia_STM32plus_events_code.c,141 :: 		void BLED_Fade_In(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,144 :: 		for (i = 1; i < 255; i++){
; i start address is: 4 (R1)
MOVS	R1, #1
SXTH	R1, R1
; i end address is: 4 (R1)
L_BLED_Fade_In16:
; i start address is: 4 (R1)
CMP	R1, #255
IT	GE
BGE	L_BLED_Fade_In17
;mikromedia_STM32plus_events_code.c,145 :: 		TFT_Set_DBC_SSD1963(i);
STRH	R1, [SP, #4]
UXTB	R0, R1
BL	_TFT_Set_DBC_SSD1963+0
LDRSH	R1, [SP, #4]
;mikromedia_STM32plus_events_code.c,146 :: 		Delay_ms(1);
MOVW	R7, #49998
MOVT	R7, #0
NOP
NOP
L_BLED_Fade_In19:
SUBS	R7, R7, #1
BNE	L_BLED_Fade_In19
NOP
NOP
NOP
;mikromedia_STM32plus_events_code.c,144 :: 		for (i = 1; i < 255; i++){
ADDS	R1, R1, #1
SXTH	R1, R1
;mikromedia_STM32plus_events_code.c,147 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_BLED_Fade_In16
L_BLED_Fade_In17:
;mikromedia_STM32plus_events_code.c,148 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;mikromedia_STM32plus_events_code.c,149 :: 		}
L_end_BLED_Fade_In:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _BLED_Fade_In
_UpdateVolumeBar:
;mikromedia_STM32plus_events_code.c,152 :: 		void UpdateVolumeBar(char vol, char old_vol){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,155 :: 		xcoo = (vol*3)/4 + VolmeBar.Left;
MOVS	R2, #3
SXTH	R2, R2
MULS	R2, R0, R2
SXTH	R2, R2
ASRS	R3, R2, #2
SXTH	R3, R3
MOVW	R4, #lo_addr(_VolmeBar+6)
MOVT	R4, #hi_addr(_VolmeBar+6)
LDRH	R2, [R4, #0]
ADDS	R3, R3, R2
UXTH	R3, R3
STRH	R3, [SP, #4]
;mikromedia_STM32plus_events_code.c,157 :: 		if (xcoo < VolmeBar.Left)
MOV	R2, R4
LDRH	R2, [R2, #0]
CMP	R3, R2
IT	CS
BCS	L_UpdateVolumeBar21
;mikromedia_STM32plus_events_code.c,158 :: 		xcoo = VolmeBar.Left;
MOVW	R2, #lo_addr(_VolmeBar+6)
MOVT	R2, #hi_addr(_VolmeBar+6)
LDRH	R2, [R2, #0]
STRH	R2, [SP, #4]
L_UpdateVolumeBar21:
;mikromedia_STM32plus_events_code.c,160 :: 		if (xcoo > VolmeBar.Left + VolmeBar.Width)
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
BLS	L_UpdateVolumeBar22
;mikromedia_STM32plus_events_code.c,161 :: 		xcoo = VolmeBar.Left + VolmeBar.Width;
MOVW	R2, #lo_addr(_VolmeBar+10)
MOVT	R2, #hi_addr(_VolmeBar+10)
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(_VolmeBar+6)
MOVT	R2, #hi_addr(_VolmeBar+6)
LDRH	R2, [R2, #0]
ADDS	R2, R2, R3
STRH	R2, [SP, #4]
L_UpdateVolumeBar22:
;mikromedia_STM32plus_events_code.c,164 :: 		TFT_Set_Brush(1, 0x55FF, 0, 0, 0, 0);
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
;mikromedia_STM32plus_events_code.c,165 :: 		TFT_Set_Pen(0x55FF, 0);
MOVS	R1, #0
MOVW	R0, #22015
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,166 :: 		TFT_Rectangle(VolmeBar.Left, VolmeBar.Top, xcoo, VolmeBar.Top + VolmeBar.Height);
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
;mikromedia_STM32plus_events_code.c,169 :: 		TFT_Set_Brush(1, VolmeBar.Color, 0, 0, 0, 0);
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
;mikromedia_STM32plus_events_code.c,170 :: 		TFT_Set_Pen(VolmeBar.Color, 0);
MOVW	R2, #lo_addr(_VolmeBar+28)
MOVT	R2, #hi_addr(_VolmeBar+28)
LDRH	R2, [R2, #0]
MOVS	R1, #0
UXTH	R0, R2
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,171 :: 		TFT_Rectangle(xcoo + 1, VolmeBar.Top, VolmeBar.Left + VolmeBar.Width + 1, VolmeBar.Top + VolmeBar.Height);
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
;mikromedia_STM32plus_events_code.c,173 :: 		}
L_end_UpdateVolumeBar:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _UpdateVolumeBar
_Image2OnPress:
;mikromedia_STM32plus_events_code.c,179 :: 		void Image2OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,180 :: 		Example_State = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,181 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,182 :: 		Accel_Stop();
BL	_Accel_Stop+0
;mikromedia_STM32plus_events_code.c,183 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,184 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,185 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,186 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,187 :: 		}
L_end_Image2OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image2OnPress
_Image1OnPress:
;mikromedia_STM32plus_events_code.c,189 :: 		void Image1OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,190 :: 		Example_State = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,191 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,192 :: 		DrawScreen(&Accelerometer);
MOVW	R0, #lo_addr(_Accelerometer+0)
MOVT	R0, #hi_addr(_Accelerometer+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,193 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,194 :: 		ACCEL_Start(&cACCEL_test_status);
MOVW	R0, #lo_addr(_cACCEL_test_status+0)
MOVT	R0, #hi_addr(_cACCEL_test_status+0)
BL	_ACCEL_Start+0
;mikromedia_STM32plus_events_code.c,195 :: 		}
L_end_Image1OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image1OnPress
_Image3OnPress:
;mikromedia_STM32plus_events_code.c,197 :: 		void Image3OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,198 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,199 :: 		DrawScreen(&RGBLight);
MOVW	R0, #lo_addr(_RGBLight+0)
MOVT	R0, #hi_addr(_RGBLight+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,200 :: 		RGB_Init();
BL	_RGB_Init+0
;mikromedia_STM32plus_events_code.c,201 :: 		Example_State = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,202 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,204 :: 		}
L_end_Image3OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image3OnPress
_Image5OnPress:
;mikromedia_STM32plus_events_code.c,206 :: 		void Image5OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,207 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,208 :: 		RGB_OFF();
BL	_RGB_OFF+0
;mikromedia_STM32plus_events_code.c,209 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,210 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,211 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,212 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,213 :: 		Example_state = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,214 :: 		}
L_end_Image5OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image5OnPress
_Image4OnPress:
;mikromedia_STM32plus_events_code.c,216 :: 		void Image4OnPress() {
;mikromedia_STM32plus_events_code.c,218 :: 		}
L_end_Image4OnPress:
BX	LR
; end of _Image4OnPress
_Image6OnClick:
;mikromedia_STM32plus_events_code.c,220 :: 		void Image6OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,221 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,222 :: 		DrawScreen(&Clock);
MOVW	R0, #lo_addr(_Clock+0)
MOVT	R0, #hi_addr(_Clock+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,223 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,224 :: 		RTC_Example_init();
BL	_RTC_Example_init+0
;mikromedia_STM32plus_events_code.c,225 :: 		Example_State = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,226 :: 		}
L_end_Image6OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image6OnClick
_Box2OnPress:
;mikromedia_STM32plus_events_code.c,228 :: 		void Box2OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,229 :: 		HoursTens();
BL	_HoursTens+0
;mikromedia_STM32plus_events_code.c,230 :: 		}
L_end_Box2OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box2OnPress
_Box3OnPress:
;mikromedia_STM32plus_events_code.c,232 :: 		void Box3OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,233 :: 		HoursOnes();
BL	_HoursOnes+0
;mikromedia_STM32plus_events_code.c,234 :: 		}
L_end_Box3OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box3OnPress
_Box4OnPress:
;mikromedia_STM32plus_events_code.c,236 :: 		void Box4OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,237 :: 		MinutesTens();
BL	_MinutesTens+0
;mikromedia_STM32plus_events_code.c,238 :: 		}
L_end_Box4OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box4OnPress
_Box5OnPress:
;mikromedia_STM32plus_events_code.c,240 :: 		void Box5OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,241 :: 		MinutesOnes();
BL	_MinutesOnes+0
;mikromedia_STM32plus_events_code.c,242 :: 		}
L_end_Box5OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box5OnPress
_ClockBackOnPress:
;mikromedia_STM32plus_events_code.c,244 :: 		void ClockBackOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,245 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,246 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,247 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,248 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,249 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,250 :: 		Example_State = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,251 :: 		}
L_end_ClockBackOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ClockBackOnPress
_Image8OnPress:
;mikromedia_STM32plus_events_code.c,253 :: 		void Image8OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,254 :: 		if (Set_MyRTCC() == 0)
BL	_Set_MyRTCC+0
CMP	R0, #0
IT	NE
BNE	L_Image8OnPress23
;mikromedia_STM32plus_events_code.c,255 :: 		return;
IT	AL
BAL	L_end_Image8OnPress
L_Image8OnPress23:
;mikromedia_STM32plus_events_code.c,256 :: 		Example_State = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,257 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,258 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,259 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,260 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,261 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,262 :: 		}
L_end_Image8OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image8OnPress
_BackIconSensorsOnPress:
;mikromedia_STM32plus_events_code.c,264 :: 		void BackIconSensorsOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,265 :: 		Stop_sensors();
BL	_Stop_sensors+0
;mikromedia_STM32plus_events_code.c,266 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,267 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,268 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,269 :: 		Example_state = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,270 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,271 :: 		}
L_end_BackIconSensorsOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _BackIconSensorsOnPress
_Image9OnPress:
;mikromedia_STM32plus_events_code.c,273 :: 		void Image9OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,274 :: 		Sensors_Init();
BL	_Sensors_Init+0
;mikromedia_STM32plus_events_code.c,275 :: 		Example_state = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,276 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,277 :: 		DrawScreen(&Sensors);
MOVW	R0, #lo_addr(_Sensors+0)
MOVT	R0, #hi_addr(_Sensors+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,278 :: 		Sensors_Read();
BL	_Sensors_Read+0
;mikromedia_STM32plus_events_code.c,279 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,280 :: 		}
L_end_Image9OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image9OnPress
_Image16OnClick:
;mikromedia_STM32plus_events_code.c,282 :: 		void Image16OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,283 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,284 :: 		DrawScreen(&MP3_SongList);
MOVW	R0, #lo_addr(_MP3_SongList+0)
MOVT	R0, #hi_addr(_MP3_SongList+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,285 :: 		Mp3_Init();
BL	_Mp3_Init+0
;mikromedia_STM32plus_events_code.c,286 :: 		Example_state = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,287 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,288 :: 		}
L_end_Image16OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image16OnClick
_mp3_back_iconOnPress:
;mikromedia_STM32plus_events_code.c,290 :: 		void mp3_back_iconOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,291 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,292 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,293 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,294 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,295 :: 		Example_state = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,296 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,297 :: 		}
L_end_mp3_back_iconOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mp3_back_iconOnPress
_Label22OnPress:
;mikromedia_STM32plus_events_code.c,299 :: 		void Label22OnPress() {
;mikromedia_STM32plus_events_code.c,301 :: 		}
L_end_Label22OnPress:
BX	LR
; end of _Label22OnPress
_Image15OnPress:
;mikromedia_STM32plus_events_code.c,303 :: 		void Image15OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,304 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,305 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,306 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,307 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,308 :: 		Example_state = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,309 :: 		Stop_Scroll();
BL	_Stop_Scroll+0
;mikromedia_STM32plus_events_code.c,310 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,311 :: 		}
L_end_Image15OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image15OnPress
_Label24OnPress:
;mikromedia_STM32plus_events_code.c,313 :: 		void Label24OnPress() {
;mikromedia_STM32plus_events_code.c,315 :: 		}
L_end_Label24OnPress:
BX	LR
; end of _Label24OnPress
_Box6OnPress:
;mikromedia_STM32plus_events_code.c,317 :: 		void Box6OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,318 :: 		ScrollPress();
BL	_ScrollPress+0
;mikromedia_STM32plus_events_code.c,319 :: 		}
L_end_Box6OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box6OnPress
_Box6OnClick:
;mikromedia_STM32plus_events_code.c,321 :: 		void Box6OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,322 :: 		ScrollOnClick();
BL	_ScrollOnClick+0
;mikromedia_STM32plus_events_code.c,323 :: 		}
L_end_Box6OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box6OnClick
_Icon_back_mp3OnClick:
;mikromedia_STM32plus_events_code.c,325 :: 		void Icon_back_mp3OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,326 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,327 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,328 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,329 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,330 :: 		Example_state = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,331 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,332 :: 		}
L_end_Icon_back_mp3OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Icon_back_mp3OnClick
_Label27OnPress:
;mikromedia_STM32plus_events_code.c,334 :: 		void Label27OnPress() {
;mikromedia_STM32plus_events_code.c,336 :: 		}
L_end_Label27OnPress:
BX	LR
; end of _Label27OnPress
_icon_paint_backOnPress:
;mikromedia_STM32plus_events_code.c,339 :: 		void icon_paint_backOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,340 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,341 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,342 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,343 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,344 :: 		Example_state = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,345 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,346 :: 		}
L_end_icon_paint_backOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _icon_paint_backOnPress
_pause_iconOnPress:
;mikromedia_STM32plus_events_code.c,348 :: 		void pause_iconOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,349 :: 		TFT_Set_Pen(ProgressBar.Color, 1);
MOVW	R0, #lo_addr(_ProgressBar+28)
MOVT	R0, #hi_addr(_ProgressBar+28)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,350 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
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
;mikromedia_STM32plus_events_code.c,351 :: 		TFT_Rectangle(pause_icon.Left - 2, 220, pause_icon.Left + pause_icon.Width + 2, 243);
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
;mikromedia_STM32plus_events_code.c,352 :: 		MP3_Example_State = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_MP3_Example_State+0)
MOVT	R0, #hi_addr(_MP3_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,353 :: 		pause_icon.Active = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_pause_icon+21)
MOVT	R0, #hi_addr(_pause_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,354 :: 		Play_icon.Active = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Play_icon+21)
MOVT	R0, #hi_addr(_Play_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,355 :: 		DrawImage(&play_icon);
MOVW	R0, #lo_addr(_Play_icon+0)
MOVT	R0, #hi_addr(_Play_icon+0)
BL	_DrawImage+0
;mikromedia_STM32plus_events_code.c,356 :: 		TFT_Set_Pen(MP3_Player.Color, 1);
MOVW	R0, #lo_addr(_MP3_Player+0)
MOVT	R0, #hi_addr(_MP3_Player+0)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,357 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
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
;mikromedia_STM32plus_events_code.c,358 :: 		TFT_Rectangle(pause_icon.Left - 2, 220, pause_icon.Left + pause_icon.Width + 2, 243);
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
;mikromedia_STM32plus_events_code.c,359 :: 		}
L_end_pause_iconOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _pause_iconOnPress
_songlist_iconOnPress:
;mikromedia_STM32plus_events_code.c,361 :: 		void songlist_iconOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,362 :: 		TFT_Set_Pen(ProgressBar.Color, 1);
MOVW	R0, #lo_addr(_ProgressBar+28)
MOVT	R0, #hi_addr(_ProgressBar+28)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,363 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
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
;mikromedia_STM32plus_events_code.c,364 :: 		TFT_Rectangle(songlist_icon.Left - 2, 220, songlist_icon.Left + songlist_icon.Width + 2, 243);
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
;mikromedia_STM32plus_events_code.c,365 :: 		StopMP3_File();
BL	_StopMP3_File+0
;mikromedia_STM32plus_events_code.c,367 :: 		Example_state = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,368 :: 		MP3_Example_State = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_MP3_Example_State+0)
MOVT	R0, #hi_addr(_MP3_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,369 :: 		TFT_Set_Pen(MP3_Player.Color, 1);
MOVW	R0, #lo_addr(_MP3_Player+0)
MOVT	R0, #hi_addr(_MP3_Player+0)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,370 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
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
;mikromedia_STM32plus_events_code.c,371 :: 		TFT_Rectangle(songlist_icon.Left - 2, 220, songlist_icon.Left + songlist_icon.Width + 2, 243);
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
;mikromedia_STM32plus_events_code.c,372 :: 		}
L_end_songlist_iconOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _songlist_iconOnPress
_stop_iconOnDown:
;mikromedia_STM32plus_events_code.c,374 :: 		void stop_iconOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,375 :: 		TFT_Set_Pen(ProgressBar.Color, 1);
MOVW	R0, #lo_addr(_ProgressBar+28)
MOVT	R0, #hi_addr(_ProgressBar+28)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,376 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
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
;mikromedia_STM32plus_events_code.c,377 :: 		TFT_Rectangle(stop_icon.Left - 2, 220, stop_icon.Left + stop_icon.Width + 2, 243);
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
;mikromedia_STM32plus_events_code.c,378 :: 		StopMP3_File();
BL	_StopMP3_File+0
;mikromedia_STM32plus_events_code.c,379 :: 		MP3_Example_State = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_MP3_Example_State+0)
MOVT	R0, #hi_addr(_MP3_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,380 :: 		pause_icon.Active = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_pause_icon+21)
MOVT	R0, #hi_addr(_pause_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,381 :: 		Play_icon.Active = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Play_icon+21)
MOVT	R0, #hi_addr(_Play_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,382 :: 		DrawImage(&stop_icon);
MOVW	R0, #lo_addr(_stop_icon+0)
MOVT	R0, #hi_addr(_stop_icon+0)
BL	_DrawImage+0
;mikromedia_STM32plus_events_code.c,383 :: 		DrawImage(&play_icon);
MOVW	R0, #lo_addr(_Play_icon+0)
MOVT	R0, #hi_addr(_Play_icon+0)
BL	_DrawImage+0
;mikromedia_STM32plus_events_code.c,384 :: 		TFT_Set_Pen(MP3_Player.Color, 1);
MOVW	R0, #lo_addr(_MP3_Player+0)
MOVT	R0, #hi_addr(_MP3_Player+0)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,385 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
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
;mikromedia_STM32plus_events_code.c,386 :: 		TFT_Rectangle(stop_icon.Left - 2, 220, stop_icon.Left + stop_icon.Width + 2, 243);
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
;mikromedia_STM32plus_events_code.c,387 :: 		}
L_end_stop_iconOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _stop_iconOnDown
_next_iconOnDown:
;mikromedia_STM32plus_events_code.c,389 :: 		void next_iconOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,390 :: 		TFT_Set_Pen(ProgressBar.Color, 1);
MOVW	R0, #lo_addr(_ProgressBar+28)
MOVT	R0, #hi_addr(_ProgressBar+28)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,391 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
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
;mikromedia_STM32plus_events_code.c,392 :: 		TFT_Rectangle(next_icon.Left - 2, 220, next_icon.Left + next_icon.Width + 2, 243);
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
;mikromedia_STM32plus_events_code.c,393 :: 		GetNext_mp3_File(1);
MOVS	R0, #1
BL	_GetNext_mp3_File+0
;mikromedia_STM32plus_events_code.c,394 :: 		DrawImage(&next_icon);
MOVW	R0, #lo_addr(_next_icon+0)
MOVT	R0, #hi_addr(_next_icon+0)
BL	_DrawImage+0
;mikromedia_STM32plus_events_code.c,395 :: 		pause_icon.Active = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pause_icon+21)
MOVT	R0, #hi_addr(_pause_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,396 :: 		Play_icon.Active = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Play_icon+21)
MOVT	R0, #hi_addr(_Play_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,397 :: 		DrawImage(&pause_icon);
MOVW	R0, #lo_addr(_pause_icon+0)
MOVT	R0, #hi_addr(_pause_icon+0)
BL	_DrawImage+0
;mikromedia_STM32plus_events_code.c,398 :: 		TFT_Set_Pen(MP3_Player.Color, 1);
MOVW	R0, #lo_addr(_MP3_Player+0)
MOVT	R0, #hi_addr(_MP3_Player+0)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,399 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
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
;mikromedia_STM32plus_events_code.c,400 :: 		TFT_Rectangle(next_icon.Left - 2, 220, next_icon.Left + next_icon.Width + 2, 243);
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
;mikromedia_STM32plus_events_code.c,401 :: 		}
L_end_next_iconOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _next_iconOnDown
_previous_iconOnDown:
;mikromedia_STM32plus_events_code.c,403 :: 		void previous_iconOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,404 :: 		TFT_Set_Pen(ProgressBar.Color, 1);
MOVW	R0, #lo_addr(_ProgressBar+28)
MOVT	R0, #hi_addr(_ProgressBar+28)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,405 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
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
;mikromedia_STM32plus_events_code.c,406 :: 		TFT_Rectangle(previous_icon.Left - 2, 220, previous_icon.Left + previous_icon.Width + 2, 243);
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
;mikromedia_STM32plus_events_code.c,407 :: 		GetNext_mp3_File(0);
MOVS	R0, #0
BL	_GetNext_mp3_File+0
;mikromedia_STM32plus_events_code.c,408 :: 		DrawImage(&previous_icon);
MOVW	R0, #lo_addr(_previous_icon+0)
MOVT	R0, #hi_addr(_previous_icon+0)
BL	_DrawImage+0
;mikromedia_STM32plus_events_code.c,409 :: 		pause_icon.Active = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pause_icon+21)
MOVT	R0, #hi_addr(_pause_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,410 :: 		Play_icon.Active = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Play_icon+21)
MOVT	R0, #hi_addr(_Play_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,411 :: 		DrawImage(&pause_icon);
MOVW	R0, #lo_addr(_pause_icon+0)
MOVT	R0, #hi_addr(_pause_icon+0)
BL	_DrawImage+0
;mikromedia_STM32plus_events_code.c,412 :: 		TFT_Set_Pen(MP3_Player.Color, 1);
MOVW	R0, #lo_addr(_MP3_Player+0)
MOVT	R0, #hi_addr(_MP3_Player+0)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,413 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
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
;mikromedia_STM32plus_events_code.c,414 :: 		TFT_Rectangle(previous_icon.Left - 2, 220, previous_icon.Left + previous_icon.Width + 2, 243);
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
;mikromedia_STM32plus_events_code.c,415 :: 		}
L_end_previous_iconOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _previous_iconOnDown
_VolmeBarOnPress:
;mikromedia_STM32plus_events_code.c,417 :: 		void VolmeBarOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,420 :: 		temp = Xcoord - VolmeBar.Left;
MOVW	R0, #lo_addr(_VolmeBar+6)
MOVT	R0, #hi_addr(_VolmeBar+6)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
SUB	R1, R0, R1
UXTH	R1, R1
;mikromedia_STM32plus_events_code.c,421 :: 		temp = temp * 100;
MOVS	R0, #100
MULS	R1, R0, R1
UXTH	R1, R1
;mikromedia_STM32plus_events_code.c,422 :: 		level = temp / VolmeBar.Width;
MOVW	R0, #lo_addr(_VolmeBar+10)
MOVT	R0, #hi_addr(_VolmeBar+10)
LDRH	R0, [R0, #0]
UDIV	R1, R1, R0
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,423 :: 		MP3_Set_Volume(100 - level, 100 - level);
UXTB	R0, R1
RSB	R0, R0, #100
UXTB	R1, R0
UXTB	R0, R0
BL	_MP3_Set_Volume+0
;mikromedia_STM32plus_events_code.c,425 :: 		UpdateVolumeBar(level, old_level);
MOVW	R0, #lo_addr(_old_level+0)
MOVT	R0, #hi_addr(_old_level+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRB	R0, [R0, #0]
BL	_UpdateVolumeBar+0
;mikromedia_STM32plus_events_code.c,426 :: 		old_level = level;
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_old_level+0)
MOVT	R0, #hi_addr(_old_level+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,427 :: 		}
L_end_VolmeBarOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _VolmeBarOnPress
_ProgreesBarOnPress:
;mikromedia_STM32plus_events_code.c,429 :: 		void ProgreesBarOnPress() {
;mikromedia_STM32plus_events_code.c,431 :: 		}
L_end_ProgreesBarOnPress:
BX	LR
; end of _ProgreesBarOnPress
_Play_iconOnDown:
;mikromedia_STM32plus_events_code.c,433 :: 		void Play_iconOnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,434 :: 		TFT_Set_Pen(ProgressBar.Color, 1);
MOVW	R0, #lo_addr(_ProgressBar+28)
MOVT	R0, #hi_addr(_ProgressBar+28)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,435 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
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
;mikromedia_STM32plus_events_code.c,436 :: 		TFT_Rectangle(Play_icon.Left - 2, 220, Play_icon.Left + Play_icon.Width + 2, 243);
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
;mikromedia_STM32plus_events_code.c,437 :: 		pause_icon.Active = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pause_icon+21)
MOVT	R0, #hi_addr(_pause_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,438 :: 		Play_icon.Active = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Play_icon+21)
MOVT	R0, #hi_addr(_Play_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,439 :: 		if (MP3_Example_State == 1)
MOVW	R0, #lo_addr(_MP3_Example_State+0)
MOVT	R0, #hi_addr(_MP3_Example_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Play_iconOnDown24
;mikromedia_STM32plus_events_code.c,440 :: 		MP3_play(Label28_Caption, current_file);
MOVW	R0, #lo_addr(_current_file+0)
MOVT	R0, #hi_addr(_current_file+0)
LDRSB	R0, [R0, #0]
UXTB	R1, R0
MOVW	R0, #lo_addr(_Label28_Caption+0)
MOVT	R0, #hi_addr(_Label28_Caption+0)
BL	_MP3_play+0
L_Play_iconOnDown24:
;mikromedia_STM32plus_events_code.c,441 :: 		MP3_Example_State = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_MP3_Example_State+0)
MOVT	R0, #hi_addr(_MP3_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,442 :: 		DrawImage(&pause_icon);
MOVW	R0, #lo_addr(_pause_icon+0)
MOVT	R0, #hi_addr(_pause_icon+0)
BL	_DrawImage+0
;mikromedia_STM32plus_events_code.c,443 :: 		TFT_Set_Pen(MP3_Player.Color, 1);
MOVW	R0, #lo_addr(_MP3_Player+0)
MOVT	R0, #hi_addr(_MP3_Player+0)
LDRH	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;mikromedia_STM32plus_events_code.c,444 :: 		TFT_Set_Brush(0, 0, 0, 0, 0, 0);
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
;mikromedia_STM32plus_events_code.c,445 :: 		TFT_Rectangle(Play_icon.Left - 2, 220, Play_icon.Left + Play_icon.Width + 2, 243);
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
;mikromedia_STM32plus_events_code.c,446 :: 		}
L_end_Play_iconOnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Play_iconOnDown
_Icon_next_boxOnPress:
;mikromedia_STM32plus_events_code.c,448 :: 		void Icon_next_boxOnPress() {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,454 :: 		for (i = 0; i < 209; i ++)
; i start address is: 4 (R1)
MOVS	R1, #0
; i end address is: 4 (R1)
L_Icon_next_boxOnPress25:
; i start address is: 4 (R1)
CMP	R1, #209
IT	CS
BCS	L_Icon_next_boxOnPress26
;mikromedia_STM32plus_events_code.c,455 :: 		ScrollImageDown(1);
STRB	R1, [SP, #4]
MOVS	R0, #1
SXTH	R0, R0
BL	_ScrollImageDown+0
LDRB	R1, [SP, #4]
;mikromedia_STM32plus_events_code.c,454 :: 		for (i = 0; i < 209; i ++)
ADDS	R1, R1, #1
UXTB	R1, R1
;mikromedia_STM32plus_events_code.c,455 :: 		ScrollImageDown(1);
; i end address is: 4 (R1)
IT	AL
BAL	L_Icon_next_boxOnPress25
L_Icon_next_boxOnPress26:
;mikromedia_STM32plus_events_code.c,456 :: 		}
L_end_Icon_next_boxOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Icon_next_boxOnPress
_icon_previous_boxOnPress:
;mikromedia_STM32plus_events_code.c,458 :: 		void icon_previous_boxOnPress() {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,464 :: 		for (i = 0; i < 209; i ++)
; i start address is: 4 (R1)
MOVS	R1, #0
; i end address is: 4 (R1)
L_icon_previous_boxOnPress28:
; i start address is: 4 (R1)
CMP	R1, #209
IT	CS
BCS	L_icon_previous_boxOnPress29
;mikromedia_STM32plus_events_code.c,465 :: 		ScrollImageUp(1);
STRB	R1, [SP, #4]
MOVS	R0, #1
SXTH	R0, R0
BL	_ScrollImageUp+0
LDRB	R1, [SP, #4]
;mikromedia_STM32plus_events_code.c,464 :: 		for (i = 0; i < 209; i ++)
ADDS	R1, R1, #1
UXTB	R1, R1
;mikromedia_STM32plus_events_code.c,465 :: 		ScrollImageUp(1);
; i end address is: 4 (R1)
IT	AL
BAL	L_icon_previous_boxOnPress28
L_icon_previous_boxOnPress29:
;mikromedia_STM32plus_events_code.c,466 :: 		}
L_end_icon_previous_boxOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _icon_previous_boxOnPress
_Image18OnClick:
;mikromedia_STM32plus_events_code.c,468 :: 		void Image18OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,469 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,470 :: 		DrawScreen(&SlideShow);
MOVW	R0, #lo_addr(_SlideShow+0)
MOVT	R0, #hi_addr(_SlideShow+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,471 :: 		Start_Slide_Show();
BL	_Start_Slide_Show+0
;mikromedia_STM32plus_events_code.c,472 :: 		Example_state = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,473 :: 		ByteToStr(Slide_Index + 1, Label35_caption);
MOVW	R0, #lo_addr(_Slide_Index+0)
MOVT	R0, #hi_addr(_Slide_Index+0)
LDRSB	R0, [R0, #0]
ADDS	R0, R0, #1
MOVW	R1, #lo_addr(_Label35_Caption+0)
MOVT	R1, #hi_addr(_Label35_Caption+0)
UXTB	R0, R0
BL	_ByteToStr+0
;mikromedia_STM32plus_events_code.c,474 :: 		RedrawLabel(SlideShow.Color, &Label35, 20, 30);
MOVW	R0, #lo_addr(_SlideShow+0)
MOVT	R0, #hi_addr(_SlideShow+0)
LDRH	R0, [R0, #0]
MOVS	R3, #30
MOVS	R2, #20
MOVW	R1, #lo_addr(_Label35+0)
MOVT	R1, #hi_addr(_Label35+0)
BL	_RedrawLabel+0
;mikromedia_STM32plus_events_code.c,475 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,476 :: 		}
L_end_Image18OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image18OnClick
_Box7OnDown:
;mikromedia_STM32plus_events_code.c,478 :: 		void Box7OnDown() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,479 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,480 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,481 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,482 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,483 :: 		Example_state = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,484 :: 		Stop_Scroll();
BL	_Stop_Scroll+0
;mikromedia_STM32plus_events_code.c,485 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,486 :: 		}
L_end_Box7OnDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box7OnDown
_RGB_Active_areaOnPress:
;mikromedia_STM32plus_events_code.c,488 :: 		void RGB_Active_areaOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,489 :: 		PickColor();
BL	_PickColor+0
;mikromedia_STM32plus_events_code.c,490 :: 		}
L_end_RGB_Active_areaOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RGB_Active_areaOnPress
_Box9OnPress:
;mikromedia_STM32plus_events_code.c,492 :: 		void Box9OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,493 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;mikromedia_STM32plus_events_code.c,494 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_events_code.c,495 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,496 :: 		checkPowerM();
BL	_checkPowerM+0
;mikromedia_STM32plus_events_code.c,497 :: 		Example_state = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Example_State+0)
MOVT	R0, #hi_addr(_Example_State+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,498 :: 		NVIC_IntDisable(IVT_INT_TIM5);
MOVW	R0, #66
BL	_NVIC_IntDisable+0
;mikromedia_STM32plus_events_code.c,499 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;mikromedia_STM32plus_events_code.c,500 :: 		LED_R = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(LED_R+0)
MOVT	R0, #hi_addr(LED_R+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,501 :: 		LED_B = 0;
MOVW	R0, #lo_addr(LED_B+0)
MOVT	R0, #hi_addr(LED_B+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,502 :: 		LED_G = 0;
MOVW	R0, #lo_addr(LED_G+0)
MOVT	R0, #hi_addr(LED_G+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_events_code.c,503 :: 		}
L_end_Box9OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box9OnPress
_Box12OnPress:
;mikromedia_STM32plus_events_code.c,506 :: 		void Box12OnPress() {
;mikromedia_STM32plus_events_code.c,508 :: 		}
L_end_Box12OnPress:
BX	LR
; end of _Box12OnPress
_Slide_Active_areaOnPress:
;mikromedia_STM32plus_events_code.c,510 :: 		void Slide_Active_areaOnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,511 :: 		Slide_scroll();
BL	_Slide_scroll+0
;mikromedia_STM32plus_events_code.c,512 :: 		}
L_end_Slide_Active_areaOnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Slide_Active_areaOnPress
_Box12OnClick:
;mikromedia_STM32plus_events_code.c,514 :: 		void Box12OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,515 :: 		Deactivate_All_Rollers();
BL	_Deactivate_All_Rollers+0
;mikromedia_STM32plus_events_code.c,517 :: 		}
L_end_Box12OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box12OnClick
_Box13OnClick:
;mikromedia_STM32plus_events_code.c,519 :: 		void Box13OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,520 :: 		Deactivate_All_Rollers();
BL	_Deactivate_All_Rollers+0
;mikromedia_STM32plus_events_code.c,521 :: 		}
L_end_Box13OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box13OnClick
_Box14OnPress:
;mikromedia_STM32plus_events_code.c,523 :: 		void Box14OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_events_code.c,524 :: 		AmPmRun();
BL	_AmPmRun+0
;mikromedia_STM32plus_events_code.c,525 :: 		}
L_end_Box14OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box14OnPress
