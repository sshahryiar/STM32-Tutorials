#line 1 "C:/Users/Shawon&Nipa/Desktop/TEST/test.c"
#line 1 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/stm32f10x_stdperiph_driver/inc/stm32f10x_rcc.h"
#line 1 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
#line 167 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef enum IRQn
{

 NonMaskableInt_IRQn = -14,
 MemoryManagement_IRQn = -12,
 BusFault_IRQn = -11,
 UsageFault_IRQn = -10,
 SVCall_IRQn = -5,
 DebugMonitor_IRQn = -4,
 PendSV_IRQn = -2,
 SysTick_IRQn = -1,


 WWDG_IRQn = 0,
 PVD_IRQn = 1,
 TAMPER_IRQn = 2,
 RTC_IRQn = 3,
 FLASH_IRQn = 4,
 RCC_IRQn = 5,
 EXTI0_IRQn = 6,
 EXTI1_IRQn = 7,
 EXTI2_IRQn = 8,
 EXTI3_IRQn = 9,
 EXTI4_IRQn = 10,
 DMA1_Channel1_IRQn = 11,
 DMA1_Channel2_IRQn = 12,
 DMA1_Channel3_IRQn = 13,
 DMA1_Channel4_IRQn = 14,
 DMA1_Channel5_IRQn = 15,
 DMA1_Channel6_IRQn = 16,
 DMA1_Channel7_IRQn = 17,
#line 298 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
 ADC1_2_IRQn = 18,
 USB_HP_CAN1_TX_IRQn = 19,
 USB_LP_CAN1_RX0_IRQn = 20,
 CAN1_RX1_IRQn = 21,
 CAN1_SCE_IRQn = 22,
 EXTI9_5_IRQn = 23,
 TIM1_BRK_IRQn = 24,
 TIM1_UP_IRQn = 25,
 TIM1_TRG_COM_IRQn = 26,
 TIM1_CC_IRQn = 27,
 TIM2_IRQn = 28,
 TIM3_IRQn = 29,
 TIM4_IRQn = 30,
 I2C1_EV_IRQn = 31,
 I2C1_ER_IRQn = 32,
 I2C2_EV_IRQn = 33,
 I2C2_ER_IRQn = 34,
 SPI1_IRQn = 35,
 SPI2_IRQn = 36,
 USART1_IRQn = 37,
 USART2_IRQn = 38,
 USART3_IRQn = 39,
 EXTI15_10_IRQn = 40,
 RTCAlarm_IRQn = 41,
 USBWakeUp_IRQn = 42,
 TIM8_BRK_IRQn = 43,
 TIM8_UP_IRQn = 44,
 TIM8_TRG_COM_IRQn = 45,
 TIM8_CC_IRQn = 46,
 ADC3_IRQn = 47,
 FSMC_IRQn = 48,
 SDIO_IRQn = 49,
 TIM5_IRQn = 50,
 SPI3_IRQn = 51,
 UART4_IRQn = 52,
 UART5_IRQn = 53,
 TIM6_IRQn = 54,
 TIM7_IRQn = 55,
 DMA2_Channel1_IRQn = 56,
 DMA2_Channel2_IRQn = 57,
 DMA2_Channel3_IRQn = 58,
 DMA2_Channel4_5_IRQn = 59
#line 472 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
} IRQn_Type;
#line 1 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 51 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
typedef signed char int8_t;
typedef signed short int16_t;
typedef signed int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed short int_least16_t;
typedef signed int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned short uint_least16_t;
typedef unsigned int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed int int_fast8_t;
typedef signed int int_fast16_t;
typedef signed int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned int uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed int intptr_t;
typedef unsigned int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 193 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
typedef struct
{
  volatile  uint32_t ISER[8];
 uint32_t RESERVED0[24];
  volatile  uint32_t ICER[8];
 uint32_t RSERVED1[24];
  volatile  uint32_t ISPR[8];
 uint32_t RESERVED2[24];
  volatile  uint32_t ICPR[8];
 uint32_t RESERVED3[24];
  volatile  uint32_t IABR[8];
 uint32_t RESERVED4[56];
  volatile  uint8_t IP[240];
 uint32_t RESERVED5[644];
  volatile  uint32_t STIR;
} NVIC_Type;
#line 216 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
typedef struct
{
  volatile  uint32_t CPUID;
  volatile  uint32_t ICSR;
  volatile  uint32_t VTOR;
  volatile  uint32_t AIRCR;
  volatile  uint32_t SCR;
  volatile  uint32_t CCR;
  volatile  uint8_t SHP[12];
  volatile  uint32_t SHCSR;
  volatile  uint32_t CFSR;
  volatile  uint32_t HFSR;
  volatile  uint32_t DFSR;
  volatile  uint32_t MMFAR;
  volatile  uint32_t BFAR;
  volatile  uint32_t AFSR;
  volatile  uint32_t PFR[2];
  volatile  uint32_t DFR;
  volatile  uint32_t ADR;
  volatile  uint32_t MMFR[4];
  volatile  uint32_t ISAR[5];
} SCB_Type;
#line 426 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
typedef struct
{
  volatile  uint32_t CTRL;
  volatile  uint32_t LOAD;
  volatile  uint32_t VAL;
  volatile  uint32_t CALIB;
} SysTick_Type;
#line 471 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
typedef struct
{
  volatile  union
 {
  volatile  uint8_t u8;
  volatile  uint16_t u16;
  volatile  uint32_t u32;
 } PORT [32];
 uint32_t RESERVED0[864];
  volatile  uint32_t TER;
 uint32_t RESERVED1[15];
  volatile  uint32_t TPR;
 uint32_t RESERVED2[15];
  volatile  uint32_t TCR;
 uint32_t RESERVED3[29];
  volatile  uint32_t IWR;
  volatile  uint32_t IRR;
  volatile  uint32_t IMCR;
 uint32_t RESERVED4[43];
  volatile  uint32_t LAR;
  volatile  uint32_t LSR;
 uint32_t RESERVED5[6];
  volatile  uint32_t PID4;
  volatile  uint32_t PID5;
  volatile  uint32_t PID6;
  volatile  uint32_t PID7;
  volatile  uint32_t PID0;
  volatile  uint32_t PID1;
  volatile  uint32_t PID2;
  volatile  uint32_t PID3;
  volatile  uint32_t CID0;
  volatile  uint32_t CID1;
  volatile  uint32_t CID2;
  volatile  uint32_t CID3;
} ITM_Type;
#line 564 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
typedef struct
{
 uint32_t RESERVED0;
  volatile  uint32_t ICTR;



 uint32_t RESERVED1;

} InterruptType_Type;
#line 681 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
typedef struct
{
  volatile  uint32_t DHCSR;
  volatile  uint32_t DCRSR;
  volatile  uint32_t DCRDR;
  volatile  uint32_t DEMCR;
} CoreDebug_Type;
#line 1529 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
static  inline  void NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
 uint32_t reg_value;
 uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);

 reg_value =  ((SCB_Type *) ( (0xE000E000)  + 0x0D00) ) ->AIRCR;
 reg_value &= ~( (0xFFFFul << 16 )  |  (7ul << 8 ) );
 reg_value = (reg_value |
 (0x5FA <<  16 ) |
 (PriorityGroupTmp << 8));
  ((SCB_Type *) ( (0xE000E000)  + 0x0D00) ) ->AIRCR = reg_value;
}
#line 1550 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
static  inline  uint32_t NVIC_GetPriorityGrouping(void)
{
 return (( ((SCB_Type *) ( (0xE000E000)  + 0x0D00) ) ->AIRCR &  (7ul << 8 ) ) >>  8 );
}
#line 1563 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
static  inline  void NVIC_EnableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ( (0xE000E000)  + 0x0100) ) ->ISER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));
}
#line 1576 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
static  inline  void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ( (0xE000E000)  + 0x0100) ) ->ICER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));
}
#line 1590 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
static  inline  uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
 return((uint32_t) (( ((NVIC_Type *) ( (0xE000E000)  + 0x0100) ) ->ISPR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));
}
#line 1603 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
static  inline  void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ( (0xE000E000)  + 0x0100) ) ->ISPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));
}
#line 1616 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
static  inline  void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ( (0xE000E000)  + 0x0100) ) ->ICPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));
}
#line 1630 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
static  inline  uint32_t NVIC_GetActive(IRQn_Type IRQn)
{
 return((uint32_t)(( ((NVIC_Type *) ( (0xE000E000)  + 0x0100) ) ->IABR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));
}
#line 1647 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
static  inline  void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
 if(IRQn < 0) {
  ((SCB_Type *) ( (0xE000E000)  + 0x0D00) ) ->SHP[((uint32_t)(IRQn) & 0xF)-4] = ((priority << (8 -  4 )) & 0xff); }
 else {
  ((NVIC_Type *) ( (0xE000E000)  + 0x0100) ) ->IP[(uint32_t)(IRQn)] = ((priority << (8 -  4 )) & 0xff); }
}
#line 1670 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
static  inline  uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

 if(IRQn < 0) {
 return((uint32_t)( ((SCB_Type *) ( (0xE000E000)  + 0x0D00) ) ->SHP[((uint32_t)(IRQn) & 0xF)-4] >> (8 -  4 ))); }
 else {
 return((uint32_t)( ((NVIC_Type *) ( (0xE000E000)  + 0x0100) ) ->IP[(uint32_t)(IRQn)] >> (8 -  4 ))); }
}
#line 1695 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
static  inline  uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
 uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);
 uint32_t PreemptPriorityBits;
 uint32_t SubPriorityBits;

 PreemptPriorityBits = ((7 - PriorityGroupTmp) >  4 ) ?  4  : 7 - PriorityGroupTmp;
 SubPriorityBits = ((PriorityGroupTmp +  4 ) < 7) ? 0 : PriorityGroupTmp - 7 +  4 ;

 return (
 ((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
 ((SubPriority & ((1 << (SubPriorityBits )) - 1)))
 );
}
#line 1726 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
static  inline  void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* pPreemptPriority, uint32_t* pSubPriority)
{
 uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);
 uint32_t PreemptPriorityBits;
 uint32_t SubPriorityBits;

 PreemptPriorityBits = ((7 - PriorityGroupTmp) >  4 ) ?  4  : 7 - PriorityGroupTmp;
 SubPriorityBits = ((PriorityGroupTmp +  4 ) < 7) ? 0 : PriorityGroupTmp - 7 +  4 ;

 *pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
 *pSubPriority = (Priority ) & ((1 << (SubPriorityBits )) - 1);
}
#line 1755 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
static  inline  uint32_t SysTick_Config(uint32_t ticks)
{
 if (ticks >  (0xFFFFFFul << 0 ) ) return (1);

  ((SysTick_Type *) ( (0xE000E000)  + 0x0010) ) ->LOAD = (ticks &  (0xFFFFFFul << 0 ) ) - 1;
 NVIC_SetPriority (SysTick_IRQn, (1<< 4 ) - 1);
  ((SysTick_Type *) ( (0xE000E000)  + 0x0010) ) ->VAL = 0;
  ((SysTick_Type *) ( (0xE000E000)  + 0x0010) ) ->CTRL =  (1ul << 2 )  |
  (1ul << 1 )  |
  (1ul << 0 ) ;
 return (0);
}
#line 1780 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
static  inline  void NVIC_SystemReset(void)
{
  ((SCB_Type *) ( (0xE000E000)  + 0x0D00) ) ->AIRCR = ((0x5FA <<  16 ) |
 ( ((SCB_Type *) ( (0xE000E000)  + 0x0D00) ) ->AIRCR &  (7ul << 8 ) ) |
  (1ul << 2 ) );
 asm {dsb };
 while(1);
}
#line 1803 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
extern volatile int ITM_RxBuffer;
#line 1817 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
static  inline  uint32_t ITM_SendChar (uint32_t ch)
{
 if (( ((CoreDebug_Type *) (0xE000EDF0) ) ->DEMCR &  (1ul << 24 ) ) &&
 ( ((ITM_Type *) (0xE0000000) ) ->TCR &  (1ul << 0 ) ) &&
 ( ((ITM_Type *) (0xE0000000) ) ->TER & (1ul << 0) ) )
 {
 while ( ((ITM_Type *) (0xE0000000) ) ->PORT[0].u32 == 0);
  ((ITM_Type *) (0xE0000000) ) ->PORT[0].u8 = (uint8_t) ch;
 }
 return (ch);
}
#line 1839 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
static  inline  int ITM_ReceiveChar (void) {
 int ch = -1;

 if (ITM_RxBuffer !=  0x5AA55AA5 ) {
 ch = ITM_RxBuffer;
 ITM_RxBuffer =  0x5AA55AA5 ;
 }

 return (ch);
}
#line 1859 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/coresupport/core_cm3.h"
static  inline  int ITM_CheckChar (void) {

 if (ITM_RxBuffer ==  0x5AA55AA5 ) {
 return (0);
 } else {
 return (1);
 }
}
#line 1 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/system_stm32f10x.h"
#line 53 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/system_stm32f10x.h"
extern uint32_t SystemCoreClock;
#line 79 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/system_stm32f10x.h"
extern void SystemInit(void);
extern void SystemCoreClockUpdate(void);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 487 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef int32_t s32;
typedef int16_t s16;
typedef int8_t s8;

