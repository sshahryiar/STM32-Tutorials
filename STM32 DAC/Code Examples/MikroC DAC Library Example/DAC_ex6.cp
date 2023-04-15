#line 1 "C:/Users/Shawon & Nipa/Desktop/ARM Media/Codes/MikroC DAC Library Example/DAC_ex6.c"
void setup();


void main()
{
 signed int value = 2047;

 setup();

 while(1)
 {
 if(GPIOF_IDRbits.IDR13 == 0)
 {
 value++;
 }
 if(GPIOF_IDRbits.IDR14 == 0)
 {
 value--;
 }

 if(value >= 4095)
 {
 value = 4095;
 }
 if(value <= 0)
 {
 value = 0;
 }

 DAC1_Ch1_Output(value);
 DAC1_Ch2_Output((4095 - value));

 delay_ms(1);
 };
}


void setup()
{
 GPIO_Clk_Enable(&GPIOA_BASE);
 GPIO_Clk_Enable(&GPIOF_BASE);

 GPIO_Config(&GPIOA_BASE, (_GPIO_PINMASK_4 | _GPIO_PINMASK_5), _GPIO_CFG_MODE_ANALOG);
 GPIO_Config(&GPIOF_BASE, (_GPIO_PINMASK_13 | _GPIO_PINMASK_14), (_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP));

 DAC1_Init(_DAC_DUAL_MODE_ENABLE);
}
