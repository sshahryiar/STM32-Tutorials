void setup();


void main()
{
     unsigned int dly = 600;

     setup();                              //set registers and chip peripherals

     while(1)
     {
           if(GPIOA_IDRbits.IDR0)                          //Button not pressed
           {
               dly = 200;
           }
           else                                                //Button pressed
           {
               dly = 600;
           }

           GPIOB_BSRRbits.BS15 = 1;                 //Turn on LED
           Vdelay_ms(dly);                          //Wait for some time
           GPIOB_BRRbits.BR15 = 1;                  //Turn off LED
           Vdelay_ms(dly);                          //Wait for some time
     };

}


void setup()
{
     //Enable clock only for the required peripherals

     RCC_APB2ENRbits.IOPAEN = 1;
     RCC_APB2ENRbits.IOPBEN = 1;

     // All IO Control Registers are set to reset state
     // to make them floating inputs

     GPIOA_CRL = 0x44444444;
     GPIOA_CRH = 0x44444444;
     GPIOB_CRL = 0x44444444;
     GPIOB_CRH = 0x44444444;
     GPIOC_CRL = 0x44444444;
     GPIOC_CRH = 0x44444444;
     GPIOD_CRL = 0x44444444;
     GPIOD_CRH = 0x44444444;

     //Set PA0 as an input with pull-up
     
     GPIOA_CRLbits.MODE0 = 0x0;
     GPIOA_CRLbits.CNF0 = 0x2;
     GPIOA_ODRbits.ODR0 = 0x1;
     
     //Set PB15 as an output
     
     GPIOB_CRHbits.MODE15 = 0x2;
     GPIOB_CRHbits.CNF15 = 0x0;
}