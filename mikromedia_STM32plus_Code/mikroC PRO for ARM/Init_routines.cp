#line 1 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Init_routines.c"






sbit LED_R at GPIOG_ODR.B15;
sbit LED_G at GPIOB_ODR.B3;
sbit LED_B at GPIOB_ODR.B4;


sbit Mmc_Chip_Select at GPIOD_ODR.B12;
sbit MMC_Card_Detect at GPIOD_IDR.B3;


sbit MP3_CS at GPIOD_ODR.B11;
sbit MP3_RST at GPIOD_ODR.B8;
sbit BSYNC at GPIOD_ODR.B10;
sbit DREQ at GPIOD_IDR.B9;


sbit nRF_CS at GPIOG_ODR.B9;
sbit nRF_CE at GPIOG_ODR.B12;
sbit nRF_IRQ at GPIOG_IDR.B10;


void Power_Man_Init();


char Fat_Initialized_Flag;
signed short Ext_fhandle;
char Ext_res_initialized;


const unsigned long arm_compilers_04_bmp = 0x00000008;
const unsigned long click_02_bmp = 0x00030FCE;
const unsigned long easymx_pro_stm32_05_bmp = 0x00092F5A;
const unsigned long game_table_bmp = 0x000C3F20;
const unsigned long mikromedia_stm32_07_bmp = 0x00111872;
const unsigned long mikromedia_stm32_09_bmp = 0x00142838;
const unsigned long mikroprog_stm32_10_bmp = 0x001A47C4;
const unsigned long mini_boards_12_bmp = 0x001D578A;
const unsigned long mp3_note_bmp = 0x00206750;
const unsigned long mp3_player_note_bmp = 0x0020A230;
const unsigned long rgb_bitmap_bmp = 0x002151EC;
const unsigned long visual_tft_03_bmp = 0x002461B2;
#line 55 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Init_routines.c"
void Init_GPIO(){

 Sound_Init(&GPIOB_ODR, 8);


 GPIO_Digital_Output(&GPIOG_BASE, _GPIO_PINMASK_15);
 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4);


 Power_Man_Init();


 Fat_Initialized_Flag = 0;
 Ext_res_initialized = 0;
 Ext_fhandle = 0xFF;
}
#line 79 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Init_routines.c"
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
unsigned long currentSector = -1, res_file_size;
#line 108 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Init_routines.c"
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
#line 132 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Init_routines.c"
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