typedef const int32_t sc32;
typedef const int16_t sc16;
typedef const int8_t sc8;

typedef  volatile  int32_t vs32;
typedef  volatile  int16_t vs16;
typedef  volatile  int8_t vs8;

typedef  volatile  int32_t vsc32;
typedef  volatile  int16_t vsc16;
typedef  volatile  int8_t vsc8;

typedef uint32_t u32;
typedef uint16_t u16;
typedef uint8_t u8;

typedef const uint32_t uc32;
typedef const uint16_t uc16;
typedef const uint8_t uc8;

typedef  volatile  uint32_t vu32;
typedef  volatile  uint16_t vu16;
typedef  volatile  uint8_t vu8;

typedef  volatile  uint32_t vuc32;
typedef  volatile  uint16_t vuc16;
typedef  volatile  uint8_t vuc8;

typedef enum {RESET = 0, SET = !RESET} FlagStatus, ITStatus;

typedef enum {DISABLE = 0, ENABLE = !DISABLE} FunctionalState;


typedef enum {ERROR = 0, SUCCESS = !ERROR} ErrorStatus;
#line 542 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t SR;
  volatile  uint32_t CR1;
  volatile  uint32_t CR2;
  volatile  uint32_t SMPR1;
  volatile  uint32_t SMPR2;
  volatile  uint32_t JOFR1;
  volatile  uint32_t JOFR2;
  volatile  uint32_t JOFR3;
  volatile  uint32_t JOFR4;
  volatile  uint32_t HTR;
  volatile  uint32_t LTR;
  volatile  uint32_t SQR1;
  volatile  uint32_t SQR2;
  volatile  uint32_t SQR3;
  volatile  uint32_t JSQR;
  volatile  uint32_t JDR1;
  volatile  uint32_t JDR2;
  volatile  uint32_t JDR3;
  volatile  uint32_t JDR4;
  volatile  uint32_t DR;
} ADC_TypeDef;
#line 570 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
 uint32_t RESERVED0;
  volatile  uint16_t DR1;
 uint16_t RESERVED1;
  volatile  uint16_t DR2;
 uint16_t RESERVED2;
  volatile  uint16_t DR3;
 uint16_t RESERVED3;
  volatile  uint16_t DR4;
 uint16_t RESERVED4;
  volatile  uint16_t DR5;
 uint16_t RESERVED5;
  volatile  uint16_t DR6;
 uint16_t RESERVED6;
  volatile  uint16_t DR7;
 uint16_t RESERVED7;
  volatile  uint16_t DR8;
 uint16_t RESERVED8;
  volatile  uint16_t DR9;
 uint16_t RESERVED9;
  volatile  uint16_t DR10;
 uint16_t RESERVED10;
  volatile  uint16_t RTCCR;
 uint16_t RESERVED11;
  volatile  uint16_t CR;
 uint16_t RESERVED12;
  volatile  uint16_t CSR;
 uint16_t RESERVED13[5];
  volatile  uint16_t DR11;
 uint16_t RESERVED14;
  volatile  uint16_t DR12;
 uint16_t RESERVED15;
  volatile  uint16_t DR13;
 uint16_t RESERVED16;
  volatile  uint16_t DR14;
 uint16_t RESERVED17;
  volatile  uint16_t DR15;
 uint16_t RESERVED18;
  volatile  uint16_t DR16;
 uint16_t RESERVED19;
  volatile  uint16_t DR17;
 uint16_t RESERVED20;
  volatile  uint16_t DR18;
 uint16_t RESERVED21;
  volatile  uint16_t DR19;
 uint16_t RESERVED22;
  volatile  uint16_t DR20;
 uint16_t RESERVED23;
  volatile  uint16_t DR21;
 uint16_t RESERVED24;
  volatile  uint16_t DR22;
 uint16_t RESERVED25;
  volatile  uint16_t DR23;
 uint16_t RESERVED26;
  volatile  uint16_t DR24;
 uint16_t RESERVED27;
  volatile  uint16_t DR25;
 uint16_t RESERVED28;
  volatile  uint16_t DR26;
 uint16_t RESERVED29;
  volatile  uint16_t DR27;
 uint16_t RESERVED30;
  volatile  uint16_t DR28;
 uint16_t RESERVED31;
  volatile  uint16_t DR29;
 uint16_t RESERVED32;
  volatile  uint16_t DR30;
 uint16_t RESERVED33;
  volatile  uint16_t DR31;
 uint16_t RESERVED34;
  volatile  uint16_t DR32;
 uint16_t RESERVED35;
  volatile  uint16_t DR33;
 uint16_t RESERVED36;
  volatile  uint16_t DR34;
 uint16_t RESERVED37;
  volatile  uint16_t DR35;
 uint16_t RESERVED38;
  volatile  uint16_t DR36;
 uint16_t RESERVED39;
  volatile  uint16_t DR37;
 uint16_t RESERVED40;
  volatile  uint16_t DR38;
 uint16_t RESERVED41;
  volatile  uint16_t DR39;
 uint16_t RESERVED42;
  volatile  uint16_t DR40;
 uint16_t RESERVED43;
  volatile  uint16_t DR41;
 uint16_t RESERVED44;
  volatile  uint16_t DR42;
 uint16_t RESERVED45;
} BKP_TypeDef;
#line 669 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t TIR;
  volatile  uint32_t TDTR;
  volatile  uint32_t TDLR;
  volatile  uint32_t TDHR;
} CAN_TxMailBox_TypeDef;
#line 681 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t RIR;
  volatile  uint32_t RDTR;
  volatile  uint32_t RDLR;
  volatile  uint32_t RDHR;
} CAN_FIFOMailBox_TypeDef;
#line 693 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t FR1;
  volatile  uint32_t FR2;
} CAN_FilterRegister_TypeDef;
#line 703 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t MCR;
  volatile  uint32_t MSR;
  volatile  uint32_t TSR;
  volatile  uint32_t RF0R;
  volatile  uint32_t RF1R;
  volatile  uint32_t IER;
  volatile  uint32_t ESR;
  volatile  uint32_t BTR;
 uint32_t RESERVED0[88];
 CAN_TxMailBox_TypeDef sTxMailBox[3];
 CAN_FIFOMailBox_TypeDef sFIFOMailBox[2];
 uint32_t RESERVED1[12];
  volatile  uint32_t FMR;
  volatile  uint32_t FM1R;
 uint32_t RESERVED2;
  volatile  uint32_t FS1R;
 uint32_t RESERVED3;
  volatile  uint32_t FFA1R;
 uint32_t RESERVED4;
  volatile  uint32_t FA1R;
 uint32_t RESERVED5[8];

 CAN_FilterRegister_TypeDef sFilterRegister[14];
