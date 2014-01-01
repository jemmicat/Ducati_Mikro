_Init_GPIO:
;Init_routines.c,55 :: 		void Init_GPIO(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Init_routines.c,57 :: 		Sound_Init(&GPIOB_ODR, 8);
MOVS	R1, #8
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
BL	_Sound_Init+0
;Init_routines.c,60 :: 		GPIO_Digital_Output(&GPIOG_BASE, _GPIO_PINMASK_15);
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOG_BASE+0)
MOVT	R0, #hi_addr(GPIOG_BASE+0)
BL	_GPIO_Digital_Output+0
;Init_routines.c,61 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4);
MOVS	R1, #24
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;Init_routines.c,64 :: 		Power_Man_Init();
BL	_Power_Man_Init+0
;Init_routines.c,67 :: 		Fat_Initialized_Flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Fat_Initialized_Flag+0)
MOVT	R0, #hi_addr(_Fat_Initialized_Flag+0)
STRB	R1, [R0, #0]
;Init_routines.c,68 :: 		Ext_res_initialized = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Ext_res_initialized+0)
MOVT	R0, #hi_addr(_Ext_res_initialized+0)
STRB	R1, [R0, #0]
;Init_routines.c,69 :: 		Ext_fhandle = 0xFF;
MOVS	R1, #255
SXTB	R1, R1
MOVW	R0, #lo_addr(_Ext_fhandle+0)
MOVT	R0, #hi_addr(_Ext_fhandle+0)
STRB	R1, [R0, #0]
;Init_routines.c,70 :: 		}
L_end_Init_GPIO:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_GPIO
_Init_SDIO:
;Init_routines.c,79 :: 		void Init_SDIO(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Init_routines.c,81 :: 		SDIO_Reset();
BL	_SDIO_Reset+0
;Init_routines.c,82 :: 		Ext_res_initialized = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Ext_res_initialized+0)
MOVT	R0, #hi_addr(_Ext_res_initialized+0)
STRB	R1, [R0, #0]
;Init_routines.c,83 :: 		Fat_Initialized_Flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Fat_Initialized_Flag+0)
MOVT	R0, #hi_addr(_Fat_Initialized_Flag+0)
STRB	R1, [R0, #0]
;Init_routines.c,84 :: 		Ext_fhandle = 0xFF;
MOVS	R1, #255
SXTB	R1, R1
MOVW	R0, #lo_addr(_Ext_fhandle+0)
MOVT	R0, #hi_addr(_Ext_fhandle+0)
STRB	R1, [R0, #0]
;Init_routines.c,87 :: 		| _SDIO_CFG_CLOCK_RISING_EDGE | _SDIO_CFG_HW_FLOW_DISABLE, 125, &_GPIO_MODULE_SDIO_D0_D3);
MOVW	R2, #lo_addr(__GPIO_MODULE_SDIO_D0_D3+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SDIO_D0_D3+0)
MOVS	R1, #125
MOVW	R0, #2048
BL	_SDIO_Init+0
;Init_routines.c,90 :: 		GPIOD_PUPDRbits.PUPDR2 = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOD_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOD_PUPDRbits+0)
LDRB	R0, [R1, #0]
BFI	R0, R2, #4, #2
STRB	R0, [R1, #0]
;Init_routines.c,91 :: 		GPIOC_PUPDRbits.PUPDR8 = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOC_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOC_PUPDRbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #16, #2
STR	R0, [R1, #0]
;Init_routines.c,92 :: 		GPIOC_PUPDRbits.PUPDR9 = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOC_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOC_PUPDRbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #18, #2
STR	R0, [R1, #0]
;Init_routines.c,93 :: 		GPIOC_PUPDRbits.PUPDR10 = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOC_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOC_PUPDRbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #20, #2
STR	R0, [R1, #0]
;Init_routines.c,94 :: 		GPIOC_PUPDRbits.PUPDR11 = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOC_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOC_PUPDRbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #22, #2
STR	R0, [R1, #0]
;Init_routines.c,96 :: 		Mmc_Set_Interface(_MMC_INTERFACE_SDIO);
MOVS	R0, #1
BL	_Mmc_Set_Interface+0
;Init_routines.c,97 :: 		}
L_end_Init_SDIO:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_SDIO
_MyTFT_Get_Data:
;Init_routines.c,108 :: 		char* MyTFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num) {
SUB	SP, SP, #16
STR	LR, [SP, #0]
STR	R1, [SP, #8]
STR	R2, [SP, #12]
;Init_routines.c,112 :: 		FAT32_Seek(Ext_fhandle, offset);
MOVW	R3, #lo_addr(_Ext_fhandle+0)
MOVT	R3, #hi_addr(_Ext_fhandle+0)
LDRSB	R3, [R3, #0]
STR	R0, [SP, #4]
MOV	R1, R0
SXTB	R0, R3
BL	_FAT32_Seek+0
LDR	R0, [SP, #4]
;Init_routines.c,113 :: 		pos = (unsigned long)offset%512;
MOVW	R3, #511
AND	R3, R0, R3, LSL #0
UXTH	R0, R3
;Init_routines.c,114 :: 		FAT32_Read(Ext_fhandle, My_Ext_Data_Buffer, 512);
MOVW	R3, #lo_addr(_Ext_fhandle+0)
MOVT	R3, #hi_addr(_Ext_fhandle+0)
LDRSB	R3, [R3, #0]
STRH	R0, [SP, #4]
MOVW	R2, #512
MOVW	R1, #lo_addr(_My_Ext_Data_Buffer+0)
MOVT	R1, #hi_addr(_My_Ext_Data_Buffer+0)
SXTB	R0, R3
BL	_FAT32_Read+0
LDRH	R0, [SP, #4]
;Init_routines.c,116 :: 		if(count>512-pos)
RSB	R4, R0, #512
UXTH	R4, R4
LDR	R3, [SP, #8]
CMP	R3, R4
IT	LS
BLS	L_MyTFT_Get_Data0
;Init_routines.c,117 :: 		*num = 512-pos;
RSB	R4, R0, #512
UXTH	R4, R4
LDR	R3, [SP, #12]
STR	R4, [R3, #0]
IT	AL
BAL	L_MyTFT_Get_Data1
L_MyTFT_Get_Data0:
;Init_routines.c,119 :: 		*num = count;
LDR	R4, [SP, #8]
LDR	R3, [SP, #12]
STR	R4, [R3, #0]
L_MyTFT_Get_Data1:
;Init_routines.c,121 :: 		return My_Ext_Data_Buffer;
MOVW	R0, #lo_addr(_My_Ext_Data_Buffer+0)
MOVT	R0, #hi_addr(_My_Ext_Data_Buffer+0)
;Init_routines.c,122 :: 		}
L_end_MyTFT_Get_Data:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _MyTFT_Get_Data
_Init_FAT:
;Init_routines.c,132 :: 		char Init_FAT(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Init_routines.c,133 :: 		char FAT_cnt = 0;
; FAT_cnt start address is: 8 (R2)
MOVS	R2, #0
;Init_routines.c,134 :: 		if (MMC_Card_Detect == 0){
MOVW	R1, #lo_addr(GPIOD_IDR+0)
MOVT	R1, #hi_addr(GPIOD_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_Init_FAT2
;Init_routines.c,135 :: 		if (Fat_Initialized_Flag == 0){
MOVW	R0, #lo_addr(_Fat_Initialized_Flag+0)
MOVT	R0, #hi_addr(_Fat_Initialized_Flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Init_FAT3
; FAT_cnt end address is: 8 (R2)
UXTB	R1, R2
;Init_routines.c,136 :: 		while ((Fat32_Init() != 0) && (FAT_cnt < 5))
L_Init_FAT4:
; FAT_cnt start address is: 4 (R1)
STRB	R1, [SP, #4]
BL	_FAT32_Init+0
LDRB	R1, [SP, #4]
CMP	R0, #0
IT	EQ
BEQ	L__Init_FAT13
CMP	R1, #5
IT	CS
BCS	L__Init_FAT12
L__Init_FAT11:
;Init_routines.c,137 :: 		Fat_cnt ++;
ADDS	R1, R1, #1
UXTB	R1, R1
IT	AL
BAL	L_Init_FAT4
;Init_routines.c,136 :: 		while ((Fat32_Init() != 0) && (FAT_cnt < 5))
L__Init_FAT13:
L__Init_FAT12:
;Init_routines.c,138 :: 		if (FAT_cnt < 5){
CMP	R1, #5
IT	CS
BCS	L_Init_FAT8
; FAT_cnt end address is: 4 (R1)
;Init_routines.c,140 :: 		| _SDIO_CFG_CLOCK_RISING_EDGE | _SDIO_CFG_HW_FLOW_DISABLE, 1, &_GPIO_MODULE_SDIO_D0_D3);
MOVW	R2, #lo_addr(__GPIO_MODULE_SDIO_D0_D3+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SDIO_D0_D3+0)
MOVS	R1, #1
MOVW	R0, #2048
BL	_SDIO_Init+0
;Init_routines.c,141 :: 		Fat_Initialized_Flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Fat_Initialized_Flag+0)
MOVT	R0, #hi_addr(_Fat_Initialized_Flag+0)
STRB	R1, [R0, #0]
;Init_routines.c,142 :: 		}
L_Init_FAT8:
;Init_routines.c,143 :: 		}
L_Init_FAT3:
;Init_routines.c,144 :: 		if (Ext_res_initialized == 0){
MOVW	R0, #lo_addr(_Ext_res_initialized+0)
MOVT	R0, #hi_addr(_Ext_res_initialized+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Init_FAT9
;Init_routines.c,145 :: 		TFT_Set_Ext_Buffer(MyTFT_Get_Data);
MOVW	R0, #lo_addr(_MyTFT_Get_Data+0)
MOVT	R0, #hi_addr(_MyTFT_Get_Data+0)
BL	_TFT_Set_Ext_Buffer+0
;Init_routines.c,146 :: 		Ext_fhandle = FAT32_Open("Ext_reso.RES", 1);
MOVW	R0, #lo_addr(?lstr1_Init_routines+0)
MOVT	R0, #hi_addr(?lstr1_Init_routines+0)
MOVS	R1, #1
BL	_FAT32_Open+0
MOVW	R1, #lo_addr(_Ext_fhandle+0)
MOVT	R1, #hi_addr(_Ext_fhandle+0)
STRB	R0, [R1, #0]
;Init_routines.c,147 :: 		if (Ext_fhandle != 0xFF)
CMP	R0, #255
IT	EQ
BEQ	L_Init_FAT10
;Init_routines.c,148 :: 		Ext_res_initialized = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Ext_res_initialized+0)
MOVT	R0, #hi_addr(_Ext_res_initialized+0)
STRB	R1, [R0, #0]
L_Init_FAT10:
;Init_routines.c,149 :: 		}
L_Init_FAT9:
;Init_routines.c,150 :: 		}
L_Init_FAT2:
;Init_routines.c,152 :: 		return Ext_res_initialized;
MOVW	R0, #lo_addr(_Ext_res_initialized+0)
MOVT	R0, #hi_addr(_Ext_res_initialized+0)
LDRB	R0, [R0, #0]
;Init_routines.c,153 :: 		}
L_end_Init_FAT:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Init_FAT
