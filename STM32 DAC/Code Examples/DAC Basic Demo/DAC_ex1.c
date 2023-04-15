#include "DAC.h"
#include "GPIO.h"


#define radian_per_degree              0.0174532925


void setup();
void GPIO_setup();
void DAC_setup();


void main() 
{
     signed int temp1 = 0;
     signed int temp2 = 0;
     unsigned int degree = 0;


     setup();
     
     while(1)
     {
         for(degree = 0; degree < 360; degree++)
         {
             temp1 = (2047 * cos(radian_per_degree * degree));
             temp1 = (2048 - temp1);
             DAC_DHR12R1 = ((unsigned int)temp1);
             temp2 = (2047 * sin(radian_per_degree * degree));
             temp2 = (2048 - temp2);
             DAC_DHR12R2 = ((unsigned int)temp2);
             delay_ms(6);
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