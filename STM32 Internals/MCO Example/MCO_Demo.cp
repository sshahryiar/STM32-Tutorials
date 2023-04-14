#line 1 "C:/Users/Shawon/Desktop/ARM Media/MCO Example/MCO_Demo.c"
void main()
{
 GPIO_Clk_Enable(&GPIOA_BASE);
 GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_8, (_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_SPEED_50MHZ | _GPIO_CFG_OTYPE_PP));
 while(1)
 {

 };
}
