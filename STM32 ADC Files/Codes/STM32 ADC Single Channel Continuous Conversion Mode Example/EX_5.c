#include "ADC.h"
#include "GPIO.h"


sbit LCD_RS at GPIOB_ODR.B1;
sbit LCD_EN at GPIOB_ODR.B2;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;


void setup();
void GPIO_init();
void ADC_init();
unsigned int read_ADC1();
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);
float map(float v, float x_min, float x_max, float y_min, float y_max);


void main()
{
    unsigned int adc_data = 0;
    float V = 0.0;

    setup();

    while(1)
    {
        GPIOC_pin_high(13);
        delay_ms(10);
        
        adc_data = read_ADC1();
        V = map(adc_data, 0, 4095, 0, 3300);
        lcd_print(13, 1, adc_data);
        lcd_print(13, 2, V);

        GPIOC_pin_low(13);
        delay_ms(90);
    };
}


void setup()
{
    GPIO_init();
    ADC_init();
    LCD_Init();

    LCD_Cmd(_LCD_CLEAR);
    LCD_Cmd(_LCD_CURSOR_OFF);

    lcd_out(1, 1, "CH02:");
    lcd_out(2, 1, "V/mV:");
}


void GPIO_init()
{
     enable_GPIOA(enable);
     enable_GPIOB(enable);
     enable_GPIOC(enable);

     setup_GPIOA(2, analog_input);
     setup_GPIOC(13, (GPIO_PP_output | output_mode_low_speed));
}


void ADC_init()
{
     ADC1_Enable();
     clr_ADC1_settings();
     set_ADC_mode(independent_mode);
     set_ADC1_data_alignment(right_alignment);
     set_ADC1_scan_conversion_mode(disable);
     set_ADC1_continuous_conversion_mode(enable);
     set_ADC1_regular_number_of_conversions(1);
     set_ADC1_sample_time(sample_time_41_5_cycles, 2);
     set_ADC1_regular_sequence(1, 2);
     set_ADC1_external_trigger_regular_conversion_edge(SWSTART_trigger);
     ADC1_calibrate();
     start_ADC1();
}


unsigned int read_ADC1()
{
     while(ADC1_SRbits.EOC == 0);
     return (ADC1_DR & 0x0FFF);
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