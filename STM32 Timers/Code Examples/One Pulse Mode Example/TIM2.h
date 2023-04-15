/*      Functions for TIM2      */

#define enable_TIM2(mode)                                                                RCC_APB1ENRbits.TIM2EN = mode

#define set_TIM2_clock_division(value)                                                   do{TIM2_CR1 &= (~(0x3 << 8));  TIM2_CR1 |= (value << 8);}while(0)
#define set_TIM2_auto_reload_preload_mode(mode)                                          TIM2_CR1bits.ARPE = mode
#define set_TIM2_centre_align_mode_selection(value)                                      do{TIM2_CR1 &= (~(0x3 << 5));  TIM2_CR1 |= (value << 5);}while(0)
#define set_TIM2_counting_direction(mode)                                                TIM2_CR1bits.DIR_ = mode
#define set_TIM2_one_pulse_mode(mode)                                                    TIM2_CR1bits.OPM = mode
#define set_TIM2_update_request_source(mode)                                             TIM2_CR1bits.URS = mode
#define disable_TIM2_update(mode)                                                        TIM2_CR1bits.UDIS = mode
#define enable_TIM2_counter(mode)                                                        TIM2_CR1bits.CEN = mode

#define set_TIM2_TI1_selection(value)                                                    TIM2_CR2bits.TI1S = value
#define set_TIM2_master_mode_selection(value)                                            do{TIM2_CR2 &= (~(0x7 << 4));  TIM2_CR2 |= (value << 4);}while(0)
#define set_TIM2_CC_DMA_request(value)                                                   TIM2_CR2bits.CCDS = value

#define set_TIM2_external_trigger_polarity(mode)                                         TIM2_SMCRbits.ETP = mode
#define set_TIM2_external_clock(mode)                                                    TIM2_SMCRbits.ECE = mode
#define set_TIM2_external_trigger_prescaler(value)                                       do{TIM2_SMCR &= (~(0x3 << 12));  TIM2_SMCR |= (value << 12);}while(0)
#define set_TIM2_external_trigger_filter(value)                                          do{TIM2_SMCR &= (~(0xF << 8));  TIM2_SMCR |= (value << 8);}while(0)
#define set_TIM2_master_slave_mode(mode)                                                 TIM2_SMCRbits.MSM = mode
#define set_TIM2_trigger_source(value)                                                   do{TIM2_SMCR &= (~(0x7 << 4));  TIM2_SMCR |= (value << 4);}while(0)
#define set_TIM2_slave_selection(value)                                                  do{TIM2_SMCR &= (~(0x7 << 0));  TIM2_SMCR |= (value << 0);}while(0)

#define enable_TIM2_DMA_request_trigger(mode)                                            TIM2_DIERbits.TDE = mode
#define enable_TIM2_CC4_DMA_request(mode)                                                TIM2_DIERbits.CC4DE = mode
#define enable_TIM2_CC3_DMA_request(mode)                                                TIM2_DIERbits.CC3DE = mode
#define enable_TIM2_CC2_DMA_request(mode)                                                TIM2_DIERbits.CC2DE = mode
#define enable_TIM2_CC1_DMA_request(mode)                                                TIM2_DIERbits.CC1DE = mode
#define enable_TIM2_update_DMA_request(mode)                                             TIM2_DIERbits.UDE = mode
#define enable_TIM2_trigger_interrupt(mode)                                              TIM2_DIERbits.TIE = mode
#define enable_TIM2_CC4_interrupt(mode)                                                  TIM2_DIERbits.CC4IE = mode
#define enable_TIM2_CC3_interrupt(mode)                                                  TIM2_DIERbits.CC3IE = mode
#define enable_TIM2_CC2_interrupt(mode)                                                  TIM2_DIERbits.CC2IE = mode
#define enable_TIM2_CC1_interrupt(mode)                                                  TIM2_DIERbits.CC1IE = mode
#define enable_TIM2_update_interrupt(mode)                                               TIM2_DIERbits.UIE = mode

#define enable_TIM2_OC1_clear(mode)                                                      TIM2_CCMR1_Outputbits.OC1CE = mode
#define enable_TIM2_OC2_clear(mode)                                                      TIM2_CCMR1_Outputbits.OC2CE = mode
#define enable_TIM2_OC3_clear(mode)                                                      TIM2_CCMR2_Outputbits.OC3CE = mode
#define enable_TIM2_OC4_clear(mode)                                                      TIM2_CCMR2_Outputbits.O24CE = mode

#define enable_TIM2_OC1_preload(mode)                                                    TIM2_CCMR1_Outputbits.OC1PE = mode
#define enable_TIM2_OC2_preload(mode)                                                    TIM2_CCMR1_Outputbits.OC2PE = mode
#define enable_TIM2_OC3_preload(mode)                                                    TIM2_CCMR2_Outputbits.OC3PE = mode
#define enable_TIM2_OC4_preload(mode)                                                    TIM2_CCMR2_Outputbits.OC4PE = mode