#line 731 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
} CAN_TypeDef;
#line 736 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t CFGR;
  volatile  uint32_t OAR;
  volatile  uint32_t PRES;
  volatile  uint32_t ESR;
  volatile  uint32_t CSR;
  volatile  uint32_t TXD;
  volatile  uint32_t RXD;
} CEC_TypeDef;
#line 751 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t DR;
  volatile  uint8_t IDR;
 uint8_t RESERVED0;
 uint16_t RESERVED1;
  volatile  uint32_t CR;
} CRC_TypeDef;
#line 764 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t CR;
  volatile  uint32_t SWTRIGR;
  volatile  uint32_t DHR12R1;
  volatile  uint32_t DHR12L1;
  volatile  uint32_t DHR8R1;
  volatile  uint32_t DHR12R2;
  volatile  uint32_t DHR12L2;
  volatile  uint32_t DHR8R2;
  volatile  uint32_t DHR12RD;
  volatile  uint32_t DHR12LD;
  volatile  uint32_t DHR8RD;
  volatile  uint32_t DOR1;
  volatile  uint32_t DOR2;
#line 782 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
} DAC_TypeDef;
#line 788 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t IDCODE;
  volatile  uint32_t CR;
}DBGMCU_TypeDef;
#line 798 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t CCR;
  volatile  uint32_t CNDTR;
  volatile  uint32_t CPAR;
  volatile  uint32_t CMAR;
} DMA_Channel_TypeDef;

