#include "ADC.h"
#include "GPIO.h"


sbit LCD_RS at GPIOB_ODR.B1;
sbit LCD_EN at GPIOB_ODR.B2;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;


register unsigned int adc_data = 0;


void setup();
void GPIO_init();
void ADC_init();
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);
float map(float v, float x_min, float x_max, float y_min, float y_max);


void ADC_ISR() 
iv IVT_INT_ADC1_2 
ics ICS_AUTO
{
     adc_data = (ADC1_DR & 0x0FFF);
     GPIOC_pin_low(13);
}


void main()
{
    register float V = 0;

    setup();

    while(1)
    {
        set_ADC1_regular_conversions(enable);
        GPIOC_pin_high(13);
        
        V = map(adc_data, 0, 4095, 0, 3300);
        lcd_print(13, 1, adc_data);
        lcd_print(13, 2, V);
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

    lcd_out(1, 1, "CH17:");
    lcd_out(2, 1, "Vref/mV:");
}


void GPIO_init()
{
     enable_GPIOB(enable);
     enable_GPIOC(enable);

     setup_GPIOC(13, (GPIO_PP_output | output_mode_low_speed));
}


void ADC_init()
{
     ADC1_Enable();
     clr_ADC1_settings();
     set_ADC_mode(independent_mode);
     set_ADC1_data_alignment(right_alignment);
     set_ADC1_scan_conversion_mode(disable);
     set_ADC1_continuous_conversion_mode(disable);
     set_ADC1_external_trigger_regular_conversion_edge(SWSTART_trigger);
     set_ADC1_regular_number_of_conversions(1);
     set_ADC1_sample_time(sample_time_13_5_cycles, 17);
     set_ADC1_regular_sequence(1, 17);
     set_ADC1_reference_and_temperature_sensor(enable);
     set_ADC1_regular_end_of_conversion_interrupt(enable);
     NVIC_IntEnable(IVT_INT_ADC1_2);
     EnableInterrupts();
     ADC1_calibrate();
     start_ADC1();
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