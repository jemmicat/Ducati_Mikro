#line 1 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Init_routines.c"






sbit LED_R at GPIOG_ODR.B15;
sbit LED_G at GPIOB_ODR.B3;
sbit LED_B at GPIOB_ODR.B4;



sbit MMC_Card_Detect at GPIOD_IDR.B3;
#line 27 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Init_routines.c"
void Power_Man_Init();
char ADXL345_Init();
void Scroll_Undone(unsigned int first, unsigned int last);
void Scroll(unsigned int scroll);


char Fat_Initialized_Flag;
signed short Ext_fhandle;
char Ext_res_initialized;
#line 45 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Init_routines.c"
void Init_GPIO(){




 GPIO_Digital_Output(&GPIOG_BASE, _GPIO_PINMASK_15);
 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4);


 Power_Man_Init();


 Fat_Initialized_Flag = 0;
 Ext_res_initialized = 0;
 Ext_fhandle = 0xFF;
}
#line 70 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Init_routines.c"
void Init_SDIO(){

 SDIO_Reset();
 Ext_res_initialized = 0;
 Fat_Initialized_Flag = 0;
 Ext_fhandle = 0xFF;

 SDIO_Init(_SDIO_CFG_POWER_SAVE_DISABLE | _SDIO_CFG_4_WIDE_BUS_MODE | _SDIO_CFG_CLOCK_BYPASS_DISABLE
 | _SDIO_CFG_CLOCK_RISING_EDGE | _SDIO_CFG_HW_FLOW_DISABLE, 125, &_GPIO_MODULE_SDIO_D0_D3);


 GPIOD_PUPDRbits.PUPDR2 = 1;
 GPIOC_PUPDRbits.PUPDR8 = 1;
 GPIOC_PUPDRbits.PUPDR9 = 1;
 GPIOC_PUPDRbits.PUPDR10 = 1;
 GPIOC_PUPDRbits.PUPDR11 = 1;

 Mmc_Set_Interface(_MMC_INTERFACE_SDIO);
}

char My_Ext_Data_Buffer[512];
#line 99 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Init_routines.c"
char* MyTFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num) {
unsigned long start_sector;
unsigned int pos;

 FAT32_Seek(Ext_fhandle, offset);
 pos = (unsigned long)offset%512;
 FAT32_Read(Ext_fhandle, My_Ext_Data_Buffer, 512);

 if(count>512-pos)
 *num = 512-pos;
 else
 *num = count;

 return My_Ext_Data_Buffer;
}
#line 123 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Init_routines.c"
char Init_FAT(){
char FAT_cnt = 0;
 if (MMC_Card_Detect == 0){
 if (Fat_Initialized_Flag == 0){
 while ((Fat32_Init() != 0) && (FAT_cnt < 5))
 Fat_cnt ++;
 if (FAT_cnt < 5){
 SDIO_Init(_SDIO_CFG_POWER_SAVE_DISABLE | _SDIO_CFG_4_WIDE_BUS_MODE | _SDIO_CFG_CLOCK_BYPASS_DISABLE
 | _SDIO_CFG_CLOCK_RISING_EDGE | _SDIO_CFG_HW_FLOW_DISABLE, 1, &_GPIO_MODULE_SDIO_D0_D3);
 Fat_Initialized_Flag = 1;
 }
 }
 if (Ext_res_initialized == 0){
 TFT_Set_Ext_Buffer(MyTFT_Get_Data);
 Ext_fhandle = FAT32_Open("Ext_reso.RES", 1);
 if (Ext_fhandle != 0xFF)
 Ext_res_initialized = 1;
 }
 }

 return Ext_res_initialized;
}
#line 153 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Init_routines.c"
void I2C2_Set(char *test) {

 *test = 0;


 I2C2_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB67);
 Delay_ms(100);

 if (ADXL345_Init() == 0) {
 *test = 1;
 Delay_ms(500);
 }
 else {
 *test = 2;
 }

}
