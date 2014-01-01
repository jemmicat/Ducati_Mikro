/**************************************************************************************************
* File: MP3_driver.c
* File Type: C - Source Code File
* Company: (c) mikroElektronika, 2011-2011
* Description:
*     This module contains a set of functions that are used for communication with
*     VS1053E mp3 codec.
* NOTES:
*     Mp3 codec use SPI bus to communicate with MCU.
**************************************************************************************************/
#include <built_in.h>

// VS1053E constants
const char WRITE_CODE           = 0x02;
const char READ_CODE            = 0x03;

const char SCI_BASE_ADDR        = 0x00;
const char SCI_MODE_ADDR        = 0x00;
const char SCI_STATUS_ADDR      = 0x01;
const char SCI_BASS_ADDR        = 0x02;
const char SCI_CLOCKF_ADDR      = 0x03;
const char SCI_DECODE_TIME_ADDR = 0x04;
const char SCI_AUDATA_ADDR      = 0x05;
const char SCI_WRAM_ADDR        = 0x06;
const char SCI_WRAMADDR_ADDR    = 0x07;
const char SCI_HDAT0_ADDR       = 0x08;
const char SCI_HDAT1_ADDR       = 0x09;
const char SCI_AIADDR_ADDR      = 0x0A;
const char SCI_VOL_ADDR         = 0x0B;
const char SCI_AICTRL0_ADDR     = 0x0C;
const char SCI_AICTRL1_ADDR     = 0x0D;
const char SCI_AICTRL2_ADDR     = 0x0E;
const char SCI_AICTRL3_ADDR     = 0x0F;

/**************************************************************************************************
* CODEC V1053E connections
**************************************************************************************************/
extern sfr sbit Mmc_Chip_Select;
extern sfr sbit MP3_CS;
extern sfr sbit MP3_RST;
extern sfr sbit BSYNC;
extern sfr sbit DREQ;

/**************************************************************************************************
* Function MP3_SCI_Write()
* -------------------------------------------------------------------------------------------------
* Overview: Function writes one byte to MP3 SCI
* Input: register address in codec, data
* Output: Nothing
**************************************************************************************************/
void MP3_SCI_Write(char address, unsigned int data_in) {
  BSYNC = 1;

  MP3_CS = 0;                    // select MP3 SCI
  SPI2_Write(WRITE_CODE);
  SPI2_Write(address);
  SPI2_Write(Hi(data_in));       // high byte
  SPI2_Write(Lo(data_in));       // low byte
  MP3_CS = 1;                    // deselect MP3 SCI
  while (DREQ == 0);             // wait until DREQ becomes 1, see MP3 codec datasheet, Serial Protocol for SCI
}

/**************************************************************************************************
* Function MP3_SCI_Read()
* -------------------------------------------------------------------------------------------------
* Overview: Function reads words_count words from MP3 SCI
* Input: start address, word count to be read
* Output: words are stored to data_buffer
**************************************************************************************************/
void MP3_SCI_Read(char start_address, char words_count, unsigned int *data_buffer) {
  unsigned int temp;

  MP3_CS = 0;                    // select MP3 SCI
  SPI2_Write(READ_CODE);
  SPI2_Write(start_address);

  while (words_count--) {        // read words_count words byte per byte
    temp = SPI2_Read(0);
    temp <<= 8;
    temp += SPI2_Read(0);
    *(data_buffer++) = temp;
  }
  MP3_CS = 1;                    // deselect MP3 SCI
  while (DREQ == 0);             // wait until DREQ becomes 1, see MP3 codec datasheet, Serial Protocol for SCI
}

/**************************************************************************************************
* Function MP3_SDI_Write()
* -------------------------------------------------------------------------------------------------
* Overview: Function write one byte to MP3 SDI
* Input: data to be writed
* Output: Nothing
**************************************************************************************************/
void MP3_SDI_Write(char data_) {

  MP3_CS = 1;
  BSYNC = 0;

  while (DREQ == 0);             // wait until DREQ becomes 1, see MP3 codec datasheet, Serial Protocol for SCI

  SPI2_Write(data_);
  BSYNC = 1;
}

/**************************************************************************************************
* Function MP3_Reset_Time()
* -------------------------------------------------------------------------------------------------
* Overview: Function resets decode time of the current song
* Input: Nothing
* Output: Nothing
**************************************************************************************************/
void MP3_Reset_Time(){
  MP3_SCI_Write(SCI_DECODE_TIME_ADDR, 0);
}

/**************************************************************************************************
* Function MP3_Get_Decode_Time()
* -------------------------------------------------------------------------------------------------
* Overview: Function resets decode time of the current song
* Input: Nothing
* Output: Nothing
**************************************************************************************************/
void MP3_Get_Decode_Time(unsigned int *time){
  MP3_SCI_Read(SCI_DECODE_TIME_ADDR, 1, time);
}

/**************************************************************************************************
* Function MP3_SDI_Write_32
* -------------------------------------------------------------------------------------------------
* Overview: Function Write 32 bytes to MP3 SDI
* Input: data buffer
* Output: Nothing
**************************************************************************************************/
void MP3_SDI_Write_32(char *data_) {
  char i;

  MP3_CS = 1;
  BSYNC = 0;

  while (DREQ == 0);             // wait until DREQ becomes 1, see MP3 codec datasheet, Serial Protocol for SCI

  for (i=0; i<32; i++)
  SPI2_Write(data_[i]);
  BSYNC = 1;
}

/**************************************************************************************************
* Function MP3_Set_Volume()
* -------------------------------------------------------------------------------------------------
* Overview: Function set volume on the left and right channel
* Input: left channel volume, right channel volume
* Output: Nothing
**************************************************************************************************/
void MP3_Set_Volume(char left, char right) {
  unsigned int volume;

  volume = (left<<8) + right;             // calculate value
  MP3_SCI_Write(SCI_VOL_ADDR, volume);    // Write value to VOL register
}

void MP3_Set_default_Mode(){
  BSYNC = 1;
  MP3_CS = 1;

  // Hardware reset
  MP3_RST = 0;
  Delay_ms(10);
  MP3_RST = 1;

  while (DREQ == 0);

  MP3_SCI_Write(SCI_MODE_ADDR, 0x0800);
  MP3_SCI_Write(SCI_BASS_ADDR, 0x7A00);
  MP3_SCI_Write(SCI_CLOCKF_ADDR, 0xC000);   // default 12 288 000 Hz

  // Maximum volume is 0x00 and total silence is 0xFE.
}

/**************************************************************************************************
* End of File
**************************************************************************************************/