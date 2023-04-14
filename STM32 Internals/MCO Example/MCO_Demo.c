void main() 
{
     GPIO_Clk_Enable(&GPIOA_BASE);           //Enable clock for  GPIOA
     GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_8, (_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_SPEED_50MHZ | _GPIO_CFG_OTYPE_PP));  //Set PA8 as a high speed digital output
     while(1)
     {
             //To do stuffs here
     };
}