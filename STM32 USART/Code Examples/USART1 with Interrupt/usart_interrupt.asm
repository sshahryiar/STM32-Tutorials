_data_received:
;usart_interrupt.c,9 :: 		iv IVT_INT_USART1 ics ICS_AUTO          //RX interrupt subroutine
SUB	SP, SP, #4
STR	LR, [SP, #0]
;usart_interrupt.c,11 :: 		if(USART1_SRbits.RXNE == 1)          //RX buffer not empty
MOVW	R1, #lo_addr(USART1_SRbits+0)
MOVT	R1, #hi_addr(USART1_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_data_received0
;usart_interrupt.c,13 :: 		rcv = (0xFF & USART1_DR);        //Read data from data register
MOVW	R0, #lo_addr(USART1_DR+0)
MOVT	R0, #hi_addr(USART1_DR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #255
MOVW	R0, #lo_addr(_rcv+0)
MOVT	R0, #hi_addr(_rcv+0)
STRB	R1, [R0, #0]
;usart_interrupt.c,14 :: 		}
L_data_received0:
;usart_interrupt.c,16 :: 		USART1_send(rcv);                    //Send received data
MOVW	R0, #lo_addr(_rcv+0)
MOVT	R0, #hi_addr(_rcv+0)
LDRB	R0, [R0, #0]
BL	_USART1_send+0
;usart_interrupt.c,17 :: 		}
L_end_data_received:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _data_received
_main:
;usart_interrupt.c,20 :: 		void main()
;usart_interrupt.c,22 :: 		setup();
BL	_setup+0
;usart_interrupt.c,24 :: 		while(1);
L_main1:
IT	AL
BAL	L_main1
;usart_interrupt.c,25 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;usart_interrupt.c,28 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;usart_interrupt.c,30 :: 		RCC_APB2ENRbits.IOPAEN = 1;            //Enable GPIOA
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;usart_interrupt.c,31 :: 		RCC_APB2ENRbits.USART1EN = 1;          //Enable USART1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;usart_interrupt.c,32 :: 		GPIOA_CRH = 0x4A0;                     //Set PA9 and PA10 as AFIO pins
MOVW	R1, #1184
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
STR	R1, [R0, #0]
;usart_interrupt.c,33 :: 		USART1_BRR = 0x341;                    //Set value for required baud rate
MOVW	R1, #833
MOVW	R0, #lo_addr(USART1_BRR+0)
MOVT	R0, #hi_addr(USART1_BRR+0)
STR	R1, [R0, #0]
;usart_interrupt.c,34 :: 		USART1_CR1bits.UE = 1;                 //Set USART1
MOVW	R0, #lo_addr(USART1_CR1bits+0)
MOVT	R0, #hi_addr(USART1_CR1bits+0)
STR	R2, [R0, #0]
;usart_interrupt.c,35 :: 		USART1_CR1bits.RE = 1;                 //Set USART1 RX to receive incoming data
MOVW	R0, #lo_addr(USART1_CR1bits+0)
MOVT	R0, #hi_addr(USART1_CR1bits+0)
STR	R2, [R0, #0]
;usart_interrupt.c,36 :: 		USART1_CR1bits.TE = 1;                 //Set USART1 TX to send data
MOVW	R0, #lo_addr(USART1_CR1bits+0)
MOVT	R0, #hi_addr(USART1_CR1bits+0)
STR	R2, [R0, #0]
;usart_interrupt.c,37 :: 		USART1_CR1bits.RXNEIE = 1;             //Enable RX interrupt
MOVW	R0, #lo_addr(USART1_CR1bits+0)
MOVT	R0, #hi_addr(USART1_CR1bits+0)
STR	R2, [R0, #0]
;usart_interrupt.c,38 :: 		NVIC_IntEnable(IVT_INT_USART1);
MOVW	R0, #53
BL	_NVIC_IntEnable+0
;usart_interrupt.c,39 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_USART1_send:
;usart_interrupt.c,43 :: 		void USART1_send(unsigned char value)
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
;usart_interrupt.c,45 :: 		USART1_DR = value;                 //transfer data to DR register
MOVW	R1, #lo_addr(USART1_DR+0)
MOVT	R1, #hi_addr(USART1_DR+0)
STR	R0, [R1, #0]
; value end address is: 0 (R0)
;usart_interrupt.c,46 :: 		while(USART1_SRbits.TXE == 0);     //wait until data transmission is complete
L_USART1_send3:
MOVW	R2, #lo_addr(USART1_SRbits+0)
MOVT	R2, #hi_addr(USART1_SRbits+0)
LDR	R1, [R2, #0]
CMP	R1, #0
IT	NE
BNE	L_USART1_send4
IT	AL
BAL	L_USART1_send3
L_USART1_send4:
;usart_interrupt.c,47 :: 		}
L_end_USART1_send:
BX	LR
; end of _USART1_send
