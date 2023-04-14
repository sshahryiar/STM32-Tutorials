#line 1 "C:/Users/Shawon & Nipa/Desktop/ADC Examples/STM32 ADC Dual Conversion Mode/Ex_12.c"
#line 1 "c:/users/shawon & nipa/desktop/adc examples/stm32 adc dual conversion mode/adc.h"
#line 1 "c:/users/shawon & nipa/desktop/adc examples/stm32 adc dual conversion mode/gpio.h"
#line 5 "C:/Users/Shawon & Nipa/Desktop/ADC Examples/STM32 ADC Dual Conversion Mode/Ex_12.c"
sbit LCD_RS at GPIOB_ODR.B1;
sbit LCD_EN at GPIOB_ODR.B2;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;


register unsigned long adc_data = 0;


void setup();
void GPIO_init();
void ADC_init();
void setup_ADC1();
void setup_ADC2();
void setup_common_ADC_settings();
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);


void ADC1_2_ISR()
iv IVT_INT_ADC1_2
ics ICS_AUTO
{
 ADC1_SRbits.EOC = 0;
 ADC2_SRbits.EOC = 0;
 adc_data = adc1_dr;
  GPIOC_BSRR |= (1 << 13) ;
}


void main()
{
 unsigned int adc1_data = 0;
 unsigned int adc2_data = 0;

 setup();

 while(1)
 {
  ADC1_CR2bits.SWSTART = 0x1 ;

 adc1_data = (adc_data & 0x00000FFF);
 adc2_data = ((adc_data & 0x0FFF0000) >> 16);

 lcd_print(1, 2, adc1_data);
 lcd_print(13, 2, adc2_data);

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

 lcd_out(1, 1, "CH00        CH01");
}


void GPIO_init()
{
  RCC_APB2ENRbits.IOPAEN = 0x1 ;
  RCC_APB2ENRbits.IOPBEN = 0x1 ;
  RCC_APB2ENRbits.IOPCEN = 0x1 ;
  do{if((0 >= 0) && (0 < 8)){ do{GPIOA_CRL &= (~(0xF << (0 << 2))); GPIOA_CRL |= (0x0 << (0 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((0 - 8) << 2))); GPIOA_CRH |= (0x0 << ((0 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((1 >= 0) && (1 < 8)){ do{GPIOA_CRL &= (~(0xF << (1 << 2))); GPIOA_CRL |= (0x0 << (1 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((1 - 8) << 2))); GPIOA_CRH |= (0x0 << ((1 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((13 >= 0) && (13 < 8)){ do{GPIOC_CRL &= (~(0xF << (13 << 2))); GPIOC_CRL |= ((0x0 | 0x2) << (13 << 2));}while(0) ;}else{ do{GPIOC_CRH &= (~(0xF << ((13 - 8) << 2))); GPIOC_CRH |= ((0x0 | 0x2) << ((13 - 8) << 2));}while(0) ;}}while(0) ;
}


void ADC_init()
{
 setup_ADC1();
 setup_ADC2();
 setup_common_ADC_settings();
}


void setup_ADC1()
{
  do{RCC_APB2ENRbits.ADC1EN = 1; RCC_APB2RSTRbits.ADC1RST = 1; RCC_APB2RSTRbits.ADC1RST = 0;}while(0) ;
  do{ADC1_CR1 = 0; ADC1_CR2 = 0;}while(0) ;
  ADC1_CR2bits.ALIGN = 0x00 ;
  ADC1_CR1bits.SCAN = 0x0 ;
  ADC1_CR2bits.CONT = 0x0 ;
  do{if((0 <= 9) && (0 >= 0)){ADC1_SMPR2 &= (~(0x7 << (0 * 3))); ADC1_SMPR2 |= ( 0x04  << (0 * 3));} else{ADC1_SMPR1 &= (~(0x7 << ((0 - 10) * 3))); ADC1_SMPR1 |= ( 0x04  << ((0 - 10) * 3));}}while(0) ;
  do{if(( 0x07  >= 0) && ( 0x07  < 8)){ADC1_CR2bits.EXTTRIG = 1; ADC1_CR2 &= (~(0x7 << 17)); ADC1_CR2 |= ( 0x07  << 17);}else{ADC1_CR2bits.EXTTRIG = 0;}}while(0) ;
  do{ADC1_SQR1 &= (~(0xF << 20)); ADC1_SQR1 |= ((1 - 1) << 20);}while(0) ;
  do{if((1 >= 1) && (1 <= 6)){ADC1_SQR3 &= (~(0x1F << ((1 - 1) * 5))); ADC1_SQR3 |= (0 << ((1 - 1) * 5));}else if((1 >= 7) && (1 <= 12)){ADC1_SQR2 &= (~(0x1F << ((1 - 7) * 5))); ADC1_SQR2 |= (0 << ((1 - 7) * 5));}else{ADC1_SQR1 &= (~(0x1F << ((1 - 13) * 5))); ADC1_SQR1 |= (0 << ((1 - 13) * 5));}}while(0) ;
  ADC1_CR1bits.EOCIE = 0x1 ;
  do{ADC1_CR2bits.RSTCAL = 1; ADC1_CR2bits.CAL = 1; while(ADC1_CR2bits.CAL == 1);}while(0) ;
  do{ADC1_CR2bits.ADON = 1; delay_ms(1); ADC1_CR2bits.ADON = 1;}while(0) ;
}


void setup_ADC2()
{
  do{RCC_APB2ENRbits.ADC2EN = 1; RCC_APB2RSTRbits.ADC2RST = 1; RCC_APB2RSTRbits.ADC2RST = 0;}while(0) ;
  do{ADC2_CR1 = 0; ADC2_CR2 = 0;}while(0) ;
  ADC2_CR2bits.ALIGN = 0x00 ;
  ADC2_CR1bits.SCAN = 0x0 ;
  ADC2_CR2bits.CONT = 0x0 ;
  do{if((1 <= 9) && (1 >= 0)){ADC2_SMPR2 &= (~( 0x04  << (0x7 * 3))); ADC2_SMPR2 |= ( 0x04  << (1 * 3));} else{ADC2_SMPR1 &= (~(0x7 << ((1 - 10) * 3))); ADC2_SMPR1 |= ( 0x04  << ((1 - 10) * 3));}}while(0) ;
  do{if(( 0x07  >= 0) && ( 0x07  < 8)){ADC2_CR2bits.EXTTRIG = 1; ADC2_CR2 &= (~(0x7 << 17)); ADC2_CR2 |= ( 0x07  << 17);}else{ADC2_CR2bits.EXTTRIG = 0;}}while(0) ;
  do{ADC2_SQR1 &= (~(0xF << 20)); ADC2_SQR1 |= ((1 - 1) << 20);}while(0) ;
  do{if((1 >= 1) && (1 <= 6)){ADC2_SQR3 &= (~(0x1F << ((1 - 1) * 5))); ADC2_SQR3 |= (1 << ((1 - 1) * 5));}else if((1 >= 7) && (1 <= 12)){ADC2_SQR2 &= (~(0x1F << ((1 - 7) * 5))); ADC2_SQR2 |= (1 << ((1 - 7) * 5));}else{ADC2_SQR1 &= (~(0x1F << ((1 - 13) * 5))); ADC2_SQR1 |= (1 << ((1 - 13) * 5));}}while(0) ;
  ADC2_CR1bits.EOCIE = 0x1 ;
  do{ADC2_CR2bits.RSTCAL = 1; ADC2_CR2bits.CAL = 1; while(ADC2_CR2bits.CAL == 1);}while(0) ;
  do{ADC2_CR2bits.ADON = 1; delay_ms(1); ADC2_CR2bits.ADON = 1;}while(0) ;
}


void setup_common_ADC_settings()
{
  ADC1_CR2bits.DMA_ = 0x1 ;
  do{ADC1_CR1 &= (~(0xF << 16)); ADC1_CR1 |= ( 0x06  << 16);}while(0) ;
 NVIC_IntEnable(IVT_INT_ADC1_2);
 EnableInterrupts();
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
