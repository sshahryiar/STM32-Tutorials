#line 1 "C:/Users/Shawon & Nipa/Desktop/ADC Examples/STM32 ADC Multi-Single Channel Single Conversion Mode Example/EX_6.c"
#line 1 "c:/users/shawon & nipa/desktop/adc examples/stm32 adc multi-single channel single conversion mode example/adc.h"
#line 1 "c:/users/shawon & nipa/desktop/adc examples/stm32 adc multi-single channel single conversion mode example/gpio.h"
#line 5 "C:/Users/Shawon & Nipa/Desktop/ADC Examples/STM32 ADC Multi-Single Channel Single Conversion Mode Example/EX_6.c"
sbit LCD_RS at GPIOB_ODR.B1;
sbit LCD_EN at GPIOB_ODR.B2;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;


void setup();
void GPIO_init();
void ADC_init();
unsigned int read_ADC1(unsigned char channel, unsigned char sample_time);
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);


void main()
{
 unsigned int ch_a = 0;
 unsigned int ch_b = 0;
 unsigned int ch_c = 0;

 setup();

 while(1)
 {
 ch_a = read_ADC1(1,  0x07 );
 ch_b = read_ADC1(3,  0x00 );
 ch_c = read_ADC1(2,  0x03 );

 lcd_print(1, 2, ch_a);
 lcd_print(7, 2, ch_b);
 lcd_print(13, 2, ch_c);

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

 lcd_out(1, 1, "CH01  CH03  CH02");
}


void GPIO_init()
{
  RCC_APB2ENRbits.IOPAEN = 0x1 ;
  RCC_APB2ENRbits.IOPBEN = 0x1 ;
  RCC_APB2ENRbits.IOPCEN = 0x1 ;

  do{if((1 >= 0) && (1 < 8)){ do{GPIOA_CRL &= (~(0xF << (1 << 2))); GPIOA_CRL |= (0x0 << (1 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((1 - 8) << 2))); GPIOA_CRH |= (0x0 << ((1 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((2 >= 0) && (2 < 8)){ do{GPIOA_CRL &= (~(0xF << (2 << 2))); GPIOA_CRL |= (0x0 << (2 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((2 - 8) << 2))); GPIOA_CRH |= (0x0 << ((2 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((3 >= 0) && (3 < 8)){ do{GPIOA_CRL &= (~(0xF << (3 << 2))); GPIOA_CRL |= (0x0 << (3 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((3 - 8) << 2))); GPIOA_CRH |= (0x0 << ((3 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((13 >= 0) && (13 < 8)){ do{GPIOC_CRL &= (~(0xF << (13 << 2))); GPIOC_CRL |= ((0x0 | 0x2) << (13 << 2));}while(0) ;}else{ do{GPIOC_CRH &= (~(0xF << ((13 - 8) << 2))); GPIOC_CRH |= ((0x0 | 0x2) << ((13 - 8) << 2));}while(0) ;}}while(0) ;
}


void ADC_init()
{
  do{RCC_APB2ENRbits.ADC1EN = 1; RCC_APB2RSTRbits.ADC1RST = 1; RCC_APB2RSTRbits.ADC1RST = 0;}while(0) ;
  do{ADC1_CR1 = 0; ADC1_CR2 = 0;}while(0) ;
  do{ADC1_CR1 &= (~(0xF << 16)); ADC1_CR1 |= ( 0x00  << 16);}while(0) ;
  ADC1_CR2bits.ALIGN = 0x00 ;
  ADC1_CR2bits.CONT = 0x0 ;
  do{ADC1_SQR1 &= (~(0xF << 20)); ADC1_SQR1 |= ((1 - 1) << 20);}while(0) ;
  do{if(( 0x07  >= 0) && ( 0x07  < 8)){ADC1_CR2bits.EXTTRIG = 1; ADC1_CR2 &= (~(0x7 << 17)); ADC1_CR2 |= ( 0x07  << 17);}else{ADC1_CR2bits.EXTTRIG = 0;}}while(0) ;
  do{ADC1_CR2bits.RSTCAL = 1; ADC1_CR2bits.CAL = 1; while(ADC1_CR2bits.CAL == 1);}while(0) ;
  do{ADC1_CR2bits.ADON = 1; delay_ms(1); ADC1_CR2bits.ADON = 1;}while(0) ;
}


unsigned int read_ADC1(unsigned char channel, unsigned char sample_time)
{
 ADC1_JSQR = 0x00000000;
 ADC1_SQR1 = 0x00000000;
 ADC1_SQR2 = 0x00000000;
 ADC1_SQR3 = 0x00000000;
 ADC1_SMPR1 = 0x00000000;
 ADC1_SMPR2 = 0x00000000;
  do{if((1 >= 1) && (1 <= 6)){ADC1_SQR3 &= (~(0x1F << ((1 - 1) * 5))); ADC1_SQR3 |= (channel << ((1 - 1) * 5));}else if((1 >= 7) && (1 <= 12)){ADC1_SQR2 &= (~(0x1F << ((1 - 7) * 5))); ADC1_SQR2 |= (channel << ((1 - 7) * 5));}else{ADC1_SQR1 &= (~(0x1F << ((1 - 13) * 5))); ADC1_SQR1 |= (channel << ((1 - 13) * 5));}}while(0) ;
  do{if((channel <= 9) && (channel >= 0)){ADC1_SMPR2 &= (~(0x7 << (channel * 3))); ADC1_SMPR2 |= (sample_time << (channel * 3));} else{ADC1_SMPR1 &= (~(0x7 << ((channel - 10) * 3))); ADC1_SMPR1 |= (sample_time << ((channel - 10) * 3));}}while(0) ;
  ADC1_CR2bits.SWSTART = 0x1 ;
 while(ADC1_SRbits.EOC ==  0x00 );
 return (0x0FFF & ADC1_DR);
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
