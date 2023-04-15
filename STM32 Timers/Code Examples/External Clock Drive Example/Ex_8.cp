#line 1 "C:/Users/Shawon/Desktop/ARM Media/Codes/External Clock Drive Example/Ex_8.c"
#line 1 "c:/users/shawon/desktop/arm media/codes/external clock drive example/tim_common.h"
#line 1 "c:/users/shawon/desktop/arm media/codes/external clock drive example/tim2.h"
#line 1 "c:/users/shawon/desktop/arm media/codes/external clock drive example/afio.h"
#line 1 "c:/users/shawon/desktop/arm media/codes/external clock drive example/gpio.h"
#line 7 "C:/Users/Shawon/Desktop/ARM Media/Codes/External Clock Drive Example/Ex_8.c"
void setup();
void setup_IO();
void setup_TIM2();


void TIM2_ISR()
iv IVT_INT_TIM2
ics ICS_AUTO
{

 TIM2_SR = 0;
  GPIOC_ODR ^= (1 << 6) ;
}


void main()
{
 setup();

 while(1);
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
  do{if((0 >= 0) && (0 < 8)){ do{GPIOA_CRL &= (~(0xF << (0 << 2))); GPIOA_CRL |= (0x4 << (0 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((0 - 8) << 2))); GPIOA_CRH |= (0x4 << ((0 - 8) << 2));}while(0) ;}}while(0) ;

  RCC_APB2ENRbits.IOPCEN = 0x1 ;
  do{if((6 >= 0) && (6 < 8)){ do{GPIOC_CRL &= (~(0xF << (6 << 2))); GPIOC_CRL |= ((0x0 | 0x3) << (6 << 2));}while(0) ;}else{ do{GPIOC_CRH &= (~(0xF << ((6 - 8) << 2))); GPIOC_CRH |= ((0x0 | 0x3) << ((6 - 8) << 2));}while(0) ;}}while(0) ;
  GPIOC_BSRR |= (1 << 6) ;
}


void setup_TIM2()
{
  RCC_APB1ENRbits.TIM2EN = 0x1 ;
  TIM2_CR1bits.CEN = 0x0 ;
 TIM2_ARR = 0x0002;
 TIM2_PSC = 0x0000;
  TIM2_CR1bits.DIR_ = 0x0 ;
  do{TIM2_CR1 &= (~(0x3 << 8)); TIM2_CR1 |= ( 0x0  << 8);}while(0) ;
  do{TIM2_CCMR1_Output &= (~(0x3 << 0)); TIM2_CCMR1_Output |= ( 0x1  << 0);}while(0) ;
  do{TIM2_CCERbits.CC1E = 0x1 ; TIM2_CCERbits.CC1P = 0x0 ;}while(0) ;
  do{TIM2_SMCR &= (~(0x7 << 4)); TIM2_SMCR |= ( 0x4  << 4);}while(0) ;
  do{TIM2_SMCR &= (~(0x7 << 0)); TIM2_SMCR |= ( 0x7  << 0);}while(0) ;
  TIM2_DIERbits.UIE = 0x1 ;
 NVIC_IntEnable(IVT_INT_TIM2);
 EnableInterrupts();
  TIM2_CR1bits.CEN = 0x1 ;
}
