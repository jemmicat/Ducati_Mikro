_InitTimer5:
;Tic_Tac_Toe.c,42 :: 		void InitTimer5(){
;Tic_Tac_Toe.c,43 :: 		RCC_APB1ENR.TIM5EN = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R2, [R0, #0]
;Tic_Tac_Toe.c,44 :: 		TIM5_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_CR1+0)
MOVT	R0, #hi_addr(TIM5_CR1+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,45 :: 		TIM5_PSC = 1199;
MOVW	R1, #1199
MOVW	R0, #lo_addr(TIM5_PSC+0)
MOVT	R0, #hi_addr(TIM5_PSC+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,46 :: 		TIM5_ARR = 62500;
MOVW	R1, #62500
MOVW	R0, #lo_addr(TIM5_ARR+0)
MOVT	R0, #hi_addr(TIM5_ARR+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,48 :: 		TIM5_DIER.UIE = 1;
MOVW	R0, #lo_addr(TIM5_DIER+0)
MOVT	R0, #hi_addr(TIM5_DIER+0)
STR	R2, [R0, #0]
;Tic_Tac_Toe.c,49 :: 		TIM5_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM5_CR1+0)
MOVT	R0, #hi_addr(TIM5_CR1+0)
STR	R2, [R0, #0]
;Tic_Tac_Toe.c,50 :: 		}
L_end_InitTimer5:
BX	LR
; end of _InitTimer5
_InitTimer2:
;Tic_Tac_Toe.c,59 :: 		void InitTimer2(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Tic_Tac_Toe.c,61 :: 		RCC_APB1ENR.TIM2EN = 1;       // Enable clock gating for timer module 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,62 :: 		TIM2_CR1.CEN = 0;             // Disable timer
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,63 :: 		TIM2_PSC = 0;                 // Set timer prescaler.
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,64 :: 		TIM2_ARR = 1200;
MOVW	R1, #1200
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,65 :: 		NVIC_IntEnable(IVT_INT_TIM2); // Enable timer interrupt
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Tic_Tac_Toe.c,66 :: 		TIM2_DIER.UIE = 1;            // Update interrupt enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,68 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,69 :: 		}
L_end_InitTimer2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimer2
_InitExt:
;Tic_Tac_Toe.c,77 :: 		void InitExt(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Tic_Tac_Toe.c,78 :: 		SYSCFGEN_bit = 1;                    // Enable clock for alternate pin functions
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SYSCFGEN_bit+0)
MOVT	R0, #hi_addr(SYSCFGEN_bit+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,79 :: 		SYSCFG_EXTICR3 = 0x00000600;         // Map external interrupt on PG10
MOVW	R1, #1536
MOVW	R0, #lo_addr(SYSCFG_EXTICR3+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR3+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,80 :: 		EXTI_RTSR = 0x00000000;              // Set interrupt on Rising edge (none)
MOVS	R1, #0
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,81 :: 		EXTI_FTSR = 0x00000400;              // Set Interrupt on Falling edge (PG10)
MOVW	R1, #1024
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,82 :: 		EXTI_IMR |= 0x00000400;              // Set mask
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,84 :: 		NVIC_IntEnable(IVT_INT_EXTI15_10);   // Enable External interrupt
MOVW	R0, #56
BL	_NVIC_IntEnable+0
;Tic_Tac_Toe.c,85 :: 		}
L_end_InitExt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitExt
_InitRF:
;Tic_Tac_Toe.c,94 :: 		void InitRF(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Tic_Tac_Toe.c,96 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4);
MOVS	R1, #24
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;Tic_Tac_Toe.c,97 :: 		GPIO_Digital_Output(&GPIOG_BASE, _GPIO_PINMASK_15);
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOG_BASE+0)
MOVT	R0, #hi_addr(GPIOG_BASE+0)
BL	_GPIO_Digital_Output+0
;Tic_Tac_Toe.c,99 :: 		nRF_CE = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(nRF_CE+0)
MOVT	R0, #hi_addr(nRF_CE+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,100 :: 		nRF_CS = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(nRF_CS+0)
MOVT	R0, #hi_addr(nRF_CS+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,102 :: 		InitTimer2();
BL	_InitTimer2+0
;Tic_Tac_Toe.c,103 :: 		InitExt();
BL	_InitExt+0
;Tic_Tac_Toe.c,109 :: 		&_GPIO_MODULE_SPI2_PB13_14_15);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI2_PB13_14_15+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI2_PB13_14_15+0)
;Tic_Tac_Toe.c,108 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
MOVW	R1, #772
;Tic_Tac_Toe.c,106 :: 		SPI2_Init_Advanced(_SPI_FPCLK_DIV16, _SPI_MASTER  | _SPI_8_BIT |
MOVS	R0, #3
;Tic_Tac_Toe.c,109 :: 		&_GPIO_MODULE_SPI2_PB13_14_15);
BL	_SPI2_Init_Advanced+0
;Tic_Tac_Toe.c,110 :: 		}
L_end_InitRF:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitRF
_Start_nRF:
;Tic_Tac_Toe.c,119 :: 		void Start_nRF(){
SUB	SP, SP, #16
STR	LR, [SP, #0]
;Tic_Tac_Toe.c,121 :: 		rfConfig.autoTransmitDelay = nRF_AUTO_RETRANSMIT_DELAY_4000us;
MOVS	R1, #240
MOVW	R0, #lo_addr(_rfConfig+0)
MOVT	R0, #hi_addr(_rfConfig+0)
STRB	R1, [R0, #0]
;Tic_Tac_Toe.c,122 :: 		rfConfig.autoTransmitCount = nRF_AUTO_RETRANSMIT_COUNT_05;
MOVS	R1, #5
MOVW	R0, #lo_addr(_rfConfig+1)
MOVT	R0, #hi_addr(_rfConfig+1)
STRB	R1, [R0, #0]
;Tic_Tac_Toe.c,123 :: 		rfConfig.channel           = 64;
MOVS	R1, #64
MOVW	R0, #lo_addr(_rfConfig+2)
MOVT	R0, #hi_addr(_rfConfig+2)
STR	R0, [SP, #12]
STRB	R1, [R0, #0]
;Tic_Tac_Toe.c,124 :: 		rfConfig.outputPower       = nRF_OUTPUT_POWER_0dBm;
MOVS	R1, #6
MOVW	R0, #lo_addr(_rfConfig+3)
MOVT	R0, #hi_addr(_rfConfig+3)
STR	R0, [SP, #8]
STRB	R1, [R0, #0]
;Tic_Tac_Toe.c,125 :: 		rfConfig.dataRate          = nRF_DATA_RATE_1Mbps;
MOVS	R1, #0
MOVW	R0, #lo_addr(_rfConfig+4)
MOVT	R0, #hi_addr(_rfConfig+4)
STR	R0, [SP, #4]
STRB	R1, [R0, #0]
;Tic_Tac_Toe.c,128 :: 		nRF_Init();
BL	_nRF_Init+0
;Tic_Tac_Toe.c,129 :: 		InitRF();
BL	_InitRF+0
;Tic_Tac_Toe.c,130 :: 		Delay_ms(100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_Start_nRF0:
SUBS	R7, R7, #1
BNE	L_Start_nRF0
NOP
NOP
NOP
;Tic_Tac_Toe.c,132 :: 		rfState = RF_STOP;
MOVS	R1, #1
MOVW	R0, #lo_addr(_rfState+0)
MOVT	R0, #hi_addr(_rfState+0)
STRB	R1, [R0, #0]
;Tic_Tac_Toe.c,134 :: 		nRF_RX_Mode_Init_Advanced(rfConfig.dataRate, rfConfig.outputPower, rfConfig.channel);
LDR	R0, [SP, #12]
LDRB	R2, [R0, #0]
LDR	R0, [SP, #8]
LDRB	R1, [R0, #0]
LDR	R0, [SP, #4]
LDRB	R0, [R0, #0]
BL	_nRF_RX_Mode_Init_Advanced+0
;Tic_Tac_Toe.c,137 :: 		InitTimer5();
BL	_InitTimer5+0
;Tic_Tac_Toe.c,138 :: 		NVIC_IntDisable(IVT_INT_TIM5);
MOVW	R0, #66
BL	_NVIC_IntDisable+0
;Tic_Tac_Toe.c,140 :: 		if (RF_used == 1)
MOVW	R0, #lo_addr(_RF_used+0)
MOVT	R0, #hi_addr(_RF_used+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Start_nRF2
;Tic_Tac_Toe.c,141 :: 		RF_used = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RF_used+0)
MOVT	R0, #hi_addr(_RF_used+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_Start_nRF3
L_Start_nRF2:
;Tic_Tac_Toe.c,143 :: 		RF_used = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RF_used+0)
MOVT	R0, #hi_addr(_RF_used+0)
STRB	R1, [R0, #0]
L_Start_nRF3:
;Tic_Tac_Toe.c,144 :: 		}
L_end_Start_nRF:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _Start_nRF
_ToneA:
;Tic_Tac_Toe.c,211 :: 		void ToneA() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Tic_Tac_Toe.c,212 :: 		Sound_Play( 880, 50);
MOVS	R1, #50
MOVW	R0, #880
BL	_Sound_Play+0
;Tic_Tac_Toe.c,213 :: 		}
L_end_ToneA:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ToneA
_ToneC:
;Tic_Tac_Toe.c,214 :: 		void ToneC() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Tic_Tac_Toe.c,215 :: 		Sound_Play(1046, 50);
MOVS	R1, #50
MOVW	R0, #1046
BL	_Sound_Play+0
;Tic_Tac_Toe.c,216 :: 		}
L_end_ToneC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ToneC
_ToneE:
;Tic_Tac_Toe.c,217 :: 		void ToneE() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Tic_Tac_Toe.c,218 :: 		Sound_Play(1318, 50);
MOVS	R1, #50
MOVW	R0, #1318
BL	_Sound_Play+0
;Tic_Tac_Toe.c,219 :: 		}
L_end_ToneE:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ToneE
_LED_Move:
;Tic_Tac_Toe.c,221 :: 		void LED_Move(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Tic_Tac_Toe.c,222 :: 		Sound_Play(1318, 50);
MOVS	R1, #50
MOVW	R0, #1318
BL	_Sound_Play+0
;Tic_Tac_Toe.c,223 :: 		Sound_Play(1567, 50);
MOVS	R1, #50
MOVW	R0, #1567
BL	_Sound_Play+0
;Tic_Tac_Toe.c,224 :: 		}
L_end_LED_Move:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LED_Move
_LED_Victory_Blink:
;Tic_Tac_Toe.c,226 :: 		void LED_Victory_Blink(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Tic_Tac_Toe.c,228 :: 		for (i = 0; i < 5; i ++){
; i start address is: 24 (R6)
MOVS	R6, #0
; i end address is: 24 (R6)
L_LED_Victory_Blink4:
; i start address is: 24 (R6)
CMP	R6, #5
IT	CS
BCS	L_LED_Victory_Blink5
;Tic_Tac_Toe.c,229 :: 		LED_R = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(LED_R+0)
MOVT	R0, #hi_addr(LED_R+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,230 :: 		ToneA();
BL	_ToneA+0
;Tic_Tac_Toe.c,231 :: 		Delay_ms(20);
MOVW	R7, #16958
MOVT	R7, #15
NOP
NOP
L_LED_Victory_Blink7:
SUBS	R7, R7, #1
BNE	L_LED_Victory_Blink7
NOP
NOP
NOP
;Tic_Tac_Toe.c,232 :: 		LED_R = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(LED_R+0)
MOVT	R0, #hi_addr(LED_R+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,233 :: 		LED_G = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(LED_G+0)
MOVT	R0, #hi_addr(LED_G+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,234 :: 		ToneC();
BL	_ToneC+0
;Tic_Tac_Toe.c,235 :: 		Delay_ms(20);
MOVW	R7, #16958
MOVT	R7, #15
NOP
NOP
L_LED_Victory_Blink9:
SUBS	R7, R7, #1
BNE	L_LED_Victory_Blink9
NOP
NOP
NOP
;Tic_Tac_Toe.c,236 :: 		LED_G = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(LED_G+0)
MOVT	R0, #hi_addr(LED_G+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,237 :: 		LED_B = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(LED_B+0)
MOVT	R0, #hi_addr(LED_B+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,238 :: 		ToneE();
BL	_ToneE+0
;Tic_Tac_Toe.c,239 :: 		Delay_ms(20);
MOVW	R7, #16958
MOVT	R7, #15
NOP
NOP
L_LED_Victory_Blink11:
SUBS	R7, R7, #1
BNE	L_LED_Victory_Blink11
NOP
NOP
NOP
;Tic_Tac_Toe.c,228 :: 		for (i = 0; i < 5; i ++){
ADDS	R6, R6, #1
UXTB	R6, R6
;Tic_Tac_Toe.c,240 :: 		}
; i end address is: 24 (R6)
IT	AL
BAL	L_LED_Victory_Blink4
L_LED_Victory_Blink5:
;Tic_Tac_Toe.c,241 :: 		LED_B = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(LED_B+0)
MOVT	R0, #hi_addr(LED_B+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,242 :: 		}
L_end_LED_Victory_Blink:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LED_Victory_Blink
_doTicTacToeISR:
;Tic_Tac_Toe.c,251 :: 		void doTicTacToeISR(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Tic_Tac_Toe.c,252 :: 		Label39_Caption[6] = (TicTacToe_seconds_cnt / 60) / 10 + 48;
MOVW	R3, #lo_addr(_TicTacToe_seconds_cnt+0)
MOVT	R3, #hi_addr(_TicTacToe_seconds_cnt+0)
LDRH	R1, [R3, #0]
MOVS	R0, #60
UDIV	R2, R1, R0
UXTH	R2, R2
MOVS	R0, #10
UDIV	R0, R2, R0
UXTH	R0, R0
ADDW	R1, R0, #48
MOVW	R0, #lo_addr(_Label39_Caption+6)
MOVT	R0, #hi_addr(_Label39_Caption+6)
STRB	R1, [R0, #0]
;Tic_Tac_Toe.c,253 :: 		Label39_Caption[7] = (TicTacToe_seconds_cnt / 60) % 10 + 48;
MOVS	R1, #10
UDIV	R0, R2, R1
MLS	R0, R1, R0, R2
UXTH	R0, R0
ADDW	R1, R0, #48
MOVW	R0, #lo_addr(_Label39_Caption+7)
MOVT	R0, #hi_addr(_Label39_Caption+7)
STRB	R1, [R0, #0]
;Tic_Tac_Toe.c,254 :: 		Label39_Caption[9] = (TicTacToe_seconds_cnt % 60) / 10 + 48;
MOV	R0, R3
LDRH	R1, [R0, #0]
MOVS	R0, #60
UDIV	R2, R1, R0
MLS	R2, R0, R2, R1
UXTH	R2, R2
MOVS	R0, #10
UDIV	R0, R2, R0
UXTH	R0, R0
ADDW	R1, R0, #48
MOVW	R0, #lo_addr(_Label39_Caption+9)
MOVT	R0, #hi_addr(_Label39_Caption+9)
STRB	R1, [R0, #0]
;Tic_Tac_Toe.c,255 :: 		Label39_Caption[10] = (TicTacToe_seconds_cnt % 60) % 10 + 48;
MOVS	R1, #10
UDIV	R0, R2, R1
MLS	R0, R1, R0, R2
UXTH	R0, R0
ADDW	R1, R0, #48
MOVW	R0, #lo_addr(_Label39_Caption+10)
MOVT	R0, #hi_addr(_Label39_Caption+10)
STRB	R1, [R0, #0]
;Tic_Tac_Toe.c,256 :: 		RedrawLabel(Box8.Color, &Label39, 100, 22);
MOVW	R0, #lo_addr(_Box8+28)
MOVT	R0, #hi_addr(_Box8+28)
LDRH	R0, [R0, #0]
MOVS	R3, #22
MOVS	R2, #100
MOVW	R1, #lo_addr(_Label39+0)
MOVT	R1, #hi_addr(_Label39+0)
BL	_RedrawLabel+0
;Tic_Tac_Toe.c,257 :: 		}
L_end_doTicTacToeISR:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doTicTacToeISR
_UpdateLabel38:
;Tic_Tac_Toe.c,266 :: 		void UpdateLabel38(char *text, unsigned int color){
; color start address is: 4 (R1)
; text start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; color end address is: 4 (R1)
; text end address is: 0 (R0)
; text start address is: 0 (R0)
; color start address is: 4 (R1)
;Tic_Tac_Toe.c,267 :: 		Label38.Font_Color = color;
MOVW	R2, #lo_addr(_Label38+24)
MOVT	R2, #hi_addr(_Label38+24)
STRH	R1, [R2, #0]
; color end address is: 4 (R1)
;Tic_Tac_Toe.c,268 :: 		Label38.Caption = text;
MOVW	R2, #lo_addr(_Label38+16)
MOVT	R2, #hi_addr(_Label38+16)
STR	R0, [R2, #0]
; text end address is: 0 (R0)
;Tic_Tac_Toe.c,269 :: 		RedrawLabel(Box8.Color, &Label38, 120, 50);
MOVW	R2, #lo_addr(_Box8+28)
MOVT	R2, #hi_addr(_Box8+28)
LDRH	R2, [R2, #0]
MOVS	R3, #50
MOVW	R1, #lo_addr(_Label38+0)
MOVT	R1, #hi_addr(_Label38+0)
UXTH	R0, R2
MOVS	R2, #120
BL	_RedrawLabel+0
;Tic_Tac_Toe.c,270 :: 		}
L_end_UpdateLabel38:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _UpdateLabel38
_doTicTacToe:
;Tic_Tac_Toe.c,281 :: 		void doTicTacToe(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Tic_Tac_Toe.c,283 :: 		if (TTT_flag){
MOVW	R0, #lo_addr(_TTT_flag+0)
MOVT	R0, #hi_addr(_TTT_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_doTicTacToe13
;Tic_Tac_Toe.c,284 :: 		doTicTacToeISR();
BL	_doTicTacToeISR+0
;Tic_Tac_Toe.c,285 :: 		TTT_flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TTT_flag+0)
MOVT	R0, #hi_addr(_TTT_flag+0)
STRB	R1, [R0, #0]
;Tic_Tac_Toe.c,286 :: 		}
L_doTicTacToe13:
;Tic_Tac_Toe.c,288 :: 		if (RF_used == 1){
MOVW	R0, #lo_addr(_RF_used+0)
MOVT	R0, #hi_addr(_RF_used+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_doTicTacToe14
;Tic_Tac_Toe.c,290 :: 		if (nRF_Receive_Packet()){
BL	_nRF_Receive_Packet+0
CMP	R0, #0
IT	EQ
BEQ	L_doTicTacToe15
;Tic_Tac_Toe.c,291 :: 		LED_B = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(LED_B+0)
MOVT	R0, #hi_addr(LED_B+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,292 :: 		nRF_Process(&nRFStatus);
MOVW	R0, #lo_addr(_nRFStatus+0)
MOVT	R0, #hi_addr(_nRFStatus+0)
BL	_nRF_Process+0
;Tic_Tac_Toe.c,293 :: 		LED_B = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(LED_B+0)
MOVT	R0, #hi_addr(LED_B+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,294 :: 		if(nRFStatus._status == nRF_RX_DR){
MOVW	R0, #lo_addr(_nRFStatus+0)
MOVT	R0, #hi_addr(_nRFStatus+0)
LDRB	R0, [R0, #0]
CMP	R0, #64
IT	NE
BNE	L_doTicTacToe16
;Tic_Tac_Toe.c,295 :: 		XO_Process_Packet(RX_pload);
MOVW	R0, #lo_addr(_RX_pload+0)
MOVT	R0, #hi_addr(_RX_pload+0)
BL	_XO_Process_Packet+0
;Tic_Tac_Toe.c,296 :: 		}
L_doTicTacToe16:
;Tic_Tac_Toe.c,297 :: 		LED_B = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(LED_B+0)
MOVT	R0, #hi_addr(LED_B+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,298 :: 		}
L_doTicTacToe15:
;Tic_Tac_Toe.c,300 :: 		if (RF_Send_Failed == 1){
MOVW	R0, #lo_addr(_RF_Send_Failed+0)
MOVT	R0, #hi_addr(_RF_Send_Failed+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_doTicTacToe17
;Tic_Tac_Toe.c,301 :: 		if (RF_cnt > 1250){
MOVW	R0, #lo_addr(_RF_cnt+0)
MOVT	R0, #hi_addr(_RF_cnt+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #1250
CMP	R1, R0
IT	LE
BLE	L_doTicTacToe18
;Tic_Tac_Toe.c,302 :: 		LED_B = ~LED_B;
MOVW	R1, #lo_addr(LED_B+0)
MOVT	R1, #hi_addr(LED_B+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;Tic_Tac_Toe.c,303 :: 		if (RF_Send_Move() == 0)
BL	_RF_Send_Move+0
CMP	R0, #0
IT	NE
BNE	L_doTicTacToe19
;Tic_Tac_Toe.c,304 :: 		RF_Send_Failed = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RF_Send_Failed+0)
MOVT	R0, #hi_addr(_RF_Send_Failed+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_doTicTacToe20
L_doTicTacToe19:
;Tic_Tac_Toe.c,306 :: 		RF_Send_Failed = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RF_Send_Failed+0)
MOVT	R0, #hi_addr(_RF_Send_Failed+0)
STRB	R1, [R0, #0]
;Tic_Tac_Toe.c,307 :: 		LED_B = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(LED_B+0)
MOVT	R0, #hi_addr(LED_B+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,308 :: 		}
L_doTicTacToe20:
;Tic_Tac_Toe.c,309 :: 		Delay_ms(10);
MOVW	R7, #41246
MOVT	R7, #7
NOP
NOP
L_doTicTacToe21:
SUBS	R7, R7, #1
BNE	L_doTicTacToe21
NOP
NOP
NOP
;Tic_Tac_Toe.c,310 :: 		nRF_RX_Mode_Init(64);
MOVS	R0, #64
BL	_nRF_RX_Mode_Init+0
;Tic_Tac_Toe.c,311 :: 		RF_cnt = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_RF_cnt+0)
MOVT	R0, #hi_addr(_RF_cnt+0)
STRH	R1, [R0, #0]
;Tic_Tac_Toe.c,312 :: 		}
IT	AL
BAL	L_doTicTacToe23
L_doTicTacToe18:
;Tic_Tac_Toe.c,314 :: 		RF_cnt ++;
MOVW	R1, #lo_addr(_RF_cnt+0)
MOVT	R1, #hi_addr(_RF_cnt+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
L_doTicTacToe23:
;Tic_Tac_Toe.c,315 :: 		}
L_doTicTacToe17:
;Tic_Tac_Toe.c,316 :: 		}
L_doTicTacToe14:
;Tic_Tac_Toe.c,317 :: 		}
L_end_doTicTacToe:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doTicTacToe
_RF_Send_Move:
;Tic_Tac_Toe.c,326 :: 		char RF_Send_Move(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Tic_Tac_Toe.c,329 :: 		char attempts = 0;
MOVS	R0, #0
STRB	R0, [SP, #4]
;Tic_Tac_Toe.c,331 :: 		LED_B = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(LED_B+0)
MOVT	R0, #hi_addr(LED_B+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,333 :: 		nRF_TX_Mode_Init(64);
MOVS	R0, #64
BL	_nRF_TX_Mode_Init+0
;Tic_Tac_Toe.c,334 :: 		pMat = (char*)XO_matrix;
; pMat start address is: 16 (R4)
MOVW	R4, #lo_addr(Tic_Tac_Toe_XO_matrix+0)
MOVT	R4, #hi_addr(Tic_Tac_Toe_XO_matrix+0)
;Tic_Tac_Toe.c,335 :: 		TX_pload[0] = XO_ID;
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_ID+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_ID+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_TX_pload+0)
MOVT	R0, #hi_addr(_TX_pload+0)
STRB	R1, [R0, #0]
;Tic_Tac_Toe.c,336 :: 		TX_pload[1] = XO_First_Move;
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_First_Move+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_First_Move+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_TX_pload+1)
MOVT	R0, #hi_addr(_TX_pload+1)
STRB	R1, [R0, #0]
;Tic_Tac_Toe.c,337 :: 		for (i = 0; i < 9; i ++)
; i start address is: 12 (R3)
MOVS	R3, #0
; i end address is: 12 (R3)
; pMat end address is: 16 (R4)
UXTB	R2, R3
MOV	R3, R4
L_RF_Send_Move24:
; i start address is: 8 (R2)
; pMat start address is: 12 (R3)
CMP	R2, #9
IT	CS
BCS	L_RF_Send_Move25
;Tic_Tac_Toe.c,338 :: 		TX_pload[i + 2] = *pMat ++;
ADDS	R1, R2, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_TX_pload+0)
MOVT	R0, #hi_addr(_TX_pload+0)
ADDS	R1, R0, R1
LDRB	R0, [R3, #0]
STRB	R0, [R1, #0]
ADDS	R0, R3, #1
; pMat end address is: 12 (R3)
; pMat start address is: 16 (R4)
MOV	R4, R0
;Tic_Tac_Toe.c,337 :: 		for (i = 0; i < 9; i ++)
ADDS	R0, R2, #1
; i end address is: 8 (R2)
; i start address is: 0 (R0)
;Tic_Tac_Toe.c,338 :: 		TX_pload[i + 2] = *pMat ++;
MOV	R3, R4
; pMat end address is: 16 (R4)
; i end address is: 0 (R0)
UXTB	R2, R0
IT	AL
BAL	L_RF_Send_Move24
L_RF_Send_Move25:
;Tic_Tac_Toe.c,339 :: 		TX_pload[11] = XO_Turn;
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_Turn+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_Turn+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_TX_pload+11)
MOVT	R0, #hi_addr(_TX_pload+11)
STRB	R1, [R0, #0]
;Tic_Tac_Toe.c,341 :: 		while (attempts < 2){
L_RF_Send_Move27:
LDRB	R0, [SP, #4]
CMP	R0, #2
IT	CS
BCS	L_RF_Send_Move28
;Tic_Tac_Toe.c,342 :: 		nRF_Send_Packet();
BL	_nRF_Send_Packet+0
;Tic_Tac_Toe.c,343 :: 		Delay_ms(50);
MOVW	R7, #9630
MOVT	R7, #38
NOP
NOP
L_RF_Send_Move29:
SUBS	R7, R7, #1
BNE	L_RF_Send_Move29
NOP
NOP
NOP
;Tic_Tac_Toe.c,345 :: 		nRF_Process(&nRFStatus);
MOVW	R0, #lo_addr(_nRFStatus+0)
MOVT	R0, #hi_addr(_nRFStatus+0)
BL	_nRF_Process+0
;Tic_Tac_Toe.c,346 :: 		Delay_ms(20);
MOVW	R7, #16958
MOVT	R7, #15
NOP
NOP
L_RF_Send_Move31:
SUBS	R7, R7, #1
BNE	L_RF_Send_Move31
NOP
NOP
NOP
;Tic_Tac_Toe.c,347 :: 		if (nRFStatus._status == nRF_TX_DS){
MOVW	R0, #lo_addr(_nRFStatus+0)
MOVT	R0, #hi_addr(_nRFStatus+0)
LDRB	R0, [R0, #0]
CMP	R0, #32
IT	NE
BNE	L_RF_Send_Move33
;Tic_Tac_Toe.c,349 :: 		LED_B = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(LED_B+0)
MOVT	R0, #hi_addr(LED_B+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,350 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_RF_Send_Move
;Tic_Tac_Toe.c,351 :: 		}
L_RF_Send_Move33:
;Tic_Tac_Toe.c,353 :: 		attempts ++;
LDRB	R0, [SP, #4]
ADDS	R0, R0, #1
STRB	R0, [SP, #4]
;Tic_Tac_Toe.c,354 :: 		Delay_ms(10);
MOVW	R7, #41246
MOVT	R7, #7
NOP
NOP
L_RF_Send_Move35:
SUBS	R7, R7, #1
BNE	L_RF_Send_Move35
NOP
NOP
NOP
;Tic_Tac_Toe.c,355 :: 		LED_B = ~LED_B;
MOVW	R1, #lo_addr(LED_B+0)
MOVT	R1, #hi_addr(LED_B+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;Tic_Tac_Toe.c,356 :: 		}
IT	AL
BAL	L_RF_Send_Move27
L_RF_Send_Move28:
;Tic_Tac_Toe.c,358 :: 		LED_B = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(LED_B+0)
MOVT	R0, #hi_addr(LED_B+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,359 :: 		return 0;
MOVS	R0, #0
;Tic_Tac_Toe.c,360 :: 		}
L_end_RF_Send_Move:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _RF_Send_Move
_XO_Process:
;Tic_Tac_Toe.c,369 :: 		void XO_Process(char No){
; No start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; No end address is: 0 (R0)
; No start address is: 0 (R0)
;Tic_Tac_Toe.c,372 :: 		temp_i = No / 3;
MOVS	R1, #3
UDIV	R1, R0, R1
; temp_i start address is: 12 (R3)
UXTB	R3, R1
;Tic_Tac_Toe.c,373 :: 		temp_j = No % 3;
MOVS	R2, #3
UDIV	R1, R0, R2
MLS	R1, R2, R1, R0
; temp_j start address is: 16 (R4)
UXTB	R4, R1
;Tic_Tac_Toe.c,375 :: 		if (victory == 0){
MOVW	R1, #lo_addr(_victory+0)
MOVT	R1, #hi_addr(_victory+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_XO_Process37
;Tic_Tac_Toe.c,376 :: 		if (XO_matrix[temp_i][temp_j] == 2){
MOVS	R1, #3
MUL	R2, R1, R3
MOVW	R1, #lo_addr(Tic_Tac_Toe_XO_matrix+0)
MOVT	R1, #hi_addr(Tic_Tac_Toe_XO_matrix+0)
ADDS	R1, R1, R2
ADDS	R1, R1, R4
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_XO_Process38
; temp_i end address is: 12 (R3)
; temp_j end address is: 16 (R4)
;Tic_Tac_Toe.c,377 :: 		UpdateLabel(LabelArray[No], 1);
LSLS	R2, R0, #2
; No end address is: 0 (R0)
MOVW	R1, #lo_addr(_LabelArray+0)
MOVT	R1, #hi_addr(_LabelArray+0)
ADDS	R1, R1, R2
LDR	R1, [R1, #0]
MOV	R0, R1
MOVS	R1, #1
BL	_UpdateLabel+0
;Tic_Tac_Toe.c,378 :: 		UpdateStatus(1);
MOVS	R0, #1
BL	_UpdateStatus+0
;Tic_Tac_Toe.c,379 :: 		}
IT	AL
BAL	L_XO_Process39
L_XO_Process38:
;Tic_Tac_Toe.c,380 :: 		else if (XO_matrix[temp_i][temp_j] == 1){
; temp_j start address is: 16 (R4)
; temp_i start address is: 12 (R3)
; No start address is: 0 (R0)
MOVS	R1, #3
MUL	R2, R1, R3
; temp_i end address is: 12 (R3)
MOVW	R1, #lo_addr(Tic_Tac_Toe_XO_matrix+0)
MOVT	R1, #hi_addr(Tic_Tac_Toe_XO_matrix+0)
ADDS	R1, R1, R2
ADDS	R1, R1, R4
; temp_j end address is: 16 (R4)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_XO_Process40
;Tic_Tac_Toe.c,381 :: 		UpdateLabel(LabelArray[No], 0);
LSLS	R2, R0, #2
; No end address is: 0 (R0)
MOVW	R1, #lo_addr(_LabelArray+0)
MOVT	R1, #hi_addr(_LabelArray+0)
ADDS	R1, R1, R2
LDR	R1, [R1, #0]
MOV	R0, R1
MOVS	R1, #0
BL	_UpdateLabel+0
;Tic_Tac_Toe.c,382 :: 		UpdateStatus(0);
MOVS	R0, #0
BL	_UpdateStatus+0
;Tic_Tac_Toe.c,383 :: 		}
L_XO_Process40:
L_XO_Process39:
;Tic_Tac_Toe.c,384 :: 		}
L_XO_Process37:
;Tic_Tac_Toe.c,385 :: 		}
L_end_XO_Process:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _XO_Process
_TestDraw:
;Tic_Tac_Toe.c,395 :: 		void TestDraw(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Tic_Tac_Toe.c,396 :: 		if (victory == 0)
MOVW	R0, #lo_addr(_victory+0)
MOVT	R0, #hi_addr(_victory+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_TestDraw41
;Tic_Tac_Toe.c,397 :: 		if (Check_For_Draw() == 1){
BL	_Check_For_Draw+0
CMP	R0, #1
IT	NE
BNE	L_TestDraw42
;Tic_Tac_Toe.c,398 :: 		NVIC_IntDisable(IVT_INT_TIM5);
MOVW	R0, #66
BL	_NVIC_IntDisable+0
;Tic_Tac_Toe.c,399 :: 		UpdateLabel38(Draw_cap, CL_WHITE);
MOVW	R1, #65535
MOVW	R0, #lo_addr(Tic_Tac_Toe_Draw_cap+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_Draw_cap+0)
BL	_UpdateLabel38+0
;Tic_Tac_Toe.c,400 :: 		LED_G = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(LED_G+0)
MOVT	R0, #hi_addr(LED_G+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,401 :: 		LED_B = 0;
MOVW	R0, #lo_addr(LED_B+0)
MOVT	R0, #hi_addr(LED_B+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,402 :: 		LED_R = 0;
MOVW	R0, #lo_addr(LED_R+0)
MOVT	R0, #hi_addr(LED_R+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,403 :: 		}
L_TestDraw42:
L_TestDraw41:
;Tic_Tac_Toe.c,404 :: 		}
L_end_TestDraw:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TestDraw
_XO_Process_Packet:
;Tic_Tac_Toe.c,413 :: 		void XO_Process_Packet(char *receved_packet){
; receved_packet start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
MOV	R1, R0
; receved_packet end address is: 0 (R0)
; receved_packet start address is: 4 (R1)
;Tic_Tac_Toe.c,418 :: 		ptr1 = (char*)&packet;
; ptr1 start address is: 8 (R2)
MOVW	R2, #lo_addr(_packet+0)
MOVT	R2, #hi_addr(_packet+0)
;Tic_Tac_Toe.c,420 :: 		for (i = 0; i < 12; i ++)
; i start address is: 0 (R0)
MOVS	R0, #0
; receved_packet end address is: 4 (R1)
; ptr1 end address is: 8 (R2)
; i end address is: 0 (R0)
MOV	R3, R1
L_XO_Process_Packet43:
; i start address is: 0 (R0)
; ptr1 start address is: 8 (R2)
; receved_packet start address is: 12 (R3)
CMP	R0, #12
IT	CS
BCS	L_XO_Process_Packet44
;Tic_Tac_Toe.c,421 :: 		*ptr1 ++ = *receved_packet ++;
LDRB	R1, [R3, #0]
STRB	R1, [R2, #0]
ADDS	R2, R2, #1
ADDS	R3, R3, #1
;Tic_Tac_Toe.c,420 :: 		for (i = 0; i < 12; i ++)
ADDS	R0, R0, #1
UXTB	R0, R0
;Tic_Tac_Toe.c,421 :: 		*ptr1 ++ = *receved_packet ++;
; receved_packet end address is: 12 (R3)
; ptr1 end address is: 8 (R2)
; i end address is: 0 (R0)
IT	AL
BAL	L_XO_Process_Packet43
L_XO_Process_Packet44:
;Tic_Tac_Toe.c,423 :: 		if (packet.ID != 0){
MOVW	R1, #lo_addr(_packet+0)
MOVT	R1, #hi_addr(_packet+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_XO_Process_Packet46
;Tic_Tac_Toe.c,424 :: 		ptr1 = (char*)&packet;
; ptr1 start address is: 0 (R0)
MOVW	R0, #lo_addr(_packet+0)
MOVT	R0, #hi_addr(_packet+0)
;Tic_Tac_Toe.c,425 :: 		ptr1 += 2;
ADDS	R1, R0, #2
; ptr1 end address is: 0 (R0)
; ptr1 start address is: 20 (R5)
MOV	R5, R1
;Tic_Tac_Toe.c,426 :: 		ptr2 = (char*)XO_matrix;
; ptr2 start address is: 24 (R6)
MOVW	R6, #lo_addr(Tic_Tac_Toe_XO_matrix+0)
MOVT	R6, #hi_addr(Tic_Tac_Toe_XO_matrix+0)
;Tic_Tac_Toe.c,428 :: 		if (packet.ID == XO_ID2){
MOVW	R1, #lo_addr(Tic_Tac_Toe_XO_ID2+0)
MOVT	R1, #hi_addr(Tic_Tac_Toe_XO_ID2+0)
LDRB	R2, [R1, #0]
MOVW	R1, #lo_addr(_packet+0)
MOVT	R1, #hi_addr(_packet+0)
LDRB	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L_XO_Process_Packet47
;Tic_Tac_Toe.c,429 :: 		if (packet.turn == 0xFF){
MOVW	R1, #lo_addr(_packet+11)
MOVT	R1, #hi_addr(_packet+11)
LDRB	R1, [R1, #0]
CMP	R1, #255
IT	NE
BNE	L_XO_Process_Packet48
; ptr1 end address is: 20 (R5)
; ptr2 end address is: 24 (R6)
;Tic_Tac_Toe.c,430 :: 		XO_Reset();
BL	_XO_Reset+0
;Tic_Tac_Toe.c,431 :: 		return;
IT	AL
BAL	L_end_XO_Process_Packet
;Tic_Tac_Toe.c,432 :: 		}
L_XO_Process_Packet48:
;Tic_Tac_Toe.c,433 :: 		XO_Turn = packet.turn;
; ptr2 start address is: 24 (R6)
; ptr1 start address is: 20 (R5)
MOVW	R1, #lo_addr(_packet+11)
MOVT	R1, #hi_addr(_packet+11)
LDRB	R2, [R1, #0]
MOVW	R1, #lo_addr(Tic_Tac_Toe_XO_Turn+0)
MOVT	R1, #hi_addr(Tic_Tac_Toe_XO_Turn+0)
STRB	R2, [R1, #0]
;Tic_Tac_Toe.c,434 :: 		if (Myturn == 0){
MOVW	R1, #lo_addr(_Myturn+0)
MOVT	R1, #hi_addr(_Myturn+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_XO_Process_Packet49
;Tic_Tac_Toe.c,435 :: 		MyTurn = XO_Turn;
MOVW	R1, #lo_addr(Tic_Tac_Toe_XO_Turn+0)
MOVT	R1, #hi_addr(Tic_Tac_Toe_XO_Turn+0)
LDRB	R2, [R1, #0]
MOVW	R1, #lo_addr(_Myturn+0)
MOVT	R1, #hi_addr(_Myturn+0)
STRB	R2, [R1, #0]
;Tic_Tac_Toe.c,436 :: 		NVIC_IntEnable(IVT_INT_TIM5);
MOVW	R0, #66
BL	_NVIC_IntEnable+0
;Tic_Tac_Toe.c,437 :: 		}
L_XO_Process_Packet49:
;Tic_Tac_Toe.c,439 :: 		for (i = 0; i < 9; i ++){
; i start address is: 0 (R0)
MOVS	R0, #0
; ptr1 end address is: 20 (R5)
; ptr2 end address is: 24 (R6)
; i end address is: 0 (R0)
MOV	R4, R5
MOV	R3, R6
L_XO_Process_Packet50:
; i start address is: 0 (R0)
; ptr2 start address is: 12 (R3)
; ptr1 start address is: 16 (R4)
CMP	R0, #9
IT	CS
BCS	L_XO_Process_Packet51
;Tic_Tac_Toe.c,440 :: 		if (*ptr1 != *ptr2){
LDRB	R2, [R4, #0]
LDRB	R1, [R3, #0]
CMP	R2, R1
IT	EQ
BEQ	L_XO_Process_Packet53
;Tic_Tac_Toe.c,441 :: 		*ptr2 = *ptr1;
LDRB	R1, [R4, #0]
STRB	R1, [R3, #0]
;Tic_Tac_Toe.c,442 :: 		XO_Process(i);
STR	R4, [SP, #4]
STR	R3, [SP, #8]
STRB	R0, [SP, #12]
BL	_XO_Process+0
LDRB	R0, [SP, #12]
LDR	R3, [SP, #8]
LDR	R4, [SP, #4]
;Tic_Tac_Toe.c,443 :: 		LED_G = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(LED_G+0)
MOVT	R1, #hi_addr(LED_G+0)
STR	R2, [R1, #0]
;Tic_Tac_Toe.c,444 :: 		LED_R = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(LED_R+0)
MOVT	R1, #hi_addr(LED_R+0)
STR	R2, [R1, #0]
;Tic_Tac_Toe.c,445 :: 		}
L_XO_Process_Packet53:
;Tic_Tac_Toe.c,446 :: 		ptr1 ++;
ADDS	R1, R4, #1
; ptr1 end address is: 16 (R4)
; ptr1 start address is: 8 (R2)
MOV	R2, R1
;Tic_Tac_Toe.c,447 :: 		ptr2 ++;
ADDS	R3, R3, #1
;Tic_Tac_Toe.c,439 :: 		for (i = 0; i < 9; i ++){
ADDS	R0, R0, #1
UXTB	R0, R0
;Tic_Tac_Toe.c,448 :: 		}
MOV	R4, R2
; ptr1 end address is: 8 (R2)
; ptr2 end address is: 12 (R3)
; i end address is: 0 (R0)
IT	AL
BAL	L_XO_Process_Packet50
L_XO_Process_Packet51:
;Tic_Tac_Toe.c,449 :: 		Test_Victory();
BL	_Test_Victory+0
;Tic_Tac_Toe.c,450 :: 		TestDraw();
BL	_TestDraw+0
;Tic_Tac_Toe.c,451 :: 		}
L_XO_Process_Packet47:
;Tic_Tac_Toe.c,452 :: 		}
L_XO_Process_Packet46:
;Tic_Tac_Toe.c,453 :: 		}
L_end_XO_Process_Packet:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _XO_Process_Packet
_XO_Set_New_State:
;Tic_Tac_Toe.c,464 :: 		char XO_Set_New_State(char MatNo){
; MatNo start address is: 0 (R0)
UXTB	R3, R0
; MatNo end address is: 0 (R0)
; MatNo start address is: 12 (R3)
;Tic_Tac_Toe.c,467 :: 		temp_i = MatNo / 3;
MOVS	R1, #3
UDIV	R1, R3, R1
; temp_i start address is: 0 (R0)
UXTB	R0, R1
;Tic_Tac_Toe.c,468 :: 		temp_j = MatNo % 3;
MOVS	R2, #3
UDIV	R1, R3, R2
MLS	R1, R2, R1, R3
; MatNo end address is: 12 (R3)
; temp_j start address is: 12 (R3)
UXTB	R3, R1
;Tic_Tac_Toe.c,469 :: 		if (XO_matrix[temp_i][temp_j] == 0){
MOVS	R1, #3
MUL	R2, R1, R0
MOVW	R1, #lo_addr(Tic_Tac_Toe_XO_matrix+0)
MOVT	R1, #hi_addr(Tic_Tac_Toe_XO_matrix+0)
ADDS	R1, R1, R2
ADDS	R1, R1, R3
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_XO_Set_New_State54
;Tic_Tac_Toe.c,470 :: 		if (XO_Turn == 1){
MOVW	R1, #lo_addr(Tic_Tac_Toe_XO_Turn+0)
MOVT	R1, #hi_addr(Tic_Tac_Toe_XO_Turn+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_XO_Set_New_State55
;Tic_Tac_Toe.c,471 :: 		XO_matrix[temp_i][temp_j] = 1;
MOVS	R1, #3
MUL	R2, R1, R0
; temp_i end address is: 0 (R0)
MOVW	R1, #lo_addr(Tic_Tac_Toe_XO_matrix+0)
MOVT	R1, #hi_addr(Tic_Tac_Toe_XO_matrix+0)
ADDS	R1, R1, R2
ADDS	R2, R1, R3
; temp_j end address is: 12 (R3)
MOVS	R1, #1
STRB	R1, [R2, #0]
;Tic_Tac_Toe.c,472 :: 		XO_Turn = 2;
MOVS	R2, #2
MOVW	R1, #lo_addr(Tic_Tac_Toe_XO_Turn+0)
MOVT	R1, #hi_addr(Tic_Tac_Toe_XO_Turn+0)
STRB	R2, [R1, #0]
;Tic_Tac_Toe.c,473 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_XO_Set_New_State
;Tic_Tac_Toe.c,474 :: 		}
L_XO_Set_New_State55:
;Tic_Tac_Toe.c,475 :: 		else if (XO_Turn == 2){
; temp_j start address is: 12 (R3)
; temp_i start address is: 0 (R0)
MOVW	R1, #lo_addr(Tic_Tac_Toe_XO_Turn+0)
MOVT	R1, #hi_addr(Tic_Tac_Toe_XO_Turn+0)
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_XO_Set_New_State57
;Tic_Tac_Toe.c,476 :: 		XO_matrix[temp_i][temp_j] = 2;
MOVS	R1, #3
MUL	R2, R1, R0
; temp_i end address is: 0 (R0)
MOVW	R1, #lo_addr(Tic_Tac_Toe_XO_matrix+0)
MOVT	R1, #hi_addr(Tic_Tac_Toe_XO_matrix+0)
ADDS	R1, R1, R2
ADDS	R2, R1, R3
; temp_j end address is: 12 (R3)
MOVS	R1, #2
STRB	R1, [R2, #0]
;Tic_Tac_Toe.c,477 :: 		XO_Turn = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(Tic_Tac_Toe_XO_Turn+0)
MOVT	R1, #hi_addr(Tic_Tac_Toe_XO_Turn+0)
STRB	R2, [R1, #0]
;Tic_Tac_Toe.c,478 :: 		return 2;
MOVS	R0, #2
IT	AL
BAL	L_end_XO_Set_New_State
;Tic_Tac_Toe.c,479 :: 		}
L_XO_Set_New_State57:
;Tic_Tac_Toe.c,480 :: 		}
IT	AL
BAL	L_XO_Set_New_State58
L_XO_Set_New_State54:
;Tic_Tac_Toe.c,482 :: 		return 0;
MOVS	R0, #0
IT	AL
BAL	L_end_XO_Set_New_State
;Tic_Tac_Toe.c,483 :: 		}
L_XO_Set_New_State58:
;Tic_Tac_Toe.c,484 :: 		}
L_end_XO_Set_New_State:
BX	LR
; end of _XO_Set_New_State
_XO_Victory:
;Tic_Tac_Toe.c,493 :: 		void XO_Victory(char victory_flag){
; victory_flag start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; victory_flag end address is: 0 (R0)
; victory_flag start address is: 0 (R0)
;Tic_Tac_Toe.c,494 :: 		switch (victory_flag){
IT	AL
BAL	L_XO_Victory59
; victory_flag end address is: 0 (R0)
;Tic_Tac_Toe.c,495 :: 		case 1 : {
L_XO_Victory61:
;Tic_Tac_Toe.c,496 :: 		TFT_Set_Pen(CL_WHITE, 2);
MOVS	R1, #2
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;Tic_Tac_Toe.c,497 :: 		TFT_Line(249, 68, 422, 59);
MOVS	R3, #59
SXTH	R3, R3
MOVW	R2, #422
SXTH	R2, R2
MOVS	R1, #68
SXTH	R1, R1
MOVS	R0, #249
SXTH	R0, R0
BL	_TFT_Line+0
;Tic_Tac_Toe.c,498 :: 		}; break;
IT	AL
BAL	L_XO_Victory60
;Tic_Tac_Toe.c,499 :: 		case 2 : {
L_XO_Victory62:
;Tic_Tac_Toe.c,500 :: 		TFT_Set_Pen(CL_WHITE, 2);
MOVS	R1, #2
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;Tic_Tac_Toe.c,501 :: 		TFT_Line(251, 141, 423, 132);
MOVS	R3, #132
SXTH	R3, R3
MOVW	R2, #423
SXTH	R2, R2
MOVS	R1, #141
SXTH	R1, R1
MOVS	R0, #251
SXTH	R0, R0
BL	_TFT_Line+0
;Tic_Tac_Toe.c,502 :: 		}; break;
IT	AL
BAL	L_XO_Victory60
;Tic_Tac_Toe.c,503 :: 		case 3 : {
L_XO_Victory63:
;Tic_Tac_Toe.c,504 :: 		TFT_Set_Pen(CL_WHITE, 2);
MOVS	R1, #2
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;Tic_Tac_Toe.c,505 :: 		TFT_Line(256, 211, 428, 202);
MOVS	R3, #202
SXTH	R3, R3
MOVW	R2, #428
SXTH	R2, R2
MOVS	R1, #211
SXTH	R1, R1
MOVW	R0, #256
SXTH	R0, R0
BL	_TFT_Line+0
;Tic_Tac_Toe.c,506 :: 		}; break;
IT	AL
BAL	L_XO_Victory60
;Tic_Tac_Toe.c,507 :: 		case 4 : {
L_XO_Victory64:
;Tic_Tac_Toe.c,508 :: 		TFT_Set_Pen(CL_WHITE, 2);
MOVS	R1, #2
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;Tic_Tac_Toe.c,509 :: 		TFT_Line(259, 46, 269, 231);
MOVS	R3, #231
SXTH	R3, R3
MOVW	R2, #269
SXTH	R2, R2
MOVS	R1, #46
SXTH	R1, R1
MOVW	R0, #259
SXTH	R0, R0
BL	_TFT_Line+0
;Tic_Tac_Toe.c,510 :: 		}; break;
IT	AL
BAL	L_XO_Victory60
;Tic_Tac_Toe.c,511 :: 		case 5 : {
L_XO_Victory65:
;Tic_Tac_Toe.c,512 :: 		TFT_Set_Pen(CL_WHITE, 2);
MOVS	R1, #2
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;Tic_Tac_Toe.c,513 :: 		TFT_Line(331, 39, 343, 229);
MOVS	R3, #229
SXTH	R3, R3
MOVW	R2, #343
SXTH	R2, R2
MOVS	R1, #39
SXTH	R1, R1
MOVW	R0, #331
SXTH	R0, R0
BL	_TFT_Line+0
;Tic_Tac_Toe.c,514 :: 		}; break;
IT	AL
BAL	L_XO_Victory60
;Tic_Tac_Toe.c,515 :: 		case 6 : {
L_XO_Victory66:
;Tic_Tac_Toe.c,516 :: 		TFT_Set_Pen(CL_WHITE, 2);
MOVS	R1, #2
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;Tic_Tac_Toe.c,517 :: 		TFT_Line(406, 36, 418, 226);
MOVS	R3, #226
SXTH	R3, R3
MOVW	R2, #418
SXTH	R2, R2
MOVS	R1, #36
SXTH	R1, R1
MOVW	R0, #406
SXTH	R0, R0
BL	_TFT_Line+0
;Tic_Tac_Toe.c,518 :: 		}; break;
IT	AL
BAL	L_XO_Victory60
;Tic_Tac_Toe.c,519 :: 		case 7 : {
L_XO_Victory67:
;Tic_Tac_Toe.c,520 :: 		TFT_Set_Pen(CL_WHITE, 2);
MOVS	R1, #2
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;Tic_Tac_Toe.c,521 :: 		TFT_Line(245, 50, 425, 219);
MOVS	R3, #219
SXTH	R3, R3
MOVW	R2, #425
SXTH	R2, R2
MOVS	R1, #50
SXTH	R1, R1
MOVS	R0, #245
SXTH	R0, R0
BL	_TFT_Line+0
;Tic_Tac_Toe.c,522 :: 		}; break;
IT	AL
BAL	L_XO_Victory60
;Tic_Tac_Toe.c,523 :: 		case 8 : {
L_XO_Victory68:
;Tic_Tac_Toe.c,524 :: 		TFT_Set_Pen(CL_WHITE, 2);
MOVS	R1, #2
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;Tic_Tac_Toe.c,525 :: 		TFT_Line(419, 43, 258, 225);
MOVS	R3, #225
SXTH	R3, R3
MOVW	R2, #258
SXTH	R2, R2
MOVS	R1, #43
SXTH	R1, R1
MOVW	R0, #419
SXTH	R0, R0
BL	_TFT_Line+0
;Tic_Tac_Toe.c,526 :: 		}; break;
IT	AL
BAL	L_XO_Victory60
;Tic_Tac_Toe.c,527 :: 		}
L_XO_Victory59:
; victory_flag start address is: 0 (R0)
CMP	R0, #1
IT	EQ
BEQ	L_XO_Victory61
CMP	R0, #2
IT	EQ
BEQ	L_XO_Victory62
CMP	R0, #3
IT	EQ
BEQ	L_XO_Victory63
CMP	R0, #4
IT	EQ
BEQ	L_XO_Victory64
CMP	R0, #5
IT	EQ
BEQ	L_XO_Victory65
CMP	R0, #6
IT	EQ
BEQ	L_XO_Victory66
CMP	R0, #7
IT	EQ
BEQ	L_XO_Victory67
CMP	R0, #8
IT	EQ
BEQ	L_XO_Victory68
; victory_flag end address is: 0 (R0)
L_XO_Victory60:
;Tic_Tac_Toe.c,528 :: 		}
L_end_XO_Victory:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _XO_Victory
_Check_For_Draw:
;Tic_Tac_Toe.c,538 :: 		char Check_For_Draw(){
;Tic_Tac_Toe.c,540 :: 		for (i = 0; i < 3; i ++){
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
L_Check_For_Draw69:
; i start address is: 8 (R2)
CMP	R2, #3
IT	CS
BCS	L_Check_For_Draw70
;Tic_Tac_Toe.c,541 :: 		for (j = 0; j < 3; j ++){
; j start address is: 12 (R3)
MOVS	R3, #0
; j end address is: 12 (R3)
; i end address is: 8 (R2)
L_Check_For_Draw72:
; j start address is: 12 (R3)
; i start address is: 8 (R2)
CMP	R3, #3
IT	CS
BCS	L_Check_For_Draw73
;Tic_Tac_Toe.c,542 :: 		if (XO_matrix[i][j] == 0)
MOVS	R0, #3
MUL	R1, R0, R2
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_matrix+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_matrix+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R3
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Check_For_Draw75
; j end address is: 12 (R3)
; i end address is: 8 (R2)
;Tic_Tac_Toe.c,543 :: 		return 0;
MOVS	R0, #0
IT	AL
BAL	L_end_Check_For_Draw
L_Check_For_Draw75:
;Tic_Tac_Toe.c,541 :: 		for (j = 0; j < 3; j ++){
; i start address is: 8 (R2)
; j start address is: 12 (R3)
ADDS	R3, R3, #1
UXTB	R3, R3
;Tic_Tac_Toe.c,544 :: 		}
; j end address is: 12 (R3)
IT	AL
BAL	L_Check_For_Draw72
L_Check_For_Draw73:
;Tic_Tac_Toe.c,540 :: 		for (i = 0; i < 3; i ++){
ADDS	R2, R2, #1
UXTB	R2, R2
;Tic_Tac_Toe.c,545 :: 		}
; i end address is: 8 (R2)
IT	AL
BAL	L_Check_For_Draw69
L_Check_For_Draw70:
;Tic_Tac_Toe.c,546 :: 		return 1;
MOVS	R0, #1
;Tic_Tac_Toe.c,547 :: 		}
L_end_Check_For_Draw:
BX	LR
; end of _Check_For_Draw
_XO_Check_For_Victory:
;Tic_Tac_Toe.c,556 :: 		char XO_Check_For_Victory(){
;Tic_Tac_Toe.c,559 :: 		for (temp_i = 0; temp_i < 3; temp_i ++){
; temp_i start address is: 12 (R3)
MOVS	R3, #0
; temp_i end address is: 12 (R3)
L_XO_Check_For_Victory76:
; temp_i start address is: 12 (R3)
CMP	R3, #3
IT	CS
BCS	L_XO_Check_For_Victory77
;Tic_Tac_Toe.c,560 :: 		if (XO_matrix[temp_i][0] != 0)
MOVS	R0, #3
MUL	R1, R0, R3
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_matrix+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_matrix+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_XO_Check_For_Victory79
;Tic_Tac_Toe.c,561 :: 		if (XO_matrix[temp_i][0] == XO_matrix[temp_i][1])
MOVS	R0, #3
MUL	R1, R0, R3
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_matrix+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_matrix+0)
ADDS	R0, R0, R1
LDRB	R1, [R0, #0]
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
CMP	R1, R0
IT	NE
BNE	L_XO_Check_For_Victory80
;Tic_Tac_Toe.c,562 :: 		if (XO_matrix[temp_i][1] == XO_matrix[temp_i][2])
MOVS	R0, #3
MUL	R1, R0, R3
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_matrix+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_matrix+0)
ADDS	R2, R0, R1
ADDS	R0, R2, #1
LDRB	R1, [R0, #0]
ADDS	R0, R2, #2
LDRB	R0, [R0, #0]
CMP	R1, R0
IT	NE
BNE	L_XO_Check_For_Victory81
;Tic_Tac_Toe.c,563 :: 		return (temp_i + 1);
ADDS	R0, R3, #1
; temp_i end address is: 12 (R3)
UXTB	R0, R0
IT	AL
BAL	L_end_XO_Check_For_Victory
L_XO_Check_For_Victory81:
; temp_i start address is: 12 (R3)
L_XO_Check_For_Victory80:
L_XO_Check_For_Victory79:
;Tic_Tac_Toe.c,559 :: 		for (temp_i = 0; temp_i < 3; temp_i ++){
ADDS	R3, R3, #1
UXTB	R3, R3
;Tic_Tac_Toe.c,564 :: 		}
; temp_i end address is: 12 (R3)
IT	AL
BAL	L_XO_Check_For_Victory76
L_XO_Check_For_Victory77:
;Tic_Tac_Toe.c,565 :: 		for (temp_j = 0; temp_j < 3; temp_j ++){
; temp_j start address is: 8 (R2)
MOVS	R2, #0
; temp_j end address is: 8 (R2)
L_XO_Check_For_Victory82:
; temp_j start address is: 8 (R2)
CMP	R2, #3
IT	CS
BCS	L_XO_Check_For_Victory83
;Tic_Tac_Toe.c,566 :: 		if (XO_matrix[0][temp_j] != 0)
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_matrix+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_matrix+0)
ADDS	R0, R0, R2
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_XO_Check_For_Victory85
;Tic_Tac_Toe.c,567 :: 		if (XO_matrix[0][temp_j] == XO_matrix[1][temp_j])
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_matrix+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_matrix+0)
ADDS	R0, R0, R2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_matrix+3)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_matrix+3)
ADDS	R0, R0, R2
LDRB	R0, [R0, #0]
CMP	R1, R0
IT	NE
BNE	L_XO_Check_For_Victory86
;Tic_Tac_Toe.c,568 :: 		if (XO_matrix[1][temp_j] == XO_matrix[2][temp_j])
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_matrix+3)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_matrix+3)
ADDS	R0, R0, R2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_matrix+6)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_matrix+6)
ADDS	R0, R0, R2
LDRB	R0, [R0, #0]
CMP	R1, R0
IT	NE
BNE	L_XO_Check_For_Victory87
;Tic_Tac_Toe.c,569 :: 		return (temp_j + 4);
ADDS	R0, R2, #4
; temp_j end address is: 8 (R2)
UXTB	R0, R0
IT	AL
BAL	L_end_XO_Check_For_Victory
L_XO_Check_For_Victory87:
; temp_j start address is: 8 (R2)
L_XO_Check_For_Victory86:
L_XO_Check_For_Victory85:
;Tic_Tac_Toe.c,565 :: 		for (temp_j = 0; temp_j < 3; temp_j ++){
ADDS	R2, R2, #1
UXTB	R2, R2
;Tic_Tac_Toe.c,570 :: 		}
; temp_j end address is: 8 (R2)
IT	AL
BAL	L_XO_Check_For_Victory82
L_XO_Check_For_Victory83:
;Tic_Tac_Toe.c,571 :: 		if (XO_matrix[0][0] != 0)
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_matrix+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_matrix+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_XO_Check_For_Victory88
;Tic_Tac_Toe.c,572 :: 		if (XO_matrix[0][0] == XO_matrix[1][1])
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_matrix+4)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_matrix+4)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_matrix+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_matrix+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_XO_Check_For_Victory89
;Tic_Tac_Toe.c,573 :: 		if (XO_matrix[1][1] == XO_matrix[2][2]){
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_matrix+8)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_matrix+8)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_matrix+4)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_matrix+4)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_XO_Check_For_Victory90
;Tic_Tac_Toe.c,574 :: 		return 7;
MOVS	R0, #7
IT	AL
BAL	L_end_XO_Check_For_Victory
;Tic_Tac_Toe.c,575 :: 		}
L_XO_Check_For_Victory90:
L_XO_Check_For_Victory89:
L_XO_Check_For_Victory88:
;Tic_Tac_Toe.c,576 :: 		if (XO_matrix[0][2] != 0)
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_matrix+2)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_matrix+2)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_XO_Check_For_Victory91
;Tic_Tac_Toe.c,577 :: 		if (XO_matrix[0][2] == XO_matrix[1][1])
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_matrix+4)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_matrix+4)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_matrix+2)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_matrix+2)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_XO_Check_For_Victory92
;Tic_Tac_Toe.c,578 :: 		if (XO_matrix[1][1] == XO_matrix[2][0]){
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_matrix+6)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_matrix+6)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_matrix+4)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_matrix+4)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_XO_Check_For_Victory93
;Tic_Tac_Toe.c,579 :: 		return 8;
MOVS	R0, #8
IT	AL
BAL	L_end_XO_Check_For_Victory
;Tic_Tac_Toe.c,580 :: 		}
L_XO_Check_For_Victory93:
L_XO_Check_For_Victory92:
L_XO_Check_For_Victory91:
;Tic_Tac_Toe.c,581 :: 		return 0;
MOVS	R0, #0
;Tic_Tac_Toe.c,582 :: 		}
L_end_XO_Check_For_Victory:
BX	LR
; end of _XO_Check_For_Victory
_DrawImageLine_TTT:
;Tic_Tac_Toe.c,591 :: 		void DrawImageLine_TTT(TImage *image, int line, int xcoo1, int xcoo2){
; xcoo2 start address is: 12 (R3)
; xcoo1 start address is: 8 (R2)
; line start address is: 4 (R1)
; image start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; xcoo2 end address is: 12 (R3)
; xcoo1 end address is: 8 (R2)
; line end address is: 4 (R1)
; image end address is: 0 (R0)
; image start address is: 0 (R0)
; line start address is: 4 (R1)
; xcoo1 start address is: 8 (R2)
; xcoo2 start address is: 12 (R3)
;Tic_Tac_Toe.c,598 :: 		offset = 6 + (unsigned long)(line - Image->Top) * Image->Width + (xcoo1 - Image->Left) * 2;
ADDW	R4, R0, #8
LDRH	R4, [R4, #0]
SUB	R4, R1, R4
UXTH	R4, R4
UXTH	R5, R4
ADDW	R4, R0, #10
LDRH	R4, [R4, #0]
MULS	R4, R5, R4
ADDS	R5, R4, #6
ADDS	R4, R0, #6
LDRH	R4, [R4, #0]
SUB	R4, R2, R4
UXTH	R4, R4
LSLS	R4, R4, #1
UXTH	R4, R4
ADDS	R6, R5, R4
;Tic_Tac_Toe.c,599 :: 		TFT_CS = 0;
MOVS	R5, #0
SXTB	R5, R5
MOVW	R4, #lo_addr(TFT_CS+0)
MOVT	R4, #hi_addr(TFT_CS+0)
STR	R5, [R4, #0]
;Tic_Tac_Toe.c,600 :: 		ptr = Image->Picture_Name + offset;
ADDW	R4, R0, #16
; image end address is: 0 (R0)
LDR	R5, [R4, #0]
UXTH	R4, R6
ADDS	R4, R5, R4
; ptr start address is: 0 (R0)
MOV	R0, R4
;Tic_Tac_Toe.c,602 :: 		TFT_SSD1963_Set_Address_Ptr(xcoo1, line, xcoo2, line);
STR	R0, [SP, #4]
UXTH	R0, R2
UXTH	R2, R3
; xcoo2 end address is: 12 (R3)
UXTH	R3, R1
; line end address is: 4 (R1)
UXTH	R1, R1
; xcoo1 end address is: 8 (R2)
MOVW	R4, #lo_addr(_TFT_SSD1963_Set_Address_Ptr+0)
MOVT	R4, #hi_addr(_TFT_SSD1963_Set_Address_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
LDR	R0, [SP, #4]
;Tic_Tac_Toe.c,603 :: 		color = *ptr++;
LDRB	R4, [R0, #0]
; color start address is: 4 (R1)
UXTB	R1, R4
ADDS	R4, R0, #1
; ptr end address is: 0 (R0)
;Tic_Tac_Toe.c,604 :: 		color += (*ptr++) << 8;
LDRB	R4, [R4, #0]
LSLS	R4, R4, #8
UXTH	R4, R4
ADDS	R4, R1, R4
; color end address is: 4 (R1)
; color start address is: 0 (R0)
UXTH	R0, R4
;Tic_Tac_Toe.c,605 :: 		TFT_Write_Data_Ptr(color);
; color end address is: 0 (R0)
MOVW	R4, #lo_addr(_TFT_Write_Data_Ptr+0)
MOVT	R4, #hi_addr(_TFT_Write_Data_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
;Tic_Tac_Toe.c,607 :: 		TFT_CS = 1;
MOVS	R5, #1
SXTB	R5, R5
MOVW	R4, #lo_addr(TFT_CS+0)
MOVT	R4, #hi_addr(TFT_CS+0)
STR	R5, [R4, #0]
;Tic_Tac_Toe.c,608 :: 		}
L_end_DrawImageLine_TTT:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawImageLine_TTT
_ReDrawBackground:
;Tic_Tac_Toe.c,617 :: 		void ReDrawBackground(TImage *Image, int x1, int x2, int y1, int y2){
SUB	SP, SP, #24
STR	LR, [SP, #0]
STR	R0, [SP, #8]
STRH	R1, [SP, #12]
STRH	R2, [SP, #16]
STRH	R3, [SP, #20]
LDRSH	R4, [SP, #24]
STRH	R4, [SP, #24]
;Tic_Tac_Toe.c,620 :: 		for (i = 0; i < y2 - y1; i ++){
; i start address is: 24 (R6)
MOVS	R6, #0
SXTH	R6, R6
; i end address is: 24 (R6)
SXTH	R0, R6
L_ReDrawBackground94:
; i start address is: 0 (R0)
LDRSH	R5, [SP, #20]
LDRSH	R4, [SP, #24]
SUB	R4, R4, R5
SXTH	R4, R4
CMP	R0, R4
IT	GE
BGE	L_ReDrawBackground95
;Tic_Tac_Toe.c,621 :: 		DrawImageLine_TTT(Image, y1 + i, x1, x2);
LDRSH	R4, [SP, #20]
ADDS	R4, R4, R0
STRH	R0, [SP, #4]
LDRSH	R3, [SP, #16]
LDRSH	R2, [SP, #12]
SXTH	R1, R4
LDR	R0, [SP, #8]
BL	_DrawImageLine_TTT+0
LDRSH	R0, [SP, #4]
;Tic_Tac_Toe.c,620 :: 		for (i = 0; i < y2 - y1; i ++){
ADDS	R4, R0, #1
; i end address is: 0 (R0)
; i start address is: 24 (R6)
SXTH	R6, R4
;Tic_Tac_Toe.c,622 :: 		}
SXTH	R0, R6
; i end address is: 24 (R6)
IT	AL
BAL	L_ReDrawBackground94
L_ReDrawBackground95:
;Tic_Tac_Toe.c,623 :: 		}
L_end_ReDrawBackground:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _ReDrawBackground
_UpdateLabel:
;Tic_Tac_Toe.c,632 :: 		void UpdateLabel(TLabel * Label, char xo){
; xo start address is: 4 (R1)
; Label start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; xo end address is: 4 (R1)
; Label end address is: 0 (R0)
; Label start address is: 0 (R0)
; xo start address is: 4 (R1)
;Tic_Tac_Toe.c,633 :: 		if (xo){
CMP	R1, #0
IT	EQ
BEQ	L_UpdateLabel97
; xo end address is: 4 (R1)
;Tic_Tac_Toe.c,634 :: 		Label->Caption = XO_O_caption;
ADDW	R3, R0, #16
MOVW	R2, #lo_addr(Tic_Tac_Toe_XO_O_caption+0)
MOVT	R2, #hi_addr(Tic_Tac_Toe_XO_O_caption+0)
STR	R2, [R3, #0]
;Tic_Tac_Toe.c,635 :: 		Label->Font_Color = O_color;
ADDW	R3, R0, #24
MOVW	R2, #lo_addr(_O_color+0)
MOVT	R2, #hi_addr(_O_color+0)
LDRH	R2, [R2, #0]
STRH	R2, [R3, #0]
;Tic_Tac_Toe.c,636 :: 		DrawLabel(Label);
; Label end address is: 0 (R0)
BL	_DrawLabel+0
;Tic_Tac_Toe.c,637 :: 		}
IT	AL
BAL	L_UpdateLabel98
L_UpdateLabel97:
;Tic_Tac_Toe.c,639 :: 		Label->Caption = XO_X_caption;
; Label start address is: 0 (R0)
ADDW	R3, R0, #16
MOVW	R2, #lo_addr(Tic_Tac_Toe_XO_X_caption+0)
MOVT	R2, #hi_addr(Tic_Tac_Toe_XO_X_caption+0)
STR	R2, [R3, #0]
;Tic_Tac_Toe.c,640 :: 		Label->Font_Color = X_color;
ADDW	R3, R0, #24
MOVW	R2, #lo_addr(_X_color+0)
MOVT	R2, #hi_addr(_X_color+0)
LDRH	R2, [R2, #0]
STRH	R2, [R3, #0]
;Tic_Tac_Toe.c,641 :: 		DrawLabel(Label);
; Label end address is: 0 (R0)
BL	_DrawLabel+0
;Tic_Tac_Toe.c,642 :: 		}
L_UpdateLabel98:
;Tic_Tac_Toe.c,643 :: 		}
L_end_UpdateLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _UpdateLabel
_UpdateStatus:
;Tic_Tac_Toe.c,652 :: 		void UpdateStatus (char xo){
; xo start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; xo end address is: 0 (R0)
; xo start address is: 0 (R0)
;Tic_Tac_Toe.c,653 :: 		if (xo){
CMP	R0, #0
IT	EQ
BEQ	L_UpdateStatus99
; xo end address is: 0 (R0)
;Tic_Tac_Toe.c,654 :: 		UpdateLabel38(XsTurn_cap, X_color);
MOVW	R1, #lo_addr(_X_color+0)
MOVT	R1, #hi_addr(_X_color+0)
LDRH	R1, [R1, #0]
MOVW	R0, #lo_addr(Tic_Tac_Toe_XsTurn_cap+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XsTurn_cap+0)
BL	_UpdateLabel38+0
;Tic_Tac_Toe.c,655 :: 		}
IT	AL
BAL	L_UpdateStatus100
L_UpdateStatus99:
;Tic_Tac_Toe.c,657 :: 		UpdateLabel38(OsTurn_cap, O_color);
MOVW	R1, #lo_addr(_O_color+0)
MOVT	R1, #hi_addr(_O_color+0)
LDRH	R1, [R1, #0]
MOVW	R0, #lo_addr(Tic_Tac_Toe_OsTurn_cap+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_OsTurn_cap+0)
BL	_UpdateLabel38+0
;Tic_Tac_Toe.c,658 :: 		}
L_UpdateStatus100:
;Tic_Tac_Toe.c,659 :: 		}
L_end_UpdateStatus:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _UpdateStatus
_Test_Victory:
;Tic_Tac_Toe.c,668 :: 		void Test_Victory(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Tic_Tac_Toe.c,669 :: 		victory = XO_Check_For_Victory();
BL	_XO_Check_For_Victory+0
MOVW	R1, #lo_addr(_victory+0)
MOVT	R1, #hi_addr(_victory+0)
STRB	R0, [R1, #0]
;Tic_Tac_Toe.c,670 :: 		if (victory){
CMP	R0, #0
IT	EQ
BEQ	L_Test_Victory101
;Tic_Tac_Toe.c,671 :: 		NVIC_IntDisable(IVT_INT_TIM5);
MOVW	R0, #66
BL	_NVIC_IntDisable+0
;Tic_Tac_Toe.c,672 :: 		XO_Victory(victory);
MOVW	R0, #lo_addr(_victory+0)
MOVT	R0, #hi_addr(_victory+0)
LDRB	R0, [R0, #0]
BL	_XO_Victory+0
;Tic_Tac_Toe.c,673 :: 		if (RF_used){
MOVW	R0, #lo_addr(_RF_used+0)
MOVT	R0, #hi_addr(_RF_used+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_Test_Victory102
;Tic_Tac_Toe.c,674 :: 		if (XO_turn == MyTurn)
MOVW	R0, #lo_addr(_Myturn+0)
MOVT	R0, #hi_addr(_Myturn+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_Turn+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_Turn+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_Test_Victory103
;Tic_Tac_Toe.c,675 :: 		UpdateLabel38(YouLose_cap, CL_BLUE);
MOVW	R1, #31
MOVW	R0, #lo_addr(Tic_Tac_Toe_YouLose_cap+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_YouLose_cap+0)
BL	_UpdateLabel38+0
IT	AL
BAL	L_Test_Victory104
L_Test_Victory103:
;Tic_Tac_Toe.c,677 :: 		UpdateLabel38(YouWin_cap, CL_RED);
MOVW	R1, #63488
MOVW	R0, #lo_addr(Tic_Tac_Toe_YouWin_cap+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_YouWin_cap+0)
BL	_UpdateLabel38+0
L_Test_Victory104:
;Tic_Tac_Toe.c,678 :: 		}
IT	AL
BAL	L_Test_Victory105
L_Test_Victory102:
;Tic_Tac_Toe.c,680 :: 		if (XO_turn == 2)
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_Turn+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_Turn+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_Test_Victory106
;Tic_Tac_Toe.c,681 :: 		UpdateLabel38(XWin_cap, X_color);
MOVW	R0, #lo_addr(_X_color+0)
MOVT	R0, #hi_addr(_X_color+0)
LDRH	R0, [R0, #0]
UXTH	R1, R0
MOVW	R0, #lo_addr(Tic_Tac_Toe_XWin_cap+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XWin_cap+0)
BL	_UpdateLabel38+0
IT	AL
BAL	L_Test_Victory107
L_Test_Victory106:
;Tic_Tac_Toe.c,682 :: 		else if (Xo_turn == 1)
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_Turn+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_Turn+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Test_Victory108
;Tic_Tac_Toe.c,683 :: 		UpdateLabel38(Owin_cap, O_color);
MOVW	R0, #lo_addr(_O_color+0)
MOVT	R0, #hi_addr(_O_color+0)
LDRH	R0, [R0, #0]
UXTH	R1, R0
MOVW	R0, #lo_addr(Tic_Tac_Toe_OWin_cap+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_OWin_cap+0)
BL	_UpdateLabel38+0
L_Test_Victory108:
L_Test_Victory107:
;Tic_Tac_Toe.c,684 :: 		}
L_Test_Victory105:
;Tic_Tac_Toe.c,685 :: 		LED_Victory_Blink();
BL	_LED_Victory_Blink+0
;Tic_Tac_Toe.c,686 :: 		}
IT	AL
BAL	L_Test_Victory109
L_Test_Victory101:
;Tic_Tac_Toe.c,688 :: 		LED_Move();
BL	_LED_Move+0
L_Test_Victory109:
;Tic_Tac_Toe.c,689 :: 		}
L_end_Test_Victory:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Test_Victory
_XO_Reset:
;Tic_Tac_Toe.c,698 :: 		void XO_Reset(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Tic_Tac_Toe.c,700 :: 		memset(XO_matrix, 0, 9);
MOVS	R2, #9
SXTH	R2, R2
MOVS	R1, #0
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_matrix+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_matrix+0)
BL	_memset+0
;Tic_Tac_Toe.c,701 :: 		victory = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_victory+0)
MOVT	R0, #hi_addr(_victory+0)
STRB	R1, [R0, #0]
;Tic_Tac_Toe.c,702 :: 		XO_Turn = 0xFF;
MOVS	R1, #255
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_Turn+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_Turn+0)
STRB	R1, [R0, #0]
;Tic_Tac_Toe.c,705 :: 		InitTimer5();
BL	_InitTimer5+0
;Tic_Tac_Toe.c,706 :: 		NVIC_IntDisable(IVT_INT_TIM5);
MOVW	R0, #66
BL	_NVIC_IntDisable+0
;Tic_Tac_Toe.c,707 :: 		TicTacToe_seconds_cnt = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TicTacToe_seconds_cnt+0)
MOVT	R0, #hi_addr(_TicTacToe_seconds_cnt+0)
STRH	R1, [R0, #0]
;Tic_Tac_Toe.c,708 :: 		doTicTacToeISR();
BL	_doTicTacToeISR+0
;Tic_Tac_Toe.c,710 :: 		if (RF_used){
MOVW	R0, #lo_addr(_RF_used+0)
MOVT	R0, #hi_addr(_RF_used+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_XO_Reset110
;Tic_Tac_Toe.c,711 :: 		RF_Send_Move();
BL	_RF_Send_Move+0
;Tic_Tac_Toe.c,712 :: 		nRF_RX_Mode_Init(64);
MOVS	R0, #64
BL	_nRF_RX_Mode_Init+0
;Tic_Tac_Toe.c,713 :: 		}
L_XO_Reset110:
;Tic_Tac_Toe.c,714 :: 		XO_Turn = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_Turn+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_Turn+0)
STRB	R1, [R0, #0]
;Tic_Tac_Toe.c,715 :: 		XO_First_Move = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(Tic_Tac_Toe_XO_First_Move+0)
MOVT	R0, #hi_addr(Tic_Tac_Toe_XO_First_Move+0)
STRB	R1, [R0, #0]
;Tic_Tac_Toe.c,716 :: 		MyTurn = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Myturn+0)
MOVT	R0, #hi_addr(_Myturn+0)
STRB	R1, [R0, #0]
;Tic_Tac_Toe.c,717 :: 		LED_B = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(LED_B+0)
MOVT	R0, #hi_addr(LED_B+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,718 :: 		LED_R = 0;
MOVW	R0, #lo_addr(LED_R+0)
MOVT	R0, #hi_addr(LED_R+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,719 :: 		LED_G = 0;
MOVW	R0, #lo_addr(LED_G+0)
MOVT	R0, #hi_addr(LED_G+0)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,722 :: 		TFT_Ext_Image(220, 16, game_table_bmp, 1);          // from SD card
MOVS	R3, #1
MOVW	R2, _game_table_bmp
MOVT	R2, _game_table_bmp+2
MOVS	R1, #16
MOVS	R0, #220
BL	_TFT_Ext_Image+0
;Tic_Tac_Toe.c,723 :: 		Label38.Caption = Label38_Caption;
MOVW	R1, #lo_addr(_Label38_Caption+0)
MOVT	R1, #hi_addr(_Label38_Caption+0)
MOVW	R0, #lo_addr(_Label38+16)
MOVT	R0, #hi_addr(_Label38+16)
STR	R1, [R0, #0]
;Tic_Tac_Toe.c,724 :: 		ReDrawLabel(Box8.Color, &Label38, 120, 50);
MOVW	R0, #lo_addr(_Box8+28)
MOVT	R0, #hi_addr(_Box8+28)
LDRH	R0, [R0, #0]
MOVS	R3, #50
MOVS	R2, #120
MOVW	R1, #lo_addr(_Label38+0)
MOVT	R1, #hi_addr(_Label38+0)
BL	_RedrawLabel+0
;Tic_Tac_Toe.c,725 :: 		}
L_end_XO_Reset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _XO_Reset
_ButtonClick:
;Tic_Tac_Toe.c,734 :: 		void ButtonClick(TButton *Butt, char No){
; No start address is: 4 (R1)
SUB	SP, SP, #8
STR	LR, [SP, #0]
UXTB	R5, R1
; No end address is: 4 (R1)
; No start address is: 20 (R5)
;Tic_Tac_Toe.c,736 :: 		if (victory == 0){
MOVW	R2, #lo_addr(_victory+0)
MOVT	R2, #hi_addr(_victory+0)
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	NE
BNE	L_ButtonClick111
;Tic_Tac_Toe.c,737 :: 		if (MyTurn == 0){               // first move detected
MOVW	R2, #lo_addr(_Myturn+0)
MOVT	R2, #hi_addr(_Myturn+0)
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	NE
BNE	L_ButtonClick112
;Tic_Tac_Toe.c,738 :: 		MyTurn = XO_Turn;
MOVW	R2, #lo_addr(Tic_Tac_Toe_XO_Turn+0)
MOVT	R2, #hi_addr(Tic_Tac_Toe_XO_Turn+0)
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_Myturn+0)
MOVT	R2, #hi_addr(_Myturn+0)
STRB	R3, [R2, #0]
;Tic_Tac_Toe.c,739 :: 		NVIC_IntEnable(IVT_INT_TIM5); // start to measure game duration
MOVW	R0, #66
BL	_NVIC_IntEnable+0
;Tic_Tac_Toe.c,740 :: 		}
L_ButtonClick112:
;Tic_Tac_Toe.c,742 :: 		if (XO_turn == MyTurn){
MOVW	R2, #lo_addr(_Myturn+0)
MOVT	R2, #hi_addr(_Myturn+0)
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(Tic_Tac_Toe_XO_Turn+0)
MOVT	R2, #hi_addr(Tic_Tac_Toe_XO_Turn+0)
LDRB	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_ButtonClick113
;Tic_Tac_Toe.c,744 :: 		if (XO_Set_New_State(No)){
UXTB	R0, R5
BL	_XO_Set_New_State+0
CMP	R0, #0
IT	EQ
BEQ	L_ButtonClick114
;Tic_Tac_Toe.c,746 :: 		XO_Process(No);
UXTB	R0, R5
; No end address is: 20 (R5)
BL	_XO_Process+0
;Tic_Tac_Toe.c,748 :: 		if (RF_used){
MOVW	R2, #lo_addr(_RF_used+0)
MOVT	R2, #hi_addr(_RF_used+0)
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_ButtonClick115
;Tic_Tac_Toe.c,749 :: 		LED_G = 0;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(LED_G+0)
MOVT	R2, #hi_addr(LED_G+0)
STR	R3, [R2, #0]
;Tic_Tac_Toe.c,750 :: 		LED_R = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(LED_R+0)
MOVT	R2, #hi_addr(LED_R+0)
STR	R3, [R2, #0]
;Tic_Tac_Toe.c,752 :: 		if (RF_Send_Move() == 0)
BL	_RF_Send_Move+0
CMP	R0, #0
IT	NE
BNE	L_ButtonClick116
;Tic_Tac_Toe.c,753 :: 		RF_Send_Failed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_RF_Send_Failed+0)
MOVT	R2, #hi_addr(_RF_Send_Failed+0)
STRB	R3, [R2, #0]
IT	AL
BAL	L_ButtonClick117
L_ButtonClick116:
;Tic_Tac_Toe.c,755 :: 		RF_Send_Failed = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_RF_Send_Failed+0)
MOVT	R2, #hi_addr(_RF_Send_Failed+0)
STRB	R3, [R2, #0]
L_ButtonClick117:
;Tic_Tac_Toe.c,757 :: 		nRF_RX_Mode_Init(64);
MOVS	R0, #64
BL	_nRF_RX_Mode_Init+0
;Tic_Tac_Toe.c,758 :: 		}
IT	AL
BAL	L_ButtonClick118
L_ButtonClick115:
;Tic_Tac_Toe.c,761 :: 		MyTurn = XO_Turn;
MOVW	R4, #lo_addr(Tic_Tac_Toe_XO_Turn+0)
MOVT	R4, #hi_addr(Tic_Tac_Toe_XO_Turn+0)
LDRB	R3, [R4, #0]
MOVW	R2, #lo_addr(_Myturn+0)
MOVT	R2, #hi_addr(_Myturn+0)
STRB	R3, [R2, #0]
;Tic_Tac_Toe.c,762 :: 		if (XO_Turn == 1){
MOV	R2, R4
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_ButtonClick119
;Tic_Tac_Toe.c,763 :: 		LED_G = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(LED_G+0)
MOVT	R2, #hi_addr(LED_G+0)
STR	R3, [R2, #0]
;Tic_Tac_Toe.c,764 :: 		LED_B = 0;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(LED_B+0)
MOVT	R2, #hi_addr(LED_B+0)
STR	R3, [R2, #0]
;Tic_Tac_Toe.c,765 :: 		}
IT	AL
BAL	L_ButtonClick120
L_ButtonClick119:
;Tic_Tac_Toe.c,767 :: 		LED_B = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(LED_B+0)
MOVT	R2, #hi_addr(LED_B+0)
STR	R3, [R2, #0]
;Tic_Tac_Toe.c,768 :: 		LED_G = 0;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(LED_G+0)
MOVT	R2, #hi_addr(LED_G+0)
STR	R3, [R2, #0]
;Tic_Tac_Toe.c,769 :: 		}
L_ButtonClick120:
;Tic_Tac_Toe.c,770 :: 		}
L_ButtonClick118:
;Tic_Tac_Toe.c,772 :: 		Test_Victory();
BL	_Test_Victory+0
;Tic_Tac_Toe.c,773 :: 		TestDraw();
BL	_TestDraw+0
;Tic_Tac_Toe.c,774 :: 		XO_First_Move ++;
MOVW	R3, #lo_addr(Tic_Tac_Toe_XO_First_Move+0)
MOVT	R3, #hi_addr(Tic_Tac_Toe_XO_First_Move+0)
LDRB	R2, [R3, #0]
ADDS	R2, R2, #1
STRB	R2, [R3, #0]
;Tic_Tac_Toe.c,775 :: 		}
L_ButtonClick114:
;Tic_Tac_Toe.c,776 :: 		}
L_ButtonClick113:
;Tic_Tac_Toe.c,777 :: 		}
L_ButtonClick111:
;Tic_Tac_Toe.c,778 :: 		}
L_end_ButtonClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _ButtonClick
Tic_Tac_Toe____?ag:
L_end_Tic_Tac_Toe___?ag:
BX	LR
; end of Tic_Tac_Toe____?ag
