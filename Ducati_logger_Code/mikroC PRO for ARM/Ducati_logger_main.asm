_main:
;Ducati_logger_main.c,29 :: 		void main() {
;Ducati_logger_main.c,31 :: 		Init_GPIO();
BL	_Init_GPIO+0
;Ducati_logger_main.c,32 :: 		ADXL345_Init();
BL	_ADXL345_Init+0
;Ducati_logger_main.c,33 :: 		ITG3200_Init();
BL	_ITG3200_Init+0
;Ducati_logger_main.c,35 :: 		RTC_Init();
BL	_RTC_Init+0
;Ducati_logger_main.c,36 :: 		Start_TP();
BL	_Start_TP+0
;Ducati_logger_main.c,39 :: 		while (1) {
L_main0:
;Ducati_logger_main.c,40 :: 		DisableInterrupts();
BL	_DisableInterrupts+0
;Ducati_logger_main.c,41 :: 		Check_TP();
BL	_Check_TP+0
;Ducati_logger_main.c,42 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Ducati_logger_main.c,43 :: 		}
IT	AL
BAL	L_main0
;Ducati_logger_main.c,44 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
