#line 1 "C:/Users/Shawon & Nipa/Desktop/ADC Examples/STM32 ADC Multiple Injected Channels in Discontinuous Conversion Mode/EX_9.c"
#line 1 "c:/users/shawon & nipa/desktop/adc examples/stm32 adc multiple injected channels in discontinuous conversion mode/adc.h"
#line 1 "c:/users/shawon & nipa/desktop/adc examples/stm32 adc multiple injected channels in discontinuous conversion mode/gpio.h"
#line 5 "C:/Users/Shawon & Nipa/Desktop/ADC Examples/STM32 ADC Multiple Injected Channels in Discontinuous Conversion Mode/EX_9.c"
sbit LCD_RS at GPIOB_ODR.B1;
sbit LCD_EN at GPIOB_ODR.B2;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;


void setup();
void GPIO_init();
void ADC_init();
void read_ADC1_injected(unsigned int temp_data[3]);
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);


void main()
{
 unsigned int channel_data[3] = {0x0000, 0x0000, 0x0000};

 setup();

 while(1)
 {
 read_ADC1_injected(channel_data);
 lcd_print(1, 2, channel_data[0]);
 lcd_print(7, 2, channel_data[1]);
 lcd_print(13, 2, channel_data[2]);

  GPIOC_BSRR |= (1 << 13) ;
 delay_ms(10);
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

 lcd_out(1, 1, "CH00  CH01  CH02");
}


void GPIO_init()
{
  RCC_APB2ENRbits.IOPAEN = 0x1 ;
  RCC_APB2ENRbits.IOPBEN = 0x1 ;
  RCC_APB2ENRbits.IOPCEN = 0x1 ;

  do{if((0 >= 0) && (0 < 8)){ do{GPIOA_CRL &= (~(0xF << (0 << 2))); GPIOA_CRL |= (0x0 << (0 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((0 - 8) << 2))); GPIOA_CRH |= (0x0 << ((0 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((1 >= 0) && (1 < 8)){ do{GPIOA_CRL &= (~(0xF << (1 << 2))); GPIOA_CRL |= (0x0 << (1 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((1 - 8) << 2))); GPIOA_CRH |= (0x0 << ((1 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((2 >= 0) && (2 < 8)){ do{GPIOA_CRL &= (~(0xF << (2 << 2))); GPIOA_CRL |= (0x0 << (2 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((2 - 8) << 2))); GPIOA_CRH |= (0x0 << ((2 - 8) << 2));}while(0) ;}}while(0) ;
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
  do{ADC1_JSQR &= (~(0x3 << 20)); ADC1_JSQR |= ((3 - 1) << 20);}while(0) ;
  do{if((0 <= 9) && (0 >= 0)){ADC1_SMPR2 &= (~(0x7 << (0 * 3))); ADC1_SMPR2 |= ( 0x03  << (0 * 3));} else{ADC1_SMPR1 &= (~(0x7 << ((0 - 10) * 3))); ADC1_SMPR1 |= ( 0x03  << ((0 - 10) * 3));}}while(0) ;
  do{if((1 <= 9) && (1 >= 0)){ADC1_SMPR2 &= (~(0x7 << (1 * 3))); ADC1_SMPR2 |= ( 0x04  << (1 * 3));} else{ADC1_SMPR1 &= (~(0x7 << ((1 - 10) * 3))); ADC1_SMPR1 |= ( 0x04  << ((1 - 10) * 3));}}while(0) ;
  do{if((2 <= 9) && (2 >= 0)){ADC1_SMPR2 &= (~(0x7 << (2 * 3))); ADC1_SMPR2 |= ( 0x02  << (2 * 3));} else{ADC1_SMPR1 &= (~(0x7 << ((2 - 10) * 3))); ADC1_SMPR1 |= ( 0x02  << ((2 - 10) * 3));}}while(0) ;
  do{ADC1_JSQR &= (~(0x1F << ((1 - 1) * 5))); ADC1_JSQR |= (0 << ((1 - 1) * 5));}while(0) ;
  do{ADC1_JSQR &= (~(0x1F << ((2 - 1) * 5))); ADC1_JSQR |= (2 << ((2 - 1) * 5));}while(0) ;
  do{ADC1_JSQR &= (~(0x1F << ((3 - 1) * 5))); ADC1_JSQR |= (1 << ((3 - 1) * 5));}while(0) ;
  do{ADC1_CR1 &= (~(0x7 << 13)); ADC1_CR1 |= (3 << 13);}while(0) ;
  do{if(( 0x07  >= 0) && ( 0x07  < 8)){ADC1_CR2bits.JEXTTRIG = 1; ADC1_CR2 &= (~(0x7 << 12)); ADC1_CR2 |= ( 0x07  << 12);}else{ADC1_CR2bits.JEXTTRIG = 0;}}while(0) ;
  ADC1_CR1bits.JDISCEN = 0x1 ;
  do{ADC1_CR2bits.RSTCAL = 1; ADC1_CR2bits.CAL = 1; while(ADC1_CR2bits.CAL == 1);}while(0) ;
  do{ADC1_CR2bits.ADON = 1; delay_ms(1); ADC1_CR2bits.ADON = 1;}while(0) ;
}


void read_ADC1_injected(unsigned int temp_data[3])
{
  ADC1_CR2bits.JSWSTART = 0x1 ;
 while(ADC1_SRbits.JEOC == 0);
 temp_data[0] = (ADC1_JDR3 & 0x0FFF);
  ADC1_CR2bits.JSWSTART = 0x1 ;
 while(ADC1_SRbits.JEOC == 0);
 temp_data[1] = (ADC1_JDR2 & 0x0FFF);
  ADC1_CR2bits.JSWSTART = 0x1 ;
 while(ADC1_SRbits.JEOC == 0);
 temp_data[2] = (ADC1_JDR1 & 0x0FFF);
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
