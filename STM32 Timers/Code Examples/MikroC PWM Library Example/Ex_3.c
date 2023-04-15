unsigned int pwm_val = 0;

void setup();
void setup_PWMs();


void main() 
{
     unsigned int i = 0;
     
     setup();
     
     while(1)
     { 
         for(i = 0; i <= pwm_val; i++)
         {
              PWM_TIM4_Set_Duty(i, _PWM_INVERTED, _PWM_CHANNEL1);
              PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL2);
              delay_us(200);
         }
         for(i = 0; i <= pwm_val; i++)
         {
              PWM_TIM4_Set_Duty(i, _PWM_INVERTED, _PWM_CHANNEL2);
              PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL3);
              delay_us(200);
         }
         for(i = 0; i <= pwm_val; i++)
         {
              PWM_TIM4_Set_Duty(i, _PWM_INVERTED, _PWM_CHANNEL3);
              PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL4);
              delay_us(200);
         }
         for(i = 0; i <= pwm_val; i++)
         {
              PWM_TIM4_Set_Duty(i, _PWM_INVERTED, _PWM_CHANNEL4);
              PWM_TIM3_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL1);
              delay_us(200);
         }
         for(i = 0; i <= pwm_val; i++)
         {
              PWM_TIM3_Set_Duty(i, _PWM_INVERTED, _PWM_CHANNEL1);
              PWM_TIM3_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL2);
              delay_us(200);
         }
         for(i = 0; i <= pwm_val; i++)
         {
              PWM_TIM3_Set_Duty(i, _PWM_INVERTED, _PWM_CHANNEL2);
              PWM_TIM3_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL3);
              delay_us(200);
         }
         for(i = 0; i <= pwm_val; i++)
         {
              PWM_TIM3_Set_Duty(i, _PWM_INVERTED, _PWM_CHANNEL3);
              PWM_TIM3_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL4);
              delay_us(200);
         }
         for(i = 0; i <= pwm_val; i++)
         {
              PWM_TIM3_Set_Duty(i, _PWM_INVERTED, _PWM_CHANNEL4);
              PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL1);
              delay_us(200);
         }
     };
}


void setup()
{
     setup_PWMs();
}


void setup_PWMs()
{
    unsigned int temp1 = 0;
    unsigned int temp2 = 0;
    
    temp1 = PWM_TIM3_Init(6000);

    PWM_TIM3_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL1);
    PWM_TIM3_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL2);
    PWM_TIM3_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL3);
    PWM_TIM3_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL4);

    PWM_TIM3_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM3_CH1_PC6);
    PWM_TIM3_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM3_CH2_PC7);
    PWM_TIM3_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM3_CH3_PC8);
    PWM_TIM3_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM3_CH4_PC9);
    
    temp2 = PWM_TIM4_Init(6000);

    PWM_TIM4_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL1);
    PWM_TIM4_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL2);
    PWM_TIM4_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL3);
    PWM_TIM4_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL4);

    PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PB6);
    PWM_TIM4_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM4_CH2_PB7);
    PWM_TIM4_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM4_CH3_PB8);
    PWM_TIM4_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM4_CH4_PB9);

    if(temp2 >= temp1)
    {
        pwm_val = temp2;
    }
    else
    {
        pwm_val = temp1;
    }
}