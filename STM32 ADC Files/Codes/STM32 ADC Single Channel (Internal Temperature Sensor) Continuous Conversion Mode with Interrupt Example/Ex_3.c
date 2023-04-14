#include "ADC.h"
#include "GPIO.h"


#define V25                1430
#define T_offset           17.5


sbit LCD_RS at GPIOB_ODR.B1;
sbit LCD_EN at GPIOB_ODR.B2;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;


register unsigned int adc_data = 0;

const char symbol[8] = {0x00, 0x06, 0x09, 0x09, 0x06, 0x00, 0x00, 0x00};


void setup();
void GPIO_init();
void ADC_init();
void CustomChar(unsigned char y_pos, unsigned char x_pos);
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value, unsigned char disp_type);
float map(float v, float x_min, float x_max, float y_min, float y_max);


void ADC_ISR() 
iv IVT_INT_ADC1_2 
ics ICS_AUTO
{
     adc_data = (ADC1_DR & 0x0FFF);
     GPIOC_pin_high(13);
}


void main()
{
    register float t = 0.0;

    setup();

    while(1)
    {
        t = map(adc_data, 0, 4095, 0, 3300);
        t = (((V25 - t) / 4.3) + 25);
        t -=  T_offset;
        t *= 100;

        if(t <= 0)
        {
            t = 0;
        }
        if(t >= 9999)
        {
            t = 9999;
        }

        lcd_print(13, 1, adc_data, 1);
        lcd_print(12, 2, t, 0);
        
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

    lcd_out(1, 1, "CH16:");
    lcd_out(2, 1, "T/ C:");
    CustomChar(2, 3);
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
     set_ADC1_continuous_conversion_mode(enable);
     set_ADC1_external_trigger_regular_conversion_edge(SWSTART_trigger);
     set_ADC1_regular_number_of_conversions(1);
     set_ADC1_sample_time(sample_time_13_5_cycles, 16);
     set_ADC1_regular_sequence(1, 16);
     set_ADC1_reference_and_temperature_sensor(enable);
     set_ADC1_regular_end_of_conversion_interrupt(enable);
     NVIC_IntEnable(IVT_INT_ADC1_2);
     EnableInterrupts;
     ADC1_calibrate();
     start_ADC1();
}


void CustomChar(unsigned char y_pos, unsigned char x_pos)
{
    unsigned char i = 0;
    
    Lcd_Cmd(64);
    for (i = 0; i < 8; i += 1)
    {
        Lcd_Chr_CP(symbol[i]);
    }
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(y_pos, x_pos, 0);
}


void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value, unsigned char disp_type)
{
     unsigned char tmp = 0;

     tmp = (value / 1000);
     lcd_chr(y_pos, x_pos, (tmp + 48));
     tmp = ((value / 100) % 10);
     lcd_chr_cp((tmp + 48));
     switch(disp_type)
     {
        case 0:
        {
            lcd_chr_cp(46);
            break;
        }
        case 1:
        {
            break;
        }
     }
     tmp = ((value / 10) % 10);
     lcd_chr_cp((tmp + 48));
     tmp = (value % 10);
     lcd_chr_cp((tmp + 48));
}


float map(float v, float x_min, float x_max, float y_min, float y_max)
{
    return (y_min + (((y_max - y_min)/(x_max - x_min)) * (v - x_min)));
}