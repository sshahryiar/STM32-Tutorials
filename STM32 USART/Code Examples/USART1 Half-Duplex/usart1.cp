#line 1 "H:/Current Works/Transfer/Laptop to Desktop/USART Code Examples/USART1 Half-Duplex/usart1.c"
void setup();
unsigned char USART1_receive();
void USART1_send(unsigned char value);


void main()
{
 unsigned char S = 0;

 setup();

 while(1)
 {
 S = USART1_receive();
 USART1_send(S);
 };
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
}


unsigned char USART1_receive()
{
 while(USART1_SRbits.RXNE == 0);
 return (0xFF & USART1_DR);
}


void USART1_send(unsigned char value)
{
 USART1_DR = value;
 while(USART1_SRbits.TXE == 0);
}