typedef struct
{
  volatile  uint32_t ISR;
  volatile  uint32_t IFCR;
} DMA_TypeDef;
#line 816 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t MACCR;
  volatile  uint32_t MACFFR;
  volatile  uint32_t MACHTHR;
  volatile  uint32_t MACHTLR;
  volatile  uint32_t MACMIIAR;
  volatile  uint32_t MACMIIDR;
  volatile  uint32_t MACFCR;
  volatile  uint32_t MACVLANTR;
 uint32_t RESERVED0[2];
  volatile  uint32_t MACRWUFFR;
  volatile  uint32_t MACPMTCSR;
 uint32_t RESERVED1[2];
  volatile  uint32_t MACSR;
  volatile  uint32_t MACIMR;
  volatile  uint32_t MACA0HR;
  volatile  uint32_t MACA0LR;
  volatile  uint32_t MACA1HR;
  volatile  uint32_t MACA1LR;
  volatile  uint32_t MACA2HR;
  volatile  uint32_t MACA2LR;
  volatile  uint32_t MACA3HR;
  volatile  uint32_t MACA3LR;
 uint32_t RESERVED2[40];
  volatile  uint32_t MMCCR;
  volatile  uint32_t MMCRIR;
  volatile  uint32_t MMCTIR;
  volatile  uint32_t MMCRIMR;
  volatile  uint32_t MMCTIMR;
 uint32_t RESERVED3[14];
  volatile  uint32_t MMCTGFSCCR;
  volatile  uint32_t MMCTGFMSCCR;
 uint32_t RESERVED4[5];
  volatile  uint32_t MMCTGFCR;
 uint32_t RESERVED5[10];
  volatile  uint32_t MMCRFCECR;
  volatile  uint32_t MMCRFAECR;
 uint32_t RESERVED6[10];
  volatile  uint32_t MMCRGUFCR;
 uint32_t RESERVED7[334];
  volatile  uint32_t PTPTSCR;
  volatile  uint32_t PTPSSIR;
  volatile  uint32_t PTPTSHR;
  volatile  uint32_t PTPTSLR;
  volatile  uint32_t PTPTSHUR;
  volatile  uint32_t PTPTSLUR;
  volatile  uint32_t PTPTSAR;
  volatile  uint32_t PTPTTHR;
  volatile  uint32_t PTPTTLR;
 uint32_t RESERVED8[567];
  volatile  uint32_t DMABMR;
  volatile  uint32_t DMATPDR;
  volatile  uint32_t DMARPDR;
  volatile  uint32_t DMARDLAR;
  volatile  uint32_t DMATDLAR;
  volatile  uint32_t DMASR;
  volatile  uint32_t DMAOMR;
  volatile  uint32_t DMAIER;
  volatile  uint32_t DMAMFBOCR;
 uint32_t RESERVED9[9];
  volatile  uint32_t DMACHTDR;
  volatile  uint32_t DMACHRDR;
  volatile  uint32_t DMACHTBAR;
  volatile  uint32_t DMACHRBAR;
} ETH_TypeDef;
#line 887 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t IMR;
  volatile  uint32_t EMR;
  volatile  uint32_t RTSR;
  volatile  uint32_t FTSR;
  volatile  uint32_t SWIER;
  volatile  uint32_t PR;
} EXTI_TypeDef;
#line 901 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t ACR;
  volatile  uint32_t KEYR;
  volatile  uint32_t OPTKEYR;
  volatile  uint32_t SR;
  volatile  uint32_t CR;
  volatile  uint32_t AR;
  volatile  uint32_t RESERVED;
  volatile  uint32_t OBR;
  volatile  uint32_t WRPR;
