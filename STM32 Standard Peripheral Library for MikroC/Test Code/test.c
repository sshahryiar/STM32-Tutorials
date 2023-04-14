#include "stm32f10x_rcc.h"
#include "stm32f10x_gpio.h"


void setup();


void main() 
{
     unsigned int t = 900;
     
     setup();
     
     while(1)
     {
         
         if(GPIO_ReadInputDataBit(GPIOA, GPIO_Pin_3))
         {
              t = 400;
         }
         else
         {
              t = 900;
         }
         
         GPIO_SetBits(GPIOA, GPIO_Pin_0);
         VDelay_ms(t);
         GPIO_ResetBits(GPIOA, GPIO_Pin_0);
         VDelay_ms(t);
     };
}


void setup()
{
     GPIO_InitTypeDef GPIO_InitStructure;

     RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
     GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0;
     GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
     GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
     
     GPIO_Init(GPIOA, &GPIO_InitStructure);
     
     GPIO_InitStructure.GPIO_Pin = GPIO_Pin_3;
     GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
     
     GPIO_Init(GPIOA, &GPIO_InitStructure);
}