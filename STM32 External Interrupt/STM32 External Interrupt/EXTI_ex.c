#define dly        60                   //Delay size


unsigned char s = 0;


void external_interrupt()               //ISR function  

iv IVT_INT_EXTI15_10                    //Interrupt Vector Address   
ics ICS_AUTO                            //Save interrupt context
{
      if((EXTI_PR & 0x00000800) != 0)   //Check if PE11 has trigger the interrupt
      {                                 
          s = 1;
          EXTI_PR |= 0x00000800;        //Clear PR11
      }
      if((EXTI_PR & 0x00001000) != 0)   //Check if PE12 has trigger the interrupt  
      {
          s = 2;
          EXTI_PR |= 0x00001000;        //Clear PR12 
      }
      if((EXTI_PR & 0x00002000) != 0)   //Check if PE13 has trigger the interrupt
      {
          s = 3;
          EXTI_PR |= 0x00002000;        //Clear PR13
      }                                                 
      if((EXTI_PR & 0x00004000) != 0)   //Check if PE14 has trigger the interrupt
      {
          s = 4;
          EXTI_PR |= 0x00004000;        //Clear PR14 
      }
      if((EXTI_PR & 0x00008000) != 0)   //Check if PE15 has trigger the interrupt 
      {            
          s = 5;
          EXTI_PR |= 0x00008000;        //Clear PR15 
      }
}
            

void setup()
{                                       
     RCC_APB2ENR = 0x00000045;          //Enable AFIO, GPIOA and GPIOE                              
     GPIOA_CRL = 0x22220000;            //Set GPIOA 4 - 7 as 2MHz Push-pull outputs
     GPIOE_CRH = 0x88888000;            //Set GPIOE 11 - 15 as digital inputs
     GPIOE_ODR = 0x0000F800;            //Enable pullups for Joystick / PE pins                                    
     GPIOA_ODR = 0x000000F0;            //Set LED / PA 4 - 7 pins high                           
                                                                       
     AFIO_EXTICR3 = 0x00004000;         //Select PE lines for EXTI interfaces                               
     AFIO_EXTICR4 = 0x00004444;         //Select PE lines for EXTI interfaces 
     EXTI_FTSR = 0x0000F800;            //Unmask bits 11 - 15 for interrupt on those lines 
     EXTI_IMR = 0x0000F800;

     NVIC_IntEnable(IVT_INT_EXTI15_10); //Enable NVIC interface
     EnableInterrupts();                //Enable global interrupt                      
}                                       


void main()
{
      setup();							//Initialize MCU

      while(1)                          //Super loop   
      {                                                
              switch(s)                   
              {
                  case 1:
                  {
                      GPIOA_ODR = 0x00000010;          //Turn PA4 LED high only       
                      delay_ms(dly);                   //Wait for some time              
                      GPIOA_ODR = 0x00000000;          //Turn off all LEDs  
                      delay_ms(dly);                   //Wait for some time                                    
                      break;                           
                  }
                  case 2:
                  {
                      GPIOA_ODR = 0x00000020;          //Turn PA5 LED high only  
                      delay_ms(dly);                   //Wait for some time 
                      GPIOA_ODR = 0x00000000;          //Turn off all LEDs  
                      delay_ms(dly);                   //Wait for some time
                      break;
                  }
                  case 3:
                  {                                     
                      GPIOA_ODR = 0x00000040;          //Turn PA6 LED high only    
                      delay_ms(dly);                   //Wait for some time 
                      GPIOA_ODR = 0x00000000;          //Turn off all LEDs  
                      delay_ms(dly);                   //Wait for some time  
                      break;
                  }
                  case 4:
                  {
                      GPIOA_ODR = 0x00000080;          //Turn PA7 LED high only  
                      delay_ms(dly);                   //Wait for some time 
                      GPIOA_ODR = 0x00000000;          //Turn off all LEDs
                      delay_ms(dly);                   //Wait for some time    
                      break;
                  }
                  case 5:
                  {                                                  
                      GPIOA_ODR = 0x00000050;          //Toggle LEDs
                      delay_ms(dly);                   //Wait for some time            
                      GPIOA_ODR = 0x000000A0;          //Toggle LEDs
                      delay_ms(dly);                   //Wait for some time           
                      break;
                  }
              }
      }
}
