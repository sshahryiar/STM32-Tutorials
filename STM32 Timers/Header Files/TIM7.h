/*      Functions for TIM7      */

#define enable_TIM7(mode)                                                                RCC_APB1ENRbits.TIM7EN = mode

#define set_TIM7_clock_division(value)                                                   do{TIM7_CR1 &= (~(0x3 << 8));  TIM7_CR1 |= (value << 8);}while(0)
#define set_TIM7_auto_reload_preload_mode(mode)                                          TIM7_CR1bits.ARPE = mode
#define set_TIM7_one_pulse_mode(mode)                                                    TIM7_CR1bits.OPM = mode
#define set_TIM7_update_request_source(mode)                                             TIM7_CR1bits.URS = mode
#define disable_TIM7_update(mode)                                                        TIM7_CR1bits.UDIS = mode
#define enable_TIM7_counter(mode)                                                        TIM7_CR1bits.CEN = mode

#define set_TIM7_master_mode_selection(value)                                            do{TIM7_CR2 &= (~(0x7 << 4));  TIM7_CR2 |= (value << 4);}while(0)

#define enable_TIM7_update_DMA_request(mode)                                             TIM7_DIERbits.UDE = mode
#define enable_TIM7_update_interrupt(mode)                                               TIM7_DIERbits.UIE = mode