#define enable_TIM2_OC1_fast(mode)                                                       TIM2_CCMR1_Outputbits.OC1FE = mode
#define enable_TIM2_OC2_fast(mode)                                                       TIM2_CCMR1_Outputbits.OC2FE = mode
#define enable_TIM2_OC3_fast(mode)                                                       TIM2_CCMR2_Outputbits.OC3FE = mode
#define enable_TIM2_OC4_fast(mode)                                                       TIM2_CCMR2_Outputbits.OC4FE = mode

#define set_TIM2_OC1_compare_mode(value)                                                 do{TIM2_CCMR1_Output &= (~(0x7 << 4));  TIM2_CCMR1_Output |= (value << 4);}while(0)
#define set_TIM2_OC2_compare_mode(value)                                                 do{TIM2_CCMR1_Output &= (~(0x7 << 12));  TIM2_CCMR1_Output |= (value << 12);}while(0)
#define set_TIM2_OC3_compare_mode(value)                                                 do{TIM2_CCMR2_Output &= (~(0x7 << 4));  TIM2_CCMR2_Output |= (value << 4);}while(0)
#define set_TIM2_OC4_compare_mode(value)                                                 do{TIM2_CCMR2_Output &= (~(0x7 << 12));  TIM2_CCMR2_Output |= (value << 12);}while(0)

#define set_TIM2_CC1_selection(value)                                                    do{TIM2_CCMR1_Output &= (~(0x3 << 0));  TIM2_CCMR1_Output |= (value << 0);}while(0)
#define set_TIM2_CC2_selection(value)                                                    do{TIM2_CCMR1_Output &= (~(0x3 << 8));  TIM2_CCMR1_Output |= (value << 8);}while(0)
#define set_TIM2_CC3_selection(value)                                                    do{TIM2_CCMR2_Output &= (~(0x3 << 0));  TIM2_CCMR2_Output |= (value << 0);}while(0)
#define set_TIM2_CC4_selection(value)                                                    do{TIM2_CCMR2_Output &= (~(0x3 << 8));  TIM2_CCMR2_Output |= (value << 8);}while(0)

#define set_TIM2_IC1_input_prescalar(value)                                              do{TIM2_CCMR1_Input &= (~(0x3 << 2));  TIM2_CCMR1_Input |= (value << 2);}while(0)
#define set_TIM2_IC2_input_prescalar(value)                                              do{TIM2_CCMR1_Input &= (~(0x3 << 10));  TIM2_CCMR1_Input |= (value << 10);}while(0)
#define set_TIM2_IC3_input_prescalar(value)                                              do{TIM2_CCMR2_Input &= (~(0x3 << 2));  TIM2_CCMR2_Input |= (value << 2);}while(0)
#define set_TIM2_IC4_input_prescalar(value)                                              do{TIM2_CCMR2_Input &= (~(0x3 << 10));  TIM2_CCMR2_Input |= (value << 10);}while(0)

#define set_TIM2_IC1_filter(value)                                                       do{TIM2_CCMR1_Input &= (~(0xF << 4));  TIM2_CCMR1_Input |= (value << 4);}while(0)
#define set_TIM2_IC2_filter(value)                                                       do{TIM2_CCMR1_Input &= (~(0xF << 12));  TIM2_CCMR1_Input |= (value << 12);}while(0)
#define set_TIM2_IC3_filter(value)                                                       do{TIM2_CCMR2_Input &= (~(0xF << 4));  TIM2_CCMR2_Input |= (value << 4);}while(0)
#define set_TIM2_IC4_filter(value)                                                       do{TIM2_CCMR2_Input &= (~(0xF << 12));  TIM2_CCMR2_Input |= (value << 12);}while(0)

#define set_TIM2_CC1_state_and_polarity(state, polarity)                                 do{TIM2_CCERbits.CC1E = state; TIM2_CCERbits.CC1P = polarity;}while(0)
#define set_TIM2_CC2_state_and_polarity(state, polarity)                                 do{TIM2_CCERbits.CC2E = state; TIM2_CCERbits.CC2P = polarity;}while(0)
#define set_TIM2_CC3_state_and_polarity(state, polarity)                                 do{TIM2_CCERbits.CC3E = state; TIM2_CCERbits.CC3P = polarity;}while(0)
#define set_TIM2_CC4_state_and_polarity(state, polarity)                                 do{TIM2_CCERbits.CC4E = state; TIM2_CCERbits.CC4P = polarity;}while(0)

#define set_TIM2_DMA_burst_length(value)                                                 do{TIM2_DCR &= (~(0x1F << 8));  TIM2_DCR |= (value << 8);}while(0)
#define set_TIM2_DMA_base_address(value)                                                 do{TIM2_DCR &= (~(0x1F << 0));  TIM2_DCR |= (value << 0);}while(0)
