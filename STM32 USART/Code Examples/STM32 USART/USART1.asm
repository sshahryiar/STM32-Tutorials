_main:
;USART1.c,1 :: 		void main()
;USART1.c,3 :: 		unsigned char ch = 0;
;USART1.c,5 :: 		UART1_Init_Advanced(9600, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART1_PA9_10);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART1_PA9_10+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART1_PA9_10+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOVW	R0, #9600
BL	_UART1_Init_Advanced+0
ADD	SP, SP, #4
;USART1.c,6 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
MOVW	R7, #4521
MOVT	R7, #4
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
;USART1.c,8 :: 		while (1)
L_main2:
;USART1.c,10 :: 		if (UART1_Data_Ready())       // If data is received
BL	_UART1_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L_main4
;USART1.c,12 :: 		ch = UART1_Read();     // read the received data
BL	_UART1_Read+0
;USART1.c,13 :: 		UART1_Write(ch);       // and send data via UART
UXTB	R0, R0
BL	_UART1_Write+0
;USART1.c,14 :: 		}
L_main4:
;USART1.c,15 :: 		}
IT	AL
BAL	L_main2
;USART1.c,16 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
