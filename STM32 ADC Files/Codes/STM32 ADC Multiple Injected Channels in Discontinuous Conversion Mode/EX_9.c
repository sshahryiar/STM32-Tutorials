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
void read_ADC1_injected(unsigned int temp_data[3]);
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);


void main()
{
    unsigned int channel_data[3] = {0x0000, 0x0000, 0x0000};

    setup();

    while(1)
    {
        read_ADC1_injected(channel_data);
        lcd_print(1, 2, channel_data[0]);
        lcd_print(7, 2, channel_data[1]);
        lcd_print(13, 2, channel_data[2]);

        GPIOC_pin_high(13);
        delay_ms(10);
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

    lcd_out(1, 1, "CH00  CH01  CH02");
}


void GPIO_init()
{
     enable_GPIOA(enable);
     enable_GPIOB(enable);
     enable_GPIOC(enable);
     
     setup_GPIOA(0, analog_input);
     setup_GPIOA(1, analog_input);
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
     set_ADC1_continuous_conversion_mode(disable);
     set_ADC1_injected_number_of_conversions(3);
     set_ADC1_sample_time(sample_time_28_5_cycles, 0);
     set_ADC1_sample_time(sample_time_41_5_cycles, 1);
     set_ADC1_sample_time(sample_time_13_5_cycles, 2);
     set_ADC1_injected_sequence(1, 0);
     set_ADC1_injected_sequence(2, 2);
     set_ADC1_injected_sequence(3, 1);
     set_ADC1_number_of_discontinuous_conversions(3);
     set_ADC1_external_trigger_injected_conversion_edge(JSWSTART_trigger);
     set_ADC1_discontinuous_conversion_mode_in_injected_mode(enable);
     ADC1_calibrate();
     start_ADC1();
}


void read_ADC1_injected(unsigned int temp_data[3])
{
     set_ADC1_injected_conversions(enable);
     while(ADC1_SRbits.JEOC == 0);
     temp_data[0] = (ADC1_JDR3 & 0x0FFF);
     set_ADC1_injected_conversions(enable);
     while(ADC1_SRbits.JEOC == 0);
     temp_data[1] = (ADC1_JDR2 & 0x0FFF);
     set_ADC1_injected_conversions(enable);
     while(ADC1_SRbits.JEOC == 0);
     temp_data[2] = (ADC1_JDR1 & 0x0FFF);
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