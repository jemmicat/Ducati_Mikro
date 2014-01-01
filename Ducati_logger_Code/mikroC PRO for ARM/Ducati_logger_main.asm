_main:
;Ducati_logger_main.c,27 :: 		void main() {
;Ducati_logger_main.c,29 :: 		Init_GPIO();
BL	_Init_GPIO+0
;Ducati_logger_main.c,31 :: 		RTC_Init();
BL	_RTC_Init+0
;Ducati_logger_main.c,32 :: 		Start_TP();
BL	_Start_TP+0
;Ducati_logger_main.c,35 :: 		while (1) {
L_main0:
;Ducati_logger_main.c,36 :: 		DisableInterrupts();
BL	_DisableInterrupts+0
;Ducati_logger_main.c,37 :: 		Check_TP();
BL	_Check_TP+0
;Ducati_logger_main.c,38 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Ducati_logger_main.c,39 :: 		}
IT	AL
BAL	L_main0
;Ducati_logger_main.c,40 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
