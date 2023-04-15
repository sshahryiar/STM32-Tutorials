#line 1 "C:/Users/Shawon/Desktop/ARM Media/Codes/Input Capture Example/Ex_6.c"
#line 1 "c:/users/shawon/desktop/arm media/codes/input capture example/tim_common.h"
#line 1 "c:/users/shawon/desktop/arm media/codes/input capture example/tim2.h"
#line 1 "c:/users/shawon/desktop/arm media/codes/input capture example/tim3.h"
#line 1 "c:/users/shawon/desktop/arm media/codes/input capture example/afio.h"
#line 1 "c:/users/shawon/desktop/arm media/codes/input capture example/gpio.h"
#line 8 "C:/Users/Shawon/Desktop/ARM Media/Codes/Input Capture Example/Ex_6.c"
sbit LCD_RS at GPIOD_ODR.B8;
sbit LCD_EN at GPIOD_ODR.B9;
sbit LCD_D4 at GPIOD_ODR.B10;
sbit LCD_D5 at GPIOD_ODR.B11;
sbit LCD_D6 at GPIOD_ODR.B12;
sbit LCD_D7 at GPIOD_ODR.B13;


unsigned int overflow_count = 0;
unsigned long pulse_ticks = 0;
unsigned long start_time = 0;
unsigned long end_time = 0;
float f = 0.0;


void setup();
void setup_IO();
void setup_TIM2();
void setup_TIM3();


void TIM2_ISR()
iv IVT_INT_TIM2
ics ICS_AUTO
{
 if(TIM2_SRbits.UIF == 1)
 {
 TIM2_SRbits.UIF = 0;
 overflow_count++;
 }

 if(TIM2_SRbits.CC1IF == 1)
 {
 TIM2_SRbits.CC1IF = 0;
 end_time = TIM2_CCR1;
 pulse_ticks = ((overflow_count << 16) - start_time + end_time);
 start_time = end_time;
 overflow_count = 0;
 }
}


void main()
{
 char txt[15];

 setup();

 while(1)
 {
 f = (float)pulse_ticks;
 f = (1000000 / f);
 lcd_out(2, 1, "               ");
 FloatToStr(f, txt);
 lcd_out(2, 1, txt);
 delay_ms(600);
 };
}


void setup()
{
 setup_IO();

 setup_TIM2();
 setup_TIM3();

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, "Frequency/Hz:");
}


