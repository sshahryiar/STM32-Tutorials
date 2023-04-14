unsigned char rcv = 0;


void setup();
void USART1_send(unsigned char value);


void data_received()            
iv IVT_INT_USART1 ics ICS_AUTO          //RX interrupt subroutine
{                                  
   if(USART1_SRbits.RXNE == 1)          //RX buffer not empty                         
   {
       rcv = (0xFF & USART1_DR);        //Read data from data register                     
   }
   
   USART1_send(rcv);                    //Send received data                             
}


void main() 
{
     setup();                    
                     
     while(1);
}


void setup()
{
     RCC_APB2ENRbits.IOPAEN = 1;            //Enable GPIOA
     RCC_APB2ENRbits.USART1EN = 1;          //Enable USART1
     GPIOA_CRH = 0x4A0;                     //Set PA9 and PA10 as AFIO pins 
     USART1_BRR = 0x341;                    //Set value for required baud rate
     USART1_CR1bits.UE = 1;                 //Set USART1
     USART1_CR1bits.RE = 1;                 //Set USART1 RX to receive incoming data
     USART1_CR1bits.TE = 1;                 //Set USART1 TX to send data
     USART1_CR1bits.RXNEIE = 1;             //Enable RX interrupt 
     NVIC_IntEnable(IVT_INT_USART1);                                    
}



void USART1_send(unsigned char value)
{                                       
     USART1_DR = value;                 //transfer data to DR register
     while(USART1_SRbits.TXE == 0);     //wait until data transmission is complete 
}                                       