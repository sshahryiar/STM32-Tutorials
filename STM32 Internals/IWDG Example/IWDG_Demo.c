/* Function prototypes */

void setup();
void setup_GPIO();
void setup_IWDG();


void main() 
{
     setup();
     
     while(1)
     {
             if(GPIOA_IDRbits.IDR9 == 0)  //If the switch is pressed
             {
                 GPIOC_BRRbits.BR9 = 1;   //Turn off LED
                 delay_ms(90);            //Wait for 90ms
                 GPIOC_BSRRbits.BS9 = 1;  //Turn on LED
                 delay_ms(90);            //Wait for 90ms
                 IWDG_KR = 0xAAAA;        //Reload IWDG
             }
     };
}


void setup()
{
     setup_GPIO();
     setup_IWDG();
     while(GPIOA_IDRbits.IDR9 == 1);      //Wait till the switch is pressed
}


void setup_GPIO()
{
     GPIO_Clk_Enable(&GPIOA_BASE);        //Enable clock for GPIOA
     GPIO_Clk_Enable(&GPIOC_BASE);        //Enable clock for GPIOC
     GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_9, (_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP));                                   //Set PA9 as a digital input with pull-up
     GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_9, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_OTYPE_PP | _GPIO_CFG_SPEED_2MHZ));          //Set PC9 as a digital output
     GPIOC_BSRRbits.BS9 = 0;              //Turn off LED
}


void setup_IWDG()
{
     IWDG_KR = 0x5555;    //Disable write protection of IWDG registers
     IWDG_PR = 0x06;      //Set PR value
     IWDG_RLR = 0xB4;     //Set RLR value
     IWDG_KR = 0xAAAA;    //Reload IWDG
     IWDG_KR = 0xCCCC;    //Start IWDG
}