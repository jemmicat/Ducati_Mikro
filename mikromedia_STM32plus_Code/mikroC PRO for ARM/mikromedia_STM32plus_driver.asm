_Write_to_Data_Lines:
;mikromedia_STM32plus_driver.c,38 :: 		void Write_to_Data_Lines(unsigned char _hi, unsigned char _lo) {
; _lo start address is: 4 (R1)
; _lo end address is: 4 (R1)
; _lo start address is: 4 (R1)
;mikromedia_STM32plus_driver.c,40 :: 		temp = GPIOE_ODR;
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
; temp start address is: 8 (R2)
LDR	R2, [R2, #0]
;mikromedia_STM32plus_driver.c,41 :: 		temp &= 0x00FF;
AND	R3, R2, #255
UXTH	R3, R3
; temp end address is: 8 (R2)
;mikromedia_STM32plus_driver.c,42 :: 		GPIOE_ODR = temp | (_hi << 8);
LSLS	R2, R0, #8
UXTH	R2, R2
ORRS	R3, R2
UXTH	R3, R3
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,43 :: 		temp = GPIOG_ODR;
MOVW	R2, #lo_addr(GPIOG_ODR+0)
MOVT	R2, #hi_addr(GPIOG_ODR+0)
LDR	R0, [R2, #0]
;mikromedia_STM32plus_driver.c,44 :: 		temp &= 0xFF00;
AND	R2, R0, #65280
UXTH	R2, R2
;mikromedia_STM32plus_driver.c,45 :: 		GPIOG_ODR = temp | _lo;
ORR	R3, R2, R1, LSL #0
UXTH	R3, R3
; _lo end address is: 4 (R1)
MOVW	R2, #lo_addr(GPIOG_ODR+0)
MOVT	R2, #hi_addr(GPIOG_ODR+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,46 :: 		}
L_end_Write_to_Data_Lines:
BX	LR
; end of _Write_to_Data_Lines
_TFT_mikromedia_Set_Index:
;mikromedia_STM32plus_driver.c,48 :: 		void TFT_mikromedia_Set_Index(unsigned short index) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_driver.c,49 :: 		TFT_RS = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,50 :: 		Write_to_Data_Lines(0, index);
UXTB	R1, R0
MOVS	R0, #0
BL	_Write_to_Data_Lines+0
;mikromedia_STM32plus_driver.c,51 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,52 :: 		asm nop;
NOP
;mikromedia_STM32plus_driver.c,53 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,54 :: 		}
L_end_TFT_mikromedia_Set_Index:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_mikromedia_Set_Index
_TFT_mikromedia_Write_Command:
;mikromedia_STM32plus_driver.c,56 :: 		void TFT_mikromedia_Write_Command(unsigned short cmd) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_driver.c,57 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,58 :: 		Write_to_Data_Lines(0, cmd);
UXTB	R1, R0
MOVS	R0, #0
BL	_Write_to_Data_Lines+0
;mikromedia_STM32plus_driver.c,59 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,60 :: 		asm nop;
NOP
;mikromedia_STM32plus_driver.c,61 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,62 :: 		}
L_end_TFT_mikromedia_Write_Command:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_mikromedia_Write_Command
_TFT_Write_to_16bitPort:
;mikromedia_STM32plus_driver.c,64 :: 		void TFT_Write_to_16bitPort(unsigned int _data) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRH	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,65 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,66 :: 		Write_to_Data_Lines(Hi(_data), Lo(_data));
ADD	R3, SP, #4
LDRB	R1, [R3, #0]
UXTB	R2, R1
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
UXTB	R0, R1
UXTB	R1, R2
BL	_Write_to_Data_Lines+0
;mikromedia_STM32plus_driver.c,67 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,68 :: 		asm nop;
NOP
;mikromedia_STM32plus_driver.c,69 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,70 :: 		}
L_end_TFT_Write_to_16bitPort:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _TFT_Write_to_16bitPort
mikromedia_STM32plus_driver_InitializeTouchPanel:
;mikromedia_STM32plus_driver.c,71 :: 		static void InitializeTouchPanel() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_driver.c,72 :: 		TFT_Set_Active(&TFT_mikromedia_Set_Index, &TFT_mikromedia_Write_Command, &TFT_Write_to_16bitPort);
MOVW	R2, #lo_addr(_TFT_Write_to_16bitPort+0)
MOVT	R2, #hi_addr(_TFT_Write_to_16bitPort+0)
MOVW	R1, #lo_addr(_TFT_mikromedia_Write_Command+0)
MOVT	R1, #hi_addr(_TFT_mikromedia_Write_Command+0)
MOVW	R0, #lo_addr(_TFT_mikromedia_Set_Index+0)
MOVT	R0, #hi_addr(_TFT_mikromedia_Set_Index+0)
BL	_TFT_Set_Active+0
;mikromedia_STM32plus_driver.c,73 :: 		TFT_Init_SSD1963(480, 272);
MOVW	R1, #272
MOVW	R0, #480
BL	_TFT_Init_SSD1963+0
;mikromedia_STM32plus_driver.c,75 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;mikromedia_STM32plus_driver.c,77 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,78 :: 		PressedObject = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PressedObject+0)
MOVT	R0, #hi_addr(_PressedObject+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,79 :: 		PressedObjectType = -1;
MOVW	R1, #65535
SXTH	R1, R1
MOVW	R0, #lo_addr(_PressedObjectType+0)
MOVT	R0, #hi_addr(_PressedObjectType+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,80 :: 		}
L_end_InitializeTouchPanel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of mikromedia_STM32plus_driver_InitializeTouchPanel
mikromedia_STM32plus_driver_InitializeObjects:
;mikromedia_STM32plus_driver.c,522 :: 		static void InitializeObjects() {
;mikromedia_STM32plus_driver.c,523 :: 		Home.Color                     = 0x2D33;
MOVW	R1, #11571
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,524 :: 		Home.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Home+2)
MOVT	R0, #hi_addr(_Home+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,525 :: 		Home.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Home+4)
MOVT	R0, #hi_addr(_Home+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,526 :: 		Home.LabelsCount               = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Home+8)
MOVT	R0, #hi_addr(_Home+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,527 :: 		Home.Labels                    = Screen1_Labels;
MOVW	R1, #lo_addr(_Screen1_Labels+0)
MOVT	R1, #hi_addr(_Screen1_Labels+0)
MOVW	R0, #lo_addr(_Home+12)
MOVT	R0, #hi_addr(_Home+12)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,528 :: 		Home.ImagesCount               = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Home+16)
MOVT	R0, #hi_addr(_Home+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,529 :: 		Home.Images                    = Screen1_Images;
MOVW	R1, #lo_addr(_Screen1_Images+0)
MOVT	R1, #hi_addr(_Screen1_Images+0)
MOVW	R0, #lo_addr(_Home+20)
MOVT	R0, #hi_addr(_Home+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,530 :: 		Home.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Home+24)
MOVT	R0, #hi_addr(_Home+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,531 :: 		Home.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Home+32)
MOVT	R0, #hi_addr(_Home+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,532 :: 		Home.ObjectsCount              = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Home+6)
MOVT	R0, #hi_addr(_Home+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,534 :: 		Accelerometer.Color                     = 0x4229;
MOVW	R1, #16937
MOVW	R0, #lo_addr(_Accelerometer+0)
MOVT	R0, #hi_addr(_Accelerometer+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,535 :: 		Accelerometer.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Accelerometer+2)
MOVT	R0, #hi_addr(_Accelerometer+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,536 :: 		Accelerometer.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Accelerometer+4)
MOVT	R0, #hi_addr(_Accelerometer+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,537 :: 		Accelerometer.LabelsCount               = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Accelerometer+8)
MOVT	R0, #hi_addr(_Accelerometer+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,538 :: 		Accelerometer.Labels                    = Screen2_Labels;
MOVW	R1, #lo_addr(_Screen2_Labels+0)
MOVT	R1, #hi_addr(_Screen2_Labels+0)
MOVW	R0, #lo_addr(_Accelerometer+12)
MOVT	R0, #hi_addr(_Accelerometer+12)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,539 :: 		Accelerometer.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Accelerometer+16)
MOVT	R0, #hi_addr(_Accelerometer+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,540 :: 		Accelerometer.Images                    = Screen2_Images;
MOVW	R1, #lo_addr(_Screen2_Images+0)
MOVT	R1, #hi_addr(_Screen2_Images+0)
MOVW	R0, #lo_addr(_Accelerometer+20)
MOVT	R0, #hi_addr(_Accelerometer+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,541 :: 		Accelerometer.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Accelerometer+24)
MOVT	R0, #hi_addr(_Accelerometer+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,542 :: 		Accelerometer.BoxesCount                = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Accelerometer+32)
MOVT	R0, #hi_addr(_Accelerometer+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,543 :: 		Accelerometer.Boxes                     = Screen2_Boxes;
MOVW	R1, #lo_addr(_Screen2_Boxes+0)
MOVT	R1, #hi_addr(_Screen2_Boxes+0)
MOVW	R0, #lo_addr(_Accelerometer+36)
MOVT	R0, #hi_addr(_Accelerometer+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,544 :: 		Accelerometer.ObjectsCount              = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Accelerometer+6)
MOVT	R0, #hi_addr(_Accelerometer+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,546 :: 		RGBLight.Color                     = 0x4229;
MOVW	R1, #16937
MOVW	R0, #lo_addr(_RGBLight+0)
MOVT	R0, #hi_addr(_RGBLight+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,547 :: 		RGBLight.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_RGBLight+2)
MOVT	R0, #hi_addr(_RGBLight+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,548 :: 		RGBLight.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_RGBLight+4)
MOVT	R0, #hi_addr(_RGBLight+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,549 :: 		RGBLight.LabelsCount               = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_RGBLight+8)
MOVT	R0, #hi_addr(_RGBLight+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,550 :: 		RGBLight.Labels                    = Screen3_Labels;
MOVW	R1, #lo_addr(_Screen3_Labels+0)
MOVT	R1, #hi_addr(_Screen3_Labels+0)
MOVW	R0, #lo_addr(_RGBLight+12)
MOVT	R0, #hi_addr(_RGBLight+12)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,551 :: 		RGBLight.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RGBLight+16)
MOVT	R0, #hi_addr(_RGBLight+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,552 :: 		RGBLight.Images                    = Screen3_Images;
MOVW	R1, #lo_addr(_Screen3_Images+0)
MOVT	R1, #hi_addr(_Screen3_Images+0)
MOVW	R0, #lo_addr(_RGBLight+20)
MOVT	R0, #hi_addr(_RGBLight+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,553 :: 		RGBLight.CirclesCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RGBLight+24)
MOVT	R0, #hi_addr(_RGBLight+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,554 :: 		RGBLight.Circles                   = Screen3_Circles;
MOVW	R1, #lo_addr(_Screen3_Circles+0)
MOVT	R1, #hi_addr(_Screen3_Circles+0)
MOVW	R0, #lo_addr(_RGBLight+28)
MOVT	R0, #hi_addr(_RGBLight+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,555 :: 		RGBLight.BoxesCount                = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_RGBLight+32)
MOVT	R0, #hi_addr(_RGBLight+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,556 :: 		RGBLight.Boxes                     = Screen3_Boxes;
MOVW	R1, #lo_addr(_Screen3_Boxes+0)
MOVT	R1, #hi_addr(_Screen3_Boxes+0)
MOVW	R0, #lo_addr(_RGBLight+36)
MOVT	R0, #hi_addr(_RGBLight+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,557 :: 		RGBLight.ObjectsCount              = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_RGBLight+6)
MOVT	R0, #hi_addr(_RGBLight+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,559 :: 		Clock.Color                     = 0x54C3;
MOVW	R1, #21699
MOVW	R0, #lo_addr(_Clock+0)
MOVT	R0, #hi_addr(_Clock+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,560 :: 		Clock.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Clock+2)
MOVT	R0, #hi_addr(_Clock+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,561 :: 		Clock.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Clock+4)
MOVT	R0, #hi_addr(_Clock+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,562 :: 		Clock.LabelsCount               = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Clock+8)
MOVT	R0, #hi_addr(_Clock+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,563 :: 		Clock.Labels                    = Screen4_Labels;
MOVW	R1, #lo_addr(_Screen4_Labels+0)
MOVT	R1, #hi_addr(_Screen4_Labels+0)
MOVW	R0, #lo_addr(_Clock+12)
MOVT	R0, #hi_addr(_Clock+12)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,564 :: 		Clock.ImagesCount               = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Clock+16)
MOVT	R0, #hi_addr(_Clock+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,565 :: 		Clock.Images                    = Screen4_Images;
MOVW	R1, #lo_addr(_Screen4_Images+0)
MOVT	R1, #hi_addr(_Screen4_Images+0)
MOVW	R0, #lo_addr(_Clock+20)
MOVT	R0, #hi_addr(_Clock+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,566 :: 		Clock.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Clock+24)
MOVT	R0, #hi_addr(_Clock+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,567 :: 		Clock.BoxesCount                = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Clock+32)
MOVT	R0, #hi_addr(_Clock+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,568 :: 		Clock.Boxes                     = Screen4_Boxes;
MOVW	R1, #lo_addr(_Screen4_Boxes+0)
MOVT	R1, #hi_addr(_Screen4_Boxes+0)
MOVW	R0, #lo_addr(_Clock+36)
MOVT	R0, #hi_addr(_Clock+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,569 :: 		Clock.ObjectsCount              = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Clock+6)
MOVT	R0, #hi_addr(_Clock+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,571 :: 		Sensors.Color                     = 0xA948;
MOVW	R1, #43336
MOVW	R0, #lo_addr(_Sensors+0)
MOVT	R0, #hi_addr(_Sensors+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,572 :: 		Sensors.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Sensors+2)
MOVT	R0, #hi_addr(_Sensors+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,573 :: 		Sensors.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Sensors+4)
MOVT	R0, #hi_addr(_Sensors+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,574 :: 		Sensors.LabelsCount               = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Sensors+8)
MOVT	R0, #hi_addr(_Sensors+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,575 :: 		Sensors.Labels                    = Screen5_Labels;
MOVW	R1, #lo_addr(_Screen5_Labels+0)
MOVT	R1, #hi_addr(_Screen5_Labels+0)
MOVW	R0, #lo_addr(_Sensors+12)
MOVT	R0, #hi_addr(_Sensors+12)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,576 :: 		Sensors.ImagesCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Sensors+16)
MOVT	R0, #hi_addr(_Sensors+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,577 :: 		Sensors.Images                    = Screen5_Images;
MOVW	R1, #lo_addr(_Screen5_Images+0)
MOVT	R1, #hi_addr(_Screen5_Images+0)
MOVW	R0, #lo_addr(_Sensors+20)
MOVT	R0, #hi_addr(_Sensors+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,578 :: 		Sensors.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Sensors+24)
MOVT	R0, #hi_addr(_Sensors+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,579 :: 		Sensors.BoxesCount                = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Sensors+32)
MOVT	R0, #hi_addr(_Sensors+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,580 :: 		Sensors.Boxes                     = Screen5_Boxes;
MOVW	R1, #lo_addr(_Screen5_Boxes+0)
MOVT	R1, #hi_addr(_Screen5_Boxes+0)
MOVW	R0, #lo_addr(_Sensors+36)
MOVT	R0, #hi_addr(_Sensors+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,581 :: 		Sensors.ObjectsCount              = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Sensors+6)
MOVT	R0, #hi_addr(_Sensors+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,583 :: 		MP3_SD.Color                     = 0x4457;
MOVW	R1, #17495
MOVW	R0, #lo_addr(_MP3_SD+0)
MOVT	R0, #hi_addr(_MP3_SD+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,584 :: 		MP3_SD.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_MP3_SD+2)
MOVT	R0, #hi_addr(_MP3_SD+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,585 :: 		MP3_SD.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_MP3_SD+4)
MOVT	R0, #hi_addr(_MP3_SD+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,586 :: 		MP3_SD.LabelsCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_MP3_SD+8)
MOVT	R0, #hi_addr(_MP3_SD+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,587 :: 		MP3_SD.Labels                    = Screen6_Labels;
MOVW	R1, #lo_addr(_Screen6_Labels+0)
MOVT	R1, #hi_addr(_Screen6_Labels+0)
MOVW	R0, #lo_addr(_MP3_SD+12)
MOVT	R0, #hi_addr(_MP3_SD+12)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,588 :: 		MP3_SD.ImagesCount               = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_MP3_SD+16)
MOVT	R0, #hi_addr(_MP3_SD+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,589 :: 		MP3_SD.Images                    = Screen6_Images;
MOVW	R1, #lo_addr(_Screen6_Images+0)
MOVT	R1, #hi_addr(_Screen6_Images+0)
MOVW	R0, #lo_addr(_MP3_SD+20)
MOVT	R0, #hi_addr(_MP3_SD+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,590 :: 		MP3_SD.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_MP3_SD+24)
MOVT	R0, #hi_addr(_MP3_SD+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,591 :: 		MP3_SD.BoxesCount                = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_MP3_SD+32)
MOVT	R0, #hi_addr(_MP3_SD+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,592 :: 		MP3_SD.Boxes                     = Screen6_Boxes;
MOVW	R1, #lo_addr(_Screen6_Boxes+0)
MOVT	R1, #hi_addr(_Screen6_Boxes+0)
MOVW	R0, #lo_addr(_MP3_SD+36)
MOVT	R0, #hi_addr(_MP3_SD+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,593 :: 		MP3_SD.ObjectsCount              = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_MP3_SD+6)
MOVT	R0, #hi_addr(_MP3_SD+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,595 :: 		MP3_SongList.Color                     = 0x4457;
MOVW	R1, #17495
MOVW	R0, #lo_addr(_MP3_SongList+0)
MOVT	R0, #hi_addr(_MP3_SongList+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,596 :: 		MP3_SongList.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_MP3_SongList+2)
MOVT	R0, #hi_addr(_MP3_SongList+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,597 :: 		MP3_SongList.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_MP3_SongList+4)
MOVT	R0, #hi_addr(_MP3_SongList+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,598 :: 		MP3_SongList.LabelsCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_MP3_SongList+8)
MOVT	R0, #hi_addr(_MP3_SongList+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,599 :: 		MP3_SongList.Labels                    = Screen7_Labels;
MOVW	R1, #lo_addr(_Screen7_Labels+0)
MOVT	R1, #hi_addr(_Screen7_Labels+0)
MOVW	R0, #lo_addr(_MP3_SongList+12)
MOVT	R0, #hi_addr(_MP3_SongList+12)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,600 :: 		MP3_SongList.ImagesCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_MP3_SongList+16)
MOVT	R0, #hi_addr(_MP3_SongList+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,601 :: 		MP3_SongList.Images                    = Screen7_Images;
MOVW	R1, #lo_addr(_Screen7_Images+0)
MOVT	R1, #hi_addr(_Screen7_Images+0)
MOVW	R0, #lo_addr(_MP3_SongList+20)
MOVT	R0, #hi_addr(_MP3_SongList+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,602 :: 		MP3_SongList.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_MP3_SongList+24)
MOVT	R0, #hi_addr(_MP3_SongList+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,603 :: 		MP3_SongList.BoxesCount                = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_MP3_SongList+32)
MOVT	R0, #hi_addr(_MP3_SongList+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,604 :: 		MP3_SongList.Boxes                     = Screen7_Boxes;
MOVW	R1, #lo_addr(_Screen7_Boxes+0)
MOVT	R1, #hi_addr(_Screen7_Boxes+0)
MOVW	R0, #lo_addr(_MP3_SongList+36)
MOVT	R0, #hi_addr(_MP3_SongList+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,605 :: 		MP3_SongList.ObjectsCount              = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_MP3_SongList+6)
MOVT	R0, #hi_addr(_MP3_SongList+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,607 :: 		MP3_Player.Color                     = 0x4457;
MOVW	R1, #17495
MOVW	R0, #lo_addr(_MP3_Player+0)
MOVT	R0, #hi_addr(_MP3_Player+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,608 :: 		MP3_Player.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_MP3_Player+2)
MOVT	R0, #hi_addr(_MP3_Player+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,609 :: 		MP3_Player.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_MP3_Player+4)
MOVT	R0, #hi_addr(_MP3_Player+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,610 :: 		MP3_Player.LabelsCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_MP3_Player+8)
MOVT	R0, #hi_addr(_MP3_Player+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,611 :: 		MP3_Player.Labels                    = Screen8_Labels;
MOVW	R1, #lo_addr(_Screen8_Labels+0)
MOVT	R1, #hi_addr(_Screen8_Labels+0)
MOVW	R0, #lo_addr(_MP3_Player+12)
MOVT	R0, #hi_addr(_MP3_Player+12)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,612 :: 		MP3_Player.ImagesCount               = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_MP3_Player+16)
MOVT	R0, #hi_addr(_MP3_Player+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,613 :: 		MP3_Player.Images                    = Screen8_Images;
MOVW	R1, #lo_addr(_Screen8_Images+0)
MOVT	R1, #hi_addr(_Screen8_Images+0)
MOVW	R0, #lo_addr(_MP3_Player+20)
MOVT	R0, #hi_addr(_MP3_Player+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,614 :: 		MP3_Player.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_MP3_Player+24)
MOVT	R0, #hi_addr(_MP3_Player+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,615 :: 		MP3_Player.BoxesCount                = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_MP3_Player+32)
MOVT	R0, #hi_addr(_MP3_Player+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,616 :: 		MP3_Player.Boxes                     = Screen8_Boxes;
MOVW	R1, #lo_addr(_Screen8_Boxes+0)
MOVT	R1, #hi_addr(_Screen8_Boxes+0)
MOVW	R0, #lo_addr(_MP3_Player+36)
MOVT	R0, #hi_addr(_MP3_Player+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,617 :: 		MP3_Player.ObjectsCount              = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_MP3_Player+6)
MOVT	R0, #hi_addr(_MP3_Player+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,619 :: 		SlideShow.Color                     = 0x4229;
MOVW	R1, #16937
MOVW	R0, #lo_addr(_SlideShow+0)
MOVT	R0, #hi_addr(_SlideShow+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,620 :: 		SlideShow.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_SlideShow+2)
MOVT	R0, #hi_addr(_SlideShow+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,621 :: 		SlideShow.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_SlideShow+4)
MOVT	R0, #hi_addr(_SlideShow+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,622 :: 		SlideShow.LabelsCount               = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_SlideShow+8)
MOVT	R0, #hi_addr(_SlideShow+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,623 :: 		SlideShow.Labels                    = Screen9_Labels;
MOVW	R1, #lo_addr(_Screen9_Labels+0)
MOVT	R1, #hi_addr(_Screen9_Labels+0)
MOVW	R0, #lo_addr(_SlideShow+12)
MOVT	R0, #hi_addr(_SlideShow+12)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,624 :: 		SlideShow.ImagesCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_SlideShow+16)
MOVT	R0, #hi_addr(_SlideShow+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,625 :: 		SlideShow.Images                    = Screen9_Images;
MOVW	R1, #lo_addr(_Screen9_Images+0)
MOVT	R1, #hi_addr(_Screen9_Images+0)
MOVW	R0, #lo_addr(_SlideShow+20)
MOVT	R0, #hi_addr(_SlideShow+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,626 :: 		SlideShow.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SlideShow+24)
MOVT	R0, #hi_addr(_SlideShow+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,627 :: 		SlideShow.BoxesCount                = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_SlideShow+32)
MOVT	R0, #hi_addr(_SlideShow+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,628 :: 		SlideShow.Boxes                     = Screen9_Boxes;
MOVW	R1, #lo_addr(_Screen9_Boxes+0)
MOVT	R1, #hi_addr(_Screen9_Boxes+0)
MOVW	R0, #lo_addr(_SlideShow+36)
MOVT	R0, #hi_addr(_SlideShow+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,629 :: 		SlideShow.ObjectsCount              = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_SlideShow+6)
MOVT	R0, #hi_addr(_SlideShow+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,631 :: 		Boot.Color                     = 0x5AEB;
MOVW	R1, #23275
MOVW	R0, #lo_addr(_Boot+0)
MOVT	R0, #hi_addr(_Boot+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,632 :: 		Boot.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Boot+2)
MOVT	R0, #hi_addr(_Boot+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,633 :: 		Boot.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Boot+4)
MOVT	R0, #hi_addr(_Boot+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,634 :: 		Boot.LabelsCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Boot+8)
MOVT	R0, #hi_addr(_Boot+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,635 :: 		Boot.ImagesCount               = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Boot+16)
MOVT	R0, #hi_addr(_Boot+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,636 :: 		Boot.Images                    = Screen10_Images;
MOVW	R1, #lo_addr(_Screen10_Images+0)
MOVT	R1, #hi_addr(_Screen10_Images+0)
MOVW	R0, #lo_addr(_Boot+20)
MOVT	R0, #hi_addr(_Boot+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,637 :: 		Boot.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Boot+24)
MOVT	R0, #hi_addr(_Boot+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,638 :: 		Boot.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Boot+32)
MOVT	R0, #hi_addr(_Boot+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,639 :: 		Boot.ObjectsCount              = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Boot+6)
MOVT	R0, #hi_addr(_Boot+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,642 :: 		Image1.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Image1+0)
MOVT	R0, #hi_addr(_Image1+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,643 :: 		Image1.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+4)
MOVT	R0, #hi_addr(_Image1+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,644 :: 		Image1.Left            = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Image1+6)
MOVT	R0, #hi_addr(_Image1+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,645 :: 		Image1.Top             = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Image1+8)
MOVT	R0, #hi_addr(_Image1+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,646 :: 		Image1.Width           = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image1+10)
MOVT	R0, #hi_addr(_Image1+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,647 :: 		Image1.Height          = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image1+12)
MOVT	R0, #hi_addr(_Image1+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,648 :: 		Image1.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+22)
MOVT	R0, #hi_addr(_Image1+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,649 :: 		Image1.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+23)
MOVT	R0, #hi_addr(_Image1+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,650 :: 		Image1.Picture_Name    = icon_accel_bmp;
MOVW	R1, #lo_addr(_icon_accel_bmp+0)
MOVT	R1, #hi_addr(_icon_accel_bmp+0)
MOVW	R0, #lo_addr(_Image1+16)
MOVT	R0, #hi_addr(_Image1+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,651 :: 		Image1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+20)
MOVT	R0, #hi_addr(_Image1+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,652 :: 		Image1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+21)
MOVT	R0, #hi_addr(_Image1+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,653 :: 		Image1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+24)
MOVT	R0, #hi_addr(_Image1+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,654 :: 		Image1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+28)
MOVT	R0, #hi_addr(_Image1+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,655 :: 		Image1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+32)
MOVT	R0, #hi_addr(_Image1+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,656 :: 		Image1.OnPressPtr      = Image1OnPress;
MOVW	R1, #lo_addr(_Image1OnPress+0)
MOVT	R1, #hi_addr(_Image1OnPress+0)
MOVW	R0, #lo_addr(_Image1+36)
MOVT	R0, #hi_addr(_Image1+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,658 :: 		Image3.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Image3+0)
MOVT	R0, #hi_addr(_Image3+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,659 :: 		Image3.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+4)
MOVT	R0, #hi_addr(_Image3+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,660 :: 		Image3.Left            = 360;
MOVW	R1, #360
MOVW	R0, #lo_addr(_Image3+6)
MOVT	R0, #hi_addr(_Image3+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,661 :: 		Image3.Top             = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_Image3+8)
MOVT	R0, #hi_addr(_Image3+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,662 :: 		Image3.Width           = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image3+10)
MOVT	R0, #hi_addr(_Image3+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,663 :: 		Image3.Height          = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image3+12)
MOVT	R0, #hi_addr(_Image3+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,664 :: 		Image3.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+22)
MOVT	R0, #hi_addr(_Image3+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,665 :: 		Image3.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+23)
MOVT	R0, #hi_addr(_Image3+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,666 :: 		Image3.Picture_Name    = icon_rgb_light_bmp;
MOVW	R1, #lo_addr(_icon_rgb_light_bmp+0)
MOVT	R1, #hi_addr(_icon_rgb_light_bmp+0)
MOVW	R0, #lo_addr(_Image3+16)
MOVT	R0, #hi_addr(_Image3+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,667 :: 		Image3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+20)
MOVT	R0, #hi_addr(_Image3+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,668 :: 		Image3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+21)
MOVT	R0, #hi_addr(_Image3+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,669 :: 		Image3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+24)
MOVT	R0, #hi_addr(_Image3+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,670 :: 		Image3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+28)
MOVT	R0, #hi_addr(_Image3+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,671 :: 		Image3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+32)
MOVT	R0, #hi_addr(_Image3+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,672 :: 		Image3.OnPressPtr      = Image3OnPress;
MOVW	R1, #lo_addr(_Image3OnPress+0)
MOVT	R1, #hi_addr(_Image3OnPress+0)
MOVW	R0, #lo_addr(_Image3+36)
MOVT	R0, #hi_addr(_Image3+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,674 :: 		Label5.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Label5+0)
MOVT	R0, #hi_addr(_Label5+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,675 :: 		Label5.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label5+4)
MOVT	R0, #hi_addr(_Label5+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,676 :: 		Label5.Left            = 146;
MOVS	R1, #146
MOVW	R0, #lo_addr(_Label5+6)
MOVT	R0, #hi_addr(_Label5+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,677 :: 		Label5.Top             = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label5+8)
MOVT	R0, #hi_addr(_Label5+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,678 :: 		Label5.Width           = 174;
MOVS	R1, #174
MOVW	R0, #lo_addr(_Label5+10)
MOVT	R0, #hi_addr(_Label5+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,679 :: 		Label5.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Label5+12)
MOVT	R0, #hi_addr(_Label5+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,680 :: 		Label5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+26)
MOVT	R0, #hi_addr(_Label5+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,681 :: 		Label5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+27)
MOVT	R0, #hi_addr(_Label5+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,682 :: 		Label5.Caption         = Label5_Caption;
MOVW	R1, #lo_addr(_Label5_Caption+0)
MOVT	R1, #hi_addr(_Label5_Caption+0)
MOVW	R0, #lo_addr(_Label5+16)
MOVT	R0, #hi_addr(_Label5+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,683 :: 		Label5.FontName        = Open_Sans_Light21x24_Regular;
MOVW	R5, #lo_addr(_Open_Sans_Light21x24_Regular+0)
MOVT	R5, #hi_addr(_Open_Sans_Light21x24_Regular+0)
MOVW	R0, #lo_addr(_Label5+20)
MOVT	R0, #hi_addr(_Label5+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,684 :: 		Label5.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label5+24)
MOVT	R0, #hi_addr(_Label5+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,685 :: 		Label5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+28)
MOVT	R0, #hi_addr(_Label5+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,686 :: 		Label5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+32)
MOVT	R0, #hi_addr(_Label5+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,687 :: 		Label5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+36)
MOVT	R0, #hi_addr(_Label5+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,688 :: 		Label5.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+40)
MOVT	R0, #hi_addr(_Label5+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,690 :: 		Label7.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Label7+0)
MOVT	R0, #hi_addr(_Label7+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,691 :: 		Label7.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label7+4)
MOVT	R0, #hi_addr(_Label7+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,692 :: 		Label7.Left            = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Label7+6)
MOVT	R0, #hi_addr(_Label7+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,693 :: 		Label7.Top             = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_Label7+8)
MOVT	R0, #hi_addr(_Label7+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,694 :: 		Label7.Width           = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_Label7+10)
MOVT	R0, #hi_addr(_Label7+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,695 :: 		Label7.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label7+12)
MOVT	R0, #hi_addr(_Label7+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,696 :: 		Label7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+26)
MOVT	R0, #hi_addr(_Label7+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,697 :: 		Label7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+27)
MOVT	R0, #hi_addr(_Label7+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,698 :: 		Label7.Caption         = Label7_Caption;
MOVW	R1, #lo_addr(_Label7_Caption+0)
MOVT	R1, #hi_addr(_Label7_Caption+0)
MOVW	R0, #lo_addr(_Label7+16)
MOVT	R0, #hi_addr(_Label7+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,699 :: 		Label7.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R4, #lo_addr(_Open_Sans_Light16x18_Regular+0)
MOVT	R4, #hi_addr(_Open_Sans_Light16x18_Regular+0)
MOVW	R0, #lo_addr(_Label7+20)
MOVT	R0, #hi_addr(_Label7+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,700 :: 		Label7.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label7+24)
MOVT	R0, #hi_addr(_Label7+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,701 :: 		Label7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+28)
MOVT	R0, #hi_addr(_Label7+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,702 :: 		Label7.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+32)
MOVT	R0, #hi_addr(_Label7+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,703 :: 		Label7.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+36)
MOVT	R0, #hi_addr(_Label7+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,704 :: 		Label7.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+40)
MOVT	R0, #hi_addr(_Label7+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,706 :: 		Label8.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Label8+0)
MOVT	R0, #hi_addr(_Label8+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,707 :: 		Label8.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label8+4)
MOVT	R0, #hi_addr(_Label8+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,708 :: 		Label8.Left            = 368;
MOVW	R1, #368
MOVW	R0, #lo_addr(_Label8+6)
MOVT	R0, #hi_addr(_Label8+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,709 :: 		Label8.Top             = 230;
MOVS	R1, #230
MOVW	R0, #lo_addr(_Label8+8)
MOVT	R0, #hi_addr(_Label8+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,710 :: 		Label8.Width           = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Label8+10)
MOVT	R0, #hi_addr(_Label8+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,711 :: 		Label8.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label8+12)
MOVT	R0, #hi_addr(_Label8+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,712 :: 		Label8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label8+26)
MOVT	R0, #hi_addr(_Label8+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,713 :: 		Label8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label8+27)
MOVT	R0, #hi_addr(_Label8+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,714 :: 		Label8.Caption         = Label8_Caption;
MOVW	R1, #lo_addr(_Label8_Caption+0)
MOVT	R1, #hi_addr(_Label8_Caption+0)
MOVW	R0, #lo_addr(_Label8+16)
MOVT	R0, #hi_addr(_Label8+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,715 :: 		Label8.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Label8+20)
MOVT	R0, #hi_addr(_Label8+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,716 :: 		Label8.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label8+24)
MOVT	R0, #hi_addr(_Label8+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,717 :: 		Label8.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+28)
MOVT	R0, #hi_addr(_Label8+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,718 :: 		Label8.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+32)
MOVT	R0, #hi_addr(_Label8+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,719 :: 		Label8.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+36)
MOVT	R0, #hi_addr(_Label8+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,720 :: 		Label8.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+40)
MOVT	R0, #hi_addr(_Label8+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,722 :: 		Image6.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Image6+0)
MOVT	R0, #hi_addr(_Image6+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,723 :: 		Image6.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image6+4)
MOVT	R0, #hi_addr(_Image6+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,724 :: 		Image6.Left            = 150;
MOVS	R1, #150
MOVW	R0, #lo_addr(_Image6+6)
MOVT	R0, #hi_addr(_Image6+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,725 :: 		Image6.Top             = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_Image6+8)
MOVT	R0, #hi_addr(_Image6+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,726 :: 		Image6.Width           = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image6+10)
MOVT	R0, #hi_addr(_Image6+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,727 :: 		Image6.Height          = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image6+12)
MOVT	R0, #hi_addr(_Image6+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,728 :: 		Image6.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image6+22)
MOVT	R0, #hi_addr(_Image6+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,729 :: 		Image6.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+23)
MOVT	R0, #hi_addr(_Image6+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,730 :: 		Image6.Picture_Name    = icon_clock_bmp;
MOVW	R1, #lo_addr(_icon_clock_bmp+0)
MOVT	R1, #hi_addr(_icon_clock_bmp+0)
MOVW	R0, #lo_addr(_Image6+16)
MOVT	R0, #hi_addr(_Image6+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,731 :: 		Image6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+20)
MOVT	R0, #hi_addr(_Image6+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,732 :: 		Image6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+21)
MOVT	R0, #hi_addr(_Image6+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,733 :: 		Image6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image6+24)
MOVT	R0, #hi_addr(_Image6+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,734 :: 		Image6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image6+28)
MOVT	R0, #hi_addr(_Image6+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,735 :: 		Image6.OnClickPtr      = Image6OnClick;
MOVW	R1, #lo_addr(_Image6OnClick+0)
MOVT	R1, #hi_addr(_Image6OnClick+0)
MOVW	R0, #lo_addr(_Image6+32)
MOVT	R0, #hi_addr(_Image6+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,736 :: 		Image6.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image6+36)
MOVT	R0, #hi_addr(_Image6+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,738 :: 		Label14.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Label14+0)
MOVT	R0, #hi_addr(_Label14+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,739 :: 		Label14.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label14+4)
MOVT	R0, #hi_addr(_Label14+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,740 :: 		Label14.Left            = 168;
MOVS	R1, #168
MOVW	R0, #lo_addr(_Label14+6)
MOVT	R0, #hi_addr(_Label14+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,741 :: 		Label14.Top             = 230;
MOVS	R1, #230
MOVW	R0, #lo_addr(_Label14+8)
MOVT	R0, #hi_addr(_Label14+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,742 :: 		Label14.Width           = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_Label14+10)
MOVT	R0, #hi_addr(_Label14+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,743 :: 		Label14.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label14+12)
MOVT	R0, #hi_addr(_Label14+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,744 :: 		Label14.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label14+26)
MOVT	R0, #hi_addr(_Label14+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,745 :: 		Label14.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label14+27)
MOVT	R0, #hi_addr(_Label14+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,746 :: 		Label14.Caption         = Label14_Caption;
MOVW	R1, #lo_addr(_Label14_Caption+0)
MOVT	R1, #hi_addr(_Label14_Caption+0)
MOVW	R0, #lo_addr(_Label14+16)
MOVT	R0, #hi_addr(_Label14+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,747 :: 		Label14.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Label14+20)
MOVT	R0, #hi_addr(_Label14+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,748 :: 		Label14.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label14+24)
MOVT	R0, #hi_addr(_Label14+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,749 :: 		Label14.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+28)
MOVT	R0, #hi_addr(_Label14+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,750 :: 		Label14.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+32)
MOVT	R0, #hi_addr(_Label14+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,751 :: 		Label14.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+36)
MOVT	R0, #hi_addr(_Label14+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,752 :: 		Label14.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+40)
MOVT	R0, #hi_addr(_Label14+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,754 :: 		Image10.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,755 :: 		Image10.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Image10+4)
MOVT	R0, #hi_addr(_Image10+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,756 :: 		Image10.Left            = 392;
MOVW	R1, #392
MOVW	R0, #lo_addr(_Image10+6)
MOVT	R0, #hi_addr(_Image10+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,757 :: 		Image10.Top             = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Image10+8)
MOVT	R0, #hi_addr(_Image10+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,758 :: 		Image10.Width           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Image10+10)
MOVT	R0, #hi_addr(_Image10+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,759 :: 		Image10.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Image10+12)
MOVT	R0, #hi_addr(_Image10+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,760 :: 		Image10.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+22)
MOVT	R0, #hi_addr(_Image10+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,761 :: 		Image10.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image10+23)
MOVT	R0, #hi_addr(_Image10+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,762 :: 		Image10.Picture_Name    = icon_time_bmp;
MOVW	R1, #lo_addr(_icon_time_bmp+0)
MOVT	R1, #hi_addr(_icon_time_bmp+0)
MOVW	R0, #lo_addr(_Image10+16)
MOVT	R0, #hi_addr(_Image10+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,763 :: 		Image10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image10+20)
MOVT	R0, #hi_addr(_Image10+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,764 :: 		Image10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image10+21)
MOVT	R0, #hi_addr(_Image10+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,765 :: 		Image10.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+24)
MOVT	R0, #hi_addr(_Image10+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,766 :: 		Image10.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+28)
MOVT	R0, #hi_addr(_Image10+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,767 :: 		Image10.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+32)
MOVT	R0, #hi_addr(_Image10+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,768 :: 		Image10.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+36)
MOVT	R0, #hi_addr(_Image10+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,770 :: 		Label19.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Label19+0)
MOVT	R0, #hi_addr(_Label19+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,771 :: 		Label19.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Label19+4)
MOVT	R0, #hi_addr(_Label19+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,772 :: 		Label19.Left            = 416;
MOVW	R1, #416
MOVW	R0, #lo_addr(_Label19+6)
MOVT	R0, #hi_addr(_Label19+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,773 :: 		Label19.Top             = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label19+8)
MOVT	R0, #hi_addr(_Label19+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,774 :: 		Label19.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_Label19+10)
MOVT	R0, #hi_addr(_Label19+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,775 :: 		Label19.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label19+12)
MOVT	R0, #hi_addr(_Label19+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,776 :: 		Label19.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label19+26)
MOVT	R0, #hi_addr(_Label19+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,777 :: 		Label19.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label19+27)
MOVT	R0, #hi_addr(_Label19+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,778 :: 		Label19.Caption         = Label19_Caption;
MOVW	R1, #lo_addr(_Label19_Caption+0)
MOVT	R1, #hi_addr(_Label19_Caption+0)
MOVW	R0, #lo_addr(_Label19+16)
MOVT	R0, #hi_addr(_Label19+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,779 :: 		Label19.FontName        = Open_Sans_Light13x16_Regular;
MOVW	R3, #lo_addr(_Open_Sans_Light13x16_Regular+0)
MOVT	R3, #hi_addr(_Open_Sans_Light13x16_Regular+0)
MOVW	R0, #lo_addr(_Label19+20)
MOVT	R0, #hi_addr(_Label19+20)
STR	R3, [R0, #0]
;mikromedia_STM32plus_driver.c,780 :: 		Label19.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label19+24)
MOVT	R0, #hi_addr(_Label19+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,781 :: 		Label19.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+28)
MOVT	R0, #hi_addr(_Label19+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,782 :: 		Label19.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+32)
MOVT	R0, #hi_addr(_Label19+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,783 :: 		Label19.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+36)
MOVT	R0, #hi_addr(_Label19+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,784 :: 		Label19.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+40)
MOVT	R0, #hi_addr(_Label19+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,786 :: 		Image9.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Image9+0)
MOVT	R0, #hi_addr(_Image9+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,787 :: 		Image9.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Image9+4)
MOVT	R0, #hi_addr(_Image9+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,788 :: 		Image9.Left            = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Image9+6)
MOVT	R0, #hi_addr(_Image9+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,789 :: 		Image9.Top             = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_Image9+8)
MOVT	R0, #hi_addr(_Image9+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,790 :: 		Image9.Width           = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image9+10)
MOVT	R0, #hi_addr(_Image9+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,791 :: 		Image9.Height          = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image9+12)
MOVT	R0, #hi_addr(_Image9+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,792 :: 		Image9.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image9+22)
MOVT	R0, #hi_addr(_Image9+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,793 :: 		Image9.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image9+23)
MOVT	R0, #hi_addr(_Image9+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,794 :: 		Image9.Picture_Name    = icon_temp_bmp;
MOVW	R1, #lo_addr(_icon_temp_bmp+0)
MOVT	R1, #hi_addr(_icon_temp_bmp+0)
MOVW	R0, #lo_addr(_Image9+16)
MOVT	R0, #hi_addr(_Image9+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,795 :: 		Image9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image9+20)
MOVT	R0, #hi_addr(_Image9+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,796 :: 		Image9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image9+21)
MOVT	R0, #hi_addr(_Image9+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,797 :: 		Image9.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image9+24)
MOVT	R0, #hi_addr(_Image9+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,798 :: 		Image9.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image9+28)
MOVT	R0, #hi_addr(_Image9+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,799 :: 		Image9.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image9+32)
MOVT	R0, #hi_addr(_Image9+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,800 :: 		Image9.OnPressPtr      = Image9OnPress;
MOVW	R1, #lo_addr(_Image9OnPress+0)
MOVT	R1, #hi_addr(_Image9OnPress+0)
MOVW	R0, #lo_addr(_Image9+36)
MOVT	R0, #hi_addr(_Image9+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,802 :: 		Label20.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Label20+0)
MOVT	R0, #hi_addr(_Label20+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,803 :: 		Label20.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label20+4)
MOVT	R0, #hi_addr(_Label20+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,804 :: 		Label20.Left            = 55;
MOVS	R1, #55
MOVW	R0, #lo_addr(_Label20+6)
MOVT	R0, #hi_addr(_Label20+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,805 :: 		Label20.Top             = 230;
MOVS	R1, #230
MOVW	R0, #lo_addr(_Label20+8)
MOVT	R0, #hi_addr(_Label20+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,806 :: 		Label20.Width           = 60;
MOVS	R1, #60
MOVW	R0, #lo_addr(_Label20+10)
MOVT	R0, #hi_addr(_Label20+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,807 :: 		Label20.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label20+12)
MOVT	R0, #hi_addr(_Label20+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,808 :: 		Label20.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label20+26)
MOVT	R0, #hi_addr(_Label20+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,809 :: 		Label20.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label20+27)
MOVT	R0, #hi_addr(_Label20+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,810 :: 		Label20.Caption         = Label20_Caption;
MOVW	R1, #lo_addr(_Label20_Caption+0)
MOVT	R1, #hi_addr(_Label20_Caption+0)
MOVW	R0, #lo_addr(_Label20+16)
MOVT	R0, #hi_addr(_Label20+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,811 :: 		Label20.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Label20+20)
MOVT	R0, #hi_addr(_Label20+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,812 :: 		Label20.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label20+24)
MOVT	R0, #hi_addr(_Label20+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,813 :: 		Label20.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+28)
MOVT	R0, #hi_addr(_Label20+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,814 :: 		Label20.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+32)
MOVT	R0, #hi_addr(_Label20+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,815 :: 		Label20.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+36)
MOVT	R0, #hi_addr(_Label20+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,816 :: 		Label20.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+40)
MOVT	R0, #hi_addr(_Label20+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,818 :: 		Image16.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Image16+0)
MOVT	R0, #hi_addr(_Image16+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,819 :: 		Image16.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Image16+4)
MOVT	R0, #hi_addr(_Image16+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,820 :: 		Image16.Left            = 360;
MOVW	R1, #360
MOVW	R0, #lo_addr(_Image16+6)
MOVT	R0, #hi_addr(_Image16+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,821 :: 		Image16.Top             = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Image16+8)
MOVT	R0, #hi_addr(_Image16+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,822 :: 		Image16.Width           = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image16+10)
MOVT	R0, #hi_addr(_Image16+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,823 :: 		Image16.Height          = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image16+12)
MOVT	R0, #hi_addr(_Image16+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,824 :: 		Image16.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image16+22)
MOVT	R0, #hi_addr(_Image16+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,825 :: 		Image16.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image16+23)
MOVT	R0, #hi_addr(_Image16+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,826 :: 		Image16.Picture_Name    = icon_mp3_player_bmp;
MOVW	R1, #lo_addr(_icon_mp3_player_bmp+0)
MOVT	R1, #hi_addr(_icon_mp3_player_bmp+0)
MOVW	R0, #lo_addr(_Image16+16)
MOVT	R0, #hi_addr(_Image16+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,827 :: 		Image16.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image16+20)
MOVT	R0, #hi_addr(_Image16+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,828 :: 		Image16.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image16+21)
MOVT	R0, #hi_addr(_Image16+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,829 :: 		Image16.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image16+24)
MOVT	R0, #hi_addr(_Image16+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,830 :: 		Image16.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image16+28)
MOVT	R0, #hi_addr(_Image16+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,831 :: 		Image16.OnClickPtr      = Image16OnClick;
MOVW	R1, #lo_addr(_Image16OnClick+0)
MOVT	R1, #hi_addr(_Image16OnClick+0)
MOVW	R0, #lo_addr(_Image16+32)
MOVT	R0, #hi_addr(_Image16+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,832 :: 		Image16.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image16+36)
MOVT	R0, #hi_addr(_Image16+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,834 :: 		Label25.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Label25+0)
MOVT	R0, #hi_addr(_Label25+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,835 :: 		Label25.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Label25+4)
MOVT	R0, #hi_addr(_Label25+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,836 :: 		Label25.Left            = 360;
MOVW	R1, #360
MOVW	R0, #lo_addr(_Label25+6)
MOVT	R0, #hi_addr(_Label25+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,837 :: 		Label25.Top             = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_Label25+8)
MOVT	R0, #hi_addr(_Label25+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,838 :: 		Label25.Width           = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Label25+10)
MOVT	R0, #hi_addr(_Label25+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,839 :: 		Label25.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label25+12)
MOVT	R0, #hi_addr(_Label25+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,840 :: 		Label25.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label25+26)
MOVT	R0, #hi_addr(_Label25+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,841 :: 		Label25.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label25+27)
MOVT	R0, #hi_addr(_Label25+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,842 :: 		Label25.Caption         = Label25_Caption;
MOVW	R1, #lo_addr(_Label25_Caption+0)
MOVT	R1, #hi_addr(_Label25_Caption+0)
MOVW	R0, #lo_addr(_Label25+16)
MOVT	R0, #hi_addr(_Label25+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,843 :: 		Label25.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Label25+20)
MOVT	R0, #hi_addr(_Label25+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,844 :: 		Label25.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label25+24)
MOVT	R0, #hi_addr(_Label25+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,845 :: 		Label25.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+28)
MOVT	R0, #hi_addr(_Label25+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,846 :: 		Label25.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+32)
MOVT	R0, #hi_addr(_Label25+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,847 :: 		Label25.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+36)
MOVT	R0, #hi_addr(_Label25+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,848 :: 		Label25.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+40)
MOVT	R0, #hi_addr(_Label25+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,850 :: 		Image18.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Image18+0)
MOVT	R0, #hi_addr(_Image18+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,851 :: 		Image18.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Image18+4)
MOVT	R0, #hi_addr(_Image18+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,852 :: 		Image18.Left            = 255;
MOVS	R1, #255
MOVW	R0, #lo_addr(_Image18+6)
MOVT	R0, #hi_addr(_Image18+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,853 :: 		Image18.Top             = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_Image18+8)
MOVT	R0, #hi_addr(_Image18+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,854 :: 		Image18.Width           = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image18+10)
MOVT	R0, #hi_addr(_Image18+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,855 :: 		Image18.Height          = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image18+12)
MOVT	R0, #hi_addr(_Image18+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,856 :: 		Image18.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+22)
MOVT	R0, #hi_addr(_Image18+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,857 :: 		Image18.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image18+23)
MOVT	R0, #hi_addr(_Image18+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,858 :: 		Image18.Picture_Name    = icon_slide_show_bmp;
MOVW	R1, #lo_addr(_icon_slide_show_bmp+0)
MOVT	R1, #hi_addr(_icon_slide_show_bmp+0)
MOVW	R0, #lo_addr(_Image18+16)
MOVT	R0, #hi_addr(_Image18+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,859 :: 		Image18.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image18+20)
MOVT	R0, #hi_addr(_Image18+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,860 :: 		Image18.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image18+21)
MOVT	R0, #hi_addr(_Image18+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,861 :: 		Image18.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+24)
MOVT	R0, #hi_addr(_Image18+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,862 :: 		Image18.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+28)
MOVT	R0, #hi_addr(_Image18+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,863 :: 		Image18.OnClickPtr      = Image18OnClick;
MOVW	R1, #lo_addr(_Image18OnClick+0)
MOVT	R1, #hi_addr(_Image18OnClick+0)
MOVW	R0, #lo_addr(_Image18+32)
MOVT	R0, #hi_addr(_Image18+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,864 :: 		Image18.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+36)
MOVT	R0, #hi_addr(_Image18+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,866 :: 		Label34.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Label34+0)
MOVT	R0, #hi_addr(_Label34+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,867 :: 		Label34.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label34+4)
MOVT	R0, #hi_addr(_Label34+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,868 :: 		Label34.Left            = 254;
MOVS	R1, #254
MOVW	R0, #lo_addr(_Label34+6)
MOVT	R0, #hi_addr(_Label34+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,869 :: 		Label34.Top             = 230;
MOVS	R1, #230
MOVW	R0, #lo_addr(_Label34+8)
MOVT	R0, #hi_addr(_Label34+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,870 :: 		Label34.Width           = 82;
MOVS	R1, #82
MOVW	R0, #lo_addr(_Label34+10)
MOVT	R0, #hi_addr(_Label34+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,871 :: 		Label34.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label34+12)
MOVT	R0, #hi_addr(_Label34+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,872 :: 		Label34.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label34+26)
MOVT	R0, #hi_addr(_Label34+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,873 :: 		Label34.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label34+27)
MOVT	R0, #hi_addr(_Label34+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,874 :: 		Label34.Caption         = Label34_Caption;
MOVW	R1, #lo_addr(_Label34_Caption+0)
MOVT	R1, #hi_addr(_Label34_Caption+0)
MOVW	R0, #lo_addr(_Label34+16)
MOVT	R0, #hi_addr(_Label34+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,875 :: 		Label34.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Label34+20)
MOVT	R0, #hi_addr(_Label34+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,876 :: 		Label34.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label34+24)
MOVT	R0, #hi_addr(_Label34+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,877 :: 		Label34.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label34+28)
MOVT	R0, #hi_addr(_Label34+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,878 :: 		Label34.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label34+32)
MOVT	R0, #hi_addr(_Label34+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,879 :: 		Label34.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label34+36)
MOVT	R0, #hi_addr(_Label34+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,880 :: 		Label34.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label34+40)
MOVT	R0, #hi_addr(_Label34+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,882 :: 		BatteryStatus.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_BatteryStatus+0)
MOVT	R0, #hi_addr(_BatteryStatus+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,883 :: 		BatteryStatus.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_BatteryStatus+4)
MOVT	R0, #hi_addr(_BatteryStatus+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,884 :: 		BatteryStatus.Left            = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_BatteryStatus+6)
MOVT	R0, #hi_addr(_BatteryStatus+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,885 :: 		BatteryStatus.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_BatteryStatus+8)
MOVT	R0, #hi_addr(_BatteryStatus+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,886 :: 		BatteryStatus.Width           = 44;
MOVS	R1, #44
MOVW	R0, #lo_addr(_BatteryStatus+10)
MOVT	R0, #hi_addr(_BatteryStatus+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,887 :: 		BatteryStatus.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_BatteryStatus+12)
MOVT	R0, #hi_addr(_BatteryStatus+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,888 :: 		BatteryStatus.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BatteryStatus+22)
MOVT	R0, #hi_addr(_BatteryStatus+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,889 :: 		BatteryStatus.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BatteryStatus+23)
MOVT	R0, #hi_addr(_BatteryStatus+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,890 :: 		BatteryStatus.Picture_Name    = icon_battery_bmp;
MOVW	R1, #lo_addr(_icon_battery_bmp+0)
MOVT	R1, #hi_addr(_icon_battery_bmp+0)
MOVW	R0, #lo_addr(_BatteryStatus+16)
MOVT	R0, #hi_addr(_BatteryStatus+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,891 :: 		BatteryStatus.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BatteryStatus+20)
MOVT	R0, #hi_addr(_BatteryStatus+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,892 :: 		BatteryStatus.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BatteryStatus+21)
MOVT	R0, #hi_addr(_BatteryStatus+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,893 :: 		BatteryStatus.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BatteryStatus+24)
MOVT	R0, #hi_addr(_BatteryStatus+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,894 :: 		BatteryStatus.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BatteryStatus+28)
MOVT	R0, #hi_addr(_BatteryStatus+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,895 :: 		BatteryStatus.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BatteryStatus+32)
MOVT	R0, #hi_addr(_BatteryStatus+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,896 :: 		BatteryStatus.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BatteryStatus+36)
MOVT	R0, #hi_addr(_BatteryStatus+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,898 :: 		Box23.OwnerScreen     = &Accelerometer;
MOVW	R1, #lo_addr(_Accelerometer+0)
MOVT	R1, #hi_addr(_Accelerometer+0)
MOVW	R0, #lo_addr(_Box23+0)
MOVT	R0, #hi_addr(_Box23+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,899 :: 		Box23.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+4)
MOVT	R0, #hi_addr(_Box23+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,900 :: 		Box23.Left            = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box23+6)
MOVT	R0, #hi_addr(_Box23+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,901 :: 		Box23.Top             = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Box23+8)
MOVT	R0, #hi_addr(_Box23+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,902 :: 		Box23.Width           = 236;
MOVS	R1, #236
MOVW	R0, #lo_addr(_Box23+10)
MOVT	R0, #hi_addr(_Box23+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,903 :: 		Box23.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Box23+12)
MOVT	R0, #hi_addr(_Box23+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,904 :: 		Box23.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box23+14)
MOVT	R0, #hi_addr(_Box23+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,905 :: 		Box23.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+16)
MOVT	R0, #hi_addr(_Box23+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,906 :: 		Box23.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+18)
MOVT	R0, #hi_addr(_Box23+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,907 :: 		Box23.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box23+19)
MOVT	R0, #hi_addr(_Box23+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,908 :: 		Box23.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box23+20)
MOVT	R0, #hi_addr(_Box23+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,909 :: 		Box23.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+21)
MOVT	R0, #hi_addr(_Box23+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,910 :: 		Box23.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+22)
MOVT	R0, #hi_addr(_Box23+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,911 :: 		Box23.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box23+24)
MOVT	R0, #hi_addr(_Box23+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,912 :: 		Box23.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box23+26)
MOVT	R0, #hi_addr(_Box23+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,913 :: 		Box23.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box23+28)
MOVT	R0, #hi_addr(_Box23+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,914 :: 		Box23.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+30)
MOVT	R0, #hi_addr(_Box23+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,915 :: 		Box23.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box23+32)
MOVT	R0, #hi_addr(_Box23+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,916 :: 		Box23.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+36)
MOVT	R0, #hi_addr(_Box23+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,917 :: 		Box23.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+40)
MOVT	R0, #hi_addr(_Box23+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,918 :: 		Box23.OnClickPtr      = Image2OnPress;
MOVW	R1, #lo_addr(_Image2OnPress+0)
MOVT	R1, #hi_addr(_Image2OnPress+0)
MOVW	R0, #lo_addr(_Box23+44)
MOVT	R0, #hi_addr(_Box23+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,919 :: 		Box23.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+48)
MOVT	R0, #hi_addr(_Box23+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,921 :: 		Box1.OwnerScreen     = &Accelerometer;
MOVW	R1, #lo_addr(_Accelerometer+0)
MOVT	R1, #hi_addr(_Accelerometer+0)
MOVW	R0, #lo_addr(_Box1+0)
MOVT	R0, #hi_addr(_Box1+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,922 :: 		Box1.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+4)
MOVT	R0, #hi_addr(_Box1+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,923 :: 		Box1.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+6)
MOVT	R0, #hi_addr(_Box1+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,924 :: 		Box1.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Box1+8)
MOVT	R0, #hi_addr(_Box1+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,925 :: 		Box1.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Box1+10)
MOVT	R0, #hi_addr(_Box1+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,926 :: 		Box1.Height          = 207;
MOVS	R1, #207
MOVW	R0, #lo_addr(_Box1+12)
MOVT	R0, #hi_addr(_Box1+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,927 :: 		Box1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+14)
MOVT	R0, #hi_addr(_Box1+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,928 :: 		Box1.Pen_Color       = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box1+16)
MOVT	R0, #hi_addr(_Box1+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,929 :: 		Box1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+18)
MOVT	R0, #hi_addr(_Box1+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,930 :: 		Box1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+19)
MOVT	R0, #hi_addr(_Box1+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,931 :: 		Box1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+20)
MOVT	R0, #hi_addr(_Box1+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,932 :: 		Box1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+21)
MOVT	R0, #hi_addr(_Box1+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,933 :: 		Box1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+22)
MOVT	R0, #hi_addr(_Box1+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,934 :: 		Box1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box1+24)
MOVT	R0, #hi_addr(_Box1+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,935 :: 		Box1.Gradient_End_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box1+26)
MOVT	R0, #hi_addr(_Box1+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,936 :: 		Box1.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box1+28)
MOVT	R0, #hi_addr(_Box1+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,937 :: 		Box1.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+30)
MOVT	R0, #hi_addr(_Box1+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,938 :: 		Box1.Press_Color     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box1+32)
MOVT	R0, #hi_addr(_Box1+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,939 :: 		Box1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+36)
MOVT	R0, #hi_addr(_Box1+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,940 :: 		Box1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+40)
MOVT	R0, #hi_addr(_Box1+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,941 :: 		Box1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+44)
MOVT	R0, #hi_addr(_Box1+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,942 :: 		Box1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+48)
MOVT	R0, #hi_addr(_Box1+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,944 :: 		Image2.OwnerScreen     = &Accelerometer;
MOVW	R1, #lo_addr(_Accelerometer+0)
MOVT	R1, #hi_addr(_Accelerometer+0)
MOVW	R0, #lo_addr(_Image2+0)
MOVT	R0, #hi_addr(_Image2+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,945 :: 		Image2.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image2+4)
MOVT	R0, #hi_addr(_Image2+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,946 :: 		Image2.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image2+6)
MOVT	R0, #hi_addr(_Image2+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,947 :: 		Image2.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image2+8)
MOVT	R0, #hi_addr(_Image2+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,948 :: 		Image2.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image2+10)
MOVT	R0, #hi_addr(_Image2+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,949 :: 		Image2.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image2+12)
MOVT	R0, #hi_addr(_Image2+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,950 :: 		Image2.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+22)
MOVT	R0, #hi_addr(_Image2+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,951 :: 		Image2.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+23)
MOVT	R0, #hi_addr(_Image2+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,952 :: 		Image2.Picture_Name    = icon_back_accel_bmp;
MOVW	R1, #lo_addr(_icon_back_accel_bmp+0)
MOVT	R1, #hi_addr(_icon_back_accel_bmp+0)
MOVW	R0, #lo_addr(_Image2+16)
MOVT	R0, #hi_addr(_Image2+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,953 :: 		Image2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+20)
MOVT	R0, #hi_addr(_Image2+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,954 :: 		Image2.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+21)
MOVT	R0, #hi_addr(_Image2+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,955 :: 		Image2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+24)
MOVT	R0, #hi_addr(_Image2+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,956 :: 		Image2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+28)
MOVT	R0, #hi_addr(_Image2+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,957 :: 		Image2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+32)
MOVT	R0, #hi_addr(_Image2+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,958 :: 		Image2.OnPressPtr      = Image2OnPress;
MOVW	R1, #lo_addr(_Image2OnPress+0)
MOVT	R1, #hi_addr(_Image2OnPress+0)
MOVW	R0, #lo_addr(_Image2+36)
MOVT	R0, #hi_addr(_Image2+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,960 :: 		Label1.OwnerScreen     = &Accelerometer;
MOVW	R1, #lo_addr(_Accelerometer+0)
MOVT	R1, #hi_addr(_Accelerometer+0)
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,961 :: 		Label1.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label1+4)
MOVT	R0, #hi_addr(_Label1+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,962 :: 		Label1.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label1+6)
MOVT	R0, #hi_addr(_Label1+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,963 :: 		Label1.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label1+8)
MOVT	R0, #hi_addr(_Label1+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,964 :: 		Label1.Width           = 209;
MOVS	R1, #209
MOVW	R0, #lo_addr(_Label1+10)
MOVT	R0, #hi_addr(_Label1+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,965 :: 		Label1.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label1+12)
MOVT	R0, #hi_addr(_Label1+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,966 :: 		Label1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+26)
MOVT	R0, #hi_addr(_Label1+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,967 :: 		Label1.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+27)
MOVT	R0, #hi_addr(_Label1+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,968 :: 		Label1.Caption         = Label1_Caption;
MOVW	R1, #lo_addr(_Label1_Caption+0)
MOVT	R1, #hi_addr(_Label1_Caption+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,969 :: 		Label1.FontName        = Open_Sans_Light21x24_Regular;
MOVW	R0, #lo_addr(_Label1+20)
MOVT	R0, #hi_addr(_Label1+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,970 :: 		Label1.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label1+24)
MOVT	R0, #hi_addr(_Label1+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,971 :: 		Label1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+28)
MOVT	R0, #hi_addr(_Label1+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,972 :: 		Label1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+32)
MOVT	R0, #hi_addr(_Label1+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,973 :: 		Label1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+36)
MOVT	R0, #hi_addr(_Label1+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,974 :: 		Label1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+40)
MOVT	R0, #hi_addr(_Label1+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,976 :: 		Label2.OwnerScreen     = &Accelerometer;
MOVW	R1, #lo_addr(_Accelerometer+0)
MOVT	R1, #hi_addr(_Accelerometer+0)
MOVW	R0, #lo_addr(_Label2+0)
MOVT	R0, #hi_addr(_Label2+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,977 :: 		Label2.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label2+4)
MOVT	R0, #hi_addr(_Label2+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,978 :: 		Label2.Left            = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_Label2+6)
MOVT	R0, #hi_addr(_Label2+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,979 :: 		Label2.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label2+8)
MOVT	R0, #hi_addr(_Label2+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,980 :: 		Label2.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label2+10)
MOVT	R0, #hi_addr(_Label2+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,981 :: 		Label2.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label2+12)
MOVT	R0, #hi_addr(_Label2+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,982 :: 		Label2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+26)
MOVT	R0, #hi_addr(_Label2+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,983 :: 		Label2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+27)
MOVT	R0, #hi_addr(_Label2+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,984 :: 		Label2.Caption         = Label2_Caption;
MOVW	R1, #lo_addr(_Label2_Caption+0)
MOVT	R1, #hi_addr(_Label2_Caption+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,985 :: 		Label2.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Label2+20)
MOVT	R0, #hi_addr(_Label2+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,986 :: 		Label2.Font_Color      = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,987 :: 		Label2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+28)
MOVT	R0, #hi_addr(_Label2+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,988 :: 		Label2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+32)
MOVT	R0, #hi_addr(_Label2+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,989 :: 		Label2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+36)
MOVT	R0, #hi_addr(_Label2+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,990 :: 		Label2.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+40)
MOVT	R0, #hi_addr(_Label2+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,992 :: 		Label3.OwnerScreen     = &Accelerometer;
MOVW	R1, #lo_addr(_Accelerometer+0)
MOVT	R1, #hi_addr(_Accelerometer+0)
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,993 :: 		Label3.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label3+4)
MOVT	R0, #hi_addr(_Label3+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,994 :: 		Label3.Left            = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Label3+6)
MOVT	R0, #hi_addr(_Label3+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,995 :: 		Label3.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label3+8)
MOVT	R0, #hi_addr(_Label3+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,996 :: 		Label3.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label3+10)
MOVT	R0, #hi_addr(_Label3+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,997 :: 		Label3.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label3+12)
MOVT	R0, #hi_addr(_Label3+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,998 :: 		Label3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+26)
MOVT	R0, #hi_addr(_Label3+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,999 :: 		Label3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+27)
MOVT	R0, #hi_addr(_Label3+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1000 :: 		Label3.Caption         = Label3_Caption;
MOVW	R1, #lo_addr(_Label3_Caption+0)
MOVT	R1, #hi_addr(_Label3_Caption+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1001 :: 		Label3.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Label3+20)
MOVT	R0, #hi_addr(_Label3+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1002 :: 		Label3.Font_Color      = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label3+24)
MOVT	R0, #hi_addr(_Label3+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1003 :: 		Label3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+28)
MOVT	R0, #hi_addr(_Label3+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1004 :: 		Label3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+32)
MOVT	R0, #hi_addr(_Label3+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1005 :: 		Label3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+36)
MOVT	R0, #hi_addr(_Label3+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1006 :: 		Label3.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+40)
MOVT	R0, #hi_addr(_Label3+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1008 :: 		Label4.OwnerScreen     = &Accelerometer;
MOVW	R1, #lo_addr(_Accelerometer+0)
MOVT	R1, #hi_addr(_Accelerometer+0)
MOVW	R0, #lo_addr(_Label4+0)
MOVT	R0, #hi_addr(_Label4+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1009 :: 		Label4.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label4+4)
MOVT	R0, #hi_addr(_Label4+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1010 :: 		Label4.Left            = 375;
MOVW	R1, #375
MOVW	R0, #lo_addr(_Label4+6)
MOVT	R0, #hi_addr(_Label4+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1011 :: 		Label4.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label4+8)
MOVT	R0, #hi_addr(_Label4+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1012 :: 		Label4.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label4+10)
MOVT	R0, #hi_addr(_Label4+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1013 :: 		Label4.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label4+12)
MOVT	R0, #hi_addr(_Label4+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1014 :: 		Label4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+26)
MOVT	R0, #hi_addr(_Label4+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1015 :: 		Label4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+27)
MOVT	R0, #hi_addr(_Label4+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1016 :: 		Label4.Caption         = Label4_Caption;
MOVW	R1, #lo_addr(_Label4_Caption+0)
MOVT	R1, #hi_addr(_Label4_Caption+0)
MOVW	R0, #lo_addr(_Label4+16)
MOVT	R0, #hi_addr(_Label4+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1017 :: 		Label4.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Label4+20)
MOVT	R0, #hi_addr(_Label4+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1018 :: 		Label4.Font_Color      = 0x0400;
MOVW	R1, #1024
MOVW	R0, #lo_addr(_Label4+24)
MOVT	R0, #hi_addr(_Label4+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1019 :: 		Label4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+28)
MOVT	R0, #hi_addr(_Label4+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1020 :: 		Label4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+32)
MOVT	R0, #hi_addr(_Label4+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1021 :: 		Label4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+36)
MOVT	R0, #hi_addr(_Label4+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1022 :: 		Label4.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+40)
MOVT	R0, #hi_addr(_Label4+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1024 :: 		Box22.OwnerScreen     = &RGBLight;
MOVW	R1, #lo_addr(_RGBLight+0)
MOVT	R1, #hi_addr(_RGBLight+0)
MOVW	R0, #lo_addr(_Box22+0)
MOVT	R0, #hi_addr(_Box22+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1025 :: 		Box22.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+4)
MOVT	R0, #hi_addr(_Box22+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1026 :: 		Box22.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Box22+6)
MOVT	R0, #hi_addr(_Box22+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1027 :: 		Box22.Top             = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box22+8)
MOVT	R0, #hi_addr(_Box22+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1028 :: 		Box22.Width           = 126;
MOVS	R1, #126
MOVW	R0, #lo_addr(_Box22+10)
MOVT	R0, #hi_addr(_Box22+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1029 :: 		Box22.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Box22+12)
MOVT	R0, #hi_addr(_Box22+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1030 :: 		Box22.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box22+14)
MOVT	R0, #hi_addr(_Box22+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1031 :: 		Box22.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+16)
MOVT	R0, #hi_addr(_Box22+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1032 :: 		Box22.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+18)
MOVT	R0, #hi_addr(_Box22+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1033 :: 		Box22.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box22+19)
MOVT	R0, #hi_addr(_Box22+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1034 :: 		Box22.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box22+20)
MOVT	R0, #hi_addr(_Box22+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1035 :: 		Box22.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+21)
MOVT	R0, #hi_addr(_Box22+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1036 :: 		Box22.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+22)
MOVT	R0, #hi_addr(_Box22+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1037 :: 		Box22.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box22+24)
MOVT	R0, #hi_addr(_Box22+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1038 :: 		Box22.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box22+26)
MOVT	R0, #hi_addr(_Box22+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1039 :: 		Box22.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box22+28)
MOVT	R0, #hi_addr(_Box22+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1040 :: 		Box22.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+30)
MOVT	R0, #hi_addr(_Box22+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1041 :: 		Box22.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box22+32)
MOVT	R0, #hi_addr(_Box22+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1042 :: 		Box22.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+36)
MOVT	R0, #hi_addr(_Box22+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1043 :: 		Box22.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+40)
MOVT	R0, #hi_addr(_Box22+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1044 :: 		Box22.OnClickPtr      = Image5OnPress;
MOVW	R1, #lo_addr(_Image5OnPress+0)
MOVT	R1, #hi_addr(_Image5OnPress+0)
MOVW	R0, #lo_addr(_Box22+44)
MOVT	R0, #hi_addr(_Box22+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1045 :: 		Box22.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+48)
MOVT	R0, #hi_addr(_Box22+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1047 :: 		Label9.OwnerScreen     = &RGBLight;
MOVW	R1, #lo_addr(_RGBLight+0)
MOVT	R1, #hi_addr(_RGBLight+0)
MOVW	R0, #lo_addr(_Label9+0)
MOVT	R0, #hi_addr(_Label9+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1048 :: 		Label9.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label9+4)
MOVT	R0, #hi_addr(_Label9+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1049 :: 		Label9.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label9+6)
MOVT	R0, #hi_addr(_Label9+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1050 :: 		Label9.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label9+8)
MOVT	R0, #hi_addr(_Label9+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1051 :: 		Label9.Width           = 95;
MOVS	R1, #95
MOVW	R0, #lo_addr(_Label9+10)
MOVT	R0, #hi_addr(_Label9+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1052 :: 		Label9.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label9+12)
MOVT	R0, #hi_addr(_Label9+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1053 :: 		Label9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label9+26)
MOVT	R0, #hi_addr(_Label9+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1054 :: 		Label9.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+27)
MOVT	R0, #hi_addr(_Label9+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1055 :: 		Label9.Caption         = Label9_Caption;
MOVW	R1, #lo_addr(_Label9_Caption+0)
MOVT	R1, #hi_addr(_Label9_Caption+0)
MOVW	R0, #lo_addr(_Label9+16)
MOVT	R0, #hi_addr(_Label9+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1056 :: 		Label9.FontName        = Open_Sans_Light21x24_Regular;
MOVW	R0, #lo_addr(_Label9+20)
MOVT	R0, #hi_addr(_Label9+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,1057 :: 		Label9.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label9+24)
MOVT	R0, #hi_addr(_Label9+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1058 :: 		Label9.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+28)
MOVT	R0, #hi_addr(_Label9+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1059 :: 		Label9.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+32)
MOVT	R0, #hi_addr(_Label9+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1060 :: 		Label9.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+36)
MOVT	R0, #hi_addr(_Label9+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1061 :: 		Label9.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+40)
MOVT	R0, #hi_addr(_Label9+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1063 :: 		Image5.OwnerScreen     = &RGBLight;
MOVW	R1, #lo_addr(_RGBLight+0)
MOVT	R1, #hi_addr(_RGBLight+0)
MOVW	R0, #lo_addr(_Image5+0)
MOVT	R0, #hi_addr(_Image5+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1064 :: 		Image5.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image5+4)
MOVT	R0, #hi_addr(_Image5+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1065 :: 		Image5.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image5+6)
MOVT	R0, #hi_addr(_Image5+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1066 :: 		Image5.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image5+8)
MOVT	R0, #hi_addr(_Image5+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1067 :: 		Image5.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image5+10)
MOVT	R0, #hi_addr(_Image5+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1068 :: 		Image5.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image5+12)
MOVT	R0, #hi_addr(_Image5+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1069 :: 		Image5.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+22)
MOVT	R0, #hi_addr(_Image5+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1070 :: 		Image5.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+23)
MOVT	R0, #hi_addr(_Image5+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1071 :: 		Image5.Picture_Name    = icon_back_rgb_bmp;
MOVW	R1, #lo_addr(_icon_back_rgb_bmp+0)
MOVT	R1, #hi_addr(_icon_back_rgb_bmp+0)
MOVW	R0, #lo_addr(_Image5+16)
MOVT	R0, #hi_addr(_Image5+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1072 :: 		Image5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+20)
MOVT	R0, #hi_addr(_Image5+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1073 :: 		Image5.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+21)
MOVT	R0, #hi_addr(_Image5+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1074 :: 		Image5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+24)
MOVT	R0, #hi_addr(_Image5+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1075 :: 		Image5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+28)
MOVT	R0, #hi_addr(_Image5+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1076 :: 		Image5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+32)
MOVT	R0, #hi_addr(_Image5+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1077 :: 		Image5.OnPressPtr      = Image5OnPress;
MOVW	R1, #lo_addr(_Image5OnPress+0)
MOVT	R1, #hi_addr(_Image5OnPress+0)
MOVW	R0, #lo_addr(_Image5+36)
MOVT	R0, #hi_addr(_Image5+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1079 :: 		Label10.OwnerScreen     = &RGBLight;
MOVW	R1, #lo_addr(_RGBLight+0)
MOVT	R1, #hi_addr(_RGBLight+0)
MOVW	R0, #lo_addr(_Label10+0)
MOVT	R0, #hi_addr(_Label10+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1080 :: 		Label10.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label10+4)
MOVT	R0, #hi_addr(_Label10+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1081 :: 		Label10.Left            = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label10+6)
MOVT	R0, #hi_addr(_Label10+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1082 :: 		Label10.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label10+8)
MOVT	R0, #hi_addr(_Label10+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1083 :: 		Label10.Width           = 86;
MOVS	R1, #86
MOVW	R0, #lo_addr(_Label10+10)
MOVT	R0, #hi_addr(_Label10+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1084 :: 		Label10.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label10+12)
MOVT	R0, #hi_addr(_Label10+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1085 :: 		Label10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+26)
MOVT	R0, #hi_addr(_Label10+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1086 :: 		Label10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+27)
MOVT	R0, #hi_addr(_Label10+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1087 :: 		Label10.Caption         = Label10_Caption;
MOVW	R1, #lo_addr(_Label10_Caption+0)
MOVT	R1, #hi_addr(_Label10_Caption+0)
MOVW	R0, #lo_addr(_Label10+16)
MOVT	R0, #hi_addr(_Label10+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1088 :: 		Label10.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Label10+20)
MOVT	R0, #hi_addr(_Label10+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1089 :: 		Label10.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label10+24)
MOVT	R0, #hi_addr(_Label10+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1090 :: 		Label10.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+28)
MOVT	R0, #hi_addr(_Label10+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1091 :: 		Label10.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+32)
MOVT	R0, #hi_addr(_Label10+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1092 :: 		Label10.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+36)
MOVT	R0, #hi_addr(_Label10+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1093 :: 		Label10.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+40)
MOVT	R0, #hi_addr(_Label10+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1095 :: 		Circle1.OwnerScreen     = &RGBLight;
MOVW	R1, #lo_addr(_RGBLight+0)
MOVT	R1, #hi_addr(_RGBLight+0)
MOVW	R0, #lo_addr(_Circle1+0)
MOVT	R0, #hi_addr(_Circle1+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1096 :: 		Circle1.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Circle1+4)
MOVT	R0, #hi_addr(_Circle1+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1097 :: 		Circle1.Left            = 294;
MOVW	R1, #294
MOVW	R0, #lo_addr(_Circle1+6)
MOVT	R0, #hi_addr(_Circle1+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1098 :: 		Circle1.Top             = 252;
MOVS	R1, #252
MOVW	R0, #lo_addr(_Circle1+8)
MOVT	R0, #hi_addr(_Circle1+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1099 :: 		Circle1.Radius          = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Circle1+10)
MOVT	R0, #hi_addr(_Circle1+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1100 :: 		Circle1.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+12)
MOVT	R0, #hi_addr(_Circle1+12)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1101 :: 		Circle1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+14)
MOVT	R0, #hi_addr(_Circle1+14)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1102 :: 		Circle1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+16)
MOVT	R0, #hi_addr(_Circle1+16)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1103 :: 		Circle1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+17)
MOVT	R0, #hi_addr(_Circle1+17)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1104 :: 		Circle1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+18)
MOVT	R0, #hi_addr(_Circle1+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1105 :: 		Circle1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+19)
MOVT	R0, #hi_addr(_Circle1+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1106 :: 		Circle1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+20)
MOVT	R0, #hi_addr(_Circle1+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1107 :: 		Circle1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Circle1+22)
MOVT	R0, #hi_addr(_Circle1+22)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1108 :: 		Circle1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Circle1+24)
MOVT	R0, #hi_addr(_Circle1+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1109 :: 		Circle1.Color           = 0x0023;
MOVS	R1, #35
MOVW	R0, #lo_addr(_Circle1+26)
MOVT	R0, #hi_addr(_Circle1+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1110 :: 		Circle1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+28)
MOVT	R0, #hi_addr(_Circle1+28)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1111 :: 		Circle1.Press_Color     = 0x19E0;
MOVW	R1, #6624
MOVW	R0, #lo_addr(_Circle1+30)
MOVT	R0, #hi_addr(_Circle1+30)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1112 :: 		Circle1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+32)
MOVT	R0, #hi_addr(_Circle1+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1113 :: 		Circle1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+36)
MOVT	R0, #hi_addr(_Circle1+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1114 :: 		Circle1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+40)
MOVT	R0, #hi_addr(_Circle1+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1115 :: 		Circle1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+44)
MOVT	R0, #hi_addr(_Circle1+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1117 :: 		Label11.OwnerScreen     = &RGBLight;
MOVW	R1, #lo_addr(_RGBLight+0)
MOVT	R1, #hi_addr(_RGBLight+0)
MOVW	R0, #lo_addr(_Label11+0)
MOVT	R0, #hi_addr(_Label11+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1118 :: 		Label11.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label11+4)
MOVT	R0, #hi_addr(_Label11+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1119 :: 		Label11.Left            = 325;
MOVW	R1, #325
MOVW	R0, #lo_addr(_Label11+6)
MOVT	R0, #hi_addr(_Label11+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1120 :: 		Label11.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label11+8)
MOVT	R0, #hi_addr(_Label11+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1121 :: 		Label11.Width           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label11+10)
MOVT	R0, #hi_addr(_Label11+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1122 :: 		Label11.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label11+12)
MOVT	R0, #hi_addr(_Label11+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1123 :: 		Label11.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label11+26)
MOVT	R0, #hi_addr(_Label11+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1124 :: 		Label11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label11+27)
MOVT	R0, #hi_addr(_Label11+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1125 :: 		Label11.Caption         = Label11_Caption;
MOVW	R1, #lo_addr(_Label11_Caption+0)
MOVT	R1, #hi_addr(_Label11_Caption+0)
MOVW	R0, #lo_addr(_Label11+16)
MOVT	R0, #hi_addr(_Label11+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1126 :: 		Label11.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Label11+20)
MOVT	R0, #hi_addr(_Label11+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1127 :: 		Label11.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label11+24)
MOVT	R0, #hi_addr(_Label11+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1128 :: 		Label11.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+28)
MOVT	R0, #hi_addr(_Label11+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1129 :: 		Label11.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+32)
MOVT	R0, #hi_addr(_Label11+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1130 :: 		Label11.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+36)
MOVT	R0, #hi_addr(_Label11+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1131 :: 		Label11.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+40)
MOVT	R0, #hi_addr(_Label11+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1133 :: 		Label12.OwnerScreen     = &RGBLight;
MOVW	R1, #lo_addr(_RGBLight+0)
MOVT	R1, #hi_addr(_RGBLight+0)
MOVW	R0, #lo_addr(_Label12+0)
MOVT	R0, #hi_addr(_Label12+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1134 :: 		Label12.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label12+4)
MOVT	R0, #hi_addr(_Label12+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1135 :: 		Label12.Left            = 375;
MOVW	R1, #375
MOVW	R0, #lo_addr(_Label12+6)
MOVT	R0, #hi_addr(_Label12+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1136 :: 		Label12.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label12+8)
MOVT	R0, #hi_addr(_Label12+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1137 :: 		Label12.Width           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label12+10)
MOVT	R0, #hi_addr(_Label12+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1138 :: 		Label12.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label12+12)
MOVT	R0, #hi_addr(_Label12+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1139 :: 		Label12.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label12+26)
MOVT	R0, #hi_addr(_Label12+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1140 :: 		Label12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label12+27)
MOVT	R0, #hi_addr(_Label12+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1141 :: 		Label12.Caption         = Label12_Caption;
MOVW	R1, #lo_addr(_Label12_Caption+0)
MOVT	R1, #hi_addr(_Label12_Caption+0)
MOVW	R0, #lo_addr(_Label12+16)
MOVT	R0, #hi_addr(_Label12+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1142 :: 		Label12.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Label12+20)
MOVT	R0, #hi_addr(_Label12+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1143 :: 		Label12.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label12+24)
MOVT	R0, #hi_addr(_Label12+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1144 :: 		Label12.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+28)
MOVT	R0, #hi_addr(_Label12+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1145 :: 		Label12.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+32)
MOVT	R0, #hi_addr(_Label12+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1146 :: 		Label12.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+36)
MOVT	R0, #hi_addr(_Label12+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1147 :: 		Label12.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+40)
MOVT	R0, #hi_addr(_Label12+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1149 :: 		Label13.OwnerScreen     = &RGBLight;
MOVW	R1, #lo_addr(_RGBLight+0)
MOVT	R1, #hi_addr(_RGBLight+0)
MOVW	R0, #lo_addr(_Label13+0)
MOVT	R0, #hi_addr(_Label13+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1150 :: 		Label13.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label13+4)
MOVT	R0, #hi_addr(_Label13+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1151 :: 		Label13.Left            = 425;
MOVW	R1, #425
MOVW	R0, #lo_addr(_Label13+6)
MOVT	R0, #hi_addr(_Label13+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1152 :: 		Label13.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label13+8)
MOVT	R0, #hi_addr(_Label13+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1153 :: 		Label13.Width           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label13+10)
MOVT	R0, #hi_addr(_Label13+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1154 :: 		Label13.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label13+12)
MOVT	R0, #hi_addr(_Label13+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1155 :: 		Label13.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label13+26)
MOVT	R0, #hi_addr(_Label13+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1156 :: 		Label13.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label13+27)
MOVT	R0, #hi_addr(_Label13+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1157 :: 		Label13.Caption         = Label13_Caption;
MOVW	R1, #lo_addr(_Label13_Caption+0)
MOVT	R1, #hi_addr(_Label13_Caption+0)
MOVW	R0, #lo_addr(_Label13+16)
MOVT	R0, #hi_addr(_Label13+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1158 :: 		Label13.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Label13+20)
MOVT	R0, #hi_addr(_Label13+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1159 :: 		Label13.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label13+24)
MOVT	R0, #hi_addr(_Label13+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1160 :: 		Label13.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+28)
MOVT	R0, #hi_addr(_Label13+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1161 :: 		Label13.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+32)
MOVT	R0, #hi_addr(_Label13+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1162 :: 		Label13.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+36)
MOVT	R0, #hi_addr(_Label13+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1163 :: 		Label13.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+40)
MOVT	R0, #hi_addr(_Label13+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1165 :: 		RGB_Active_area.OwnerScreen     = &RGBLight;
MOVW	R1, #lo_addr(_RGBLight+0)
MOVT	R1, #hi_addr(_RGBLight+0)
MOVW	R0, #lo_addr(_RGB_Active_area+0)
MOVT	R0, #hi_addr(_RGB_Active_area+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1166 :: 		RGB_Active_area.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_RGB_Active_area+4)
MOVT	R0, #hi_addr(_RGB_Active_area+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1167 :: 		RGB_Active_area.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RGB_Active_area+6)
MOVT	R0, #hi_addr(_RGB_Active_area+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1168 :: 		RGB_Active_area.Top             = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_RGB_Active_area+8)
MOVT	R0, #hi_addr(_RGB_Active_area+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1169 :: 		RGB_Active_area.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_RGB_Active_area+10)
MOVT	R0, #hi_addr(_RGB_Active_area+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1170 :: 		RGB_Active_area.Height          = 209;
MOVS	R1, #209
MOVW	R0, #lo_addr(_RGB_Active_area+12)
MOVT	R0, #hi_addr(_RGB_Active_area+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1171 :: 		RGB_Active_area.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RGB_Active_area+14)
MOVT	R0, #hi_addr(_RGB_Active_area+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1172 :: 		RGB_Active_area.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RGB_Active_area+16)
MOVT	R0, #hi_addr(_RGB_Active_area+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1173 :: 		RGB_Active_area.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RGB_Active_area+18)
MOVT	R0, #hi_addr(_RGB_Active_area+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1174 :: 		RGB_Active_area.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RGB_Active_area+19)
MOVT	R0, #hi_addr(_RGB_Active_area+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1175 :: 		RGB_Active_area.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RGB_Active_area+20)
MOVT	R0, #hi_addr(_RGB_Active_area+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1176 :: 		RGB_Active_area.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RGB_Active_area+21)
MOVT	R0, #hi_addr(_RGB_Active_area+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1177 :: 		RGB_Active_area.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RGB_Active_area+22)
MOVT	R0, #hi_addr(_RGB_Active_area+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1178 :: 		RGB_Active_area.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RGB_Active_area+24)
MOVT	R0, #hi_addr(_RGB_Active_area+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1179 :: 		RGB_Active_area.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RGB_Active_area+26)
MOVT	R0, #hi_addr(_RGB_Active_area+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1180 :: 		RGB_Active_area.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RGB_Active_area+28)
MOVT	R0, #hi_addr(_RGB_Active_area+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1181 :: 		RGB_Active_area.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RGB_Active_area+30)
MOVT	R0, #hi_addr(_RGB_Active_area+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1182 :: 		RGB_Active_area.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RGB_Active_area+32)
MOVT	R0, #hi_addr(_RGB_Active_area+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1183 :: 		RGB_Active_area.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RGB_Active_area+36)
MOVT	R0, #hi_addr(_RGB_Active_area+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1184 :: 		RGB_Active_area.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RGB_Active_area+40)
MOVT	R0, #hi_addr(_RGB_Active_area+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1185 :: 		RGB_Active_area.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RGB_Active_area+44)
MOVT	R0, #hi_addr(_RGB_Active_area+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1186 :: 		RGB_Active_area.OnPressPtr      = RGB_Active_areaOnPress;
MOVW	R1, #lo_addr(_RGB_Active_areaOnPress+0)
MOVT	R1, #hi_addr(_RGB_Active_areaOnPress+0)
MOVW	R0, #lo_addr(_RGB_Active_area+48)
MOVT	R0, #hi_addr(_RGB_Active_area+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1188 :: 		Box16.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Box16+0)
MOVT	R0, #hi_addr(_Box16+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1189 :: 		Box16.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+4)
MOVT	R0, #hi_addr(_Box16+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1190 :: 		Box16.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Box16+6)
MOVT	R0, #hi_addr(_Box16+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1191 :: 		Box16.Top             = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Box16+8)
MOVT	R0, #hi_addr(_Box16+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1192 :: 		Box16.Width           = 84;
MOVS	R1, #84
MOVW	R0, #lo_addr(_Box16+10)
MOVT	R0, #hi_addr(_Box16+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1193 :: 		Box16.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Box16+12)
MOVT	R0, #hi_addr(_Box16+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1194 :: 		Box16.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box16+14)
MOVT	R0, #hi_addr(_Box16+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1195 :: 		Box16.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+16)
MOVT	R0, #hi_addr(_Box16+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1196 :: 		Box16.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+18)
MOVT	R0, #hi_addr(_Box16+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1197 :: 		Box16.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box16+19)
MOVT	R0, #hi_addr(_Box16+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1198 :: 		Box16.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box16+20)
MOVT	R0, #hi_addr(_Box16+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1199 :: 		Box16.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+21)
MOVT	R0, #hi_addr(_Box16+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1200 :: 		Box16.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+22)
MOVT	R0, #hi_addr(_Box16+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1201 :: 		Box16.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box16+24)
MOVT	R0, #hi_addr(_Box16+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1202 :: 		Box16.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box16+26)
MOVT	R0, #hi_addr(_Box16+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1203 :: 		Box16.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box16+28)
MOVT	R0, #hi_addr(_Box16+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1204 :: 		Box16.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+30)
MOVT	R0, #hi_addr(_Box16+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1205 :: 		Box16.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box16+32)
MOVT	R0, #hi_addr(_Box16+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1206 :: 		Box16.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+36)
MOVT	R0, #hi_addr(_Box16+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1207 :: 		Box16.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+40)
MOVT	R0, #hi_addr(_Box16+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1208 :: 		Box16.OnClickPtr      = ClockBackOnPress;
MOVW	R1, #lo_addr(_ClockBackOnPress+0)
MOVT	R1, #hi_addr(_ClockBackOnPress+0)
MOVW	R0, #lo_addr(_Box16+44)
MOVT	R0, #hi_addr(_Box16+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1209 :: 		Box16.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+48)
MOVT	R0, #hi_addr(_Box16+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1211 :: 		Box15.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Box15+0)
MOVT	R0, #hi_addr(_Box15+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1212 :: 		Box15.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box15+4)
MOVT	R0, #hi_addr(_Box15+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1213 :: 		Box15.Left            = 376;
MOVW	R1, #376
MOVW	R0, #lo_addr(_Box15+6)
MOVT	R0, #hi_addr(_Box15+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1214 :: 		Box15.Top             = 234;
MOVS	R1, #234
MOVW	R0, #lo_addr(_Box15+8)
MOVT	R0, #hi_addr(_Box15+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1215 :: 		Box15.Width           = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_Box15+10)
MOVT	R0, #hi_addr(_Box15+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1216 :: 		Box15.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Box15+12)
MOVT	R0, #hi_addr(_Box15+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1217 :: 		Box15.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box15+14)
MOVT	R0, #hi_addr(_Box15+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1218 :: 		Box15.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+16)
MOVT	R0, #hi_addr(_Box15+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1219 :: 		Box15.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+18)
MOVT	R0, #hi_addr(_Box15+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1220 :: 		Box15.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box15+19)
MOVT	R0, #hi_addr(_Box15+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1221 :: 		Box15.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box15+20)
MOVT	R0, #hi_addr(_Box15+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1222 :: 		Box15.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+21)
MOVT	R0, #hi_addr(_Box15+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1223 :: 		Box15.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+22)
MOVT	R0, #hi_addr(_Box15+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1224 :: 		Box15.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box15+24)
MOVT	R0, #hi_addr(_Box15+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1225 :: 		Box15.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box15+26)
MOVT	R0, #hi_addr(_Box15+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1226 :: 		Box15.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box15+28)
MOVT	R0, #hi_addr(_Box15+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1227 :: 		Box15.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+30)
MOVT	R0, #hi_addr(_Box15+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1228 :: 		Box15.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box15+32)
MOVT	R0, #hi_addr(_Box15+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1229 :: 		Box15.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+36)
MOVT	R0, #hi_addr(_Box15+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1230 :: 		Box15.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+40)
MOVT	R0, #hi_addr(_Box15+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1231 :: 		Box15.OnClickPtr      = Image8OnPress;
MOVW	R1, #lo_addr(_Image8OnPress+0)
MOVT	R1, #hi_addr(_Image8OnPress+0)
MOVW	R0, #lo_addr(_Box15+44)
MOVT	R0, #hi_addr(_Box15+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1232 :: 		Box15.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+48)
MOVT	R0, #hi_addr(_Box15+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1234 :: 		Box13.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Box13+0)
MOVT	R0, #hi_addr(_Box13+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1235 :: 		Box13.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Box13+4)
MOVT	R0, #hi_addr(_Box13+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1236 :: 		Box13.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+6)
MOVT	R0, #hi_addr(_Box13+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1237 :: 		Box13.Top             = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_Box13+8)
MOVT	R0, #hi_addr(_Box13+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1238 :: 		Box13.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Box13+10)
MOVT	R0, #hi_addr(_Box13+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1239 :: 		Box13.Height          = 193;
MOVS	R1, #193
MOVW	R0, #lo_addr(_Box13+12)
MOVT	R0, #hi_addr(_Box13+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1240 :: 		Box13.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+14)
MOVT	R0, #hi_addr(_Box13+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1241 :: 		Box13.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+16)
MOVT	R0, #hi_addr(_Box13+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1242 :: 		Box13.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+18)
MOVT	R0, #hi_addr(_Box13+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1243 :: 		Box13.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box13+19)
MOVT	R0, #hi_addr(_Box13+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1244 :: 		Box13.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box13+20)
MOVT	R0, #hi_addr(_Box13+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1245 :: 		Box13.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+21)
MOVT	R0, #hi_addr(_Box13+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1246 :: 		Box13.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+22)
MOVT	R0, #hi_addr(_Box13+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1247 :: 		Box13.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box13+24)
MOVT	R0, #hi_addr(_Box13+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1248 :: 		Box13.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box13+26)
MOVT	R0, #hi_addr(_Box13+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1249 :: 		Box13.Color           = 0x54C3;
MOVW	R1, #21699
MOVW	R0, #lo_addr(_Box13+28)
MOVT	R0, #hi_addr(_Box13+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1250 :: 		Box13.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+30)
MOVT	R0, #hi_addr(_Box13+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1251 :: 		Box13.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box13+32)
MOVT	R0, #hi_addr(_Box13+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1252 :: 		Box13.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+36)
MOVT	R0, #hi_addr(_Box13+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1253 :: 		Box13.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+40)
MOVT	R0, #hi_addr(_Box13+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1254 :: 		Box13.OnClickPtr      = Box13OnClick;
MOVW	R1, #lo_addr(_Box13OnClick+0)
MOVT	R1, #hi_addr(_Box13OnClick+0)
MOVW	R0, #lo_addr(_Box13+44)
MOVT	R0, #hi_addr(_Box13+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1255 :: 		Box13.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+48)
MOVT	R0, #hi_addr(_Box13+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1257 :: 		Box12.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Box12+0)
MOVT	R0, #hi_addr(_Box12+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1258 :: 		Box12.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Box12+4)
MOVT	R0, #hi_addr(_Box12+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1259 :: 		Box12.Left            = 280;
MOVW	R1, #280
MOVW	R0, #lo_addr(_Box12+6)
MOVT	R0, #hi_addr(_Box12+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1260 :: 		Box12.Top             = 235;
MOVS	R1, #235
MOVW	R0, #lo_addr(_Box12+8)
MOVT	R0, #hi_addr(_Box12+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1261 :: 		Box12.Width           = 68;
MOVS	R1, #68
MOVW	R0, #lo_addr(_Box12+10)
MOVT	R0, #hi_addr(_Box12+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1262 :: 		Box12.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Box12+12)
MOVT	R0, #hi_addr(_Box12+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1263 :: 		Box12.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box12+14)
MOVT	R0, #hi_addr(_Box12+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1264 :: 		Box12.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+16)
MOVT	R0, #hi_addr(_Box12+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1265 :: 		Box12.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+18)
MOVT	R0, #hi_addr(_Box12+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1266 :: 		Box12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box12+19)
MOVT	R0, #hi_addr(_Box12+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1267 :: 		Box12.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box12+20)
MOVT	R0, #hi_addr(_Box12+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1268 :: 		Box12.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+21)
MOVT	R0, #hi_addr(_Box12+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1269 :: 		Box12.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+22)
MOVT	R0, #hi_addr(_Box12+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1270 :: 		Box12.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box12+24)
MOVT	R0, #hi_addr(_Box12+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1271 :: 		Box12.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box12+26)
MOVT	R0, #hi_addr(_Box12+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1272 :: 		Box12.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box12+28)
MOVT	R0, #hi_addr(_Box12+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1273 :: 		Box12.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+30)
MOVT	R0, #hi_addr(_Box12+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1274 :: 		Box12.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box12+32)
MOVT	R0, #hi_addr(_Box12+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1275 :: 		Box12.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+36)
MOVT	R0, #hi_addr(_Box12+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1276 :: 		Box12.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+40)
MOVT	R0, #hi_addr(_Box12+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1277 :: 		Box12.OnClickPtr      = Box12OnClick;
MOVW	R1, #lo_addr(_Box12OnClick+0)
MOVT	R1, #hi_addr(_Box12OnClick+0)
MOVW	R0, #lo_addr(_Box12+44)
MOVT	R0, #hi_addr(_Box12+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1278 :: 		Box12.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+48)
MOVT	R0, #hi_addr(_Box12+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1280 :: 		Label15.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Label15+0)
MOVT	R0, #hi_addr(_Label15+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1281 :: 		Label15.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label15+4)
MOVT	R0, #hi_addr(_Label15+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1282 :: 		Label15.Left            = 191;
MOVS	R1, #191
MOVW	R0, #lo_addr(_Label15+6)
MOVT	R0, #hi_addr(_Label15+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1283 :: 		Label15.Top             = 94;
MOVS	R1, #94
MOVW	R0, #lo_addr(_Label15+8)
MOVT	R0, #hi_addr(_Label15+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1284 :: 		Label15.Width           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label15+10)
MOVT	R0, #hi_addr(_Label15+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1285 :: 		Label15.Height          = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Label15+12)
MOVT	R0, #hi_addr(_Label15+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1286 :: 		Label15.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label15+26)
MOVT	R0, #hi_addr(_Label15+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1287 :: 		Label15.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label15+27)
MOVT	R0, #hi_addr(_Label15+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1288 :: 		Label15.Caption         = Label15_Caption;
MOVW	R1, #lo_addr(_Label15_Caption+0)
MOVT	R1, #hi_addr(_Label15_Caption+0)
MOVW	R0, #lo_addr(_Label15+16)
MOVT	R0, #hi_addr(_Label15+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1289 :: 		Label15.FontName        = Open_Sans_Light58x65_Regular;
MOVW	R1, #lo_addr(_Open_Sans_Light58x65_Regular+0)
MOVT	R1, #hi_addr(_Open_Sans_Light58x65_Regular+0)
MOVW	R0, #lo_addr(_Label15+20)
MOVT	R0, #hi_addr(_Label15+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1290 :: 		Label15.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label15+24)
MOVT	R0, #hi_addr(_Label15+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1291 :: 		Label15.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+28)
MOVT	R0, #hi_addr(_Label15+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1292 :: 		Label15.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+32)
MOVT	R0, #hi_addr(_Label15+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1293 :: 		Label15.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+36)
MOVT	R0, #hi_addr(_Label15+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1294 :: 		Label15.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+40)
MOVT	R0, #hi_addr(_Label15+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1296 :: 		Box2.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Box2+0)
MOVT	R0, #hi_addr(_Box2+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1297 :: 		Box2.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Box2+4)
MOVT	R0, #hi_addr(_Box2+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1298 :: 		Box2.Left            = 108;
MOVS	R1, #108
MOVW	R0, #lo_addr(_Box2+6)
MOVT	R0, #hi_addr(_Box2+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1299 :: 		Box2.Top             = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box2+8)
MOVT	R0, #hi_addr(_Box2+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1300 :: 		Box2.Width           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Box2+10)
MOVT	R0, #hi_addr(_Box2+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1301 :: 		Box2.Height          = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Box2+12)
MOVT	R0, #hi_addr(_Box2+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1302 :: 		Box2.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+14)
MOVT	R0, #hi_addr(_Box2+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1303 :: 		Box2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+16)
MOVT	R0, #hi_addr(_Box2+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1304 :: 		Box2.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+18)
MOVT	R0, #hi_addr(_Box2+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1305 :: 		Box2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+19)
MOVT	R0, #hi_addr(_Box2+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1306 :: 		Box2.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+20)
MOVT	R0, #hi_addr(_Box2+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1307 :: 		Box2.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+21)
MOVT	R0, #hi_addr(_Box2+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1308 :: 		Box2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+22)
MOVT	R0, #hi_addr(_Box2+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1309 :: 		Box2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box2+24)
MOVT	R0, #hi_addr(_Box2+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1310 :: 		Box2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box2+26)
MOVT	R0, #hi_addr(_Box2+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1311 :: 		Box2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box2+28)
MOVT	R0, #hi_addr(_Box2+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1312 :: 		Box2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+30)
MOVT	R0, #hi_addr(_Box2+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1313 :: 		Box2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box2+32)
MOVT	R0, #hi_addr(_Box2+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1314 :: 		Box2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+36)
MOVT	R0, #hi_addr(_Box2+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1315 :: 		Box2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+40)
MOVT	R0, #hi_addr(_Box2+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1316 :: 		Box2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+44)
MOVT	R0, #hi_addr(_Box2+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1317 :: 		Box2.OnPressPtr      = Box2OnPress;
MOVW	R1, #lo_addr(_Box2OnPress+0)
MOVT	R1, #hi_addr(_Box2OnPress+0)
MOVW	R0, #lo_addr(_Box2+48)
MOVT	R0, #hi_addr(_Box2+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1319 :: 		Box3.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Box3+0)
MOVT	R0, #hi_addr(_Box3+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1320 :: 		Box3.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Box3+4)
MOVT	R0, #hi_addr(_Box3+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1321 :: 		Box3.Left            = 146;
MOVS	R1, #146
MOVW	R0, #lo_addr(_Box3+6)
MOVT	R0, #hi_addr(_Box3+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1322 :: 		Box3.Top             = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box3+8)
MOVT	R0, #hi_addr(_Box3+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1323 :: 		Box3.Width           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Box3+10)
MOVT	R0, #hi_addr(_Box3+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1324 :: 		Box3.Height          = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Box3+12)
MOVT	R0, #hi_addr(_Box3+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1325 :: 		Box3.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+14)
MOVT	R0, #hi_addr(_Box3+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1326 :: 		Box3.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+16)
MOVT	R0, #hi_addr(_Box3+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1327 :: 		Box3.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+18)
MOVT	R0, #hi_addr(_Box3+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1328 :: 		Box3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+19)
MOVT	R0, #hi_addr(_Box3+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1329 :: 		Box3.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+20)
MOVT	R0, #hi_addr(_Box3+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1330 :: 		Box3.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+21)
MOVT	R0, #hi_addr(_Box3+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1331 :: 		Box3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+22)
MOVT	R0, #hi_addr(_Box3+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1332 :: 		Box3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box3+24)
MOVT	R0, #hi_addr(_Box3+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1333 :: 		Box3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box3+26)
MOVT	R0, #hi_addr(_Box3+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1334 :: 		Box3.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box3+28)
MOVT	R0, #hi_addr(_Box3+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1335 :: 		Box3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+30)
MOVT	R0, #hi_addr(_Box3+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1336 :: 		Box3.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box3+32)
MOVT	R0, #hi_addr(_Box3+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1337 :: 		Box3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+36)
MOVT	R0, #hi_addr(_Box3+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1338 :: 		Box3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+40)
MOVT	R0, #hi_addr(_Box3+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1339 :: 		Box3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+44)
MOVT	R0, #hi_addr(_Box3+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1340 :: 		Box3.OnPressPtr      = Box3OnPress;
MOVW	R1, #lo_addr(_Box3OnPress+0)
MOVT	R1, #hi_addr(_Box3OnPress+0)
MOVW	R0, #lo_addr(_Box3+48)
MOVT	R0, #hi_addr(_Box3+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1342 :: 		Label16.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Label16+0)
MOVT	R0, #hi_addr(_Label16+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1343 :: 		Label16.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label16+4)
MOVT	R0, #hi_addr(_Label16+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1344 :: 		Label16.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label16+6)
MOVT	R0, #hi_addr(_Label16+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1345 :: 		Label16.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label16+8)
MOVT	R0, #hi_addr(_Label16+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1346 :: 		Label16.Width           = 52;
MOVS	R1, #52
MOVW	R0, #lo_addr(_Label16+10)
MOVT	R0, #hi_addr(_Label16+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1347 :: 		Label16.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label16+12)
MOVT	R0, #hi_addr(_Label16+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1348 :: 		Label16.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label16+26)
MOVT	R0, #hi_addr(_Label16+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1349 :: 		Label16.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+27)
MOVT	R0, #hi_addr(_Label16+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1350 :: 		Label16.Caption         = Label16_Caption;
MOVW	R1, #lo_addr(_Label16_Caption+0)
MOVT	R1, #hi_addr(_Label16_Caption+0)
MOVW	R0, #lo_addr(_Label16+16)
MOVT	R0, #hi_addr(_Label16+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1351 :: 		Label16.FontName        = Open_Sans_Light21x24_Regular;
MOVW	R0, #lo_addr(_Label16+20)
MOVT	R0, #hi_addr(_Label16+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,1352 :: 		Label16.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label16+24)
MOVT	R0, #hi_addr(_Label16+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1353 :: 		Label16.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+28)
MOVT	R0, #hi_addr(_Label16+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1354 :: 		Label16.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+32)
MOVT	R0, #hi_addr(_Label16+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1355 :: 		Label16.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+36)
MOVT	R0, #hi_addr(_Label16+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1356 :: 		Label16.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+40)
MOVT	R0, #hi_addr(_Label16+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1358 :: 		ClockBack.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_ClockBack+0)
MOVT	R0, #hi_addr(_ClockBack+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1359 :: 		ClockBack.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_ClockBack+4)
MOVT	R0, #hi_addr(_ClockBack+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1360 :: 		ClockBack.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_ClockBack+6)
MOVT	R0, #hi_addr(_ClockBack+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1361 :: 		ClockBack.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_ClockBack+8)
MOVT	R0, #hi_addr(_ClockBack+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1362 :: 		ClockBack.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_ClockBack+10)
MOVT	R0, #hi_addr(_ClockBack+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1363 :: 		ClockBack.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_ClockBack+12)
MOVT	R0, #hi_addr(_ClockBack+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1364 :: 		ClockBack.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ClockBack+22)
MOVT	R0, #hi_addr(_ClockBack+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1365 :: 		ClockBack.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ClockBack+23)
MOVT	R0, #hi_addr(_ClockBack+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1366 :: 		ClockBack.Picture_Name    = icon_back_bmp;
MOVW	R1, #lo_addr(_icon_back_bmp+0)
MOVT	R1, #hi_addr(_icon_back_bmp+0)
MOVW	R0, #lo_addr(_ClockBack+16)
MOVT	R0, #hi_addr(_ClockBack+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1367 :: 		ClockBack.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ClockBack+20)
MOVT	R0, #hi_addr(_ClockBack+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1368 :: 		ClockBack.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ClockBack+21)
MOVT	R0, #hi_addr(_ClockBack+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1369 :: 		ClockBack.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ClockBack+24)
MOVT	R0, #hi_addr(_ClockBack+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1370 :: 		ClockBack.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ClockBack+28)
MOVT	R0, #hi_addr(_ClockBack+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1371 :: 		ClockBack.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ClockBack+32)
MOVT	R0, #hi_addr(_ClockBack+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1372 :: 		ClockBack.OnPressPtr      = ClockBackOnPress;
MOVW	R1, #lo_addr(_ClockBackOnPress+0)
MOVT	R1, #hi_addr(_ClockBackOnPress+0)
MOVW	R0, #lo_addr(_ClockBack+36)
MOVT	R0, #hi_addr(_ClockBack+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1374 :: 		Label17.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Label17+0)
MOVT	R0, #hi_addr(_Label17+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1375 :: 		Label17.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label17+4)
MOVT	R0, #hi_addr(_Label17+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1376 :: 		Label17.Left            = 310;
MOVW	R1, #310
MOVW	R0, #lo_addr(_Label17+6)
MOVT	R0, #hi_addr(_Label17+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1377 :: 		Label17.Top             = 235;
MOVS	R1, #235
MOVW	R0, #lo_addr(_Label17+8)
MOVT	R0, #hi_addr(_Label17+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1378 :: 		Label17.Width           = 34;
MOVS	R1, #34
MOVW	R0, #lo_addr(_Label17+10)
MOVT	R0, #hi_addr(_Label17+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1379 :: 		Label17.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label17+12)
MOVT	R0, #hi_addr(_Label17+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1380 :: 		Label17.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label17+26)
MOVT	R0, #hi_addr(_Label17+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1381 :: 		Label17.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+27)
MOVT	R0, #hi_addr(_Label17+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1382 :: 		Label17.Caption         = Label17_Caption;
MOVW	R1, #lo_addr(_Label17_Caption+0)
MOVT	R1, #hi_addr(_Label17_Caption+0)
MOVW	R0, #lo_addr(_Label17+16)
MOVT	R0, #hi_addr(_Label17+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1383 :: 		Label17.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Label17+20)
MOVT	R0, #hi_addr(_Label17+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1384 :: 		Label17.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label17+24)
MOVT	R0, #hi_addr(_Label17+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1385 :: 		Label17.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+28)
MOVT	R0, #hi_addr(_Label17+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1386 :: 		Label17.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+32)
MOVT	R0, #hi_addr(_Label17+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1387 :: 		Label17.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+36)
MOVT	R0, #hi_addr(_Label17+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1388 :: 		Label17.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+40)
MOVT	R0, #hi_addr(_Label17+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1390 :: 		Label18.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Label18+0)
MOVT	R0, #hi_addr(_Label18+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1391 :: 		Label18.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label18+4)
MOVT	R0, #hi_addr(_Label18+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1392 :: 		Label18.Left            = 408;
MOVW	R1, #408
MOVW	R0, #lo_addr(_Label18+6)
MOVT	R0, #hi_addr(_Label18+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1393 :: 		Label18.Top             = 236;
MOVS	R1, #236
MOVW	R0, #lo_addr(_Label18+8)
MOVT	R0, #hi_addr(_Label18+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1394 :: 		Label18.Width           = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Label18+10)
MOVT	R0, #hi_addr(_Label18+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1395 :: 		Label18.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label18+12)
MOVT	R0, #hi_addr(_Label18+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1396 :: 		Label18.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label18+26)
MOVT	R0, #hi_addr(_Label18+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1397 :: 		Label18.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+27)
MOVT	R0, #hi_addr(_Label18+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1398 :: 		Label18.Caption         = Label18_Caption;
MOVW	R1, #lo_addr(_Label18_Caption+0)
MOVT	R1, #hi_addr(_Label18_Caption+0)
MOVW	R0, #lo_addr(_Label18+16)
MOVT	R0, #hi_addr(_Label18+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1399 :: 		Label18.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Label18+20)
MOVT	R0, #hi_addr(_Label18+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1400 :: 		Label18.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label18+24)
MOVT	R0, #hi_addr(_Label18+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1401 :: 		Label18.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+28)
MOVT	R0, #hi_addr(_Label18+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1402 :: 		Label18.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+32)
MOVT	R0, #hi_addr(_Label18+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1403 :: 		Label18.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+36)
MOVT	R0, #hi_addr(_Label18+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1404 :: 		Label18.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+40)
MOVT	R0, #hi_addr(_Label18+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1406 :: 		SyncIcon.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_SyncIcon+0)
MOVT	R0, #hi_addr(_SyncIcon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1407 :: 		SyncIcon.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_SyncIcon+4)
MOVT	R0, #hi_addr(_SyncIcon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1408 :: 		SyncIcon.Left            = 285;
MOVW	R1, #285
MOVW	R0, #lo_addr(_SyncIcon+6)
MOVT	R0, #hi_addr(_SyncIcon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1409 :: 		SyncIcon.Top             = 236;
MOVS	R1, #236
MOVW	R0, #lo_addr(_SyncIcon+8)
MOVT	R0, #hi_addr(_SyncIcon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1410 :: 		SyncIcon.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_SyncIcon+10)
MOVT	R0, #hi_addr(_SyncIcon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1411 :: 		SyncIcon.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_SyncIcon+12)
MOVT	R0, #hi_addr(_SyncIcon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1412 :: 		SyncIcon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SyncIcon+22)
MOVT	R0, #hi_addr(_SyncIcon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1413 :: 		SyncIcon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_SyncIcon+23)
MOVT	R0, #hi_addr(_SyncIcon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1414 :: 		SyncIcon.Picture_Name    = icon_sync_bmp;
MOVW	R1, #lo_addr(_icon_sync_bmp+0)
MOVT	R1, #hi_addr(_icon_sync_bmp+0)
MOVW	R0, #lo_addr(_SyncIcon+16)
MOVT	R0, #hi_addr(_SyncIcon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1415 :: 		SyncIcon.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_SyncIcon+20)
MOVT	R0, #hi_addr(_SyncIcon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1416 :: 		SyncIcon.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SyncIcon+21)
MOVT	R0, #hi_addr(_SyncIcon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1417 :: 		SyncIcon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SyncIcon+24)
MOVT	R0, #hi_addr(_SyncIcon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1418 :: 		SyncIcon.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SyncIcon+28)
MOVT	R0, #hi_addr(_SyncIcon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1419 :: 		SyncIcon.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SyncIcon+32)
MOVT	R0, #hi_addr(_SyncIcon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1420 :: 		SyncIcon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SyncIcon+36)
MOVT	R0, #hi_addr(_SyncIcon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1422 :: 		Image8.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Image8+0)
MOVT	R0, #hi_addr(_Image8+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1423 :: 		Image8.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Image8+4)
MOVT	R0, #hi_addr(_Image8+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1424 :: 		Image8.Left            = 380;
MOVW	R1, #380
MOVW	R0, #lo_addr(_Image8+6)
MOVT	R0, #hi_addr(_Image8+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1425 :: 		Image8.Top             = 236;
MOVS	R1, #236
MOVW	R0, #lo_addr(_Image8+8)
MOVT	R0, #hi_addr(_Image8+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1426 :: 		Image8.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image8+10)
MOVT	R0, #hi_addr(_Image8+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1427 :: 		Image8.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image8+12)
MOVT	R0, #hi_addr(_Image8+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1428 :: 		Image8.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+22)
MOVT	R0, #hi_addr(_Image8+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1429 :: 		Image8.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image8+23)
MOVT	R0, #hi_addr(_Image8+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1430 :: 		Image8.Picture_Name    = icon_ok_bmp;
MOVW	R1, #lo_addr(_icon_ok_bmp+0)
MOVT	R1, #hi_addr(_icon_ok_bmp+0)
MOVW	R0, #lo_addr(_Image8+16)
MOVT	R0, #hi_addr(_Image8+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1431 :: 		Image8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image8+20)
MOVT	R0, #hi_addr(_Image8+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1432 :: 		Image8.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+21)
MOVT	R0, #hi_addr(_Image8+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1433 :: 		Image8.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+24)
MOVT	R0, #hi_addr(_Image8+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1434 :: 		Image8.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+28)
MOVT	R0, #hi_addr(_Image8+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1435 :: 		Image8.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+32)
MOVT	R0, #hi_addr(_Image8+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1436 :: 		Image8.OnPressPtr      = Image8OnPress;
MOVW	R1, #lo_addr(_Image8OnPress+0)
MOVT	R1, #hi_addr(_Image8OnPress+0)
MOVW	R0, #lo_addr(_Image8+36)
MOVT	R0, #hi_addr(_Image8+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1438 :: 		Box4.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Box4+0)
MOVT	R0, #hi_addr(_Box4+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1439 :: 		Box4.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Box4+4)
MOVT	R0, #hi_addr(_Box4+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1440 :: 		Box4.Left            = 212;
MOVS	R1, #212
MOVW	R0, #lo_addr(_Box4+6)
MOVT	R0, #hi_addr(_Box4+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1441 :: 		Box4.Top             = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box4+8)
MOVT	R0, #hi_addr(_Box4+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1442 :: 		Box4.Width           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Box4+10)
MOVT	R0, #hi_addr(_Box4+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1443 :: 		Box4.Height          = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Box4+12)
MOVT	R0, #hi_addr(_Box4+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1444 :: 		Box4.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+14)
MOVT	R0, #hi_addr(_Box4+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1445 :: 		Box4.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+16)
MOVT	R0, #hi_addr(_Box4+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1446 :: 		Box4.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+18)
MOVT	R0, #hi_addr(_Box4+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1447 :: 		Box4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box4+19)
MOVT	R0, #hi_addr(_Box4+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1448 :: 		Box4.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+20)
MOVT	R0, #hi_addr(_Box4+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1449 :: 		Box4.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+21)
MOVT	R0, #hi_addr(_Box4+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1450 :: 		Box4.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+22)
MOVT	R0, #hi_addr(_Box4+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1451 :: 		Box4.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box4+24)
MOVT	R0, #hi_addr(_Box4+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1452 :: 		Box4.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box4+26)
MOVT	R0, #hi_addr(_Box4+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1453 :: 		Box4.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box4+28)
MOVT	R0, #hi_addr(_Box4+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1454 :: 		Box4.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box4+30)
MOVT	R0, #hi_addr(_Box4+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1455 :: 		Box4.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box4+32)
MOVT	R0, #hi_addr(_Box4+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1456 :: 		Box4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+36)
MOVT	R0, #hi_addr(_Box4+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1457 :: 		Box4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+40)
MOVT	R0, #hi_addr(_Box4+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1458 :: 		Box4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+44)
MOVT	R0, #hi_addr(_Box4+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1459 :: 		Box4.OnPressPtr      = Box4OnPress;
MOVW	R1, #lo_addr(_Box4OnPress+0)
MOVT	R1, #hi_addr(_Box4OnPress+0)
MOVW	R0, #lo_addr(_Box4+48)
MOVT	R0, #hi_addr(_Box4+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1461 :: 		Box5.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Box5+0)
MOVT	R0, #hi_addr(_Box5+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1462 :: 		Box5.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Box5+4)
MOVT	R0, #hi_addr(_Box5+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1463 :: 		Box5.Left            = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Box5+6)
MOVT	R0, #hi_addr(_Box5+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1464 :: 		Box5.Top             = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box5+8)
MOVT	R0, #hi_addr(_Box5+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1465 :: 		Box5.Width           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Box5+10)
MOVT	R0, #hi_addr(_Box5+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1466 :: 		Box5.Height          = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Box5+12)
MOVT	R0, #hi_addr(_Box5+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1467 :: 		Box5.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+14)
MOVT	R0, #hi_addr(_Box5+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1468 :: 		Box5.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+16)
MOVT	R0, #hi_addr(_Box5+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1469 :: 		Box5.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+18)
MOVT	R0, #hi_addr(_Box5+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1470 :: 		Box5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box5+19)
MOVT	R0, #hi_addr(_Box5+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1471 :: 		Box5.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+20)
MOVT	R0, #hi_addr(_Box5+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1472 :: 		Box5.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+21)
MOVT	R0, #hi_addr(_Box5+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1473 :: 		Box5.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+22)
MOVT	R0, #hi_addr(_Box5+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1474 :: 		Box5.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box5+24)
MOVT	R0, #hi_addr(_Box5+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1475 :: 		Box5.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box5+26)
MOVT	R0, #hi_addr(_Box5+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1476 :: 		Box5.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box5+28)
MOVT	R0, #hi_addr(_Box5+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1477 :: 		Box5.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box5+30)
MOVT	R0, #hi_addr(_Box5+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1478 :: 		Box5.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box5+32)
MOVT	R0, #hi_addr(_Box5+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1479 :: 		Box5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+36)
MOVT	R0, #hi_addr(_Box5+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1480 :: 		Box5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+40)
MOVT	R0, #hi_addr(_Box5+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1481 :: 		Box5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+44)
MOVT	R0, #hi_addr(_Box5+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1482 :: 		Box5.OnPressPtr      = Box5OnPress;
MOVW	R1, #lo_addr(_Box5OnPress+0)
MOVT	R1, #hi_addr(_Box5OnPress+0)
MOVW	R0, #lo_addr(_Box5+48)
MOVT	R0, #hi_addr(_Box5+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1484 :: 		Image7.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Image7+0)
MOVT	R0, #hi_addr(_Image7+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1485 :: 		Image7.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Image7+4)
MOVT	R0, #hi_addr(_Image7+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1486 :: 		Image7.Left            = 475;
MOVW	R1, #475
MOVW	R0, #lo_addr(_Image7+6)
MOVT	R0, #hi_addr(_Image7+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1487 :: 		Image7.Top             = 248;
MOVS	R1, #248
MOVW	R0, #lo_addr(_Image7+8)
MOVT	R0, #hi_addr(_Image7+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1488 :: 		Image7.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Image7+10)
MOVT	R0, #hi_addr(_Image7+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1489 :: 		Image7.Height          = 740;
MOVW	R1, #740
MOVW	R0, #lo_addr(_Image7+12)
MOVT	R0, #hi_addr(_Image7+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1490 :: 		Image7.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+22)
MOVT	R0, #hi_addr(_Image7+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1491 :: 		Image7.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image7+23)
MOVT	R0, #hi_addr(_Image7+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1492 :: 		Image7.Picture_Name    = stripe_green_bmp;
MOVW	R1, #lo_addr(_stripe_green_bmp+0)
MOVT	R1, #hi_addr(_stripe_green_bmp+0)
MOVW	R0, #lo_addr(_Image7+16)
MOVT	R0, #hi_addr(_Image7+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1493 :: 		Image7.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+20)
MOVT	R0, #hi_addr(_Image7+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1494 :: 		Image7.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+21)
MOVT	R0, #hi_addr(_Image7+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1495 :: 		Image7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+24)
MOVT	R0, #hi_addr(_Image7+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1496 :: 		Image7.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+28)
MOVT	R0, #hi_addr(_Image7+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1497 :: 		Image7.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+32)
MOVT	R0, #hi_addr(_Image7+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1498 :: 		Image7.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+36)
MOVT	R0, #hi_addr(_Image7+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1500 :: 		Label42.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Label42+0)
MOVT	R0, #hi_addr(_Label42+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1501 :: 		Label42.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label42+4)
MOVT	R0, #hi_addr(_Label42+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1502 :: 		Label42.Left            = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label42+6)
MOVT	R0, #hi_addr(_Label42+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1503 :: 		Label42.Top             = 235;
MOVS	R1, #235
MOVW	R0, #lo_addr(_Label42+8)
MOVT	R0, #hi_addr(_Label42+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1504 :: 		Label42.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Label42+10)
MOVT	R0, #hi_addr(_Label42+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1505 :: 		Label42.Height          = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Label42+12)
MOVT	R0, #hi_addr(_Label42+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1506 :: 		Label42.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label42+26)
MOVT	R0, #hi_addr(_Label42+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1507 :: 		Label42.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label42+27)
MOVT	R0, #hi_addr(_Label42+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1508 :: 		Label42.Caption         = Label42_Caption;
MOVW	R1, #lo_addr(_Label42_Caption+0)
MOVT	R1, #hi_addr(_Label42_Caption+0)
MOVW	R0, #lo_addr(_Label42+16)
MOVT	R0, #hi_addr(_Label42+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1509 :: 		Label42.FontName        = Open_Sans_Light13x16_Regular;
MOVW	R0, #lo_addr(_Label42+20)
MOVT	R0, #hi_addr(_Label42+20)
STR	R3, [R0, #0]
;mikromedia_STM32plus_driver.c,1510 :: 		Label42.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label42+24)
MOVT	R0, #hi_addr(_Label42+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1511 :: 		Label42.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label42+28)
MOVT	R0, #hi_addr(_Label42+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1512 :: 		Label42.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label42+32)
MOVT	R0, #hi_addr(_Label42+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1513 :: 		Label42.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label42+36)
MOVT	R0, #hi_addr(_Label42+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1514 :: 		Label42.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label42+40)
MOVT	R0, #hi_addr(_Label42+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1516 :: 		Image17.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Image17+0)
MOVT	R0, #hi_addr(_Image17+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1517 :: 		Image17.Order           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Image17+4)
MOVT	R0, #hi_addr(_Image17+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1518 :: 		Image17.Left            = 474;
MOVW	R1, #474
MOVW	R0, #lo_addr(_Image17+6)
MOVT	R0, #hi_addr(_Image17+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1519 :: 		Image17.Top             = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Image17+8)
MOVT	R0, #hi_addr(_Image17+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1520 :: 		Image17.Width           = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_Image17+10)
MOVT	R0, #hi_addr(_Image17+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1521 :: 		Image17.Height          = 151;
MOVS	R1, #151
MOVW	R0, #lo_addr(_Image17+12)
MOVT	R0, #hi_addr(_Image17+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1522 :: 		Image17.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+22)
MOVT	R0, #hi_addr(_Image17+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1523 :: 		Image17.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image17+23)
MOVT	R0, #hi_addr(_Image17+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1524 :: 		Image17.Picture_Name    = am_pm_bmp;
MOVW	R1, #lo_addr(_am_pm_bmp+0)
MOVT	R1, #hi_addr(_am_pm_bmp+0)
MOVW	R0, #lo_addr(_Image17+16)
MOVT	R0, #hi_addr(_Image17+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1525 :: 		Image17.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+20)
MOVT	R0, #hi_addr(_Image17+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1526 :: 		Image17.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+21)
MOVT	R0, #hi_addr(_Image17+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1527 :: 		Image17.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+24)
MOVT	R0, #hi_addr(_Image17+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1528 :: 		Image17.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+28)
MOVT	R0, #hi_addr(_Image17+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1529 :: 		Image17.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+32)
MOVT	R0, #hi_addr(_Image17+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1530 :: 		Image17.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+36)
MOVT	R0, #hi_addr(_Image17+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1532 :: 		Box14.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Box14+0)
MOVT	R0, #hi_addr(_Box14+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1533 :: 		Box14.Order           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Box14+4)
MOVT	R0, #hi_addr(_Box14+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1534 :: 		Box14.Left            = 305;
MOVW	R1, #305
MOVW	R0, #lo_addr(_Box14+6)
MOVT	R0, #hi_addr(_Box14+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1535 :: 		Box14.Top             = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box14+8)
MOVT	R0, #hi_addr(_Box14+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1536 :: 		Box14.Width           = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_Box14+10)
MOVT	R0, #hi_addr(_Box14+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1537 :: 		Box14.Height          = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Box14+12)
MOVT	R0, #hi_addr(_Box14+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1538 :: 		Box14.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+14)
MOVT	R0, #hi_addr(_Box14+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1539 :: 		Box14.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+16)
MOVT	R0, #hi_addr(_Box14+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1540 :: 		Box14.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+18)
MOVT	R0, #hi_addr(_Box14+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1541 :: 		Box14.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box14+19)
MOVT	R0, #hi_addr(_Box14+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1542 :: 		Box14.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+20)
MOVT	R0, #hi_addr(_Box14+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1543 :: 		Box14.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+21)
MOVT	R0, #hi_addr(_Box14+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1544 :: 		Box14.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+22)
MOVT	R0, #hi_addr(_Box14+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1545 :: 		Box14.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box14+24)
MOVT	R0, #hi_addr(_Box14+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1546 :: 		Box14.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box14+26)
MOVT	R0, #hi_addr(_Box14+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1547 :: 		Box14.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box14+28)
MOVT	R0, #hi_addr(_Box14+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1548 :: 		Box14.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box14+30)
MOVT	R0, #hi_addr(_Box14+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1549 :: 		Box14.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box14+32)
MOVT	R0, #hi_addr(_Box14+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1550 :: 		Box14.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+36)
MOVT	R0, #hi_addr(_Box14+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1551 :: 		Box14.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+40)
MOVT	R0, #hi_addr(_Box14+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1552 :: 		Box14.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+44)
MOVT	R0, #hi_addr(_Box14+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1553 :: 		Box14.OnPressPtr      = Box14OnPress;
MOVW	R1, #lo_addr(_Box14OnPress+0)
MOVT	R1, #hi_addr(_Box14OnPress+0)
MOVW	R0, #lo_addr(_Box14+48)
MOVT	R0, #hi_addr(_Box14+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1555 :: 		Box21.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_Box21+0)
MOVT	R0, #hi_addr(_Box21+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1556 :: 		Box21.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+4)
MOVT	R0, #hi_addr(_Box21+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1557 :: 		Box21.Left            = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box21+6)
MOVT	R0, #hi_addr(_Box21+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1558 :: 		Box21.Top             = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Box21+8)
MOVT	R0, #hi_addr(_Box21+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1559 :: 		Box21.Width           = 108;
MOVS	R1, #108
MOVW	R0, #lo_addr(_Box21+10)
MOVT	R0, #hi_addr(_Box21+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1560 :: 		Box21.Height          = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Box21+12)
MOVT	R0, #hi_addr(_Box21+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1561 :: 		Box21.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box21+14)
MOVT	R0, #hi_addr(_Box21+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1562 :: 		Box21.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+16)
MOVT	R0, #hi_addr(_Box21+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1563 :: 		Box21.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+18)
MOVT	R0, #hi_addr(_Box21+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1564 :: 		Box21.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box21+19)
MOVT	R0, #hi_addr(_Box21+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1565 :: 		Box21.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box21+20)
MOVT	R0, #hi_addr(_Box21+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1566 :: 		Box21.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+21)
MOVT	R0, #hi_addr(_Box21+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1567 :: 		Box21.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+22)
MOVT	R0, #hi_addr(_Box21+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1568 :: 		Box21.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box21+24)
MOVT	R0, #hi_addr(_Box21+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1569 :: 		Box21.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box21+26)
MOVT	R0, #hi_addr(_Box21+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1570 :: 		Box21.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box21+28)
MOVT	R0, #hi_addr(_Box21+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1571 :: 		Box21.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+30)
MOVT	R0, #hi_addr(_Box21+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1572 :: 		Box21.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box21+32)
MOVT	R0, #hi_addr(_Box21+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1573 :: 		Box21.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+36)
MOVT	R0, #hi_addr(_Box21+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1574 :: 		Box21.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+40)
MOVT	R0, #hi_addr(_Box21+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1575 :: 		Box21.OnClickPtr      = BackIconSensorsOnPress;
MOVW	R1, #lo_addr(_BackIconSensorsOnPress+0)
MOVT	R1, #hi_addr(_BackIconSensorsOnPress+0)
MOVW	R0, #lo_addr(_Box21+44)
MOVT	R0, #hi_addr(_Box21+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1576 :: 		Box21.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+48)
MOVT	R0, #hi_addr(_Box21+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1578 :: 		Diagram5_Box1.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_Diagram5_Box1+0)
MOVT	R0, #hi_addr(_Diagram5_Box1+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1579 :: 		Diagram5_Box1.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Box1+4)
MOVT	R0, #hi_addr(_Diagram5_Box1+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1580 :: 		Diagram5_Box1.Left            = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Diagram5_Box1+6)
MOVT	R0, #hi_addr(_Diagram5_Box1+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1581 :: 		Diagram5_Box1.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Box1+8)
MOVT	R0, #hi_addr(_Diagram5_Box1+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1582 :: 		Diagram5_Box1.Width           = 161;
MOVS	R1, #161
MOVW	R0, #lo_addr(_Diagram5_Box1+10)
MOVT	R0, #hi_addr(_Diagram5_Box1+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1583 :: 		Diagram5_Box1.Height          = 273;
MOVW	R1, #273
MOVW	R0, #lo_addr(_Diagram5_Box1+12)
MOVT	R0, #hi_addr(_Diagram5_Box1+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1584 :: 		Diagram5_Box1.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Box1+14)
MOVT	R0, #hi_addr(_Diagram5_Box1+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1585 :: 		Diagram5_Box1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Box1+16)
MOVT	R0, #hi_addr(_Diagram5_Box1+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1586 :: 		Diagram5_Box1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Box1+18)
MOVT	R0, #hi_addr(_Diagram5_Box1+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1587 :: 		Diagram5_Box1.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Box1+19)
MOVT	R0, #hi_addr(_Diagram5_Box1+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1588 :: 		Diagram5_Box1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Box1+20)
MOVT	R0, #hi_addr(_Diagram5_Box1+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1589 :: 		Diagram5_Box1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Box1+21)
MOVT	R0, #hi_addr(_Diagram5_Box1+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1590 :: 		Diagram5_Box1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Box1+22)
MOVT	R0, #hi_addr(_Diagram5_Box1+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1591 :: 		Diagram5_Box1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Diagram5_Box1+24)
MOVT	R0, #hi_addr(_Diagram5_Box1+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1592 :: 		Diagram5_Box1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Diagram5_Box1+26)
MOVT	R0, #hi_addr(_Diagram5_Box1+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1593 :: 		Diagram5_Box1.Color           = 0x7907;
MOVW	R1, #30983
MOVW	R0, #lo_addr(_Diagram5_Box1+28)
MOVT	R0, #hi_addr(_Diagram5_Box1+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1594 :: 		Diagram5_Box1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Box1+30)
MOVT	R0, #hi_addr(_Diagram5_Box1+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1595 :: 		Diagram5_Box1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Diagram5_Box1+32)
MOVT	R0, #hi_addr(_Diagram5_Box1+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1596 :: 		Diagram5_Box1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Box1+36)
MOVT	R0, #hi_addr(_Diagram5_Box1+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1597 :: 		Diagram5_Box1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Box1+40)
MOVT	R0, #hi_addr(_Diagram5_Box1+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1598 :: 		Diagram5_Box1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Box1+44)
MOVT	R0, #hi_addr(_Diagram5_Box1+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1599 :: 		Diagram5_Box1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Box1+48)
MOVT	R0, #hi_addr(_Diagram5_Box1+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1601 :: 		TempIcon.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_TempIcon+0)
MOVT	R0, #hi_addr(_TempIcon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1602 :: 		TempIcon.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_TempIcon+4)
MOVT	R0, #hi_addr(_TempIcon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1603 :: 		TempIcon.Left            = 138;
MOVS	R1, #138
MOVW	R0, #lo_addr(_TempIcon+6)
MOVT	R0, #hi_addr(_TempIcon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1604 :: 		TempIcon.Top             = 62;
MOVS	R1, #62
MOVW	R0, #lo_addr(_TempIcon+8)
MOVT	R0, #hi_addr(_TempIcon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1605 :: 		TempIcon.Width           = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_TempIcon+10)
MOVT	R0, #hi_addr(_TempIcon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1606 :: 		TempIcon.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_TempIcon+12)
MOVT	R0, #hi_addr(_TempIcon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1607 :: 		TempIcon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TempIcon+22)
MOVT	R0, #hi_addr(_TempIcon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1608 :: 		TempIcon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TempIcon+23)
MOVT	R0, #hi_addr(_TempIcon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1609 :: 		TempIcon.Picture_Name    = icon_temp_sensor_bmp;
MOVW	R1, #lo_addr(_icon_temp_sensor_bmp+0)
MOVT	R1, #hi_addr(_icon_temp_sensor_bmp+0)
MOVW	R0, #lo_addr(_TempIcon+16)
MOVT	R0, #hi_addr(_TempIcon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1610 :: 		TempIcon.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TempIcon+20)
MOVT	R0, #hi_addr(_TempIcon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1611 :: 		TempIcon.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TempIcon+21)
MOVT	R0, #hi_addr(_TempIcon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1612 :: 		TempIcon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TempIcon+24)
MOVT	R0, #hi_addr(_TempIcon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1613 :: 		TempIcon.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TempIcon+28)
MOVT	R0, #hi_addr(_TempIcon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1614 :: 		TempIcon.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TempIcon+32)
MOVT	R0, #hi_addr(_TempIcon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1615 :: 		TempIcon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TempIcon+36)
MOVT	R0, #hi_addr(_TempIcon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1617 :: 		LightIcon.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_LightIcon+0)
MOVT	R0, #hi_addr(_LightIcon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1618 :: 		LightIcon.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_LightIcon+4)
MOVT	R0, #hi_addr(_LightIcon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1619 :: 		LightIcon.Left            = 377;
MOVW	R1, #377
MOVW	R0, #lo_addr(_LightIcon+6)
MOVT	R0, #hi_addr(_LightIcon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1620 :: 		LightIcon.Top             = 62;
MOVS	R1, #62
MOVW	R0, #lo_addr(_LightIcon+8)
MOVT	R0, #hi_addr(_LightIcon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1621 :: 		LightIcon.Width           = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_LightIcon+10)
MOVT	R0, #hi_addr(_LightIcon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1622 :: 		LightIcon.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_LightIcon+12)
MOVT	R0, #hi_addr(_LightIcon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1623 :: 		LightIcon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_LightIcon+22)
MOVT	R0, #hi_addr(_LightIcon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1624 :: 		LightIcon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_LightIcon+23)
MOVT	R0, #hi_addr(_LightIcon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1625 :: 		LightIcon.Picture_Name    = icon_light_sensor_BMP;
MOVW	R1, #lo_addr(_icon_light_sensor_BMP+0)
MOVT	R1, #hi_addr(_icon_light_sensor_BMP+0)
MOVW	R0, #lo_addr(_LightIcon+16)
MOVT	R0, #hi_addr(_LightIcon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1626 :: 		LightIcon.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_LightIcon+20)
MOVT	R0, #hi_addr(_LightIcon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1627 :: 		LightIcon.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_LightIcon+21)
MOVT	R0, #hi_addr(_LightIcon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1628 :: 		LightIcon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_LightIcon+24)
MOVT	R0, #hi_addr(_LightIcon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1629 :: 		LightIcon.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_LightIcon+28)
MOVT	R0, #hi_addr(_LightIcon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1630 :: 		LightIcon.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_LightIcon+32)
MOVT	R0, #hi_addr(_LightIcon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1631 :: 		LightIcon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_LightIcon+36)
MOVT	R0, #hi_addr(_LightIcon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1633 :: 		Diagram5_Label1.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_Diagram5_Label1+0)
MOVT	R0, #hi_addr(_Diagram5_Label1+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1634 :: 		Diagram5_Label1.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Diagram5_Label1+4)
MOVT	R0, #hi_addr(_Diagram5_Label1+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1635 :: 		Diagram5_Label1.Left            = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_Diagram5_Label1+6)
MOVT	R0, #hi_addr(_Diagram5_Label1+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1636 :: 		Diagram5_Label1.Top             = 111;
MOVS	R1, #111
MOVW	R0, #lo_addr(_Diagram5_Label1+8)
MOVT	R0, #hi_addr(_Diagram5_Label1+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1637 :: 		Diagram5_Label1.Width           = 97;
MOVS	R1, #97
MOVW	R0, #lo_addr(_Diagram5_Label1+10)
MOVT	R0, #hi_addr(_Diagram5_Label1+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1638 :: 		Diagram5_Label1.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Diagram5_Label1+12)
MOVT	R0, #hi_addr(_Diagram5_Label1+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1639 :: 		Diagram5_Label1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label1+26)
MOVT	R0, #hi_addr(_Diagram5_Label1+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1640 :: 		Diagram5_Label1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label1+27)
MOVT	R0, #hi_addr(_Diagram5_Label1+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1641 :: 		Diagram5_Label1.Caption         = Diagram5_Label1_Caption;
MOVW	R1, #lo_addr(_Diagram5_Label1_Caption+0)
MOVT	R1, #hi_addr(_Diagram5_Label1_Caption+0)
MOVW	R0, #lo_addr(_Diagram5_Label1+16)
MOVT	R0, #hi_addr(_Diagram5_Label1+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1642 :: 		Diagram5_Label1.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Diagram5_Label1+20)
MOVT	R0, #hi_addr(_Diagram5_Label1+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1643 :: 		Diagram5_Label1.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Diagram5_Label1+24)
MOVT	R0, #hi_addr(_Diagram5_Label1+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1644 :: 		Diagram5_Label1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label1+28)
MOVT	R0, #hi_addr(_Diagram5_Label1+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1645 :: 		Diagram5_Label1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label1+32)
MOVT	R0, #hi_addr(_Diagram5_Label1+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1646 :: 		Diagram5_Label1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label1+36)
MOVT	R0, #hi_addr(_Diagram5_Label1+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1647 :: 		Diagram5_Label1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label1+40)
MOVT	R0, #hi_addr(_Diagram5_Label1+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1649 :: 		Diagram5_Label2.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_Diagram5_Label2+0)
MOVT	R0, #hi_addr(_Diagram5_Label2+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1650 :: 		Diagram5_Label2.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Diagram5_Label2+4)
MOVT	R0, #hi_addr(_Diagram5_Label2+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1651 :: 		Diagram5_Label2.Left            = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Diagram5_Label2+6)
MOVT	R0, #hi_addr(_Diagram5_Label2+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1652 :: 		Diagram5_Label2.Top             = 158;
MOVS	R1, #158
MOVW	R0, #lo_addr(_Diagram5_Label2+8)
MOVT	R0, #hi_addr(_Diagram5_Label2+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1653 :: 		Diagram5_Label2.Width           = 141;
MOVS	R1, #141
MOVW	R0, #lo_addr(_Diagram5_Label2+10)
MOVT	R0, #hi_addr(_Diagram5_Label2+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1654 :: 		Diagram5_Label2.Height          = 67;
MOVS	R1, #67
MOVW	R0, #lo_addr(_Diagram5_Label2+12)
MOVT	R0, #hi_addr(_Diagram5_Label2+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1655 :: 		Diagram5_Label2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label2+26)
MOVT	R0, #hi_addr(_Diagram5_Label2+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1656 :: 		Diagram5_Label2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label2+27)
MOVT	R0, #hi_addr(_Diagram5_Label2+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1657 :: 		Diagram5_Label2.Caption         = Diagram5_Label2_Caption;
MOVW	R1, #lo_addr(_Diagram5_Label2_Caption+0)
MOVT	R1, #hi_addr(_Diagram5_Label2_Caption+0)
MOVW	R0, #lo_addr(_Diagram5_Label2+16)
MOVT	R0, #hi_addr(_Diagram5_Label2+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1658 :: 		Diagram5_Label2.FontName        = Open_Sans46x50_Regular;
MOVW	R2, #lo_addr(_Open_Sans46x50_Regular+0)
MOVT	R2, #hi_addr(_Open_Sans46x50_Regular+0)
MOVW	R0, #lo_addr(_Diagram5_Label2+20)
MOVT	R0, #hi_addr(_Diagram5_Label2+20)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,1659 :: 		Diagram5_Label2.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Diagram5_Label2+24)
MOVT	R0, #hi_addr(_Diagram5_Label2+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1660 :: 		Diagram5_Label2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label2+28)
MOVT	R0, #hi_addr(_Diagram5_Label2+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1661 :: 		Diagram5_Label2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label2+32)
MOVT	R0, #hi_addr(_Diagram5_Label2+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1662 :: 		Diagram5_Label2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label2+36)
MOVT	R0, #hi_addr(_Diagram5_Label2+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1663 :: 		Diagram5_Label2.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label2+40)
MOVT	R0, #hi_addr(_Diagram5_Label2+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1665 :: 		Diagram5_Label3.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_Diagram5_Label3+0)
MOVT	R0, #hi_addr(_Diagram5_Label3+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1666 :: 		Diagram5_Label3.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Diagram5_Label3+4)
MOVT	R0, #hi_addr(_Diagram5_Label3+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1667 :: 		Diagram5_Label3.Left            = 358;
MOVW	R1, #358
MOVW	R0, #lo_addr(_Diagram5_Label3+6)
MOVT	R0, #hi_addr(_Diagram5_Label3+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1668 :: 		Diagram5_Label3.Top             = 114;
MOVS	R1, #114
MOVW	R0, #lo_addr(_Diagram5_Label3+8)
MOVT	R0, #hi_addr(_Diagram5_Label3+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1669 :: 		Diagram5_Label3.Width           = 93;
MOVS	R1, #93
MOVW	R0, #lo_addr(_Diagram5_Label3+10)
MOVT	R0, #hi_addr(_Diagram5_Label3+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1670 :: 		Diagram5_Label3.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Diagram5_Label3+12)
MOVT	R0, #hi_addr(_Diagram5_Label3+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1671 :: 		Diagram5_Label3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label3+26)
MOVT	R0, #hi_addr(_Diagram5_Label3+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1672 :: 		Diagram5_Label3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label3+27)
MOVT	R0, #hi_addr(_Diagram5_Label3+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1673 :: 		Diagram5_Label3.Caption         = Diagram5_Label3_Caption;
MOVW	R1, #lo_addr(_Diagram5_Label3_Caption+0)
MOVT	R1, #hi_addr(_Diagram5_Label3_Caption+0)
MOVW	R0, #lo_addr(_Diagram5_Label3+16)
MOVT	R0, #hi_addr(_Diagram5_Label3+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1674 :: 		Diagram5_Label3.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Diagram5_Label3+20)
MOVT	R0, #hi_addr(_Diagram5_Label3+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1675 :: 		Diagram5_Label3.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Diagram5_Label3+24)
MOVT	R0, #hi_addr(_Diagram5_Label3+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1676 :: 		Diagram5_Label3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label3+28)
MOVT	R0, #hi_addr(_Diagram5_Label3+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1677 :: 		Diagram5_Label3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label3+32)
MOVT	R0, #hi_addr(_Diagram5_Label3+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1678 :: 		Diagram5_Label3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label3+36)
MOVT	R0, #hi_addr(_Diagram5_Label3+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1679 :: 		Diagram5_Label3.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label3+40)
MOVT	R0, #hi_addr(_Diagram5_Label3+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1681 :: 		Diagram5_Label4.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_Diagram5_Label4+0)
MOVT	R0, #hi_addr(_Diagram5_Label4+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1682 :: 		Diagram5_Label4.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Diagram5_Label4+4)
MOVT	R0, #hi_addr(_Diagram5_Label4+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1683 :: 		Diagram5_Label4.Left            = 339;
MOVW	R1, #339
MOVW	R0, #lo_addr(_Diagram5_Label4+6)
MOVT	R0, #hi_addr(_Diagram5_Label4+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1684 :: 		Diagram5_Label4.Top             = 158;
MOVS	R1, #158
MOVW	R0, #lo_addr(_Diagram5_Label4+8)
MOVT	R0, #hi_addr(_Diagram5_Label4+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1685 :: 		Diagram5_Label4.Width           = 130;
MOVS	R1, #130
MOVW	R0, #lo_addr(_Diagram5_Label4+10)
MOVT	R0, #hi_addr(_Diagram5_Label4+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1686 :: 		Diagram5_Label4.Height          = 67;
MOVS	R1, #67
MOVW	R0, #lo_addr(_Diagram5_Label4+12)
MOVT	R0, #hi_addr(_Diagram5_Label4+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1687 :: 		Diagram5_Label4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label4+26)
MOVT	R0, #hi_addr(_Diagram5_Label4+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1688 :: 		Diagram5_Label4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label4+27)
MOVT	R0, #hi_addr(_Diagram5_Label4+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1689 :: 		Diagram5_Label4.Caption         = Diagram5_Label4_Caption;
MOVW	R1, #lo_addr(_Diagram5_Label4_Caption+0)
MOVT	R1, #hi_addr(_Diagram5_Label4_Caption+0)
MOVW	R0, #lo_addr(_Diagram5_Label4+16)
MOVT	R0, #hi_addr(_Diagram5_Label4+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1690 :: 		Diagram5_Label4.FontName        = Open_Sans46x50_Regular;
MOVW	R0, #lo_addr(_Diagram5_Label4+20)
MOVT	R0, #hi_addr(_Diagram5_Label4+20)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,1691 :: 		Diagram5_Label4.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Diagram5_Label4+24)
MOVT	R0, #hi_addr(_Diagram5_Label4+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1692 :: 		Diagram5_Label4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label4+28)
MOVT	R0, #hi_addr(_Diagram5_Label4+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1693 :: 		Diagram5_Label4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label4+32)
MOVT	R0, #hi_addr(_Diagram5_Label4+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1694 :: 		Diagram5_Label4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label4+36)
MOVT	R0, #hi_addr(_Diagram5_Label4+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1695 :: 		Diagram5_Label4.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label4+40)
MOVT	R0, #hi_addr(_Diagram5_Label4+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1697 :: 		Diagram5_Label5.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_Diagram5_Label5+0)
MOVT	R0, #hi_addr(_Diagram5_Label5+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1698 :: 		Diagram5_Label5.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Diagram5_Label5+4)
MOVT	R0, #hi_addr(_Diagram5_Label5+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1699 :: 		Diagram5_Label5.Left            = 204;
MOVS	R1, #204
MOVW	R0, #lo_addr(_Diagram5_Label5+6)
MOVT	R0, #hi_addr(_Diagram5_Label5+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1700 :: 		Diagram5_Label5.Top             = 162;
MOVS	R1, #162
MOVW	R0, #lo_addr(_Diagram5_Label5+8)
MOVT	R0, #hi_addr(_Diagram5_Label5+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1701 :: 		Diagram5_Label5.Width           = 62;
MOVS	R1, #62
MOVW	R0, #lo_addr(_Diagram5_Label5+10)
MOVT	R0, #hi_addr(_Diagram5_Label5+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1702 :: 		Diagram5_Label5.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Diagram5_Label5+12)
MOVT	R0, #hi_addr(_Diagram5_Label5+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1703 :: 		Diagram5_Label5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label5+26)
MOVT	R0, #hi_addr(_Diagram5_Label5+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1704 :: 		Diagram5_Label5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label5+27)
MOVT	R0, #hi_addr(_Diagram5_Label5+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1705 :: 		Diagram5_Label5.Caption         = Diagram5_Label5_Caption;
MOVW	R1, #lo_addr(_Diagram5_Label5_Caption+0)
MOVT	R1, #hi_addr(_Diagram5_Label5_Caption+0)
MOVW	R0, #lo_addr(_Diagram5_Label5+16)
MOVT	R0, #hi_addr(_Diagram5_Label5+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1706 :: 		Diagram5_Label5.FontName        = Open_Sans_Light21x24_Regular;
MOVW	R0, #lo_addr(_Diagram5_Label5+20)
MOVT	R0, #hi_addr(_Diagram5_Label5+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,1707 :: 		Diagram5_Label5.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Diagram5_Label5+24)
MOVT	R0, #hi_addr(_Diagram5_Label5+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1708 :: 		Diagram5_Label5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label5+28)
MOVT	R0, #hi_addr(_Diagram5_Label5+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1709 :: 		Diagram5_Label5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label5+32)
MOVT	R0, #hi_addr(_Diagram5_Label5+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1710 :: 		Diagram5_Label5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label5+36)
MOVT	R0, #hi_addr(_Diagram5_Label5+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1711 :: 		Diagram5_Label5.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label5+40)
MOVT	R0, #hi_addr(_Diagram5_Label5+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1713 :: 		BackIconSensors.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_BackIconSensors+0)
MOVT	R0, #hi_addr(_BackIconSensors+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1714 :: 		BackIconSensors.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_BackIconSensors+4)
MOVT	R0, #hi_addr(_BackIconSensors+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1715 :: 		BackIconSensors.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_BackIconSensors+6)
MOVT	R0, #hi_addr(_BackIconSensors+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1716 :: 		BackIconSensors.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_BackIconSensors+8)
MOVT	R0, #hi_addr(_BackIconSensors+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1717 :: 		BackIconSensors.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_BackIconSensors+10)
MOVT	R0, #hi_addr(_BackIconSensors+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1718 :: 		BackIconSensors.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_BackIconSensors+12)
MOVT	R0, #hi_addr(_BackIconSensors+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1719 :: 		BackIconSensors.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BackIconSensors+22)
MOVT	R0, #hi_addr(_BackIconSensors+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1720 :: 		BackIconSensors.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BackIconSensors+23)
MOVT	R0, #hi_addr(_BackIconSensors+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1721 :: 		BackIconSensors.Picture_Name    = icon_back_sensors_bmp;
MOVW	R1, #lo_addr(_icon_back_sensors_bmp+0)
MOVT	R1, #hi_addr(_icon_back_sensors_bmp+0)
MOVW	R0, #lo_addr(_BackIconSensors+16)
MOVT	R0, #hi_addr(_BackIconSensors+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1722 :: 		BackIconSensors.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BackIconSensors+20)
MOVT	R0, #hi_addr(_BackIconSensors+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1723 :: 		BackIconSensors.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BackIconSensors+21)
MOVT	R0, #hi_addr(_BackIconSensors+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1724 :: 		BackIconSensors.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BackIconSensors+24)
MOVT	R0, #hi_addr(_BackIconSensors+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1725 :: 		BackIconSensors.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BackIconSensors+28)
MOVT	R0, #hi_addr(_BackIconSensors+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1726 :: 		BackIconSensors.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BackIconSensors+32)
MOVT	R0, #hi_addr(_BackIconSensors+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1727 :: 		BackIconSensors.OnPressPtr      = BackIconSensorsOnPress;
MOVW	R1, #lo_addr(_BackIconSensorsOnPress+0)
MOVT	R1, #hi_addr(_BackIconSensorsOnPress+0)
MOVW	R0, #lo_addr(_BackIconSensors+36)
MOVT	R0, #hi_addr(_BackIconSensors+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1729 :: 		Diagram5_Label6.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_Diagram5_Label6+0)
MOVT	R0, #hi_addr(_Diagram5_Label6+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1730 :: 		Diagram5_Label6.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Diagram5_Label6+4)
MOVT	R0, #hi_addr(_Diagram5_Label6+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1731 :: 		Diagram5_Label6.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Diagram5_Label6+6)
MOVT	R0, #hi_addr(_Diagram5_Label6+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1732 :: 		Diagram5_Label6.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Diagram5_Label6+8)
MOVT	R0, #hi_addr(_Diagram5_Label6+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1733 :: 		Diagram5_Label6.Width           = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_Diagram5_Label6+10)
MOVT	R0, #hi_addr(_Diagram5_Label6+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1734 :: 		Diagram5_Label6.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Diagram5_Label6+12)
MOVT	R0, #hi_addr(_Diagram5_Label6+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1735 :: 		Diagram5_Label6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label6+26)
MOVT	R0, #hi_addr(_Diagram5_Label6+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1736 :: 		Diagram5_Label6.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label6+27)
MOVT	R0, #hi_addr(_Diagram5_Label6+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1737 :: 		Diagram5_Label6.Caption         = Diagram5_Label6_Caption;
MOVW	R1, #lo_addr(_Diagram5_Label6_Caption+0)
MOVT	R1, #hi_addr(_Diagram5_Label6_Caption+0)
MOVW	R0, #lo_addr(_Diagram5_Label6+16)
MOVT	R0, #hi_addr(_Diagram5_Label6+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1738 :: 		Diagram5_Label6.FontName        = Open_Sans_Light21x24_Regular;
MOVW	R0, #lo_addr(_Diagram5_Label6+20)
MOVT	R0, #hi_addr(_Diagram5_Label6+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,1739 :: 		Diagram5_Label6.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Diagram5_Label6+24)
MOVT	R0, #hi_addr(_Diagram5_Label6+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1740 :: 		Diagram5_Label6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label6+28)
MOVT	R0, #hi_addr(_Diagram5_Label6+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1741 :: 		Diagram5_Label6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label6+32)
MOVT	R0, #hi_addr(_Diagram5_Label6+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1742 :: 		Diagram5_Label6.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label6+36)
MOVT	R0, #hi_addr(_Diagram5_Label6+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1743 :: 		Diagram5_Label6.OnPressPtr      = BackIconSensorsOnPress;
MOVW	R1, #lo_addr(_BackIconSensorsOnPress+0)
MOVT	R1, #hi_addr(_BackIconSensorsOnPress+0)
MOVW	R0, #lo_addr(_Diagram5_Label6+40)
MOVT	R0, #hi_addr(_Diagram5_Label6+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1745 :: 		Label21.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_Label21+0)
MOVT	R0, #hi_addr(_Label21+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1746 :: 		Label21.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Label21+4)
MOVT	R0, #hi_addr(_Label21+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1747 :: 		Label21.Left            = 192;
MOVS	R1, #192
MOVW	R0, #lo_addr(_Label21+6)
MOVT	R0, #hi_addr(_Label21+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1748 :: 		Label21.Top             = 161;
MOVS	R1, #161
MOVW	R0, #lo_addr(_Label21+8)
MOVT	R0, #hi_addr(_Label21+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1749 :: 		Label21.Width           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label21+10)
MOVT	R0, #hi_addr(_Label21+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1750 :: 		Label21.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label21+12)
MOVT	R0, #hi_addr(_Label21+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1751 :: 		Label21.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label21+26)
MOVT	R0, #hi_addr(_Label21+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1752 :: 		Label21.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label21+27)
MOVT	R0, #hi_addr(_Label21+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1753 :: 		Label21.Caption         = Label21_Caption;
MOVW	R1, #lo_addr(_Label21_Caption+0)
MOVT	R1, #hi_addr(_Label21_Caption+0)
MOVW	R0, #lo_addr(_Label21+16)
MOVT	R0, #hi_addr(_Label21+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1754 :: 		Label21.FontName        = Open_Sans_Light21x24_Regular;
MOVW	R0, #lo_addr(_Label21+20)
MOVT	R0, #hi_addr(_Label21+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,1755 :: 		Label21.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label21+24)
MOVT	R0, #hi_addr(_Label21+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1756 :: 		Label21.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+28)
MOVT	R0, #hi_addr(_Label21+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1757 :: 		Label21.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+32)
MOVT	R0, #hi_addr(_Label21+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1758 :: 		Label21.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+36)
MOVT	R0, #hi_addr(_Label21+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1759 :: 		Label21.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+40)
MOVT	R0, #hi_addr(_Label21+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1761 :: 		Box20.OwnerScreen     = &MP3_SD;
MOVW	R1, #lo_addr(_MP3_SD+0)
MOVT	R1, #hi_addr(_MP3_SD+0)
MOVW	R0, #lo_addr(_Box20+0)
MOVT	R0, #hi_addr(_Box20+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1762 :: 		Box20.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+4)
MOVT	R0, #hi_addr(_Box20+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1763 :: 		Box20.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Box20+6)
MOVT	R0, #hi_addr(_Box20+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1764 :: 		Box20.Top             = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box20+8)
MOVT	R0, #hi_addr(_Box20+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1765 :: 		Box20.Width           = 138;
MOVS	R1, #138
MOVW	R0, #lo_addr(_Box20+10)
MOVT	R0, #hi_addr(_Box20+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1766 :: 		Box20.Height          = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_Box20+12)
MOVT	R0, #hi_addr(_Box20+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1767 :: 		Box20.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box20+14)
MOVT	R0, #hi_addr(_Box20+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1768 :: 		Box20.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+16)
MOVT	R0, #hi_addr(_Box20+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1769 :: 		Box20.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+18)
MOVT	R0, #hi_addr(_Box20+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1770 :: 		Box20.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box20+19)
MOVT	R0, #hi_addr(_Box20+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1771 :: 		Box20.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box20+20)
MOVT	R0, #hi_addr(_Box20+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1772 :: 		Box20.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+21)
MOVT	R0, #hi_addr(_Box20+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1773 :: 		Box20.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+22)
MOVT	R0, #hi_addr(_Box20+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1774 :: 		Box20.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box20+24)
MOVT	R0, #hi_addr(_Box20+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1775 :: 		Box20.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box20+26)
MOVT	R0, #hi_addr(_Box20+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1776 :: 		Box20.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box20+28)
MOVT	R0, #hi_addr(_Box20+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1777 :: 		Box20.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+30)
MOVT	R0, #hi_addr(_Box20+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1778 :: 		Box20.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box20+32)
MOVT	R0, #hi_addr(_Box20+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1779 :: 		Box20.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+36)
MOVT	R0, #hi_addr(_Box20+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1780 :: 		Box20.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+40)
MOVT	R0, #hi_addr(_Box20+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1781 :: 		Box20.OnClickPtr      = mp3_back_iconOnPress;
MOVW	R1, #lo_addr(_mp3_back_iconOnPress+0)
MOVT	R1, #hi_addr(_mp3_back_iconOnPress+0)
MOVW	R0, #lo_addr(_Box20+44)
MOVT	R0, #hi_addr(_Box20+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1782 :: 		Box20.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+48)
MOVT	R0, #hi_addr(_Box20+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1784 :: 		Label22.OwnerScreen     = &MP3_SD;
MOVW	R1, #lo_addr(_MP3_SD+0)
MOVT	R1, #hi_addr(_MP3_SD+0)
MOVW	R0, #lo_addr(_Label22+0)
MOVT	R0, #hi_addr(_Label22+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1785 :: 		Label22.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label22+4)
MOVT	R0, #hi_addr(_Label22+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1786 :: 		Label22.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label22+6)
MOVT	R0, #hi_addr(_Label22+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1787 :: 		Label22.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label22+8)
MOVT	R0, #hi_addr(_Label22+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1788 :: 		Label22.Width           = 112;
MOVS	R1, #112
MOVW	R0, #lo_addr(_Label22+10)
MOVT	R0, #hi_addr(_Label22+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1789 :: 		Label22.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Label22+12)
MOVT	R0, #hi_addr(_Label22+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1790 :: 		Label22.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label22+26)
MOVT	R0, #hi_addr(_Label22+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1791 :: 		Label22.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+27)
MOVT	R0, #hi_addr(_Label22+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1792 :: 		Label22.Caption         = Label22_Caption;
MOVW	R1, #lo_addr(_Label22_Caption+0)
MOVT	R1, #hi_addr(_Label22_Caption+0)
MOVW	R0, #lo_addr(_Label22+16)
MOVT	R0, #hi_addr(_Label22+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1793 :: 		Label22.FontName        = Open_Sans_Light21x24_Regular;
MOVW	R0, #lo_addr(_Label22+20)
MOVT	R0, #hi_addr(_Label22+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,1794 :: 		Label22.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label22+24)
MOVT	R0, #hi_addr(_Label22+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1795 :: 		Label22.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+28)
MOVT	R0, #hi_addr(_Label22+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1796 :: 		Label22.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+32)
MOVT	R0, #hi_addr(_Label22+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1797 :: 		Label22.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+36)
MOVT	R0, #hi_addr(_Label22+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1798 :: 		Label22.OnPressPtr      = Label22OnPress;
MOVW	R1, #lo_addr(_Label22OnPress+0)
MOVT	R1, #hi_addr(_Label22OnPress+0)
MOVW	R0, #lo_addr(_Label22+40)
MOVT	R0, #hi_addr(_Label22+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1800 :: 		Label23.OwnerScreen     = &MP3_SD;
MOVW	R1, #lo_addr(_MP3_SD+0)
MOVT	R1, #hi_addr(_MP3_SD+0)
MOVW	R0, #lo_addr(_Label23+0)
MOVT	R0, #hi_addr(_Label23+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1801 :: 		Label23.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label23+4)
MOVT	R0, #hi_addr(_Label23+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1802 :: 		Label23.Left            = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_Label23+6)
MOVT	R0, #hi_addr(_Label23+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1803 :: 		Label23.Top             = 128;
MOVS	R1, #128
MOVW	R0, #lo_addr(_Label23+8)
MOVT	R0, #hi_addr(_Label23+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1804 :: 		Label23.Width           = 145;
MOVS	R1, #145
MOVW	R0, #lo_addr(_Label23+10)
MOVT	R0, #hi_addr(_Label23+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1805 :: 		Label23.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label23+12)
MOVT	R0, #hi_addr(_Label23+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1806 :: 		Label23.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label23+26)
MOVT	R0, #hi_addr(_Label23+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1807 :: 		Label23.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label23+27)
MOVT	R0, #hi_addr(_Label23+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1808 :: 		Label23.Caption         = Label23_Caption;
MOVW	R1, #lo_addr(_Label23_Caption+0)
MOVT	R1, #hi_addr(_Label23_Caption+0)
MOVW	R0, #lo_addr(_Label23+16)
MOVT	R0, #hi_addr(_Label23+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1809 :: 		Label23.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Label23+20)
MOVT	R0, #hi_addr(_Label23+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1810 :: 		Label23.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label23+24)
MOVT	R0, #hi_addr(_Label23+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1811 :: 		Label23.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+28)
MOVT	R0, #hi_addr(_Label23+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1812 :: 		Label23.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+32)
MOVT	R0, #hi_addr(_Label23+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1813 :: 		Label23.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+36)
MOVT	R0, #hi_addr(_Label23+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1814 :: 		Label23.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+40)
MOVT	R0, #hi_addr(_Label23+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1816 :: 		Image11.OwnerScreen     = &MP3_SD;
MOVW	R1, #lo_addr(_MP3_SD+0)
MOVT	R1, #hi_addr(_MP3_SD+0)
MOVW	R0, #lo_addr(_Image11+0)
MOVT	R0, #hi_addr(_Image11+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1817 :: 		Image11.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Image11+4)
MOVT	R0, #hi_addr(_Image11+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1818 :: 		Image11.Left            = 427;
MOVW	R1, #427
MOVW	R0, #lo_addr(_Image11+6)
MOVT	R0, #hi_addr(_Image11+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1819 :: 		Image11.Top             = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Image11+8)
MOVT	R0, #hi_addr(_Image11+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1820 :: 		Image11.Width           = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_Image11+10)
MOVT	R0, #hi_addr(_Image11+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1821 :: 		Image11.Height          = 34;
MOVS	R1, #34
MOVW	R0, #lo_addr(_Image11+12)
MOVT	R0, #hi_addr(_Image11+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1822 :: 		Image11.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image11+22)
MOVT	R0, #hi_addr(_Image11+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1823 :: 		Image11.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image11+23)
MOVT	R0, #hi_addr(_Image11+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1824 :: 		Image11.Picture_Name    = icon_microsd_bmp;
MOVW	R1, #lo_addr(_icon_microsd_bmp+0)
MOVT	R1, #hi_addr(_icon_microsd_bmp+0)
MOVW	R0, #lo_addr(_Image11+16)
MOVT	R0, #hi_addr(_Image11+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1825 :: 		Image11.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image11+20)
MOVT	R0, #hi_addr(_Image11+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1826 :: 		Image11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image11+21)
MOVT	R0, #hi_addr(_Image11+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1827 :: 		Image11.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image11+24)
MOVT	R0, #hi_addr(_Image11+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1828 :: 		Image11.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image11+28)
MOVT	R0, #hi_addr(_Image11+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1829 :: 		Image11.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image11+32)
MOVT	R0, #hi_addr(_Image11+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1830 :: 		Image11.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image11+36)
MOVT	R0, #hi_addr(_Image11+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1832 :: 		Image12.OwnerScreen     = &MP3_SD;
MOVW	R1, #lo_addr(_MP3_SD+0)
MOVT	R1, #hi_addr(_MP3_SD+0)
MOVW	R0, #lo_addr(_Image12+0)
MOVT	R0, #hi_addr(_Image12+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1833 :: 		Image12.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Image12+4)
MOVT	R0, #hi_addr(_Image12+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1834 :: 		Image12.Left            = 400;
MOVW	R1, #400
MOVW	R0, #lo_addr(_Image12+6)
MOVT	R0, #hi_addr(_Image12+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1835 :: 		Image12.Top             = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Image12+8)
MOVT	R0, #hi_addr(_Image12+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1836 :: 		Image12.Width           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Image12+10)
MOVT	R0, #hi_addr(_Image12+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1837 :: 		Image12.Height          = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Image12+12)
MOVT	R0, #hi_addr(_Image12+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1838 :: 		Image12.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+22)
MOVT	R0, #hi_addr(_Image12+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1839 :: 		Image12.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image12+23)
MOVT	R0, #hi_addr(_Image12+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1840 :: 		Image12.Picture_Name    = icon_anim_01_bmp;
MOVW	R1, #lo_addr(_icon_anim_01_bmp+0)
MOVT	R1, #hi_addr(_icon_anim_01_bmp+0)
MOVW	R0, #lo_addr(_Image12+16)
MOVT	R0, #hi_addr(_Image12+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1841 :: 		Image12.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image12+20)
MOVT	R0, #hi_addr(_Image12+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1842 :: 		Image12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image12+21)
MOVT	R0, #hi_addr(_Image12+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1843 :: 		Image12.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+24)
MOVT	R0, #hi_addr(_Image12+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1844 :: 		Image12.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+28)
MOVT	R0, #hi_addr(_Image12+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1845 :: 		Image12.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+32)
MOVT	R0, #hi_addr(_Image12+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1846 :: 		Image12.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+36)
MOVT	R0, #hi_addr(_Image12+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1848 :: 		Image13.OwnerScreen     = &MP3_SD;
MOVW	R1, #lo_addr(_MP3_SD+0)
MOVT	R1, #hi_addr(_MP3_SD+0)
MOVW	R0, #lo_addr(_Image13+0)
MOVT	R0, #hi_addr(_Image13+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1849 :: 		Image13.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image13+4)
MOVT	R0, #hi_addr(_Image13+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1850 :: 		Image13.Left            = 400;
MOVW	R1, #400
MOVW	R0, #lo_addr(_Image13+6)
MOVT	R0, #hi_addr(_Image13+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1851 :: 		Image13.Top             = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Image13+8)
MOVT	R0, #hi_addr(_Image13+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1852 :: 		Image13.Width           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Image13+10)
MOVT	R0, #hi_addr(_Image13+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1853 :: 		Image13.Height          = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Image13+12)
MOVT	R0, #hi_addr(_Image13+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1854 :: 		Image13.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image13+22)
MOVT	R0, #hi_addr(_Image13+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1855 :: 		Image13.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image13+23)
MOVT	R0, #hi_addr(_Image13+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1856 :: 		Image13.Picture_Name    = icon_anim_02_bmp;
MOVW	R1, #lo_addr(_icon_anim_02_bmp+0)
MOVT	R1, #hi_addr(_icon_anim_02_bmp+0)
MOVW	R0, #lo_addr(_Image13+16)
MOVT	R0, #hi_addr(_Image13+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1857 :: 		Image13.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image13+20)
MOVT	R0, #hi_addr(_Image13+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1858 :: 		Image13.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image13+21)
MOVT	R0, #hi_addr(_Image13+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1859 :: 		Image13.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image13+24)
MOVT	R0, #hi_addr(_Image13+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1860 :: 		Image13.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image13+28)
MOVT	R0, #hi_addr(_Image13+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1861 :: 		Image13.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image13+32)
MOVT	R0, #hi_addr(_Image13+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1862 :: 		Image13.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image13+36)
MOVT	R0, #hi_addr(_Image13+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1864 :: 		Image14.OwnerScreen     = &MP3_SD;
MOVW	R1, #lo_addr(_MP3_SD+0)
MOVT	R1, #hi_addr(_MP3_SD+0)
MOVW	R0, #lo_addr(_Image14+0)
MOVT	R0, #hi_addr(_Image14+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1865 :: 		Image14.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image14+4)
MOVT	R0, #hi_addr(_Image14+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1866 :: 		Image14.Left            = 400;
MOVW	R1, #400
MOVW	R0, #lo_addr(_Image14+6)
MOVT	R0, #hi_addr(_Image14+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1867 :: 		Image14.Top             = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Image14+8)
MOVT	R0, #hi_addr(_Image14+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1868 :: 		Image14.Width           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Image14+10)
MOVT	R0, #hi_addr(_Image14+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1869 :: 		Image14.Height          = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Image14+12)
MOVT	R0, #hi_addr(_Image14+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1870 :: 		Image14.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image14+22)
MOVT	R0, #hi_addr(_Image14+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1871 :: 		Image14.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image14+23)
MOVT	R0, #hi_addr(_Image14+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1872 :: 		Image14.Picture_Name    = icon_anim_03_bmp;
MOVW	R1, #lo_addr(_icon_anim_03_bmp+0)
MOVT	R1, #hi_addr(_icon_anim_03_bmp+0)
MOVW	R0, #lo_addr(_Image14+16)
MOVT	R0, #hi_addr(_Image14+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1873 :: 		Image14.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image14+20)
MOVT	R0, #hi_addr(_Image14+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1874 :: 		Image14.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image14+21)
MOVT	R0, #hi_addr(_Image14+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1875 :: 		Image14.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image14+24)
MOVT	R0, #hi_addr(_Image14+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1876 :: 		Image14.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image14+28)
MOVT	R0, #hi_addr(_Image14+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1877 :: 		Image14.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image14+32)
MOVT	R0, #hi_addr(_Image14+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1878 :: 		Image14.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image14+36)
MOVT	R0, #hi_addr(_Image14+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1880 :: 		mp3_back_icon.OwnerScreen     = &MP3_SD;
MOVW	R1, #lo_addr(_MP3_SD+0)
MOVT	R1, #hi_addr(_MP3_SD+0)
MOVW	R0, #lo_addr(_mp3_back_icon+0)
MOVT	R0, #hi_addr(_mp3_back_icon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1881 :: 		mp3_back_icon.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_mp3_back_icon+4)
MOVT	R0, #hi_addr(_mp3_back_icon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1882 :: 		mp3_back_icon.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_mp3_back_icon+6)
MOVT	R0, #hi_addr(_mp3_back_icon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1883 :: 		mp3_back_icon.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_mp3_back_icon+8)
MOVT	R0, #hi_addr(_mp3_back_icon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1884 :: 		mp3_back_icon.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_mp3_back_icon+10)
MOVT	R0, #hi_addr(_mp3_back_icon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1885 :: 		mp3_back_icon.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_mp3_back_icon+12)
MOVT	R0, #hi_addr(_mp3_back_icon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1886 :: 		mp3_back_icon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_mp3_back_icon+22)
MOVT	R0, #hi_addr(_mp3_back_icon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1887 :: 		mp3_back_icon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_mp3_back_icon+23)
MOVT	R0, #hi_addr(_mp3_back_icon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1888 :: 		mp3_back_icon.Picture_Name    = icon_back_mp3_bmp;
MOVW	R2, #lo_addr(_icon_back_mp3_bmp+0)
MOVT	R2, #hi_addr(_icon_back_mp3_bmp+0)
MOVW	R0, #lo_addr(_mp3_back_icon+16)
MOVT	R0, #hi_addr(_mp3_back_icon+16)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,1889 :: 		mp3_back_icon.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_mp3_back_icon+20)
MOVT	R0, #hi_addr(_mp3_back_icon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1890 :: 		mp3_back_icon.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_mp3_back_icon+21)
MOVT	R0, #hi_addr(_mp3_back_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1891 :: 		mp3_back_icon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_mp3_back_icon+24)
MOVT	R0, #hi_addr(_mp3_back_icon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1892 :: 		mp3_back_icon.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_mp3_back_icon+28)
MOVT	R0, #hi_addr(_mp3_back_icon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1893 :: 		mp3_back_icon.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_mp3_back_icon+32)
MOVT	R0, #hi_addr(_mp3_back_icon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1894 :: 		mp3_back_icon.OnPressPtr      = mp3_back_iconOnPress;
MOVW	R1, #lo_addr(_mp3_back_iconOnPress+0)
MOVT	R1, #hi_addr(_mp3_back_iconOnPress+0)
MOVW	R0, #lo_addr(_mp3_back_icon+36)
MOVT	R0, #hi_addr(_mp3_back_icon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1896 :: 		Box19.OwnerScreen     = &MP3_SongList;
MOVW	R1, #lo_addr(_MP3_SongList+0)
MOVT	R1, #hi_addr(_MP3_SongList+0)
MOVW	R0, #lo_addr(_Box19+0)
MOVT	R0, #hi_addr(_Box19+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1897 :: 		Box19.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+4)
MOVT	R0, #hi_addr(_Box19+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1898 :: 		Box19.Left            = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box19+6)
MOVT	R0, #hi_addr(_Box19+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1899 :: 		Box19.Top             = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Box19+8)
MOVT	R0, #hi_addr(_Box19+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1900 :: 		Box19.Width           = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_Box19+10)
MOVT	R0, #hi_addr(_Box19+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1901 :: 		Box19.Height          = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Box19+12)
MOVT	R0, #hi_addr(_Box19+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1902 :: 		Box19.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box19+14)
MOVT	R0, #hi_addr(_Box19+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1903 :: 		Box19.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+16)
MOVT	R0, #hi_addr(_Box19+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1904 :: 		Box19.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+18)
MOVT	R0, #hi_addr(_Box19+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1905 :: 		Box19.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box19+19)
MOVT	R0, #hi_addr(_Box19+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1906 :: 		Box19.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box19+20)
MOVT	R0, #hi_addr(_Box19+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1907 :: 		Box19.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+21)
MOVT	R0, #hi_addr(_Box19+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1908 :: 		Box19.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+22)
MOVT	R0, #hi_addr(_Box19+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1909 :: 		Box19.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box19+24)
MOVT	R0, #hi_addr(_Box19+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1910 :: 		Box19.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box19+26)
MOVT	R0, #hi_addr(_Box19+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1911 :: 		Box19.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box19+28)
MOVT	R0, #hi_addr(_Box19+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1912 :: 		Box19.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+30)
MOVT	R0, #hi_addr(_Box19+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1913 :: 		Box19.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box19+32)
MOVT	R0, #hi_addr(_Box19+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1914 :: 		Box19.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+36)
MOVT	R0, #hi_addr(_Box19+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1915 :: 		Box19.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+40)
MOVT	R0, #hi_addr(_Box19+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1916 :: 		Box19.OnClickPtr      = Image15OnPress;
MOVW	R1, #lo_addr(_Image15OnPress+0)
MOVT	R1, #hi_addr(_Image15OnPress+0)
MOVW	R0, #lo_addr(_Box19+44)
MOVT	R0, #hi_addr(_Box19+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1917 :: 		Box19.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+48)
MOVT	R0, #hi_addr(_Box19+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1919 :: 		Box6.OwnerScreen     = &MP3_SongList;
MOVW	R1, #lo_addr(_MP3_SongList+0)
MOVT	R1, #hi_addr(_MP3_SongList+0)
MOVW	R0, #lo_addr(_Box6+0)
MOVT	R0, #hi_addr(_Box6+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1920 :: 		Box6.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+4)
MOVT	R0, #hi_addr(_Box6+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1921 :: 		Box6.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+6)
MOVT	R0, #hi_addr(_Box6+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1922 :: 		Box6.Top             = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_Box6+8)
MOVT	R0, #hi_addr(_Box6+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1923 :: 		Box6.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Box6+10)
MOVT	R0, #hi_addr(_Box6+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1924 :: 		Box6.Height          = 210;
MOVS	R1, #210
MOVW	R0, #lo_addr(_Box6+12)
MOVT	R0, #hi_addr(_Box6+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1925 :: 		Box6.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+14)
MOVT	R0, #hi_addr(_Box6+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1926 :: 		Box6.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+16)
MOVT	R0, #hi_addr(_Box6+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1927 :: 		Box6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+18)
MOVT	R0, #hi_addr(_Box6+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1928 :: 		Box6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+19)
MOVT	R0, #hi_addr(_Box6+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1929 :: 		Box6.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+20)
MOVT	R0, #hi_addr(_Box6+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1930 :: 		Box6.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+21)
MOVT	R0, #hi_addr(_Box6+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1931 :: 		Box6.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+22)
MOVT	R0, #hi_addr(_Box6+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1932 :: 		Box6.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box6+24)
MOVT	R0, #hi_addr(_Box6+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1933 :: 		Box6.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box6+26)
MOVT	R0, #hi_addr(_Box6+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1934 :: 		Box6.Color           = 0x2B31;
MOVW	R1, #11057
MOVW	R0, #lo_addr(_Box6+28)
MOVT	R0, #hi_addr(_Box6+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1935 :: 		Box6.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+30)
MOVT	R0, #hi_addr(_Box6+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1936 :: 		Box6.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box6+32)
MOVT	R0, #hi_addr(_Box6+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1937 :: 		Box6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+36)
MOVT	R0, #hi_addr(_Box6+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1938 :: 		Box6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+40)
MOVT	R0, #hi_addr(_Box6+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1939 :: 		Box6.OnClickPtr      = Box6OnClick;
MOVW	R1, #lo_addr(_Box6OnClick+0)
MOVT	R1, #hi_addr(_Box6OnClick+0)
MOVW	R0, #lo_addr(_Box6+44)
MOVT	R0, #hi_addr(_Box6+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1940 :: 		Box6.OnPressPtr      = Box6OnPress;
MOVW	R1, #lo_addr(_Box6OnPress+0)
MOVT	R1, #hi_addr(_Box6OnPress+0)
MOVW	R0, #lo_addr(_Box6+48)
MOVT	R0, #hi_addr(_Box6+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1942 :: 		Label24.OwnerScreen     = &MP3_SongList;
MOVW	R1, #lo_addr(_MP3_SongList+0)
MOVT	R1, #hi_addr(_MP3_SongList+0)
MOVW	R0, #lo_addr(_Label24+0)
MOVT	R0, #hi_addr(_Label24+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1943 :: 		Label24.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label24+4)
MOVT	R0, #hi_addr(_Label24+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1944 :: 		Label24.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label24+6)
MOVT	R0, #hi_addr(_Label24+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1945 :: 		Label24.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label24+8)
MOVT	R0, #hi_addr(_Label24+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1946 :: 		Label24.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_Label24+10)
MOVT	R0, #hi_addr(_Label24+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1947 :: 		Label24.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label24+12)
MOVT	R0, #hi_addr(_Label24+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1948 :: 		Label24.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label24+26)
MOVT	R0, #hi_addr(_Label24+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1949 :: 		Label24.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+27)
MOVT	R0, #hi_addr(_Label24+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1950 :: 		Label24.Caption         = Label24_Caption;
MOVW	R1, #lo_addr(_Label24_Caption+0)
MOVT	R1, #hi_addr(_Label24_Caption+0)
MOVW	R0, #lo_addr(_Label24+16)
MOVT	R0, #hi_addr(_Label24+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1951 :: 		Label24.FontName        = Open_Sans_Light21x24_Regular;
MOVW	R0, #lo_addr(_Label24+20)
MOVT	R0, #hi_addr(_Label24+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,1952 :: 		Label24.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label24+24)
MOVT	R0, #hi_addr(_Label24+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1953 :: 		Label24.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+28)
MOVT	R0, #hi_addr(_Label24+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1954 :: 		Label24.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+32)
MOVT	R0, #hi_addr(_Label24+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1955 :: 		Label24.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+36)
MOVT	R0, #hi_addr(_Label24+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1956 :: 		Label24.OnPressPtr      = Label24OnPress;
MOVW	R1, #lo_addr(_Label24OnPress+0)
MOVT	R1, #hi_addr(_Label24OnPress+0)
MOVW	R0, #lo_addr(_Label24+40)
MOVT	R0, #hi_addr(_Label24+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1958 :: 		mp3_back_icon2.OwnerScreen     = &MP3_SongList;
MOVW	R1, #lo_addr(_MP3_SongList+0)
MOVT	R1, #hi_addr(_MP3_SongList+0)
MOVW	R0, #lo_addr(_mp3_back_icon2+0)
MOVT	R0, #hi_addr(_mp3_back_icon2+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1959 :: 		mp3_back_icon2.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_mp3_back_icon2+4)
MOVT	R0, #hi_addr(_mp3_back_icon2+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1960 :: 		mp3_back_icon2.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_mp3_back_icon2+6)
MOVT	R0, #hi_addr(_mp3_back_icon2+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1961 :: 		mp3_back_icon2.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_mp3_back_icon2+8)
MOVT	R0, #hi_addr(_mp3_back_icon2+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1962 :: 		mp3_back_icon2.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_mp3_back_icon2+10)
MOVT	R0, #hi_addr(_mp3_back_icon2+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1963 :: 		mp3_back_icon2.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_mp3_back_icon2+12)
MOVT	R0, #hi_addr(_mp3_back_icon2+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1964 :: 		mp3_back_icon2.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_mp3_back_icon2+22)
MOVT	R0, #hi_addr(_mp3_back_icon2+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1965 :: 		mp3_back_icon2.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_mp3_back_icon2+23)
MOVT	R0, #hi_addr(_mp3_back_icon2+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1966 :: 		mp3_back_icon2.Picture_Name    = icon_back_mp3_bmp;
MOVW	R0, #lo_addr(_mp3_back_icon2+16)
MOVT	R0, #hi_addr(_mp3_back_icon2+16)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,1967 :: 		mp3_back_icon2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_mp3_back_icon2+20)
MOVT	R0, #hi_addr(_mp3_back_icon2+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1968 :: 		mp3_back_icon2.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_mp3_back_icon2+21)
MOVT	R0, #hi_addr(_mp3_back_icon2+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1969 :: 		mp3_back_icon2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_mp3_back_icon2+24)
MOVT	R0, #hi_addr(_mp3_back_icon2+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1970 :: 		mp3_back_icon2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_mp3_back_icon2+28)
MOVT	R0, #hi_addr(_mp3_back_icon2+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1971 :: 		mp3_back_icon2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_mp3_back_icon2+32)
MOVT	R0, #hi_addr(_mp3_back_icon2+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1972 :: 		mp3_back_icon2.OnPressPtr      = Image15OnPress;
MOVW	R1, #lo_addr(_Image15OnPress+0)
MOVT	R1, #hi_addr(_Image15OnPress+0)
MOVW	R0, #lo_addr(_mp3_back_icon2+36)
MOVT	R0, #hi_addr(_mp3_back_icon2+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1974 :: 		Label26.OwnerScreen     = &MP3_SongList;
MOVW	R1, #lo_addr(_MP3_SongList+0)
MOVT	R1, #hi_addr(_MP3_SongList+0)
MOVW	R0, #lo_addr(_Label26+0)
MOVT	R0, #hi_addr(_Label26+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1975 :: 		Label26.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label26+4)
MOVT	R0, #hi_addr(_Label26+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1976 :: 		Label26.Left            = 168;
MOVS	R1, #168
MOVW	R0, #lo_addr(_Label26+6)
MOVT	R0, #hi_addr(_Label26+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1977 :: 		Label26.Top             = 248;
MOVS	R1, #248
MOVW	R0, #lo_addr(_Label26+8)
MOVT	R0, #hi_addr(_Label26+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1978 :: 		Label26.Width           = 163;
MOVS	R1, #163
MOVW	R0, #lo_addr(_Label26+10)
MOVT	R0, #hi_addr(_Label26+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1979 :: 		Label26.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label26+12)
MOVT	R0, #hi_addr(_Label26+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1980 :: 		Label26.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label26+26)
MOVT	R0, #hi_addr(_Label26+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1981 :: 		Label26.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label26+27)
MOVT	R0, #hi_addr(_Label26+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1982 :: 		Label26.Caption         = Label26_Caption;
MOVW	R1, #lo_addr(_Label26_Caption+0)
MOVT	R1, #hi_addr(_Label26_Caption+0)
MOVW	R0, #lo_addr(_Label26+16)
MOVT	R0, #hi_addr(_Label26+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1983 :: 		Label26.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Label26+20)
MOVT	R0, #hi_addr(_Label26+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1984 :: 		Label26.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label26+24)
MOVT	R0, #hi_addr(_Label26+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1985 :: 		Label26.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+28)
MOVT	R0, #hi_addr(_Label26+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1986 :: 		Label26.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+32)
MOVT	R0, #hi_addr(_Label26+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1987 :: 		Label26.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+36)
MOVT	R0, #hi_addr(_Label26+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1988 :: 		Label26.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+40)
MOVT	R0, #hi_addr(_Label26+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1990 :: 		folder_icon.OwnerScreen     = &MP3_SongList;
MOVW	R1, #lo_addr(_MP3_SongList+0)
MOVT	R1, #hi_addr(_MP3_SongList+0)
MOVW	R0, #lo_addr(_folder_icon+0)
MOVT	R0, #hi_addr(_folder_icon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1991 :: 		folder_icon.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_folder_icon+4)
MOVT	R0, #hi_addr(_folder_icon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1992 :: 		folder_icon.Left            = 434;
MOVW	R1, #434
MOVW	R0, #lo_addr(_folder_icon+6)
MOVT	R0, #hi_addr(_folder_icon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1993 :: 		folder_icon.Top             = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_folder_icon+8)
MOVT	R0, #hi_addr(_folder_icon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1994 :: 		folder_icon.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_folder_icon+10)
MOVT	R0, #hi_addr(_folder_icon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1995 :: 		folder_icon.Height          = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_folder_icon+12)
MOVT	R0, #hi_addr(_folder_icon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1996 :: 		folder_icon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_folder_icon+22)
MOVT	R0, #hi_addr(_folder_icon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1997 :: 		folder_icon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_folder_icon+23)
MOVT	R0, #hi_addr(_folder_icon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1998 :: 		folder_icon.Picture_Name    = icon_folder_bmp;
MOVW	R1, #lo_addr(_icon_folder_bmp+0)
MOVT	R1, #hi_addr(_icon_folder_bmp+0)
MOVW	R0, #lo_addr(_folder_icon+16)
MOVT	R0, #hi_addr(_folder_icon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1999 :: 		folder_icon.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_folder_icon+20)
MOVT	R0, #hi_addr(_folder_icon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2000 :: 		folder_icon.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_folder_icon+21)
MOVT	R0, #hi_addr(_folder_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2001 :: 		folder_icon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_folder_icon+24)
MOVT	R0, #hi_addr(_folder_icon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2002 :: 		folder_icon.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_folder_icon+28)
MOVT	R0, #hi_addr(_folder_icon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2003 :: 		folder_icon.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_folder_icon+32)
MOVT	R0, #hi_addr(_folder_icon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2004 :: 		folder_icon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_folder_icon+36)
MOVT	R0, #hi_addr(_folder_icon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2006 :: 		file_icon.OwnerScreen     = &MP3_SongList;
MOVW	R1, #lo_addr(_MP3_SongList+0)
MOVT	R1, #hi_addr(_MP3_SongList+0)
MOVW	R0, #lo_addr(_file_icon+0)
MOVT	R0, #hi_addr(_file_icon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2007 :: 		file_icon.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_file_icon+4)
MOVT	R0, #hi_addr(_file_icon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2008 :: 		file_icon.Left            = 434;
MOVW	R1, #434
MOVW	R0, #lo_addr(_file_icon+6)
MOVT	R0, #hi_addr(_file_icon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2009 :: 		file_icon.Top             = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_file_icon+8)
MOVT	R0, #hi_addr(_file_icon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2010 :: 		file_icon.Width           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_file_icon+10)
MOVT	R0, #hi_addr(_file_icon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2011 :: 		file_icon.Height          = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_file_icon+12)
MOVT	R0, #hi_addr(_file_icon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2012 :: 		file_icon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_file_icon+22)
MOVT	R0, #hi_addr(_file_icon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2013 :: 		file_icon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_file_icon+23)
MOVT	R0, #hi_addr(_file_icon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2014 :: 		file_icon.Picture_Name    = icon_mp3_file_bmp;
MOVW	R1, #lo_addr(_icon_mp3_file_bmp+0)
MOVT	R1, #hi_addr(_icon_mp3_file_bmp+0)
MOVW	R0, #lo_addr(_file_icon+16)
MOVT	R0, #hi_addr(_file_icon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2015 :: 		file_icon.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_file_icon+20)
MOVT	R0, #hi_addr(_file_icon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2016 :: 		file_icon.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_file_icon+21)
MOVT	R0, #hi_addr(_file_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2017 :: 		file_icon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_file_icon+24)
MOVT	R0, #hi_addr(_file_icon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2018 :: 		file_icon.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_file_icon+28)
MOVT	R0, #hi_addr(_file_icon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2019 :: 		file_icon.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_file_icon+32)
MOVT	R0, #hi_addr(_file_icon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2020 :: 		file_icon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_file_icon+36)
MOVT	R0, #hi_addr(_file_icon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2022 :: 		Box17.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_Box17+0)
MOVT	R0, #hi_addr(_Box17+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2023 :: 		Box17.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+4)
MOVT	R0, #hi_addr(_Box17+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2024 :: 		Box17.Left            = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Box17+6)
MOVT	R0, #hi_addr(_Box17+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2025 :: 		Box17.Top             = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Box17+8)
MOVT	R0, #hi_addr(_Box17+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2026 :: 		Box17.Width           = 142;
MOVS	R1, #142
MOVW	R0, #lo_addr(_Box17+10)
MOVT	R0, #hi_addr(_Box17+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2027 :: 		Box17.Height          = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Box17+12)
MOVT	R0, #hi_addr(_Box17+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2028 :: 		Box17.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box17+14)
MOVT	R0, #hi_addr(_Box17+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2029 :: 		Box17.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+16)
MOVT	R0, #hi_addr(_Box17+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2030 :: 		Box17.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+18)
MOVT	R0, #hi_addr(_Box17+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2031 :: 		Box17.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box17+19)
MOVT	R0, #hi_addr(_Box17+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2032 :: 		Box17.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box17+20)
MOVT	R0, #hi_addr(_Box17+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2033 :: 		Box17.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+21)
MOVT	R0, #hi_addr(_Box17+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2034 :: 		Box17.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+22)
MOVT	R0, #hi_addr(_Box17+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2035 :: 		Box17.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box17+24)
MOVT	R0, #hi_addr(_Box17+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2036 :: 		Box17.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box17+26)
MOVT	R0, #hi_addr(_Box17+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2037 :: 		Box17.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box17+28)
MOVT	R0, #hi_addr(_Box17+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2038 :: 		Box17.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+30)
MOVT	R0, #hi_addr(_Box17+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2039 :: 		Box17.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box17+32)
MOVT	R0, #hi_addr(_Box17+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2040 :: 		Box17.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+36)
MOVT	R0, #hi_addr(_Box17+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2041 :: 		Box17.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+40)
MOVT	R0, #hi_addr(_Box17+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2042 :: 		Box17.OnClickPtr      = Icon_back_mp3OnClick;
MOVW	R1, #lo_addr(_Icon_back_mp3OnClick+0)
MOVT	R1, #hi_addr(_Icon_back_mp3OnClick+0)
MOVW	R0, #lo_addr(_Box17+44)
MOVT	R0, #hi_addr(_Box17+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2043 :: 		Box17.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+48)
MOVT	R0, #hi_addr(_Box17+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2045 :: 		Label27.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_Label27+0)
MOVT	R0, #hi_addr(_Label27+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2046 :: 		Label27.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label27+4)
MOVT	R0, #hi_addr(_Label27+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2047 :: 		Label27.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label27+6)
MOVT	R0, #hi_addr(_Label27+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2048 :: 		Label27.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label27+8)
MOVT	R0, #hi_addr(_Label27+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2049 :: 		Label27.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_Label27+10)
MOVT	R0, #hi_addr(_Label27+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2050 :: 		Label27.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label27+12)
MOVT	R0, #hi_addr(_Label27+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2051 :: 		Label27.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label27+26)
MOVT	R0, #hi_addr(_Label27+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2052 :: 		Label27.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+27)
MOVT	R0, #hi_addr(_Label27+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2053 :: 		Label27.Caption         = Label27_Caption;
MOVW	R1, #lo_addr(_Label27_Caption+0)
MOVT	R1, #hi_addr(_Label27_Caption+0)
MOVW	R0, #lo_addr(_Label27+16)
MOVT	R0, #hi_addr(_Label27+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2054 :: 		Label27.FontName        = Open_Sans_Light21x24_Regular;
MOVW	R0, #lo_addr(_Label27+20)
MOVT	R0, #hi_addr(_Label27+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,2055 :: 		Label27.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label27+24)
MOVT	R0, #hi_addr(_Label27+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2056 :: 		Label27.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+28)
MOVT	R0, #hi_addr(_Label27+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2057 :: 		Label27.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+32)
MOVT	R0, #hi_addr(_Label27+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2058 :: 		Label27.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+36)
MOVT	R0, #hi_addr(_Label27+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2059 :: 		Label27.OnPressPtr      = Icon_back_mp3OnClick;
MOVW	R1, #lo_addr(_Icon_back_mp3OnClick+0)
MOVT	R1, #hi_addr(_Icon_back_mp3OnClick+0)
MOVW	R0, #lo_addr(_Label27+40)
MOVT	R0, #hi_addr(_Label27+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2061 :: 		Icon_back_mp3.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_Icon_back_mp3+0)
MOVT	R0, #hi_addr(_Icon_back_mp3+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2062 :: 		Icon_back_mp3.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Icon_back_mp3+4)
MOVT	R0, #hi_addr(_Icon_back_mp3+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2063 :: 		Icon_back_mp3.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Icon_back_mp3+6)
MOVT	R0, #hi_addr(_Icon_back_mp3+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2064 :: 		Icon_back_mp3.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Icon_back_mp3+8)
MOVT	R0, #hi_addr(_Icon_back_mp3+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2065 :: 		Icon_back_mp3.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Icon_back_mp3+10)
MOVT	R0, #hi_addr(_Icon_back_mp3+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2066 :: 		Icon_back_mp3.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Icon_back_mp3+12)
MOVT	R0, #hi_addr(_Icon_back_mp3+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2067 :: 		Icon_back_mp3.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_back_mp3+22)
MOVT	R0, #hi_addr(_Icon_back_mp3+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2068 :: 		Icon_back_mp3.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Icon_back_mp3+23)
MOVT	R0, #hi_addr(_Icon_back_mp3+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2069 :: 		Icon_back_mp3.Picture_Name    = icon_back_mp3_bmp_1;
MOVW	R1, #lo_addr(_icon_back_mp3_bmp_1+0)
MOVT	R1, #hi_addr(_icon_back_mp3_bmp_1+0)
MOVW	R0, #lo_addr(_Icon_back_mp3+16)
MOVT	R0, #hi_addr(_Icon_back_mp3+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2070 :: 		Icon_back_mp3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Icon_back_mp3+20)
MOVT	R0, #hi_addr(_Icon_back_mp3+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2071 :: 		Icon_back_mp3.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_back_mp3+21)
MOVT	R0, #hi_addr(_Icon_back_mp3+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2072 :: 		Icon_back_mp3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_back_mp3+24)
MOVT	R0, #hi_addr(_Icon_back_mp3+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2073 :: 		Icon_back_mp3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_back_mp3+28)
MOVT	R0, #hi_addr(_Icon_back_mp3+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2074 :: 		Icon_back_mp3.OnClickPtr      = Icon_back_mp3OnClick;
MOVW	R1, #lo_addr(_Icon_back_mp3OnClick+0)
MOVT	R1, #hi_addr(_Icon_back_mp3OnClick+0)
MOVW	R0, #lo_addr(_Icon_back_mp3+32)
MOVT	R0, #hi_addr(_Icon_back_mp3+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2075 :: 		Icon_back_mp3.OnPressPtr      = Icon_back_mp3OnClick;
MOVW	R1, #lo_addr(_Icon_back_mp3OnClick+0)
MOVT	R1, #hi_addr(_Icon_back_mp3OnClick+0)
MOVW	R0, #lo_addr(_Icon_back_mp3+36)
MOVT	R0, #hi_addr(_Icon_back_mp3+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2077 :: 		VolmeBar.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_VolmeBar+0)
MOVT	R0, #hi_addr(_VolmeBar+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2078 :: 		VolmeBar.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_VolmeBar+4)
MOVT	R0, #hi_addr(_VolmeBar+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2079 :: 		VolmeBar.Left            = 399;
MOVW	R1, #399
MOVW	R0, #lo_addr(_VolmeBar+6)
MOVT	R0, #hi_addr(_VolmeBar+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2080 :: 		VolmeBar.Top             = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_VolmeBar+8)
MOVT	R0, #hi_addr(_VolmeBar+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2081 :: 		VolmeBar.Width           = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_VolmeBar+10)
MOVT	R0, #hi_addr(_VolmeBar+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2082 :: 		VolmeBar.Height          = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_VolmeBar+12)
MOVT	R0, #hi_addr(_VolmeBar+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2083 :: 		VolmeBar.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_VolmeBar+14)
MOVT	R0, #hi_addr(_VolmeBar+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2084 :: 		VolmeBar.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_VolmeBar+16)
MOVT	R0, #hi_addr(_VolmeBar+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2085 :: 		VolmeBar.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_VolmeBar+18)
MOVT	R0, #hi_addr(_VolmeBar+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2086 :: 		VolmeBar.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_VolmeBar+19)
MOVT	R0, #hi_addr(_VolmeBar+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2087 :: 		VolmeBar.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_VolmeBar+20)
MOVT	R0, #hi_addr(_VolmeBar+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2088 :: 		VolmeBar.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_VolmeBar+21)
MOVT	R0, #hi_addr(_VolmeBar+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2089 :: 		VolmeBar.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_VolmeBar+22)
MOVT	R0, #hi_addr(_VolmeBar+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2090 :: 		VolmeBar.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_VolmeBar+24)
MOVT	R0, #hi_addr(_VolmeBar+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2091 :: 		VolmeBar.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_VolmeBar+26)
MOVT	R0, #hi_addr(_VolmeBar+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2092 :: 		VolmeBar.Color           = 0x2B31;
MOVW	R1, #11057
MOVW	R0, #lo_addr(_VolmeBar+28)
MOVT	R0, #hi_addr(_VolmeBar+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2093 :: 		VolmeBar.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_VolmeBar+30)
MOVT	R0, #hi_addr(_VolmeBar+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2094 :: 		VolmeBar.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_VolmeBar+32)
MOVT	R0, #hi_addr(_VolmeBar+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2095 :: 		VolmeBar.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_VolmeBar+36)
MOVT	R0, #hi_addr(_VolmeBar+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2096 :: 		VolmeBar.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_VolmeBar+40)
MOVT	R0, #hi_addr(_VolmeBar+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2097 :: 		VolmeBar.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_VolmeBar+44)
MOVT	R0, #hi_addr(_VolmeBar+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2098 :: 		VolmeBar.OnPressPtr      = VolmeBarOnPress;
MOVW	R1, #lo_addr(_VolmeBarOnPress+0)
MOVT	R1, #hi_addr(_VolmeBarOnPress+0)
MOVW	R0, #lo_addr(_VolmeBar+48)
MOVT	R0, #hi_addr(_VolmeBar+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2100 :: 		Image15.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_Image15+0)
MOVT	R0, #hi_addr(_Image15+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2101 :: 		Image15.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Image15+4)
MOVT	R0, #hi_addr(_Image15+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2102 :: 		Image15.Left            = 374;
MOVW	R1, #374
MOVW	R0, #lo_addr(_Image15+6)
MOVT	R0, #hi_addr(_Image15+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2103 :: 		Image15.Top             = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Image15+8)
MOVT	R0, #hi_addr(_Image15+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2104 :: 		Image15.Width           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Image15+10)
MOVT	R0, #hi_addr(_Image15+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2105 :: 		Image15.Height          = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Image15+12)
MOVT	R0, #hi_addr(_Image15+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2106 :: 		Image15.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+22)
MOVT	R0, #hi_addr(_Image15+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2107 :: 		Image15.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image15+23)
MOVT	R0, #hi_addr(_Image15+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2108 :: 		Image15.Picture_Name    = icon_volume_BMP;
MOVW	R1, #lo_addr(_icon_volume_BMP+0)
MOVT	R1, #hi_addr(_icon_volume_BMP+0)
MOVW	R0, #lo_addr(_Image15+16)
MOVT	R0, #hi_addr(_Image15+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2109 :: 		Image15.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image15+20)
MOVT	R0, #hi_addr(_Image15+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2110 :: 		Image15.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image15+21)
MOVT	R0, #hi_addr(_Image15+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2111 :: 		Image15.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+24)
MOVT	R0, #hi_addr(_Image15+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2112 :: 		Image15.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+28)
MOVT	R0, #hi_addr(_Image15+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2113 :: 		Image15.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+32)
MOVT	R0, #hi_addr(_Image15+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2114 :: 		Image15.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+36)
MOVT	R0, #hi_addr(_Image15+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2116 :: 		ProgressBar.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_ProgressBar+0)
MOVT	R0, #hi_addr(_ProgressBar+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2117 :: 		ProgressBar.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_ProgressBar+4)
MOVT	R0, #hi_addr(_ProgressBar+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2118 :: 		ProgressBar.Left            = 180;
MOVS	R1, #180
MOVW	R0, #lo_addr(_ProgressBar+6)
MOVT	R0, #hi_addr(_ProgressBar+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2119 :: 		ProgressBar.Top             = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_ProgressBar+8)
MOVT	R0, #hi_addr(_ProgressBar+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2120 :: 		ProgressBar.Width           = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_ProgressBar+10)
MOVT	R0, #hi_addr(_ProgressBar+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2121 :: 		ProgressBar.Height          = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_ProgressBar+12)
MOVT	R0, #hi_addr(_ProgressBar+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2122 :: 		ProgressBar.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar+14)
MOVT	R0, #hi_addr(_ProgressBar+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2123 :: 		ProgressBar.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar+16)
MOVT	R0, #hi_addr(_ProgressBar+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2124 :: 		ProgressBar.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar+18)
MOVT	R0, #hi_addr(_ProgressBar+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2125 :: 		ProgressBar.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar+19)
MOVT	R0, #hi_addr(_ProgressBar+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2126 :: 		ProgressBar.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar+20)
MOVT	R0, #hi_addr(_ProgressBar+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2127 :: 		ProgressBar.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar+21)
MOVT	R0, #hi_addr(_ProgressBar+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2128 :: 		ProgressBar.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar+22)
MOVT	R0, #hi_addr(_ProgressBar+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2129 :: 		ProgressBar.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ProgressBar+24)
MOVT	R0, #hi_addr(_ProgressBar+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2130 :: 		ProgressBar.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ProgressBar+26)
MOVT	R0, #hi_addr(_ProgressBar+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2131 :: 		ProgressBar.Color           = 0x2B31;
MOVW	R1, #11057
MOVW	R0, #lo_addr(_ProgressBar+28)
MOVT	R0, #hi_addr(_ProgressBar+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2132 :: 		ProgressBar.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar+30)
MOVT	R0, #hi_addr(_ProgressBar+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2133 :: 		ProgressBar.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ProgressBar+32)
MOVT	R0, #hi_addr(_ProgressBar+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2134 :: 		ProgressBar.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar+36)
MOVT	R0, #hi_addr(_ProgressBar+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2135 :: 		ProgressBar.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar+40)
MOVT	R0, #hi_addr(_ProgressBar+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2136 :: 		ProgressBar.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar+44)
MOVT	R0, #hi_addr(_ProgressBar+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2137 :: 		ProgressBar.OnPressPtr      = ProgreesBarOnPress;
MOVW	R1, #lo_addr(_ProgreesBarOnPress+0)
MOVT	R1, #hi_addr(_ProgreesBarOnPress+0)
MOVW	R0, #lo_addr(_ProgressBar+48)
MOVT	R0, #hi_addr(_ProgressBar+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2139 :: 		Label28.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_Label28+0)
MOVT	R0, #hi_addr(_Label28+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2140 :: 		Label28.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label28+4)
MOVT	R0, #hi_addr(_Label28+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2141 :: 		Label28.Left            = 209;
MOVS	R1, #209
MOVW	R0, #lo_addr(_Label28+6)
MOVT	R0, #hi_addr(_Label28+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2142 :: 		Label28.Top             = 171;
MOVS	R1, #171
MOVW	R0, #lo_addr(_Label28+8)
MOVT	R0, #hi_addr(_Label28+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2143 :: 		Label28.Width           = 73;
MOVS	R1, #73
MOVW	R0, #lo_addr(_Label28+10)
MOVT	R0, #hi_addr(_Label28+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2144 :: 		Label28.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label28+12)
MOVT	R0, #hi_addr(_Label28+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2145 :: 		Label28.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label28+26)
MOVT	R0, #hi_addr(_Label28+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2146 :: 		Label28.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label28+27)
MOVT	R0, #hi_addr(_Label28+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2147 :: 		Label28.Caption         = Label28_Caption;
MOVW	R1, #lo_addr(_Label28_Caption+0)
MOVT	R1, #hi_addr(_Label28_Caption+0)
MOVW	R0, #lo_addr(_Label28+16)
MOVT	R0, #hi_addr(_Label28+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2148 :: 		Label28.FontName        = Open_Sans_Light21x24_Regular;
MOVW	R0, #lo_addr(_Label28+20)
MOVT	R0, #hi_addr(_Label28+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,2149 :: 		Label28.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label28+24)
MOVT	R0, #hi_addr(_Label28+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2150 :: 		Label28.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+28)
MOVT	R0, #hi_addr(_Label28+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2151 :: 		Label28.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+32)
MOVT	R0, #hi_addr(_Label28+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2152 :: 		Label28.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+36)
MOVT	R0, #hi_addr(_Label28+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2153 :: 		Label28.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+40)
MOVT	R0, #hi_addr(_Label28+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2155 :: 		previous_icon.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_previous_icon+0)
MOVT	R0, #hi_addr(_previous_icon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2156 :: 		previous_icon.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_previous_icon+4)
MOVT	R0, #hi_addr(_previous_icon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2157 :: 		previous_icon.Left            = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_previous_icon+6)
MOVT	R0, #hi_addr(_previous_icon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2158 :: 		previous_icon.Top             = 224;
MOVS	R1, #224
MOVW	R0, #lo_addr(_previous_icon+8)
MOVT	R0, #hi_addr(_previous_icon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2159 :: 		previous_icon.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_previous_icon+10)
MOVT	R0, #hi_addr(_previous_icon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2160 :: 		previous_icon.Height          = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_previous_icon+12)
MOVT	R0, #hi_addr(_previous_icon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2161 :: 		previous_icon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_previous_icon+22)
MOVT	R0, #hi_addr(_previous_icon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2162 :: 		previous_icon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_previous_icon+23)
MOVT	R0, #hi_addr(_previous_icon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2163 :: 		previous_icon.Picture_Name    = icon_prev_bmp;
MOVW	R1, #lo_addr(_icon_prev_bmp+0)
MOVT	R1, #hi_addr(_icon_prev_bmp+0)
MOVW	R0, #lo_addr(_previous_icon+16)
MOVT	R0, #hi_addr(_previous_icon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2164 :: 		previous_icon.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_previous_icon+20)
MOVT	R0, #hi_addr(_previous_icon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2165 :: 		previous_icon.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_previous_icon+21)
MOVT	R0, #hi_addr(_previous_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2166 :: 		previous_icon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_previous_icon+24)
MOVT	R0, #hi_addr(_previous_icon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2167 :: 		previous_icon.OnDownPtr       = previous_iconOnDown;
MOVW	R1, #lo_addr(_previous_iconOnDown+0)
MOVT	R1, #hi_addr(_previous_iconOnDown+0)
MOVW	R0, #lo_addr(_previous_icon+28)
MOVT	R0, #hi_addr(_previous_icon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2168 :: 		previous_icon.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_previous_icon+32)
MOVT	R0, #hi_addr(_previous_icon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2169 :: 		previous_icon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_previous_icon+36)
MOVT	R0, #hi_addr(_previous_icon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2171 :: 		pause_icon.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_pause_icon+0)
MOVT	R0, #hi_addr(_pause_icon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2172 :: 		pause_icon.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_pause_icon+4)
MOVT	R0, #hi_addr(_pause_icon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2173 :: 		pause_icon.Left            = 103;
MOVS	R1, #103
MOVW	R0, #lo_addr(_pause_icon+6)
MOVT	R0, #hi_addr(_pause_icon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2174 :: 		pause_icon.Top             = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_pause_icon+8)
MOVT	R0, #hi_addr(_pause_icon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2175 :: 		pause_icon.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_pause_icon+10)
MOVT	R0, #hi_addr(_pause_icon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2176 :: 		pause_icon.Height          = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_pause_icon+12)
MOVT	R0, #hi_addr(_pause_icon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2177 :: 		pause_icon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_pause_icon+22)
MOVT	R0, #hi_addr(_pause_icon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2178 :: 		pause_icon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pause_icon+23)
MOVT	R0, #hi_addr(_pause_icon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2179 :: 		pause_icon.Picture_Name    = icon_pause_bmp;
MOVW	R1, #lo_addr(_icon_pause_bmp+0)
MOVT	R1, #hi_addr(_icon_pause_bmp+0)
MOVW	R0, #lo_addr(_pause_icon+16)
MOVT	R0, #hi_addr(_pause_icon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2180 :: 		pause_icon.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pause_icon+20)
MOVT	R0, #hi_addr(_pause_icon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2181 :: 		pause_icon.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pause_icon+21)
MOVT	R0, #hi_addr(_pause_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2182 :: 		pause_icon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_pause_icon+24)
MOVT	R0, #hi_addr(_pause_icon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2183 :: 		pause_icon.OnDownPtr       = pause_iconOnPress;
MOVW	R1, #lo_addr(_pause_iconOnPress+0)
MOVT	R1, #hi_addr(_pause_iconOnPress+0)
MOVW	R0, #lo_addr(_pause_icon+28)
MOVT	R0, #hi_addr(_pause_icon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2184 :: 		pause_icon.OnClickPtr      = pause_iconOnPress;
MOVW	R1, #lo_addr(_pause_iconOnPress+0)
MOVT	R1, #hi_addr(_pause_iconOnPress+0)
MOVW	R0, #lo_addr(_pause_icon+32)
MOVT	R0, #hi_addr(_pause_icon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2185 :: 		pause_icon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_pause_icon+36)
MOVT	R0, #hi_addr(_pause_icon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2187 :: 		Play_icon.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_Play_icon+0)
MOVT	R0, #hi_addr(_Play_icon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2188 :: 		Play_icon.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Play_icon+4)
MOVT	R0, #hi_addr(_Play_icon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2189 :: 		Play_icon.Left            = 102;
MOVS	R1, #102
MOVW	R0, #lo_addr(_Play_icon+6)
MOVT	R0, #hi_addr(_Play_icon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2190 :: 		Play_icon.Top             = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Play_icon+8)
MOVT	R0, #hi_addr(_Play_icon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2191 :: 		Play_icon.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Play_icon+10)
MOVT	R0, #hi_addr(_Play_icon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2192 :: 		Play_icon.Height          = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Play_icon+12)
MOVT	R0, #hi_addr(_Play_icon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2193 :: 		Play_icon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Play_icon+22)
MOVT	R0, #hi_addr(_Play_icon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2194 :: 		Play_icon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Play_icon+23)
MOVT	R0, #hi_addr(_Play_icon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2195 :: 		Play_icon.Picture_Name    = icon_play_bmp;
MOVW	R1, #lo_addr(_icon_play_bmp+0)
MOVT	R1, #hi_addr(_icon_play_bmp+0)
MOVW	R0, #lo_addr(_Play_icon+16)
MOVT	R0, #hi_addr(_Play_icon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2196 :: 		Play_icon.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Play_icon+20)
MOVT	R0, #hi_addr(_Play_icon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2197 :: 		Play_icon.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Play_icon+21)
MOVT	R0, #hi_addr(_Play_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2198 :: 		Play_icon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Play_icon+24)
MOVT	R0, #hi_addr(_Play_icon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2199 :: 		Play_icon.OnDownPtr       = Play_iconOnDown;
MOVW	R1, #lo_addr(_Play_iconOnDown+0)
MOVT	R1, #hi_addr(_Play_iconOnDown+0)
MOVW	R0, #lo_addr(_Play_icon+28)
MOVT	R0, #hi_addr(_Play_icon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2200 :: 		Play_icon.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Play_icon+32)
MOVT	R0, #hi_addr(_Play_icon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2201 :: 		Play_icon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Play_icon+36)
MOVT	R0, #hi_addr(_Play_icon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2203 :: 		stop_icon.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_stop_icon+0)
MOVT	R0, #hi_addr(_stop_icon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2204 :: 		stop_icon.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_stop_icon+4)
MOVT	R0, #hi_addr(_stop_icon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2205 :: 		stop_icon.Left            = 131;
MOVS	R1, #131
MOVW	R0, #lo_addr(_stop_icon+6)
MOVT	R0, #hi_addr(_stop_icon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2206 :: 		stop_icon.Top             = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_stop_icon+8)
MOVT	R0, #hi_addr(_stop_icon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2207 :: 		stop_icon.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_stop_icon+10)
MOVT	R0, #hi_addr(_stop_icon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2208 :: 		stop_icon.Height          = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_stop_icon+12)
MOVT	R0, #hi_addr(_stop_icon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2209 :: 		stop_icon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_stop_icon+22)
MOVT	R0, #hi_addr(_stop_icon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2210 :: 		stop_icon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_stop_icon+23)
MOVT	R0, #hi_addr(_stop_icon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2211 :: 		stop_icon.Picture_Name    = icon_stop_bmp;
MOVW	R1, #lo_addr(_icon_stop_bmp+0)
MOVT	R1, #hi_addr(_icon_stop_bmp+0)
MOVW	R0, #lo_addr(_stop_icon+16)
MOVT	R0, #hi_addr(_stop_icon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2212 :: 		stop_icon.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_stop_icon+20)
MOVT	R0, #hi_addr(_stop_icon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2213 :: 		stop_icon.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_stop_icon+21)
MOVT	R0, #hi_addr(_stop_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2214 :: 		stop_icon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_stop_icon+24)
MOVT	R0, #hi_addr(_stop_icon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2215 :: 		stop_icon.OnDownPtr       = stop_iconOnDown;
MOVW	R1, #lo_addr(_stop_iconOnDown+0)
MOVT	R1, #hi_addr(_stop_iconOnDown+0)
MOVW	R0, #lo_addr(_stop_icon+28)
MOVT	R0, #hi_addr(_stop_icon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2216 :: 		stop_icon.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_stop_icon+32)
MOVT	R0, #hi_addr(_stop_icon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2217 :: 		stop_icon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_stop_icon+36)
MOVT	R0, #hi_addr(_stop_icon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2219 :: 		next_icon.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_next_icon+0)
MOVT	R0, #hi_addr(_next_icon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2220 :: 		next_icon.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_next_icon+4)
MOVT	R0, #hi_addr(_next_icon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2221 :: 		next_icon.Left            = 158;
MOVS	R1, #158
MOVW	R0, #lo_addr(_next_icon+6)
MOVT	R0, #hi_addr(_next_icon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2222 :: 		next_icon.Top             = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_next_icon+8)
MOVT	R0, #hi_addr(_next_icon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2223 :: 		next_icon.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_next_icon+10)
MOVT	R0, #hi_addr(_next_icon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2224 :: 		next_icon.Height          = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_next_icon+12)
MOVT	R0, #hi_addr(_next_icon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2225 :: 		next_icon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_next_icon+22)
MOVT	R0, #hi_addr(_next_icon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2226 :: 		next_icon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_next_icon+23)
MOVT	R0, #hi_addr(_next_icon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2227 :: 		next_icon.Picture_Name    = icon_next_bmp;
MOVW	R1, #lo_addr(_icon_next_bmp+0)
MOVT	R1, #hi_addr(_icon_next_bmp+0)
MOVW	R0, #lo_addr(_next_icon+16)
MOVT	R0, #hi_addr(_next_icon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2228 :: 		next_icon.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_next_icon+20)
MOVT	R0, #hi_addr(_next_icon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2229 :: 		next_icon.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_next_icon+21)
MOVT	R0, #hi_addr(_next_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2230 :: 		next_icon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_next_icon+24)
MOVT	R0, #hi_addr(_next_icon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2231 :: 		next_icon.OnDownPtr       = next_iconOnDown;
MOVW	R1, #lo_addr(_next_iconOnDown+0)
MOVT	R1, #hi_addr(_next_iconOnDown+0)
MOVW	R0, #lo_addr(_next_icon+28)
MOVT	R0, #hi_addr(_next_icon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2232 :: 		next_icon.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_next_icon+32)
MOVT	R0, #hi_addr(_next_icon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2233 :: 		next_icon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_next_icon+36)
MOVT	R0, #hi_addr(_next_icon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2235 :: 		songlist_icon.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_songlist_icon+0)
MOVT	R0, #hi_addr(_songlist_icon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2236 :: 		songlist_icon.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_songlist_icon+4)
MOVT	R0, #hi_addr(_songlist_icon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2237 :: 		songlist_icon.Left            = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_songlist_icon+6)
MOVT	R0, #hi_addr(_songlist_icon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2238 :: 		songlist_icon.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_songlist_icon+8)
MOVT	R0, #hi_addr(_songlist_icon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2239 :: 		songlist_icon.Width           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_songlist_icon+10)
MOVT	R0, #hi_addr(_songlist_icon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2240 :: 		songlist_icon.Height          = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_songlist_icon+12)
MOVT	R0, #hi_addr(_songlist_icon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2241 :: 		songlist_icon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_songlist_icon+22)
MOVT	R0, #hi_addr(_songlist_icon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2242 :: 		songlist_icon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_songlist_icon+23)
MOVT	R0, #hi_addr(_songlist_icon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2243 :: 		songlist_icon.Picture_Name    = icon_playlist_bmp;
MOVW	R1, #lo_addr(_icon_playlist_bmp+0)
MOVT	R1, #hi_addr(_icon_playlist_bmp+0)
MOVW	R0, #lo_addr(_songlist_icon+16)
MOVT	R0, #hi_addr(_songlist_icon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2244 :: 		songlist_icon.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_songlist_icon+20)
MOVT	R0, #hi_addr(_songlist_icon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2245 :: 		songlist_icon.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_songlist_icon+21)
MOVT	R0, #hi_addr(_songlist_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2246 :: 		songlist_icon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_songlist_icon+24)
MOVT	R0, #hi_addr(_songlist_icon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2247 :: 		songlist_icon.OnDownPtr       = songlist_iconOnPress;
MOVW	R1, #lo_addr(_songlist_iconOnPress+0)
MOVT	R1, #hi_addr(_songlist_iconOnPress+0)
MOVW	R0, #lo_addr(_songlist_icon+28)
MOVT	R0, #hi_addr(_songlist_icon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2248 :: 		songlist_icon.OnClickPtr      = songlist_iconOnPress;
MOVW	R1, #lo_addr(_songlist_iconOnPress+0)
MOVT	R1, #hi_addr(_songlist_iconOnPress+0)
MOVW	R0, #lo_addr(_songlist_icon+32)
MOVT	R0, #hi_addr(_songlist_icon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2249 :: 		songlist_icon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_songlist_icon+36)
MOVT	R0, #hi_addr(_songlist_icon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2251 :: 		Label6.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_Label6+0)
MOVT	R0, #hi_addr(_Label6+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2252 :: 		Label6.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label6+4)
MOVT	R0, #hi_addr(_Label6+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2253 :: 		Label6.Left            = 432;
MOVW	R1, #432
MOVW	R0, #lo_addr(_Label6+6)
MOVT	R0, #hi_addr(_Label6+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2254 :: 		Label6.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_Label6+8)
MOVT	R0, #hi_addr(_Label6+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2255 :: 		Label6.Width           = 34;
MOVS	R1, #34
MOVW	R0, #lo_addr(_Label6+10)
MOVT	R0, #hi_addr(_Label6+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2256 :: 		Label6.Height          = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Label6+12)
MOVT	R0, #hi_addr(_Label6+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2257 :: 		Label6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+26)
MOVT	R0, #hi_addr(_Label6+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2258 :: 		Label6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+27)
MOVT	R0, #hi_addr(_Label6+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2259 :: 		Label6.Caption         = Label6_Caption;
MOVW	R1, #lo_addr(_Label6_Caption+0)
MOVT	R1, #hi_addr(_Label6_Caption+0)
MOVW	R0, #lo_addr(_Label6+16)
MOVT	R0, #hi_addr(_Label6+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2260 :: 		Label6.FontName        = Open_Sans_Light13x16_Regular;
MOVW	R0, #lo_addr(_Label6+20)
MOVT	R0, #hi_addr(_Label6+20)
STR	R3, [R0, #0]
;mikromedia_STM32plus_driver.c,2261 :: 		Label6.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label6+24)
MOVT	R0, #hi_addr(_Label6+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2262 :: 		Label6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+28)
MOVT	R0, #hi_addr(_Label6+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2263 :: 		Label6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+32)
MOVT	R0, #hi_addr(_Label6+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2264 :: 		Label6.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+36)
MOVT	R0, #hi_addr(_Label6+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2265 :: 		Label6.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+40)
MOVT	R0, #hi_addr(_Label6+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2267 :: 		Box7.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_Box7+0)
MOVT	R0, #hi_addr(_Box7+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2268 :: 		Box7.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+4)
MOVT	R0, #hi_addr(_Box7+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2269 :: 		Box7.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+6)
MOVT	R0, #hi_addr(_Box7+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2270 :: 		Box7.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+8)
MOVT	R0, #hi_addr(_Box7+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2271 :: 		Box7.Width           = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_Box7+10)
MOVT	R0, #hi_addr(_Box7+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2272 :: 		Box7.Height          = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_Box7+12)
MOVT	R0, #hi_addr(_Box7+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2273 :: 		Box7.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box7+14)
MOVT	R0, #hi_addr(_Box7+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2274 :: 		Box7.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+16)
MOVT	R0, #hi_addr(_Box7+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2275 :: 		Box7.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+18)
MOVT	R0, #hi_addr(_Box7+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2276 :: 		Box7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box7+19)
MOVT	R0, #hi_addr(_Box7+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2277 :: 		Box7.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box7+20)
MOVT	R0, #hi_addr(_Box7+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2278 :: 		Box7.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+21)
MOVT	R0, #hi_addr(_Box7+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2279 :: 		Box7.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+22)
MOVT	R0, #hi_addr(_Box7+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2280 :: 		Box7.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box7+24)
MOVT	R0, #hi_addr(_Box7+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2281 :: 		Box7.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box7+26)
MOVT	R0, #hi_addr(_Box7+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2282 :: 		Box7.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box7+28)
MOVT	R0, #hi_addr(_Box7+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2283 :: 		Box7.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+30)
MOVT	R0, #hi_addr(_Box7+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2284 :: 		Box7.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box7+32)
MOVT	R0, #hi_addr(_Box7+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2285 :: 		Box7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+36)
MOVT	R0, #hi_addr(_Box7+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2286 :: 		Box7.OnDownPtr       = Box7OnDown;
MOVW	R1, #lo_addr(_Box7OnDown+0)
MOVT	R1, #hi_addr(_Box7OnDown+0)
MOVW	R0, #lo_addr(_Box7+40)
MOVT	R0, #hi_addr(_Box7+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2287 :: 		Box7.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+44)
MOVT	R0, #hi_addr(_Box7+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2288 :: 		Box7.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+48)
MOVT	R0, #hi_addr(_Box7+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2290 :: 		icon_previous_box.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_icon_previous_box+0)
MOVT	R0, #hi_addr(_icon_previous_box+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2291 :: 		icon_previous_box.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_icon_previous_box+4)
MOVT	R0, #hi_addr(_icon_previous_box+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2292 :: 		icon_previous_box.Left            = 244;
MOVS	R1, #244
MOVW	R0, #lo_addr(_icon_previous_box+6)
MOVT	R0, #hi_addr(_icon_previous_box+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2293 :: 		icon_previous_box.Top             = 244;
MOVS	R1, #244
MOVW	R0, #lo_addr(_icon_previous_box+8)
MOVT	R0, #hi_addr(_icon_previous_box+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2294 :: 		icon_previous_box.Width           = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_icon_previous_box+10)
MOVT	R0, #hi_addr(_icon_previous_box+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2295 :: 		icon_previous_box.Height          = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_icon_previous_box+12)
MOVT	R0, #hi_addr(_icon_previous_box+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2296 :: 		icon_previous_box.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_icon_previous_box+14)
MOVT	R0, #hi_addr(_icon_previous_box+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2297 :: 		icon_previous_box.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous_box+16)
MOVT	R0, #hi_addr(_icon_previous_box+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2298 :: 		icon_previous_box.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous_box+18)
MOVT	R0, #hi_addr(_icon_previous_box+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2299 :: 		icon_previous_box.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_icon_previous_box+19)
MOVT	R0, #hi_addr(_icon_previous_box+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2300 :: 		icon_previous_box.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_icon_previous_box+20)
MOVT	R0, #hi_addr(_icon_previous_box+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2301 :: 		icon_previous_box.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous_box+21)
MOVT	R0, #hi_addr(_icon_previous_box+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2302 :: 		icon_previous_box.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous_box+22)
MOVT	R0, #hi_addr(_icon_previous_box+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2303 :: 		icon_previous_box.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_icon_previous_box+24)
MOVT	R0, #hi_addr(_icon_previous_box+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2304 :: 		icon_previous_box.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_icon_previous_box+26)
MOVT	R0, #hi_addr(_icon_previous_box+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2305 :: 		icon_previous_box.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_icon_previous_box+28)
MOVT	R0, #hi_addr(_icon_previous_box+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2306 :: 		icon_previous_box.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous_box+30)
MOVT	R0, #hi_addr(_icon_previous_box+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2307 :: 		icon_previous_box.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_icon_previous_box+32)
MOVT	R0, #hi_addr(_icon_previous_box+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2308 :: 		icon_previous_box.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous_box+36)
MOVT	R0, #hi_addr(_icon_previous_box+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2309 :: 		icon_previous_box.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous_box+40)
MOVT	R0, #hi_addr(_icon_previous_box+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2310 :: 		icon_previous_box.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous_box+44)
MOVT	R0, #hi_addr(_icon_previous_box+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2311 :: 		icon_previous_box.OnPressPtr      = icon_previous_boxOnPress;
MOVW	R1, #lo_addr(_icon_previous_boxOnPress+0)
MOVT	R1, #hi_addr(_icon_previous_boxOnPress+0)
MOVW	R0, #lo_addr(_icon_previous_box+48)
MOVT	R0, #hi_addr(_icon_previous_box+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2313 :: 		Icon_next_box.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_Icon_next_box+0)
MOVT	R0, #hi_addr(_Icon_next_box+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2314 :: 		Icon_next_box.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Icon_next_box+4)
MOVT	R0, #hi_addr(_Icon_next_box+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2315 :: 		Icon_next_box.Left            = 206;
MOVS	R1, #206
MOVW	R0, #lo_addr(_Icon_next_box+6)
MOVT	R0, #hi_addr(_Icon_next_box+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2316 :: 		Icon_next_box.Top             = 244;
MOVS	R1, #244
MOVW	R0, #lo_addr(_Icon_next_box+8)
MOVT	R0, #hi_addr(_Icon_next_box+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2317 :: 		Icon_next_box.Width           = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_Icon_next_box+10)
MOVT	R0, #hi_addr(_Icon_next_box+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2318 :: 		Icon_next_box.Height          = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Icon_next_box+12)
MOVT	R0, #hi_addr(_Icon_next_box+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2319 :: 		Icon_next_box.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Icon_next_box+14)
MOVT	R0, #hi_addr(_Icon_next_box+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2320 :: 		Icon_next_box.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next_box+16)
MOVT	R0, #hi_addr(_Icon_next_box+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2321 :: 		Icon_next_box.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next_box+18)
MOVT	R0, #hi_addr(_Icon_next_box+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2322 :: 		Icon_next_box.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Icon_next_box+19)
MOVT	R0, #hi_addr(_Icon_next_box+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2323 :: 		Icon_next_box.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Icon_next_box+20)
MOVT	R0, #hi_addr(_Icon_next_box+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2324 :: 		Icon_next_box.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next_box+21)
MOVT	R0, #hi_addr(_Icon_next_box+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2325 :: 		Icon_next_box.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next_box+22)
MOVT	R0, #hi_addr(_Icon_next_box+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2326 :: 		Icon_next_box.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Icon_next_box+24)
MOVT	R0, #hi_addr(_Icon_next_box+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2327 :: 		Icon_next_box.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Icon_next_box+26)
MOVT	R0, #hi_addr(_Icon_next_box+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2328 :: 		Icon_next_box.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Icon_next_box+28)
MOVT	R0, #hi_addr(_Icon_next_box+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2329 :: 		Icon_next_box.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next_box+30)
MOVT	R0, #hi_addr(_Icon_next_box+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2330 :: 		Icon_next_box.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Icon_next_box+32)
MOVT	R0, #hi_addr(_Icon_next_box+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2331 :: 		Icon_next_box.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next_box+36)
MOVT	R0, #hi_addr(_Icon_next_box+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2332 :: 		Icon_next_box.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next_box+40)
MOVT	R0, #hi_addr(_Icon_next_box+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2333 :: 		Icon_next_box.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next_box+44)
MOVT	R0, #hi_addr(_Icon_next_box+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2334 :: 		Icon_next_box.OnPressPtr      = Icon_next_boxOnPress;
MOVW	R1, #lo_addr(_Icon_next_boxOnPress+0)
MOVT	R1, #hi_addr(_Icon_next_boxOnPress+0)
MOVW	R0, #lo_addr(_Icon_next_box+48)
MOVT	R0, #hi_addr(_Icon_next_box+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2336 :: 		Label31.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_Label31+0)
MOVT	R0, #hi_addr(_Label31+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2337 :: 		Label31.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label31+4)
MOVT	R0, #hi_addr(_Label31+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2338 :: 		Label31.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label31+6)
MOVT	R0, #hi_addr(_Label31+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2339 :: 		Label31.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label31+8)
MOVT	R0, #hi_addr(_Label31+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2340 :: 		Label31.Width           = 108;
MOVS	R1, #108
MOVW	R0, #lo_addr(_Label31+10)
MOVT	R0, #hi_addr(_Label31+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2341 :: 		Label31.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Label31+12)
MOVT	R0, #hi_addr(_Label31+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2342 :: 		Label31.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label31+26)
MOVT	R0, #hi_addr(_Label31+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2343 :: 		Label31.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label31+27)
MOVT	R0, #hi_addr(_Label31+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2344 :: 		Label31.Caption         = Label31_Caption;
MOVW	R1, #lo_addr(_Label31_Caption+0)
MOVT	R1, #hi_addr(_Label31_Caption+0)
MOVW	R0, #lo_addr(_Label31+16)
MOVT	R0, #hi_addr(_Label31+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2345 :: 		Label31.FontName        = Open_Sans_Light21x24_Regular;
MOVW	R0, #lo_addr(_Label31+20)
MOVT	R0, #hi_addr(_Label31+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,2346 :: 		Label31.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label31+24)
MOVT	R0, #hi_addr(_Label31+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2347 :: 		Label31.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label31+28)
MOVT	R0, #hi_addr(_Label31+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2348 :: 		Label31.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label31+32)
MOVT	R0, #hi_addr(_Label31+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2349 :: 		Label31.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label31+36)
MOVT	R0, #hi_addr(_Label31+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2350 :: 		Label31.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label31+40)
MOVT	R0, #hi_addr(_Label31+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2352 :: 		back_slide_show.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_back_slide_show+0)
MOVT	R0, #hi_addr(_back_slide_show+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2353 :: 		back_slide_show.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_back_slide_show+4)
MOVT	R0, #hi_addr(_back_slide_show+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2354 :: 		back_slide_show.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_back_slide_show+6)
MOVT	R0, #hi_addr(_back_slide_show+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2355 :: 		back_slide_show.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_back_slide_show+8)
MOVT	R0, #hi_addr(_back_slide_show+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2356 :: 		back_slide_show.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_back_slide_show+10)
MOVT	R0, #hi_addr(_back_slide_show+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2357 :: 		back_slide_show.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_back_slide_show+12)
MOVT	R0, #hi_addr(_back_slide_show+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2358 :: 		back_slide_show.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_back_slide_show+22)
MOVT	R0, #hi_addr(_back_slide_show+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2359 :: 		back_slide_show.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_back_slide_show+23)
MOVT	R0, #hi_addr(_back_slide_show+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2360 :: 		back_slide_show.Picture_Name    = icon_back_slideshow_bmp;
MOVW	R1, #lo_addr(_icon_back_slideshow_bmp+0)
MOVT	R1, #hi_addr(_icon_back_slideshow_bmp+0)
MOVW	R0, #lo_addr(_back_slide_show+16)
MOVT	R0, #hi_addr(_back_slide_show+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2361 :: 		back_slide_show.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_back_slide_show+20)
MOVT	R0, #hi_addr(_back_slide_show+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2362 :: 		back_slide_show.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_back_slide_show+21)
MOVT	R0, #hi_addr(_back_slide_show+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2363 :: 		back_slide_show.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_back_slide_show+24)
MOVT	R0, #hi_addr(_back_slide_show+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2364 :: 		back_slide_show.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_back_slide_show+28)
MOVT	R0, #hi_addr(_back_slide_show+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2365 :: 		back_slide_show.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_back_slide_show+32)
MOVT	R0, #hi_addr(_back_slide_show+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2366 :: 		back_slide_show.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_back_slide_show+36)
MOVT	R0, #hi_addr(_back_slide_show+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2368 :: 		Label32.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_Label32+0)
MOVT	R0, #hi_addr(_Label32+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2369 :: 		Label32.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label32+4)
MOVT	R0, #hi_addr(_Label32+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2370 :: 		Label32.Left            = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label32+6)
MOVT	R0, #hi_addr(_Label32+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2371 :: 		Label32.Top             = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Label32+8)
MOVT	R0, #hi_addr(_Label32+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2372 :: 		Label32.Width           = 104;
MOVS	R1, #104
MOVW	R0, #lo_addr(_Label32+10)
MOVT	R0, #hi_addr(_Label32+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2373 :: 		Label32.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label32+12)
MOVT	R0, #hi_addr(_Label32+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2374 :: 		Label32.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label32+26)
MOVT	R0, #hi_addr(_Label32+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2375 :: 		Label32.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label32+27)
MOVT	R0, #hi_addr(_Label32+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2376 :: 		Label32.Caption         = Label32_Caption;
MOVW	R1, #lo_addr(_Label32_Caption+0)
MOVT	R1, #hi_addr(_Label32_Caption+0)
MOVW	R0, #lo_addr(_Label32+16)
MOVT	R0, #hi_addr(_Label32+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2377 :: 		Label32.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Label32+20)
MOVT	R0, #hi_addr(_Label32+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,2378 :: 		Label32.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label32+24)
MOVT	R0, #hi_addr(_Label32+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2379 :: 		Label32.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+28)
MOVT	R0, #hi_addr(_Label32+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2380 :: 		Label32.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+32)
MOVT	R0, #hi_addr(_Label32+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2381 :: 		Label32.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+36)
MOVT	R0, #hi_addr(_Label32+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2382 :: 		Label32.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+40)
MOVT	R0, #hi_addr(_Label32+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2384 :: 		Label33.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_Label33+0)
MOVT	R0, #hi_addr(_Label33+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2385 :: 		Label33.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label33+4)
MOVT	R0, #hi_addr(_Label33+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2386 :: 		Label33.Left            = 432;
MOVW	R1, #432
MOVW	R0, #lo_addr(_Label33+6)
MOVT	R0, #hi_addr(_Label33+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2387 :: 		Label33.Top             = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Label33+8)
MOVT	R0, #hi_addr(_Label33+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2388 :: 		Label33.Width           = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Label33+10)
MOVT	R0, #hi_addr(_Label33+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2389 :: 		Label33.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label33+12)
MOVT	R0, #hi_addr(_Label33+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2390 :: 		Label33.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label33+26)
MOVT	R0, #hi_addr(_Label33+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2391 :: 		Label33.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label33+27)
MOVT	R0, #hi_addr(_Label33+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2392 :: 		Label33.Caption         = Label33_Caption;
MOVW	R1, #lo_addr(_Label33_Caption+0)
MOVT	R1, #hi_addr(_Label33_Caption+0)
MOVW	R0, #lo_addr(_Label33+16)
MOVT	R0, #hi_addr(_Label33+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2393 :: 		Label33.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Label33+20)
MOVT	R0, #hi_addr(_Label33+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,2394 :: 		Label33.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label33+24)
MOVT	R0, #hi_addr(_Label33+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2395 :: 		Label33.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label33+28)
MOVT	R0, #hi_addr(_Label33+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2396 :: 		Label33.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label33+32)
MOVT	R0, #hi_addr(_Label33+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2397 :: 		Label33.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label33+36)
MOVT	R0, #hi_addr(_Label33+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2398 :: 		Label33.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label33+40)
MOVT	R0, #hi_addr(_Label33+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2400 :: 		icon_previous.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_icon_previous+0)
MOVT	R0, #hi_addr(_icon_previous+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2401 :: 		icon_previous.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_icon_previous+4)
MOVT	R0, #hi_addr(_icon_previous+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2402 :: 		icon_previous.Left            = 248;
MOVS	R1, #248
MOVW	R0, #lo_addr(_icon_previous+6)
MOVT	R0, #hi_addr(_icon_previous+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2403 :: 		icon_previous.Top             = 253;
MOVS	R1, #253
MOVW	R0, #lo_addr(_icon_previous+8)
MOVT	R0, #hi_addr(_icon_previous+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2404 :: 		icon_previous.Width           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_icon_previous+10)
MOVT	R0, #hi_addr(_icon_previous+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2405 :: 		icon_previous.Height          = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_icon_previous+12)
MOVT	R0, #hi_addr(_icon_previous+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2406 :: 		icon_previous.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous+22)
MOVT	R0, #hi_addr(_icon_previous+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2407 :: 		icon_previous.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_icon_previous+23)
MOVT	R0, #hi_addr(_icon_previous+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2408 :: 		icon_previous.Picture_Name    = icon_prev_slide_bmp;
MOVW	R1, #lo_addr(_icon_prev_slide_bmp+0)
MOVT	R1, #hi_addr(_icon_prev_slide_bmp+0)
MOVW	R0, #lo_addr(_icon_previous+16)
MOVT	R0, #hi_addr(_icon_previous+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2409 :: 		icon_previous.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_icon_previous+20)
MOVT	R0, #hi_addr(_icon_previous+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2410 :: 		icon_previous.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous+21)
MOVT	R0, #hi_addr(_icon_previous+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2411 :: 		icon_previous.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous+24)
MOVT	R0, #hi_addr(_icon_previous+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2412 :: 		icon_previous.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous+28)
MOVT	R0, #hi_addr(_icon_previous+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2413 :: 		icon_previous.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous+32)
MOVT	R0, #hi_addr(_icon_previous+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2414 :: 		icon_previous.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous+36)
MOVT	R0, #hi_addr(_icon_previous+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2416 :: 		Icon_next.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_Icon_next+0)
MOVT	R0, #hi_addr(_Icon_next+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2417 :: 		Icon_next.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Icon_next+4)
MOVT	R0, #hi_addr(_Icon_next+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2418 :: 		Icon_next.Left            = 216;
MOVS	R1, #216
MOVW	R0, #lo_addr(_Icon_next+6)
MOVT	R0, #hi_addr(_Icon_next+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2419 :: 		Icon_next.Top             = 253;
MOVS	R1, #253
MOVW	R0, #lo_addr(_Icon_next+8)
MOVT	R0, #hi_addr(_Icon_next+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2420 :: 		Icon_next.Width           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Icon_next+10)
MOVT	R0, #hi_addr(_Icon_next+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2421 :: 		Icon_next.Height          = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Icon_next+12)
MOVT	R0, #hi_addr(_Icon_next+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2422 :: 		Icon_next.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next+22)
MOVT	R0, #hi_addr(_Icon_next+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2423 :: 		Icon_next.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Icon_next+23)
MOVT	R0, #hi_addr(_Icon_next+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2424 :: 		Icon_next.Picture_Name    = icon_next_slide_bmp;
MOVW	R1, #lo_addr(_icon_next_slide_bmp+0)
MOVT	R1, #hi_addr(_icon_next_slide_bmp+0)
MOVW	R0, #lo_addr(_Icon_next+16)
MOVT	R0, #hi_addr(_Icon_next+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2425 :: 		Icon_next.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Icon_next+20)
MOVT	R0, #hi_addr(_Icon_next+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2426 :: 		Icon_next.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next+21)
MOVT	R0, #hi_addr(_Icon_next+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2427 :: 		Icon_next.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next+24)
MOVT	R0, #hi_addr(_Icon_next+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2428 :: 		Icon_next.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next+28)
MOVT	R0, #hi_addr(_Icon_next+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2429 :: 		Icon_next.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next+32)
MOVT	R0, #hi_addr(_Icon_next+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2430 :: 		Icon_next.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next+36)
MOVT	R0, #hi_addr(_Icon_next+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2432 :: 		Label35.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_Label35+0)
MOVT	R0, #hi_addr(_Label35+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2433 :: 		Label35.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label35+4)
MOVT	R0, #hi_addr(_Label35+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2434 :: 		Label35.Left            = 410;
MOVW	R1, #410
MOVW	R0, #lo_addr(_Label35+6)
MOVT	R0, #hi_addr(_Label35+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2435 :: 		Label35.Top             = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Label35+8)
MOVT	R0, #hi_addr(_Label35+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2436 :: 		Label35.Width           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label35+10)
MOVT	R0, #hi_addr(_Label35+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2437 :: 		Label35.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label35+12)
MOVT	R0, #hi_addr(_Label35+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2438 :: 		Label35.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label35+26)
MOVT	R0, #hi_addr(_Label35+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2439 :: 		Label35.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label35+27)
MOVT	R0, #hi_addr(_Label35+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2440 :: 		Label35.Caption         = Label35_Caption;
MOVW	R1, #lo_addr(_Label35_Caption+0)
MOVT	R1, #hi_addr(_Label35_Caption+0)
MOVW	R0, #lo_addr(_Label35+16)
MOVT	R0, #hi_addr(_Label35+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2441 :: 		Label35.FontName        = Open_Sans_Light16x18_Regular;
MOVW	R0, #lo_addr(_Label35+20)
MOVT	R0, #hi_addr(_Label35+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,2442 :: 		Label35.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label35+24)
MOVT	R0, #hi_addr(_Label35+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2443 :: 		Label35.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label35+28)
MOVT	R0, #hi_addr(_Label35+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2444 :: 		Label35.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label35+32)
MOVT	R0, #hi_addr(_Label35+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2445 :: 		Label35.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label35+36)
MOVT	R0, #hi_addr(_Label35+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2446 :: 		Label35.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label35+40)
MOVT	R0, #hi_addr(_Label35+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2448 :: 		Slide_Active_area.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_Slide_Active_area+0)
MOVT	R0, #hi_addr(_Slide_Active_area+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2449 :: 		Slide_Active_area.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Slide_Active_area+4)
MOVT	R0, #hi_addr(_Slide_Active_area+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2450 :: 		Slide_Active_area.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Slide_Active_area+6)
MOVT	R0, #hi_addr(_Slide_Active_area+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2451 :: 		Slide_Active_area.Top             = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_Slide_Active_area+8)
MOVT	R0, #hi_addr(_Slide_Active_area+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2452 :: 		Slide_Active_area.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Slide_Active_area+10)
MOVT	R0, #hi_addr(_Slide_Active_area+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2453 :: 		Slide_Active_area.Height          = 209;
MOVS	R1, #209
MOVW	R0, #lo_addr(_Slide_Active_area+12)
MOVT	R0, #hi_addr(_Slide_Active_area+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2454 :: 		Slide_Active_area.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Slide_Active_area+14)
MOVT	R0, #hi_addr(_Slide_Active_area+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2455 :: 		Slide_Active_area.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Slide_Active_area+16)
MOVT	R0, #hi_addr(_Slide_Active_area+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2456 :: 		Slide_Active_area.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Slide_Active_area+18)
MOVT	R0, #hi_addr(_Slide_Active_area+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2457 :: 		Slide_Active_area.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Slide_Active_area+19)
MOVT	R0, #hi_addr(_Slide_Active_area+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2458 :: 		Slide_Active_area.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Slide_Active_area+20)
MOVT	R0, #hi_addr(_Slide_Active_area+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2459 :: 		Slide_Active_area.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Slide_Active_area+21)
MOVT	R0, #hi_addr(_Slide_Active_area+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2460 :: 		Slide_Active_area.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Slide_Active_area+22)
MOVT	R0, #hi_addr(_Slide_Active_area+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2461 :: 		Slide_Active_area.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Slide_Active_area+24)
MOVT	R0, #hi_addr(_Slide_Active_area+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2462 :: 		Slide_Active_area.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Slide_Active_area+26)
MOVT	R0, #hi_addr(_Slide_Active_area+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2463 :: 		Slide_Active_area.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Slide_Active_area+28)
MOVT	R0, #hi_addr(_Slide_Active_area+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2464 :: 		Slide_Active_area.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Slide_Active_area+30)
MOVT	R0, #hi_addr(_Slide_Active_area+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2465 :: 		Slide_Active_area.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Slide_Active_area+32)
MOVT	R0, #hi_addr(_Slide_Active_area+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2466 :: 		Slide_Active_area.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Slide_Active_area+36)
MOVT	R0, #hi_addr(_Slide_Active_area+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2467 :: 		Slide_Active_area.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Slide_Active_area+40)
MOVT	R0, #hi_addr(_Slide_Active_area+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2468 :: 		Slide_Active_area.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Slide_Active_area+44)
MOVT	R0, #hi_addr(_Slide_Active_area+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2469 :: 		Slide_Active_area.OnPressPtr      = Slide_Active_areaOnPress;
MOVW	R1, #lo_addr(_Slide_Active_areaOnPress+0)
MOVT	R1, #hi_addr(_Slide_Active_areaOnPress+0)
MOVW	R0, #lo_addr(_Slide_Active_area+48)
MOVT	R0, #hi_addr(_Slide_Active_area+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2471 :: 		Image4.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image4+0)
MOVT	R0, #hi_addr(_Image4+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2472 :: 		Image4.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+4)
MOVT	R0, #hi_addr(_Image4+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2473 :: 		Image4.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+6)
MOVT	R0, #hi_addr(_Image4+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2474 :: 		Image4.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+8)
MOVT	R0, #hi_addr(_Image4+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2475 :: 		Image4.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image4+10)
MOVT	R0, #hi_addr(_Image4+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2476 :: 		Image4.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image4+12)
MOVT	R0, #hi_addr(_Image4+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2477 :: 		Image4.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+22)
MOVT	R0, #hi_addr(_Image4+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2478 :: 		Image4.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+23)
MOVT	R0, #hi_addr(_Image4+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2479 :: 		Image4.Picture_Name    = img0_jpg;
MOVW	R1, #lo_addr(_img0_jpg+0)
MOVT	R1, #hi_addr(_img0_jpg+0)
MOVW	R0, #lo_addr(_Image4+16)
MOVT	R0, #hi_addr(_Image4+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2480 :: 		Image4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+20)
MOVT	R0, #hi_addr(_Image4+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2481 :: 		Image4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+21)
MOVT	R0, #hi_addr(_Image4+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2482 :: 		Image4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+24)
MOVT	R0, #hi_addr(_Image4+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2483 :: 		Image4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+28)
MOVT	R0, #hi_addr(_Image4+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2484 :: 		Image4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+32)
MOVT	R0, #hi_addr(_Image4+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2485 :: 		Image4.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+36)
MOVT	R0, #hi_addr(_Image4+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2487 :: 		Image19.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image19+0)
MOVT	R0, #hi_addr(_Image19+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2488 :: 		Image19.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image19+4)
MOVT	R0, #hi_addr(_Image19+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2489 :: 		Image19.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image19+6)
MOVT	R0, #hi_addr(_Image19+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2490 :: 		Image19.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image19+8)
MOVT	R0, #hi_addr(_Image19+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2491 :: 		Image19.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image19+10)
MOVT	R0, #hi_addr(_Image19+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2492 :: 		Image19.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image19+12)
MOVT	R0, #hi_addr(_Image19+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2493 :: 		Image19.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image19+22)
MOVT	R0, #hi_addr(_Image19+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2494 :: 		Image19.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image19+23)
MOVT	R0, #hi_addr(_Image19+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2495 :: 		Image19.Picture_Name    = img3_jpg;
MOVW	R1, #lo_addr(_img3_jpg+0)
MOVT	R1, #hi_addr(_img3_jpg+0)
MOVW	R0, #lo_addr(_Image19+16)
MOVT	R0, #hi_addr(_Image19+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2496 :: 		Image19.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image19+20)
MOVT	R0, #hi_addr(_Image19+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2497 :: 		Image19.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image19+21)
MOVT	R0, #hi_addr(_Image19+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2498 :: 		Image19.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image19+24)
MOVT	R0, #hi_addr(_Image19+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2499 :: 		Image19.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image19+28)
MOVT	R0, #hi_addr(_Image19+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2500 :: 		Image19.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image19+32)
MOVT	R0, #hi_addr(_Image19+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2501 :: 		Image19.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image19+36)
MOVT	R0, #hi_addr(_Image19+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2503 :: 		Image20.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image20+0)
MOVT	R0, #hi_addr(_Image20+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2504 :: 		Image20.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image20+4)
MOVT	R0, #hi_addr(_Image20+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2505 :: 		Image20.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+6)
MOVT	R0, #hi_addr(_Image20+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2506 :: 		Image20.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+8)
MOVT	R0, #hi_addr(_Image20+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2507 :: 		Image20.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image20+10)
MOVT	R0, #hi_addr(_Image20+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2508 :: 		Image20.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image20+12)
MOVT	R0, #hi_addr(_Image20+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2509 :: 		Image20.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image20+22)
MOVT	R0, #hi_addr(_Image20+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2510 :: 		Image20.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image20+23)
MOVT	R0, #hi_addr(_Image20+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2511 :: 		Image20.Picture_Name    = img6_jpg;
MOVW	R1, #lo_addr(_img6_jpg+0)
MOVT	R1, #hi_addr(_img6_jpg+0)
MOVW	R0, #lo_addr(_Image20+16)
MOVT	R0, #hi_addr(_Image20+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2512 :: 		Image20.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image20+20)
MOVT	R0, #hi_addr(_Image20+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2513 :: 		Image20.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image20+21)
MOVT	R0, #hi_addr(_Image20+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2514 :: 		Image20.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+24)
MOVT	R0, #hi_addr(_Image20+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2515 :: 		Image20.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+28)
MOVT	R0, #hi_addr(_Image20+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2516 :: 		Image20.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+32)
MOVT	R0, #hi_addr(_Image20+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2517 :: 		Image20.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+36)
MOVT	R0, #hi_addr(_Image20+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2519 :: 		Image21.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image21+0)
MOVT	R0, #hi_addr(_Image21+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2520 :: 		Image21.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Image21+4)
MOVT	R0, #hi_addr(_Image21+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2521 :: 		Image21.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+6)
MOVT	R0, #hi_addr(_Image21+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2522 :: 		Image21.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+8)
MOVT	R0, #hi_addr(_Image21+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2523 :: 		Image21.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image21+10)
MOVT	R0, #hi_addr(_Image21+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2524 :: 		Image21.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image21+12)
MOVT	R0, #hi_addr(_Image21+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2525 :: 		Image21.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image21+22)
MOVT	R0, #hi_addr(_Image21+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2526 :: 		Image21.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image21+23)
MOVT	R0, #hi_addr(_Image21+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2527 :: 		Image21.Picture_Name    = img9_jpg;
MOVW	R1, #lo_addr(_img9_jpg+0)
MOVT	R1, #hi_addr(_img9_jpg+0)
MOVW	R0, #lo_addr(_Image21+16)
MOVT	R0, #hi_addr(_Image21+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2528 :: 		Image21.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image21+20)
MOVT	R0, #hi_addr(_Image21+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2529 :: 		Image21.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image21+21)
MOVT	R0, #hi_addr(_Image21+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2530 :: 		Image21.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+24)
MOVT	R0, #hi_addr(_Image21+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2531 :: 		Image21.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+28)
MOVT	R0, #hi_addr(_Image21+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2532 :: 		Image21.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+32)
MOVT	R0, #hi_addr(_Image21+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2533 :: 		Image21.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+36)
MOVT	R0, #hi_addr(_Image21+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2535 :: 		Image22.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image22+0)
MOVT	R0, #hi_addr(_Image22+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2536 :: 		Image22.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Image22+4)
MOVT	R0, #hi_addr(_Image22+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2537 :: 		Image22.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+6)
MOVT	R0, #hi_addr(_Image22+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2538 :: 		Image22.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+8)
MOVT	R0, #hi_addr(_Image22+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2539 :: 		Image22.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image22+10)
MOVT	R0, #hi_addr(_Image22+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2540 :: 		Image22.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image22+12)
MOVT	R0, #hi_addr(_Image22+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2541 :: 		Image22.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image22+22)
MOVT	R0, #hi_addr(_Image22+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2542 :: 		Image22.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image22+23)
MOVT	R0, #hi_addr(_Image22+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2543 :: 		Image22.Picture_Name    = img12_jpg;
MOVW	R1, #lo_addr(_img12_jpg+0)
MOVT	R1, #hi_addr(_img12_jpg+0)
MOVW	R0, #lo_addr(_Image22+16)
MOVT	R0, #hi_addr(_Image22+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2544 :: 		Image22.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image22+20)
MOVT	R0, #hi_addr(_Image22+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2545 :: 		Image22.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image22+21)
MOVT	R0, #hi_addr(_Image22+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2546 :: 		Image22.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+24)
MOVT	R0, #hi_addr(_Image22+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2547 :: 		Image22.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+28)
MOVT	R0, #hi_addr(_Image22+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2548 :: 		Image22.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+32)
MOVT	R0, #hi_addr(_Image22+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2549 :: 		Image22.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image22+36)
MOVT	R0, #hi_addr(_Image22+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2551 :: 		Image23.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image23+0)
MOVT	R0, #hi_addr(_Image23+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2552 :: 		Image23.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image23+4)
MOVT	R0, #hi_addr(_Image23+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2553 :: 		Image23.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image23+6)
MOVT	R0, #hi_addr(_Image23+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2554 :: 		Image23.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image23+8)
MOVT	R0, #hi_addr(_Image23+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2555 :: 		Image23.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image23+10)
MOVT	R0, #hi_addr(_Image23+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2556 :: 		Image23.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image23+12)
MOVT	R0, #hi_addr(_Image23+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2557 :: 		Image23.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image23+22)
MOVT	R0, #hi_addr(_Image23+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2558 :: 		Image23.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image23+23)
MOVT	R0, #hi_addr(_Image23+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2559 :: 		Image23.Picture_Name    = img15_jpg;
MOVW	R1, #lo_addr(_img15_jpg+0)
MOVT	R1, #hi_addr(_img15_jpg+0)
MOVW	R0, #lo_addr(_Image23+16)
MOVT	R0, #hi_addr(_Image23+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2560 :: 		Image23.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image23+20)
MOVT	R0, #hi_addr(_Image23+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2561 :: 		Image23.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image23+21)
MOVT	R0, #hi_addr(_Image23+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2562 :: 		Image23.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image23+24)
MOVT	R0, #hi_addr(_Image23+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2563 :: 		Image23.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image23+28)
MOVT	R0, #hi_addr(_Image23+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2564 :: 		Image23.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image23+32)
MOVT	R0, #hi_addr(_Image23+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2565 :: 		Image23.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image23+36)
MOVT	R0, #hi_addr(_Image23+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2567 :: 		Image24.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image24+0)
MOVT	R0, #hi_addr(_Image24+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2568 :: 		Image24.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image24+4)
MOVT	R0, #hi_addr(_Image24+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2569 :: 		Image24.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+6)
MOVT	R0, #hi_addr(_Image24+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2570 :: 		Image24.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+8)
MOVT	R0, #hi_addr(_Image24+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2571 :: 		Image24.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image24+10)
MOVT	R0, #hi_addr(_Image24+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2572 :: 		Image24.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image24+12)
MOVT	R0, #hi_addr(_Image24+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2573 :: 		Image24.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image24+22)
MOVT	R0, #hi_addr(_Image24+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2574 :: 		Image24.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image24+23)
MOVT	R0, #hi_addr(_Image24+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2575 :: 		Image24.Picture_Name    = img18_jpg;
MOVW	R1, #lo_addr(_img18_jpg+0)
MOVT	R1, #hi_addr(_img18_jpg+0)
MOVW	R0, #lo_addr(_Image24+16)
MOVT	R0, #hi_addr(_Image24+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2576 :: 		Image24.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image24+20)
MOVT	R0, #hi_addr(_Image24+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2577 :: 		Image24.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image24+21)
MOVT	R0, #hi_addr(_Image24+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2578 :: 		Image24.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+24)
MOVT	R0, #hi_addr(_Image24+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2579 :: 		Image24.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+28)
MOVT	R0, #hi_addr(_Image24+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2580 :: 		Image24.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+32)
MOVT	R0, #hi_addr(_Image24+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2581 :: 		Image24.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+36)
MOVT	R0, #hi_addr(_Image24+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2583 :: 		Image25.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image25+0)
MOVT	R0, #hi_addr(_Image25+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2584 :: 		Image25.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Image25+4)
MOVT	R0, #hi_addr(_Image25+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2585 :: 		Image25.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+6)
MOVT	R0, #hi_addr(_Image25+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2586 :: 		Image25.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+8)
MOVT	R0, #hi_addr(_Image25+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2587 :: 		Image25.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image25+10)
MOVT	R0, #hi_addr(_Image25+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2588 :: 		Image25.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image25+12)
MOVT	R0, #hi_addr(_Image25+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2589 :: 		Image25.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image25+22)
MOVT	R0, #hi_addr(_Image25+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2590 :: 		Image25.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image25+23)
MOVT	R0, #hi_addr(_Image25+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2591 :: 		Image25.Picture_Name    = img21_jpg;
MOVW	R1, #lo_addr(_img21_jpg+0)
MOVT	R1, #hi_addr(_img21_jpg+0)
MOVW	R0, #lo_addr(_Image25+16)
MOVT	R0, #hi_addr(_Image25+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2592 :: 		Image25.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image25+20)
MOVT	R0, #hi_addr(_Image25+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2593 :: 		Image25.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image25+21)
MOVT	R0, #hi_addr(_Image25+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2594 :: 		Image25.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+24)
MOVT	R0, #hi_addr(_Image25+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2595 :: 		Image25.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+28)
MOVT	R0, #hi_addr(_Image25+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2596 :: 		Image25.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+32)
MOVT	R0, #hi_addr(_Image25+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2597 :: 		Image25.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+36)
MOVT	R0, #hi_addr(_Image25+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2599 :: 		Image26.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image26+0)
MOVT	R0, #hi_addr(_Image26+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2600 :: 		Image26.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Image26+4)
MOVT	R0, #hi_addr(_Image26+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2601 :: 		Image26.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image26+6)
MOVT	R0, #hi_addr(_Image26+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2602 :: 		Image26.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image26+8)
MOVT	R0, #hi_addr(_Image26+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2603 :: 		Image26.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image26+10)
MOVT	R0, #hi_addr(_Image26+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2604 :: 		Image26.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image26+12)
MOVT	R0, #hi_addr(_Image26+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2605 :: 		Image26.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image26+22)
MOVT	R0, #hi_addr(_Image26+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2606 :: 		Image26.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image26+23)
MOVT	R0, #hi_addr(_Image26+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2607 :: 		Image26.Picture_Name    = img24_jpg;
MOVW	R1, #lo_addr(_img24_jpg+0)
MOVT	R1, #hi_addr(_img24_jpg+0)
MOVW	R0, #lo_addr(_Image26+16)
MOVT	R0, #hi_addr(_Image26+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2608 :: 		Image26.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image26+20)
MOVT	R0, #hi_addr(_Image26+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2609 :: 		Image26.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image26+21)
MOVT	R0, #hi_addr(_Image26+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2610 :: 		Image26.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image26+24)
MOVT	R0, #hi_addr(_Image26+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2611 :: 		Image26.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image26+28)
MOVT	R0, #hi_addr(_Image26+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2612 :: 		Image26.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image26+32)
MOVT	R0, #hi_addr(_Image26+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2613 :: 		Image26.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image26+36)
MOVT	R0, #hi_addr(_Image26+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2615 :: 		Image27.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image27+0)
MOVT	R0, #hi_addr(_Image27+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2616 :: 		Image27.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Image27+4)
MOVT	R0, #hi_addr(_Image27+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2617 :: 		Image27.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+6)
MOVT	R0, #hi_addr(_Image27+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2618 :: 		Image27.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+8)
MOVT	R0, #hi_addr(_Image27+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2619 :: 		Image27.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image27+10)
MOVT	R0, #hi_addr(_Image27+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2620 :: 		Image27.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image27+12)
MOVT	R0, #hi_addr(_Image27+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2621 :: 		Image27.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image27+22)
MOVT	R0, #hi_addr(_Image27+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2622 :: 		Image27.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image27+23)
MOVT	R0, #hi_addr(_Image27+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2623 :: 		Image27.Picture_Name    = img27_jpg;
MOVW	R1, #lo_addr(_img27_jpg+0)
MOVT	R1, #hi_addr(_img27_jpg+0)
MOVW	R0, #lo_addr(_Image27+16)
MOVT	R0, #hi_addr(_Image27+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2624 :: 		Image27.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image27+20)
MOVT	R0, #hi_addr(_Image27+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2625 :: 		Image27.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image27+21)
MOVT	R0, #hi_addr(_Image27+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2626 :: 		Image27.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+24)
MOVT	R0, #hi_addr(_Image27+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2627 :: 		Image27.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+28)
MOVT	R0, #hi_addr(_Image27+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2628 :: 		Image27.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+32)
MOVT	R0, #hi_addr(_Image27+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2629 :: 		Image27.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+36)
MOVT	R0, #hi_addr(_Image27+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2631 :: 		Image28.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image28+0)
MOVT	R0, #hi_addr(_Image28+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2632 :: 		Image28.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Image28+4)
MOVT	R0, #hi_addr(_Image28+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2633 :: 		Image28.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image28+6)
MOVT	R0, #hi_addr(_Image28+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2634 :: 		Image28.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image28+8)
MOVT	R0, #hi_addr(_Image28+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2635 :: 		Image28.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image28+10)
MOVT	R0, #hi_addr(_Image28+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2636 :: 		Image28.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image28+12)
MOVT	R0, #hi_addr(_Image28+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2637 :: 		Image28.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image28+22)
MOVT	R0, #hi_addr(_Image28+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2638 :: 		Image28.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image28+23)
MOVT	R0, #hi_addr(_Image28+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2639 :: 		Image28.Picture_Name    = img30_jpg;
MOVW	R1, #lo_addr(_img30_jpg+0)
MOVT	R1, #hi_addr(_img30_jpg+0)
MOVW	R0, #lo_addr(_Image28+16)
MOVT	R0, #hi_addr(_Image28+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2640 :: 		Image28.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image28+20)
MOVT	R0, #hi_addr(_Image28+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2641 :: 		Image28.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image28+21)
MOVT	R0, #hi_addr(_Image28+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2642 :: 		Image28.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image28+24)
MOVT	R0, #hi_addr(_Image28+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2643 :: 		Image28.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image28+28)
MOVT	R0, #hi_addr(_Image28+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2644 :: 		Image28.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image28+32)
MOVT	R0, #hi_addr(_Image28+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2645 :: 		Image28.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image28+36)
MOVT	R0, #hi_addr(_Image28+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2647 :: 		Image29.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image29+0)
MOVT	R0, #hi_addr(_Image29+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2648 :: 		Image29.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Image29+4)
MOVT	R0, #hi_addr(_Image29+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2649 :: 		Image29.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+6)
MOVT	R0, #hi_addr(_Image29+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2650 :: 		Image29.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+8)
MOVT	R0, #hi_addr(_Image29+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2651 :: 		Image29.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image29+10)
MOVT	R0, #hi_addr(_Image29+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2652 :: 		Image29.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image29+12)
MOVT	R0, #hi_addr(_Image29+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2653 :: 		Image29.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image29+22)
MOVT	R0, #hi_addr(_Image29+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2654 :: 		Image29.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image29+23)
MOVT	R0, #hi_addr(_Image29+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2655 :: 		Image29.Picture_Name    = img33_jpg;
MOVW	R1, #lo_addr(_img33_jpg+0)
MOVT	R1, #hi_addr(_img33_jpg+0)
MOVW	R0, #lo_addr(_Image29+16)
MOVT	R0, #hi_addr(_Image29+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2656 :: 		Image29.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image29+20)
MOVT	R0, #hi_addr(_Image29+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2657 :: 		Image29.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image29+21)
MOVT	R0, #hi_addr(_Image29+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2658 :: 		Image29.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+24)
MOVT	R0, #hi_addr(_Image29+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2659 :: 		Image29.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+28)
MOVT	R0, #hi_addr(_Image29+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2660 :: 		Image29.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+32)
MOVT	R0, #hi_addr(_Image29+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2661 :: 		Image29.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+36)
MOVT	R0, #hi_addr(_Image29+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2663 :: 		Image30.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image30+0)
MOVT	R0, #hi_addr(_Image30+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2664 :: 		Image30.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Image30+4)
MOVT	R0, #hi_addr(_Image30+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2665 :: 		Image30.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image30+6)
MOVT	R0, #hi_addr(_Image30+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2666 :: 		Image30.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image30+8)
MOVT	R0, #hi_addr(_Image30+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2667 :: 		Image30.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image30+10)
MOVT	R0, #hi_addr(_Image30+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2668 :: 		Image30.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image30+12)
MOVT	R0, #hi_addr(_Image30+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2669 :: 		Image30.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image30+22)
MOVT	R0, #hi_addr(_Image30+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2670 :: 		Image30.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image30+23)
MOVT	R0, #hi_addr(_Image30+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2671 :: 		Image30.Picture_Name    = img36_jpg;
MOVW	R1, #lo_addr(_img36_jpg+0)
MOVT	R1, #hi_addr(_img36_jpg+0)
MOVW	R0, #lo_addr(_Image30+16)
MOVT	R0, #hi_addr(_Image30+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2672 :: 		Image30.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image30+20)
MOVT	R0, #hi_addr(_Image30+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2673 :: 		Image30.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image30+21)
MOVT	R0, #hi_addr(_Image30+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2674 :: 		Image30.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image30+24)
MOVT	R0, #hi_addr(_Image30+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2675 :: 		Image30.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image30+28)
MOVT	R0, #hi_addr(_Image30+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2676 :: 		Image30.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image30+32)
MOVT	R0, #hi_addr(_Image30+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2677 :: 		Image30.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image30+36)
MOVT	R0, #hi_addr(_Image30+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2679 :: 		Image31.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image31+0)
MOVT	R0, #hi_addr(_Image31+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2680 :: 		Image31.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Image31+4)
MOVT	R0, #hi_addr(_Image31+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2681 :: 		Image31.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image31+6)
MOVT	R0, #hi_addr(_Image31+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2682 :: 		Image31.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image31+8)
MOVT	R0, #hi_addr(_Image31+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2683 :: 		Image31.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image31+10)
MOVT	R0, #hi_addr(_Image31+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2684 :: 		Image31.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image31+12)
MOVT	R0, #hi_addr(_Image31+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2685 :: 		Image31.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image31+22)
MOVT	R0, #hi_addr(_Image31+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2686 :: 		Image31.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image31+23)
MOVT	R0, #hi_addr(_Image31+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2687 :: 		Image31.Picture_Name    = img39_jpg;
MOVW	R1, #lo_addr(_img39_jpg+0)
MOVT	R1, #hi_addr(_img39_jpg+0)
MOVW	R0, #lo_addr(_Image31+16)
MOVT	R0, #hi_addr(_Image31+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2688 :: 		Image31.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image31+20)
MOVT	R0, #hi_addr(_Image31+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2689 :: 		Image31.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image31+21)
MOVT	R0, #hi_addr(_Image31+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2690 :: 		Image31.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image31+24)
MOVT	R0, #hi_addr(_Image31+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2691 :: 		Image31.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image31+28)
MOVT	R0, #hi_addr(_Image31+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2692 :: 		Image31.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image31+32)
MOVT	R0, #hi_addr(_Image31+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2693 :: 		Image31.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image31+36)
MOVT	R0, #hi_addr(_Image31+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2695 :: 		Image32.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image32+0)
MOVT	R0, #hi_addr(_Image32+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2696 :: 		Image32.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Image32+4)
MOVT	R0, #hi_addr(_Image32+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2697 :: 		Image32.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image32+6)
MOVT	R0, #hi_addr(_Image32+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2698 :: 		Image32.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image32+8)
MOVT	R0, #hi_addr(_Image32+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2699 :: 		Image32.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image32+10)
MOVT	R0, #hi_addr(_Image32+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2700 :: 		Image32.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image32+12)
MOVT	R0, #hi_addr(_Image32+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2701 :: 		Image32.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image32+22)
MOVT	R0, #hi_addr(_Image32+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2702 :: 		Image32.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image32+23)
MOVT	R0, #hi_addr(_Image32+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2703 :: 		Image32.Picture_Name    = img42_jpg;
MOVW	R1, #lo_addr(_img42_jpg+0)
MOVT	R1, #hi_addr(_img42_jpg+0)
MOVW	R0, #lo_addr(_Image32+16)
MOVT	R0, #hi_addr(_Image32+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2704 :: 		Image32.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image32+20)
MOVT	R0, #hi_addr(_Image32+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2705 :: 		Image32.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image32+21)
MOVT	R0, #hi_addr(_Image32+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2706 :: 		Image32.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image32+24)
MOVT	R0, #hi_addr(_Image32+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2707 :: 		Image32.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image32+28)
MOVT	R0, #hi_addr(_Image32+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2708 :: 		Image32.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image32+32)
MOVT	R0, #hi_addr(_Image32+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2709 :: 		Image32.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image32+36)
MOVT	R0, #hi_addr(_Image32+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2711 :: 		Image33.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image33+0)
MOVT	R0, #hi_addr(_Image33+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2712 :: 		Image33.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Image33+4)
MOVT	R0, #hi_addr(_Image33+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2713 :: 		Image33.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+6)
MOVT	R0, #hi_addr(_Image33+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2714 :: 		Image33.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+8)
MOVT	R0, #hi_addr(_Image33+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2715 :: 		Image33.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image33+10)
MOVT	R0, #hi_addr(_Image33+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2716 :: 		Image33.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image33+12)
MOVT	R0, #hi_addr(_Image33+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2717 :: 		Image33.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image33+22)
MOVT	R0, #hi_addr(_Image33+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2718 :: 		Image33.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image33+23)
MOVT	R0, #hi_addr(_Image33+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2719 :: 		Image33.Picture_Name    = img45_jpg;
MOVW	R1, #lo_addr(_img45_jpg+0)
MOVT	R1, #hi_addr(_img45_jpg+0)
MOVW	R0, #lo_addr(_Image33+16)
MOVT	R0, #hi_addr(_Image33+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2720 :: 		Image33.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image33+20)
MOVT	R0, #hi_addr(_Image33+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2721 :: 		Image33.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image33+21)
MOVT	R0, #hi_addr(_Image33+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2722 :: 		Image33.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+24)
MOVT	R0, #hi_addr(_Image33+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2723 :: 		Image33.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+28)
MOVT	R0, #hi_addr(_Image33+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2724 :: 		Image33.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+32)
MOVT	R0, #hi_addr(_Image33+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2725 :: 		Image33.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image33+36)
MOVT	R0, #hi_addr(_Image33+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2727 :: 		Image34.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image34+0)
MOVT	R0, #hi_addr(_Image34+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2728 :: 		Image34.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Image34+4)
MOVT	R0, #hi_addr(_Image34+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2729 :: 		Image34.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+6)
MOVT	R0, #hi_addr(_Image34+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2730 :: 		Image34.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+8)
MOVT	R0, #hi_addr(_Image34+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2731 :: 		Image34.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image34+10)
MOVT	R0, #hi_addr(_Image34+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2732 :: 		Image34.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image34+12)
MOVT	R0, #hi_addr(_Image34+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2733 :: 		Image34.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image34+22)
MOVT	R0, #hi_addr(_Image34+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2734 :: 		Image34.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image34+23)
MOVT	R0, #hi_addr(_Image34+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2735 :: 		Image34.Picture_Name    = img48_jpg;
MOVW	R1, #lo_addr(_img48_jpg+0)
MOVT	R1, #hi_addr(_img48_jpg+0)
MOVW	R0, #lo_addr(_Image34+16)
MOVT	R0, #hi_addr(_Image34+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2736 :: 		Image34.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image34+20)
MOVT	R0, #hi_addr(_Image34+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2737 :: 		Image34.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image34+21)
MOVT	R0, #hi_addr(_Image34+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2738 :: 		Image34.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+24)
MOVT	R0, #hi_addr(_Image34+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2739 :: 		Image34.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+28)
MOVT	R0, #hi_addr(_Image34+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2740 :: 		Image34.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+32)
MOVT	R0, #hi_addr(_Image34+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2741 :: 		Image34.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image34+36)
MOVT	R0, #hi_addr(_Image34+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2743 :: 		Image35.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image35+0)
MOVT	R0, #hi_addr(_Image35+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2744 :: 		Image35.Order           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Image35+4)
MOVT	R0, #hi_addr(_Image35+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2745 :: 		Image35.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image35+6)
MOVT	R0, #hi_addr(_Image35+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2746 :: 		Image35.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image35+8)
MOVT	R0, #hi_addr(_Image35+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2747 :: 		Image35.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image35+10)
MOVT	R0, #hi_addr(_Image35+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2748 :: 		Image35.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image35+12)
MOVT	R0, #hi_addr(_Image35+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2749 :: 		Image35.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image35+22)
MOVT	R0, #hi_addr(_Image35+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2750 :: 		Image35.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image35+23)
MOVT	R0, #hi_addr(_Image35+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2751 :: 		Image35.Picture_Name    = img51_jpg;
MOVW	R1, #lo_addr(_img51_jpg+0)
MOVT	R1, #hi_addr(_img51_jpg+0)
MOVW	R0, #lo_addr(_Image35+16)
MOVT	R0, #hi_addr(_Image35+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2752 :: 		Image35.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image35+20)
MOVT	R0, #hi_addr(_Image35+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2753 :: 		Image35.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image35+21)
MOVT	R0, #hi_addr(_Image35+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2754 :: 		Image35.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image35+24)
MOVT	R0, #hi_addr(_Image35+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2755 :: 		Image35.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image35+28)
MOVT	R0, #hi_addr(_Image35+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2756 :: 		Image35.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image35+32)
MOVT	R0, #hi_addr(_Image35+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2757 :: 		Image35.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image35+36)
MOVT	R0, #hi_addr(_Image35+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2759 :: 		Image36.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image36+0)
MOVT	R0, #hi_addr(_Image36+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2760 :: 		Image36.Order           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Image36+4)
MOVT	R0, #hi_addr(_Image36+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2761 :: 		Image36.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image36+6)
MOVT	R0, #hi_addr(_Image36+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2762 :: 		Image36.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image36+8)
MOVT	R0, #hi_addr(_Image36+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2763 :: 		Image36.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image36+10)
MOVT	R0, #hi_addr(_Image36+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2764 :: 		Image36.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image36+12)
MOVT	R0, #hi_addr(_Image36+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2765 :: 		Image36.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image36+22)
MOVT	R0, #hi_addr(_Image36+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2766 :: 		Image36.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image36+23)
MOVT	R0, #hi_addr(_Image36+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2767 :: 		Image36.Picture_Name    = img54_jpg;
MOVW	R1, #lo_addr(_img54_jpg+0)
MOVT	R1, #hi_addr(_img54_jpg+0)
MOVW	R0, #lo_addr(_Image36+16)
MOVT	R0, #hi_addr(_Image36+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2768 :: 		Image36.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image36+20)
MOVT	R0, #hi_addr(_Image36+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2769 :: 		Image36.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image36+21)
MOVT	R0, #hi_addr(_Image36+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2770 :: 		Image36.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image36+24)
MOVT	R0, #hi_addr(_Image36+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2771 :: 		Image36.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image36+28)
MOVT	R0, #hi_addr(_Image36+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2772 :: 		Image36.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image36+32)
MOVT	R0, #hi_addr(_Image36+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2773 :: 		Image36.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image36+36)
MOVT	R0, #hi_addr(_Image36+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2775 :: 		Image37.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image37+0)
MOVT	R0, #hi_addr(_Image37+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2776 :: 		Image37.Order           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Image37+4)
MOVT	R0, #hi_addr(_Image37+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2777 :: 		Image37.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image37+6)
MOVT	R0, #hi_addr(_Image37+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2778 :: 		Image37.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image37+8)
MOVT	R0, #hi_addr(_Image37+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2779 :: 		Image37.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image37+10)
MOVT	R0, #hi_addr(_Image37+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2780 :: 		Image37.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image37+12)
MOVT	R0, #hi_addr(_Image37+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2781 :: 		Image37.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image37+22)
MOVT	R0, #hi_addr(_Image37+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2782 :: 		Image37.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image37+23)
MOVT	R0, #hi_addr(_Image37+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2783 :: 		Image37.Picture_Name    = img57_jpg;
MOVW	R1, #lo_addr(_img57_jpg+0)
MOVT	R1, #hi_addr(_img57_jpg+0)
MOVW	R0, #lo_addr(_Image37+16)
MOVT	R0, #hi_addr(_Image37+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2784 :: 		Image37.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image37+20)
MOVT	R0, #hi_addr(_Image37+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2785 :: 		Image37.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image37+21)
MOVT	R0, #hi_addr(_Image37+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2786 :: 		Image37.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image37+24)
MOVT	R0, #hi_addr(_Image37+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2787 :: 		Image37.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image37+28)
MOVT	R0, #hi_addr(_Image37+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2788 :: 		Image37.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image37+32)
MOVT	R0, #hi_addr(_Image37+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2789 :: 		Image37.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image37+36)
MOVT	R0, #hi_addr(_Image37+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2791 :: 		Image38.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image38+0)
MOVT	R0, #hi_addr(_Image38+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2792 :: 		Image38.Order           = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Image38+4)
MOVT	R0, #hi_addr(_Image38+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2793 :: 		Image38.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image38+6)
MOVT	R0, #hi_addr(_Image38+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2794 :: 		Image38.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image38+8)
MOVT	R0, #hi_addr(_Image38+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2795 :: 		Image38.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image38+10)
MOVT	R0, #hi_addr(_Image38+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2796 :: 		Image38.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image38+12)
MOVT	R0, #hi_addr(_Image38+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2797 :: 		Image38.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image38+22)
MOVT	R0, #hi_addr(_Image38+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2798 :: 		Image38.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image38+23)
MOVT	R0, #hi_addr(_Image38+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2799 :: 		Image38.Picture_Name    = img60_jpg;
MOVW	R1, #lo_addr(_img60_jpg+0)
MOVT	R1, #hi_addr(_img60_jpg+0)
MOVW	R0, #lo_addr(_Image38+16)
MOVT	R0, #hi_addr(_Image38+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2800 :: 		Image38.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image38+20)
MOVT	R0, #hi_addr(_Image38+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2801 :: 		Image38.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image38+21)
MOVT	R0, #hi_addr(_Image38+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2802 :: 		Image38.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image38+24)
MOVT	R0, #hi_addr(_Image38+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2803 :: 		Image38.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image38+28)
MOVT	R0, #hi_addr(_Image38+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2804 :: 		Image38.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image38+32)
MOVT	R0, #hi_addr(_Image38+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2805 :: 		Image38.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image38+36)
MOVT	R0, #hi_addr(_Image38+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2807 :: 		Image39.OwnerScreen     = &Boot;
MOVW	R1, #lo_addr(_Boot+0)
MOVT	R1, #hi_addr(_Boot+0)
MOVW	R0, #lo_addr(_Image39+0)
MOVT	R0, #hi_addr(_Image39+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2808 :: 		Image39.Order           = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Image39+4)
MOVT	R0, #hi_addr(_Image39+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2809 :: 		Image39.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+6)
MOVT	R0, #hi_addr(_Image39+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2810 :: 		Image39.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+8)
MOVT	R0, #hi_addr(_Image39+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2811 :: 		Image39.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image39+10)
MOVT	R0, #hi_addr(_Image39+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2812 :: 		Image39.Height          = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Image39+12)
MOVT	R0, #hi_addr(_Image39+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2813 :: 		Image39.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image39+22)
MOVT	R0, #hi_addr(_Image39+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2814 :: 		Image39.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image39+23)
MOVT	R0, #hi_addr(_Image39+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2815 :: 		Image39.Picture_Name    = img63_jpg;
MOVW	R1, #lo_addr(_img63_jpg+0)
MOVT	R1, #hi_addr(_img63_jpg+0)
MOVW	R0, #lo_addr(_Image39+16)
MOVT	R0, #hi_addr(_Image39+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2816 :: 		Image39.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image39+20)
MOVT	R0, #hi_addr(_Image39+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2817 :: 		Image39.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image39+21)
MOVT	R0, #hi_addr(_Image39+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2818 :: 		Image39.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+24)
MOVT	R0, #hi_addr(_Image39+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2819 :: 		Image39.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+28)
MOVT	R0, #hi_addr(_Image39+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2820 :: 		Image39.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+32)
MOVT	R0, #hi_addr(_Image39+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2821 :: 		Image39.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image39+36)
MOVT	R0, #hi_addr(_Image39+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2822 :: 		}
L_end_InitializeObjects:
BX	LR
; end of mikromedia_STM32plus_driver_InitializeObjects
mikromedia_STM32plus_driver_IsInsideObject:
;mikromedia_STM32plus_driver.c,2824 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
; Top start address is: 12 (R3)
; Left start address is: 8 (R2)
; Y start address is: 4 (R1)
; Top end address is: 12 (R3)
; Left end address is: 8 (R2)
; Y end address is: 4 (R1)
; Y start address is: 4 (R1)
; Left start address is: 8 (R2)
; Top start address is: 12 (R3)
; Width start address is: 20 (R5)
LDRH	R5, [SP, #0]
; Height start address is: 24 (R6)
LDRH	R6, [SP, #4]
;mikromedia_STM32plus_driver.c,2825 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
CMP	R2, R0
IT	HI
BHI	L_mikromedia_STM32plus_driver_IsInsideObject141
ADDS	R4, R2, R5
UXTH	R4, R4
; Left end address is: 8 (R2)
; Width end address is: 20 (R5)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R0
IT	CC
BCC	L_mikromedia_STM32plus_driver_IsInsideObject140
;mikromedia_STM32plus_driver.c,2826 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
CMP	R3, R1
IT	HI
BHI	L_mikromedia_STM32plus_driver_IsInsideObject139
ADDS	R4, R3, R6
UXTH	R4, R4
; Top end address is: 12 (R3)
; Height end address is: 24 (R6)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R1
IT	CC
BCC	L_mikromedia_STM32plus_driver_IsInsideObject138
; Y end address is: 4 (R1)
L_mikromedia_STM32plus_driver_IsInsideObject137:
;mikromedia_STM32plus_driver.c,2827 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_IsInsideObject
;mikromedia_STM32plus_driver.c,2825 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
L_mikromedia_STM32plus_driver_IsInsideObject141:
L_mikromedia_STM32plus_driver_IsInsideObject140:
;mikromedia_STM32plus_driver.c,2826 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
L_mikromedia_STM32plus_driver_IsInsideObject139:
L_mikromedia_STM32plus_driver_IsInsideObject138:
;mikromedia_STM32plus_driver.c,2829 :: 		return 0;
MOVS	R0, #0
;mikromedia_STM32plus_driver.c,2830 :: 		}
L_end_IsInsideObject:
BX	LR
; end of mikromedia_STM32plus_driver_IsInsideObject
_DrawLabel:
;mikromedia_STM32plus_driver.c,2839 :: 		void DrawLabel(TLabel *ALabel) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R5, R0
; ALabel start address is: 20 (R5)
;mikromedia_STM32plus_driver.c,2840 :: 		if (ALabel->Visible == 1) {
ADDW	R1, R5, #26
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawLabel4
;mikromedia_STM32plus_driver.c,2841 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
ADDW	R1, R5, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R5, #20
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
;mikromedia_STM32plus_driver.c,2842 :: 		TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
ADDW	R1, R5, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R5, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R5, #16
; ALabel end address is: 20 (R5)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;mikromedia_STM32plus_driver.c,2843 :: 		}
L_DrawLabel4:
;mikromedia_STM32plus_driver.c,2844 :: 		}
L_end_DrawLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawLabel
_DrawImage:
;mikromedia_STM32plus_driver.c,2846 :: 		void DrawImage(TImage *AImage) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;mikromedia_STM32plus_driver.c,2847 :: 		if (AImage->Visible) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawImage5
;mikromedia_STM32plus_driver.c,2848 :: 		if (AImage->Picture_Type == 0)
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawImage6
;mikromedia_STM32plus_driver.c,2849 :: 		TFT_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
ADDW	R1, R0, #23
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
MOV	R3, R1
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTH	R1, R2
MOV	R2, R3
UXTB	R3, R4
BL	_TFT_Image+0
LDR	R0, [SP, #4]
L_DrawImage6:
;mikromedia_STM32plus_driver.c,2850 :: 		if (AImage->Picture_Type == 1)
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawImage7
;mikromedia_STM32plus_driver.c,2851 :: 		TFT_Image_Jpeg(AImage->Left, AImage->Top, AImage->Picture_Name);
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
MOV	R3, R1
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
MOV	R2, R3
BL	_TFT_Image_Jpeg+0
L_DrawImage7:
;mikromedia_STM32plus_driver.c,2852 :: 		}
L_DrawImage5:
;mikromedia_STM32plus_driver.c,2853 :: 		}
L_end_DrawImage:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawImage
_DrawCircle:
;mikromedia_STM32plus_driver.c,2855 :: 		void DrawCircle(TCircle *ACircle) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;mikromedia_STM32plus_driver.c,2856 :: 		if (ACircle->Visible == 1) {
ADDW	R1, R0, #16
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircle8
;mikromedia_STM32plus_driver.c,2857 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircle9
;mikromedia_STM32plus_driver.c,2858 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,2860 :: 		ACircle->Gradient_End_Color, ACircle->Gradient_Start_Color);
ADDW	R1, R0, #22
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R5, R1
;mikromedia_STM32plus_driver.c,2859 :: 		TFT_Set_Brush(ACircle->Transparent, ACircle->Press_Color, ACircle->Gradient, ACircle->Gradient_Orientation,
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #19
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #30
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;mikromedia_STM32plus_driver.c,2860 :: 		ACircle->Gradient_End_Color, ACircle->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;mikromedia_STM32plus_driver.c,2859 :: 		TFT_Set_Brush(ACircle->Transparent, ACircle->Press_Color, ACircle->Gradient, ACircle->Gradient_Orientation,
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,2861 :: 		}
IT	AL
BAL	L_DrawCircle10
L_DrawCircle9:
;mikromedia_STM32plus_driver.c,2864 :: 		ACircle->Gradient_Start_Color, ACircle->Gradient_End_Color);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #22
LDRH	R1, [R1, #0]
UXTH	R5, R1
;mikromedia_STM32plus_driver.c,2863 :: 		TFT_Set_Brush(ACircle->Transparent, ACircle->Color, ACircle->Gradient, ACircle->Gradient_Orientation,
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #19
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;mikromedia_STM32plus_driver.c,2864 :: 		ACircle->Gradient_Start_Color, ACircle->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;mikromedia_STM32plus_driver.c,2863 :: 		TFT_Set_Brush(ACircle->Transparent, ACircle->Color, ACircle->Gradient, ACircle->Gradient_Orientation,
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,2865 :: 		}
L_DrawCircle10:
;mikromedia_STM32plus_driver.c,2866 :: 		TFT_Set_Pen(ACircle->Pen_Color, ACircle->Pen_Width);
ADDW	R1, R0, #12
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #14
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,2869 :: 		ACircle->Radius);
ADDW	R1, R0, #10
LDRH	R4, [R1, #0]
SXTH	R3, R4
;mikromedia_STM32plus_driver.c,2868 :: 		ACircle->Top + ACircle->Radius,
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R2, R1, R4
;mikromedia_STM32plus_driver.c,2867 :: 		TFT_Circle(ACircle->Left + ACircle->Radius,
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, R4
SXTH	R0, R1
;mikromedia_STM32plus_driver.c,2868 :: 		ACircle->Top + ACircle->Radius,
SXTH	R1, R2
;mikromedia_STM32plus_driver.c,2869 :: 		ACircle->Radius);
SXTH	R2, R3
BL	_TFT_Circle+0
;mikromedia_STM32plus_driver.c,2870 :: 		}
L_DrawCircle8:
;mikromedia_STM32plus_driver.c,2871 :: 		}
L_end_DrawCircle:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawCircle
_DrawBox:
;mikromedia_STM32plus_driver.c,2873 :: 		void DrawBox(TBox *ABox) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;mikromedia_STM32plus_driver.c,2874 :: 		if (ABox->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawBox11
;mikromedia_STM32plus_driver.c,2875 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawBox12
;mikromedia_STM32plus_driver.c,2876 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,2877 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,2878 :: 		}
IT	AL
BAL	L_DrawBox13
L_DrawBox12:
;mikromedia_STM32plus_driver.c,2880 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #28
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,2881 :: 		}
L_DrawBox13:
;mikromedia_STM32plus_driver.c,2882 :: 		TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,2883 :: 		TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #1
SXTH	R2, R2
SXTH	R1, R4
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
;mikromedia_STM32plus_driver.c,2884 :: 		}
L_DrawBox11:
;mikromedia_STM32plus_driver.c,2885 :: 		}
L_end_DrawBox:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawBox
_DrawScreen:
;mikromedia_STM32plus_driver.c,2887 :: 		void DrawScreen(TScreen *aScreen) {
SUB	SP, SP, #56
STR	LR, [SP, #0]
;mikromedia_STM32plus_driver.c,2899 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,2900 :: 		order = 0;
MOVS	R1, #0
STRH	R1, [SP, #4]
;mikromedia_STM32plus_driver.c,2901 :: 		label_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #6]
;mikromedia_STM32plus_driver.c,2902 :: 		image_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #12]
;mikromedia_STM32plus_driver.c,2903 :: 		circle_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #20]
;mikromedia_STM32plus_driver.c,2904 :: 		box_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #28]
;mikromedia_STM32plus_driver.c,2905 :: 		CurrentScreen = aScreen;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
STR	R0, [R1, #0]
;mikromedia_STM32plus_driver.c,2907 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
ADDS	R1, R0, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen144
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen143
IT	AL
BAL	L_DrawScreen16
L__DrawScreen144:
L__DrawScreen143:
;mikromedia_STM32plus_driver.c,2908 :: 		save_bled = TFT_BLED;
MOVW	R2, #lo_addr(GPIOF_ODR+0)
MOVT	R2, #hi_addr(GPIOF_ODR+0)
STR	R2, [SP, #52]
LDR	R1, [R2, #0]
STRB	R1, [SP, #36]
;mikromedia_STM32plus_driver.c,2909 :: 		TFT_BLED           = 0;
MOVS	R1, #0
SXTB	R1, R1
STR	R1, [R2, #0]
;mikromedia_STM32plus_driver.c,2910 :: 		TFT_Set_Active(&TFT_mikromedia_Set_Index, &TFT_mikromedia_Write_Command, &TFT_Write_to_16bitPort);
MOVW	R2, #lo_addr(_TFT_Write_to_16bitPort+0)
MOVT	R2, #hi_addr(_TFT_Write_to_16bitPort+0)
MOVW	R1, #lo_addr(_TFT_mikromedia_Write_Command+0)
MOVT	R1, #hi_addr(_TFT_mikromedia_Write_Command+0)
MOVW	R0, #lo_addr(_TFT_mikromedia_Set_Index+0)
MOVT	R0, #hi_addr(_TFT_mikromedia_Set_Index+0)
BL	_TFT_Set_Active+0
;mikromedia_STM32plus_driver.c,2911 :: 		TFT_Init_SSD1963(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
STR	R3, [SP, #48]
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_TFT_Init_SSD1963+0
;mikromedia_STM32plus_driver.c,2912 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;mikromedia_STM32plus_driver.c,2913 :: 		STMPE610_SetSize(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_STMPE610_SetSize+0
;mikromedia_STM32plus_driver.c,2914 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
;mikromedia_STM32plus_driver.c,2915 :: 		display_width = CurrentScreen->Width;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
STRH	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,2916 :: 		display_height = CurrentScreen->Height;
LDR	R1, [SP, #48]
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
STRH	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,2917 :: 		TFT_BLED           = save_bled;
LDRB	R2, [SP, #36]
LDR	R1, [SP, #52]
STR	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,2918 :: 		}
IT	AL
BAL	L_DrawScreen17
L_DrawScreen16:
;mikromedia_STM32plus_driver.c,2920 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
L_DrawScreen17:
;mikromedia_STM32plus_driver.c,2923 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen18:
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #6
LDRH	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen19
;mikromedia_STM32plus_driver.c,2924 :: 		if (label_idx < CurrentScreen->LabelsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #8
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #6]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen20
;mikromedia_STM32plus_driver.c,2925 :: 		local_label = GetLabel(label_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #12
LDR	R2, [R1, #0]
LDRB	R1, [SP, #6]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #8]
;mikromedia_STM32plus_driver.c,2926 :: 		if (order == local_label->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen21
;mikromedia_STM32plus_driver.c,2927 :: 		label_idx++;
LDRB	R1, [SP, #6]
ADDS	R1, R1, #1
STRB	R1, [SP, #6]
;mikromedia_STM32plus_driver.c,2928 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;mikromedia_STM32plus_driver.c,2929 :: 		DrawLabel(local_label);
LDR	R0, [SP, #8]
BL	_DrawLabel+0
;mikromedia_STM32plus_driver.c,2930 :: 		}
L_DrawScreen21:
;mikromedia_STM32plus_driver.c,2931 :: 		}
L_DrawScreen20:
;mikromedia_STM32plus_driver.c,2933 :: 		if (circle_idx < CurrentScreen->CirclesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #24
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #20]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen22
;mikromedia_STM32plus_driver.c,2934 :: 		local_circle = GetCircle(circle_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #28
LDR	R2, [R1, #0]
LDRB	R1, [SP, #20]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #24]
;mikromedia_STM32plus_driver.c,2935 :: 		if (order == local_circle->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen23
;mikromedia_STM32plus_driver.c,2936 :: 		circle_idx++;
LDRB	R1, [SP, #20]
ADDS	R1, R1, #1
STRB	R1, [SP, #20]
;mikromedia_STM32plus_driver.c,2937 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;mikromedia_STM32plus_driver.c,2938 :: 		DrawCircle(local_circle);
LDR	R0, [SP, #24]
BL	_DrawCircle+0
;mikromedia_STM32plus_driver.c,2939 :: 		}
L_DrawScreen23:
;mikromedia_STM32plus_driver.c,2940 :: 		}
L_DrawScreen22:
;mikromedia_STM32plus_driver.c,2942 :: 		if (box_idx < CurrentScreen->BoxesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #32
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #28]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen24
;mikromedia_STM32plus_driver.c,2943 :: 		local_box = GetBox(box_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #36
LDR	R2, [R1, #0]
LDRB	R1, [SP, #28]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #32]
;mikromedia_STM32plus_driver.c,2944 :: 		if (order == local_box->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen25
;mikromedia_STM32plus_driver.c,2945 :: 		box_idx++;
LDRB	R1, [SP, #28]
ADDS	R1, R1, #1
STRB	R1, [SP, #28]
;mikromedia_STM32plus_driver.c,2946 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;mikromedia_STM32plus_driver.c,2947 :: 		DrawBox(local_box);
LDR	R0, [SP, #32]
BL	_DrawBox+0
;mikromedia_STM32plus_driver.c,2948 :: 		}
L_DrawScreen25:
;mikromedia_STM32plus_driver.c,2949 :: 		}
L_DrawScreen24:
;mikromedia_STM32plus_driver.c,2951 :: 		if (image_idx < CurrentScreen->ImagesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #16
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #12]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen26
;mikromedia_STM32plus_driver.c,2952 :: 		local_image = GetImage(image_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #20
LDR	R2, [R1, #0]
LDRB	R1, [SP, #12]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #16]
;mikromedia_STM32plus_driver.c,2953 :: 		if (order == local_image->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen27
;mikromedia_STM32plus_driver.c,2954 :: 		image_idx++;
LDRB	R1, [SP, #12]
ADDS	R1, R1, #1
STRB	R1, [SP, #12]
;mikromedia_STM32plus_driver.c,2955 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;mikromedia_STM32plus_driver.c,2956 :: 		DrawImage(local_image);
LDR	R0, [SP, #16]
BL	_DrawImage+0
;mikromedia_STM32plus_driver.c,2957 :: 		}
L_DrawScreen27:
;mikromedia_STM32plus_driver.c,2958 :: 		}
L_DrawScreen26:
;mikromedia_STM32plus_driver.c,2960 :: 		}
IT	AL
BAL	L_DrawScreen18
L_DrawScreen19:
;mikromedia_STM32plus_driver.c,2961 :: 		}
L_end_DrawScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #56
BX	LR
; end of _DrawScreen
_Get_Object:
;mikromedia_STM32plus_driver.c,2963 :: 		void Get_Object(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; Y start address is: 4 (R1)
;mikromedia_STM32plus_driver.c,2964 :: 		label_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,2965 :: 		image_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,2966 :: 		circle_order        = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,2967 :: 		box_order           = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,2969 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 4 (R1)
UXTH	R8, R0
UXTH	R7, R1
L_Get_Object28:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object29
;mikromedia_STM32plus_driver.c,2970 :: 		local_label = GetLabel(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #12
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_label+0)
MOVT	R2, #hi_addr(_local_label+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,2971 :: 		if (local_label->Active == 1) {
ADDW	R2, R3, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object31
;mikromedia_STM32plus_driver.c,2973 :: 		local_label->Width, local_label->Height) == 1) {
MOVW	R6, #lo_addr(_local_label+0)
MOVT	R6, #hi_addr(_local_label+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;mikromedia_STM32plus_driver.c,2972 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;mikromedia_STM32plus_driver.c,2973 :: 		local_label->Width, local_label->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	mikromedia_STM32plus_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object32
;mikromedia_STM32plus_driver.c,2974 :: 		label_order = local_label->Order;
MOVW	R4, #lo_addr(_local_label+0)
MOVT	R4, #hi_addr(_local_label+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,2975 :: 		exec_label = local_label;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,2976 :: 		}
L_Get_Object32:
;mikromedia_STM32plus_driver.c,2977 :: 		}
L_Get_Object31:
;mikromedia_STM32plus_driver.c,2969 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;mikromedia_STM32plus_driver.c,2978 :: 		}
IT	AL
BAL	L_Get_Object28
L_Get_Object29:
;mikromedia_STM32plus_driver.c,2981 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object33:
; X start address is: 28 (R7)
; Y start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #16
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object34
;mikromedia_STM32plus_driver.c,2982 :: 		local_image = GetImage(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #20
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_image+0)
MOVT	R2, #hi_addr(_local_image+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,2983 :: 		if (local_image->Active == 1) {
ADDW	R2, R3, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object36
;mikromedia_STM32plus_driver.c,2985 :: 		local_image->Width, local_image->Height) == 1) {
MOVW	R6, #lo_addr(_local_image+0)
MOVT	R6, #hi_addr(_local_image+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;mikromedia_STM32plus_driver.c,2984 :: 		if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;mikromedia_STM32plus_driver.c,2985 :: 		local_image->Width, local_image->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	mikromedia_STM32plus_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object37
;mikromedia_STM32plus_driver.c,2986 :: 		image_order = local_image->Order;
MOVW	R4, #lo_addr(_local_image+0)
MOVT	R4, #hi_addr(_local_image+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,2987 :: 		exec_image = local_image;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,2988 :: 		}
L_Get_Object37:
;mikromedia_STM32plus_driver.c,2989 :: 		}
L_Get_Object36:
;mikromedia_STM32plus_driver.c,2981 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;mikromedia_STM32plus_driver.c,2990 :: 		}
IT	AL
BAL	L_Get_Object33
L_Get_Object34:
;mikromedia_STM32plus_driver.c,2993 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CirclesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
L_Get_Object38:
; Y start address is: 32 (R8)
; X start address is: 28 (R7)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #24
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object39
;mikromedia_STM32plus_driver.c,2994 :: 		local_circle = GetCircle(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_circle+0)
MOVT	R2, #hi_addr(_local_circle+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,2995 :: 		if (local_circle->Active == 1) {
ADDW	R2, R3, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object41
;mikromedia_STM32plus_driver.c,2997 :: 		(local_circle->Radius * 2), (local_circle->Radius * 2)) == 1) {
MOVW	R5, #lo_addr(_local_circle+0)
MOVT	R5, #hi_addr(_local_circle+0)
LDR	R2, [R5, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
LSLS	R4, R2, #1
UXTH	R4, R4
;mikromedia_STM32plus_driver.c,2996 :: 		if (IsInsideObject(X, Y, local_circle->Left, local_circle->Top,
MOV	R2, R5
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R5
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;mikromedia_STM32plus_driver.c,2997 :: 		(local_circle->Radius * 2), (local_circle->Radius * 2)) == 1) {
PUSH	(R4)
PUSH	(R4)
BL	mikromedia_STM32plus_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object42
;mikromedia_STM32plus_driver.c,2998 :: 		circle_order = local_circle->Order;
MOVW	R4, #lo_addr(_local_circle+0)
MOVT	R4, #hi_addr(_local_circle+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,2999 :: 		exec_circle = local_circle;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3000 :: 		}
L_Get_Object42:
;mikromedia_STM32plus_driver.c,3001 :: 		}
L_Get_Object41:
;mikromedia_STM32plus_driver.c,2993 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CirclesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;mikromedia_STM32plus_driver.c,3002 :: 		}
IT	AL
BAL	L_Get_Object38
L_Get_Object39:
;mikromedia_STM32plus_driver.c,3005 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object43:
; X start address is: 28 (R7)
; X end address is: 28 (R7)
; Y start address is: 32 (R8)
; Y end address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #32
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object44
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
;mikromedia_STM32plus_driver.c,3006 :: 		local_box = GetBox(_object_count);
; Y start address is: 32 (R8)
; X start address is: 28 (R7)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #36
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_box+0)
MOVT	R2, #hi_addr(_local_box+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3007 :: 		if (local_box->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object46
;mikromedia_STM32plus_driver.c,3009 :: 		local_box->Width, local_box->Height) == 1) {
MOVW	R6, #lo_addr(_local_box+0)
MOVT	R6, #hi_addr(_local_box+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;mikromedia_STM32plus_driver.c,3008 :: 		if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;mikromedia_STM32plus_driver.c,3009 :: 		local_box->Width, local_box->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	mikromedia_STM32plus_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object47
;mikromedia_STM32plus_driver.c,3010 :: 		box_order = local_box->Order;
MOVW	R4, #lo_addr(_local_box+0)
MOVT	R4, #hi_addr(_local_box+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3011 :: 		exec_box = local_box;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3012 :: 		}
L_Get_Object47:
;mikromedia_STM32plus_driver.c,3013 :: 		}
L_Get_Object46:
;mikromedia_STM32plus_driver.c,3005 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;mikromedia_STM32plus_driver.c,3014 :: 		}
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
IT	AL
BAL	L_Get_Object43
L_Get_Object44:
;mikromedia_STM32plus_driver.c,3016 :: 		_object_count = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3017 :: 		if (label_order >  _object_count )
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	LE
BLE	L_Get_Object48
;mikromedia_STM32plus_driver.c,3018 :: 		_object_count = label_order;
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object48:
;mikromedia_STM32plus_driver.c,3019 :: 		if (image_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object49
;mikromedia_STM32plus_driver.c,3020 :: 		_object_count = image_order;
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object49:
;mikromedia_STM32plus_driver.c,3021 :: 		if (circle_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object50
;mikromedia_STM32plus_driver.c,3022 :: 		_object_count = circle_order;
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object50:
;mikromedia_STM32plus_driver.c,3023 :: 		if (box_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object51
;mikromedia_STM32plus_driver.c,3024 :: 		_object_count = box_order;
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object51:
;mikromedia_STM32plus_driver.c,3025 :: 		}
L_end_Get_Object:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Get_Object
mikromedia_STM32plus_driver_Process_TP_Press:
;mikromedia_STM32plus_driver.c,3028 :: 		static void Process_TP_Press(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; Y start address is: 4 (R1)
;mikromedia_STM32plus_driver.c,3029 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3030 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3031 :: 		exec_circle         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3032 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3034 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
BL	_Get_Object+0
;mikromedia_STM32plus_driver.c,3036 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Press52
;mikromedia_STM32plus_driver.c,3037 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Press53
;mikromedia_STM32plus_driver.c,3038 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Press54
;mikromedia_STM32plus_driver.c,3039 :: 		if (exec_label->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Press55
;mikromedia_STM32plus_driver.c,3040 :: 		exec_label->OnPressPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;mikromedia_STM32plus_driver.c,3041 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;mikromedia_STM32plus_driver.c,3042 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Press55:
;mikromedia_STM32plus_driver.c,3043 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Press54:
;mikromedia_STM32plus_driver.c,3044 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Press53:
;mikromedia_STM32plus_driver.c,3046 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Press56
;mikromedia_STM32plus_driver.c,3047 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Press57
;mikromedia_STM32plus_driver.c,3048 :: 		if (exec_image->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Press58
;mikromedia_STM32plus_driver.c,3049 :: 		exec_image->OnPressPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;mikromedia_STM32plus_driver.c,3050 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;mikromedia_STM32plus_driver.c,3051 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Press58:
;mikromedia_STM32plus_driver.c,3052 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Press57:
;mikromedia_STM32plus_driver.c,3053 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Press56:
;mikromedia_STM32plus_driver.c,3055 :: 		if (_object_count == circle_order) {
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Press59
;mikromedia_STM32plus_driver.c,3056 :: 		if (exec_circle->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Press60
;mikromedia_STM32plus_driver.c,3057 :: 		if (exec_circle->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Press61
;mikromedia_STM32plus_driver.c,3058 :: 		exec_circle->OnPressPtr();
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
;mikromedia_STM32plus_driver.c,3059 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;mikromedia_STM32plus_driver.c,3060 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Press61:
;mikromedia_STM32plus_driver.c,3061 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Press60:
;mikromedia_STM32plus_driver.c,3062 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Press59:
;mikromedia_STM32plus_driver.c,3064 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Press62
;mikromedia_STM32plus_driver.c,3065 :: 		if (exec_box->Active == 1) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Press63
;mikromedia_STM32plus_driver.c,3066 :: 		if (exec_box->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Press64
;mikromedia_STM32plus_driver.c,3067 :: 		exec_box->OnPressPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R2, [R4, #0]
BLX	R2
;mikromedia_STM32plus_driver.c,3068 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;mikromedia_STM32plus_driver.c,3069 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Press64:
;mikromedia_STM32plus_driver.c,3070 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Press63:
;mikromedia_STM32plus_driver.c,3071 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Press62:
;mikromedia_STM32plus_driver.c,3073 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Press52:
;mikromedia_STM32plus_driver.c,3074 :: 		}
L_end_Process_TP_Press:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of mikromedia_STM32plus_driver_Process_TP_Press
mikromedia_STM32plus_driver_Process_TP_Up:
;mikromedia_STM32plus_driver.c,3076 :: 		static void Process_TP_Up(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; Y start address is: 4 (R1)
;mikromedia_STM32plus_driver.c,3078 :: 		switch (PressedObjectType) {
IT	AL
BAL	L_mikromedia_STM32plus_driver_Process_TP_Up65
;mikromedia_STM32plus_driver.c,3080 :: 		case 4: {
L_mikromedia_STM32plus_driver_Process_TP_Up67:
;mikromedia_STM32plus_driver.c,3081 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Up68
;mikromedia_STM32plus_driver.c,3082 :: 		exec_circle = (TCircle*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3083 :: 		if ((exec_circle->PressColEnabled == 1) && (exec_circle->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Up148
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Up147
L_mikromedia_STM32plus_driver_Process_TP_Up146:
;mikromedia_STM32plus_driver.c,3084 :: 		DrawCircle(exec_circle);
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawCircle+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;mikromedia_STM32plus_driver.c,3083 :: 		if ((exec_circle->PressColEnabled == 1) && (exec_circle->OwnerScreen == CurrentScreen)) {
L_mikromedia_STM32plus_driver_Process_TP_Up148:
L_mikromedia_STM32plus_driver_Process_TP_Up147:
;mikromedia_STM32plus_driver.c,3086 :: 		break;
IT	AL
BAL	L_mikromedia_STM32plus_driver_Process_TP_Up66
;mikromedia_STM32plus_driver.c,3087 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Up68:
;mikromedia_STM32plus_driver.c,3088 :: 		break;
IT	AL
BAL	L_mikromedia_STM32plus_driver_Process_TP_Up66
;mikromedia_STM32plus_driver.c,3091 :: 		case 6: {
L_mikromedia_STM32plus_driver_Process_TP_Up72:
;mikromedia_STM32plus_driver.c,3092 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Up73
;mikromedia_STM32plus_driver.c,3093 :: 		exec_box = (TBox*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3094 :: 		if ((exec_box->PressColEnabled == 1) && (exec_box->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Up150
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Up149
L_mikromedia_STM32plus_driver_Process_TP_Up145:
;mikromedia_STM32plus_driver.c,3095 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawBox+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;mikromedia_STM32plus_driver.c,3094 :: 		if ((exec_box->PressColEnabled == 1) && (exec_box->OwnerScreen == CurrentScreen)) {
L_mikromedia_STM32plus_driver_Process_TP_Up150:
L_mikromedia_STM32plus_driver_Process_TP_Up149:
;mikromedia_STM32plus_driver.c,3097 :: 		break;
IT	AL
BAL	L_mikromedia_STM32plus_driver_Process_TP_Up66
;mikromedia_STM32plus_driver.c,3098 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Up73:
;mikromedia_STM32plus_driver.c,3099 :: 		break;
IT	AL
BAL	L_mikromedia_STM32plus_driver_Process_TP_Up66
;mikromedia_STM32plus_driver.c,3101 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Up65:
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #4
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Up67
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #6
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Up72
; Y end address is: 4 (R1)
L_mikromedia_STM32plus_driver_Process_TP_Up66:
;mikromedia_STM32plus_driver.c,3103 :: 		exec_label          = 0;
; Y start address is: 4 (R1)
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3104 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3106 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
BL	_Get_Object+0
;mikromedia_STM32plus_driver.c,3109 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Up77
;mikromedia_STM32plus_driver.c,3111 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Up78
;mikromedia_STM32plus_driver.c,3112 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Up79
;mikromedia_STM32plus_driver.c,3113 :: 		if (exec_label->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Up80
;mikromedia_STM32plus_driver.c,3114 :: 		exec_label->OnUpPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
L_mikromedia_STM32plus_driver_Process_TP_Up80:
;mikromedia_STM32plus_driver.c,3115 :: 		if (PressedObject == (void *)exec_label)
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Up81
;mikromedia_STM32plus_driver.c,3116 :: 		if (exec_label->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Up82
;mikromedia_STM32plus_driver.c,3117 :: 		exec_label->OnClickPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_mikromedia_STM32plus_driver_Process_TP_Up82:
L_mikromedia_STM32plus_driver_Process_TP_Up81:
;mikromedia_STM32plus_driver.c,3118 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3119 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3120 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;mikromedia_STM32plus_driver.c,3121 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Up79:
;mikromedia_STM32plus_driver.c,3122 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Up78:
;mikromedia_STM32plus_driver.c,3125 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Up83
;mikromedia_STM32plus_driver.c,3126 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Up84
;mikromedia_STM32plus_driver.c,3127 :: 		if (exec_image->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Up85
;mikromedia_STM32plus_driver.c,3128 :: 		exec_image->OnUpPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R2, [R4, #0]
BLX	R2
L_mikromedia_STM32plus_driver_Process_TP_Up85:
;mikromedia_STM32plus_driver.c,3129 :: 		if (PressedObject == (void *)exec_image)
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Up86
;mikromedia_STM32plus_driver.c,3130 :: 		if (exec_image->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Up87
;mikromedia_STM32plus_driver.c,3131 :: 		exec_image->OnClickPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_mikromedia_STM32plus_driver_Process_TP_Up87:
L_mikromedia_STM32plus_driver_Process_TP_Up86:
;mikromedia_STM32plus_driver.c,3132 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3133 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3134 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;mikromedia_STM32plus_driver.c,3135 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Up84:
;mikromedia_STM32plus_driver.c,3136 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Up83:
;mikromedia_STM32plus_driver.c,3139 :: 		if (_object_count == circle_order) {
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Up88
;mikromedia_STM32plus_driver.c,3140 :: 		if (exec_circle->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Up89
;mikromedia_STM32plus_driver.c,3141 :: 		if (exec_circle->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Up90
;mikromedia_STM32plus_driver.c,3142 :: 		exec_circle->OnUpPtr();
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_mikromedia_STM32plus_driver_Process_TP_Up90:
;mikromedia_STM32plus_driver.c,3143 :: 		if (PressedObject == (void *)exec_circle)
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Up91
;mikromedia_STM32plus_driver.c,3144 :: 		if (exec_circle->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Up92
;mikromedia_STM32plus_driver.c,3145 :: 		exec_circle->OnClickPtr();
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
L_mikromedia_STM32plus_driver_Process_TP_Up92:
L_mikromedia_STM32plus_driver_Process_TP_Up91:
;mikromedia_STM32plus_driver.c,3146 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3147 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3148 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;mikromedia_STM32plus_driver.c,3149 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Up89:
;mikromedia_STM32plus_driver.c,3150 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Up88:
;mikromedia_STM32plus_driver.c,3153 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Up93
;mikromedia_STM32plus_driver.c,3154 :: 		if (exec_box->Active == 1) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Up94
;mikromedia_STM32plus_driver.c,3155 :: 		if (exec_box->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Up95
;mikromedia_STM32plus_driver.c,3156 :: 		exec_box->OnUpPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_mikromedia_STM32plus_driver_Process_TP_Up95:
;mikromedia_STM32plus_driver.c,3157 :: 		if (PressedObject == (void *)exec_box)
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Up96
;mikromedia_STM32plus_driver.c,3158 :: 		if (exec_box->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Up97
;mikromedia_STM32plus_driver.c,3159 :: 		exec_box->OnClickPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
L_mikromedia_STM32plus_driver_Process_TP_Up97:
L_mikromedia_STM32plus_driver_Process_TP_Up96:
;mikromedia_STM32plus_driver.c,3160 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3161 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3162 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;mikromedia_STM32plus_driver.c,3163 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Up94:
;mikromedia_STM32plus_driver.c,3164 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Up93:
;mikromedia_STM32plus_driver.c,3166 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Up77:
;mikromedia_STM32plus_driver.c,3167 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3168 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3169 :: 		}
L_end_Process_TP_Up:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of mikromedia_STM32plus_driver_Process_TP_Up
mikromedia_STM32plus_driver_Process_TP_Down:
;mikromedia_STM32plus_driver.c,3171 :: 		static void Process_TP_Down(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; Y start address is: 4 (R1)
;mikromedia_STM32plus_driver.c,3173 :: 		object_pressed      = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3174 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3175 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3176 :: 		exec_circle         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3177 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3179 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
BL	_Get_Object+0
;mikromedia_STM32plus_driver.c,3181 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Down98
;mikromedia_STM32plus_driver.c,3182 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Down99
;mikromedia_STM32plus_driver.c,3183 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Down100
;mikromedia_STM32plus_driver.c,3184 :: 		PressedObject = (void *)exec_label;
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3185 :: 		PressedObjectType = 2;
MOVS	R3, #2
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3186 :: 		if (exec_label->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Down101
;mikromedia_STM32plus_driver.c,3187 :: 		exec_label->OnDownPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
;mikromedia_STM32plus_driver.c,3188 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;mikromedia_STM32plus_driver.c,3189 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Down101:
;mikromedia_STM32plus_driver.c,3190 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Down100:
;mikromedia_STM32plus_driver.c,3191 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Down99:
;mikromedia_STM32plus_driver.c,3193 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Down102
;mikromedia_STM32plus_driver.c,3194 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Down103
;mikromedia_STM32plus_driver.c,3195 :: 		PressedObject = (void *)exec_image;
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3196 :: 		PressedObjectType = 3;
MOVS	R3, #3
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3197 :: 		if (exec_image->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Down104
;mikromedia_STM32plus_driver.c,3198 :: 		exec_image->OnDownPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
;mikromedia_STM32plus_driver.c,3199 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;mikromedia_STM32plus_driver.c,3200 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Down104:
;mikromedia_STM32plus_driver.c,3201 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Down103:
;mikromedia_STM32plus_driver.c,3202 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Down102:
;mikromedia_STM32plus_driver.c,3204 :: 		if (_object_count == circle_order) {
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Down105
;mikromedia_STM32plus_driver.c,3205 :: 		if (exec_circle->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Down106
;mikromedia_STM32plus_driver.c,3206 :: 		if (exec_circle->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Down107
;mikromedia_STM32plus_driver.c,3207 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3208 :: 		DrawCircle(exec_circle);
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawCircle+0
;mikromedia_STM32plus_driver.c,3209 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Down107:
;mikromedia_STM32plus_driver.c,3210 :: 		PressedObject = (void *)exec_circle;
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3211 :: 		PressedObjectType = 4;
MOVS	R3, #4
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3212 :: 		if (exec_circle->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Down108
;mikromedia_STM32plus_driver.c,3213 :: 		exec_circle->OnDownPtr();
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;mikromedia_STM32plus_driver.c,3214 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;mikromedia_STM32plus_driver.c,3215 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Down108:
;mikromedia_STM32plus_driver.c,3216 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Down106:
;mikromedia_STM32plus_driver.c,3217 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Down105:
;mikromedia_STM32plus_driver.c,3219 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Down109
;mikromedia_STM32plus_driver.c,3220 :: 		if (exec_box->Active == 1) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Down110
;mikromedia_STM32plus_driver.c,3221 :: 		if (exec_box->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_mikromedia_STM32plus_driver_Process_TP_Down111
;mikromedia_STM32plus_driver.c,3222 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3223 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawBox+0
;mikromedia_STM32plus_driver.c,3224 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Down111:
;mikromedia_STM32plus_driver.c,3225 :: 		PressedObject = (void *)exec_box;
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3226 :: 		PressedObjectType = 6;
MOVS	R3, #6
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,3227 :: 		if (exec_box->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_mikromedia_STM32plus_driver_Process_TP_Down112
;mikromedia_STM32plus_driver.c,3228 :: 		exec_box->OnDownPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;mikromedia_STM32plus_driver.c,3229 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;mikromedia_STM32plus_driver.c,3230 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Down112:
;mikromedia_STM32plus_driver.c,3231 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Down110:
;mikromedia_STM32plus_driver.c,3232 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Down109:
;mikromedia_STM32plus_driver.c,3234 :: 		}
L_mikromedia_STM32plus_driver_Process_TP_Down98:
;mikromedia_STM32plus_driver.c,3235 :: 		}
L_end_Process_TP_Down:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of mikromedia_STM32plus_driver_Process_TP_Down
_Check_TP:
;mikromedia_STM32plus_driver.c,3237 :: 		void Check_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_driver.c,3238 :: 		if (STMPE610_PressDetect()) {
BL	_STMPE610_PressDetect+0
CMP	R0, #0
IT	EQ
BEQ	L_Check_TP113
;mikromedia_STM32plus_driver.c,3240 :: 		if (STMPE610_GetLastCoordinates(&Xcoord, &Ycoord) == 0) {
MOVW	R1, #lo_addr(_Ycoord+0)
MOVT	R1, #hi_addr(_Ycoord+0)
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
BL	_STMPE610_GetLastCoordinates+0
CMP	R0, #0
IT	NE
BNE	L_Check_TP114
;mikromedia_STM32plus_driver.c,3241 :: 		Process_TP_Press(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	mikromedia_STM32plus_driver_Process_TP_Press+0
;mikromedia_STM32plus_driver.c,3242 :: 		if (PenDown == 0) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Check_TP115
;mikromedia_STM32plus_driver.c,3243 :: 		PenDown = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3244 :: 		Process_TP_Down(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	mikromedia_STM32plus_driver_Process_TP_Down+0
;mikromedia_STM32plus_driver.c,3245 :: 		}
L_Check_TP115:
;mikromedia_STM32plus_driver.c,3246 :: 		}
L_Check_TP114:
;mikromedia_STM32plus_driver.c,3247 :: 		}
IT	AL
BAL	L_Check_TP116
L_Check_TP113:
;mikromedia_STM32plus_driver.c,3248 :: 		else if (PenDown == 1) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Check_TP117
;mikromedia_STM32plus_driver.c,3249 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3250 :: 		Process_TP_Up(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	mikromedia_STM32plus_driver_Process_TP_Up+0
;mikromedia_STM32plus_driver.c,3251 :: 		}
L_Check_TP117:
L_Check_TP116:
;mikromedia_STM32plus_driver.c,3252 :: 		}
L_end_Check_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Check_TP
_Init_MCU:
;mikromedia_STM32plus_driver.c,3254 :: 		void Init_MCU() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_driver.c,3256 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;mikromedia_STM32plus_driver.c,3257 :: 		for (_cnt = 0; _cnt < 20; _cnt++) {
; _cnt start address is: 8 (R2)
MOVS	R2, #0
; _cnt end address is: 8 (R2)
L_Init_MCU118:
; _cnt start address is: 8 (R2)
CMP	R2, #20
IT	CS
BCS	L_Init_MCU119
;mikromedia_STM32plus_driver.c,3258 :: 		GPIOB_ODR.B6 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3259 :: 		Delay_ms(1);
MOVW	R7, #49998
MOVT	R7, #0
NOP
NOP
L_Init_MCU121:
SUBS	R7, R7, #1
BNE	L_Init_MCU121
NOP
NOP
NOP
;mikromedia_STM32plus_driver.c,3260 :: 		GPIOB_ODR.B6 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3261 :: 		Delay_ms(1);
MOVW	R7, #49998
MOVT	R7, #0
NOP
NOP
L_Init_MCU123:
SUBS	R7, R7, #1
BNE	L_Init_MCU123
NOP
NOP
NOP
;mikromedia_STM32plus_driver.c,3257 :: 		for (_cnt = 0; _cnt < 20; _cnt++) {
ADDS	R2, R2, #1
UXTB	R2, R2
;mikromedia_STM32plus_driver.c,3262 :: 		}
; _cnt end address is: 8 (R2)
IT	AL
BAL	L_Init_MCU118
L_Init_MCU119:
;mikromedia_STM32plus_driver.c,3264 :: 		GPIO_Digital_Output(&GPIOF_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Output+0
;mikromedia_STM32plus_driver.c,3265 :: 		for (_cnt = 0; _cnt < 20; _cnt++) {
; _cnt start address is: 8 (R2)
MOVS	R2, #0
; _cnt end address is: 8 (R2)
L_Init_MCU125:
; _cnt start address is: 8 (R2)
CMP	R2, #20
IT	CS
BCS	L_Init_MCU126
;mikromedia_STM32plus_driver.c,3266 :: 		GPIOB_ODR.B1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3267 :: 		Delay_ms(1);
MOVW	R7, #49998
MOVT	R7, #0
NOP
NOP
L_Init_MCU128:
SUBS	R7, R7, #1
BNE	L_Init_MCU128
NOP
NOP
NOP
;mikromedia_STM32plus_driver.c,3268 :: 		GPIOB_ODR.B1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3269 :: 		Delay_ms(1);
MOVW	R7, #49998
MOVT	R7, #0
NOP
NOP
L_Init_MCU130:
SUBS	R7, R7, #1
BNE	L_Init_MCU130
NOP
NOP
NOP
;mikromedia_STM32plus_driver.c,3265 :: 		for (_cnt = 0; _cnt < 20; _cnt++) {
ADDS	R2, R2, #1
UXTB	R2, R2
;mikromedia_STM32plus_driver.c,3270 :: 		}
; _cnt end address is: 8 (R2)
IT	AL
BAL	L_Init_MCU125
L_Init_MCU126:
;mikromedia_STM32plus_driver.c,3272 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_I2C2_PF01);
MOVW	R0, #lo_addr(__GPIO_MODULE_I2C2_PF01+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_I2C2_PF01+0)
BL	_GPIO_Alternate_Function_Enable+0
;mikromedia_STM32plus_driver.c,3275 :: 		I2C1_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB67);
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVW	R0, #6784
MOVT	R0, #6
BL	_I2C1_Init_Advanced+0
;mikromedia_STM32plus_driver.c,3276 :: 		I2C2_Init_Advanced(400000, &_GPIO_MODULE_I2C2_PF01);
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C2_PF01+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C2_PF01+0)
MOVW	R0, #6784
MOVT	R0, #6
BL	_I2C2_Init_Advanced+0
;mikromedia_STM32plus_driver.c,3277 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;mikromedia_STM32plus_driver.c,3278 :: 		GPIO_Digital_Output(&GPIOG_BASE, 0x00FF);
MOVS	R1, #255
MOVW	R0, #lo_addr(GPIOG_BASE+0)
MOVT	R0, #hi_addr(GPIOG_BASE+0)
BL	_GPIO_Digital_Output+0
;mikromedia_STM32plus_driver.c,3279 :: 		GPIO_Digital_Output(&GPIOE_BASE, 0xFF00);
MOVW	R1, #65280
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;mikromedia_STM32plus_driver.c,3280 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;mikromedia_STM32plus_driver.c,3281 :: 		GPIOB_ODR.B4 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3282 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;mikromedia_STM32plus_driver.c,3283 :: 		TFT_Set_MM_Plus();
BL	_TFT_Set_MM_Plus+0
;mikromedia_STM32plus_driver.c,3284 :: 		STMPE610_SetDefaultMode();
BL	_STMPE610_SetDefaultMode+0
;mikromedia_STM32plus_driver.c,3285 :: 		}
L_end_Init_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_MCU
_STMPE610_Config:
;mikromedia_STM32plus_driver.c,3287 :: 		char STMPE610_Config() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_driver.c,3288 :: 		STMPE610_SetI2CAddress(STMPE610_I2C_ADDR1);
MOVS	R0, #136
BL	_STMPE610_SetI2CAddress+0
;mikromedia_STM32plus_driver.c,3289 :: 		if(STMPE610_IsOperational()) {
BL	_STMPE610_IsOperational+0
CMP	R0, #0
IT	EQ
BEQ	L_STMPE610_Config132
;mikromedia_STM32plus_driver.c,3290 :: 		return STMPE610_IO_NOT_OPERATIONAL;
MOVS	R0, #4
IT	AL
BAL	L_end_STMPE610_Config
;mikromedia_STM32plus_driver.c,3291 :: 		}
L_STMPE610_Config132:
;mikromedia_STM32plus_driver.c,3293 :: 		STMPE610_Reset();
BL	_STMPE610_Reset+0
;mikromedia_STM32plus_driver.c,3294 :: 		STMPE610_Module(STMPE610_MODULE_TS | STMPE610_MODULE_ADC, STMPE610_ENABLE);
MOVS	R1, #1
MOVS	R0, #3
BL	_STMPE610_Module+0
;mikromedia_STM32plus_driver.c,3295 :: 		STMPE610_AlternateFunction(STMPE610_GPIO_PIN1, STMPE610_ENABLE);
MOVS	R1, #1
MOVS	R0, #2
BL	_STMPE610_AlternateFunction+0
;mikromedia_STM32plus_driver.c,3296 :: 		STMPE610_SetGPIOPin(STMPE610_GPIO_PIN1, 0);   // IN1 to "0" -> I2C communication
MOVS	R1, #0
MOVS	R0, #2
BL	_STMPE610_SetGPIOPin+0
;mikromedia_STM32plus_driver.c,3297 :: 		STMPE610_SetSize(480,272);
MOVW	R1, #272
MOVW	R0, #480
BL	_STMPE610_SetSize+0
;mikromedia_STM32plus_driver.c,3298 :: 		STMPE610_Module(STMPE610_MODULE_TS | STMPE610_MODULE_ADC, STMPE610_ENABLE);
MOVS	R1, #1
MOVS	R0, #3
BL	_STMPE610_Module+0
;mikromedia_STM32plus_driver.c,3299 :: 		STMPE610_EnableInterrupt(STMPE610_IE_TOUCH_DET | STMPE610_IE_FIFO_TH | STMPE610_IE_FIFO_0FLOW, STMPE610_ENABLE);
MOVS	R1, #1
MOVS	R0, #7
BL	_STMPE610_EnableInterrupt+0
;mikromedia_STM32plus_driver.c,3300 :: 		STMPE610_ConfigureInterrupt(STMPE610_INT_POLARITY_ACTIVE_HIGH | STMPE610_INT_TYPE_EDGE | STMPE610_INT_ENABLE_ALL);
MOVS	R0, #7
BL	_STMPE610_ConfigureInterrupt+0
;mikromedia_STM32plus_driver.c,3301 :: 		STMPE610_SetADC(STMPE610_ADC_CTRL1_SAMPLETIME_44 | STMPE610_ADC_CTRL1_ADC_10BIT | STMPE610_ADC_CTRL1_INT_REFERENCE);
MOVS	R0, #16
BL	_STMPE610_SetADC+0
;mikromedia_STM32plus_driver.c,3302 :: 		Delay_10ms(); Delay_10ms();
BL	_Delay_10ms+0
BL	_Delay_10ms+0
;mikromedia_STM32plus_driver.c,3303 :: 		STMPE610_SetADCClock(STMPE610_ADC_CTRL2_6500_kHZ);
MOVS	R0, #2
BL	_STMPE610_SetADCClock+0
;mikromedia_STM32plus_driver.c,3304 :: 		STMPE610_AlternateFunction(STMPE610_GPIO_PIN4 | STMPE610_GPIO_PIN5 | STMPE610_GPIO_PIN6 | STMPE610_GPIO_PIN7, STMPE610_DISABLE);
MOVS	R1, #0
MOVS	R0, #240
BL	_STMPE610_AlternateFunction+0
;mikromedia_STM32plus_driver.c,3305 :: 		STMPE610_ConfigureTSC(STMPE610_TSC_CFG_AVE_CTRL_8S, STMPE610_TSC_CFG_TOUCH_DET_DELAY_500uS, STMPE610_TSC_CFG_TOUCH_SETTLING_500uS);
MOVS	R2, #2
MOVS	R1, #24
MOVS	R0, #192
BL	_STMPE610_ConfigureTSC+0
;mikromedia_STM32plus_driver.c,3306 :: 		STMPE610_SetFIFOThreshold(1);
MOVS	R0, #1
BL	_STMPE610_SetFIFOThreshold+0
;mikromedia_STM32plus_driver.c,3307 :: 		STMPE610_ResetFIFO();
BL	_STMPE610_ResetFIFO+0
;mikromedia_STM32plus_driver.c,3308 :: 		STMPE610_TSIDrive(STMPE610_TSC_I_DRIVE_20mA);
MOVS	R0, #0
BL	_STMPE610_TSIDrive+0
;mikromedia_STM32plus_driver.c,3309 :: 		STMPE610_TSControl(STMPE610_TSC_CTRL_TRACK0 | STMPE610_TSC_CTRL_ACQU_XYZ | STMPE610_TSC_CTRL_ENABLE);
MOVS	R0, #1
BL	_STMPE610_TSControl+0
;mikromedia_STM32plus_driver.c,3310 :: 		STMPE610_ZDataFraction(STMPE610_FRACP4_WHOLP4);
MOVS	R0, #4
BL	_STMPE610_ZDataFraction+0
;mikromedia_STM32plus_driver.c,3311 :: 		STMPE610_SetTouchPressureThreshold(45);
MOVS	R0, #45
BL	_STMPE610_SetTouchPressureThreshold+0
;mikromedia_STM32plus_driver.c,3312 :: 		STMPE610_ClearInterrupts();
BL	_STMPE610_ClearInterrupts+0
;mikromedia_STM32plus_driver.c,3313 :: 		STMPE610_WriteReg(STMPE610_INT_CTRL_REG, 0x01);
MOVS	R1, #1
MOVS	R0, #9
BL	_STMPE610_WriteReg+0
;mikromedia_STM32plus_driver.c,3314 :: 		return STMPE610_OK;
MOVS	R0, #0
;mikromedia_STM32plus_driver.c,3315 :: 		}
L_end_STMPE610_Config:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _STMPE610_Config
_Start_TP:
;mikromedia_STM32plus_driver.c,3318 :: 		void Start_TP() {
SUB	SP, SP, #16
STR	LR, [SP, #0]
;mikromedia_STM32plus_driver.c,3320 :: 		Init_MCU();
BL	_Init_MCU+0
;mikromedia_STM32plus_driver.c,3322 :: 		InitializeTouchPanel();
BL	mikromedia_STM32plus_driver_InitializeTouchPanel+0
;mikromedia_STM32plus_driver.c,3323 :: 		if (STMPE610_Config() == STMPE610_OK) {
BL	_STMPE610_Config+0
CMP	R0, #0
IT	NE
BNE	L_Start_TP133
;mikromedia_STM32plus_driver.c,3324 :: 		} else {
IT	AL
BAL	L_Start_TP134
L_Start_TP133:
;mikromedia_STM32plus_driver.c,3325 :: 		while(1);
L_Start_TP135:
IT	AL
BAL	L_Start_TP135
;mikromedia_STM32plus_driver.c,3326 :: 		}
L_Start_TP134:
;mikromedia_STM32plus_driver.c,3330 :: 		TPConstsStruct.X_Min = 105;
MOVS	R0, #105
STRH	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,3331 :: 		TPConstsStruct.X_Max = 3925;
MOVW	R0, #3925
STRH	R0, [SP, #6]
;mikromedia_STM32plus_driver.c,3332 :: 		TPConstsStruct.Y_Min = 250;
MOVS	R0, #250
STRH	R0, [SP, #8]
;mikromedia_STM32plus_driver.c,3333 :: 		TPConstsStruct.Y_Max = 3820;
MOVW	R0, #3820
STRH	R0, [SP, #10]
;mikromedia_STM32plus_driver.c,3334 :: 		TPConstsStruct.Rotate = 0;
MOVS	R0, #0
STRB	R0, [SP, #12]
;mikromedia_STM32plus_driver.c,3335 :: 		STMPE610_SetCalibrationConsts(&TPConstsStruct);
ADD	R0, SP, #4
BL	_STMPE610_SetCalibrationConsts+0
;mikromedia_STM32plus_driver.c,3337 :: 		InitializeObjects();
BL	mikromedia_STM32plus_driver_InitializeObjects+0
;mikromedia_STM32plus_driver.c,3338 :: 		display_width = Boot.Width;
MOVW	R0, #lo_addr(_Boot+2)
MOVT	R0, #hi_addr(_Boot+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_width+0)
MOVT	R0, #hi_addr(_display_width+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3339 :: 		display_height = Boot.Height;
MOVW	R0, #lo_addr(_Boot+4)
MOVT	R0, #hi_addr(_Boot+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_height+0)
MOVT	R0, #hi_addr(_display_height+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3340 :: 		DrawScreen(&Boot);
MOVW	R0, #lo_addr(_Boot+0)
MOVT	R0, #hi_addr(_Boot+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_driver.c,3341 :: 		}
L_end_Start_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _Start_TP
mikromedia_STM32plus_driver____?ag:
L_end_mikromedia_STM32plus_driver___?ag:
BX	LR
; end of mikromedia_STM32plus_driver____?ag
