_main:
;usart1.c,6 :: 		void main()
;usart1.c,8 :: 		unsigned char S = 0;
;usart1.c,10 :: 		setup();
BL	_setup+0
;usart1.c,12 :: 		while(1)
L_main0:
;usart1.c,14 :: 		S = USART1_receive();
BL	_USART1_receive+0
;usart1.c,15 :: 		USART1_send(S);
BL	_USART1_send+0
;usart1.c,16 :: 		};
IT	AL
BAL	L_main0
;usart1.c,17 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;usart1.c,20 :: 		void setup()
;usart1.c,22 :: 		RCC_APB2ENRbits.IOPAEN = 1;    //Enable GPIOA
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;usart1.c,23 :: 		RCC_APB2ENRbits.USART1EN = 1;  //Enable USART1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;usart1.c,24 :: 		GPIOA_CRH = 0x4A0;             //Set PA9 and PA10 as AFIO pins
MOVW	R1, #1184
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
STR	R1, [R0, #0]
;usart1.c,25 :: 		USART1_BRR = 0x341;            //Set value for required baud rate
MOVW	R1, #833
MOVW	R0, #lo_addr(USART1_BRR+0)
MOVT	R0, #hi_addr(USART1_BRR+0)
STR	R1, [R0, #0]
;usart1.c,26 :: 		USART1_CR1bits.UE = 1;         //Set USART1
MOVW	R0, #lo_addr(USART1_CR1bits+0)
MOVT	R0, #hi_addr(USART1_CR1bits+0)
STR	R2, [R0, #0]
;usart1.c,27 :: 		USART1_CR1bits.RE = 1;         //Set USART1 RX to receive incoming data
MOVW	R0, #lo_addr(USART1_CR1bits+0)
MOVT	R0, #hi_addr(USART1_CR1bits+0)
STR	R2, [R0, #0]
;usart1.c,28 :: 		USART1_CR1bits.TE = 1;         //Set USART1 TX to send data
MOVW	R0, #lo_addr(USART1_CR1bits+0)
MOVT	R0, #hi_addr(USART1_CR1bits+0)
STR	R2, [R0, #0]
;usart1.c,29 :: 		}
L_end_setup:
BX	LR
; end of _setup
_USART1_receive:
;usart1.c,32 :: 		unsigned char USART1_receive()
;usart1.c,34 :: 		while(USART1_SRbits.RXNE == 0);  //wait until data is available for reading
L_USART1_receive2:
MOVW	R1, #lo_addr(USART1_SRbits+0)
MOVT	R1, #hi_addr(USART1_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_USART1_receive3
IT	AL
BAL	L_USART1_receive2
L_USART1_receive3:
;usart1.c,35 :: 		return (0xFF & USART1_DR);       //return read data
MOVW	R0, #lo_addr(USART1_DR+0)
MOVT	R0, #hi_addr(USART1_DR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #255
UXTB	R0, R0
;usart1.c,36 :: 		}
L_end_USART1_receive:
BX	LR
; end of _USART1_receive
_USART1_send:
;usart1.c,39 :: 		void USART1_send(unsigned char value)
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
;usart1.c,41 :: 		USART1_DR = value;               //transfer data to DR register
MOVW	R1, #lo_addr(USART1_DR+0)
MOVT	R1, #hi_addr(USART1_DR+0)
STR	R0, [R1, #0]
; value end address is: 0 (R0)
;usart1.c,42 :: 		while(USART1_SRbits.TXE == 0);   //wait until data transmission is complete
L_USART1_send4:
MOVW	R2, #lo_addr(USART1_SRbits+0)
MOVT	R2, #hi_addr(USART1_SRbits+0)
LDR	R1, [R2, #0]
CMP	R1, #0
IT	NE
BNE	L_USART1_send5
IT	AL
BAL	L_USART1_send4
L_USART1_send5:
;usart1.c,43 :: 		}
L_end_USART1_send:
BX	LR
; end of _USART1_send
