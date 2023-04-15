/*      Functions for TIM14      */

#define enable_TIM14(mode)                                                               RCC_APB1ENRbits.TIM14EN = mode

#define set_TIM14_clock_division(value)                                                  do{TIM14_CR1 &= (~(0x3 << 8));  TIM14_CR1 |= (value << 8);}while(0)
#define set_TIM14_auto_reload_preload_mode(mode)                                         TIM14_CR1bits.ARPE = mode
#define set_TIM14_update_request_source(mode)                                            TIM14_CR1bits.URS = mode
#define disable_TIM14_update(mode)                                                       TIM14_CR1bits.UDIS = mode
#define enable_TIM14_counter(mode)                                                       TIM14_CR1bits.CEN = mode

#define enable_TIM14_CC1_interrupt(mode)                                                 TIM14_DIERbits.CC1IE = mode
#define enable_TIM14_update_interrupt(mode)                                              TIM14_DIERbits.UIE = mode

#define enable_TIM14_OC1_clear(mode)                                                     TIM14_CCMR1_Outputbits.OC1CE = mode
#define enable_TIM14_OC1_preload(mode)                                                   TIM14_CCMR1_Outputbits.OC1PE = mode
#define enable_TIM14_OC1_fast(mode)                                                      TIM14_CCMR1_Outputbits.OC1FE = mode
#define set_TIM14_OC1_compare_mode(value)                                                do{TIM14_CCMR1_Output &= (~(0x7 << 4));  TIM14_CCMR1_Output |= (value << 4);}while(0)
#define set_TIM14_CC1_selection(value)                                                   do{TIM14_CCMR1_Output &= (~(0x3 << 0));  TIM14_CCMR1_Output |= (value << 0);}while(0)
#define set_TIM14_IC1_input_prescalar(value)                                             do{TIM14_CCMR1_Input &= (~(0x3 << 2));  TIM14_CCMR1_Input |= (value << 2);}while(0)
#define set_TIM14_IC1_filter(value)                                                      do{TIM14_CCMR1_Input &= (~(0xF << 4));  TIM14_CCMR1_Input |= (value << 4);}while(0)

#define set_TIM14_CC1_state_and_polarity(state, polarity, complementary_output)          do{TIM14_CCERbits.CC1E = state; TIM14_CCERbits.CC1P = polarity; TIM14_CCERbits.CC1NP = complementary_output;}while(0)
