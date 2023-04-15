#include "DAC.h"
#include "GPIO.h"


void setup();
void DAC_setup();
void GPIO_setup();


void main() 
{
     bit time;

     unsigned long peak = Triangle_Amplitude_equal_to_4095;

     setup();
     
     while(1)
     {
         set_DAC1_software_trigger(enable);
         set_DAC2_software_trigger(enable);
         
         if(get_input(GPIOF_IDR, 14) == 0)
         {
             while(get_input(GPIOF_IDR, 14) == 0);
             
             peak++;
             
             if(peak > Triangle_Amplitude_equal_to_4095)
             {
                peak = Triangle_Amplitude_equal_to_1;
             }
             
             enable_DAC1_channel(false);
             enable_DAC2_channel(false);
             
             set_DAC1_triangle_waveform_amplitude(peak);
             set_DAC2_triangle_waveform_amplitude(peak);
             
             enable_DAC1_channel(true);
             enable_DAC2_channel(true);
         }
         
         if(get_input(GPIOF_IDR, 13) == 0)
         {
             while(get_input(GPIOF_IDR, 13) == 0);
             time = ~time;
         }
         
         switch(time)
         {
             case 1:
             {
                 delay_us(600);
                 break;
             }
             default:
             {
                 delay_us(60);
                 break;
             }
         }
     };
}


void setup()
{
    GPIO_setup();
    DAC_setup();
}


void DAC_setup()
{
     enable_DAC(true);
     DAC_reset();
     
     set_DAC1_buffer(enable);
     enable_DAC1_trigger(true);
     select_DAC1_trigger_source(Software_trigger);
     select_DAC1_wave_type(triangle_wave_generation_enabled);
     set_DAC1_triangle_waveform_amplitude(Triangle_Amplitude_equal_to_4095);
     enable_DAC1_channel(true);
     
     set_DAC2_buffer(enable);
     enable_DAC2_trigger(true);
     select_DAC2_trigger_source(Software_trigger);
     select_DAC2_wave_type(triangle_wave_generation_enabled);
     set_DAC2_triangle_waveform_amplitude(Triangle_Amplitude_equal_to_4095);
     enable_DAC2_channel(true);
}


void GPIO_setup()
{
     enable_GPIOA(true);
     enable_GPIOF(true);
     
     pin_configure_low(GPIOA_CRL, 4, analog_input);
     pin_configure_low(GPIOA_CRL, 5, analog_input);
     
     pin_configure_high(GPIOF_CRH, 13, digital_input);
     pin_configure_high(GPIOF_CRH, 14, digital_input);
     
     pull_up_enable(GPIOF_ODR, 13);
     pull_up_enable(GPIOF_ODR, 14);
}