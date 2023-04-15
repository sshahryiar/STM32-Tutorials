/*      Functions for TIM1      */
                                                                                                
#define enable_TIM1(mode)                                                                RCC_APB2ENRbits.TIM1EN = mode

#define set_TIM1_clock_division(value)                                                   do{TIM1_CR1 &= (~(0x3 << 8));  TIM1_CR1 |= (value << 8);}while(0)
#define set_TIM1_auto_reload_preload_mode(mode)                                          TIM1_CR1bits.ARPE = mode
#define set_TIM1_centre_align_mode_selection(value)                                      do{TIM1_CR1 &= (~(0x3 << 5));  TIM1_CR1 |= (value << 5);}while(0)
#define set_TIM1_counting_direction(mode)                                                TIM1_CR1bits.DIR_ = mode
#define set_TIM1_one_pulse_mode(mode)                                                    TIM1_CR1bits.OPM = mode
#define set_TIM1_update_request_source(mode)                                             TIM1_CR1bits.URS = mode
#define disable_TIM1_update(mode)                                                        TIM1_CR1bits.UDIS = mode
#define enable_TIM1_counter(mode)                                                        TIM1_CR1bits.CEN = mode

#define set_TIM1_output_idle_states(value)                                               do{TIM1_CR2 &= (~(0x7F << 8));  TIM1_CR2 |= (value << 8);}while(0)
#define set_TIM1_TI1_selection(value)                                                    TIM1_CR2bits.TI1S = value
#define set_TIM1_master_mode_selection(value)                                            do{TIM1_CR2 &= (~(0x7 << 4));  TIM1_CR2 |= (value << 4);}while(0)
#define set_TIM1_CC_DMA_request(value)                                                   TIM1_CR2bits.CCDS = value
#define set_TIM1_CC_control_update_selection(mode)                                       TIM1_CR2bits.CCUS = mode
#define set_TIM1_CC_preload_control(mode)                                                TIM1_CR2bits.CCPC = mode

#define set_TIM1_external_trigger_polarity(mode)                                         TIM1_SMCRbits.ETP = mode
#define set_TIM1_external_clock(mode)                                                    TIM1_SMCRbits.ECE = mode
#define set_TIM1_external_trigger_prescaler(value)                                       do{TIM1_SMCR &= (~(0x3 << 12));  TIM1_SMCR |= (value << 12);}while(0)
#define set_TIM1_external_trigger_filter(value)                                          do{TIM1_SMCR &= (~(0xF << 8));  TIM1_SMCR |= (value << 8);}while(0)
#define set_TIM1_master_slave_mode(mode)                                                 TIM1_SMCRbits.MSM = mode
#define set_TIM1_trigger_source(value)                                                   do{TIM1_SMCR &= (~(0x7 << 4));  TIM1_SMCR |= (value << 4);}while(0)
#define set_TIM1_slave_selection(value)                                                  do{TIM1_SMCR &= (~(0x7 << 0));  TIM1_SMCR |= (value << 0);}while(0)

#define enable_TIM1_DMA_request_trigger(mode)                                            TIM1_DIERbits.TDE = mode
#define enable_TIM1_CC4_DMA_request(mode)                                                TIM1_DIERbits.CC4DE = mode
#define enable_TIM1_CC3_DMA_request(mode)                                                TIM1_DIERbits.CC3DE = mode
#define enable_TIM1_CC2_DMA_request(mode)                                                TIM1_DIERbits.CC2DE = mode
#define enable_TIM1_CC1_DMA_request(mode)                                                TIM1_DIERbits.CC1DE = mode
#define enable_TIM1_update_DMA_request(mode)                                             TIM1_DIERbits.UDE = mode
#define enable_TIM1_trigger_interrupt(mode)                                              TIM1_DIERbits.TIE = mode
#define enable_TIM1_CC4_interrupt(mode)                                                  TIM1_DIERbits.CC4IE = mode
#define enable_TIM1_CC3_interrupt(mode)                                                  TIM1_DIERbits.CC3IE = mode
#define enable_TIM1_CC2_interrupt(mode)                                                  TIM1_DIERbits.CC2IE = mode
#define enable_TIM1_CC1_interrupt(mode)                                                  TIM1_DIERbits.CC1IE = mode
#define enable_TIM1_update_interrupt(mode)                                               TIM1_DIERbits.UIE = mode

