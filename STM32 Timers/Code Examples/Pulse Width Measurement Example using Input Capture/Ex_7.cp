#line 1 "C:/Users/Shawon/Desktop/ARM Media/Codes/Pulse Width Measurement Example using Input Capture/Ex_7.c"
#line 1 "c:/users/shawon/desktop/arm media/codes/pulse width measurement example using input capture/tim_common.h"
#line 1 "c:/users/shawon/desktop/arm media/codes/pulse width measurement example using input capture/tim2.h"
#line 1 "c:/users/shawon/desktop/arm media/codes/pulse width measurement example using input capture/tim3.h"
#line 1 "c:/users/shawon/desktop/arm media/codes/pulse width measurement example using input capture/afio.h"
#line 1 "c:/users/shawon/desktop/arm media/codes/pulse width measurement example using input capture/gpio.h"
#line 8 "C:/Users/Shawon/Desktop/ARM Media/Codes/Pulse Width Measurement Example using Input Capture/Ex_7.c"
sbit LCD_RS at GPIOD_ODR.B8;
sbit LCD_EN at GPIOD_ODR.B9;
sbit LCD_D4 at GPIOD_ODR.B10;
sbit LCD_D5 at GPIOD_ODR.B11;
sbit LCD_D6 at GPIOD_ODR.B12;
sbit LCD_D7 at GPIOD_ODR.B13;


unsigned int second_rise = 0;
unsigned int start_time = 0;
unsigned int end_time = 0;
unsigned int d = 0;
unsigned int t = 0;


void setup();
void setup_IO();
void setup_TIM2();
void setup_TIM3();


void TIM2_ISR()
iv IVT_INT_TIM2
ics ICS_AUTO
{
 if(TIM2_SRbits.CC1IF == 1)
 {
 TIM2_SRbits.CC1IF = 0;
 start_time = TIM2_CCR1;

 if(start_time > second_rise)
 {
 t = (start_time - second_rise);
 }
 else
 {
 t = (0xFFFF - start_time + second_rise);
 }
 }
 if(TIM2_SRbits.CC2IF == 1)
 {
 TIM2_SRbits.CC2IF = 0;
 end_time = TIM2_CCR2;

 if(start_time < end_time)
 {
 d = (end_time - start_time);
 }
 else
 {
 d = (0xFFFF - end_time + start_time);
 }
 }

 second_rise = start_time;
}


