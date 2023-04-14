void setup();


void main() 
{
     unsigned int dly = 600;

     setup();                              //set registers and chip peripherals

     while(1)
     {
           if(GPIOA_IDRbits.IDR0 == 1)            //Button not pressed
           {
               dly = 200;
           }
           else                                   //Button pressed
           {
               dly = 600;
           }

           GPIOB_BSRRbits.BR15 = 1;               //Write 1 on bit 15 for GPIOB
           Vdelay_ms(dly);                        //Wait for some time
           GPIOB_BSRRbits.BR15 = 0;               //Write 0 on bit 15 for GPIOB
           Vdelay_ms(dly);                        //Wait for some time
     };
}


void setup()
{
     //Enable required peripherals
     
     GPIO_Clk_Enable(&GPIOA_BASE);
     GPIO_Clk_Enable(&GPIOB_BASE);
    
     //Configure PA0 as an input with pullup
    
     GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_0, (_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP));
     
     //Configure PB15 as an output
     
     GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_15, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP));
}