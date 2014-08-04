
//******************************************************************************
// hardware definitions
//******************************************************************************

// RGB Leds
sbit LED_R                     at GPIOG_ODR.B15;
sbit LED_G                     at GPIOB_ODR.B3;
sbit LED_B                     at GPIOB_ODR.B4;

// MMC Connections
//sbit Mmc_Chip_Select           at GPIOD_ODR.B12;
sbit MMC_Card_Detect           at GPIOD_IDR.B3;

// // MP3 Codec Connections
// sbit MP3_CS                    at GPIOD_ODR.B11;
// sbit MP3_RST                   at GPIOD_ODR.B8;
// sbit BSYNC                     at GPIOD_ODR.B10;
// sbit DREQ                      at GPIOD_IDR.B9;

// // nRF24L01+ connections
// sbit nRF_CS                    at GPIOG_ODR.B9;
// sbit nRF_CE                    at GPIOG_ODR.B12;
// sbit nRF_IRQ                   at GPIOG_IDR.B10;

// extern functions
void Power_Man_Init();
char ADXL345_Init();
void Scroll_Undone(unsigned int first, unsigned int last);
void Scroll(unsigned int scroll);

// global flags
char Fat_Initialized_Flag;
signed short Ext_fhandle;
char Ext_res_initialized;


/*******************************************************************************
* Function Init_GPIO()
* ------------------------------------------------------------------------------
* Overview: Function Initialize GPIO ports
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Init_GPIO(){
  // init piezo
  //Sound_Init(&GPIOB_ODR, 8);
  
  // init RGB
  GPIO_Digital_Output(&GPIOG_BASE, _GPIO_PINMASK_15);
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4);
  
  // Initiliaze Power management
  Power_Man_Init();
  
  // Set default values for flags
  Fat_Initialized_Flag = 0;
  Ext_res_initialized = 0;
  Ext_fhandle = 0xFF;
}


/*******************************************************************************
* Function Init_SDIO()
* ------------------------------------------------------------------------------
* Overview: Function Initialize SDIO for SD card usage
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Init_SDIO(){
    // Initialize SDIO
    SDIO_Reset();
    Ext_res_initialized = 0;
    Fat_Initialized_Flag = 0;
    Ext_fhandle = 0xFF;

    SDIO_Init(_SDIO_CFG_POWER_SAVE_DISABLE | _SDIO_CFG_4_WIDE_BUS_MODE | _SDIO_CFG_CLOCK_BYPASS_DISABLE
            | _SDIO_CFG_CLOCK_RISING_EDGE | _SDIO_CFG_HW_FLOW_DISABLE, 125, &_GPIO_MODULE_SDIO_D0_D3);

    // Set pull-ups on SDIO lines
    GPIOD_PUPDRbits.PUPDR2 = 1;
    GPIOC_PUPDRbits.PUPDR8 = 1;
    GPIOC_PUPDRbits.PUPDR9 = 1;
    GPIOC_PUPDRbits.PUPDR10 = 1;
    GPIOC_PUPDRbits.PUPDR11 = 1;

    Mmc_Set_Interface(_MMC_INTERFACE_SDIO);
}

char My_Ext_Data_Buffer[512];
//unsigned long currentSector = -1, res_file_size;
/*******************************************************************************
* Function MyTFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num)
* ------------------------------------------------------------------------------
* Overview: Function Sets Get Data Handler for FAT32 format
* Input: offset in RES file, number of bytes to read, number of read bytes
* Output: Pointer to desired position in buffer
*******************************************************************************/
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

/*******************************************************************************
* Function Init_FAT()
* ------------------------------------------------------------------------------
* Overview: Function Initialize FAT32 system
* Input: Nothing
* Output: 1 if external resources file successfully opened
*         0 if not successful
*******************************************************************************/
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

/*******************************************************************************
* Function ACCEL_Start()
* ------------------------------------------------------------------------------
* Overview: Function Initialize I2C bus and accel module
* Input: Nothing
* Output: test status: 0 - skiped; 1 - pass; 2 - fail
*******************************************************************************/
void I2C2_Set(char *test) {
  // Reset error flag
  *test = 0;

  // Initialize I2C communication
  I2C2_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB67);
  Delay_ms(100);
  // Initialize ADXL345 accelerometer
  if (ADXL345_Init() == 0) {
    *test = 1;
    Delay_ms(500);
  }
  else {
    *test = 2;
  }
  //Scroll_Undone(_SCROLL_ACCEL_FIRST_LINE, _SCROLL_ACCEL_LAST_LINE);
}