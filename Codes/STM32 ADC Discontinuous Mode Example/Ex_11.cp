#line 1 "C:/Users/Shawon & Nipa/Desktop/ADC Examples/STM32 ADC Discontinuous Mode Example/Ex_11.c"
#line 1 "c:/users/shawon & nipa/desktop/adc examples/stm32 adc discontinuous mode example/adc.h"
#line 1 "c:/users/shawon & nipa/desktop/adc examples/stm32 adc discontinuous mode example/gpio.h"
#line 5 "C:/Users/Shawon & Nipa/Desktop/ADC Examples/STM32 ADC Discontinuous Mode Example/Ex_11.c"
sbit LCD_RS at GPIOB_ODR.B1;
sbit LCD_EN at GPIOB_ODR.B2;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;


unsigned char channel_no = 0;
unsigned int ch_data[3] = {0x0000, 0x0000, 0x0000};


void setup();
void GPIO_init();
void ADC_init();
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);


void ADC1_2_ISR()
iv IVT_INT_ADC1_2
ics ICS_AUTO
{
 ADC2_SRbits.EOC = 0;
 ch_data[channel_no] = (ADC2_DR & 0x0FFF);
 channel_no++;
}


void main()
{
 unsigned char s = 0;

 setup();

 while(1)
 {
  GPIOC_BSRR |= (1 << 13) ;
  ADC2_CR2bits.SWSTART = 0x1 ;
 while(channel_no < 3);
 channel_no = 0;
 for(s = 0 ; s < 3; s++)
 {
 lcd_print(((s * 6) + 1), 2, ch_data[s]);
 }
  GPIOC_BRR |= (1 << 13) ;
 };
}


void setup()
{
 GPIO_init();
 ADC_init();
 LCD_Init();

 LCD_Cmd(_LCD_CLEAR);
 LCD_Cmd(_LCD_CURSOR_OFF);

 lcd_out(1, 1, "CH02  CH00  CH01");
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
  do{RCC_APB2ENRbits.ADC2EN = 1; RCC_APB2RSTRbits.ADC2RST = 1; RCC_APB2RSTRbits.ADC2RST = 0;}while(0) ;
  do{ADC2_CR1 = 0; ADC2_CR2 = 0;}while(0) ;
  do{ADC1_CR1 &= (~(0xF << 16)); ADC1_CR1 |= ( 0x00  << 16);}while(0) ;
  ADC2_CR2bits.ALIGN = 0x00 ;
  ADC2_CR1bits.SCAN = 0x0 ;
  ADC2_CR2bits.CONT = 0x0 ;
  do{ADC2_SQR1 &= (~(0xF << 20)); ADC2_SQR1 |= ((3 - 1) << 20);}while(0) ;
  do{ADC2_CR1 &= (~(0x7 << 13)); ADC2_CR1 |= (3 << 13);}while(0) ;
  do{if((0 <= 9) && (0 >= 0)){ADC2_SMPR2 &= (~( 0x04  << (0x7 * 3))); ADC2_SMPR2 |= ( 0x04  << (0 * 3));} else{ADC2_SMPR1 &= (~(0x7 << ((0 - 10) * 3))); ADC2_SMPR1 |= ( 0x04  << ((0 - 10) * 3));}}while(0) ;
  do{if((1 <= 9) && (1 >= 0)){ADC2_SMPR2 &= (~( 0x02  << (0x7 * 3))); ADC2_SMPR2 |= ( 0x02  << (1 * 3));} else{ADC2_SMPR1 &= (~(0x7 << ((1 - 10) * 3))); ADC2_SMPR1 |= ( 0x02  << ((1 - 10) * 3));}}while(0) ;
  do{if((2 <= 9) && (2 >= 0)){ADC2_SMPR2 &= (~( 0x03  << (0x7 * 3))); ADC2_SMPR2 |= ( 0x03  << (2 * 3));} else{ADC2_SMPR1 &= (~(0x7 << ((2 - 10) * 3))); ADC2_SMPR1 |= ( 0x03  << ((2 - 10) * 3));}}while(0) ;
  do{if((1 >= 1) && (1 <= 6)){ADC2_SQR3 &= (~(0x1F << ((1 - 1) * 5))); ADC2_SQR3 |= (0 << ((1 - 1) * 5));}else if((1 >= 7) && (1 <= 12)){ADC2_SQR2 &= (~(0x1F << ((1 - 7) * 5))); ADC2_SQR2 |= (0 << ((1 - 7) * 5));}else{ADC2_SQR1 &= (~(0x1F << ((1 - 13) * 5))); ADC2_SQR1 |= (0 << ((1 - 13) * 5));}}while(0) ;
  do{if((2 >= 1) && (2 <= 6)){ADC2_SQR3 &= (~(0x1F << ((2 - 1) * 5))); ADC2_SQR3 |= (1 << ((2 - 1) * 5));}else if((2 >= 7) && (2 <= 12)){ADC2_SQR2 &= (~(0x1F << ((2 - 7) * 5))); ADC2_SQR2 |= (1 << ((2 - 7) * 5));}else{ADC2_SQR1 &= (~(0x1F << ((2 - 13) * 5))); ADC2_SQR1 |= (1 << ((2 - 13) * 5));}}while(0) ;
  do{if((3 >= 1) && (3 <= 6)){ADC2_SQR3 &= (~(0x1F << ((3 - 1) * 5))); ADC2_SQR3 |= (2 << ((3 - 1) * 5));}else if((3 >= 7) && (3 <= 12)){ADC2_SQR2 &= (~(0x1F << ((3 - 7) * 5))); ADC2_SQR2 |= (2 << ((3 - 7) * 5));}else{ADC2_SQR1 &= (~(0x1F << ((3 - 13) * 5))); ADC2_SQR1 |= (2 << ((3 - 13) * 5));}}while(0) ;
  do{if(( 0x07  >= 0) && ( 0x07  < 8)){ADC2_CR2bits.EXTTRIG = 1; ADC2_CR2 &= (~(0x7 << 17)); ADC2_CR2 |= ( 0x07  << 17);}else{ADC2_CR2bits.EXTTRIG = 0;}}while(0) ;
  ADC2_CR1bits.DISCEN = 0x1 ;
  ADC2_CR1bits.EOCIE = 0x1 ;
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
