_Power_Man_Init:
;Power_management.c,37 :: 		void Power_Man_Init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Power_management.c,38 :: 		GPIO_Analog_Input(&GPIOF_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Analog_Input+0
;Power_management.c,39 :: 		ADC3_Init();
BL	_ADC3_Init+0
;Power_management.c,42 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_9);            // USB_VBUS
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
;Power_management.c,43 :: 		GPIO_Digital_Input(&GPIOF_BASE, _GPIO_PINMASK_3);            // DC_VBUS
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Input+0
;Power_management.c,44 :: 		GPIO_Digital_Input(&GPIOF_BASE, _GPIO_PINMASK_4);            // BAT_STAT
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Input+0
;Power_management.c,46 :: 		Power_State_Old.Battery_state = -1;
MOVS	R1, #-1
MOVW	R0, #lo_addr(_Power_State_Old+0)
MOVT	R0, #hi_addr(_Power_State_Old+0)
STRB	R1, [R0, #0]
;Power_management.c,47 :: 		Power_State_Old.Source = -1;
MOVS	R1, #-1
MOVW	R0, #lo_addr(_Power_State_Old+1)
MOVT	R0, #hi_addr(_Power_State_Old+1)
STRB	R1, [R0, #0]
;Power_management.c,48 :: 		Power_State_Old.ui_Voltage = -1;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Power_State_Old+8)
MOVT	R0, #hi_addr(_Power_State_Old+8)
STRH	R1, [R0, #0]
;Power_management.c,49 :: 		}
L_end_Power_Man_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Power_Man_Init
Power_management_ui_ReadBatteryVoltage:
;Power_management.c,58 :: 		static unsigned int ui_ReadBatteryVoltage() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Power_management.c,62 :: 		for(cntr=0, ui_voltage=0; cntr<8; cntr++) {
; cntr start address is: 20 (R5)
MOVS	R5, #0
; ui_voltage start address is: 24 (R6)
MOVS	R6, #0
; ui_voltage end address is: 24 (R6)
; cntr end address is: 20 (R5)
L_Power_management_ui_ReadBatteryVoltage0:
; ui_voltage start address is: 24 (R6)
; cntr start address is: 20 (R5)
CMP	R5, #8
IT	CS
BCS	L_Power_management_ui_ReadBatteryVoltage1
;Power_management.c,63 :: 		ui_voltage += ADC3_Get_Sample(4);
MOVS	R0, #4
BL	_ADC3_Get_Sample+0
ADDS	R6, R6, R0
UXTH	R6, R6
;Power_management.c,64 :: 		Delay_10ms();
BL	_Delay_10ms+0
;Power_management.c,62 :: 		for(cntr=0, ui_voltage=0; cntr<8; cntr++) {
ADDS	R5, R5, #1
UXTB	R5, R5
;Power_management.c,65 :: 		}
; cntr end address is: 20 (R5)
IT	AL
BAL	L_Power_management_ui_ReadBatteryVoltage0
L_Power_management_ui_ReadBatteryVoltage1:
;Power_management.c,66 :: 		return ui_voltage >> 3;
LSRS	R0, R6, #3
; ui_voltage end address is: 24 (R6)
;Power_management.c,67 :: 		}
L_end_ui_ReadBatteryVoltage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of Power_management_ui_ReadBatteryVoltage
Power_management_f_ReadBatteryVoltage:
;Power_management.c,76 :: 		static float f_ReadBatteryVoltage() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Power_management.c,79 :: 		ui_voltage = ui_ReadBatteryVoltage();
BL	Power_management_ui_ReadBatteryVoltage+0
;Power_management.c,80 :: 		return (float)ui_voltage*0.0015;         // 3*2.048/4096
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #39846
MOVT	R0, #15044
VMOV	S0, R0
VMUL.F32	S0, S1, S0
;Power_management.c,81 :: 		}
L_end_f_ReadBatteryVoltage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of Power_management_f_ReadBatteryVoltage
Power_management_GetPowerStatus:
;Power_management.c,90 :: 		static void GetPowerStatus() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Power_management.c,91 :: 		Power_State.f_Voltage   = f_ReadBatteryVoltage();
BL	Power_management_f_ReadBatteryVoltage+0
MOVW	R0, #lo_addr(_Power_State+4)
MOVT	R0, #hi_addr(_Power_State+4)
VSTR	#1, S0, [R0, #0]
;Power_management.c,92 :: 		Power_State.ui_Voltage  = (unsigned int)(Power_State.f_Voltage*100);
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
UXTH	R1, R1
MOVW	R0, #lo_addr(_Power_State+8)
MOVT	R0, #hi_addr(_Power_State+8)
STRH	R1, [R0, #0]
;Power_management.c,94 :: 		if (DC_VBUS==0)
MOVW	R1, #lo_addr(GPIOF_IDR+0)
MOVT	R1, #hi_addr(GPIOF_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_Power_management_GetPowerStatus3
;Power_management.c,95 :: 		Power_State.Source = SRC_DC;      // Works if Vdc>5V(Vusb), if Vdc<Vusb priority is changed
MOVS	R1, #2
MOVW	R0, #lo_addr(_Power_State+1)
MOVT	R0, #hi_addr(_Power_State+1)
STRB	R1, [R0, #0]
IT	AL
BAL	L_Power_management_GetPowerStatus4
L_Power_management_GetPowerStatus3:
;Power_management.c,97 :: 		if (USB_VBUS==1)
MOVW	R1, #lo_addr(GPIOA_IDR+0)
MOVT	R1, #hi_addr(GPIOA_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_Power_management_GetPowerStatus5
;Power_management.c,98 :: 		Power_State.Source = SRC_USB;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Power_State+1)
MOVT	R0, #hi_addr(_Power_State+1)
STRB	R1, [R0, #0]
IT	AL
BAL	L_Power_management_GetPowerStatus6
L_Power_management_GetPowerStatus5:
;Power_management.c,100 :: 		Power_State.Source = SRC_BATTERY;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Power_State+1)
MOVT	R0, #hi_addr(_Power_State+1)
STRB	R1, [R0, #0]
;Power_management.c,101 :: 		}
L_Power_management_GetPowerStatus6:
;Power_management.c,102 :: 		}
L_Power_management_GetPowerStatus4:
;Power_management.c,104 :: 		if (BAT_STAT == 0)
MOVW	R1, #lo_addr(GPIOF_IDR+0)
MOVT	R1, #hi_addr(GPIOF_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_Power_management_GetPowerStatus7
;Power_management.c,105 :: 		Power_State.Battery_state = BAT_CHARGING;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Power_State+0)
MOVT	R0, #hi_addr(_Power_State+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_Power_management_GetPowerStatus8
L_Power_management_GetPowerStatus7:
;Power_management.c,107 :: 		if (Power_State.Source == SRC_BATTERY) {
MOVW	R0, #lo_addr(_Power_State+1)
MOVT	R0, #hi_addr(_Power_State+1)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Power_management_GetPowerStatus9
;Power_management.c,108 :: 		Power_State.Battery_state = BAT_DISCHARGING;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Power_State+0)
MOVT	R0, #hi_addr(_Power_State+0)
STRB	R1, [R0, #0]
;Power_management.c,109 :: 		}
IT	AL
BAL	L_Power_management_GetPowerStatus10
L_Power_management_GetPowerStatus9:
;Power_management.c,111 :: 		if (Power_State.ui_Voltage>=425)
MOVW	R0, #lo_addr(_Power_State+8)
MOVT	R0, #hi_addr(_Power_State+8)
LDRH	R1, [R0, #0]
MOVW	R0, #425
CMP	R1, R0
IT	CC
BCC	L_Power_management_GetPowerStatus11
;Power_management.c,112 :: 		Power_State.Battery_state = BAT_UNPLUGGED;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Power_State+0)
MOVT	R0, #hi_addr(_Power_State+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_Power_management_GetPowerStatus12
L_Power_management_GetPowerStatus11:
;Power_management.c,114 :: 		Power_State.Battery_state = BAT_FULL;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Power_State+0)
MOVT	R0, #hi_addr(_Power_State+0)
STRB	R1, [R0, #0]
L_Power_management_GetPowerStatus12:
;Power_management.c,115 :: 		}
L_Power_management_GetPowerStatus10:
;Power_management.c,116 :: 		}
L_Power_management_GetPowerStatus8:
;Power_management.c,117 :: 		}
L_end_GetPowerStatus:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of Power_management_GetPowerStatus
_checkPowerM:
;Power_management.c,127 :: 		void checkPowerM(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Power_management.c,130 :: 		GetPowerStatus();
BL	Power_management_GetPowerStatus+0
;Power_management.c,132 :: 		if (Power_State.Battery_state != Power_State_Old.Battery_state) {
MOVW	R0, #lo_addr(_Power_State_Old+0)
MOVT	R0, #hi_addr(_Power_State_Old+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_Power_State+0)
MOVT	R0, #hi_addr(_Power_State+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L_checkPowerM13
;Power_management.c,133 :: 		switch (Power_State.Battery_state) {
IT	AL
BAL	L_checkPowerM14
;Power_management.c,134 :: 		case BAT_CHARGING   : {
L_checkPowerM16:
;Power_management.c,135 :: 		}; break;
IT	AL
BAL	L_checkPowerM15
;Power_management.c,136 :: 		case BAT_DISCHARGING: {
L_checkPowerM17:
;Power_management.c,137 :: 		}; break;
IT	AL
BAL	L_checkPowerM15
;Power_management.c,138 :: 		case BAT_FULL       : {
L_checkPowerM18:
;Power_management.c,139 :: 		}; break;
IT	AL
BAL	L_checkPowerM15
;Power_management.c,140 :: 		case BAT_UNPLUGGED  : {
L_checkPowerM19:
;Power_management.c,141 :: 		}; break;
IT	AL
BAL	L_checkPowerM15
;Power_management.c,142 :: 		}
L_checkPowerM14:
MOVW	R0, #lo_addr(_Power_State+0)
MOVT	R0, #hi_addr(_Power_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_checkPowerM16
MOVW	R0, #lo_addr(_Power_State+0)
MOVT	R0, #hi_addr(_Power_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_checkPowerM17
MOVW	R0, #lo_addr(_Power_State+0)
MOVT	R0, #hi_addr(_Power_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_checkPowerM18
MOVW	R0, #lo_addr(_Power_State+0)
MOVT	R0, #hi_addr(_Power_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_checkPowerM19
L_checkPowerM15:
;Power_management.c,144 :: 		Power_State_Old.Battery_state = Power_State.Battery_state;
MOVW	R0, #lo_addr(_Power_State+0)
MOVT	R0, #hi_addr(_Power_State+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_Power_State_Old+0)
MOVT	R0, #hi_addr(_Power_State_Old+0)
STRB	R1, [R0, #0]
;Power_management.c,145 :: 		}
L_checkPowerM13:
;Power_management.c,147 :: 		if (Power_State.Source != Power_State_Old.Source) {
MOVW	R0, #lo_addr(_Power_State_Old+1)
MOVT	R0, #hi_addr(_Power_State_Old+1)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_Power_State+1)
MOVT	R0, #hi_addr(_Power_State+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L_checkPowerM20
;Power_management.c,148 :: 		switch (Power_State.Source) {
IT	AL
BAL	L_checkPowerM21
;Power_management.c,149 :: 		case SRC_BATTERY: {
L_checkPowerM23:
;Power_management.c,150 :: 		}; break;
IT	AL
BAL	L_checkPowerM22
;Power_management.c,151 :: 		case SRC_DC     : {
L_checkPowerM24:
;Power_management.c,152 :: 		}; break;
IT	AL
BAL	L_checkPowerM22
;Power_management.c,153 :: 		case SRC_USB    : {
L_checkPowerM25:
;Power_management.c,154 :: 		}; break;
IT	AL
BAL	L_checkPowerM22
;Power_management.c,155 :: 		}
L_checkPowerM21:
MOVW	R0, #lo_addr(_Power_State+1)
MOVT	R0, #hi_addr(_Power_State+1)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_checkPowerM23
MOVW	R0, #lo_addr(_Power_State+1)
MOVT	R0, #hi_addr(_Power_State+1)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_checkPowerM24
MOVW	R0, #lo_addr(_Power_State+1)
MOVT	R0, #hi_addr(_Power_State+1)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_checkPowerM25
L_checkPowerM22:
;Power_management.c,156 :: 		Power_State_Old.Source = Power_State.Source;
MOVW	R0, #lo_addr(_Power_State+1)
MOVT	R0, #hi_addr(_Power_State+1)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_Power_State_Old+1)
MOVT	R0, #hi_addr(_Power_State_Old+1)
STRB	R1, [R0, #0]
;Power_management.c,157 :: 		}
L_checkPowerM20:
;Power_management.c,159 :: 		if ((Power_State.Battery_state != BAT_UNPLUGGED) && (Display_Bat_Stat)){
MOVW	R0, #lo_addr(_Power_State+0)
MOVT	R0, #hi_addr(_Power_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L__checkPowerM40
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__checkPowerM39
L__checkPowerM36:
;Power_management.c,160 :: 		Bar_Width = ((signed int)Power_State.ui_Voltage - 295) / 5;
MOVW	R0, #lo_addr(_Power_State+8)
MOVT	R0, #hi_addr(_Power_State+8)
LDRSH	R0, [R0, #0]
SUBW	R1, R0, #295
SXTH	R1, R1
MOVS	R0, #5
SXTH	R0, R0
SDIV	R0, R1, R0
SXTH	R0, R0
; Bar_Width start address is: 12 (R3)
SXTH	R3, R0
;Power_management.c,161 :: 		if ((Bar_Width > 0) && (Bar_Width < 25)){
CMP	R0, #0
IT	LE
BLE	L__checkPowerM38
CMP	R3, #25
IT	GE
BGE	L__checkPowerM37
L__checkPowerM35:
;Power_management.c,163 :: 		if (Power_State.ui_Voltage > 330)
MOVW	R0, #lo_addr(_Power_State+8)
MOVT	R0, #hi_addr(_Power_State+8)
LDRH	R0, [R0, #0]
CMP	R0, #330
IT	LS
BLS	L_checkPowerM32
;Power_management.c,164 :: 		TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
STRH	R3, [SP, #4]
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #65535
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDRSH	R3, [SP, #4]
IT	AL
BAL	L_checkPowerM33
L_checkPowerM32:
;Power_management.c,166 :: 		TFT_Set_Brush(1, CL_RED, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
STRH	R3, [SP, #4]
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #63488
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDRSH	R3, [SP, #4]
L_checkPowerM33:
;Power_management.c,167 :: 		TFT_Set_Pen(CL_WHITE, 0);
MOVS	R1, #0
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;Power_management.c,168 :: 		TFT_Rectangle(19, 12, 19 + Bar_width, 19);
ADDW	R0, R3, #19
STRH	R3, [SP, #4]
MOVS	R3, #19
SXTH	R3, R3
SXTH	R2, R0
MOVS	R1, #12
SXTH	R1, R1
MOVS	R0, #19
SXTH	R0, R0
BL	_TFT_Rectangle+0
;Power_management.c,170 :: 		TFT_Set_Brush(1, Speedometer_graphics.Color, 0, 0, 0, 0);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Speedometer_graphics+0)
MOVT	R0, #hi_addr(_Speedometer_graphics+0)
LDRH	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDRSH	R3, [SP, #4]
;Power_management.c,171 :: 		TFT_Set_Pen(CL_WHITE, 0);
MOVS	R1, #0
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;Power_management.c,172 :: 		TFT_Rectangle(19 + Bar_width, 12, 43, 19);
ADDW	R0, R3, #19
; Bar_Width end address is: 12 (R3)
MOVS	R3, #19
SXTH	R3, R3
MOVS	R2, #43
SXTH	R2, R2
MOVS	R1, #12
SXTH	R1, R1
BL	_TFT_Rectangle+0
;Power_management.c,174 :: 		Display_Bat_Stat = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Display_Bat_Stat+0)
MOVT	R0, #hi_addr(_Display_Bat_Stat+0)
STRB	R1, [R0, #0]
;Power_management.c,175 :: 		}
IT	AL
BAL	L_checkPowerM34
;Power_management.c,161 :: 		if ((Bar_Width > 0) && (Bar_Width < 25)){
L__checkPowerM38:
L__checkPowerM37:
;Power_management.c,177 :: 		TFT_Set_Brush(1, Speedometer_graphics.Color, 0, 0, 0, 0);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Speedometer_graphics+0)
MOVT	R0, #hi_addr(_Speedometer_graphics+0)
LDRH	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Power_management.c,178 :: 		TFT_Set_Pen(CL_WHITE, 0);
MOVS	R1, #0
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;Power_management.c,179 :: 		TFT_Rectangle(19, 12, 43, 19);
MOVS	R3, #19
SXTH	R3, R3
MOVS	R2, #43
SXTH	R2, R2
MOVS	R1, #12
SXTH	R1, R1
MOVS	R0, #19
SXTH	R0, R0
BL	_TFT_Rectangle+0
;Power_management.c,180 :: 		}
L_checkPowerM34:
;Power_management.c,159 :: 		if ((Power_State.Battery_state != BAT_UNPLUGGED) && (Display_Bat_Stat)){
L__checkPowerM40:
L__checkPowerM39:
;Power_management.c,182 :: 		}
L_end_checkPowerM:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _checkPowerM
