RGB_Light_InitTimer4:
;RGB_Light.c,45 :: 		static void InitTimer4(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;RGB_Light.c,46 :: 		RCC_APB1ENR.TIM4EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;RGB_Light.c,47 :: 		TIM4_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;RGB_Light.c,48 :: 		TIM4_PSC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM4_PSC+0)
MOVT	R0, #hi_addr(TIM4_PSC+0)
STR	R1, [R0, #0]
;RGB_Light.c,49 :: 		TIM4_ARR = 9375;
MOVW	R1, #9375
MOVW	R0, #lo_addr(TIM4_ARR+0)
MOVT	R0, #hi_addr(TIM4_ARR+0)
STR	R1, [R0, #0]
;RGB_Light.c,50 :: 		NVIC_IntEnable(IVT_INT_TIM4);
MOVW	R0, #46
BL	_NVIC_IntEnable+0
;RGB_Light.c,51 :: 		TIM4_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_DIER+0)
MOVT	R0, #hi_addr(TIM4_DIER+0)
STR	R1, [R0, #0]
;RGB_Light.c,52 :: 		TIM4_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;RGB_Light.c,53 :: 		}
L_end_InitTimer4:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of RGB_Light_InitTimer4
_Timer4_SoftPWM_ISR:
;RGB_Light.c,62 :: 		void Timer4_SoftPWM_ISR(){
;RGB_Light.c,63 :: 		SoftPWM_pr++;
MOVW	R2, #lo_addr(RGB_Light_SoftPWM_pr+0)
MOVT	R2, #hi_addr(RGB_Light_SoftPWM_pr+0)
LDRH	R0, [R2, #0]
ADDS	R1, R0, #1
UXTH	R1, R1
STRH	R1, [R2, #0]
;RGB_Light.c,64 :: 		if (SoftPWM_pr < SoftPWM_duty){
MOVW	R0, #lo_addr(RGB_Light_SoftPWM_duty+0)
MOVT	R0, #hi_addr(RGB_Light_SoftPWM_duty+0)
LDRH	R0, [R0, #0]
CMP	R1, R0
IT	CS
BCS	L_Timer4_SoftPWM_ISR0
;RGB_Light.c,65 :: 		LED_R = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(LED_R+0)
MOVT	R0, #hi_addr(LED_R+0)
STR	R1, [R0, #0]
;RGB_Light.c,66 :: 		}
IT	AL
BAL	L_Timer4_SoftPWM_ISR1
L_Timer4_SoftPWM_ISR0:
;RGB_Light.c,68 :: 		LED_R = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(LED_R+0)
MOVT	R0, #hi_addr(LED_R+0)
STR	R1, [R0, #0]
;RGB_Light.c,69 :: 		}
L_Timer4_SoftPWM_ISR1:
;RGB_Light.c,70 :: 		if (SoftPWM_pr > 31)
MOVW	R0, #lo_addr(RGB_Light_SoftPWM_pr+0)
MOVT	R0, #hi_addr(RGB_Light_SoftPWM_pr+0)
LDRH	R0, [R0, #0]
CMP	R0, #31
IT	LS
BLS	L_Timer4_SoftPWM_ISR2
;RGB_Light.c,71 :: 		SoftPWM_pr = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(RGB_Light_SoftPWM_pr+0)
MOVT	R0, #hi_addr(RGB_Light_SoftPWM_pr+0)
STRH	R1, [R0, #0]
L_Timer4_SoftPWM_ISR2:
;RGB_Light.c,72 :: 		}
L_end_Timer4_SoftPWM_ISR:
BX	LR
; end of _Timer4_SoftPWM_ISR
_RGB_Init:
;RGB_Light.c,81 :: 		void RGB_Init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;RGB_Light.c,82 :: 		pwm_period1 = PWM_TIM3_Init(5000);
MOVW	R0, #5000
BL	_PWM_TIM3_Init+0
MOVW	R1, #lo_addr(RGB_Light_pwm_period1+0)
MOVT	R1, #hi_addr(RGB_Light_pwm_period1+0)
STRH	R0, [R1, #0]
;RGB_Light.c,83 :: 		pwm_period2 = PWM_TIM2_Init(5000);
MOVW	R0, #5000
BL	_PWM_TIM2_Init+0
MOVW	R1, #lo_addr(RGB_Light_pwm_period2+0)
MOVT	R1, #hi_addr(RGB_Light_pwm_period2+0)
STRH	R0, [R1, #0]
;RGB_Light.c,85 :: 		PWM_TIM3_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL1);  // Set current duty for PWM_TIM1
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_PWM_TIM3_Set_Duty+0
;RGB_Light.c,86 :: 		PWM_TIM2_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL2);  // Set current duty for PWM_TIM4
MOVS	R2, #1
MOVS	R1, #0
MOVS	R0, #0
BL	_PWM_TIM2_Set_Duty+0
;RGB_Light.c,88 :: 		PWM_TIM3_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM3_CH1_PB4);   // Starts PWM channel1 on PB4
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM3_CH1_PB4+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM3_CH1_PB4+0)
MOVS	R0, #0
BL	_PWM_TIM3_Start+0
;RGB_Light.c,89 :: 		PWM_TIM2_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM2_CH2_PB3);   // Starts PWM channel2 on PB3
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM2_CH2_PB3+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM2_CH2_PB3+0)
MOVS	R0, #1
BL	_PWM_TIM2_Start+0
;RGB_Light.c,91 :: 		if (Init_FAT())                                          // displays background picture
BL	_Init_FAT+0
CMP	R0, #0
IT	EQ
BEQ	L_RGB_Init3
;RGB_Light.c,92 :: 		TFT_Ext_Image(0, 38, rgb_bitmap_bmp, 1);
MOVS	R3, #1
MOVW	R2, _rgb_bitmap_bmp
MOVT	R2, _rgb_bitmap_bmp+2
MOVS	R1, #38
MOVS	R0, #0
BL	_TFT_Ext_Image+0
L_RGB_Init3:
;RGB_Light.c,94 :: 		GPIO_Digital_Output(&GPIOG_BASE, _GPIO_PINMASK_15);      // Sets default values for softPWM
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOG_BASE+0)
MOVT	R0, #hi_addr(GPIOG_BASE+0)
BL	_GPIO_Digital_Output+0
;RGB_Light.c,95 :: 		SoftPWM_pr = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(RGB_Light_SoftPWM_pr+0)
MOVT	R0, #hi_addr(RGB_Light_SoftPWM_pr+0)
STRH	R1, [R0, #0]
;RGB_Light.c,96 :: 		SoftPWM_duty = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(RGB_Light_SoftPWM_duty+0)
MOVT	R0, #hi_addr(RGB_Light_SoftPWM_duty+0)
STRH	R1, [R0, #0]
;RGB_Light.c,97 :: 		InitTimer4();
BL	RGB_Light_InitTimer4+0
;RGB_Light.c,99 :: 		}
L_end_RGB_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RGB_Init
RGB_Light_GetColor_FromSD:
;RGB_Light.c,108 :: 		static unsigned int GetColor_FromSD(unsigned long Img, unsigned int xc, unsigned int yc){
; yc start address is: 8 (R2)
; xc start address is: 4 (R1)
; Img start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; yc end address is: 8 (R2)
; xc end address is: 4 (R1)
; Img end address is: 0 (R0)
; Img start address is: 0 (R0)
; xc start address is: 4 (R1)
; yc start address is: 8 (R2)
;RGB_Light.c,116 :: 		offset = Img + 6 + ((long)(480) * (yc - 1) + xc) * 2;
ADDS	R5, R0, #6
; Img end address is: 0 (R0)
SUBS	R4, R2, #1
UXTH	R4, R4
; yc end address is: 8 (R2)
MOV	R3, #480
MULS	R3, R4, R3
ADDS	R3, R3, R1
; xc end address is: 4 (R1)
LSLS	R3, R3, #1
ADDS	R4, R5, R3
;RGB_Light.c,120 :: 		ptr = MyTFT_Get_Data(offset,count,&readed);
ADD	R3, SP, #4
MOV	R2, R3
MOVW	R1, #2
MOV	R0, R4
BL	_MyTFT_Get_Data+0
;RGB_Light.c,123 :: 		color_temp = (*ptr++);
LDRB	R3, [R0, #0]
; color_temp start address is: 4 (R1)
UXTB	R1, R3
ADDS	R3, R0, #1
;RGB_Light.c,124 :: 		color_temp += (*ptr) << 8;
LDRB	R3, [R3, #0]
LSLS	R3, R3, #8
UXTH	R3, R3
ADDS	R3, R1, R3
; color_temp end address is: 4 (R1)
;RGB_Light.c,126 :: 		return color_temp;
UXTH	R0, R3
;RGB_Light.c,127 :: 		}
L_end_GetColor_FromSD:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of RGB_Light_GetColor_FromSD
RGB_Light_GetColor_FromFlash:
;RGB_Light.c,136 :: 		static unsigned int GetColor_FromFlash(TImage *Img, unsigned int xc, unsigned int yc){
; yc start address is: 8 (R2)
; xc start address is: 4 (R1)
; Img start address is: 0 (R0)
MOV	R4, R0
; yc end address is: 8 (R2)
; xc end address is: 4 (R1)
; Img end address is: 0 (R0)
; Img start address is: 16 (R4)
; xc start address is: 4 (R1)
; yc start address is: 8 (R2)
;RGB_Light.c,139 :: 		pColor = Img->Picture_Name + 6;
ADDW	R3, R4, #16
LDR	R3, [R3, #0]
ADDS	R3, R3, #6
; pColor start address is: 0 (R0)
MOV	R0, R3
;RGB_Light.c,140 :: 		pColor = pColor + ((long)(Img->Width) * (yc - 1) + xc) * 2;
ADDW	R3, R4, #10
; Img end address is: 16 (R4)
LDRH	R3, [R3, #0]
UXTH	R4, R3
SUBS	R3, R2, #1
UXTH	R3, R3
; yc end address is: 8 (R2)
MULS	R3, R4, R3
ADDS	R3, R3, R1
; xc end address is: 4 (R1)
LSLS	R3, R3, #1
ADDS	R4, R0, R3
; pColor end address is: 0 (R0)
;RGB_Light.c,141 :: 		color_temp = (*pColor++);
LDRB	R3, [R4, #0]
; color_temp start address is: 0 (R0)
UXTB	R0, R3
ADDS	R3, R4, #1
;RGB_Light.c,142 :: 		color_temp += (*pColor) << 8;
LDRB	R3, [R3, #0]
LSLS	R3, R3, #8
UXTH	R3, R3
ADDS	R3, R0, R3
; color_temp end address is: 0 (R0)
;RGB_Light.c,144 :: 		return color_temp;
UXTH	R0, R3
;RGB_Light.c,145 :: 		}
L_end_GetColor_FromFlash:
BX	LR
; end of RGB_Light_GetColor_FromFlash
RGB_Light_DisplayColor:
;RGB_Light.c,154 :: 		static void DisplayColor(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;RGB_Light.c,155 :: 		Circle1.Color = MyColors.color_16bit;
MOVW	R0, #lo_addr(RGB_Light_MyColors+4)
MOVT	R0, #hi_addr(RGB_Light_MyColors+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Circle1+26)
MOVT	R0, #hi_addr(_Circle1+26)
STRH	R1, [R0, #0]
;RGB_Light.c,156 :: 		DrawCircle(&Circle1);
MOVW	R0, #lo_addr(_Circle1+0)
MOVT	R0, #hi_addr(_Circle1+0)
BL	_DrawCircle+0
;RGB_Light.c,157 :: 		}
L_end_DisplayColor:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of RGB_Light_DisplayColor
RGB_Light_Display_color_text:
;RGB_Light.c,166 :: 		static void Display_color_text(TLabel *label, short val) {
; val start address is: 4 (R1)
SUB	SP, SP, #32
STR	LR, [SP, #0]
STR	R0, [SP, #28]
SXTB	R7, R1
; val end address is: 4 (R1)
; val start address is: 28 (R7)
;RGB_Light.c,170 :: 		ptr = label->Caption;
LDR	R2, [SP, #28]
ADDS	R2, #16
LDR	R2, [R2, #0]
STR	R2, [SP, #24]
;RGB_Light.c,171 :: 		TFT_Set_Pen(RGBLight.Color,  0);
MOVW	R2, #lo_addr(_RGBLight+0)
MOVT	R2, #hi_addr(_RGBLight+0)
LDRH	R2, [R2, #0]
MOVS	R1, #0
UXTH	R0, R2
BL	_TFT_Set_Pen+0
;RGB_Light.c,172 :: 		TFT_Set_Brush(1, RGBLight.Color, 0, 0, 0, 0);
MOVS	R4, #0
MOVS	R3, #0
MOVW	R2, #lo_addr(_RGBLight+0)
MOVT	R2, #hi_addr(_RGBLight+0)
LDRH	R2, [R2, #0]
PUSH	(R4)
PUSH	(R3)
MOVS	R3, #0
UXTH	R1, R2
MOVS	R2, #0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;RGB_Light.c,173 :: 		ShortToStr(val, text);
ADD	R2, SP, #4
MOV	R1, R2
SXTB	R0, R7
; val end address is: 28 (R7)
BL	_ShortToStr+0
;RGB_Light.c,174 :: 		strcpy(text1, ptr);
ADD	R2, SP, #11
LDR	R1, [SP, #24]
MOV	R0, R2
BL	_strcpy+0
;RGB_Light.c,175 :: 		strcat(text1, text);
ADD	R3, SP, #4
ADD	R2, SP, #11
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;RGB_Light.c,176 :: 		TFT_Rectangle(label->Left, Label->Top, label->Left + 55, Label->Top + 20);
LDR	R2, [SP, #28]
ADDS	R2, #8
LDRH	R3, [R2, #0]
ADDW	R5, R3, #20
LDR	R2, [SP, #28]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
ADDW	R4, R2, #55
SXTH	R3, R3
SXTH	R2, R2
SXTH	R1, R3
SXTH	R3, R5
SXTH	R0, R2
SXTH	R2, R4
BL	_TFT_Rectangle+0
;RGB_Light.c,177 :: 		label->Caption = text1;
LDR	R2, [SP, #28]
ADDW	R3, R2, #16
ADD	R2, SP, #11
STR	R2, [R3, #0]
;RGB_Light.c,178 :: 		Drawlabel(label);
LDR	R0, [SP, #28]
BL	_DrawLabel+0
;RGB_Light.c,179 :: 		label->Caption = ptr;
LDR	R2, [SP, #28]
ADDW	R3, R2, #16
LDR	R2, [SP, #24]
STR	R2, [R3, #0]
;RGB_Light.c,180 :: 		}
L_end_Display_color_text:
LDR	LR, [SP, #0]
ADD	SP, SP, #32
BX	LR
; end of RGB_Light_Display_color_text
RGB_Light_Drive_RGB_Diode:
;RGB_Light.c,189 :: 		static void Drive_RGB_Diode(TColors *colors){
; colors start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R6, R0
; colors end address is: 0 (R0)
; colors start address is: 24 (R6)
;RGB_Light.c,190 :: 		PWM_TIM2_Set_Duty((int)pwm_period2 / 64 * colors->Green, _PWM_NON_INVERTED, _PWM_CHANNEL2);
MOVW	R1, #lo_addr(RGB_Light_pwm_period2+0)
MOVT	R1, #hi_addr(RGB_Light_pwm_period2+0)
LDRSH	R1, [R1, #0]
ASRS	R2, R1, #6
SXTH	R2, R2
ADDS	R1, R6, #1
LDRB	R1, [R1, #0]
MULS	R1, R2, R1
MOVS	R2, #1
UXTH	R0, R1
MOVS	R1, #0
BL	_PWM_TIM2_Set_Duty+0
;RGB_Light.c,191 :: 		PWM_TIM3_Set_Duty((int)pwm_period1 / 32 * colors->Blue, _PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVW	R1, #lo_addr(RGB_Light_pwm_period1+0)
MOVT	R1, #hi_addr(RGB_Light_pwm_period1+0)
LDRSH	R1, [R1, #0]
ASRS	R2, R1, #5
SXTH	R2, R2
ADDS	R1, R6, #2
LDRB	R1, [R1, #0]
MULS	R1, R2, R1
MOVS	R2, #0
UXTH	R0, R1
MOVS	R1, #0
BL	_PWM_TIM3_Set_Duty+0
;RGB_Light.c,192 :: 		SoftPWM_duty = colors->Red;
LDRB	R2, [R6, #0]
; colors end address is: 24 (R6)
MOVW	R1, #lo_addr(RGB_Light_SoftPWM_duty+0)
MOVT	R1, #hi_addr(RGB_Light_SoftPWM_duty+0)
STRH	R2, [R1, #0]
;RGB_Light.c,193 :: 		}
L_end_Drive_RGB_Diode:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of RGB_Light_Drive_RGB_Diode
_RGB_OFF:
;RGB_Light.c,202 :: 		void RGB_OFF(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;RGB_Light.c,203 :: 		PWM_TIM3_Stop(_PWM_CHANNEL1);
MOVS	R0, #0
BL	_PWM_TIM3_Stop+0
;RGB_Light.c,204 :: 		PWM_TIM2_Stop(_PWM_CHANNEL2);
MOVS	R0, #1
BL	_PWM_TIM2_Stop+0
;RGB_Light.c,205 :: 		TIM4_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;RGB_Light.c,206 :: 		TIM4_DIER.UIE = 0;
MOVW	R0, #lo_addr(TIM4_DIER+0)
MOVT	R0, #hi_addr(TIM4_DIER+0)
STR	R1, [R0, #0]
;RGB_Light.c,207 :: 		NVIC_IntDisable(IVT_INT_TIM4);
MOVW	R0, #46
BL	_NVIC_IntDisable+0
;RGB_Light.c,208 :: 		LED_R = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(LED_R+0)
MOVT	R0, #hi_addr(LED_R+0)
STR	R1, [R0, #0]
;RGB_Light.c,209 :: 		}
L_end_RGB_OFF:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RGB_OFF
_PickColor:
;RGB_Light.c,218 :: 		void PickColor(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;RGB_Light.c,220 :: 		ycoo = Ycoord - 38;
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R0, [R0, #0]
SUBW	R2, R0, #38
MOVW	R0, #lo_addr(RGB_Light_ycoo+0)
MOVT	R0, #hi_addr(RGB_Light_ycoo+0)
STRH	R2, [R0, #0]
;RGB_Light.c,221 :: 		xcoo = Xcoord;
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(RGB_Light_xcoo+0)
MOVT	R0, #hi_addr(RGB_Light_xcoo+0)
STRH	R1, [R0, #0]
;RGB_Light.c,222 :: 		if (ycoo > 0){
SXTH	R0, R2
CMP	R0, #0
IT	LE
BLE	L_PickColor4
;RGB_Light.c,224 :: 		mycolor = GetColor_FromSD(rgb_bitmap_bmp, xcoo, ycoo); // read color from Sd
MOVW	R0, #lo_addr(RGB_Light_ycoo+0)
MOVT	R0, #hi_addr(RGB_Light_ycoo+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(RGB_Light_xcoo+0)
MOVT	R0, #hi_addr(RGB_Light_xcoo+0)
LDRSH	R0, [R0, #0]
UXTH	R2, R1
UXTH	R1, R0
MOVW	R0, _rgb_bitmap_bmp
MOVT	R0, _rgb_bitmap_bmp+2
BL	RGB_Light_GetColor_FromSD+0
;RGB_Light.c,227 :: 		MyColors.color_16bit = mycolor;
MOVW	R1, #lo_addr(RGB_Light_MyColors+4)
MOVT	R1, #hi_addr(RGB_Light_MyColors+4)
STRH	R0, [R1, #0]
;RGB_Light.c,228 :: 		MyColors.Red = mycolor >> 11;
LSRS	R2, R0, #11
MOVW	R1, #lo_addr(RGB_Light_MyColors+0)
MOVT	R1, #hi_addr(RGB_Light_MyColors+0)
STRB	R2, [R1, #0]
;RGB_Light.c,229 :: 		MyColors.Green = (mycolor >> 5) & 0x3F;
LSRS	R1, R0, #5
UXTH	R1, R1
AND	R2, R1, #63
MOVW	R1, #lo_addr(RGB_Light_MyColors+1)
MOVT	R1, #hi_addr(RGB_Light_MyColors+1)
STRB	R2, [R1, #0]
;RGB_Light.c,230 :: 		MyColors.Blue = mycolor & 0x1F;
AND	R1, R0, #31
MOVW	R0, #lo_addr(RGB_Light_MyColors+2)
MOVT	R0, #hi_addr(RGB_Light_MyColors+2)
STRB	R1, [R0, #0]
;RGB_Light.c,233 :: 		DisplayColor();
BL	RGB_Light_DisplayColor+0
;RGB_Light.c,234 :: 		Display_color_text(&Label11, MyColors.Red);
MOVW	R0, #lo_addr(RGB_Light_MyColors+0)
MOVT	R0, #hi_addr(RGB_Light_MyColors+0)
LDRB	R0, [R0, #0]
SXTB	R1, R0
MOVW	R0, #lo_addr(_Label11+0)
MOVT	R0, #hi_addr(_Label11+0)
BL	RGB_Light_Display_color_text+0
;RGB_Light.c,235 :: 		Display_color_text(&Label12, MyColors.Green);
MOVW	R0, #lo_addr(RGB_Light_MyColors+1)
MOVT	R0, #hi_addr(RGB_Light_MyColors+1)
LDRB	R0, [R0, #0]
SXTB	R1, R0
MOVW	R0, #lo_addr(_Label12+0)
MOVT	R0, #hi_addr(_Label12+0)
BL	RGB_Light_Display_color_text+0
;RGB_Light.c,236 :: 		Display_color_text(&Label13, MyColors.Blue);
MOVW	R0, #lo_addr(RGB_Light_MyColors+2)
MOVT	R0, #hi_addr(RGB_Light_MyColors+2)
LDRB	R0, [R0, #0]
SXTB	R1, R0
MOVW	R0, #lo_addr(_Label13+0)
MOVT	R0, #hi_addr(_Label13+0)
BL	RGB_Light_Display_color_text+0
;RGB_Light.c,239 :: 		Drive_RGB_Diode(&MyColors);
MOVW	R0, #lo_addr(RGB_Light_MyColors+0)
MOVT	R0, #hi_addr(RGB_Light_MyColors+0)
BL	RGB_Light_Drive_RGB_Diode+0
;RGB_Light.c,240 :: 		}
L_PickColor4:
;RGB_Light.c,241 :: 		}
L_end_PickColor:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PickColor
