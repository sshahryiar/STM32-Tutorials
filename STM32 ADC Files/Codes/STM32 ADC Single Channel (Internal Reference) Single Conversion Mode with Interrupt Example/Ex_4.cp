#line 1 "C:/Users/Shawon & Nipa/Desktop/ADC Examples/STM32 ADC Single Channel (Internal Reference) Single Conversion Mode with Interrupt Example/Ex_4.c"
#line 1 "c:/users/shawon & nipa/desktop/adc examples/stm32 adc single channel (internal reference) single conversion mode with interrupt example/adc.h"
#line 1 "c:/users/shawon & nipa/desktop/adc examples/stm32 adc single channel (internal reference) single conversion mode with interrupt example/gpio.h"
#line 5 "C:/Users/Shawon & Nipa/Desktop/ADC Examples/STM32 ADC Single Channel (Internal Reference) Single Conversion Mode with Interrupt Example/Ex_4.c"
sbit LCD_RS at GPIOB_ODR.B1;
sbit LCD_EN at GPIOB_ODR.B2;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;


register unsigned int adc_data = 0;


void setup();
void GPIO_init();
void ADC_init();
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);
float map(float v, float x_min, float x_max, float y_min, float y_max);


void ADC_ISR()
iv IVT_INT_ADC1_2
ics ICS_AUTO
{
 adc_data = (ADC1_DR & 0x0FFF);
  GPIOC_BRR |= (1 << 13) ;
}


void main()
{
 register float V = 0;

 setup();

 while(1)
 {
  ADC1_CR2bits.SWSTART = 0x1 ;
  GPIOC_BSRR |= (1 << 13) ;

 V = map(adc_data, 0, 4095, 0, 3300);
 lcd_print(13, 1, adc_data);
 lcd_print(13, 2, V);
 delay_ms(90);
 };
}


void setup()
{
 GPIO_init();
 ADC_init();
 LCD_Init();

 LCD_Cmd(_LCD_CLEAR);
 LCD_Cmd(_LCD_CURSOR_OFF);

 lcd_out(1, 1, "CH17:");
 lcd_out(2, 1, "Vref/mV:");
}


void GPIO_init()
{
  RCC_APB2ENRbits.IOPBEN = 0x1 ;
  RCC_APB2ENRbits.IOPCEN = 0x1 ;

  do{if((13 >= 0) && (13 < 8)){ do{GPIOC_CRL &= (~(0xF << (13 << 2))); GPIOC_CRL |= ((0x0 | 0x2) << (13 << 2));}while(0) ;}else{ do{GPIOC_CRH &= (~(0xF << ((13 - 8) << 2))); GPIOC_CRH |= ((0x0 | 0x2) << ((13 - 8) << 2));}while(0) ;}}while(0) ;
}


void ADC_init()
{
  do{RCC_APB2ENRbits.ADC1EN = 1; RCC_APB2RSTRbits.ADC1RST = 1; RCC_APB2RSTRbits.ADC1RST = 0;}while(0) ;
  do{ADC1_CR1 = 0; ADC1_CR2 = 0;}while(0) ;
  do{ADC1_CR1 &= (~(0xF << 16)); ADC1_CR1 |= ( 0x00  << 16);}while(0) ;
  ADC1_CR2bits.ALIGN = 0x00 ;
  ADC1_CR1bits.SCAN = 0x0 ;
  ADC1_CR2bits.CONT = 0x0 ;
  do{if(( 0x07  >= 0) && ( 0x07  < 8)){ADC1_CR2bits.EXTTRIG = 1; ADC1_CR2 &= (~(0x7 << 17)); ADC1_CR2 |= ( 0x07  << 17);}else{ADC1_CR2bits.EXTTRIG = 0;}}while(0) ;
  do{ADC1_SQR1 &= (~(0xF << 20)); ADC1_SQR1 |= ((1 - 1) << 20);}while(0) ;
  do{if((17 <= 9) && (17 >= 0)){ADC1_SMPR2 &= (~(0x7 << (17 * 3))); ADC1_SMPR2 |= ( 0x02  << (17 * 3));} else{ADC1_SMPR1 &= (~(0x7 << ((17 - 10) * 3))); ADC1_SMPR1 |= ( 0x02  << ((17 - 10) * 3));}}while(0) ;
  do{if((1 >= 1) && (1 <= 6)){ADC1_SQR3 &= (~(0x1F << ((1 - 1) * 5))); ADC1_SQR3 |= (17 << ((1 - 1) * 5));}else if((1 >= 7) && (1 <= 12)){ADC1_SQR2 &= (~(0x1F << ((1 - 7) * 5))); ADC1_SQR2 |= (17 << ((1 - 7) * 5));}else{ADC1_SQR1 &= (~(0x1F << ((1 - 13) * 5))); ADC1_SQR1 |= (17 << ((1 - 13) * 5));}}while(0) ;
  ADC1_CR2bits.TSVREFE = 0x1 ;
  ADC1_CR1bits.EOCIE = 0x1 ;
 NVIC_IntEnable(IVT_INT_ADC1_2);
 EnableInterrupts();
  do{ADC1_CR2bits.RSTCAL = 1; ADC1_CR2bits.CAL = 1; while(ADC1_CR2bits.CAL == 1);}while(0) ;
  do{ADC1_CR2bits.ADON = 1; delay_ms(1); ADC1_CR2bits.ADON = 1;}while(0) ;
}


void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
{
 unsigned char tmp = 0;

 tmp = (value / 1000);
 lcd_chr(y_pos, x_pos, (tmp + 48));
 tmp = ((value / 100) % 10);
 lcd_chr_cp((tmp + 48));
 tmp = ((value / 10) % 10);
 lcd_chr_cp((tmp + 48));
 tmp = (value % 10);
 lcd_chr_cp((tmp + 48));
}


float map(float v, float x_min, float x_max, float y_min, float y_max)
{
 return (y_min + (((y_max - y_min)/(x_max - x_min)) * (v - x_min)));
}
