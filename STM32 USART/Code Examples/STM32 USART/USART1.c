void main()
{
  unsigned char ch = 0;
  
  UART1_Init_Advanced(9600, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART1_PA9_10);
  Delay_ms(100);                  // Wait for UART module to stabilize

  while (1) 
  {                     
            if (UART1_Data_Ready())       // If data is received     
            {     
                    ch = UART1_Read();     // read the received data
                    UART1_Write(ch);       // and send data via UART
            }    
  }
}