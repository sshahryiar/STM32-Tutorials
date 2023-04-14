#line 1 "H:/Current Works/Transfer/Laptop to Desktop/USART Code Examples/STM32 USART/USART1.c"
void main()
{
 unsigned char ch = 0;

 UART1_Init_Advanced(9600, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART1_PA9_10);
 Delay_ms(100);

 while (1)
 {
 if (UART1_Data_Ready())
 {
 ch = UART1_Read();
 UART1_Write(ch);
 }
 }
}
