#line 1 "C:/Users/Shawon/Desktop/ARM Media/Done/STM32 MikroC ADC Library Example/Ex_1.c"
sbit LCD_RS at GPIOB_ODR.B1;
sbit LCD_EN at GPIOB_ODR.B2;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;


void setup();
unsigned int adc_avg(unsigned char no_of_samples, unsigned char channel);
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);
float map(float v, float x_min, float x_max, float y_min, float y_max);


void main()
{
 unsigned char s = 0;
 register unsigned int adc_data = 0;
 float v = 0.0;

 setup();

 while(1)
 {
 for(s = 0; s <= 1; s++)
 {
 adc_data = adc_avg(10, s);
 v = map(adc_data, 0, 4095, 0, 3300);
 lcd_print(5, (s + 1), adc_data);
 lcd_print(11, (s + 1), v);
 }

 GPIOC_ODRbits.ODR13 ^= 1;
 delay_ms(600);
 };
}


void setup()
{
 GPIO_Clk_Enable(&GPIOA_BASE);
 GPIO_Clk_Enable(&GPIOB_BASE);
 GPIO_Clk_Enable(&GPIOC_BASE);
 GPIO_Config(&GPIOA_BASE, (_GPIO_PINMASK_0 | _GPIO_PINMASK_1), (_GPIO_CFG_MODE_ANALOG | _GPIO_CFG_PULL_NO));
 GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_13, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));

 ADC1_init();
 LCD_Init();
 LCD_Cmd(_LCD_CLEAR);
 LCD_Cmd(_LCD_CURSOR_OFF);

 lcd_out(1, 1, "A0:");
 lcd_out(2, 1, "A1:");
 lcd_out(1, 15, "mV");
 lcd_out(2, 15, "mV");
}


unsigned int adc_avg(unsigned char no_of_samples, unsigned char channel)
{
 unsigned long avg = 0;
 unsigned char samples = no_of_samples;

 while(samples > 0)
 {
 avg += ADC1_Get_Sample(channel);
 samples--;
 }
 avg /= no_of_samples;

 return avg;
}


void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
{
 unsigned char tmp = 0;

 tmp = (value / 1000);
 lcd_chr(y_pos, x_pos, (tmp + 48));
 tmp = ((value / 100) % 10);
 lcd_chr_cp((tmp + 48));
 tmp = ((value / 10) % 10);
 lcd_chr_cp((tmp + 48));
 tmp = (value % 10);
 lcd_chr_cp((tmp + 48));
}


float map(float v, float x_min, float x_max, float y_min, float y_max)
{
 return (y_min + (((y_max - y_min)/(x_max - x_min)) * (v - x_min)));
}
