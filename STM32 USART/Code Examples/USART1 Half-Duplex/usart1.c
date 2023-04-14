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
     RCC_APB2ENRbits.IOPAEN = 1;    //Enable GPIOA
     RCC_APB2ENRbits.USART1EN = 1;  //Enable USART1
     GPIOA_CRH = 0x4A0;             //Set PA9 and PA10 as AFIO pins
     USART1_BRR = 0x341;            //Set value for required baud rate
     USART1_CR1bits.UE = 1;         //Set USART1
     USART1_CR1bits.RE = 1;         //Set USART1 RX to receive incoming data
     USART1_CR1bits.TE = 1;         //Set USART1 TX to send data
}


unsigned char USART1_receive()
{
     while(USART1_SRbits.RXNE == 0);  //wait until data is available for reading
     return (0xFF & USART1_DR);       //return read data
}


void USART1_send(unsigned char value)
{
     USART1_DR = value;               //transfer data to DR register   
     while(USART1_SRbits.TXE == 0);   //wait until data transmission is complete 
}