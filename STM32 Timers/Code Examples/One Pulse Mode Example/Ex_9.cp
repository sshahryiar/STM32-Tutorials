#line 1 "C:/Users/Shawon/Desktop/ARM Media/Codes/One Pulse Mode Example/Ex_9.c"
#line 1 "c:/users/shawon/desktop/arm media/codes/one pulse mode example/tim_common.h"
#line 1 "c:/users/shawon/desktop/arm media/codes/one pulse mode example/tim2.h"
#line 1 "c:/users/shawon/desktop/arm media/codes/one pulse mode example/afio.h"
#line 1 "c:/users/shawon/desktop/arm media/codes/one pulse mode example/gpio.h"
#line 7 "C:/Users/Shawon/Desktop/ARM Media/Codes/One Pulse Mode Example/Ex_9.c"
void setup();
void setup_IO();
void setup_TIM2();


void main()
{
 setup();

 while(1)
 {
 };
}


void setup()
{
 setup_IO();
 setup_TIM2();
}


void setup_IO()
{
  RCC_APB2ENRbits.AFIOEN = 0x1 ;
  AFIO_MAPR |= 0x000 ;

  RCC_APB2ENRbits.IOPAEN = 0x1 ;
  do{if((0 >= 0) && (0 < 8)){ do{GPIOA_CRL &= (~(0xF << (0 << 2))); GPIOA_CRL |= (0x8 << (0 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((0 - 8) << 2))); GPIOA_CRH |= (0x8 << ((0 - 8) << 2));}while(0) ;}}while(0) ;
  GPIOA_ODR &= (~(1 << 0)) ;
  do{if((1 >= 0) && (1 < 8)){ do{GPIOA_CRL &= (~(0xF << (1 << 2))); GPIOA_CRL |= ((0x8 | 0x3) << (1 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((1 - 8) << 2))); GPIOA_CRH |= ((0x8 | 0x3) << ((1 - 8) << 2));}while(0) ;}}while(0) ;
}


void setup_TIM2()
{
  RCC_APB1ENRbits.TIM2EN = 0x1 ;
  TIM2_CR1bits.CEN = 0x0 ;
  TIM2_CR1bits.DIR_ = 0x0 ;
  do{TIM2_CR1 &= (~(0x3 << 8)); TIM2_CR1 |= ( 0x0  << 8);}while(0) ;
  do{TIM2_CCMR1_Output &= (~(0x3 << 0)); TIM2_CCMR1_Output |= ( 0x1  << 0);}while(0) ;
  do{TIM2_CCERbits.CC1E = 0x1 ; TIM2_CCERbits.CC1P = 0x0 ;}while(0) ;
  do{TIM2_CCMR1_Output &= (~(0x3 << 8)); TIM2_CCMR1_Output |= ( 0x0  << 8);}while(0) ;
  do{TIM2_CCERbits.CC2E = 0x1 ; TIM2_CCERbits.CC2P = 0x0 ;}while(0) ;
  do{TIM2_CCMR1_Output &= (~(0x7 << 12)); TIM2_CCMR1_Output |= ( 0x7  << 12);}while(0) ;
  do{TIM2_SMCR &= (~(0x7 << 4)); TIM2_SMCR |= ( 0x5  << 4);}while(0) ;
  do{TIM2_SMCR &= (~(0x7 << 0)); TIM2_SMCR |= ( 0x6  << 0);}while(0) ;
 TIM2_ARR = 60000;
 TIM2_PSC = 0x0000;
 TIM2_CCR2 = 20;
  TIM2_CR1bits.CEN = 0x1 ;
}