#define enable_TIM1_OC1_clear(mode)                                                      TIM1_CCMR1_Outputbits.OC1CE = mode
#define enable_TIM1_OC2_clear(mode)                                                      TIM1_CCMR1_Outputbits.OC2CE = mode
#define enable_TIM1_OC3_clear(mode)                                                      TIM1_CCMR2_Outputbits.OC3CE = mode
#define enable_TIM1_OC4_clear(mode)                                                      TIM1_CCMR2_Outputbits.O24CE = mode

#define enable_TIM1_OC1_preload(mode)                                                    TIM1_CCMR1_Outputbits.OC1PE = mode
#define enable_TIM1_OC2_preload(mode)                                                    TIM1_CCMR1_Outputbits.OC2PE = mode
#define enable_TIM1_OC3_preload(mode)                                                    TIM1_CCMR2_Outputbits.OC3PE = mode
#define enable_TIM1_OC4_preload(mode)                                                    TIM1_CCMR2_Outputbits.OC4PE = mode

#define enable_TIM1_OC1_fast(mode)                                                       TIM1_CCMR1_Outputbits.OC1FE = mode
#define enable_TIM1_OC2_fast(mode)                                                       TIM1_CCMR1_Outputbits.OC2FE = mode
#define enable_TIM1_OC3_fast(mode)                                                       TIM1_CCMR2_Outputbits.OC3FE = mode
#define enable_TIM1_OC4_fast(mode)                                                       TIM1_CCMR2_Outputbits.OC4FE = mode

#define set_TIM1_OC1_compare_mode(value)                                                 do{TIM1_CCMR1_Output &= (~(0x7 << 4));  TIM1_CCMR1_Output |= (value << 4);}while(0)
#define set_TIM1_OC2_compare_mode(value)                                                 do{TIM1_CCMR1_Output &= (~(0x7 << 12));  TIM1_CCMR1_Output |= (value << 12);}while(0)
#define set_TIM1_OC3_compare_mode(value)                                                 do{TIM1_CCMR2_Output &= (~(0x7 << 4));  TIM1_CCMR2_Output |= (value << 4);}while(0)
#define set_TIM1_OC4_compare_mode(value)                                                 do{TIM1_CCMR2_Output &= (~(0x7 << 12));  TIM1_CCMR2_Output |= (value << 12);}while(0)

#define set_TIM1_CC1_selection(value)                                                    do{TIM1_CCMR1_Output &= (~(0x3 << 0));  TIM1_CCMR1_Output |= (value << 0);}while(0)
#define set_TIM1_CC2_selection(value)                                                    do{TIM1_CCMR1_Output &= (~(0x3 << 8));  TIM1_CCMR1_Output |= (value << 8);}while(0)
#define set_TIM1_CC3_selection(value)                                                    do{TIM1_CCMR2_Output &= (~(0x3 << 0));  TIM1_CCMR2_Output |= (value << 0);}while(0)
#define set_TIM1_CC4_selection(value)                                                    do{TIM1_CCMR2_Output &= (~(0x3 << 8));  TIM1_CCMR2_Output |= (value << 8);}while(0)

