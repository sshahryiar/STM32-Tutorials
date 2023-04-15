#line 1 "C:/Users/Shawon & Nipa/Desktop/ARM Media/Codes/Output Compare Mode/Ex_4.c"
#line 1 "c:/users/shawon & nipa/desktop/arm media/codes/output compare mode/tim_common.h"
#line 1 "c:/users/shawon & nipa/desktop/arm media/codes/output compare mode/tim1.h"
#line 1 "c:/users/shawon & nipa/desktop/arm media/codes/output compare mode/tim8.h"
#line 1 "c:/users/shawon & nipa/desktop/arm media/codes/output compare mode/gpio.h"
#line 1 "c:/users/shawon & nipa/desktop/arm media/codes/output compare mode/afio.h"
#line 8 "C:/Users/Shawon & Nipa/Desktop/ARM Media/Codes/Output Compare Mode/Ex_4.c"
void setup();
void setup_IO();
void setup_TIM1();
void setup_TIM8();


void main()
{
 unsigned int duty = 0;

 setup();

 while(1)
 {
 while(duty < 1600)
 {
 TIM1_CCR1 = duty;
 TIM1_CCR2 = duty;
 TIM1_CCR3 = duty;
 TIM1_CCR4 = duty;
 TIM8_CCR1 = duty;
 TIM8_CCR2 = duty;
 TIM8_CCR3 = duty;
 TIM8_CCR4 = duty;
 duty++;
 delay_ms(4);
 }
 while(duty > 0)
 {
 TIM1_CCR1 = duty;
 TIM1_CCR2 = duty;
 TIM1_CCR3 = duty;
 TIM1_CCR4 = duty;
 TIM8_CCR1 = duty;
 TIM8_CCR2 = duty;
 TIM8_CCR3 = duty;
 TIM8_CCR4 = duty;
 duty--;
 delay_ms(4);
 }

 };
}


void setup()
{
 setup_IO();
 setup_TIM1();
 setup_TIM8();
}


