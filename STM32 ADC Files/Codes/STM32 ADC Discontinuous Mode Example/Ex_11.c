#include "ADC.h"
#include "GPIO.h"


sbit LCD_RS at GPIOB_ODR.B1;
sbit LCD_EN at GPIOB_ODR.B2;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;


unsigned char channel_no = 0;
unsigned int ch_data[3] = {0x0000, 0x0000, 0x0000};


void setup();
void GPIO_init();
void ADC_init();
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);


void ADC1_2_ISR() 
iv IVT_INT_ADC1_2 
ics ICS_AUTO 
{
    ADC2_SRbits.EOC = 0;
    ch_data[channel_no] = (ADC2_DR & 0x0FFF);
    channel_no++;
}


void main()
{
    unsigned char s = 0;
    
    setup();

    while(1)
    {
        GPIOC_pin_high(13);
        set_ADC2_regular_conversions(enable);
        while(channel_no < 3);
        channel_no = 0;
        for(s = 0 ; s < 3; s++)
        {
            lcd_print(((s * 6) + 1), 2, ch_data[s]);
        }
        GPIOC_pin_low(13);
    };
}


void setup()
{
    GPIO_init();
    ADC_init();
    LCD_Init();

    LCD_Cmd(_LCD_CLEAR);
    LCD_Cmd(_LCD_CURSOR_OFF);

    lcd_out(1, 1, "CH02  CH00  CH01");
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
     ADC2_Enable();
     clr_ADC2_settings();
     set_ADC_mode(independent_mode);
     set_ADC2_data_alignment(right_alignment);
     set_ADC2_scan_conversion_mode(disable);
     set_ADC2_continuous_conversion_mode(disable);
     set_ADC2_regular_number_of_conversions(3);
     set_ADC2_number_of_discontinuous_conversions(3);
     set_ADC2_sample_time(sample_time_41_5_cycles, 0);
     set_ADC2_sample_time(sample_time_13_5_cycles, 1);
     set_ADC2_sample_time(sample_time_28_5_cycles, 2);
     set_ADC2_regular_sequence(1, 0);
     set_ADC2_regular_sequence(2, 1);
     set_ADC2_regular_sequence(3, 2);
     set_ADC2_external_trigger_regular_conversion_edge(SWSTART_trigger);
     set_ADC2_discontinuous_conversion_mode_in_regular_mode(enable);
     set_ADC2_regular_end_of_conversion_interrupt(enable);
     NVIC_IntEnable(IVT_INT_ADC1_2);
     EnableInterrupts();
     ADC2_calibrate();
     start_ADC2();
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