#define set_TIM1_IC1_input_prescalar(value)                                              do{TIM1_CCMR1_Input &= (~(0x3 << 2));  TIM1_CCMR1_Input |= (value << 2);}while(0)
#define set_TIM1_IC2_input_prescalar(value)                                              do{TIM1_CCMR1_Input &= (~(0x3 << 10));  TIM1_CCMR1_Input |= (value << 10);}while(0)
#define set_TIM1_IC3_input_prescalar(value)                                              do{TIM1_CCMR2_Input &= (~(0x3 << 2));  TIM1_CCMR2_Input |= (value << 2);}while(0)
#define set_TIM1_IC4_input_prescalar(value)                                              do{TIM1_CCMR2_Input &= (~(0x3 << 10));  TIM1_CCMR2_Input |= (value << 10);}while(0)

#define set_TIM1_IC1_filter(value)                                                       do{TIM1_CCMR1_Input &= (~(0xF << 4));  TIM1_CCMR1_Input |= (value << 4);}while(0)
#define set_TIM1_IC2_filter(value)                                                       do{TIM1_CCMR1_Input &= (~(0xF << 12));  TIM1_CCMR1_Input |= (value << 12);}while(0)
#define set_TIM1_IC3_filter(value)                                                       do{TIM1_CCMR2_Input &= (~(0xF << 4));  TIM1_CCMR2_Input |= (value << 4);}while(0)
#define set_TIM1_IC4_filter(value)                                                       do{TIM1_CCMR2_Input &= (~(0xF << 12));  TIM1_CCMR2_Input |= (value << 12);}while(0)

#define set_TIM1_CC1_state_and_polarity(state, polarity)                                 do{TIM1_CCERbits.CC1E = state; TIM1_CCERbits.CC1P = polarity;}while(0)
#define set_TIM1_CC1_complementary_output_state_and_polarity(state, polarity)            do{TIM1_CCERbits.CC1NE = state; TIM1_CCERbits.CC1NP = polarity;}while(0)
#define set_TIM1_CC2_state_and_polarity(state, polarity)                                 do{TIM1_CCERbits.CC2E = state; TIM1_CCERbits.CC2P = polarity;}while(0)
#define set_TIM1_CC2_complementary_output_state_and_polarity(state, polarity)            do{TIM1_CCERbits.CC2NE = state; TIM1_CCERbits.CC2NP = polarity;}while(0)
#define set_TIM1_CC3_state_and_polarity(state, polarity)                                 do{TIM1_CCERbits.CC3E = state; TIM1_CCERbits.CC3P = polarity;}while(0)
#define set_TIM1_CC3_complementary_output_state_and_polarity(state, polarity)            do{TIM1_CCERbits.CC3NE = state; TIM1_CCERbits.CC3NP = polarity;}while(0)
#define set_TIM1_CC4_state_and_polarity(state, polarity)                                 do{TIM1_CCERbits.CC4E = state; TIM1_CCERbits.CC4P = polarity;}while(0)

#define enable_TIM1_main_output(mode)                                                    TIM1_BDTRbits.MOE = mode
#define enable_TIM1_automatic_output(mode)                                               TIM1_BDTRbits.AOE = mode
#define set_TIM1_break_input_polarity(mode)                                              TIM1_BDTRbits.BKP = mode
#define enable_TIM1_break(mode)                                                          TIM1_BDTRbits.BKE = mode
#define set_TIM1_off_state_selection_for_run_mode(mode)                                  TIM1_BDTRbits.OSSR = mode
#define set_TIM1_off_state_selection_for_idle_mode(mode)                                 TIM1_BDTRbits.OSSI = mode
#define configure_TIM1_lock(value)                                                       do{TIM1_BDTR &= (~(0x3 << 8));  TIM1_BDTR |= (value << 8);}while(0)
#define set_TIM1_dead_time(value)                                                        do{TIM1_BDTR &= (~(0xFF << 0));  TIM1_BDTR |= (value << 0);}while(0)

#define set_TIM1_DMA_burst_length(value)                                                 do{TIM1_DCR &= (~(0x1F << 8));  TIM1_DCR |= (value << 8);}while(0)
#define set_TIM1_DMA_base_address(value)                                                 do{TIM1_DCR &= (~(0x1F << 0));  TIM1_DCR |= (value << 0);}while(0)