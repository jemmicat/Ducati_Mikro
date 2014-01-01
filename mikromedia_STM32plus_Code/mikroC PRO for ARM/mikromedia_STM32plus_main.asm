_Timer4_interrupt:
;mikromedia_STM32plus_main.c,91 :: 		void Timer4_interrupt() iv IVT_INT_TIM4{
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_main.c,92 :: 		TIM4_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_SR+0)
MOVT	R0, #hi_addr(TIM4_SR+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_main.c,94 :: 		Timer4_SoftPWM_ISR();
BL	_Timer4_SoftPWM_ISR+0
;mikromedia_STM32plus_main.c,95 :: 		}
L_end_Timer4_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer4_interrupt
_Timer2_interrupt:
;mikromedia_STM32plus_main.c,101 :: 		void Timer2_interrupt() iv IVT_INT_TIM2 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_main.c,103 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_main.c,105 :: 		TIM2_CR1.CEN = 0;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_main.c,106 :: 		TIMER2_IRQ();
BL	_TIMER2_IRQ+0
;mikromedia_STM32plus_main.c,107 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_main.c,108 :: 		}
L_end_Timer2_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer2_interrupt
_ExtInt:
;mikromedia_STM32plus_main.c,114 :: 		void ExtInt() iv IVT_INT_EXTI15_10 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_main.c,116 :: 		EXTI_PR.B10 = 1;                      // clear flag
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_main.c,117 :: 		nRF24L01_IRQ();
BL	_nRF24L01_IRQ+0
;mikromedia_STM32plus_main.c,118 :: 		}
L_end_ExtInt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ExtInt
_Timer5_interrupt:
;mikromedia_STM32plus_main.c,125 :: 		void Timer5_interrupt() iv IVT_INT_TIM5 {
;mikromedia_STM32plus_main.c,126 :: 		TIM5_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_SR+0)
MOVT	R0, #hi_addr(TIM5_SR+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_main.c,129 :: 		TTT_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TTT_flag+0)
MOVT	R0, #hi_addr(_TTT_flag+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_main.c,131 :: 		}
L_end_Timer5_interrupt:
BX	LR
; end of _Timer5_interrupt
_main:
;mikromedia_STM32plus_main.c,136 :: 		void main() {
;mikromedia_STM32plus_main.c,137 :: 		Start_TP();
BL	_Start_TP+0
;mikromedia_STM32plus_main.c,139 :: 		Init_GPIO();
BL	_Init_GPIO+0
;mikromedia_STM32plus_main.c,140 :: 		Init_SDIO();
BL	_Init_SDIO+0
;mikromedia_STM32plus_main.c,141 :: 		Init_FAT();
BL	_Init_FAT+0
;mikromedia_STM32plus_main.c,142 :: 		RTC_Init();
BL	_RTC_Init+0
;mikromedia_STM32plus_main.c,144 :: 		while (1) {
L_main0:
;mikromedia_STM32plus_main.c,145 :: 		DisableInterrupts();
BL	_DisableInterrupts+0
;mikromedia_STM32plus_main.c,146 :: 		Check_TP();
BL	_Check_TP+0
;mikromedia_STM32plus_main.c,147 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;mikromedia_STM32plus_main.c,148 :: 		Run_Example();
BL	_Run_Example+0
;mikromedia_STM32plus_main.c,149 :: 		}
IT	AL
BAL	L_main0
;mikromedia_STM32plus_main.c,150 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
