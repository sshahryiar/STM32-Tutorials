#line 1 "C:/Users/Shawon & Nipa/Desktop/ADC Examples/STM32 ADC Single Injected Channel Continuous Conversion Mode Example/Ex_8.c"
#line 1 "c:/users/shawon & nipa/desktop/adc examples/stm32 adc single injected channel continuous conversion mode example/adc.h"
#line 1 "c:/users/shawon & nipa/desktop/adc examples/stm32 adc single injected channel continuous conversion mode example/gpio.h"
#line 5 "C:/Users/Shawon & Nipa/Desktop/ADC Examples/STM32 ADC Single Injected Channel Continuous Conversion Mode Example/Ex_8.c"
sbit LCD_RS at GPIOB_ODR.B1;
sbit LCD_EN at GPIOB_ODR.B2;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;


void setup();
void GPIO_init();
void ADC_init();
unsigned int read_ADC1();
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);
float map(float v, float x_min, float x_max, float y_min, float y_max);


void main()
{
 unsigned int adc_data = 0;
 float V = 0.0;

 setup();

 while(1)
 {
  GPIOC_BSRR |= (1 << 13) ;
 delay_ms(10);

 adc_data = read_ADC1();
 V = map(adc_data, 0, 4095, 0, 3300);
 lcd_print(13, 1, adc_data);
 lcd_print(13, 2, V);

  GPIOC_BRR |= (1 << 13) ;
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

 lcd_out(1, 1, "CH03:");
 lcd_out(2, 1, "V/mV:");
}


void GPIO_init()
{
  RCC_APB2ENRbits.IOPAEN = 0x1 ;
  RCC_APB2ENRbits.IOPBEN = 0x1 ;
  RCC_APB2ENRbits.IOPCEN = 0x1 ;

  do{if((3 >= 0) && (3 < 8)){ do{GPIOA_CRL &= (~(0xF << (3 << 2))); GPIOA_CRL |= (0x0 << (3 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((3 - 8) << 2))); GPIOA_CRH |= (0x0 << ((3 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((13 >= 0) && (13 < 8)){ do{GPIOC_CRL &= (~(0xF << (13 << 2))); GPIOC_CRL |= ((0x0 | 0x2) << (13 << 2));}while(0) ;}else{ do{GPIOC_CRH &= (~(0xF << ((13 - 8) << 2))); GPIOC_CRH |= ((0x0 | 0x2) << ((13 - 8) << 2));}while(0) ;}}while(0) ;
}


void ADC_init()
{
  do{RCC_APB2ENRbits.ADC1EN = 1; RCC_APB2RSTRbits.ADC1RST = 1; RCC_APB2RSTRbits.ADC1RST = 0;}while(0) ;
  do{ADC1_CR1 = 0; ADC1_CR2 = 0;}while(0) ;
  do{ADC1_CR1 &= (~(0xF << 16)); ADC1_CR1 |= ( 0x00  << 16);}while(0) ;
  ADC1_CR2bits.ALIGN = 0x00 ;
  ADC1_CR1bits.SCAN = 0x0 ;
  ADC1_CR2bits.CONT = 0x1 ;
  do{if((3 <= 9) && (3 >= 0)){ADC1_SMPR2 &= (~(0x7 << (3 * 3))); ADC1_SMPR2 |= ( 0x07  << (3 * 3));} else{ADC1_SMPR1 &= (~(0x7 << ((3 - 10) * 3))); ADC1_SMPR1 |= ( 0x07  << ((3 - 10) * 3));}}while(0) ;
  do{ADC1_JSQR &= (~(0x3 << 20)); ADC1_JSQR |= ((1 - 1) << 20);}while(0) ;
  do{ADC1_JSQR &= (~(0x1F << ((4 - 1) * 5))); ADC1_JSQR |= (3 << ((4 - 1) * 5));}while(0) ;
  do{if(( 0x07  >= 0) && ( 0x07  < 8)){ADC1_CR2bits.JEXTTRIG = 1; ADC1_CR2 &= (~(0x7 << 12)); ADC1_CR2 |= ( 0x07  << 12);}else{ADC1_CR2bits.JEXTTRIG = 0;}}while(0) ;
  do{ADC1_CR2bits.RSTCAL = 1; ADC1_CR2bits.CAL = 1; while(ADC1_CR2bits.CAL == 1);}while(0) ;
  do{ADC1_CR2bits.ADON = 1; delay_ms(1); ADC1_CR2bits.ADON = 1;}while(0) ;
}


unsigned int read_ADC1()
{
  ADC1_CR2bits.JSWSTART = 0x1 ;
 while(ADC1_SRbits.JEOC == 0);
 ADC1_SRbits.JEOC = 0;
 return (ADC1_JDR1 & 0x0FFF);
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
