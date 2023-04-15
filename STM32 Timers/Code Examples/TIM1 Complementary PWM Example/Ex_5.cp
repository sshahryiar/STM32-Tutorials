#line 1 "C:/Users/Shawon/Desktop/ARM Media/Codes/Complementary PWM/Ex_5.c"
#line 1 "c:/users/shawon/desktop/arm media/codes/complementary pwm/tim_common.h"
#line 1 "c:/users/shawon/desktop/arm media/codes/complementary pwm/tim1.h"
#line 1 "c:/users/shawon/desktop/arm media/codes/complementary pwm/gpio.h"
#line 1 "c:/users/shawon/desktop/arm media/codes/complementary pwm/afio.h"
#line 7 "C:/Users/Shawon/Desktop/ARM Media/Codes/Complementary PWM/Ex_5.c"
void setup();
void setup_IO();
void setup_TIM1();


void main()
{
 unsigned int duty = 0;

 setup();

 while(1)
 {
 while(duty < 1600)
 {
 TIM1_CCR1 = duty;
 duty++;
 delay_ms(1);
 }
 while(duty > 0)
 {
 TIM1_CCR1 = duty;
 duty--;
 delay_ms(1);
 }

 };
}


void setup()
{
 setup_IO();
 setup_TIM1();
}


void setup_IO()
{
  RCC_APB2ENRbits.AFIOEN = 0x01 ;
  AFIO_MAPR |= 0x00 ;

  RCC_APB2ENRbits.IOPAEN = 0x01 ;
  do{if((8 >= 0) && (8 < 8)){ do{GPIOA_CRL &= (~(0xF << (8 << 2))); GPIOA_CRL |= ((0x8 | 0x3) << (8 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((8 - 8) << 2))); GPIOA_CRH |= ((0x8 | 0x3) << ((8 - 8) << 2));}while(0) ;}}while(0) ;

  RCC_APB2ENRbits.IOPBEN = 0x01 ;
  do{if((13 >= 0) && (13 < 8)){ do{GPIOB_CRL &= (~(0xF << (13 << 2))); GPIOB_CRL |= ((0x8 | 0x3) << (13 << 2));}while(0) ;}else{ do{GPIOB_CRH &= (~(0xF << ((13 - 8) << 2))); GPIOB_CRH |= ((0x8 | 0x3) << ((13 - 8) << 2));}while(0) ;}}while(0) ;
}


void setup_TIM1()
{
  RCC_APB2ENRbits.TIM1EN = 0x01 ;
  TIM1_CR1bits.CEN = 0x00 ;
  TIM1_CR1bits.DIR_ = 0x0 ;
 TIM1_ARR = 1599;
 TIM1_PSC = 0;
  do{TIM1_CCMR1_Output &= (~(0x7 << 4)); TIM1_CCMR1_Output |= ( 0x6  << 4);}while(0) ;
  do{TIM1_CCERbits.CC1E = 0x01 ; TIM1_CCERbits.CC1P = 0x1 ;}while(0) ;
  do{TIM1_CCERbits.CC1NE = 0x01 ; TIM1_CCERbits.CC1NP = 0x1 ;}while(0) ;
  TIM1_BDTRbits.OSSR = 0x01 ;
  do{TIM1_BDTR &= (~(0xFF << 0)); TIM1_BDTR |= (77 << 0);}while(0) ;
  TIM1_BDTRbits.MOE = 0x01 ;
  TIM1_CR2bits.CCPC = 0x01 ;
  TIM1_CR1bits.ARPE = 0x01 ;
  TIM1_CR1bits.CEN = 0x01 ;
}
