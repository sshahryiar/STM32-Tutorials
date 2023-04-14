#line 1 "H:/Current Works/Transfer/Laptop to Desktop/USART Code Examples/USART1 with Interrupt/usart_interrupt.c"
unsigned char rcv = 0;


void setup();
void USART1_send(unsigned char value);


void data_received()
iv IVT_INT_USART1 ics ICS_AUTO
{
 if(USART1_SRbits.RXNE == 1)
 {
 rcv = (0xFF & USART1_DR);
 }

 USART1_send(rcv);
}


void main()
{
 setup();

 while(1);
}


void setup()
{
 RCC_APB2ENRbits.IOPAEN = 1;
 RCC_APB2ENRbits.USART1EN = 1;
 GPIOA_CRH = 0x4A0;
 USART1_BRR = 0x341;
 USART1_CR1bits.UE = 1;
 USART1_CR1bits.RE = 1;
 USART1_CR1bits.TE = 1;
 USART1_CR1bits.RXNEIE = 1;
 NVIC_IntEnable(IVT_INT_USART1);
}



void USART1_send(unsigned char value)
{
 USART1_DR = value;
 while(USART1_SRbits.TXE == 0);
}
