#line 1 "C:/Users/Shawon & Nipa/Desktop/ARM Media/Codes/DAC Basic Demo/DAC_ex1.c"
#line 1 "c:/users/shawon & nipa/desktop/arm media/codes/dac basic demo/dac.h"
#line 1 "c:/users/shawon & nipa/desktop/arm media/codes/dac basic demo/gpio.h"
#line 8 "C:/Users/Shawon & Nipa/Desktop/ARM Media/Codes/DAC Basic Demo/DAC_ex1.c"
void setup();
void GPIO_setup();
void DAC_setup();


void main()
{
 signed int temp1 = 0;
 signed int temp2 = 0;
 unsigned int degree = 0;


 setup();

 while(1)
 {
 for(degree = 0; degree < 360; degree++)
 {
 temp1 = (2047 * cos( 0.0174532925  * degree));
 temp1 = (2048 - temp1);
 DAC_DHR12R1 = ((unsigned int)temp1);
 temp2 = (2047 * sin( 0.0174532925  * degree));
 temp2 = (2048 - temp2);
 DAC_DHR12R2 = ((unsigned int)temp2);
 delay_ms(6);
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