#line 920 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
} FLASH_TypeDef;
#line 926 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint16_t RDP;
  volatile  uint16_t USER;
  volatile  uint16_t Data0;
  volatile  uint16_t Data1;
  volatile  uint16_t WRP0;
  volatile  uint16_t WRP1;
  volatile  uint16_t WRP2;
  volatile  uint16_t WRP3;
} OB_TypeDef;
#line 942 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t BTCR[8];
} FSMC_Bank1_TypeDef;
#line 951 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t BWTR[7];
} FSMC_Bank1E_TypeDef;
#line 960 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t PCR2;
  volatile  uint32_t SR2;
  volatile  uint32_t PMEM2;
  volatile  uint32_t PATT2;
 uint32_t RESERVED0;
  volatile  uint32_t ECCR2;
} FSMC_Bank2_TypeDef;
#line 974 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t PCR3;
  volatile  uint32_t SR3;
  volatile  uint32_t PMEM3;
  volatile  uint32_t PATT3;
 uint32_t RESERVED0;
  volatile  uint32_t ECCR3;
} FSMC_Bank3_TypeDef;
#line 988 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t PCR4;
  volatile  uint32_t SR4;
  volatile  uint32_t PMEM4;
  volatile  uint32_t PATT4;
  volatile  uint32_t PIO4;
} FSMC_Bank4_TypeDef;
#line 1001 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t CRL;
  volatile  uint32_t CRH;
  volatile  uint32_t IDR;
  volatile  uint32_t ODR;
  volatile  uint32_t BSRR;
  volatile  uint32_t BRR;
  volatile  uint32_t LCKR;
} GPIO_TypeDef;
#line 1016 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t EVCR;
  volatile  uint32_t MAPR;
  volatile  uint32_t EXTICR[4];
 uint32_t RESERVED0;
  volatile  uint32_t MAPR2;
} AFIO_TypeDef;
#line 1028 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint16_t CR1;
 uint16_t RESERVED0;
  volatile  uint16_t CR2;
 uint16_t RESERVED1;
  volatile  uint16_t OAR1;
 uint16_t RESERVED2;
  volatile  uint16_t OAR2;
 uint16_t RESERVED3;
  volatile  uint16_t DR;
 uint16_t RESERVED4;
  volatile  uint16_t SR1;
 uint16_t RESERVED5;
  volatile  uint16_t SR2;
 uint16_t RESERVED6;
  volatile  uint16_t CCR;
 uint16_t RESERVED7;
  volatile  uint16_t TRISE;
 uint16_t RESERVED8;
} I2C_TypeDef;
#line 1054 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t KR;
  volatile  uint32_t PR;
  volatile  uint32_t RLR;
  volatile  uint32_t SR;
} IWDG_TypeDef;
#line 1066 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t CR;
  volatile  uint32_t CSR;
} PWR_TypeDef;
#line 1076 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t CR;
  volatile  uint32_t CFGR;
  volatile  uint32_t CIR;
  volatile  uint32_t APB2RSTR;
  volatile  uint32_t APB1RSTR;
  volatile  uint32_t AHBENR;
  volatile  uint32_t APB2ENR;
  volatile  uint32_t APB1ENR;
  volatile  uint32_t BDCR;
  volatile  uint32_t CSR;
