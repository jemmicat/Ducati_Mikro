_Timer4_interrupt:
;mikromedia_STM32plus_main.c,93 :: 		void Timer4_interrupt() iv IVT_INT_TIM4{
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_main.c,94 :: 		TIM4_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_SR+0)
MOVT	R0, #hi_addr(TIM4_SR+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_main.c,96 :: 		Timer4_SoftPWM_ISR();
BL	_Timer4_SoftPWM_ISR+0
;mikromedia_STM32plus_main.c,97 :: 		}
L_end_Timer4_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer4_interrupt
_Timer2_interrupt:
;mikromedia_STM32plus_main.c,103 :: 		void Timer2_interrupt() iv IVT_INT_TIM2 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_main.c,105 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_main.c,107 :: 		TIM2_CR1.CEN = 0;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_main.c,108 :: 		TIMER2_IRQ();
BL	_TIMER2_IRQ+0
;mikromedia_STM32plus_main.c,109 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_main.c,110 :: 		}
L_end_Timer2_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer2_interrupt
_ExtInt:
;mikromedia_STM32plus_main.c,116 :: 		void ExtInt() iv IVT_INT_EXTI15_10 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_main.c,118 :: 		EXTI_PR.B10 = 1;                      // clear flag
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_main.c,119 :: 		nRF24L01_IRQ();
BL	_nRF24L01_IRQ+0
;mikromedia_STM32plus_main.c,120 :: 		}
L_end_ExtInt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ExtInt
_Timer5_interrupt:
;mikromedia_STM32plus_main.c,127 :: 		void Timer5_interrupt() iv IVT_INT_TIM5 {
;mikromedia_STM32plus_main.c,128 :: 		TIM5_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_SR+0)
MOVT	R0, #hi_addr(TIM5_SR+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_main.c,130 :: 		TicTacToe_seconds_cnt ++;
MOVW	R1, #lo_addr(_TicTacToe_seconds_cnt+0)
MOVT	R1, #hi_addr(_TicTacToe_seconds_cnt+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;mikromedia_STM32plus_main.c,131 :: 		TTT_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TTT_flag+0)
MOVT	R0, #hi_addr(_TTT_flag+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_main.c,133 :: 		}
L_end_Timer5_interrupt:
BX	LR
; end of _Timer5_interrupt
_main:
;mikromedia_STM32plus_main.c,138 :: 		void main() {
;mikromedia_STM32plus_main.c,139 :: 		Start_TP();
BL	_Start_TP+0
;mikromedia_STM32plus_main.c,141 :: 		Init_GPIO();
BL	_Init_GPIO+0
;mikromedia_STM32plus_main.c,142 :: 		Init_SDIO();
BL	_Init_SDIO+0
;mikromedia_STM32plus_main.c,143 :: 		Init_FAT();
BL	_Init_FAT+0
;mikromedia_STM32plus_main.c,144 :: 		RTC_Init();
BL	_RTC_Init+0
;mikromedia_STM32plus_main.c,146 :: 		while (1) {
L_main0:
;mikromedia_STM32plus_main.c,147 :: 		DisableInterrupts();
BL	_DisableInterrupts+0
;mikromedia_STM32plus_main.c,148 :: 		Check_TP();
BL	_Check_TP+0
;mikromedia_STM32plus_main.c,149 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;mikromedia_STM32plus_main.c,150 :: 		Run_Example();
BL	_Run_Example+0
;mikromedia_STM32plus_main.c,151 :: 		}
IT	AL
BAL	L_main0
;mikromedia_STM32plus_main.c,152 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
