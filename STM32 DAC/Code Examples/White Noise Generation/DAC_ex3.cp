#line 1 "C:/Users/Shawon & Nipa/Desktop/ARM Media/Codes/White Noise Generation/DAC_ex3.c"
#line 1 "c:/users/shawon & nipa/desktop/arm media/codes/white noise generation/dac.h"
#line 1 "c:/users/shawon & nipa/desktop/arm media/codes/white noise generation/gpio.h"
#line 5 "C:/Users/Shawon & Nipa/Desktop/ARM Media/Codes/White Noise Generation/DAC_ex3.c"
void setup();
void DAC_setup();
void GPIO_setup();


void main()
{
 setup();

 while(1)
 {
  DAC_SWTRIGRbits.SWTRIG2 = 0x01 ;
 delay_us(10);
 };
}


void setup()
{
 GPIO_setup();
 DAC_setup();
}


void DAC_setup()
{
  RCC_APB1ENRbits.DACEN = 0x01 ;
  DAC_CR = 0x00000000 ;
  DAC_CRbits.BOFF2 = 0x01 ;
  DAC_CRbits.TEN2 = 0x01 ;
  do{if(DAC_CRbits.TEN2 == 0x01 ){DAC_CR &= (~(0x7 << 19)); DAC_CR |= ( 0x07  << 19);}}while(0) ;
  do{if(DAC_CRbits.TEN2 == 0x01 ){DAC_CR &= (~(0x3 << 22)); DAC_CR |= ( 0x01  << 22);}}while(0) ;
  do{DAC_CR &= (~(0xF << 24)); DAC_CR |= (0x3FF << 24);}while(0) ;
  DAC_CRbits.EN2 = 0x01 ;
}


void GPIO_setup()
{
  RCC_APB2ENRbits.IOPAEN = 0x01 ;
  do{GPIOA_CRL &= (~(0xF << (5 << 2))); GPIOA_CRL |= ( 0x00  << (5 << 2));}while(0) ;
}