#line 1098 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
} RCC_TypeDef;
#line 1104 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint16_t CRH;
 uint16_t RESERVED0;
  volatile  uint16_t CRL;
 uint16_t RESERVED1;
  volatile  uint16_t PRLH;
 uint16_t RESERVED2;
  volatile  uint16_t PRLL;
 uint16_t RESERVED3;
  volatile  uint16_t DIVH;
 uint16_t RESERVED4;
  volatile  uint16_t DIVL;
 uint16_t RESERVED5;
  volatile  uint16_t CNTH;
 uint16_t RESERVED6;
  volatile  uint16_t CNTL;
 uint16_t RESERVED7;
  volatile  uint16_t ALRH;
 uint16_t RESERVED8;
  volatile  uint16_t ALRL;
 uint16_t RESERVED9;
} RTC_TypeDef;
#line 1132 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t POWER;
  volatile  uint32_t CLKCR;
  volatile  uint32_t ARG;
  volatile  uint32_t CMD;
  volatile  uint32_t RESPCMD;
  volatile  uint32_t RESP1;
  volatile  uint32_t RESP2;
  volatile  uint32_t RESP3;
  volatile  uint32_t RESP4;
  volatile  uint32_t DTIMER;
  volatile  uint32_t DLEN;
  volatile  uint32_t DCTRL;
  volatile  uint32_t DCOUNT;
  volatile  uint32_t STA;
  volatile  uint32_t ICR;
  volatile  uint32_t MASK;
 uint32_t RESERVED0[2];
  volatile  uint32_t FIFOCNT;
 uint32_t RESERVED1[13];
  volatile  uint32_t FIFO;
} SDIO_TypeDef;
#line 1160 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint16_t CR1;
 uint16_t RESERVED0;
  volatile  uint16_t CR2;
 uint16_t RESERVED1;
  volatile  uint16_t SR;
 uint16_t RESERVED2;
  volatile  uint16_t DR;
 uint16_t RESERVED3;
  volatile  uint16_t CRCPR;
 uint16_t RESERVED4;
  volatile  uint16_t RXCRCR;
 uint16_t RESERVED5;
  volatile  uint16_t TXCRCR;
 uint16_t RESERVED6;
  volatile  uint16_t I2SCFGR;
 uint16_t RESERVED7;
  volatile  uint16_t I2SPR;
 uint16_t RESERVED8;
} SPI_TypeDef;
#line 1186 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint16_t CR1;
 uint16_t RESERVED0;
  volatile  uint16_t CR2;
 uint16_t RESERVED1;
  volatile  uint16_t SMCR;
 uint16_t RESERVED2;
  volatile  uint16_t DIER;
 uint16_t RESERVED3;
  volatile  uint16_t SR;
 uint16_t RESERVED4;
  volatile  uint16_t EGR;
 uint16_t RESERVED5;
  volatile  uint16_t CCMR1;
 uint16_t RESERVED6;
  volatile  uint16_t CCMR2;
 uint16_t RESERVED7;
  volatile  uint16_t CCER;
 uint16_t RESERVED8;
  volatile  uint16_t CNT;
 uint16_t RESERVED9;
  volatile  uint16_t PSC;
 uint16_t RESERVED10;
  volatile  uint16_t ARR;
 uint16_t RESERVED11;
  volatile  uint16_t RCR;
 uint16_t RESERVED12;
  volatile  uint16_t CCR1;
 uint16_t RESERVED13;
  volatile  uint16_t CCR2;
 uint16_t RESERVED14;
  volatile  uint16_t CCR3;
 uint16_t RESERVED15;
  volatile  uint16_t CCR4;
 uint16_t RESERVED16;
  volatile  uint16_t BDTR;
 uint16_t RESERVED17;
  volatile  uint16_t DCR;
 uint16_t RESERVED18;
  volatile  uint16_t DMAR;
 uint16_t RESERVED19;
} TIM_TypeDef;
#line 1234 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint16_t SR;
 uint16_t RESERVED0;
  volatile  uint16_t DR;
 uint16_t RESERVED1;
  volatile  uint16_t BRR;
 uint16_t RESERVED2;
  volatile  uint16_t CR1;
 uint16_t RESERVED3;
  volatile  uint16_t CR2;
 uint16_t RESERVED4;
  volatile  uint16_t CR3;
 uint16_t RESERVED5;
  volatile  uint16_t GTPR;
 uint16_t RESERVED6;
} USART_TypeDef;
#line 1256 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
typedef struct
{
  volatile  uint32_t CR;
  volatile  uint32_t CFR;
  volatile  uint32_t SR;
} WWDG_TypeDef;
#line 46 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/stm32f10x_stdperiph_driver/inc/stm32f10x_rcc.h"
typedef struct
{
 uint32_t SYSCLK_Frequency;
 uint32_t HCLK_Frequency;
 uint32_t PCLK1_Frequency;
 uint32_t PCLK2_Frequency;
 uint32_t ADCCLK_Frequency;
}RCC_ClocksTypeDef;
#line 647 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/stm32f10x_stdperiph_driver/inc/stm32f10x_rcc.h"
void RCC_DeInit(void);
void RCC_HSEConfig(uint32_t RCC_HSE);
ErrorStatus RCC_WaitForHSEStartUp(void);
void RCC_AdjustHSICalibrationValue(uint8_t HSICalibrationValue);
void RCC_HSICmd(FunctionalState NewState);
void RCC_PLLConfig(uint32_t RCC_PLLSource, uint32_t RCC_PLLMul);
void RCC_PLLCmd(FunctionalState NewState);
#line 667 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/stm32f10x_stdperiph_driver/inc/stm32f10x_rcc.h"
void RCC_SYSCLKConfig(uint32_t RCC_SYSCLKSource);
uint8_t RCC_GetSYSCLKSource(void);
void RCC_HCLKConfig(uint32_t RCC_SYSCLK);
void RCC_PCLK1Config(uint32_t RCC_HCLK);
void RCC_PCLK2Config(uint32_t RCC_HCLK);
void RCC_ITConfig(uint8_t RCC_IT, FunctionalState NewState);


 void RCC_USBCLKConfig(uint32_t RCC_USBCLKSource);
