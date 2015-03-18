_InitTimer2:
;Ducati_logger_main.c,48 :: 		void InitTimer2(){
;Ducati_logger_main.c,49 :: 		RCC_APB1ENR.TIM2EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Ducati_logger_main.c,50 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Ducati_logger_main.c,51 :: 		TIM2_PSC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Ducati_logger_main.c,52 :: 		TIM2_ARR = 6000;
MOVW	R1, #6000
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Ducati_logger_main.c,53 :: 		}
L_end_InitTimer2:
BX	LR
; end of _InitTimer2
_Timer2_interrupt:
;Ducati_logger_main.c,55 :: 		void Timer2_interrupt() iv IVT_INT_TIM2 {
;Ducati_logger_main.c,56 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Ducati_logger_main.c,57 :: 		tmrTicks++;
MOVW	R1, #lo_addr(_tmrTicks+0)
MOVT	R1, #hi_addr(_tmrTicks+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Ducati_logger_main.c,58 :: 		}
L_end_Timer2_interrupt:
BX	LR
; end of _Timer2_interrupt
_Timer2_On:
;Ducati_logger_main.c,60 :: 		void Timer2_On(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_main.c,61 :: 		NVIC_IntEnable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Ducati_logger_main.c,62 :: 		TIM2_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Ducati_logger_main.c,63 :: 		TIM2_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Ducati_logger_main.c,64 :: 		}
L_end_Timer2_On:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer2_On
_Timer2_Off:
;Ducati_logger_main.c,66 :: 		void Timer2_Off() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_main.c,67 :: 		NVIC_IntDisable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntDisable+0
;Ducati_logger_main.c,68 :: 		TIM2_DIER.UIE = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Ducati_logger_main.c,69 :: 		TIM2_CR1.CEN = 0;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Ducati_logger_main.c,70 :: 		}
L_end_Timer2_Off:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer2_Off
_main:
;Ducati_logger_main.c,72 :: 		void main() {
;Ducati_logger_main.c,74 :: 		Start_TP();
BL	_Start_TP+0
;Ducati_logger_main.c,76 :: 		Init_GPIO();
BL	_Init_GPIO+0
;Ducati_logger_main.c,77 :: 		Init_SDIO();
BL	_Init_SDIO+0
;Ducati_logger_main.c,78 :: 		Init_Ext_Mem();
BL	_Init_Ext_Mem+0
;Ducati_logger_main.c,79 :: 		Init_FAT();
BL	_Init_FAT+0
;Ducati_logger_main.c,80 :: 		RTC_Init();
BL	_RTC_Init+0
;Ducati_logger_main.c,82 :: 		I2C2_Init_Advanced(400000, &_GPIO_MODULE_I2C2_PF01);
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C2_PF01+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C2_PF01+0)
MOVW	R0, #6784
MOVT	R0, #6
BL	_I2C2_Init_Advanced+0
;Ducati_logger_main.c,83 :: 		MPU9150A_FSY = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;Ducati_logger_main.c,84 :: 		MPU9150A_Init();
BL	_MPU9150A_Init+0
;Ducati_logger_main.c,85 :: 		MPU9150A_Detect();
BL	_MPU9150A_Detect+0
;Ducati_logger_main.c,86 :: 		MAG_Detect();
BL	_MAG_Detect+0
;Ducati_logger_main.c,87 :: 		tmrTicks = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_tmrTicks+0)
MOVT	R0, #hi_addr(_tmrTicks+0)
STRH	R1, [R0, #0]
;Ducati_logger_main.c,88 :: 		initTimer2();
BL	_InitTimer2+0
;Ducati_logger_main.c,89 :: 		Timer2_On();
BL	_Timer2_On+0
;Ducati_logger_main.c,90 :: 		MPU9150A_Read(); //initial read
BL	_MPU9150A_Read+0
;Ducati_logger_main.c,91 :: 		delay_ms(10);
MOVW	R7, #41246
MOVT	R7, #7
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
NOP
;Ducati_logger_main.c,93 :: 		while (1) {
L_main2:
;Ducati_logger_main.c,94 :: 		DisableInterrupts();
BL	_DisableInterrupts+0
;Ducati_logger_main.c,95 :: 		Check_TP();
BL	_Check_TP+0
;Ducati_logger_main.c,96 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Ducati_logger_main.c,99 :: 		Run_logger();
BL	_Run_logger+0
;Ducati_logger_main.c,101 :: 		}
IT	AL
BAL	L_main2
;Ducati_logger_main.c,102 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
