/* Function prototypes */

void setup();
void setup_GPIO();
void setup_WWDG();


void WWDG_ISR()
iv IVT_INT_WWDG ics ICS_AUTO        //WWDG early wakeup interrupt function
{
   unsigned char cnt = 0;           //Temporary variables for counter and window values
   unsigned char wdt = 0;
   
   wdt = (WWDG_CFR & 0x7F);         //Read window value
   cnt = (WWDG_CR & 0x7F);          //Read counter value
   
   if(cnt < wdt)                    //If counter is less than window value
   {
       WWDG_CR |= 0x7F;             //Reload the counter
       WWDG_SR = 0x00;              //Clear interrupt flag
       GPIOC_ODRbits.ODR9 ^= 1;     //Toggle WWDG LED
   }
}


void main()
{
     setup();

     while(1)
     {
             GPIOC_ODRbits.ODR12 ^= 1;       //Toggle main LED
             delay_ms(300);                  //Wait for 300ms
             if(GPIOA_IDRbits.IDR9 == 0)     //If button is pressed
             {
                 WWDG_CR = 0x80;             //Force the counter to zero
                 while(1);                   //Get stuck into an infinity loop
             }
     };
}


void setup()
{
     setup_GPIO();
     setup_WWDG();
}


void setup_GPIO()
{
     GPIO_Clk_Enable(&GPIOA_BASE);           //Enable clock for GPIOA
     GPIO_Clk_Enable(&GPIOC_BASE);           //Enable clock for GPIOC
     GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_9, (_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP));        //Set PA9 as a digital input with pull-up
     GPIO_Config(&GPIOC_BASE, (_GPIO_PINMASK_9 | _GPIO_PINMASK_12), (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_OTYPE_PP | _GPIO_CFG_SPEED_2MHZ));       //Set PC9 and PC12 as digital outputs
     GPIOC_ODRbits.ODR9 = 0;                 //Turn off WWDG LED at first
     GPIOC_ODRbits.ODR12 = 1;                //Turn on main LED at first
     delay_ms(1000);                         //Wait for a second
}


void setup_WWDG()
{
     RCC_APB1ENRbits.WWDGEN = 1;             //Enable clock for WWDG module
     WWDG_CFR = 0x3DF;                       //Set WWDG_CFR register
     WWDG_SR = 0x00;                         //Clear interrupt flag
     WWDG_CR = 0xFF;                         //Turn on WWDG and load the counter
     NVIC_IntEnable(IVT_INT_WWDG);           //Enable NVIC for WWDG interrupt
     EnableInterrupts();
}