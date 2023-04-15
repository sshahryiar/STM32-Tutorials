/*      Functions for TIM11      */

#define enable_TIM11(mode)                                                               RCC_APB2ENRbits.TIM11EN = mode

#define set_TIM11_clock_division(value)                                                  do{TIM11_CR1 &= (~(0x3 << 8));  TIM11_CR1 |= (value << 8);}while(0)
#define set_TIM11_auto_reload_preload_mode(mode)                                         TIM11_CR1bits.ARPE = mode
#define set_TIM11_update_request_source(mode)                                            TIM11_CR1bits.URS = mode
#define disable_TIM11_update(mode)                                                       TIM11_CR1bits.UDIS = mode
#define enable_TIM11_counter(mode)                                                       TIM11_CR1bits.CEN = mode

#define enable_TIM11_CC1_interrupt(mode)                                                 TIM11_DIERbits.CC1IE = mode
#define enable_TIM11_update_interrupt(mode)                                              TIM11_DIERbits.UIE = mode

#define enable_TIM11_OC1_clear(mode)                                                     TIM11_CCMR1_Outputbits.OC1CE = mode
#define enable_TIM11_OC1_preload(mode)                                                   TIM11_CCMR1_Outputbits.OC1PE = mode
#define enable_TIM11_OC1_fast(mode)                                                      TIM11_CCMR1_Outputbits.OC1FE = mode
#define set_TIM11_OC1_compare_mode(value)                                                do{TIM11_CCMR1_Output &= (~(0x7 << 4));  TIM11_CCMR1_Output |= (value << 4);}while(0)
#define set_TIM11_CC1_selection(value)                                                   do{TIM11_CCMR1_Output &= (~(0x3 << 0));  TIM11_CCMR1_Output |= (value << 0);}while(0)
#define set_TIM11_IC1_input_prescalar(value)                                             do{TIM11_CCMR1_Input &= (~(0x3 << 2));  TIM11_CCMR1_Input |= (value << 2);}while(0)
#define set_TIM11_IC1_filter(value)                                                      do{TIM11_CCMR1_Input &= (~(0xF << 4));  TIM11_CCMR1_Input |= (value << 4);}while(0)

#define set_TIM11_CC1_state_and_polarity(state, polarity, complementary_output)          do{TIM11_CCERbits.CC1E = state; TIM11_CCERbits.CC1P = polarity; TIM11_CCERbits.CC1NP = complementary_output;}while(0)
