#line 1 "C:/Users/Shawon/Desktop/GPIO Code Examples/GPIO with GPIO Library/GPIOlib.c"
void setup();


void main()
{
 unsigned int dly = 600;

 setup();

 while(1)
 {
 if(GPIOA_IDRbits.IDR0 == 1)
 {
 dly = 200;
 }
 else
 {
 dly = 600;
 }

 GPIOB_BSRRbits.BR15 = 1;
 Vdelay_ms(dly);
 GPIOB_BSRRbits.BR15 = 0;
 Vdelay_ms(dly);
 };
}


void setup()
{


 GPIO_Clk_Enable(&GPIOA_BASE);
 GPIO_Clk_Enable(&GPIOB_BASE);



 GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_0, (_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP));



 GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_15, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP));
}