void setup_IO()
{
  RCC_APB2ENRbits.AFIOEN = 0x1 ;
  AFIO_MAPR |= 0x000 ;
  AFIO_MAPR |= 0x000 ;

  RCC_APB2ENRbits.IOPAEN = 0x1 ;
  do{if((0 >= 0) && (0 < 8)){ do{GPIOA_CRL &= (~(0xF << (0 << 2))); GPIOA_CRL |= (0x8 << (0 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((0 - 8) << 2))); GPIOA_CRH |= (0x8 << ((0 - 8) << 2));}while(0) ;}}while(0) ;
  GPIOA_ODR &= (~(1 << 0)) ;
  do{if((6 >= 0) && (6 < 8)){ do{GPIOA_CRL &= (~(0xF << (6 << 2))); GPIOA_CRL |= ((0x8 | 0x3) << (6 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((6 - 8) << 2))); GPIOA_CRH |= ((0x8 | 0x3) << ((6 - 8) << 2));}while(0) ;}}while(0) ;

  RCC_APB2ENRbits.IOPDEN = 0x1 ;
  do{if((8 >= 0) && (8 < 8)){ do{GPIOD_CRL &= (~(0xF << (8 << 2))); GPIOD_CRL |= ((0x0 | 0x2) << (8 << 2));}while(0) ;}else{ do{GPIOD_CRH &= (~(0xF << ((8 - 8) << 2))); GPIOD_CRH |= ((0x0 | 0x2) << ((8 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((9 >= 0) && (9 < 8)){ do{GPIOD_CRL &= (~(0xF << (9 << 2))); GPIOD_CRL |= ((0x0 | 0x2) << (9 << 2));}while(0) ;}else{ do{GPIOD_CRH &= (~(0xF << ((9 - 8) << 2))); GPIOD_CRH |= ((0x0 | 0x2) << ((9 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((10 >= 0) && (10 < 8)){ do{GPIOD_CRL &= (~(0xF << (10 << 2))); GPIOD_CRL |= ((0x0 | 0x2) << (10 << 2));}while(0) ;}else{ do{GPIOD_CRH &= (~(0xF << ((10 - 8) << 2))); GPIOD_CRH |= ((0x0 | 0x2) << ((10 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((11 >= 0) && (11 < 8)){ do{GPIOD_CRL &= (~(0xF << (11 << 2))); GPIOD_CRL |= ((0x0 | 0x2) << (11 << 2));}while(0) ;}else{ do{GPIOD_CRH &= (~(0xF << ((11 - 8) << 2))); GPIOD_CRH |= ((0x0 | 0x2) << ((11 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((12 >= 0) && (12 < 8)){ do{GPIOD_CRL &= (~(0xF << (12 << 2))); GPIOD_CRL |= ((0x0 | 0x2) << (12 << 2));}while(0) ;}else{ do{GPIOD_CRH &= (~(0xF << ((12 - 8) << 2))); GPIOD_CRH |= ((0x0 | 0x2) << ((12 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((13 >= 0) && (13 < 8)){ do{GPIOD_CRL &= (~(0xF << (13 << 2))); GPIOD_CRL |= ((0x0 | 0x2) << (13 << 2));}while(0) ;}else{ do{GPIOD_CRH &= (~(0xF << ((13 - 8) << 2))); GPIOD_CRH |= ((0x0 | 0x2) << ((13 - 8) << 2));}while(0) ;}}while(0) ;
}


void setup_TIM2()
{
  RCC_APB1ENRbits.TIM2EN = 0x1 ;
  TIM2_CR1bits.CEN = 0x0 ;
 TIM2_ARR = 0xFFFF;
 TIM2_PSC = 71;
  TIM2_CR1bits.DIR_ = 0x0 ;
  do{TIM2_CR1 &= (~(0x3 << 8)); TIM2_CR1 |= ( 0x0  << 8);}while(0) ;
  do{TIM2_CCMR1_Output &= (~(0x3 << 0)); TIM2_CCMR1_Output |= ( 0x1  << 0);}while(0) ;
  do{TIM2_CCERbits.CC1E = 0x1 ; TIM2_CCERbits.CC1P = 0x0 ;}while(0) ;
  do{TIM2_CCMR1_Input &= (~(0x3 << 2)); TIM2_CCMR1_Input |= (0 << 2);}while(0) ;
  do{TIM2_CCMR1_Input &= (~(0xF << 4)); TIM2_CCMR1_Input |= (0 << 4);}while(0) ;
  TIM2_DIERbits.CC1IE = 0x1 ;
  TIM2_DIERbits.UIE = 0x1 ;
 NVIC_IntEnable(IVT_INT_TIM2);
 EnableInterrupts();
  TIM2_CR1bits.CEN = 0x1 ;
}


void setup_TIM3()
{
  RCC_APB1ENRbits.TIM3EN = 0x1 ;
  TIM3_CR1bits.CEN = 0x0 ;
  TIM3_CR1bits.DIR_ = 0x0 ;
 TIM3_ARR = 799;
 TIM3_PSC = 0;
  do{TIM3_CCMR1_Output &= (~(0x7 << 4)); TIM3_CCMR1_Output |= ( 0x6  << 4);}while(0) ;
  do{TIM3_CCERbits.CC1E = 0x1 ; TIM3_CCERbits.CC1P = 0x1 ;}while(0) ;
  TIM3_CR1bits.CEN = 0x1 ;
 TIM3_CCR1 = 400;
}
