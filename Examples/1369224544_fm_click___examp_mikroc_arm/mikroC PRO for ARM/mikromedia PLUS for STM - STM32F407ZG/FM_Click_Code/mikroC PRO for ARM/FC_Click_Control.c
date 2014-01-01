/*extern sbit FM_SEN;
extern sbit FM_RST;
extern sbit FM_SDIO;
extern sbit FM_SCK;
extern sbit FM_GP1;
extern sbit FM_GP2;

#define _FM_W_ADDRESS  0x20
#define _FM_R_ADDRESS  0x21

char receive[20];

unsigned int readRegisters()
{

//   I2C1_Write(_FM_W_ADDRESS, &address, 1, END_MODE_RESTART);
   I2C1_Read(_FM_R_ADDRESS, &receive, 20, END_MODE_STOP);
   return 1;
}
void FMClick_Init()
{
  GPIO_Digital_Output(GPIOA_BASE, _GPIO_PINMASK_15);
  GPIO_Digital_Output(GPIOB_BASE, _GPIO_PINMASK_1 | _GPIO_PINMASK_12);
  GPIO_Digital_Output(GPIOE_BASE, _GPIO_PINMASK_2);
  GPIO_Digital_Output(GPIOF_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);

  Delay_ms(1);

  FM_SCK = 1;
  FM_GP1 = 1;
  FM_SEN = 1;
  FM_SDIO = 0;
  FM_SCK = 1;

  FM_RST = 0;
  Delay_ms(10);
  FM_RST = 1;
  Delay_ms(10);

  Delay_ms(1000);
  FM_SDIO = 1;

  I2C1_Init();
  readRegisters();
  asm {
    nop
  }

}*/