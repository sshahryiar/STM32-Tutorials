//Event control register (AFIO_EVCR) definitions

#define EVENT_OUT_EN                            0x80

#define EVENTOUT_on_PA                          0x00
#define EVENTOUT_on_PB                          0x10
#define EVENTOUT_on_PC                          0x20
#define EVENTOUT_on_PD                          0x30
#define EVENTOUT_on_PE                          0x40

#define Event_out(Px, pin_no)                   AFIO_EVCR |= (Px | pin_no)

//AF remap and debug I/O configuration register (AFIO_MAPR) definitions

#define Full_SWJ_with_reset                    0x0000000                                 //Full SWJ (JTAG-DP + SW-DP): Reset State
#define Full_SWJ_without_reset                 0x1000000                                 //Full SWJ (JTAG-DP + SW-DP) but without NJTRST
#define JTAG_Off_SW_DP_On                      0x2000000                                 //JTAG-DP Disabled and SW-DP Enabled
#define JTAG_Off_SW_DP_Off                     0x4000000                                 //JTAG-DP Disabled and SW-DP Disabled

#define ADC2_ETRGREG_not_remapped              0x000000                                  //ADC1 External trigger regular conversion is connected to EXTI11
#define ADC2_ETRGREG_remapped                  0x100000                                  //ADC1 External Event regular conversion is connected to TIM8 TRGO

#define ADC2_ETRGINJ_not_remapped               0x00000                                  //ADC2 external trigger injected conversion is connected to EXTI15
#define ADC2_ETRGINJ_remapped                   0x80000                                  //ADC2 external event injected conversion is connected to TIM8_Channel4

#define ADC1_ETRGREG_remapped                   0x00000                                  //ADC1 External trigger regular conversion is connected to EXTI11
#define ADC1_ETRGREG_not_remapped               0x40000                                  //ADC1 External Event regular conversion is connected to TIM8 TRGO

#define ADC1_ETRGINJ_not_remapped               0x00000                                  //ADC1 External trigger injected conversion is connected to EXTI15
#define ADC1_ETRGINJ_remapped                   0x20000                                  //ADC1 External Event injected conversion is connected to TIM8 Channel4

#define TIM5CH4_not_remapped                    0x00000                                  //TIM5_CH4 is connected to PA3
#define TIM5CH4_remapped                        0x10000                                  //LSI internal clock is connected to TIM5_CH4 input for calibration purpose

#define no_PD01_REMAP                           0x0000                                   //No remapping of PD0 and PD1
#define PD01_remapped_to_OSC_pins               0x8000                                   //PD0 remapped on OSC_IN, PD1 remapped on OSC_OUT,

#define CAN_TX_RX_remapped_to_PA11_12           0x0000                                   //CAN_RX mapped to PA11, CAN_TX mapped to PA12
#define CAN_TX_RX_remapped_to_PB8_9             0x4000                                   //CAN_RX mapped to PB8, CAN_TX mapped to PB9 (not available on 36-pin package)
#define CAN_TX_RX_remapped_to_PD0_1             0x6000                                   //CAN_RX mapped to PD0, CAN_TX mapped to PD1

#define TIM4_not_remapped                       0x0000                                   //TIM4_CH1/PB6, TIM4_CH2/PB7, TIM4_CH3/PB8, TIM4_CH4/PB9, TIM4_ETR on PE0
#define TIM4_totally_remapped                   0x1000                                   //TIM4_CH1/PD12, TIM4_CH2/PD13, TIM4_CH3/PD14, TIM4_CH4/PD15, TIM4_ETR on PE0

#define TIM3_not_remapped                       0x000                                    //CH1/PA6, CH2/PA7, CH3/PB0, CH4/PB1, TIM3_ETR on PE0
#define TIM3_partially_remapped                 0x400                                    //CH1/PB4, CH2/PB5, CH3/PB0, CH4/PB1, TIM3_ETR on PE0
#define TIM3_totally_remapped                   0x600                                    //CH1/PC6, CH2/PC7, CH3/PC8, CH4/PC9), TIM3_ETR on PE0

#define TIM2_not_remapped                       0x000                                    //CH1/ETR/PA0, CH2/PA1, CH3/PA2, CH4/PA3
#define TIM2_partially_remapped_1               0x100                                    //CH1/ETR/PA15, CH2/PB3, CH3/PA2, CH4/PA3
#define TIM2_partially_remapped_2               0x200                                    //CH1/ETR/PA0, CH2/PA1, CH3/PB10, CH4/PB11
#define TIM2_fully_remapped                     0x300                                    //CH1/ETR/PA15, CH2/PB3, CH3/PB10, CH4/PB11

