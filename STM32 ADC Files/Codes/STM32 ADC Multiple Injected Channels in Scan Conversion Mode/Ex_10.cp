#line 1 "C:/Users/Shawon & Nipa/Desktop/ADC Examples/STM32 ADC Multiple Injected Channels in Scan Conversion Mode/Ex_10.c"
#line 1 "c:/users/shawon & nipa/desktop/adc examples/stm32 adc multiple injected channels in scan conversion mode/adc.h"
#line 1 "c:/users/shawon & nipa/desktop/adc examples/stm32 adc multiple injected channels in scan conversion mode/gpio.h"
#line 5 "C:/Users/Shawon & Nipa/Desktop/ADC Examples/STM32 ADC Multiple Injected Channels in Scan Conversion Mode/Ex_10.c"
sbit LCD_RS at GPIOB_ODR.B1;
sbit LCD_EN at GPIOB_ODR.B2;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;


unsigned int channel_data[2];


void setup();
void GPIO_init();
void ADC_init();
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);


void ADC1_2_ISR()
iv IVT_INT_ADC1_2
ics ICS_AUTO
{
 ADC2_SRbits.JEOC = 0;
 channel_data[0] = (ADC2_JDR1 & 0x0FFF);
 channel_data[1] = (ADC2_JDR2 & 0x0FFF);
}


void main()
{
 setup();

 while(1)
 {
  GPIOC_BSRR |= (1 << 13) ;
  ADC2_CR2bits.JSWSTART = 0x1 ;
 delay_ms(10);
 lcd_print(1, 2, channel_data[0]);
 lcd_print(13, 2, channel_data[1]);
  GPIOC_BRR |= (1 << 13) ;
 delay_ms(90);
 };
}


void setup()
{
 GPIO_init();
 LCD_Init();
 ADC_init();

 LCD_Cmd(_LCD_CLEAR);
 LCD_Cmd(_LCD_CURSOR_OFF);

 lcd_out(1, 1, "CH04        CH06");
}


void GPIO_init()
{
  RCC_APB2ENRbits.IOPAEN = 0x1 ;
  RCC_APB2ENRbits.IOPBEN = 0x1 ;
  RCC_APB2ENRbits.IOPCEN = 0x1 ;

  do{if((4 >= 0) && (4 < 8)){ do{GPIOA_CRL &= (~(0xF << (4 << 2))); GPIOA_CRL |= (0x0 << (4 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((4 - 8) << 2))); GPIOA_CRH |= (0x0 << ((4 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((6 >= 0) && (6 < 8)){ do{GPIOA_CRL &= (~(0xF << (6 << 2))); GPIOA_CRL |= (0x0 << (6 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((6 - 8) << 2))); GPIOA_CRH |= (0x0 << ((6 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((13 >= 0) && (13 < 8)){ do{GPIOC_CRL &= (~(0xF << (13 << 2))); GPIOC_CRL |= ((0x0 | 0x2) << (13 << 2));}while(0) ;}else{ do{GPIOC_CRH &= (~(0xF << ((13 - 8) << 2))); GPIOC_CRH |= ((0x0 | 0x2) << ((13 - 8) << 2));}while(0) ;}}while(0) ;
}


void ADC_init()
{
  do{RCC_APB2ENRbits.ADC2EN = 1; RCC_APB2RSTRbits.ADC2RST = 1; RCC_APB2RSTRbits.ADC2RST = 0;}while(0) ;
  do{ADC2_CR1 = 0; ADC2_CR2 = 0;}while(0) ;
  do{ADC1_CR1 &= (~(0xF << 16)); ADC1_CR1 |= ( 0x00  << 16);}while(0) ;
  ADC2_CR2bits.ALIGN = 0x00 ;
  ADC2_CR1bits.SCAN = 0x1 ;
  ADC2_CR2bits.CONT = 0x0 ;
  do{if((4 <= 9) && (4 >= 0)){ADC2_SMPR2 &= (~(0x7 << (4 * 3))); ADC2_SMPR2 |= ( 0x00  << (4 * 3));} else{ADC2_SMPR1 &= (~(0x7 << ((4 - 10) * 3))); ADC2_SMPR1 |= ( 0x00  << ((4 - 10) * 3));}}while(0) ;
  do{if((6 <= 9) && (6 >= 0)){ADC2_SMPR2 &= (~(0x7 << (6 * 3))); ADC2_SMPR2 |= ( 0x02  << (6 * 3));} else{ADC2_SMPR1 &= (~(0x7 << ((6 - 10) * 3))); ADC2_SMPR1 |= ( 0x02  << ((6 - 10) * 3));}}while(0) ;
  do{if(( 0x07  >= 0) && ( 0x07  < 8)){ADC2_CR2bits.JEXTTRIG = 1; ADC2_CR2 &= (~(0x7 << 12)); ADC2_CR2 |= ( 0x07  << 12);}else{ADC2_CR2bits.JEXTTRIG = 0;}}while(0) ;
  do{ADC2_JSQR &= (~(0x3 << 20)); ADC2_JSQR |= ((2 - 1) << 20);}while(0) ;
  do{ADC2_JSQR &= (~(0x1F << ((3 - 1) * 5))); ADC2_JSQR |= (4 << ((3 - 1) * 5));}while(0) ;
  do{ADC2_JSQR &= (~(0x1F << ((4 - 1) * 5))); ADC2_JSQR |= (6 << ((4 - 1) * 5));}while(0) ;
  ADC2_CR1bits.JEOCIE = 0x1 ;
 NVIC_IntEnable(IVT_INT_ADC1_2);
 EnableInterrupts();
  do{ADC2_CR2bits.RSTCAL = 1; ADC2_CR2bits.CAL = 1; while(ADC2_CR2bits.CAL == 1);}while(0) ;
  do{ADC2_CR2bits.ADON = 1; delay_ms(1); ADC2_CR2bits.ADON = 1;}while(0) ;
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