#line 680 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/stm32f10x_stdperiph_driver/inc/stm32f10x_rcc.h"
void RCC_ADCCLKConfig(uint32_t RCC_PCLK2);
#line 687 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/stm32f10x_stdperiph_driver/inc/stm32f10x_rcc.h"
void RCC_LSEConfig(uint8_t RCC_LSE);
void RCC_LSICmd(FunctionalState NewState);
void RCC_RTCCLKConfig(uint32_t RCC_RTCCLKSource);
void RCC_RTCCLKCmd(FunctionalState NewState);
void RCC_GetClocksFreq(RCC_ClocksTypeDef* RCC_Clocks);
void RCC_AHBPeriphClockCmd(uint32_t RCC_AHBPeriph, FunctionalState NewState);
void RCC_APB2PeriphClockCmd(uint32_t RCC_APB2Periph, FunctionalState NewState);
void RCC_APB1PeriphClockCmd(uint32_t RCC_APB1Periph, FunctionalState NewState);
#line 700 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/stm32f10x_stdperiph_driver/inc/stm32f10x_rcc.h"
void RCC_APB2PeriphResetCmd(uint32_t RCC_APB2Periph, FunctionalState NewState);
void RCC_APB1PeriphResetCmd(uint32_t RCC_APB1Periph, FunctionalState NewState);
void RCC_BackupResetCmd(FunctionalState NewState);
void RCC_ClockSecuritySystemCmd(FunctionalState NewState);
void RCC_MCOConfig(uint8_t RCC_MCO);
FlagStatus RCC_GetFlagStatus(uint8_t RCC_FLAG);
void RCC_ClearFlag(void);
ITStatus RCC_GetITStatus(uint8_t RCC_IT);
void RCC_ClearITPendingBit(uint8_t RCC_IT);
#line 1 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/stm32f10x_stdperiph_driver/inc/stm32f10x_gpio.h"
#line 1 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/cmsis/cm3/devicesupport/st/stm32f10x/stm32f10x.h"
#line 58 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/stm32f10x_stdperiph_driver/inc/stm32f10x_gpio.h"
typedef enum
{
 GPIO_Speed_10MHz = 1,
 GPIO_Speed_2MHz,
 GPIO_Speed_50MHz
}GPIOSpeed_TypeDef;
#line 73 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/stm32f10x_stdperiph_driver/inc/stm32f10x_gpio.h"
typedef enum
{ GPIO_Mode_AIN = 0x0,
 GPIO_Mode_IN_FLOATING = 0x04,
 GPIO_Mode_IPD = 0x28,
 GPIO_Mode_IPU = 0x48,
 GPIO_Mode_Out_OD = 0x14,
 GPIO_Mode_Out_PP = 0x10,
 GPIO_Mode_AF_OD = 0x1C,
 GPIO_Mode_AF_PP = 0x18
}GPIOMode_TypeDef;
#line 93 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/stm32f10x_stdperiph_driver/inc/stm32f10x_gpio.h"
typedef struct
{
#line 96 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/stm32f10x_stdperiph_driver/inc/stm32f10x_gpio.h"
 uint16_t GPIO_Pin;
#line 99 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/stm32f10x_stdperiph_driver/inc/stm32f10x_gpio.h"
 GPIOSpeed_TypeDef GPIO_Speed;
#line 102 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/stm32f10x_stdperiph_driver/inc/stm32f10x_gpio.h"
 GPIOMode_TypeDef GPIO_Mode;
}GPIO_InitTypeDef;
#line 110 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/stm32f10x_stdperiph_driver/inc/stm32f10x_gpio.h"
typedef enum
{ Bit_RESET = 0,
 Bit_SET
}BitAction;
#line 351 "c:/users/shawon&nipa/desktop/stm32 test/stm32f10x_stdperiph_lib_v3.5.0_port/stm32f10x_stdperiph_driver/inc/stm32f10x_gpio.h"
void GPIO_DeInit(GPIO_TypeDef* GPIOx);
void GPIO_AFIODeInit(void);
void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_InitTypeDef* GPIO_InitStruct);
void GPIO_StructInit(GPIO_InitTypeDef* GPIO_InitStruct);
uint8_t GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
uint16_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx);
uint8_t GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
uint16_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx);
void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
void GPIO_WriteBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, BitAction BitVal);
void GPIO_Write(GPIO_TypeDef* GPIOx, uint16_t PortVal);
void GPIO_PinLockConfig(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
void GPIO_EventOutputConfig(uint8_t GPIO_PortSource, uint8_t GPIO_PinSource);
void GPIO_EventOutputCmd(FunctionalState NewState);
void GPIO_PinRemapConfig(uint32_t GPIO_Remap, FunctionalState NewState);
void GPIO_EXTILineConfig(uint8_t GPIO_PortSource, uint8_t GPIO_PinSource);
void GPIO_ETH_MediaInterfaceConfig(uint32_t GPIO_ETH_MediaInterface);
#line 5 "C:/Users/Shawon&Nipa/Desktop/TEST/test.c"
void setup();


void main()
{
 unsigned int t = 900;

 setup();

 while(1)
 {

 if(GPIO_ReadInputDataBit( ((GPIO_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x10000)  + 0x0800) ) ,  ((uint16_t)0x0008) ))
 {
 t = 400;
 }
 else
 {
 t = 900;
 }

 GPIO_SetBits( ((GPIO_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x10000)  + 0x0800) ) ,  ((uint16_t)0x0001) );
 VDelay_ms(t);
 GPIO_ResetBits( ((GPIO_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x10000)  + 0x0800) ) ,  ((uint16_t)0x0001) );
 VDelay_ms(t);
 };
}


void setup()
{
 GPIO_InitTypeDef GPIO_InitStructure;

 RCC_APB2PeriphClockCmd( ((uint32_t)0x00000004) , ENABLE);
 GPIO_InitStructure.GPIO_Pin =  ((uint16_t)0x0001) ;
 GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
 GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;

 GPIO_Init( ((GPIO_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x10000)  + 0x0800) ) , &GPIO_InitStructure);

 GPIO_InitStructure.GPIO_Pin =  ((uint16_t)0x0008) ;
 GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;

 GPIO_Init( ((GPIO_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x10000)  + 0x0800) ) , &GPIO_InitStructure);
}
