#include "stm32f4xx_gpio.h"
#include "stm32f4xx_usart.h"
#include "stm32f4xx_rcc.h"


void setup_GPIOs();
void check_LEDs();


void main() 
{
     unsigned char s = 0;
     
     setup_GPIOs();
     check_LEDs();
     
     while(1)
     {
             if(GPIO_ReadInputDataBit(GPIOA, GPIO_Pin_0))
             {
                 while(GPIO_ReadInputDataBit(GPIOA, GPIO_Pin_0) == 1);
                 s++;
             }
             
             if(s >= 6)
             {
                 s = 0;
             }
             
             switch(s)
             {
                 case 1:
                 {
                      GPIO_SetBits(GPIOD, GPIO_Pin_12);
                      break;
                 }
                 case 2:
                 {
                      GPIO_SetBits(GPIOD, GPIO_Pin_13);
                      break;
                 }
                 case 3:
                 {
                      GPIO_SetBits(GPIOD, GPIO_Pin_14);
                      break;
                 }
                 case 4:
                 {
                      GPIO_SetBits(GPIOD, GPIO_Pin_15);
                      break;
                 }
                 case 5:
                 {
                      GPIO_SetBits(GPIOD, GPIO_Pin_12);
                      GPIO_SetBits(GPIOD, GPIO_Pin_13);
                      GPIO_SetBits(GPIOD, GPIO_Pin_14);
                      GPIO_SetBits(GPIOD, GPIO_Pin_15);
                      break;
                 }
                 default:
                 {
                     break;
                 }
             }
             Delay_ms(90);
             
             GPIO_ResetBits(GPIOD, GPIO_Pin_12);
             GPIO_ResetBits(GPIOD, GPIO_Pin_13);
             GPIO_ResetBits(GPIOD, GPIO_Pin_14);
             GPIO_ResetBits(GPIOD, GPIO_Pin_15);
             Delay_ms(90);
     }
}


void setup_GPIOs()
{
  GPIO_InitTypeDef GPIO_InitStructure;

  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD, ENABLE);

  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_DOWN;
  GPIO_Init(GPIOA, &GPIO_InitStructure);

  GPIO_InitStructure.GPIO_Pin = (GPIO_Pin_12 | GPIO_Pin_13 | GPIO_Pin_14 | GPIO_Pin_15);
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(GPIOD, &GPIO_InitStructure);
}


void check_LEDs()
{
    GPIO_SetBits(GPIOD, (GPIO_Pin_12 | GPIO_Pin_13 | GPIO_Pin_14 | GPIO_Pin_15));
    Delay_ms(900);
    GPIO_ResetBits(GPIOD, (GPIO_Pin_12 | GPIO_Pin_13 | GPIO_Pin_14 | GPIO_Pin_15));
}