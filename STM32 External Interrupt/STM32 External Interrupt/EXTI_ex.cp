#line 1 "C:/Users/Shawon/Desktop/STM32 External Interrupt Example/STM32 External Interrupt/EXTI_ex.c"



unsigned char s = 0;


void external_interrupt()

iv IVT_INT_EXTI15_10
ics ICS_AUTO
{
 if((EXTI_PR & 0x00000800) != 0)
 {
 s = 1;
 EXTI_PR |= 0x00000800;
 }
 if((EXTI_PR & 0x00001000) != 0)
 {
 s = 2;
 EXTI_PR |= 0x00001000;
 }
 if((EXTI_PR & 0x00002000) != 0)
 {
 s = 3;
 EXTI_PR |= 0x00002000;
 }
 if((EXTI_PR & 0x00004000) != 0)
 {
 s = 4;
 EXTI_PR |= 0x00004000;
 }
 if((EXTI_PR & 0x00008000) != 0)
 {
 s = 5;
 EXTI_PR |= 0x00008000;
 }
}


void setup()
{
 RCC_APB2ENR = 0x00000045;
 GPIOA_CRL = 0x22220000;
 GPIOE_CRH = 0x88888000;
 GPIOE_ODR = 0x0000F800;
 GPIOA_ODR = 0x000000F0;

 AFIO_EXTICR3 = 0x00004000;
 AFIO_EXTICR4 = 0x00004444;
 EXTI_FTSR = 0x0000F800;
 EXTI_IMR = 0x0000F800;

 NVIC_IntEnable(IVT_INT_EXTI15_10);
 EnableInterrupts();
}


void main()
{
 setup();

 while(1)
 {
 switch(s)
 {
 case 1:
 {
 GPIOA_ODR = 0x00000010;
 delay_ms( 60 );
 GPIOA_ODR = 0x00000000;
 delay_ms( 60 );
 break;
 }
 case 2:
 {
 GPIOA_ODR = 0x00000020;
 delay_ms( 60 );
 GPIOA_ODR = 0x00000000;
 delay_ms( 60 );
 break;
 }
 case 3:
 {
 GPIOA_ODR = 0x00000040;
 delay_ms( 60 );
 GPIOA_ODR = 0x00000000;
 delay_ms( 60 );
 break;
 }
 case 4:
 {
 GPIOA_ODR = 0x00000080;
 delay_ms( 60 );
 GPIOA_ODR = 0x00000000;
 delay_ms( 60 );
 break;
 }
 case 5:
 {
 GPIOA_ODR = 0x00000050;
 delay_ms( 60 );
 GPIOA_ODR = 0x000000A0;
 delay_ms( 60 );
 break;
 }
 }
 }
}
