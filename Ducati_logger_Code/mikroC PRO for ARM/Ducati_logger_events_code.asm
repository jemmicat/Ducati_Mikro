_BLED_Fade_Out:
;Ducati_logger_events_code.c,51 :: 		void BLED_Fade_Out(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,54 :: 		for ( i = 255; i > 0 ; i-- ){
; i start address is: 4 (R1)
MOVS	R1, #255
SXTH	R1, R1
; i end address is: 4 (R1)
L_BLED_Fade_Out0:
; i start address is: 4 (R1)
CMP	R1, #0
IT	LE
BLE	L_BLED_Fade_Out1
;Ducati_logger_events_code.c,55 :: 		TFT_Set_DBC_SSD1963(i);
STRH	R1, [SP, #4]
UXTB	R0, R1
BL	_TFT_Set_DBC_SSD1963+0
LDRSH	R1, [SP, #4]
;Ducati_logger_events_code.c,56 :: 		Delay_ms(1);
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
;Ducati_logger_events_code.c,54 :: 		for ( i = 255; i > 0 ; i-- ){
SUBS	R1, R1, #1
SXTH	R1, R1
;Ducati_logger_events_code.c,57 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_BLED_Fade_Out0
L_BLED_Fade_Out1:
;Ducati_logger_events_code.c,58 :: 		TFT_Set_DBC_SSD1963(0);
MOVS	R0, #0
BL	_TFT_Set_DBC_SSD1963+0
;Ducati_logger_events_code.c,59 :: 		}
L_end_BLED_Fade_Out:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _BLED_Fade_Out
_BLED_Fade_In:
;Ducati_logger_events_code.c,61 :: 		void BLED_Fade_In(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,64 :: 		for (i = 1; i < 255; i++){
; i start address is: 4 (R1)
MOVS	R1, #1
SXTH	R1, R1
; i end address is: 4 (R1)
L_BLED_Fade_In5:
; i start address is: 4 (R1)
CMP	R1, #255
IT	GE
BGE	L_BLED_Fade_In6
;Ducati_logger_events_code.c,65 :: 		TFT_Set_DBC_SSD1963(i);
STRH	R1, [SP, #4]
UXTB	R0, R1
BL	_TFT_Set_DBC_SSD1963+0
LDRSH	R1, [SP, #4]
;Ducati_logger_events_code.c,66 :: 		Delay_ms(1);
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
;Ducati_logger_events_code.c,64 :: 		for (i = 1; i < 255; i++){
ADDS	R1, R1, #1
SXTH	R1, R1
;Ducati_logger_events_code.c,67 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_BLED_Fade_In5
L_BLED_Fade_In6:
;Ducati_logger_events_code.c,68 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;Ducati_logger_events_code.c,69 :: 		}
L_end_BLED_Fade_In:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _BLED_Fade_In
_Run_Logger:
;Ducati_logger_events_code.c,74 :: 		void Run_Logger(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,75 :: 		switch (Logger_State) {
IT	AL
BAL	L_Run_Logger10
;Ducati_logger_events_code.c,76 :: 		case 0 : {
L_Run_Logger12:
;Ducati_logger_events_code.c,77 :: 		checkRTC();            // Speedometer screen
BL	_checkRTC+0
;Ducati_logger_events_code.c,78 :: 		checkPowerM();
BL	_checkPowerM+0
;Ducati_logger_events_code.c,79 :: 		Sensors_Read();
BL	_Sensors_Read+0
;Ducati_logger_events_code.c,80 :: 		}; break;
IT	AL
BAL	L_Run_Logger11
;Ducati_logger_events_code.c,81 :: 		case 1 : {
L_Run_Logger13:
;Ducati_logger_events_code.c,82 :: 		checkRTC();            // Tachometer screen
BL	_checkRTC+0
;Ducati_logger_events_code.c,83 :: 		checkPowerM();
BL	_checkPowerM+0
;Ducati_logger_events_code.c,84 :: 		Sensors_Read();
BL	_Sensors_Read+0
;Ducati_logger_events_code.c,85 :: 		}; break;
IT	AL
BAL	L_Run_Logger11
;Ducati_logger_events_code.c,87 :: 		case 2 : {
L_Run_Logger14:
;Ducati_logger_events_code.c,88 :: 		checkRTC();            // Settings screen
BL	_checkRTC+0
;Ducati_logger_events_code.c,89 :: 		checkPowerM();
BL	_checkPowerM+0
;Ducati_logger_events_code.c,90 :: 		}; break;
IT	AL
BAL	L_Run_Logger11
;Ducati_logger_events_code.c,91 :: 		case 3 : {                       // RTCC screen
L_Run_Logger15:
;Ducati_logger_events_code.c,92 :: 		if (PenDown == 0)
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Run_Logger16
;Ducati_logger_events_code.c,93 :: 		doRTC_Example();
BL	_doRTC_Example+0
L_Run_Logger16:
;Ducati_logger_events_code.c,94 :: 		}; break;
IT	AL
BAL	L_Run_Logger11
;Ducati_logger_events_code.c,95 :: 		case 4 : {
L_Run_Logger17:
;Ducati_logger_events_code.c,96 :: 		doIMUTest();
BL	_doIMUTest+0
;Ducati_logger_events_code.c,97 :: 		};   break;                  // IMU Test
IT	AL
BAL	L_Run_Logger11
;Ducati_logger_events_code.c,98 :: 		}
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
L_Run_Logger11:
;Ducati_logger_events_code.c,99 :: 		}
L_end_Run_Logger:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Run_Logger
_doSetClock:
;Ducati_logger_events_code.c,141 :: 		void doSetClock() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,142 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Ducati_logger_events_code.c,143 :: 		DrawScreen(&Set_clock);
MOVW	R0, #lo_addr(_Set_clock+0)
MOVT	R0, #hi_addr(_Set_clock+0)
BL	_DrawScreen+0
;Ducati_logger_events_code.c,144 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Ducati_logger_events_code.c,145 :: 		RTC_Example_init();
BL	_RTC_Example_init+0
;Ducati_logger_events_code.c,146 :: 		Logger_State = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
STRB	R1, [R0, #0]
;Ducati_logger_events_code.c,148 :: 		}
L_end_doSetClock:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doSetClock
_doCalibration:
;Ducati_logger_events_code.c,151 :: 		void doCalibration(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,152 :: 		Delay_ms(500);
MOVW	R7, #30782
MOVT	R7, #381
NOP
NOP
L_doCalibration18:
SUBS	R7, R7, #1
BNE	L_doCalibration18
NOP
NOP
NOP
;Ducati_logger_events_code.c,153 :: 		Calibrate();
BL	_Calibrate+0
;Ducati_logger_events_code.c,154 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Ducati_logger_events_code.c,155 :: 		DrawScreen(&Settings);
MOVW	R0, #lo_addr(_Settings+0)
MOVT	R0, #hi_addr(_Settings+0)
BL	_DrawScreen+0
;Ducati_logger_events_code.c,156 :: 		}
L_end_doCalibration:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doCalibration
_Box10OnPress:
;Ducati_logger_events_code.c,159 :: 		void Box10OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,160 :: 		HoursTens();
BL	_HoursTens+0
;Ducati_logger_events_code.c,161 :: 		}
L_end_Box10OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box10OnPress
_Box11OnPress:
;Ducati_logger_events_code.c,163 :: 		void Box11OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,164 :: 		HoursOnes();
BL	_HoursOnes+0
;Ducati_logger_events_code.c,165 :: 		}
L_end_Box11OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box11OnPress
_Box3OnPress:
;Ducati_logger_events_code.c,167 :: 		void Box3OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,168 :: 		MinutesTens();
BL	_MinutesTens+0
;Ducati_logger_events_code.c,169 :: 		}
L_end_Box3OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box3OnPress
_Box4OnPress:
;Ducati_logger_events_code.c,171 :: 		void Box4OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,172 :: 		MinutesOnes();
BL	_MinutesOnes+0
;Ducati_logger_events_code.c,173 :: 		}
L_end_Box4OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box4OnPress
_Box5OnPress:
;Ducati_logger_events_code.c,175 :: 		void Box5OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,176 :: 		AmPmRun();
BL	_AmPmRun+0
;Ducati_logger_events_code.c,177 :: 		}
L_end_Box5OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box5OnPress
_Image18OnPress:
;Ducati_logger_events_code.c,179 :: 		void Image18OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,180 :: 		if (Set_MyRTCC() == 0)
BL	_Set_MyRTCC+0
CMP	R0, #0
IT	NE
BNE	L_Image18OnPress20
;Ducati_logger_events_code.c,181 :: 		return;
IT	AL
BAL	L_end_Image18OnPress
L_Image18OnPress20:
;Ducati_logger_events_code.c,182 :: 		Logger_State = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
STRB	R1, [R0, #0]
;Ducati_logger_events_code.c,183 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Ducati_logger_events_code.c,184 :: 		DrawScreen(&Settings);
MOVW	R0, #lo_addr(_Settings+0)
MOVT	R0, #hi_addr(_Settings+0)
BL	_DrawScreen+0
;Ducati_logger_events_code.c,185 :: 		Display_Bat_Stat = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;Ducati_logger_events_code.c,186 :: 		checkPowerM();
BL	_checkPowerM+0
;Ducati_logger_events_code.c,187 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Ducati_logger_events_code.c,188 :: 		}
L_end_Image18OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Image18OnPress
_Box8OnClick:
;Ducati_logger_events_code.c,190 :: 		void Box8OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,191 :: 		Deactivate_All_Rollers();
BL	_Deactivate_All_Rollers+0
;Ducati_logger_events_code.c,192 :: 		}
L_end_Box8OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Box8OnClick
_doNextScreen:
;Ducati_logger_events_code.c,194 :: 		void doNextScreen() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,195 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Ducati_logger_events_code.c,196 :: 		DrawScreen(&Tachometer_graphics);
MOVW	R0, #lo_addr(_Tachometer_graphics+0)
MOVT	R0, #hi_addr(_Tachometer_graphics+0)
BL	_DrawScreen+0
;Ducati_logger_events_code.c,197 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Ducati_logger_events_code.c,198 :: 		Logger_State = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
STRB	R1, [R0, #0]
;Ducati_logger_events_code.c,199 :: 		}
L_end_doNextScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doNextScreen
_doPrevScreen:
;Ducati_logger_events_code.c,201 :: 		void doPrevScreen() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,202 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Ducati_logger_events_code.c,203 :: 		DrawScreen(&Speedometer_graphics);
MOVW	R0, #lo_addr(_Speedometer_graphics+0)
MOVT	R0, #hi_addr(_Speedometer_graphics+0)
BL	_DrawScreen+0
;Ducati_logger_events_code.c,204 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Ducati_logger_events_code.c,205 :: 		Logger_State = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
STRB	R1, [R0, #0]
;Ducati_logger_events_code.c,207 :: 		}
L_end_doPrevScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doPrevScreen
_doLog:
;Ducati_logger_events_code.c,209 :: 		void doLog() {
;Ducati_logger_events_code.c,211 :: 		}
L_end_doLog:
BX	LR
; end of _doLog
_doSettings:
;Ducati_logger_events_code.c,213 :: 		void doSettings() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,214 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Ducati_logger_events_code.c,215 :: 		DrawScreen(&Settings);
MOVW	R0, #lo_addr(_Settings+0)
MOVT	R0, #hi_addr(_Settings+0)
BL	_DrawScreen+0
;Ducati_logger_events_code.c,216 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Ducati_logger_events_code.c,217 :: 		Logger_State = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
STRB	R1, [R0, #0]
;Ducati_logger_events_code.c,219 :: 		}
L_end_doSettings:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doSettings
_doIMUTest:
;Ducati_logger_events_code.c,221 :: 		void doIMUTest() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,222 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Ducati_logger_events_code.c,223 :: 		DrawScreen(&IMU_test);
MOVW	R0, #lo_addr(_IMU_test+0)
MOVT	R0, #hi_addr(_IMU_test+0)
BL	_DrawScreen+0
;Ducati_logger_events_code.c,224 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Ducati_logger_events_code.c,225 :: 		Logger_State = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Logger_State+0)
MOVT	R0, #hi_addr(_Logger_State+0)
STRB	R1, [R0, #0]
;Ducati_logger_events_code.c,226 :: 		doIMU();
BL	_doIMU+0
;Ducati_logger_events_code.c,227 :: 		}
L_end_doIMUTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doIMUTest
_doGPSTest:
;Ducati_logger_events_code.c,229 :: 		void doGPSTest() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,230 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Ducati_logger_events_code.c,231 :: 		DrawScreen(&GPS_test);
MOVW	R0, #lo_addr(_GPS_Test+0)
MOVT	R0, #hi_addr(_GPS_Test+0)
BL	_DrawScreen+0
;Ducati_logger_events_code.c,232 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Ducati_logger_events_code.c,234 :: 		}
L_end_doGPSTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doGPSTest
_doPressureTest:
;Ducati_logger_events_code.c,236 :: 		void doPressureTest() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_events_code.c,237 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Ducati_logger_events_code.c,238 :: 		DrawScreen(&Pressure_test);
MOVW	R0, #lo_addr(_Pressure_test+0)
MOVT	R0, #hi_addr(_Pressure_test+0)
BL	_DrawScreen+0
;Ducati_logger_events_code.c,239 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Ducati_logger_events_code.c,242 :: 		}
L_end_doPressureTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doPressureTest