void setup_IO()
{
  RCC_APB2ENRbits.AFIOEN = 0x01 ;
  AFIO_MAPR |= 0x00 ;

  RCC_APB2ENRbits.IOPAEN = 0x01 ;
  do{if((8 >= 0) && (8 < 8)){ do{GPIOA_CRL &= (~(0xF << (8 << 2))); GPIOA_CRL |= ((0x8 | 0x3) << (8 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((8 - 8) << 2))); GPIOA_CRH |= ((0x8 | 0x3) << ((8 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((9 >= 0) && (9 < 8)){ do{GPIOA_CRL &= (~(0xF << (9 << 2))); GPIOA_CRL |= ((0x8 | 0x3) << (9 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((9 - 8) << 2))); GPIOA_CRH |= ((0x8 | 0x3) << ((9 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((10 >= 0) && (10 < 8)){ do{GPIOA_CRL &= (~(0xF << (10 << 2))); GPIOA_CRL |= ((0x8 | 0x3) << (10 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((10 - 8) << 2))); GPIOA_CRH |= ((0x8 | 0x3) << ((10 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((11 >= 0) && (11 < 8)){ do{GPIOA_CRL &= (~(0xF << (11 << 2))); GPIOA_CRL |= ((0x8 | 0x3) << (11 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((11 - 8) << 2))); GPIOA_CRH |= ((0x8 | 0x3) << ((11 - 8) << 2));}while(0) ;}}while(0) ;

  RCC_APB2ENRbits.IOPCEN = 0x01 ;
  do{if((6 >= 0) && (6 < 8)){ do{GPIOC_CRL &= (~(0xF << (6 << 2))); GPIOC_CRL |= ((0x8 | 0x3) << (6 << 2));}while(0) ;}else{ do{GPIOC_CRH &= (~(0xF << ((6 - 8) << 2))); GPIOC_CRH |= ((0x8 | 0x3) << ((6 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((7 >= 0) && (7 < 8)){ do{GPIOC_CRL &= (~(0xF << (7 << 2))); GPIOC_CRL |= ((0x8 | 0x3) << (7 << 2));}while(0) ;}else{ do{GPIOC_CRH &= (~(0xF << ((7 - 8) << 2))); GPIOC_CRH |= ((0x8 | 0x3) << ((7 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((8 >= 0) && (8 < 8)){ do{GPIOC_CRL &= (~(0xF << (8 << 2))); GPIOC_CRL |= ((0x8 | 0x3) << (8 << 2));}while(0) ;}else{ do{GPIOC_CRH &= (~(0xF << ((8 - 8) << 2))); GPIOC_CRH |= ((0x8 | 0x3) << ((8 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((9 >= 0) && (9 < 8)){ do{GPIOC_CRL &= (~(0xF << (9 << 2))); GPIOC_CRL |= ((0x8 | 0x3) << (9 << 2));}while(0) ;}else{ do{GPIOC_CRH &= (~(0xF << ((9 - 8) << 2))); GPIOC_CRH |= ((0x8 | 0x3) << ((9 - 8) << 2));}while(0) ;}}while(0) ;
}


void setup_TIM1()
{
  RCC_APB2ENRbits.TIM1EN = 0x01 ;
  TIM1_CR1bits.CEN = 0x00 ;
  TIM1_CR1bits.DIR_ = 0x0 ;
 TIM1_ARR = 1599;
 TIM1_PSC = 0;
  do{TIM1_CCMR1_Output &= (~(0x7 << 4)); TIM1_CCMR1_Output |= ( 0x6  << 4);}while(0) ;
  do{TIM1_CCMR1_Output &= (~(0x7 << 12)); TIM1_CCMR1_Output |= ( 0x6  << 12);}while(0) ;
  do{TIM1_CCMR2_Output &= (~(0x7 << 4)); TIM1_CCMR2_Output |= ( 0x7  << 4);}while(0) ;
  do{TIM1_CCMR2_Output &= (~(0x7 << 12)); TIM1_CCMR2_Output |= ( 0x7  << 12);}while(0) ;
  do{TIM1_CCERbits.CC1E = 0x01 ; TIM1_CCERbits.CC1P = 0x0 ;}while(0) ;
  do{TIM1_CCERbits.CC2E = 0x01 ; TIM1_CCERbits.CC2P = 0x0 ;}while(0) ;
  do{TIM1_CCERbits.CC3E = 0x01 ; TIM1_CCERbits.CC3P = 0x0 ;}while(0) ;
  do{TIM1_CCERbits.CC4E = 0x01 ; TIM1_CCERbits.CC4P = 0x0 ;}while(0) ;
  TIM1_BDTRbits.MOE = 0x01 ;
  TIM1_CR2bits.CCPC = 0x01 ;
  TIM1_CR1bits.ARPE = 0x01 ;
  TIM1_CR1bits.CEN = 0x01 ;
}


void setup_TIM8()
{
  RCC_APB2ENRbits.TIM8EN = 0x01 ;
  TIM8_CR1bits.CEN = 0x00 ;
  TIM8_CR1bits.DIR_ = 0x1 ;
 TIM8_ARR = 1599;
 TIM8_PSC = 0;
  do{TIM8_CCMR1_Output &= (~(0x7 << 4)); TIM8_CCMR1_Output |= ( 0x6  << 4);}while(0) ;
  do{TIM8_CCMR1_Output &= (~(0x7 << 12)); TIM8_CCMR1_Output |= ( 0x6  << 12);}while(0) ;
  do{TIM8_CCMR2_Output &= (~(0x7 << 4)); TIM8_CCMR2_Output |= ( 0x7  << 4);}while(0) ;
  do{TIM8_CCMR2_Output &= (~(0x7 << 12)); TIM8_CCMR2_Output |= ( 0x7  << 12);}while(0) ;
  do{TIM8_CCERbits.CC1E = 0x01 ; TIM8_CCERbits.CC1P = 0x1 ;}while(0) ;
  do{TIM8_CCERbits.CC2E = 0x01 ; TIM8_CCERbits.CC2P = 0x1 ;}while(0) ;
  do{TIM8_CCERbits.CC3E = 0x01 ; TIM8_CCERbits.CC3P = 0x1 ;}while(0) ;
  do{TIM8_CCERbits.CC4E = 0x01 ; TIM8_CCERbits.CC4P = 0x1 ;}while(0) ;
  TIM8_BDTRbits.MOE = 0x01 ;
  TIM8_CR2bits.CCPC = 0x01 ;
  TIM8_CR1bits.ARPE = 0x01 ;
  TIM8_CR1bits.CEN = 0x01 ;
}
