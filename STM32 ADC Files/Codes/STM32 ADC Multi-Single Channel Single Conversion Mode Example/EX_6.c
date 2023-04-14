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
unsigned int read_ADC1(unsigned char channel, unsigned char sample_time);
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);


void main()
{
    unsigned int ch_a = 0;
    unsigned int ch_b = 0;
    unsigned int ch_c = 0;

    setup();

    while(1)
    {
        ch_a = read_ADC1(1, sample_time_239_5_cycles);
        ch_b = read_ADC1(3, sample_time_1_5_cycles);
        ch_c = read_ADC1(2, sample_time_28_5_cycles);
        
        lcd_print(1, 2, ch_a);
        lcd_print(7, 2, ch_b);
        lcd_print(13, 2, ch_c);

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

    lcd_out(1, 1, "CH01  CH03  CH02");
}


void GPIO_init()
{
     enable_GPIOA(enable);
     enable_GPIOB(enable);
     enable_GPIOC(enable);
     
     setup_GPIOA(1, analog_input);
     setup_GPIOA(2, analog_input);
     setup_GPIOA(3, analog_input);
     setup_GPIOC(13, (GPIO_PP_output | output_mode_low_speed));
}


void ADC_init()
{
     ADC1_Enable();
     clr_ADC1_settings();
     set_ADC_mode(independent_mode);
     set_ADC1_data_alignment(right_alignment);
     set_ADC1_continuous_conversion_mode(disable);
     set_ADC1_regular_number_of_conversions(1);
     set_ADC1_external_trigger_regular_conversion_edge(SWSTART_trigger);
     ADC1_calibrate();
     start_ADC1();
}


unsigned int read_ADC1(unsigned char channel, unsigned char sample_time)
{
     ADC1_JSQR = 0x00000000;
     ADC1_SQR1 = 0x00000000;
     ADC1_SQR2 = 0x00000000;
     ADC1_SQR3 = 0x00000000;
     ADC1_SMPR1 = 0x00000000;
     ADC1_SMPR2 = 0x00000000;
     set_ADC1_regular_sequence(1, channel);
     set_ADC1_sample_time(sample_time, channel);
     set_ADC1_regular_conversions(enable);
     while(ADC1_SRbits.EOC == reset);
     return (0x0FFF & ADC1_DR);
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