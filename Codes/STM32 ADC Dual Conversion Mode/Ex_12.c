#include "ADC.h"
#include "GPIO.h"


sbit LCD_RS at GPIOB_ODR.B1;
sbit LCD_EN at GPIOB_ODR.B2;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;


register unsigned long adc_data = 0;


void setup();
void GPIO_init();
void ADC_init();
void setup_ADC1();
void setup_ADC2();
void setup_common_ADC_settings();
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);


void ADC1_2_ISR() 
iv IVT_INT_ADC1_2 
ics ICS_AUTO 
{
    ADC1_SRbits.EOC = 0;
    ADC2_SRbits.EOC = 0;
    adc_data = adc1_dr;
    GPIOC_pin_high(13);
}


void main()
{
    unsigned int adc1_data = 0;
    unsigned int adc2_data = 0;
    
    setup();

    while(1)
    {
        set_ADC1_regular_conversions(enable);
        
        adc1_data = (adc_data & 0x00000FFF);
        adc2_data = ((adc_data & 0x0FFF0000) >> 16);
        
        lcd_print(1, 2, adc1_data);
        lcd_print(13, 2, adc2_data);

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

    lcd_out(1, 1, "CH00        CH01");
}


void GPIO_init()
{
     enable_GPIOA(enable);
     enable_GPIOB(enable);
     enable_GPIOC(enable);
     setup_GPIOA(0, analog_input);
     setup_GPIOA(1, analog_input);
     setup_GPIOC(13, (GPIO_PP_output | output_mode_low_speed));
}


void ADC_init()
{
     setup_ADC1();
     setup_ADC2();
     setup_common_ADC_settings();
}


void setup_ADC1()
{
     ADC1_Enable();
     clr_ADC1_settings();
     set_ADC1_data_alignment(right_alignment);
     set_ADC1_scan_conversion_mode(disable);
     set_ADC1_continuous_conversion_mode(disable);
     set_ADC1_sample_time(sample_time_41_5_cycles, 0);
     set_ADC1_external_trigger_regular_conversion_edge(SWSTART_trigger);
     set_ADC1_regular_number_of_conversions(1);
     set_ADC1_regular_sequence(1, 0);
     set_ADC1_regular_end_of_conversion_interrupt(enable);
     ADC1_calibrate();
     start_ADC1();
}


void setup_ADC2()
{
     ADC2_Enable();
     clr_ADC2_settings();
     set_ADC2_data_alignment(right_alignment);
     set_ADC2_scan_conversion_mode(disable);
     set_ADC2_continuous_conversion_mode(disable);
     set_ADC2_sample_time(sample_time_41_5_cycles, 1);
     set_ADC2_external_trigger_regular_conversion_edge(SWSTART_trigger);
     set_ADC2_regular_number_of_conversions(1);
     set_ADC2_regular_sequence(1, 1);
     set_ADC2_regular_end_of_conversion_interrupt(enable);
     ADC2_calibrate();
     start_ADC2();
}


void setup_common_ADC_settings()
{
     set_ADC1_DMA(enable);
     set_ADC_mode(regular_simultaneous_mode_only);
     NVIC_IntEnable(IVT_INT_ADC1_2);
     EnableInterrupts();
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