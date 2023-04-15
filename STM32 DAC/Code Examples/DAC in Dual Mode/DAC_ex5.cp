#line 1 "C:/Users/Shawon & Nipa/Desktop/ARM Media/Codes/DAC in Dual Mode/DAC_ex5.c"
#line 1 "c:/users/shawon & nipa/desktop/arm media/codes/dac in dual mode/dac.h"
#line 1 "c:/users/shawon & nipa/desktop/arm media/codes/dac in dual mode/gpio.h"
#line 1 "c:/users/shawon & nipa/desktop/arm media/codes/dac in dual mode/afio.h"
#line 1 "c:/users/shawon & nipa/desktop/arm media/codes/dac in dual mode/ex_int.h"
#line 7 "C:/Users/Shawon & Nipa/Desktop/ARM Media/Codes/DAC in Dual Mode/DAC_ex5.c"
void setup();
void GPIO_setup();
void AFIO_setup();
void DAC_setup();


void ext_int()
iv IVT_INT_EXTI9_5
ics ICS_AUTO
{
 if( (EXTI_PR & (1 << 9))  != 0)
 {
  EXTI_PR |= (1 << 9) ;
  (GPIOA_ODR &= (~(1 << 6))) ;
 delay_ms(200);
  (GPIOA_ODR |= (1 << 6)) ;
 }
}


void main()
{
 signed int value = 0;

 setup();

 while(1)
 {
 if( (GPIOF_IDR & (1 << 13))  == 0)
 {
 delay_ms(10);
 value++;
 }

 if( (GPIOF_IDR & (1 << 14))  == 0)
 {
 delay_ms(10);
 value--;
 }

 if(value > 2047)
 {
 value = 2047;
 }
 if(value < 0)
 {
 value = 0;
 }
  DAC_SWTRIGRbits.SWTRIG1 = 0x01 ;
 DAC_DHR12RD = (((unsigned int)value) | 0x00FF0000);
 };
}


void setup()
{
 GPIO_setup();
 AFIO_setup();
 DAC_setup();
}


void GPIO_setup()
{
  RCC_APB2ENRbits.IOPAEN = 0x01 ;
  do{GPIOA_CRL &= (~(0xF << (4 << 2))); GPIOA_CRL |= ( 0x00  << (4 << 2));}while(0) ;
  do{GPIOA_CRL &= (~(0xF << (5 << 2))); GPIOA_CRL |= ( 0x00  << (5 << 2));}while(0) ;
  do{GPIOA_CRL &= (~(0xF << (6 << 2))); GPIOA_CRL |= (( 0x02  | 0x00 ) << (6 << 2));}while(0) ;

  RCC_APB2ENRbits.IOPFEN = 0x01 ;
  do{GPIOF_CRH &= (~(0xF << ((13 - 8) << 2))); GPIOF_CRH |= ( 0x08  << ((13 - 8) << 2));}while(0) ;
  do{GPIOF_CRH &= (~(0xF << ((14 - 8) << 2))); GPIOF_CRH |= ( 0x08  << ((14 - 8) << 2));}while(0) ;
  (GPIOF_ODR |= (1 << 13)) ;
  (GPIOF_ODR |= (1 << 14)) ;

}


void AFIO_setup()
{
  RCC_APB2ENRbits.AFIOEN = 0x01 ;
  do{GPIOA_CRH &= (~(0xF << ((9 - 8) << 2))); GPIOA_CRH |= ( 0x08  << ((9 - 8) << 2));}while(0) ;
  (GPIOA_ODR |= (1 << 9)) ;
  (GPIOA_ODR |= (1 << 6)) ;
  AFIO_EXTICR3 |= ( 0x00  << ((9 - 8) << 2)) ;
  EXTI_FTSR |= (1 << 9) ;
  EXTI_IMR |= (1 << 9) ;
 NVIC_IntEnable(IVT_INT_EXTI9_5);
 EnableInterrupts();
}


void DAC_setup()
{
  RCC_APB1ENRbits.DACEN = 0x01 ;
  DAC_CR = 0x00000000 ;

  DAC_CRbits.BOFF1 = 0x01 ;
  DAC_CRbits.TEN1 = 0x01 ;
  do{if(DAC_CRbits.TEN1 == 0x01 ){DAC_CR &= (~(0x7 << 3)); DAC_CR |= ( 0x07  << 3);}}while(0) ;
  do{if(DAC_CRbits.TEN1 == 0x01 ){DAC_CR &= (~(0x3 << 6)); DAC_CR |= ( 0x02  << 6);}}while(0) ;
  do{DAC_CR &= (~(0xF << 8)); DAC_CR |= (0x08 << 8);}while(0) ;
  DAC_CRbits.EN1 = 0x01 ;

  DAC_CRbits.BOFF2 = 0x01 ;
  DAC_CRbits.TEN2 = 0x01 ;
  do{if(DAC_CRbits.TEN2 == 0x01 ){DAC_CR &= (~(0x7 << 19)); DAC_CR |= ( 0x06  << 19);}}while(0) ;
  do{if(DAC_CRbits.TEN2 == 0x01 ){DAC_CR &= (~(0x3 << 22)); DAC_CR |= ( 0x01  << 22);}}while(0) ;
  do{DAC_CR &= (~(0xF << 24)); DAC_CR |= (0x3AA << 24);}while(0) ;
  DAC_CRbits.EN2 = 0x01 ;

 DAC_DHR12RD = 0x00FF0000;
}
