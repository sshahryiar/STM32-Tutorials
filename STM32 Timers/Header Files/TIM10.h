/*      Functions for TIM10      */

#define enable_TIM10(mode)                                                               RCC_APB2ENRbits.TIM10EN = mode

#define set_TIM10_clock_division(value)                                                  do{TIM10_CR1 &= (~(0x3 << 8));  TIM10_CR1 |= (value << 8);}while(0)
#define set_TIM10_auto_reload_preload_mode(mode)                                         TIM10_CR1bits.ARPE = mode
#define set_TIM10_update_request_source(mode)                                            TIM10_CR1bits.URS = mode
#define disable_TIM10_update(mode)                                                       TIM10_CR1bits.UDIS = mode
#define enable_TIM10_counter(mode)                                                       TIM10_CR1bits.CEN = mode

#define enable_TIM10_CC1_interrupt(mode)                                                 TIM10_DIERbits.CC1IE = mode
#define enable_TIM10_update_interrupt(mode)                                              TIM10_DIERbits.UIE = mode

#define enable_TIM10_OC1_clear(mode)                                                     TIM10_CCMR1_Outputbits.OC1CE = mode
#define enable_TIM10_OC1_preload(mode)                                                   TIM10_CCMR1_Outputbits.OC1PE = mode
#define enable_TIM10_OC1_fast(mode)                                                      TIM10_CCMR1_Outputbits.OC1FE = mode
#define set_TIM10_OC1_compare_mode(value)                                                do{TIM10_CCMR1_Output &= (~(0x7 << 4));  TIM10_CCMR1_Output |= (value << 4);}while(0)
#define set_TIM10_CC1_selection(value)                                                   do{TIM10_CCMR1_Output &= (~(0x3 << 0));  TIM10_CCMR1_Output |= (value << 0);}while(0)
#define set_TIM10_IC1_input_prescalar(value)                                             do{TIM10_CCMR1_Input &= (~(0x3 << 2));  TIM10_CCMR1_Input |= (value << 2);}while(0)
#define set_TIM10_IC1_filter(value)                                                      do{TIM10_CCMR1_Input &= (~(0xF << 4));  TIM10_CCMR1_Input |= (value << 4);}while(0)

#define set_TIM10_CC1_state_and_polarity(state, polarity, complementary_output)          do{TIM10_CCERbits.CC1E = state; TIM10_CCERbits.CC1P = polarity; TIM10_CCERbits.CC1NP = complementary_output;}while(0)
