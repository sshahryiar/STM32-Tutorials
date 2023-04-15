#include "DAC.h"
#include "GPIO.h"


void setup();
void GPIO_setup();
void DAC_setup();


void main()
{
     signed int temp = 0;

     setup();

     while(1)
     {
         for(temp = 0; temp < 4096; temp++)
         {
             DAC_DHR12R1 = temp;
             if((temp > 0) && (temp < 256))
             {
                 DAC_DHR8R2 = temp;
             }
             delay_us(90);
         }
         
         for(temp = 4095; temp > -1; temp--)
         {
             DAC_DHR12R1 = temp;
             if((temp > 0) && (temp < 256))
             {
                 DAC_DHR8R2 = temp;
             }
             delay_us(90);
         }
     };
}


void setup()
{
    GPIO_setup();
    DAC_setup();
}


void GPIO_setup()
{
     enable_GPIOA(true);
     pin_configure_low(GPIOA_CRL, 4, analog_input);
     pin_configure_low(GPIOA_CRL, 5, analog_input);
}


void DAC_setup()
{
     enable_DAC(true);
     DAC_reset();
     set_DAC1_buffer(enable);
     set_DAC2_buffer(enable);
     enable_DAC1_channel(true);
     enable_DAC2_channel(true);
}