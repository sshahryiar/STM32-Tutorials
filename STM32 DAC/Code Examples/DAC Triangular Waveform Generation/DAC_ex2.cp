#line 1 "C:/Users/Shawon/Desktop/ARM Media/Codes/DAC Triangular Waveform Generation/DAC_ex2.c"
#line 1 "c:/users/shawon/desktop/arm media/codes/dac triangular waveform generation/dac.h"
#line 1 "c:/users/shawon/desktop/arm media/codes/dac triangular waveform generation/gpio.h"
#line 5 "C:/Users/Shawon/Desktop/ARM Media/Codes/DAC Triangular Waveform Generation/DAC_ex2.c"
void setup();
void DAC_setup();
void GPIO_setup();


void main()
{
 bit time;

 unsigned long peak =  0x0B ;

 setup();

 while(1)
 {
  DAC_SWTRIGRbits.SWTRIG1 = 0x01 ;
  DAC_SWTRIGRbits.SWTRIG2 = 0x01 ;

 if( (GPIOF_IDR & (1 << 14))  == 0)
 {
 while( (GPIOF_IDR & (1 << 14))  == 0);

 peak++;

 if(peak >  0x0B )
 {
 peak =  0x00 ;
 }

  DAC_CRbits.EN1 = 0x00 ;
  DAC_CRbits.EN2 = 0x00 ;

  do{DAC_CR &= (~(0xF << 8)); DAC_CR |= (peak << 8);}while(0) ;
  do{DAC_CR &= (~(0xF << 24)); DAC_CR |= (peak << 24);}while(0) ;

  DAC_CRbits.EN1 = 0x01 ;
  DAC_CRbits.EN2 = 0x01 ;
 }

 if( (GPIOF_IDR & (1 << 13))  == 0)
 {
 while( (GPIOF_IDR & (1 << 13))  == 0);
 time = ~time;
 }

 switch(time)
 {
 case 1:
 {
 delay_us(600);
 break;
 }
 default:
 {
 delay_us(60);
 break;
 }
 }
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

  DAC_CRbits.BOFF1 = 0x01 ;
  DAC_CRbits.TEN1 = 0x01 ;
  do{if(DAC_CRbits.TEN1 == 0x01 ){DAC_CR &= (~(0x7 << 3)); DAC_CR |= ( 0x07  << 3);}}while(0) ;
  do{if(DAC_CRbits.TEN1 == 0x01 ){DAC_CR &= (~(0x3 << 6)); DAC_CR |= ( 0x02  << 6);}}while(0) ;
  do{DAC_CR &= (~(0xF << 8)); DAC_CR |= (0x0B << 8);}while(0) ;
  DAC_CRbits.EN1 = 0x01 ;

  DAC_CRbits.BOFF2 = 0x01 ;
  DAC_CRbits.TEN2 = 0x01 ;
  do{if(DAC_CRbits.TEN2 == 0x01 ){DAC_CR &= (~(0x7 << 19)); DAC_CR |= ( 0x07  << 19);}}while(0) ;
  do{if(DAC_CRbits.TEN2 == 0x01 ){DAC_CR &= (~(0x3 << 22)); DAC_CR |= ( 0x02  << 22);}}while(0) ;
  do{DAC_CR &= (~(0xF << 24)); DAC_CR |= (0x0B << 24);}while(0) ;
  DAC_CRbits.EN2 = 0x01 ;
}


void GPIO_setup()
{
  RCC_APB2ENRbits.IOPAEN = 0x01 ;
  RCC_APB2ENRbits.IOPFEN = 0x01 ;

  do{GPIOA_CRL &= (~(0xF << (4 << 2))); GPIOA_CRL |= ( 0x00  << (4 << 2));}while(0) ;
  do{GPIOA_CRL &= (~(0xF << (5 << 2))); GPIOA_CRL |= ( 0x00  << (5 << 2));}while(0) ;

  do{GPIOF_CRH &= (~(0xF << ((13 - 8) << 2))); GPIOF_CRH |= ( 0x08  << ((13 - 8) << 2));}while(0) ;
  do{GPIOF_CRH &= (~(0xF << ((14 - 8) << 2))); GPIOF_CRH |= ( 0x08  << ((14 - 8) << 2));}while(0) ;

  (GPIOF_ODR |= (1 << 13)) ;
  (GPIOF_ODR |= (1 << 14)) ;
}
