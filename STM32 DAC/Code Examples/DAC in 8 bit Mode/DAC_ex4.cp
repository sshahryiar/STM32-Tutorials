#line 1 "C:/Users/Shawon & Nipa/Desktop/ARM Media/Codes/DAC in 8 bit Mode/DAC_ex4.c"
#line 1 "c:/users/shawon & nipa/desktop/arm media/codes/dac in 8 bit mode/dac.h"
#line 1 "c:/users/shawon & nipa/desktop/arm media/codes/dac in 8 bit mode/gpio.h"
#line 5 "C:/Users/Shawon & Nipa/Desktop/ARM Media/Codes/DAC in 8 bit Mode/DAC_ex4.c"
void setup();
void GPIO_setup();
void DAC_setup();


void main()
{
 signed int temp = 0;

 setup();

 while(1)
 {
 for(temp = 0; temp < 4096; temp++)
 {
 DAC_DHR12R1 = temp;
 if((temp > 0) && (temp < 256))
 {
 DAC_DHR8R2 = temp;
 }
 delay_us(90);
 }

 for(temp = 4095; temp > -1; temp--)
 {
 DAC_DHR12R1 = temp;
 if((temp > 0) && (temp < 256))
 {
 DAC_DHR8R2 = temp;
 }
 delay_us(90);
 }
 };
}


void setup()
{
 GPIO_setup();
 DAC_setup();
}


void GPIO_setup()
{
  RCC_APB2ENRbits.IOPAEN = 0x01 ;
  do{GPIOA_CRL &= (~(0xF << (4 << 2))); GPIOA_CRL |= ( 0x00  << (4 << 2));}while(0) ;
  do{GPIOA_CRL &= (~(0xF << (5 << 2))); GPIOA_CRL |= ( 0x00  << (5 << 2));}while(0) ;
}


void DAC_setup()
{
  RCC_APB1ENRbits.DACEN = 0x01 ;
  DAC_CR = 0x00000000 ;
  DAC_CRbits.BOFF1 = 0x01 ;
  DAC_CRbits.BOFF2 = 0x01 ;
  DAC_CRbits.EN1 = 0x01 ;
  DAC_CRbits.EN2 = 0x01 ;
}
