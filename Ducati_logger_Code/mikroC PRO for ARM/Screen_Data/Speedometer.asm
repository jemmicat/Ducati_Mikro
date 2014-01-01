_Start_Speedometer:
;Speedometer.c,9 :: 		void Start_Speedometer() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Speedometer.c,11 :: 		DrawScreen(&Speedometer_graphics);
MOVW	R0, #lo_addr(_Speedometer_graphics+0)
MOVT	R0, #hi_addr(_Speedometer_graphics+0)
BL	_DrawScreen+0
;Speedometer.c,12 :: 		checkRTC();
BL	_checkRTC+0
;Speedometer.c,13 :: 		checkPowerM();
BL	_checkPowerM+0
;Speedometer.c,15 :: 		}
L_end_Start_Speedometer:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Start_Speedometer
