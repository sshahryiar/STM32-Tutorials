#line 1 "C:/Users/Shawon & Nipa/Desktop/ARM Media/Codes/Timer ISR Example/Ex_2.c"
#line 1 "c:/users/shawon & nipa/desktop/arm media/codes/timer isr example/tim_common.h"
#line 1 "c:/users/shawon & nipa/desktop/arm media/codes/timer isr example/tim3.h"
#line 1 "c:/users/shawon & nipa/desktop/arm media/codes/timer isr example/tim8.h"
#line 1 "c:/users/shawon & nipa/desktop/arm media/codes/timer isr example/gpio.h"
#line 7 "C:/Users/Shawon & Nipa/Desktop/ARM Media/Codes/Timer ISR Example/Ex_2.c"
void setup();
void GPIO_init();
void Timer3_init();
void Timer8_init();


void TIM3_ISR()
iv IVT_INT_TIM3
ics ICS_AUTO
{
 TIM3_SR = 0;
  GPIOC_ODR ^= (1 << 6) ;
}


void TIM8_ISR()
iv IVT_INT_TIM8_UP
ics ICS_AUTO
{
 TIM8_SR = 0;
  GPIOC_ODR ^= (1 << 7) ;
}


void main()
{
 setup();

 while(1)
 {
 };
}


void setup()
{
 GPIO_init();
 Timer3_init();
 Timer8_init();
}


void GPIO_init()
{
  RCC_APB2ENRbits.IOPCEN = 0x1 ;
  do{if((6 >= 0) && (6 < 8)){ do{GPIOC_CRL &= (~(0xF << (6 << 2))); GPIOC_CRL |= ((0x0 | 0x1) << (6 << 2));}while(0) ;}else{ do{GPIOC_CRH &= (~(0xF << ((6 - 8) << 2))); GPIOC_CRH |= ((0x0 | 0x1) << ((6 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((7 >= 0) && (7 < 8)){ do{GPIOC_CRL &= (~(0xF << (7 << 2))); GPIOC_CRL |= ((0x0 | 0x1) << (7 << 2));}while(0) ;}else{ do{GPIOC_CRH &= (~(0xF << ((7 - 8) << 2))); GPIOC_CRH |= ((0x0 | 0x1) << ((7 - 8) << 2));}while(0) ;}}while(0) ;
}


void Timer3_init()
{
  RCC_APB1ENRbits.TIM3EN = 0x1 ;
  TIM3_CR1bits.CEN = 0x0 ;
 TIM3_PSC = 575;
 TIM3_ARR = 62499;
  TIM3_CR1bits.DIR_ = 0x1 ;
 NVIC_IntEnable(IVT_INT_TIM3);
 EnableInterrupts();
  TIM3_DIERbits.UIE = 0x1 ;
  TIM3_CR1bits.CEN = 0x1 ;
}


void Timer8_init()
{
  RCC_APB2ENRbits.TIM8EN = 0x1 ;
  TIM8_CR1bits.CEN = 0x0 ;
 TIM8_PSC = 575;
 TIM8_ARR = 62499;
  TIM8_CR1bits.DIR_ = 0x0 ;
 NVIC_IntEnable(IVT_INT_TIM8_UP);
 EnableInterrupts();
  TIM8_DIERbits.UIE = 0x1 ;
  TIM8_CR1bits.CEN = 0x1 ;
}
