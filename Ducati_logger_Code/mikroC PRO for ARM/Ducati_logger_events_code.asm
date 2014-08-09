_BLED_Fade_Out:
;Ducati_logger_events_code.c,60 :: 		void BLED_Fade_Out(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,63 :: 		for ( i = 255; i > 0 ; i-- ){
; i start address is: 4 (R1)
MOVS	R1, #255
SXTH	R1, R1
; i end address is: 4 (R1)
L_BLED_Fade_Out0:
; i start address is: 4 (R1)
CMP	R1, #0
IT	LE
BLE	L_BLED_Fade_Out1
;Ducati_logger_events_code.c,64 :: 		TFT_Set_DBC_SSD1963(i);
STRH	R1, [SP, #4]
UXTB	R0, R1
BL	_TFT_Set_DBC_SSD1963+0
LDRSH	R1, [SP, #4]
;Ducati_logger_events_code.c,65 :: 		Delay_ms(1);
MOVW	R7, #49998
MOVT	R7, #0
NOP
NOP
L_BLED_Fade_Out3:
SUBS	R7, R7, #1
BNE	L_BLED_Fade_Out3
NOP
NOP
NOP
;Ducati_logger_events_code.c,63 :: 		for ( i = 255; i > 0 ; i-- ){
SUBS	R1, R1, #1
SXTH	R1, R1
;Ducati_logger_events_code.c,66 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_BLED_Fade_Out0
L_BLED_Fade_Out1:
;Ducati_logger_events_code.c,67 :: 		TFT_Set_DBC_SSD1963(0);
MOVS	R0, #0
BL	_TFT_Set_DBC_SSD1963+0
;Ducati_logger_events_code.c,68 :: 		}
L_end_BLED_Fade_Out:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _BLED_Fade_Out
_BLED_Fade_In:
;Ducati_logger_events_code.c,70 :: 		void BLED_Fade_In(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,73 :: 		for (i = 1; i < 255; i++){
; i start address is: 4 (R1)
MOVS	R1, #1
SXTH	R1, R1
; i end address is: 4 (R1)
L_BLED_Fade_In5:
; i start address is: 4 (R1)
CMP	R1, #255
IT	GE
BGE	L_BLED_Fade_In6
;Ducati_logger_events_code.c,74 :: 		TFT_Set_DBC_SSD1963(i);
STRH	R1, [SP, #4]
UXTB	R0, R1
BL	_TFT_Set_DBC_SSD1963+0
LDRSH	R1, [SP, #4]
;Ducati_logger_events_code.c,75 :: 		Delay_ms(1);
MOVW	R7, #49998
MOVT	R7, #0
NOP
NOP
L_BLED_Fade_In8:
SUBS	R7, R7, #1
BNE	L_BLED_Fade_In8
NOP
NOP
NOP
;Ducati_logger_events_code.c,73 :: 		for (i = 1; i < 255; i++){
ADDS	R1, R1, #1
SXTH	R1, R1
;Ducati_logger_events_code.c,76 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_BLED_Fade_In5
L_BLED_Fade_In6:
;Ducati_logger_events_code.c,77 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;Ducati_logger_events_code.c,78 :: 		}
L_end_BLED_Fade_In:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _BLED_Fade_In
_Run_Logger:
;Ducati_logger_events_code.c,83 :: 		void Run_Logger(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,84 :: 		switch (Logger_State) {
IT	AL
BAL	L_Run_Logger10
;Ducati_logger_events_code.c,85 :: 		case 0 : {
L_Run_Logger12:
;Ducati_logger_events_code.c,86 :: 		checkRTC();            // Speedometer screen
BL	_checkRTC+0
;Ducati_logger_events_code.c,87 :: 		checkPowerM();
BL	_checkPowerM+0
;Ducati_logger_events_code.c,88 :: 		Sensors_Read();
BL	_Sensors_Read+0
;Ducati_logger_events_code.c,89 :: 		}; break;
IT	AL
BAL	L_Run_Logger11
;Ducati_logger_events_code.c,90 :: 		case 1 : {
L_Run_Logger13:
;Ducati_logger_events_code.c,91 :: 		checkRTC();            // Tachometer screen
BL	_checkRTC+0
;Ducati_logger_events_code.c,92 :: 		checkPowerM();
BL	_checkPowerM+0
;Ducati_logger_events_code.c,93 :: 		Sensors_Read();
BL	_Sensors_Read+0
;Ducati_logger_events_code.c,94 :: 		}; break;
IT	AL
BAL	L_Run_Logger11
;Ducati_logger_events_code.c,96 :: 		case 2 : {
L_Run_Logger14:
;Ducati_logger_events_code.c,97 :: 		checkRTC();            // Settings screen
BL	_checkRTC+0
;Ducati_logger_events_code.c,98 :: 		checkPowerM();
BL	_checkPowerM+0
;Ducati_logger_events_code.c,99 :: 		}; break;
IT	AL
BAL	L_Run_Logger11
;Ducati_logger_events_code.c,100 :: 		case 3 : {                       // RTCC screen
L_Run_Logger15:
;Ducati_logger_events_code.c,101 :: 		if (PenDown == 0)
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Run_Logger16
;Ducati_logger_events_code.c,102 :: 		doRTC_Example();
BL	_doRTC_Example+0
L_Run_Logger16:
;Ducati_logger_events_code.c,103 :: 		}; break;
IT	AL
BAL	L_Run_Logger11
;Ducati_logger_events_code.c,104 :: 		case 4 : {
L_Run_Logger17:
;Ducati_logger_events_code.c,105 :: 		doAccel();
BL	_doAccel+0
;Ducati_logger_events_code.c,106 :: 		};   break;                  // Accelerometer Test
IT	AL
BAL	L_Run_Logger11
;Ducati_logger_events_code.c,107 :: 		case 5 : {
L_Run_Logger18:
;Ducati_logger_events_code.c,108 :: 		doGyro();                      // Gyro Test
BL	_doGYRO+0
;Ducati_logger_events_code.c,109 :: 		}; break;
IT	AL
BAL	L_Run_Logger11
;Ducati_logger_events_code.c,110 :: 		case 6 : {
L_Run_Logger19:
;Ducati_logger_events_code.c,111 :: 		doMagnet();                      // Gyro Test
BL	_doMAGNET+0
;Ducati_logger_events_code.c,112 :: 		}break;                   //Sensor Calibration
IT	AL
BAL	L_Run_Logger11
;Ducati_logger_events_code.c,113 :: 		case 7 : {                       // Oxygen sensor test
L_Run_Logger20:
;Ducati_logger_events_code.c,115 :: 		}; break;
IT	AL
BAL	L_Run_Logger11
;Ducati_logger_events_code.c,116 :: 		case 8 : {                       // Shift Light Adjust
L_Run_Logger21:
;Ducati_logger_events_code.c,118 :: 		}; break;
IT	AL
BAL	L_Run_Logger11
;Ducati_logger_events_code.c,119 :: 		}
L_Run_Logger10:
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_Run_Logger12
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_Run_Logger13
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_Run_Logger14
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_Run_Logger15
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_Run_Logger17
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #5
IT	EQ
BEQ	L_Run_Logger18
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #6
IT	EQ
BEQ	L_Run_Logger19
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #7
IT	EQ
BEQ	L_Run_Logger20
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #8
IT	EQ
BEQ	L_Run_Logger21
L_Run_Logger11:
;Ducati_logger_events_code.c,120 :: 		}
L_end_Run_Logger:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Run_Logger
_doSetClock:
;Ducati_logger_events_code.c,162 :: 		void doSetClock() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,163 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Ducati_logger_events_code.c,164 :: 		DrawScreen(&Set_clock);
MOVW	R0, #lo_addr(_Set_clock+0)
MOVT	R0, #hi_addr(_Set_clock+0)
BL	_DrawScreen+0
;Ducati_logger_events_code.c,165 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Ducati_logger_events_code.c,166 :: 		RTC_Example_init();
BL	_RTC_Example_init+0
;Ducati_logger_events_code.c,167 :: 		Logger_State = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
STRB	R1, [R0, #0]
;Ducati_logger_events_code.c,169 :: 		}
L_end_doSetClock:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doSetClock
_doCalibration:
;Ducati_logger_events_code.c,172 :: 		void doCalibration(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,173 :: 		Delay_ms(500);
MOVW	R7, #30782
MOVT	R7, #381
NOP
NOP
L_doCalibration22:
SUBS	R7, R7, #1
BNE	L_doCalibration22
NOP
NOP
NOP
;Ducati_logger_events_code.c,174 :: 		Calibrate();
BL	_Calibrate+0
;Ducati_logger_events_code.c,175 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Ducati_logger_events_code.c,176 :: 		DrawScreen(&Settings);
MOVW	R0, #lo_addr(_Settings+0)
MOVT	R0, #hi_addr(_Settings+0)
BL	_DrawScreen+0
;Ducati_logger_events_code.c,177 :: 		}
L_end_doCalibration:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doCalibration
_Box10OnPress:
;Ducati_logger_events_code.c,180 :: 		void Box10OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,181 :: 		HoursTens();
BL	_HoursTens+0
;Ducati_logger_events_code.c,182 :: 		}
L_end_Box10OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box10OnPress
_Box11OnPress:
;Ducati_logger_events_code.c,184 :: 		void Box11OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,185 :: 		HoursOnes();
BL	_HoursOnes+0
;Ducati_logger_events_code.c,186 :: 		}
L_end_Box11OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box11OnPress
_Box3OnPress:
;Ducati_logger_events_code.c,188 :: 		void Box3OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,189 :: 		MinutesTens();
BL	_MinutesTens+0
;Ducati_logger_events_code.c,190 :: 		}
L_end_Box3OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box3OnPress
_Box4OnPress:
;Ducati_logger_events_code.c,192 :: 		void Box4OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,193 :: 		MinutesOnes();
BL	_MinutesOnes+0
;Ducati_logger_events_code.c,194 :: 		}
L_end_Box4OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box4OnPress
_Box5OnPress:
;Ducati_logger_events_code.c,196 :: 		void Box5OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,197 :: 		AmPmRun();
BL	_AmPmRun+0
;Ducati_logger_events_code.c,198 :: 		}
L_end_Box5OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box5OnPress
_Image18OnPress:
;Ducati_logger_events_code.c,200 :: 		void Image18OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,201 :: 		if (Set_MyRTCC() == 0)
BL	_Set_MyRTCC+0
CMP	R0, #0
IT	NE
BNE	L_Image18OnPress24
;Ducati_logger_events_code.c,202 :: 		return;
IT	AL
BAL	L_end_Image18OnPress
L_Image18OnPress24:
;Ducati_logger_events_code.c,203 :: 		Logger_State = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
STRB	R1, [R0, #0]
;Ducati_logger_events_code.c,204 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Ducati_logger_events_code.c,205 :: 		DrawScreen(&Settings);
MOVW	R0, #lo_addr(_Settings+0)
MOVT	R0, #hi_addr(_Settings+0)
BL	_DrawScreen+0
;Ducati_logger_events_code.c,206 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;Ducati_logger_events_code.c,207 :: 		checkPowerM();
BL	_checkPowerM+0
;Ducati_logger_events_code.c,208 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Ducati_logger_events_code.c,209 :: 		}
L_end_Image18OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image18OnPress
_Box8OnClick:
;Ducati_logger_events_code.c,211 :: 		void Box8OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,212 :: 		Deactivate_All_Rollers();
BL	_Deactivate_All_Rollers+0
;Ducati_logger_events_code.c,213 :: 		}
L_end_Box8OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box8OnClick
_doNextScreen:
;Ducati_logger_events_code.c,215 :: 		void doNextScreen() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,216 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Ducati_logger_events_code.c,217 :: 		DrawScreen(&Tachometer_graphics);
MOVW	R0, #lo_addr(_Tachometer_graphics+0)
MOVT	R0, #hi_addr(_Tachometer_graphics+0)
BL	_DrawScreen+0
;Ducati_logger_events_code.c,218 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Ducati_logger_events_code.c,219 :: 		Logger_State = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
STRB	R1, [R0, #0]
;Ducati_logger_events_code.c,220 :: 		}
L_end_doNextScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doNextScreen
_doPrevScreen:
;Ducati_logger_events_code.c,222 :: 		void doPrevScreen() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,223 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Ducati_logger_events_code.c,224 :: 		DrawScreen(&Speedometer_graphics);
MOVW	R0, #lo_addr(_Speedometer_graphics+0)
MOVT	R0, #hi_addr(_Speedometer_graphics+0)
BL	_DrawScreen+0
;Ducati_logger_events_code.c,225 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Ducati_logger_events_code.c,226 :: 		Logger_State = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
STRB	R1, [R0, #0]
;Ducati_logger_events_code.c,228 :: 		}
L_end_doPrevScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doPrevScreen
_doLog:
;Ducati_logger_events_code.c,230 :: 		void doLog() {
;Ducati_logger_events_code.c,232 :: 		}
L_end_doLog:
BX	LR
; end of _doLog
_doSettings:
;Ducati_logger_events_code.c,234 :: 		void doSettings() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,235 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Ducati_logger_events_code.c,236 :: 		DrawScreen(&Settings);
MOVW	R0, #lo_addr(_Settings+0)
MOVT	R0, #hi_addr(_Settings+0)
BL	_DrawScreen+0
;Ducati_logger_events_code.c,237 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Ducati_logger_events_code.c,238 :: 		Logger_State = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
STRB	R1, [R0, #0]
;Ducati_logger_events_code.c,240 :: 		}
L_end_doSettings:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doSettings
_doAccelerometerTest:
;Ducati_logger_events_code.c,242 :: 		void doAccelerometerTest() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,243 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Ducati_logger_events_code.c,244 :: 		DrawScreen(&Accelerometer_test);
MOVW	R0, #lo_addr(_Accelerometer_test+0)
MOVT	R0, #hi_addr(_Accelerometer_test+0)
BL	_DrawScreen+0
;Ducati_logger_events_code.c,245 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Ducati_logger_events_code.c,246 :: 		Logger_State = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
STRB	R1, [R0, #0]
;Ducati_logger_events_code.c,247 :: 		ACCEL_Start(&cACCEL_test_status);
MOVW	R0, #lo_addr(_cACCEL_test_status+0)
MOVT	R0, #hi_addr(_cACCEL_test_status+0)
BL	_ACCEL_Start+0
;Ducati_logger_events_code.c,248 :: 		}
L_end_doAccelerometerTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doAccelerometerTest
_doGPSTest:
;Ducati_logger_events_code.c,250 :: 		void doGPSTest() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,251 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Ducati_logger_events_code.c,252 :: 		DrawScreen(&GPS_test);
MOVW	R0, #lo_addr(_GPS_Test+0)
MOVT	R0, #hi_addr(_GPS_Test+0)
BL	_DrawScreen+0
;Ducati_logger_events_code.c,253 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Ducati_logger_events_code.c,255 :: 		}
L_end_doGPSTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doGPSTest
_doGyroTest:
;Ducati_logger_events_code.c,257 :: 		void doGyroTest() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,258 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Ducati_logger_events_code.c,259 :: 		DrawScreen(&Gyro_test);
MOVW	R0, #lo_addr(_Gyro_test+0)
MOVT	R0, #hi_addr(_Gyro_test+0)
BL	_DrawScreen+0
;Ducati_logger_events_code.c,260 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Ducati_logger_events_code.c,261 :: 		Logger_State = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
STRB	R1, [R0, #0]
;Ducati_logger_events_code.c,262 :: 		GYRO_Start(&cGYRO_test_status);
MOVW	R0, #lo_addr(_cGYRO_test_status+0)
MOVT	R0, #hi_addr(_cGYRO_test_status+0)
BL	_GYRO_Start+0
;Ducati_logger_events_code.c,263 :: 		}
L_end_doGyroTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doGyroTest
_doPressureTest:
;Ducati_logger_events_code.c,266 :: 		void doPressureTest() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,267 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Ducati_logger_events_code.c,268 :: 		DrawScreen(&Pressure_test);
MOVW	R0, #lo_addr(_Pressure_test+0)
MOVT	R0, #hi_addr(_Pressure_test+0)
BL	_DrawScreen+0
;Ducati_logger_events_code.c,269 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Ducati_logger_events_code.c,272 :: 		}
L_end_doPressureTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doPressureTest
_doMagnetTest:
;Ducati_logger_events_code.c,274 :: 		void doMagnetTest() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,275 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Ducati_logger_events_code.c,276 :: 		DrawScreen(&Magnetometer_test);
MOVW	R0, #lo_addr(_Magnetometer_test+0)
MOVT	R0, #hi_addr(_Magnetometer_test+0)
BL	_DrawScreen+0
;Ducati_logger_events_code.c,277 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Ducati_logger_events_code.c,278 :: 		Logger_State = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
STRB	R1, [R0, #0]
;Ducati_logger_events_code.c,279 :: 		MAGNET_Start(&cMAGNET_test_status);
MOVW	R0, #lo_addr(_cMAGNET_test_status+0)
MOVT	R0, #hi_addr(_cMAGNET_test_status+0)
BL	_MAGNET_Start+0
;Ducati_logger_events_code.c,281 :: 		}
L_end_doMagnetTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doMagnetTest