void main()
{
 unsigned char duty_cycle = 0;
 signed int pwm = 100;

 char txt[15];

 setup();

 while(1)
 {
 if( (GPIOD_IDR & (1 << 14)) )
 {
 pwm += 50;
 }

 if(pwm >= 3550)
 {
 pwm = 3550;
 }

 if( (GPIOD_IDR & (1 << 15)) )
 {
 pwm -= 50;
 }

 if(pwm <= 50)
 {
 pwm = 50;
 }

 TIM3_CCR1 = pwm;

 duty_cycle = (((float)d / (float)t) * 100);

 lcd_out(1, 7, "      ");
 WordToStr(t, txt);
 lcd_out(1, 7, txt);

 lcd_out(2, 7, "        ");
 WordToStr(d, txt);
 lcd_out(2, 7, txt);

 ByteToStr(duty_cycle, txt);
 lcd_out(2, 14, txt);

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
 lcd_out(1, 1, "P/us:");
 lcd_out(2, 1, "D/us:");
 lcd_out(1, 15, "D%");
}


void setup_IO()
{
  RCC_APB2ENRbits.AFIOEN = 0x1 ;
  AFIO_MAPR |= 0x000 ;

  RCC_APB2ENRbits.IOPAEN = 0x1 ;
  do{if((0 >= 0) && (0 < 8)){ do{GPIOA_CRL &= (~(0xF << (0 << 2))); GPIOA_CRL |= (0x8 << (0 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((0 - 8) << 2))); GPIOA_CRH |= (0x8 << ((0 - 8) << 2));}while(0) ;}}while(0) ;
  GPIOA_ODR &= (~(1 << 0)) ;
  do{if((1 >= 0) && (1 < 8)){ do{GPIOA_CRL &= (~(0xF << (1 << 2))); GPIOA_CRL |= (0x8 << (1 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((1 - 8) << 2))); GPIOA_CRH |= (0x8 << ((1 - 8) << 2));}while(0) ;}}while(0) ;
  GPIOA_ODR &= (~(1 << 1)) ;
  do{if((6 >= 0) && (6 < 8)){ do{GPIOA_CRL &= (~(0xF << (6 << 2))); GPIOA_CRL |= ((0x8 | 0x3) << (6 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((6 - 8) << 2))); GPIOA_CRH |= ((0x8 | 0x3) << ((6 - 8) << 2));}while(0) ;}}while(0) ;

  RCC_APB2ENRbits.IOPDEN = 0x1 ;
  do{if((8 >= 0) && (8 < 8)){ do{GPIOD_CRL &= (~(0xF << (8 << 2))); GPIOD_CRL |= ((0x0 | 0x2) << (8 << 2));}while(0) ;}else{ do{GPIOD_CRH &= (~(0xF << ((8 - 8) << 2))); GPIOD_CRH |= ((0x0 | 0x2) << ((8 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((9 >= 0) && (9 < 8)){ do{GPIOD_CRL &= (~(0xF << (9 << 2))); GPIOD_CRL |= ((0x0 | 0x2) << (9 << 2));}while(0) ;}else{ do{GPIOD_CRH &= (~(0xF << ((9 - 8) << 2))); GPIOD_CRH |= ((0x0 | 0x2) << ((9 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((10 >= 0) && (10 < 8)){ do{GPIOD_CRL &= (~(0xF << (10 << 2))); GPIOD_CRL |= ((0x0 | 0x2) << (10 << 2));}while(0) ;}else{ do{GPIOD_CRH &= (~(0xF << ((10 - 8) << 2))); GPIOD_CRH |= ((0x0 | 0x2) << ((10 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((11 >= 0) && (11 < 8)){ do{GPIOD_CRL &= (~(0xF << (11 << 2))); GPIOD_CRL |= ((0x0 | 0x2) << (11 << 2));}while(0) ;}else{ do{GPIOD_CRH &= (~(0xF << ((11 - 8) << 2))); GPIOD_CRH |= ((0x0 | 0x2) << ((11 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((12 >= 0) && (12 < 8)){ do{GPIOD_CRL &= (~(0xF << (12 << 2))); GPIOD_CRL |= ((0x0 | 0x2) << (12 << 2));}while(0) ;}else{ do{GPIOD_CRH &= (~(0xF << ((12 - 8) << 2))); GPIOD_CRH |= ((0x0 | 0x2) << ((12 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((13 >= 0) && (13 < 8)){ do{GPIOD_CRL &= (~(0xF << (13 << 2))); GPIOD_CRL |= ((0x0 | 0x2) << (13 << 2));}while(0) ;}else{ do{GPIOD_CRH &= (~(0xF << ((13 - 8) << 2))); GPIOD_CRH |= ((0x0 | 0x2) << ((13 - 8) << 2));}while(0) ;}}while(0) ;

  do{if((14 >= 0) && (14 < 8)){ do{GPIOD_CRL &= (~(0xF << (14 << 2))); GPIOD_CRL |= (0x4 << (14 << 2));}while(0) ;}else{ do{GPIOD_CRH &= (~(0xF << ((14 - 8) << 2))); GPIOD_CRH |= (0x4 << ((14 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((15 >= 0) && (15 < 8)){ do{GPIOD_CRL &= (~(0xF << (15 << 2))); GPIOD_CRL |= (0x4 << (15 << 2));}while(0) ;}else{ do{GPIOD_CRH &= (~(0xF << ((15 - 8) << 2))); GPIOD_CRH |= (0x4 << ((15 - 8) << 2));}while(0) ;}}while(0) ;
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
  do{TIM2_CCMR1_Output &= (~(0x3 << 8)); TIM2_CCMR1_Output |= ( 0x2  << 8);}while(0) ;
  do{TIM2_CCERbits.CC1E = 0x1 ; TIM2_CCERbits.CC1P = 0x0 ;}while(0) ;
  do{TIM2_CCERbits.CC2E = 0x1 ; TIM2_CCERbits.CC2P = 0x1 ;}while(0) ;
  do{TIM2_CCMR1_Input &= (~(0x3 << 2)); TIM2_CCMR1_Input |= (0 << 2);}while(0) ;
  do{TIM2_CCMR1_Input &= (~(0x3 << 10)); TIM2_CCMR1_Input |= (0 << 10);}while(0) ;
  do{TIM2_CCMR1_Input &= (~(0xF << 4)); TIM2_CCMR1_Input |= (0 << 4);}while(0) ;
  do{TIM2_CCMR1_Input &= (~(0xF << 12)); TIM2_CCMR1_Input |= (0 << 12);}while(0) ;
  TIM2_DIERbits.CC1IE = 0x1 ;
  TIM2_DIERbits.CC2IE = 0x1 ;
 NVIC_IntEnable(IVT_INT_TIM2);
 EnableInterrupts();
  TIM2_CR1bits.CEN = 0x1 ;
}


void setup_TIM3()
{
  RCC_APB1ENRbits.TIM3EN = 0x1 ;
  TIM3_CR1bits.CEN = 0x0 ;
  TIM3_CR1bits.DIR_ = 0x0 ;
 TIM3_ARR = 3599;
 TIM3_PSC = 0;
  do{TIM3_CCMR1_Output &= (~(0x7 << 4)); TIM3_CCMR1_Output |= ( 0x7  << 4);}while(0) ;
  do{TIM3_CCERbits.CC1E = 0x1 ; TIM3_CCERbits.CC1P = 0x1 ;}while(0) ;
  TIM3_CR1bits.CEN = 0x1 ;
}