#define TIM1_not_remapped                       0x00                                     //ETR/PA12, CH1/PA8, CH2/PA9, CH3/PA10, CH4/PA11, BKIN/PB12, CH1N/PB13, CH2N/PB14, CH3N/PB15
#define TIM1_partially_remapped                 0x40                                     //ETR/PA12, CH1/PA8, CH2/PA9, CH3/PA10, CH4/PA11, BKIN/PA6, CH1N/PA7, CH2N/PB0, CH3N/PB1
#define TIM1_totally_remapped                   0xC0                                     //ETR/PE7, CH1/PE9, CH2/PE11, CH3/PE13, CH4/PE14, BKIN/PE15, CH1N/PE8, CH2N/PE10, CH3N/PE12

#define USART3_not_remapped                     0x00                                     //TX/PB10, RX/PB11, CK/PB12, CTS/PB13, RTS/PB14
#define USART3_partially_remapped               0x10                                     //TX/PC10, RX/PC11, CK/PC12, CTS/PB13, RTS/PB14
#define USART3_totally_remapped                 0x30                                     //TX/PD8, RX/PD9, CK/PD10, CTS/PD11, RTS/PD12

#define USART2_not_remapped                     0x00                                     //CTS/PA0, RTS/PA1, TX/PA2, RX/PA3, CK/PA4
#define USART2_remapped                         0x08                                     //CTS/PD3, RTS/PD4, TX/PD5, RX/PD6, CK/PD7

#define USART1_not_remapped                     0x00                                     //TX/PA9, RX/PA10
#define USART1_remapped                         0x04                                     //TX/PB6, RX/PB7

#define I2C1_not_remapped                       0x00                                     //SCL/PB6, SDA/PB7
#define I2C1_remapped                           0x02                                     //SCL/PB8, SDA/PB9

#define SPI1_not_remapped                       0x00                                     //NSS/PA4, SCK/PA5, MISO/PA6, MOSI/PA7
#define SPI1_remapped                           0x01                                     //NSS/PA15, SCK/PB3, MISO/PB4, MOSI/PB5

#define AFIO_remap(val)                         AFIO_MAPR |= val


//AF remap and debug I/O configuration register (AFIO_MAPR2) definitions

#define TIM9_not_remapped                      0x00                                      //TIM9_CH1 on PA2 and TIM9_CH2 on PA3
#define TIM9_remapped                          0x20                                      //TIM9_CH1 on PE5 and TIM9_CH2 on PE6

#define TIM10_not_remapped                     0x00                                      //TIM10_CH1 alternate function PB8
#define TIM10_remapped                         0x40                                      //TIM10_CH1 alternate function PF6

#define TIM11_not_remapped                     0x00                                      //TIM11_CH1 alternate function PB9
#define TIM11_remapped                         0x80                                      //TIM11_CH1 alternate function PF7

#define TIM13_not_remapped                    0x000                                      //TIM13_CH1 alternate function PA6
#define TIM13_remapped                        0x100                                      //TIM13_CH1 alternate function PF8

#define TIM14_not_remapped                    0x000                                      //TIM14_CH1 alternate function PA7
#define TIM14_remapped                        0x200                                      //TIM14_CH1 alternate function PF9

#define FSMC_NADV_connected_to_output         0x000                                      //The NADV signal is connected to the output (default)
#define FSMC_NADV_not_connected               0x400                                      //The NADV signal is not connected. The I/O pin can be used by another peripheral

#define TIM67_DAC_DMA_not_remapped            0x000
#define TIM67_DAC_DMA_remapped                0x800

#define TIM12_not_remapped                   0x0000
#define TIM12_remapped                       0x1000

#define MISC_not_remapped                    0x0000
#define MISC_remapped                        0x2000

#define AFIO2_remap(val)                      AFIO_MAPR2 |= val


//External interrupt configuration register definitions

#define PA_pin                                  0x00
#define PB_pin                                  0x01
#define PC_pin                                  0x02
#define PD_pin                                  0x03
#define PE_pin                                  0x04
#define PF_pin                                  0x05
#define PG_pin                                  0x06

#define set_EXTI0_3(pin_no, port)               AFIO_EXTICR1 |= (port << (pin_no << 2))
#define set_EXTI4_7(pin_no, port)               AFIO_EXTICR2 |= (port << ((pin_no - 4) << 2))
#define set_EXTI8_11(pin_no, port)              AFIO_EXTICR3 |= (port << ((pin_no - 8) << 2))
#define set_EXTI12_15(pin_no, port)             AFIO_EXTICR4 |= (port << ((pin_no - 12) << 2))


//AFIO Enable

#define AFIO_enable(mode)                       RCC_APB2ENRbits.AFIOEN = mode