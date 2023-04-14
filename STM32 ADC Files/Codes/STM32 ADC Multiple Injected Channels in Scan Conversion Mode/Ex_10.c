#include "ADC.h"
#include "GPIO.h"


sbit LCD_RS at GPIOB_ODR.B1;
sbit LCD_EN at GPIOB_ODR.B2;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;


unsigned int channel_data[2];


void setup();
void GPIO_init();
void ADC_init();
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);


void ADC1_2_ISR() 
iv IVT_INT_ADC1_2 
ics ICS_AUTO 
{
     ADC2_SRbits.JEOC = 0;
     channel_data[0] = (ADC2_JDR1 & 0x0FFF);
     channel_data[1] = (ADC2_JDR2 & 0x0FFF);
}


void main()
{
    setup();

    while(1)
    {
        GPIOC_pin_high(13);
        set_ADC2_injected_conversions(enable);
        delay_ms(10);
        lcd_print(1, 2, channel_data[0]);
        lcd_print(13, 2, channel_data[1]);
        GPIOC_pin_low(13);
        delay_ms(90);
    };
}


void setup()
{
    GPIO_init();
    LCD_Init();
    ADC_init();

    LCD_Cmd(_LCD_CLEAR);
    LCD_Cmd(_LCD_CURSOR_OFF);

    lcd_out(1, 1, "CH04        CH06");
}


void GPIO_init()
{
     enable_GPIOA(enable);
     enable_GPIOB(enable);
     enable_GPIOC(enable);
     
     setup_GPIOA(4, analog_input);
     setup_GPIOA(6, analog_input);
     setup_GPIOC(13, (GPIO_PP_output | output_mode_low_speed));
}


void ADC_init()
{
     ADC2_Enable();
     clr_ADC2_settings();
     set_ADC_mode(independent_mode);
     set_ADC2_data_alignment(right_alignment);
     set_ADC2_scan_conversion_mode(enable);
     set_ADC2_continuous_conversion_mode(disable);
     set_ADC2_sample_time(sample_time_1_5_cycles, 4);
     set_ADC2_sample_time(sample_time_13_5_cycles, 6);
     set_ADC2_external_trigger_injected_conversion_edge(JSWSTART_trigger);
     set_ADC2_injected_number_of_conversions(2);
     set_ADC2_injected_sequence(3, 4);
     set_ADC2_injected_sequence(4, 6);
     set_ADC2_injected_end_of_conversion_interrupt(enable);
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