_main:
;Ducati_logger_main.c,44 :: 		void main() {
;Ducati_logger_main.c,46 :: 		Start_TP();
BL	_Start_TP+0
;Ducati_logger_main.c,48 :: 		Init_GPIO();
BL	_Init_GPIO+0
;Ducati_logger_main.c,49 :: 		Init_SDIO();
BL	_Init_SDIO+0
;Ducati_logger_main.c,50 :: 		Init_Ext_Mem();
BL	_Init_Ext_Mem+0
;Ducati_logger_main.c,51 :: 		Init_FAT();
BL	_Init_FAT+0
;Ducati_logger_main.c,52 :: 		RTC_Init();
BL	_RTC_Init+0
;Ducati_logger_main.c,54 :: 		while (1) {
L_main0:
;Ducati_logger_main.c,55 :: 		DisableInterrupts();
BL	_DisableInterrupts+0
;Ducati_logger_main.c,56 :: 		Check_TP();
BL	_Check_TP+0
;Ducati_logger_main.c,57 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Ducati_logger_main.c,60 :: 		Run_logger();
BL	_Run_logger+0
;Ducati_logger_main.c,62 :: 		}
IT	AL
BAL	L_main0
;Ducati_logger_main.c,63 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
