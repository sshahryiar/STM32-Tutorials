stm32f10x_adc_NVIC_SetPriorityGrouping:
;core_cm3.h,1529 :: 		static __INLINE void NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
; PriorityGroup start address is: 0 (R0)
; PriorityGroup end address is: 0 (R0)
; PriorityGroup start address is: 0 (R0)
;core_cm3.h,1532 :: 		uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);                         /* only values 0..7 are used          */
AND	R4, R0, #7
; PriorityGroup end address is: 0 (R0)
;core_cm3.h,1535 :: 		reg_value &= ~(SCB_AIRCR_VECTKEY_Msk | SCB_AIRCR_PRIGROUP_Msk);             /* clear bits to change               */
MOVW	R3, #60684
MOVT	R3, #57344
LDR	R2, [R3, #0]
MOVW	R1, #63743
ANDS	R2, R1
;core_cm3.h,1537 :: 		(0x5FA << SCB_AIRCR_VECTKEY_Pos) |
MOVW	R1, #0
MOVT	R1, #1530
ORRS	R2, R1
;core_cm3.h,1538 :: 		(PriorityGroupTmp << 8));                                     /* Insert write key and priorty group */
LSLS	R1, R4, #8
ORR	R1, R2, R1, LSL #0
;core_cm3.h,1539 :: 		SCB->AIRCR =  reg_value;
STR	R1, [R3, #0]
;core_cm3.h,1540 :: 		}
L_end_NVIC_SetPriorityGrouping:
BX	LR
; end of stm32f10x_adc_NVIC_SetPriorityGrouping
stm32f10x_adc_NVIC_GetPriorityGrouping:
;core_cm3.h,1550 :: 		static __INLINE uint32_t NVIC_GetPriorityGrouping(void)
;core_cm3.h,1552 :: 		return ((SCB->AIRCR & SCB_AIRCR_PRIGROUP_Msk) >> SCB_AIRCR_PRIGROUP_Pos);   /* read priority grouping field */
MOVW	R0, #60684
MOVT	R0, #57344
LDR	R0, [R0, #0]
AND	R0, R0, #1792
LSRS	R0, R0, #8
;core_cm3.h,1553 :: 		}
L_end_NVIC_GetPriorityGrouping:
BX	LR
; end of stm32f10x_adc_NVIC_GetPriorityGrouping
stm32f10x_adc_NVIC_EnableIRQ:
;core_cm3.h,1563 :: 		static __INLINE void NVIC_EnableIRQ(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1565 :: 		NVIC->ISER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F)); /* enable interrupt */
SXTB	R1, R0
LSRS	R1, R1, #5
LSLS	R2, R1, #2
MOVW	R1, #57600
MOVT	R1, #57344
ADDS	R3, R1, R2
SXTB	R1, R0
; IRQn end address is: 0 (R0)
AND	R2, R1, #31
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R2
SXTH	R1, R1
STR	R1, [R3, #0]
;core_cm3.h,1566 :: 		}
L_end_NVIC_EnableIRQ:
BX	LR
; end of stm32f10x_adc_NVIC_EnableIRQ
stm32f10x_adc_NVIC_DisableIRQ:
;core_cm3.h,1576 :: 		static __INLINE void NVIC_DisableIRQ(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1578 :: 		NVIC->ICER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F)); /* disable interrupt */
SXTB	R1, R0
LSRS	R1, R1, #5
LSLS	R2, R1, #2
MOVW	R1, #57728
MOVT	R1, #57344
ADDS	R3, R1, R2
SXTB	R1, R0
; IRQn end address is: 0 (R0)
AND	R2, R1, #31
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R2
SXTH	R1, R1
STR	R1, [R3, #0]
;core_cm3.h,1579 :: 		}
L_end_NVIC_DisableIRQ:
BX	LR
; end of stm32f10x_adc_NVIC_DisableIRQ
stm32f10x_adc_NVIC_GetPendingIRQ:
;core_cm3.h,1590 :: 		static __INLINE uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1592 :: 		return((uint32_t) ((NVIC->ISPR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0)); /* Return 1 if pending else 0 */
SXTB	R1, R0
LSRS	R1, R1, #5
LSLS	R2, R1, #2
MOVW	R1, #57856
MOVT	R1, #57344
ADDS	R1, R1, R2
LDR	R3, [R1, #0]
SXTB	R1, R0
; IRQn end address is: 0 (R0)
AND	R2, R1, #31
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R2
SXTH	R1, R1
AND	R1, R3, R1, LSL #0
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_adc_NVIC_GetPendingIRQ0
; ?FLOC__stm32f10x_adc_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_adc_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_adc_NVIC_GetPendingIRQ1
L_stm32f10x_adc_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f10x_adc_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_adc_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
L_stm32f10x_adc_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f10x_adc_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_adc_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1593 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f10x_adc_NVIC_GetPendingIRQ
stm32f10x_adc_NVIC_SetPendingIRQ:
;core_cm3.h,1603 :: 		static __INLINE void NVIC_SetPendingIRQ(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1605 :: 		NVIC->ISPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F)); /* set interrupt pending */
SXTB	R1, R0
LSRS	R1, R1, #5
LSLS	R2, R1, #2
MOVW	R1, #57856
MOVT	R1, #57344
ADDS	R3, R1, R2
SXTB	R1, R0
; IRQn end address is: 0 (R0)
AND	R2, R1, #31
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R2
SXTH	R1, R1
STR	R1, [R3, #0]
;core_cm3.h,1606 :: 		}
L_end_NVIC_SetPendingIRQ:
BX	LR
; end of stm32f10x_adc_NVIC_SetPendingIRQ
stm32f10x_adc_NVIC_ClearPendingIRQ:
;core_cm3.h,1616 :: 		static __INLINE void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1618 :: 		NVIC->ICPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F)); /* Clear pending interrupt */
SXTB	R1, R0
LSRS	R1, R1, #5
LSLS	R2, R1, #2
MOVW	R1, #57984
MOVT	R1, #57344
ADDS	R3, R1, R2
SXTB	R1, R0
; IRQn end address is: 0 (R0)
AND	R2, R1, #31
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R2
SXTH	R1, R1
STR	R1, [R3, #0]
;core_cm3.h,1619 :: 		}
L_end_NVIC_ClearPendingIRQ:
BX	LR
; end of stm32f10x_adc_NVIC_ClearPendingIRQ
stm32f10x_adc_NVIC_GetActive:
;core_cm3.h,1630 :: 		static __INLINE uint32_t NVIC_GetActive(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1632 :: 		return((uint32_t)((NVIC->IABR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0)); /* Return 1 if active else 0 */
SXTB	R1, R0
LSRS	R1, R1, #5
LSLS	R2, R1, #2
MOVW	R1, #58112
MOVT	R1, #57344
ADDS	R1, R1, R2
LDR	R3, [R1, #0]
SXTB	R1, R0
; IRQn end address is: 0 (R0)
AND	R2, R1, #31
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R2
SXTH	R1, R1
AND	R1, R3, R1, LSL #0
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_adc_NVIC_GetActive2
; ?FLOC__stm32f10x_adc_NVIC_GetActive?T72 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_adc_NVIC_GetActive?T72 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_adc_NVIC_GetActive3
L_stm32f10x_adc_NVIC_GetActive2:
; ?FLOC__stm32f10x_adc_NVIC_GetActive?T72 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_adc_NVIC_GetActive?T72 end address is: 0 (R0)
L_stm32f10x_adc_NVIC_GetActive3:
; ?FLOC__stm32f10x_adc_NVIC_GetActive?T72 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_adc_NVIC_GetActive?T72 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1633 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f10x_adc_NVIC_GetActive
stm32f10x_adc_NVIC_SetPriority:
;core_cm3.h,1647 :: 		static __INLINE void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
; priority start address is: 4 (R1)
; IRQn start address is: 0 (R0)
; priority end address is: 4 (R1)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
; priority start address is: 4 (R1)
;core_cm3.h,1649 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f10x_adc_NVIC_SetPriority4
;core_cm3.h,1650 :: 		SCB->SHP[((uint32_t)(IRQn) & 0xF)-4] = ((priority << (8 - __NVIC_PRIO_BITS)) & 0xff); } /* set Priority for Cortex-M3 System Interrupts */
SXTB	R2, R0
; IRQn end address is: 0 (R0)
AND	R2, R2, #15
SUBS	R3, R2, #4
MOVW	R2, #60696
MOVT	R2, #57344
ADDS	R3, R2, R3
LSLS	R2, R1, #4
; priority end address is: 4 (R1)
AND	R2, R2, #255
STRB	R2, [R3, #0]
IT	AL
BAL	L_stm32f10x_adc_NVIC_SetPriority5
L_stm32f10x_adc_NVIC_SetPriority4:
;core_cm3.h,1652 :: 		NVIC->IP[(uint32_t)(IRQn)] = ((priority << (8 - __NVIC_PRIO_BITS)) & 0xff);    }        /* set Priority for device specific Interrupts  */
; priority start address is: 4 (R1)
; IRQn start address is: 0 (R0)
SXTB	R3, R0
; IRQn end address is: 0 (R0)
MOVW	R2, #58368
MOVT	R2, #57344
ADDS	R3, R2, R3
LSLS	R2, R1, #4
; priority end address is: 4 (R1)
AND	R2, R2, #255
STRB	R2, [R3, #0]
L_stm32f10x_adc_NVIC_SetPriority5:
;core_cm3.h,1653 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f10x_adc_NVIC_SetPriority
stm32f10x_adc_NVIC_GetPriority:
;core_cm3.h,1670 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1673 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f10x_adc_NVIC_GetPriority6
;core_cm3.h,1674 :: 		return((uint32_t)(SCB->SHP[((uint32_t)(IRQn) & 0xF)-4] >> (8 - __NVIC_PRIO_BITS)));  } /* get priority for Cortex-M3 system interrupts */
SXTB	R1, R0
; IRQn end address is: 0 (R0)
AND	R1, R1, #15
SUBS	R2, R1, #4
MOVW	R1, #60696
MOVT	R1, #57344
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
LSRS	R1, R1, #4
UXTB	R1, R1
MOV	R0, R1
IT	AL
BAL	L_end_NVIC_GetPriority
L_stm32f10x_adc_NVIC_GetPriority6:
;core_cm3.h,1676 :: 		return((uint32_t)(NVIC->IP[(uint32_t)(IRQn)]           >> (8 - __NVIC_PRIO_BITS)));  } /* get priority for device specific interrupts  */
; IRQn start address is: 0 (R0)
SXTB	R2, R0
; IRQn end address is: 0 (R0)
MOVW	R1, #58368
MOVT	R1, #57344
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
LSRS	R1, R1, #4
UXTB	R1, R1
MOV	R0, R1
;core_cm3.h,1677 :: 		}
L_end_NVIC_GetPriority:
BX	LR
; end of stm32f10x_adc_NVIC_GetPriority
stm32f10x_adc_NVIC_EncodePriority:
;core_cm3.h,1695 :: 		static __INLINE uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
; SubPriority start address is: 8 (R2)
; PreemptPriority start address is: 4 (R1)
; PriorityGroup start address is: 0 (R0)
; SubPriority end address is: 8 (R2)
; PreemptPriority end address is: 4 (R1)
; PriorityGroup end address is: 0 (R0)
; PriorityGroup start address is: 0 (R0)
; PreemptPriority start address is: 4 (R1)
; SubPriority start address is: 8 (R2)
;core_cm3.h,1697 :: 		uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);          /* only values 0..7 are used          */
AND	R3, R0, #7
; PriorityGroup end address is: 0 (R0)
; PriorityGroupTmp start address is: 16 (R4)
MOV	R4, R3
;core_cm3.h,1701 :: 		PreemptPriorityBits = ((7 - PriorityGroupTmp) > __NVIC_PRIO_BITS) ? __NVIC_PRIO_BITS : 7 - PriorityGroupTmp;
RSB	R3, R3, #7
CMP	R3, #4
IT	LS
BLS	L_stm32f10x_adc_NVIC_EncodePriority8
; ?FLOC__stm32f10x_adc_NVIC_EncodePriority?T112 start address is: 12 (R3)
MOVW	R3, #4
; ?FLOC__stm32f10x_adc_NVIC_EncodePriority?T112 end address is: 12 (R3)
IT	AL
BAL	L_stm32f10x_adc_NVIC_EncodePriority9
L_stm32f10x_adc_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f10x_adc_NVIC_EncodePriority?T112 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_adc_NVIC_EncodePriority?T112 end address is: 0 (R0)
MOV	R3, R0
L_stm32f10x_adc_NVIC_EncodePriority9:
; ?FLOC__stm32f10x_adc_NVIC_EncodePriority?T112 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_adc_NVIC_EncodePriority?T112 end address is: 12 (R3)
;core_cm3.h,1702 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f10x_adc_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f10x_adc_NVIC_EncodePriority?T116 start address is: 20 (R5)
MOVW	R5, #0
; ?FLOC__stm32f10x_adc_NVIC_EncodePriority?T116 end address is: 20 (R5)
IT	AL
BAL	L_stm32f10x_adc_NVIC_EncodePriority11
L_stm32f10x_adc_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f10x_adc_NVIC_EncodePriority?T116 start address is: 20 (R5)
; ?FLOC__stm32f10x_adc_NVIC_EncodePriority?T116 end address is: 20 (R5)
L_stm32f10x_adc_NVIC_EncodePriority11:
;core_cm3.h,1705 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f10x_adc_NVIC_EncodePriority?T116 start address is: 20 (R5)
MOVS	R3, #1
SXTH	R3, R3
LSLS	R3, R0
SXTH	R3, R3
; PreemptPriorityBits end address is: 0 (R0)
SUBS	R3, R3, #1
SXTH	R3, R3
AND	R3, R1, R3, LSL #0
; PreemptPriority end address is: 4 (R1)
LSL	R4, R3, R5
;core_cm3.h,1706 :: 		((SubPriority     & ((1 << (SubPriorityBits    )) - 1)))
MOVS	R3, #1
SXTH	R3, R3
LSLS	R3, R5
SXTH	R3, R3
; ?FLOC__stm32f10x_adc_NVIC_EncodePriority?T116 end address is: 20 (R5)
SUBS	R3, R3, #1
SXTH	R3, R3
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm3.h,1707 :: 		);
MOV	R0, R3
;core_cm3.h,1708 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of stm32f10x_adc_NVIC_EncodePriority
stm32f10x_adc_NVIC_DecodePriority:
;core_cm3.h,1726 :: 		static __INLINE void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* pPreemptPriority, uint32_t* pSubPriority)
; pSubPriority start address is: 12 (R3)
; pPreemptPriority start address is: 8 (R2)
; PriorityGroup start address is: 4 (R1)
; Priority start address is: 0 (R0)
; pSubPriority end address is: 12 (R3)
; pPreemptPriority end address is: 8 (R2)
; PriorityGroup end address is: 4 (R1)
; Priority end address is: 0 (R0)
; Priority start address is: 0 (R0)
; PriorityGroup start address is: 4 (R1)
; pPreemptPriority start address is: 8 (R2)
; pSubPriority start address is: 12 (R3)
;core_cm3.h,1728 :: 		uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);          /* only values 0..7 are used          */
AND	R4, R1, #7
; PriorityGroup end address is: 4 (R1)
; PriorityGroupTmp start address is: 20 (R5)
MOV	R5, R4
;core_cm3.h,1732 :: 		PreemptPriorityBits = ((7 - PriorityGroupTmp) > __NVIC_PRIO_BITS) ? __NVIC_PRIO_BITS : 7 - PriorityGroupTmp;
RSB	R4, R4, #7
CMP	R4, #4
IT	LS
BLS	L_stm32f10x_adc_NVIC_DecodePriority12
; ?FLOC__stm32f10x_adc_NVIC_DecodePriority?T130 start address is: 16 (R4)
MOVW	R4, #4
; ?FLOC__stm32f10x_adc_NVIC_DecodePriority?T130 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_adc_NVIC_DecodePriority13
L_stm32f10x_adc_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f10x_adc_NVIC_DecodePriority?T130 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_adc_NVIC_DecodePriority?T130 end address is: 4 (R1)
MOV	R4, R1
L_stm32f10x_adc_NVIC_DecodePriority13:
; ?FLOC__stm32f10x_adc_NVIC_DecodePriority?T130 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_adc_NVIC_DecodePriority?T130 end address is: 16 (R4)
;core_cm3.h,1733 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f10x_adc_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f10x_adc_NVIC_DecodePriority?T134 start address is: 16 (R4)
MOVW	R4, #0
; ?FLOC__stm32f10x_adc_NVIC_DecodePriority?T134 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_adc_NVIC_DecodePriority15
L_stm32f10x_adc_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f10x_adc_NVIC_DecodePriority?T134 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f10x_adc_NVIC_DecodePriority?T134 end address is: 20 (R5)
MOV	R4, R5
L_stm32f10x_adc_NVIC_DecodePriority15:
; ?FLOC__stm32f10x_adc_NVIC_DecodePriority?T134 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm3.h,1735 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f10x_adc_NVIC_DecodePriority?T134 end address is: 16 (R4)
MOVS	R4, #1
SXTH	R4, R4
LSLS	R4, R1
SXTH	R4, R4
; PreemptPriorityBits end address is: 4 (R1)
SUBS	R4, R4, #1
SXTH	R4, R4
AND	R4, R5, R4, LSL #0
STR	R4, [R2, #0]
; pPreemptPriority end address is: 8 (R2)
;core_cm3.h,1736 :: 		*pSubPriority     = (Priority                   ) & ((1 << (SubPriorityBits    )) - 1);
MOVS	R4, #1
SXTH	R4, R4
LSLS	R4, R6
SXTH	R4, R4
; SubPriorityBits end address is: 24 (R6)
SUBS	R4, R4, #1
SXTH	R4, R4
AND	R4, R0, R4, LSL #0
; Priority end address is: 0 (R0)
STR	R4, [R3, #0]
; pSubPriority end address is: 12 (R3)
;core_cm3.h,1737 :: 		}
L_end_NVIC_DecodePriority:
BX	LR
; end of stm32f10x_adc_NVIC_DecodePriority
stm32f10x_adc_SysTick_Config:
;core_cm3.h,1755 :: 		static __INLINE uint32_t SysTick_Config(uint32_t ticks)
; ticks start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; ticks end address is: 0 (R0)
; ticks start address is: 0 (R0)
;core_cm3.h,1757 :: 		if (ticks > SysTick_LOAD_RELOAD_Msk)  return (1);            /* Reload value impossible */
MVN	R1, #-16777216
CMP	R0, R1
IT	LS
BLS	L_stm32f10x_adc_SysTick_Config16
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f10x_adc_SysTick_Config16:
;core_cm3.h,1759 :: 		SysTick->LOAD  = (ticks & SysTick_LOAD_RELOAD_Msk) - 1;      /* set reload register */
; ticks start address is: 0 (R0)
MVN	R1, #-16777216
AND	R1, R0, R1, LSL #0
; ticks end address is: 0 (R0)
SUBS	R2, R1, #1
MOVW	R1, #57364
MOVT	R1, #57344
STR	R2, [R1, #0]
;core_cm3.h,1760 :: 		NVIC_SetPriority (SysTick_IRQn, (1<<__NVIC_PRIO_BITS) - 1);  /* set Priority for Cortex-M0 System Interrupts */
MOVW	R1, #15
MOVS	R0, #-1
SXTB	R0, R0
BL	stm32f10x_adc_NVIC_SetPriority+0
;core_cm3.h,1761 :: 		SysTick->VAL   = 0;                                          /* Load the SysTick Counter Value */
MOVW	R2, #0
MOVW	R1, #57368
MOVT	R1, #57344
STR	R2, [R1, #0]
;core_cm3.h,1764 :: 		SysTick_CTRL_ENABLE_Msk;                    /* Enable SysTick IRQ and SysTick Timer */
MOVW	R2, #7
MOVW	R1, #57360
MOVT	R1, #57344
STR	R2, [R1, #0]
;core_cm3.h,1765 :: 		return (0);                                                  /* Function successful */
MOVW	R0, #0
;core_cm3.h,1766 :: 		}
L_end_SysTick_Config:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f10x_adc_SysTick_Config
stm32f10x_adc_NVIC_SystemReset:
;core_cm3.h,1780 :: 		static __INLINE void NVIC_SystemReset(void)
;core_cm3.h,1783 :: 		(SCB->AIRCR & SCB_AIRCR_PRIGROUP_Msk) |
MOVW	R2, #60684
MOVT	R2, #57344
LDR	R0, [R2, #0]
AND	R1, R0, #1792
MOVW	R0, #0
MOVT	R0, #1530
ORRS	R0, R1
;core_cm3.h,1784 :: 		SCB_AIRCR_SYSRESETREQ_Msk);                   /* Keep priority group unchanged */
ORR	R0, R0, #4
STR	R0, [R2, #0]
;core_cm3.h,1785 :: 		asm {dsb };                                                    /* Ensure completion of memory access */
DSB	#15
;core_cm3.h,1786 :: 		while(1);                                                    /* wait until reset */
L_stm32f10x_adc_NVIC_SystemReset17:
IT	AL
BAL	L_stm32f10x_adc_NVIC_SystemReset17
;core_cm3.h,1787 :: 		}
L_end_NVIC_SystemReset:
BX	LR
; end of stm32f10x_adc_NVIC_SystemReset
stm32f10x_adc_ITM_SendChar:
;core_cm3.h,1817 :: 		static __INLINE uint32_t ITM_SendChar (uint32_t ch)
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
;core_cm3.h,1819 :: 		if ((CoreDebug->DEMCR & CoreDebug_DEMCR_TRCENA_Msk)  &&      /* Trace enabled */
MOVW	R1, #60924
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #16777216
;core_cm3.h,1820 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_adc_ITM_SendChar80
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_adc_ITM_SendChar81
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_adc_ITM_SendChar82
L_stm32f10x_adc_ITM_SendChar76:
;core_cm3.h,1823 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f10x_adc_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f10x_adc_ITM_SendChar23
IT	AL
BAL	L_stm32f10x_adc_ITM_SendChar22
L_stm32f10x_adc_ITM_SendChar23:
;core_cm3.h,1824 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm3.h,1820 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f10x_adc_ITM_SendChar79
L_stm32f10x_adc_ITM_SendChar80:
L_stm32f10x_adc_ITM_SendChar79:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_adc_ITM_SendChar78
L_stm32f10x_adc_ITM_SendChar81:
L_stm32f10x_adc_ITM_SendChar78:
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_adc_ITM_SendChar77
L_stm32f10x_adc_ITM_SendChar82:
L_stm32f10x_adc_ITM_SendChar77:
;core_cm3.h,1826 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm3.h,1827 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f10x_adc_ITM_SendChar
stm32f10x_adc_ITM_ReceiveChar:
;core_cm3.h,1839 :: 		static __INLINE int ITM_ReceiveChar (void) {
SUB	SP, SP, #4
;core_cm3.h,1840 :: 		int ch = -1;                               /* no character available */
MOV	R0, #-1
STR	R0, [SP, #0]
;core_cm3.h,1842 :: 		if (ITM_RxBuffer != ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	EQ
BEQ	L_stm32f10x_adc_ITM_ReceiveChar24
;core_cm3.h,1843 :: 		ch = ITM_RxBuffer;
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R0, [R0, #0]
STR	R0, [SP, #0]
;core_cm3.h,1844 :: 		ITM_RxBuffer = ITM_RXBUFFER_EMPTY;       /* ready for next character */
MOVW	R1, #23205
MOVT	R1, #23205
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
STR	R1, [R0, #0]
;core_cm3.h,1845 :: 		}
L_stm32f10x_adc_ITM_ReceiveChar24:
;core_cm3.h,1847 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm3.h,1848 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f10x_adc_ITM_ReceiveChar
stm32f10x_adc_ITM_CheckChar:
;core_cm3.h,1859 :: 		static __INLINE int ITM_CheckChar (void) {
;core_cm3.h,1861 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f10x_adc_ITM_CheckChar25
;core_cm3.h,1862 :: 		return (0);                                 /* no character available */
MOVW	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm3.h,1863 :: 		} else {
L_stm32f10x_adc_ITM_CheckChar25:
;core_cm3.h,1864 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm3.h,1866 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f10x_adc_ITM_CheckChar
_ADC_DeInit:
;stm32f10x_adc.c,180 :: 		void ADC_DeInit(ADC_TypeDef* ADCx)
; ADCx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
;stm32f10x_adc.c,185 :: 		if (ADCx == ADC1)
MOVW	R1, #9216
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_ADC_DeInit27
; ADCx end address is: 0 (R0)
;stm32f10x_adc.c,188 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_ADC1, ENABLE);
MOVS	R1, #1
MOV	R0, #512
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_adc.c,190 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_ADC1, DISABLE);
MOVS	R1, #0
MOV	R0, #512
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_adc.c,191 :: 		}
IT	AL
BAL	L_ADC_DeInit28
L_ADC_DeInit27:
;stm32f10x_adc.c,192 :: 		else if (ADCx == ADC2)
; ADCx start address is: 0 (R0)
MOVW	R1, #10240
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_ADC_DeInit29
; ADCx end address is: 0 (R0)
;stm32f10x_adc.c,195 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_ADC2, ENABLE);
MOVS	R1, #1
MOV	R0, #1024
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_adc.c,197 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_ADC2, DISABLE);
MOVS	R1, #0
MOV	R0, #1024
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_adc.c,198 :: 		}
IT	AL
BAL	L_ADC_DeInit30
L_ADC_DeInit29:
;stm32f10x_adc.c,201 :: 		if (ADCx == ADC3)
; ADCx start address is: 0 (R0)
MOVW	R1, #15360
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_ADC_DeInit31
; ADCx end address is: 0 (R0)
;stm32f10x_adc.c,204 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_ADC3, ENABLE);
MOVS	R1, #1
MOV	R0, #32768
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_adc.c,206 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_ADC3, DISABLE);
MOVS	R1, #0
MOV	R0, #32768
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_adc.c,207 :: 		}
L_ADC_DeInit31:
;stm32f10x_adc.c,208 :: 		}
L_ADC_DeInit30:
L_ADC_DeInit28:
;stm32f10x_adc.c,209 :: 		}
L_end_ADC_DeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ADC_DeInit
_ADC_Init:
;stm32f10x_adc.c,219 :: 		void ADC_Init(ADC_TypeDef* ADCx, ADC_InitTypeDef* ADC_InitStruct)
; ADC_InitStruct start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; ADC_InitStruct end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_InitStruct start address is: 4 (R1)
;stm32f10x_adc.c,221 :: 		uint32_t tmpreg1 = 0;
;stm32f10x_adc.c,222 :: 		uint8_t tmpreg2 = 0;
; tmpreg2 start address is: 24 (R6)
MOVS	R6, #0
;stm32f10x_adc.c,234 :: 		tmpreg1 = ADCx->CR1;
ADDS	R5, R0, #4
LDR	R3, [R5, #0]
;stm32f10x_adc.c,236 :: 		tmpreg1 &= CR1_CLEAR_Mask;
MOVW	R2, #65279
MOVT	R2, #65520
AND	R4, R3, R2, LSL #0
;stm32f10x_adc.c,240 :: 		tmpreg1 |= (uint32_t)(ADC_InitStruct->ADC_Mode | ((uint32_t)ADC_InitStruct->ADC_ScanConvMode << 8));
LDR	R3, [R1, #0]
ADDS	R2, R1, #4
LDRB	R2, [R2, #0]
LSLS	R2, R2, #8
ORR	R2, R3, R2, LSL #0
ORR	R2, R4, R2, LSL #0
;stm32f10x_adc.c,242 :: 		ADCx->CR1 = tmpreg1;
STR	R2, [R5, #0]
;stm32f10x_adc.c,246 :: 		tmpreg1 = ADCx->CR2;
ADDW	R5, R0, #8
LDR	R3, [R5, #0]
;stm32f10x_adc.c,248 :: 		tmpreg1 &= CR2_CLEAR_Mask;
MOVW	R2, #63485
MOVT	R2, #65521
AND	R4, R3, R2, LSL #0
;stm32f10x_adc.c,253 :: 		tmpreg1 |= (uint32_t)(ADC_InitStruct->ADC_DataAlign | ADC_InitStruct->ADC_ExternalTrigConv |
ADDW	R2, R1, #12
LDR	R3, [R2, #0]
ADDW	R2, R1, #8
LDR	R2, [R2, #0]
ORRS	R3, R2
;stm32f10x_adc.c,254 :: 		((uint32_t)ADC_InitStruct->ADC_ContinuousConvMode << 1));
ADDS	R2, R1, #5
LDRB	R2, [R2, #0]
LSLS	R2, R2, #1
ORR	R2, R3, R2, LSL #0
ORR	R2, R4, R2, LSL #0
;stm32f10x_adc.c,256 :: 		ADCx->CR2 = tmpreg1;
STR	R2, [R5, #0]
;stm32f10x_adc.c,260 :: 		tmpreg1 = ADCx->SQR1;
ADDW	R4, R0, #44
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
;stm32f10x_adc.c,262 :: 		tmpreg1 &= SQR1_CLEAR_Mask;
MVN	R2, #15728640
ANDS	R3, R2
;stm32f10x_adc.c,265 :: 		tmpreg2 |= (uint8_t) (ADC_InitStruct->ADC_NbrOfChannel - (uint8_t)1);
ADDW	R2, R1, #16
; ADC_InitStruct end address is: 4 (R1)
LDRB	R2, [R2, #0]
SUBS	R2, R2, #1
UXTB	R2, R2
ORR	R2, R6, R2, LSL #0
UXTB	R2, R2
; tmpreg2 end address is: 24 (R6)
;stm32f10x_adc.c,266 :: 		tmpreg1 |= (uint32_t)tmpreg2 << 20;
LSLS	R2, R2, #20
ORR	R2, R3, R2, LSL #0
;stm32f10x_adc.c,268 :: 		ADCx->SQR1 = tmpreg1;
STR	R2, [R4, #0]
;stm32f10x_adc.c,269 :: 		}
L_end_ADC_Init:
BX	LR
; end of _ADC_Init
_ADC_StructInit:
;stm32f10x_adc.c,276 :: 		void ADC_StructInit(ADC_InitTypeDef* ADC_InitStruct)
; ADC_InitStruct start address is: 0 (R0)
; ADC_InitStruct end address is: 0 (R0)
; ADC_InitStruct start address is: 0 (R0)
;stm32f10x_adc.c,280 :: 		ADC_InitStruct->ADC_Mode = ADC_Mode_Independent;
MOV	R1, #0
STR	R1, [R0, #0]
;stm32f10x_adc.c,282 :: 		ADC_InitStruct->ADC_ScanConvMode = DISABLE;
ADDS	R2, R0, #4
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f10x_adc.c,284 :: 		ADC_InitStruct->ADC_ContinuousConvMode = DISABLE;
ADDS	R2, R0, #5
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f10x_adc.c,286 :: 		ADC_InitStruct->ADC_ExternalTrigConv = ADC_ExternalTrigConv_T1_CC1;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_adc.c,288 :: 		ADC_InitStruct->ADC_DataAlign = ADC_DataAlign_Right;
ADDW	R2, R0, #12
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_adc.c,290 :: 		ADC_InitStruct->ADC_NbrOfChannel = 1;
ADDW	R2, R0, #16
; ADC_InitStruct end address is: 0 (R0)
MOVS	R1, #1
STRB	R1, [R2, #0]
;stm32f10x_adc.c,291 :: 		}
L_end_ADC_StructInit:
BX	LR
; end of _ADC_StructInit
_ADC_Cmd:
;stm32f10x_adc.c,300 :: 		void ADC_Cmd(ADC_TypeDef* ADCx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_adc.c,305 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_ADC_Cmd32
; NewState end address is: 4 (R1)
;stm32f10x_adc.c,308 :: 		ADCx->CR2 |= CR2_ADON_Set;
ADDW	R3, R0, #8
; ADCx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #1
STR	R2, [R3, #0]
;stm32f10x_adc.c,309 :: 		}
IT	AL
BAL	L_ADC_Cmd33
L_ADC_Cmd32:
;stm32f10x_adc.c,313 :: 		ADCx->CR2 &= CR2_ADON_Reset;
; ADCx start address is: 0 (R0)
ADDW	R4, R0, #8
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
MVN	R2, #1
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_adc.c,314 :: 		}
L_ADC_Cmd33:
;stm32f10x_adc.c,315 :: 		}
L_end_ADC_Cmd:
BX	LR
; end of _ADC_Cmd
_ADC_DMACmd:
;stm32f10x_adc.c,325 :: 		void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_adc.c,330 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_ADC_DMACmd34
; NewState end address is: 4 (R1)
;stm32f10x_adc.c,333 :: 		ADCx->CR2 |= CR2_DMA_Set;
ADDW	R3, R0, #8
; ADCx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #256
STR	R2, [R3, #0]
;stm32f10x_adc.c,334 :: 		}
IT	AL
BAL	L_ADC_DMACmd35
L_ADC_DMACmd34:
;stm32f10x_adc.c,338 :: 		ADCx->CR2 &= CR2_DMA_Reset;
; ADCx start address is: 0 (R0)
ADDW	R4, R0, #8
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
MVN	R2, #256
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_adc.c,339 :: 		}
L_ADC_DMACmd35:
;stm32f10x_adc.c,340 :: 		}
L_end_ADC_DMACmd:
BX	LR
; end of _ADC_DMACmd
_ADC_ITConfig:
;stm32f10x_adc.c,354 :: 		void ADC_ITConfig(ADC_TypeDef* ADCx, uint16_t ADC_IT, FunctionalState NewState)
; NewState start address is: 8 (R2)
; ADC_IT start address is: 4 (R1)
; ADCx start address is: 0 (R0)
UXTB	R3, R2
UXTH	R2, R1
MOV	R1, R0
; NewState end address is: 8 (R2)
; ADC_IT end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 4 (R1)
; ADC_IT start address is: 8 (R2)
; NewState start address is: 12 (R3)
;stm32f10x_adc.c,356 :: 		uint8_t itmask = 0;
;stm32f10x_adc.c,362 :: 		itmask = (uint8_t)ADC_IT;
; itmask start address is: 0 (R0)
UXTB	R0, R2
; ADC_IT end address is: 8 (R2)
;stm32f10x_adc.c,363 :: 		if (NewState != DISABLE)
CMP	R3, #0
IT	EQ
BEQ	L_ADC_ITConfig36
; NewState end address is: 12 (R3)
;stm32f10x_adc.c,366 :: 		ADCx->CR1 |= itmask;
ADDS	R4, R1, #4
; ADCx end address is: 4 (R1)
LDR	R3, [R4, #0]
ORRS	R3, R0
; itmask end address is: 0 (R0)
STR	R3, [R4, #0]
;stm32f10x_adc.c,367 :: 		}
IT	AL
BAL	L_ADC_ITConfig37
L_ADC_ITConfig36:
;stm32f10x_adc.c,371 :: 		ADCx->CR1 &= (~(uint32_t)itmask);
; itmask start address is: 0 (R0)
; ADCx start address is: 4 (R1)
ADDS	R5, R1, #4
; ADCx end address is: 4 (R1)
UXTB	R3, R0
; itmask end address is: 0 (R0)
MVN	R4, R3
LDR	R3, [R5, #0]
ANDS	R3, R4
STR	R3, [R5, #0]
;stm32f10x_adc.c,372 :: 		}
L_ADC_ITConfig37:
;stm32f10x_adc.c,373 :: 		}
L_end_ADC_ITConfig:
BX	LR
; end of _ADC_ITConfig
_ADC_ResetCalibration:
;stm32f10x_adc.c,380 :: 		void ADC_ResetCalibration(ADC_TypeDef* ADCx)
; ADCx start address is: 0 (R0)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
;stm32f10x_adc.c,385 :: 		ADCx->CR2 |= CR2_RSTCAL_Set;
ADDW	R2, R0, #8
; ADCx end address is: 0 (R0)
LDR	R1, [R2, #0]
ORR	R1, R1, #8
STR	R1, [R2, #0]
;stm32f10x_adc.c,386 :: 		}
L_end_ADC_ResetCalibration:
BX	LR
; end of _ADC_ResetCalibration
_ADC_GetResetCalibrationStatus:
;stm32f10x_adc.c,393 :: 		FlagStatus ADC_GetResetCalibrationStatus(ADC_TypeDef* ADCx)
; ADCx start address is: 0 (R0)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
;stm32f10x_adc.c,395 :: 		FlagStatus bitstatus = RESET;
;stm32f10x_adc.c,399 :: 		if ((ADCx->CR2 & CR2_RSTCAL_Set) != (uint32_t)RESET)
ADDW	R1, R0, #8
; ADCx end address is: 0 (R0)
LDR	R1, [R1, #0]
AND	R1, R1, #8
CMP	R1, #0
IT	EQ
BEQ	L_ADC_GetResetCalibrationStatus38
;stm32f10x_adc.c,402 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_adc.c,403 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_ADC_GetResetCalibrationStatus39
L_ADC_GetResetCalibrationStatus38:
;stm32f10x_adc.c,407 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_adc.c,408 :: 		}
L_ADC_GetResetCalibrationStatus39:
;stm32f10x_adc.c,410 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_adc.c,411 :: 		}
L_end_ADC_GetResetCalibrationStatus:
BX	LR
; end of _ADC_GetResetCalibrationStatus
_ADC_StartCalibration:
;stm32f10x_adc.c,418 :: 		void ADC_StartCalibration(ADC_TypeDef* ADCx)
; ADCx start address is: 0 (R0)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
;stm32f10x_adc.c,423 :: 		ADCx->CR2 |= CR2_CAL_Set;
ADDW	R2, R0, #8
; ADCx end address is: 0 (R0)
LDR	R1, [R2, #0]
ORR	R1, R1, #4
STR	R1, [R2, #0]
;stm32f10x_adc.c,424 :: 		}
L_end_ADC_StartCalibration:
BX	LR
; end of _ADC_StartCalibration
_ADC_GetCalibrationStatus:
;stm32f10x_adc.c,431 :: 		FlagStatus ADC_GetCalibrationStatus(ADC_TypeDef* ADCx)
; ADCx start address is: 0 (R0)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
;stm32f10x_adc.c,433 :: 		FlagStatus bitstatus = RESET;
;stm32f10x_adc.c,437 :: 		if ((ADCx->CR2 & CR2_CAL_Set) != (uint32_t)RESET)
ADDW	R1, R0, #8
; ADCx end address is: 0 (R0)
LDR	R1, [R1, #0]
AND	R1, R1, #4
CMP	R1, #0
IT	EQ
BEQ	L_ADC_GetCalibrationStatus40
;stm32f10x_adc.c,440 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_adc.c,441 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_ADC_GetCalibrationStatus41
L_ADC_GetCalibrationStatus40:
;stm32f10x_adc.c,445 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_adc.c,446 :: 		}
L_ADC_GetCalibrationStatus41:
;stm32f10x_adc.c,448 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_adc.c,449 :: 		}
L_end_ADC_GetCalibrationStatus:
BX	LR
; end of _ADC_GetCalibrationStatus
_ADC_SoftwareStartConvCmd:
;stm32f10x_adc.c,458 :: 		void ADC_SoftwareStartConvCmd(ADC_TypeDef* ADCx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_adc.c,463 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_ADC_SoftwareStartConvCmd42
; NewState end address is: 4 (R1)
;stm32f10x_adc.c,467 :: 		ADCx->CR2 |= CR2_EXTTRIG_SWSTART_Set;
ADDW	R3, R0, #8
; ADCx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #5242880
STR	R2, [R3, #0]
;stm32f10x_adc.c,468 :: 		}
IT	AL
BAL	L_ADC_SoftwareStartConvCmd43
L_ADC_SoftwareStartConvCmd42:
;stm32f10x_adc.c,473 :: 		ADCx->CR2 &= CR2_EXTTRIG_SWSTART_Reset;
; ADCx start address is: 0 (R0)
ADDW	R4, R0, #8
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
MVN	R2, #5242880
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_adc.c,474 :: 		}
L_ADC_SoftwareStartConvCmd43:
;stm32f10x_adc.c,475 :: 		}
L_end_ADC_SoftwareStartConvCmd:
BX	LR
; end of _ADC_SoftwareStartConvCmd
_ADC_GetSoftwareStartConvStatus:
;stm32f10x_adc.c,482 :: 		FlagStatus ADC_GetSoftwareStartConvStatus(ADC_TypeDef* ADCx)
; ADCx start address is: 0 (R0)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
;stm32f10x_adc.c,484 :: 		FlagStatus bitstatus = RESET;
;stm32f10x_adc.c,488 :: 		if ((ADCx->CR2 & CR2_SWSTART_Set) != (uint32_t)RESET)
ADDW	R1, R0, #8
; ADCx end address is: 0 (R0)
LDR	R1, [R1, #0]
AND	R1, R1, #4194304
CMP	R1, #0
IT	EQ
BEQ	L_ADC_GetSoftwareStartConvStatus44
;stm32f10x_adc.c,491 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_adc.c,492 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_ADC_GetSoftwareStartConvStatus45
L_ADC_GetSoftwareStartConvStatus44:
;stm32f10x_adc.c,496 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_adc.c,497 :: 		}
L_ADC_GetSoftwareStartConvStatus45:
;stm32f10x_adc.c,499 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_adc.c,500 :: 		}
L_end_ADC_GetSoftwareStartConvStatus:
BX	LR
; end of _ADC_GetSoftwareStartConvStatus
_ADC_DiscModeChannelCountConfig:
;stm32f10x_adc.c,510 :: 		void ADC_DiscModeChannelCountConfig(ADC_TypeDef* ADCx, uint8_t Number)
; Number start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; Number end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; Number start address is: 4 (R1)
;stm32f10x_adc.c,512 :: 		uint32_t tmpreg1 = 0;
;stm32f10x_adc.c,513 :: 		uint32_t tmpreg2 = 0;
;stm32f10x_adc.c,518 :: 		tmpreg1 = ADCx->CR1;
ADDS	R4, R0, #4
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
;stm32f10x_adc.c,520 :: 		tmpreg1 &= CR1_DISCNUM_Reset;
MVN	R2, #57344
ANDS	R3, R2
;stm32f10x_adc.c,522 :: 		tmpreg2 = Number - 1;
SUBS	R2, R1, #1
SXTH	R2, R2
; Number end address is: 4 (R1)
; tmpreg2 start address is: 0 (R0)
SXTH	R0, R2
;stm32f10x_adc.c,523 :: 		tmpreg1 |= tmpreg2 << 13;
LSLS	R2, R0, #13
; tmpreg2 end address is: 0 (R0)
ORR	R2, R3, R2, LSL #0
;stm32f10x_adc.c,525 :: 		ADCx->CR1 = tmpreg1;
STR	R2, [R4, #0]
;stm32f10x_adc.c,526 :: 		}
L_end_ADC_DiscModeChannelCountConfig:
BX	LR
; end of _ADC_DiscModeChannelCountConfig
_ADC_DiscModeCmd:
;stm32f10x_adc.c,537 :: 		void ADC_DiscModeCmd(ADC_TypeDef* ADCx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_adc.c,542 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_ADC_DiscModeCmd46
; NewState end address is: 4 (R1)
;stm32f10x_adc.c,545 :: 		ADCx->CR1 |= CR1_DISCEN_Set;
ADDS	R3, R0, #4
; ADCx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #2048
STR	R2, [R3, #0]
;stm32f10x_adc.c,546 :: 		}
IT	AL
BAL	L_ADC_DiscModeCmd47
L_ADC_DiscModeCmd46:
;stm32f10x_adc.c,550 :: 		ADCx->CR1 &= CR1_DISCEN_Reset;
; ADCx start address is: 0 (R0)
ADDS	R4, R0, #4
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
MVN	R2, #2048
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_adc.c,551 :: 		}
L_ADC_DiscModeCmd47:
;stm32f10x_adc.c,552 :: 		}
L_end_ADC_DiscModeCmd:
BX	LR
; end of _ADC_DiscModeCmd
_ADC_RegularChannelConfig:
;stm32f10x_adc.c,591 :: 		void ADC_RegularChannelConfig(ADC_TypeDef* ADCx, uint8_t ADC_Channel, uint8_t Rank, uint8_t ADC_SampleTime)
; ADC_SampleTime start address is: 12 (R3)
; Rank start address is: 8 (R2)
; ADC_Channel start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; ADC_SampleTime end address is: 12 (R3)
; Rank end address is: 8 (R2)
; ADC_Channel end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_Channel start address is: 4 (R1)
; Rank start address is: 8 (R2)
; ADC_SampleTime start address is: 12 (R3)
;stm32f10x_adc.c,593 :: 		uint32_t tmpreg1 = 0, tmpreg2 = 0;
;stm32f10x_adc.c,600 :: 		if (ADC_Channel > ADC_Channel_9)
CMP	R1, #9
IT	LS
BLS	L_ADC_RegularChannelConfig48
;stm32f10x_adc.c,603 :: 		tmpreg1 = ADCx->SMPR1;
ADDW	R7, R0, #12
LDR	R8, [R7, #0]
; tmpreg1 start address is: 32 (R8)
;stm32f10x_adc.c,605 :: 		tmpreg2 = SMPR1_SMP_Set << (3 * (ADC_Channel - 10));
SUBW	R5, R1, #10
SXTH	R5, R5
MOVW	R4, #3
SXTH	R4, R4
MUL	R6, R4, R5
SXTH	R6, R6
MOV	R4, #7
LSLS	R4, R6
;stm32f10x_adc.c,607 :: 		tmpreg1 &= ~tmpreg2;
MVN	R4, R4
AND	R5, R8, R4, LSL #0
; tmpreg1 end address is: 32 (R8)
;stm32f10x_adc.c,609 :: 		tmpreg2 = (uint32_t)ADC_SampleTime << (3 * (ADC_Channel - 10));
UXTB	R4, R3
; ADC_SampleTime end address is: 12 (R3)
LSLS	R4, R6
;stm32f10x_adc.c,611 :: 		tmpreg1 |= tmpreg2;
ORR	R4, R5, R4, LSL #0
;stm32f10x_adc.c,613 :: 		ADCx->SMPR1 = tmpreg1;
STR	R4, [R7, #0]
;stm32f10x_adc.c,614 :: 		}
IT	AL
BAL	L_ADC_RegularChannelConfig49
L_ADC_RegularChannelConfig48:
;stm32f10x_adc.c,618 :: 		tmpreg1 = ADCx->SMPR2;
; ADC_SampleTime start address is: 12 (R3)
ADDW	R7, R0, #16
LDR	R4, [R7, #0]
; tmpreg1 start address is: 32 (R8)
MOV	R8, R4
;stm32f10x_adc.c,620 :: 		tmpreg2 = SMPR2_SMP_Set << (3 * ADC_Channel);
MOVW	R4, #3
SXTH	R4, R4
MUL	R6, R4, R1
SXTH	R6, R6
MOV	R4, #7
LSLS	R4, R6
;stm32f10x_adc.c,622 :: 		tmpreg1 &= ~tmpreg2;
MVN	R4, R4
AND	R5, R8, R4, LSL #0
; tmpreg1 end address is: 32 (R8)
;stm32f10x_adc.c,624 :: 		tmpreg2 = (uint32_t)ADC_SampleTime << (3 * ADC_Channel);
UXTB	R4, R3
; ADC_SampleTime end address is: 12 (R3)
LSLS	R4, R6
;stm32f10x_adc.c,626 :: 		tmpreg1 |= tmpreg2;
ORR	R4, R5, R4, LSL #0
;stm32f10x_adc.c,628 :: 		ADCx->SMPR2 = tmpreg1;
STR	R4, [R7, #0]
;stm32f10x_adc.c,629 :: 		}
L_ADC_RegularChannelConfig49:
;stm32f10x_adc.c,631 :: 		if (Rank < 7)
CMP	R2, #7
IT	GE
BGE	L_ADC_RegularChannelConfig50
;stm32f10x_adc.c,634 :: 		tmpreg1 = ADCx->SQR3;
ADDW	R7, R0, #52
; ADCx end address is: 0 (R0)
LDR	R0, [R7, #0]
; tmpreg1 start address is: 0 (R0)
;stm32f10x_adc.c,636 :: 		tmpreg2 = SQR3_SQ_Set << (5 * (Rank - 1));
SUBS	R5, R2, #1
SXTH	R5, R5
; Rank end address is: 8 (R2)
MOVW	R4, #5
SXTH	R4, R4
MUL	R6, R4, R5
SXTH	R6, R6
MOV	R4, #31
LSLS	R4, R6
;stm32f10x_adc.c,638 :: 		tmpreg1 &= ~tmpreg2;
MVN	R4, R4
AND	R5, R0, R4, LSL #0
; tmpreg1 end address is: 0 (R0)
;stm32f10x_adc.c,640 :: 		tmpreg2 = (uint32_t)ADC_Channel << (5 * (Rank - 1));
UXTB	R4, R1
; ADC_Channel end address is: 4 (R1)
LSLS	R4, R6
;stm32f10x_adc.c,642 :: 		tmpreg1 |= tmpreg2;
ORR	R4, R5, R4, LSL #0
;stm32f10x_adc.c,644 :: 		ADCx->SQR3 = tmpreg1;
STR	R4, [R7, #0]
;stm32f10x_adc.c,645 :: 		}
IT	AL
BAL	L_ADC_RegularChannelConfig51
L_ADC_RegularChannelConfig50:
;stm32f10x_adc.c,647 :: 		else if (Rank < 13)
; Rank start address is: 8 (R2)
; ADC_Channel start address is: 4 (R1)
; ADCx start address is: 0 (R0)
CMP	R2, #13
IT	GE
BGE	L_ADC_RegularChannelConfig52
;stm32f10x_adc.c,650 :: 		tmpreg1 = ADCx->SQR2;
ADDW	R7, R0, #48
; ADCx end address is: 0 (R0)
LDR	R0, [R7, #0]
; tmpreg1 start address is: 0 (R0)
;stm32f10x_adc.c,652 :: 		tmpreg2 = SQR2_SQ_Set << (5 * (Rank - 7));
SUBS	R5, R2, #7
SXTH	R5, R5
; Rank end address is: 8 (R2)
MOVW	R4, #5
SXTH	R4, R4
MUL	R6, R4, R5
SXTH	R6, R6
MOV	R4, #31
LSLS	R4, R6
;stm32f10x_adc.c,654 :: 		tmpreg1 &= ~tmpreg2;
MVN	R4, R4
AND	R5, R0, R4, LSL #0
; tmpreg1 end address is: 0 (R0)
;stm32f10x_adc.c,656 :: 		tmpreg2 = (uint32_t)ADC_Channel << (5 * (Rank - 7));
UXTB	R4, R1
; ADC_Channel end address is: 4 (R1)
LSLS	R4, R6
;stm32f10x_adc.c,658 :: 		tmpreg1 |= tmpreg2;
ORR	R4, R5, R4, LSL #0
;stm32f10x_adc.c,660 :: 		ADCx->SQR2 = tmpreg1;
STR	R4, [R7, #0]
;stm32f10x_adc.c,661 :: 		}
IT	AL
BAL	L_ADC_RegularChannelConfig53
L_ADC_RegularChannelConfig52:
;stm32f10x_adc.c,666 :: 		tmpreg1 = ADCx->SQR1;
; Rank start address is: 8 (R2)
; ADC_Channel start address is: 4 (R1)
; ADCx start address is: 0 (R0)
ADDW	R7, R0, #44
; ADCx end address is: 0 (R0)
LDR	R4, [R7, #0]
; tmpreg1 start address is: 0 (R0)
MOV	R0, R4
;stm32f10x_adc.c,668 :: 		tmpreg2 = SQR1_SQ_Set << (5 * (Rank - 13));
SUBW	R5, R2, #13
SXTH	R5, R5
; Rank end address is: 8 (R2)
MOVW	R4, #5
SXTH	R4, R4
MUL	R6, R4, R5
SXTH	R6, R6
MOV	R4, #31
LSLS	R4, R6
;stm32f10x_adc.c,670 :: 		tmpreg1 &= ~tmpreg2;
MVN	R4, R4
AND	R5, R0, R4, LSL #0
; tmpreg1 end address is: 0 (R0)
;stm32f10x_adc.c,672 :: 		tmpreg2 = (uint32_t)ADC_Channel << (5 * (Rank - 13));
UXTB	R4, R1
; ADC_Channel end address is: 4 (R1)
LSLS	R4, R6
;stm32f10x_adc.c,674 :: 		tmpreg1 |= tmpreg2;
ORR	R4, R5, R4, LSL #0
;stm32f10x_adc.c,676 :: 		ADCx->SQR1 = tmpreg1;
STR	R4, [R7, #0]
;stm32f10x_adc.c,677 :: 		}
L_ADC_RegularChannelConfig53:
L_ADC_RegularChannelConfig51:
;stm32f10x_adc.c,678 :: 		}
L_end_ADC_RegularChannelConfig:
BX	LR
; end of _ADC_RegularChannelConfig
_ADC_ExternalTrigConvCmd:
;stm32f10x_adc.c,687 :: 		void ADC_ExternalTrigConvCmd(ADC_TypeDef* ADCx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_adc.c,692 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_ADC_ExternalTrigConvCmd54
; NewState end address is: 4 (R1)
;stm32f10x_adc.c,695 :: 		ADCx->CR2 |= CR2_EXTTRIG_Set;
ADDW	R3, R0, #8
; ADCx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #1048576
STR	R2, [R3, #0]
;stm32f10x_adc.c,696 :: 		}
IT	AL
BAL	L_ADC_ExternalTrigConvCmd55
L_ADC_ExternalTrigConvCmd54:
;stm32f10x_adc.c,700 :: 		ADCx->CR2 &= CR2_EXTTRIG_Reset;
; ADCx start address is: 0 (R0)
ADDW	R4, R0, #8
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
MVN	R2, #1048576
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_adc.c,701 :: 		}
L_ADC_ExternalTrigConvCmd55:
;stm32f10x_adc.c,702 :: 		}
L_end_ADC_ExternalTrigConvCmd:
BX	LR
; end of _ADC_ExternalTrigConvCmd
_ADC_GetConversionValue:
;stm32f10x_adc.c,709 :: 		uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
; ADCx start address is: 0 (R0)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
;stm32f10x_adc.c,714 :: 		return (uint16_t) ADCx->DR;
ADDW	R1, R0, #76
; ADCx end address is: 0 (R0)
LDR	R1, [R1, #0]
UXTH	R0, R1
;stm32f10x_adc.c,715 :: 		}
L_end_ADC_GetConversionValue:
BX	LR
; end of _ADC_GetConversionValue
_ADC_GetDualModeConversionValue:
;stm32f10x_adc.c,721 :: 		uint32_t ADC_GetDualModeConversionValue(void)
;stm32f10x_adc.c,724 :: 		return (*(__IO uint32_t *) DR_ADDRESS);
MOVW	R0, 1073816652
MOVT	R0, 16385
LDR	R0, [R0, #0]
;stm32f10x_adc.c,725 :: 		}
L_end_ADC_GetDualModeConversionValue:
BX	LR
; end of _ADC_GetDualModeConversionValue
_ADC_AutoInjectedConvCmd:
;stm32f10x_adc.c,735 :: 		void ADC_AutoInjectedConvCmd(ADC_TypeDef* ADCx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_adc.c,740 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_ADC_AutoInjectedConvCmd56
; NewState end address is: 4 (R1)
;stm32f10x_adc.c,743 :: 		ADCx->CR1 |= CR1_JAUTO_Set;
ADDS	R3, R0, #4
; ADCx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #1024
STR	R2, [R3, #0]
;stm32f10x_adc.c,744 :: 		}
IT	AL
BAL	L_ADC_AutoInjectedConvCmd57
L_ADC_AutoInjectedConvCmd56:
;stm32f10x_adc.c,748 :: 		ADCx->CR1 &= CR1_JAUTO_Reset;
; ADCx start address is: 0 (R0)
ADDS	R4, R0, #4
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
MVN	R2, #1024
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_adc.c,749 :: 		}
L_ADC_AutoInjectedConvCmd57:
;stm32f10x_adc.c,750 :: 		}
L_end_ADC_AutoInjectedConvCmd:
BX	LR
; end of _ADC_AutoInjectedConvCmd
_ADC_InjectedDiscModeCmd:
;stm32f10x_adc.c,761 :: 		void ADC_InjectedDiscModeCmd(ADC_TypeDef* ADCx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_adc.c,766 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_ADC_InjectedDiscModeCmd58
; NewState end address is: 4 (R1)
;stm32f10x_adc.c,769 :: 		ADCx->CR1 |= CR1_JDISCEN_Set;
ADDS	R3, R0, #4
; ADCx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #4096
STR	R2, [R3, #0]
;stm32f10x_adc.c,770 :: 		}
IT	AL
BAL	L_ADC_InjectedDiscModeCmd59
L_ADC_InjectedDiscModeCmd58:
;stm32f10x_adc.c,774 :: 		ADCx->CR1 &= CR1_JDISCEN_Reset;
; ADCx start address is: 0 (R0)
ADDS	R4, R0, #4
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
MVN	R2, #4096
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_adc.c,775 :: 		}
L_ADC_InjectedDiscModeCmd59:
;stm32f10x_adc.c,776 :: 		}
L_end_ADC_InjectedDiscModeCmd:
BX	LR
; end of _ADC_InjectedDiscModeCmd
_ADC_ExternalTrigInjectedConvConfig:
;stm32f10x_adc.c,800 :: 		void ADC_ExternalTrigInjectedConvConfig(ADC_TypeDef* ADCx, uint32_t ADC_ExternalTrigInjecConv)
; ADC_ExternalTrigInjecConv start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; ADC_ExternalTrigInjecConv end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_ExternalTrigInjecConv start address is: 4 (R1)
;stm32f10x_adc.c,802 :: 		uint32_t tmpreg = 0;
;stm32f10x_adc.c,807 :: 		tmpreg = ADCx->CR2;
ADDW	R4, R0, #8
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
;stm32f10x_adc.c,809 :: 		tmpreg &= CR2_JEXTSEL_Reset;
MVN	R2, #28672
AND	R2, R3, R2, LSL #0
;stm32f10x_adc.c,811 :: 		tmpreg |= ADC_ExternalTrigInjecConv;
ORRS	R2, R1
; ADC_ExternalTrigInjecConv end address is: 4 (R1)
;stm32f10x_adc.c,813 :: 		ADCx->CR2 = tmpreg;
STR	R2, [R4, #0]
;stm32f10x_adc.c,814 :: 		}
L_end_ADC_ExternalTrigInjectedConvConfig:
BX	LR
; end of _ADC_ExternalTrigInjectedConvConfig
_ADC_ExternalTrigInjectedConvCmd:
;stm32f10x_adc.c,825 :: 		void ADC_ExternalTrigInjectedConvCmd(ADC_TypeDef* ADCx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_adc.c,830 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_ADC_ExternalTrigInjectedConvCmd60
; NewState end address is: 4 (R1)
;stm32f10x_adc.c,833 :: 		ADCx->CR2 |= CR2_JEXTTRIG_Set;
ADDW	R3, R0, #8
; ADCx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #32768
STR	R2, [R3, #0]
;stm32f10x_adc.c,834 :: 		}
IT	AL
BAL	L_ADC_ExternalTrigInjectedConvCmd61
L_ADC_ExternalTrigInjectedConvCmd60:
;stm32f10x_adc.c,838 :: 		ADCx->CR2 &= CR2_JEXTTRIG_Reset;
; ADCx start address is: 0 (R0)
ADDW	R4, R0, #8
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
MVN	R2, #32768
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_adc.c,839 :: 		}
L_ADC_ExternalTrigInjectedConvCmd61:
;stm32f10x_adc.c,840 :: 		}
L_end_ADC_ExternalTrigInjectedConvCmd:
BX	LR
; end of _ADC_ExternalTrigInjectedConvCmd
_ADC_SoftwareStartInjectedConvCmd:
;stm32f10x_adc.c,850 :: 		void ADC_SoftwareStartInjectedConvCmd(ADC_TypeDef* ADCx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_adc.c,855 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_ADC_SoftwareStartInjectedConvCmd62
; NewState end address is: 4 (R1)
;stm32f10x_adc.c,859 :: 		ADCx->CR2 |= CR2_JEXTTRIG_JSWSTART_Set;
ADDW	R3, R0, #8
; ADCx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #2129920
STR	R2, [R3, #0]
;stm32f10x_adc.c,860 :: 		}
IT	AL
BAL	L_ADC_SoftwareStartInjectedConvCmd63
L_ADC_SoftwareStartInjectedConvCmd62:
;stm32f10x_adc.c,865 :: 		ADCx->CR2 &= CR2_JEXTTRIG_JSWSTART_Reset;
; ADCx start address is: 0 (R0)
ADDW	R4, R0, #8
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
MVN	R2, #2129920
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_adc.c,866 :: 		}
L_ADC_SoftwareStartInjectedConvCmd63:
;stm32f10x_adc.c,867 :: 		}
L_end_ADC_SoftwareStartInjectedConvCmd:
BX	LR
; end of _ADC_SoftwareStartInjectedConvCmd
_ADC_GetSoftwareStartInjectedConvCmdStatus:
;stm32f10x_adc.c,874 :: 		FlagStatus ADC_GetSoftwareStartInjectedConvCmdStatus(ADC_TypeDef* ADCx)
; ADCx start address is: 0 (R0)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
;stm32f10x_adc.c,876 :: 		FlagStatus bitstatus = RESET;
;stm32f10x_adc.c,880 :: 		if ((ADCx->CR2 & CR2_JSWSTART_Set) != (uint32_t)RESET)
ADDW	R1, R0, #8
; ADCx end address is: 0 (R0)
LDR	R1, [R1, #0]
AND	R1, R1, #2097152
CMP	R1, #0
IT	EQ
BEQ	L_ADC_GetSoftwareStartInjectedConvCmdStatus64
;stm32f10x_adc.c,883 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_adc.c,884 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_ADC_GetSoftwareStartInjectedConvCmdStatus65
L_ADC_GetSoftwareStartInjectedConvCmdStatus64:
;stm32f10x_adc.c,888 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_adc.c,889 :: 		}
L_ADC_GetSoftwareStartInjectedConvCmdStatus65:
;stm32f10x_adc.c,891 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_adc.c,892 :: 		}
L_end_ADC_GetSoftwareStartInjectedConvCmdStatus:
BX	LR
; end of _ADC_GetSoftwareStartInjectedConvCmdStatus
_ADC_InjectedChannelConfig:
;stm32f10x_adc.c,931 :: 		void ADC_InjectedChannelConfig(ADC_TypeDef* ADCx, uint8_t ADC_Channel, uint8_t Rank, uint8_t ADC_SampleTime)
; ADC_SampleTime start address is: 12 (R3)
; Rank start address is: 8 (R2)
; ADC_Channel start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; ADC_SampleTime end address is: 12 (R3)
; Rank end address is: 8 (R2)
; ADC_Channel end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_Channel start address is: 4 (R1)
; Rank start address is: 8 (R2)
; ADC_SampleTime start address is: 12 (R3)
;stm32f10x_adc.c,933 :: 		uint32_t tmpreg1 = 0, tmpreg2 = 0, tmpreg3 = 0;
;stm32f10x_adc.c,940 :: 		if (ADC_Channel > ADC_Channel_9)
CMP	R1, #9
IT	LS
BLS	L_ADC_InjectedChannelConfig66
;stm32f10x_adc.c,943 :: 		tmpreg1 = ADCx->SMPR1;
ADDW	R7, R0, #12
LDR	R8, [R7, #0]
; tmpreg1 start address is: 32 (R8)
;stm32f10x_adc.c,945 :: 		tmpreg2 = SMPR1_SMP_Set << (3*(ADC_Channel - 10));
SUBW	R5, R1, #10
SXTH	R5, R5
MOVW	R4, #3
SXTH	R4, R4
MUL	R6, R4, R5
SXTH	R6, R6
MOV	R4, #7
LSLS	R4, R6
;stm32f10x_adc.c,947 :: 		tmpreg1 &= ~tmpreg2;
MVN	R4, R4
AND	R5, R8, R4, LSL #0
; tmpreg1 end address is: 32 (R8)
;stm32f10x_adc.c,949 :: 		tmpreg2 = (uint32_t)ADC_SampleTime << (3*(ADC_Channel - 10));
UXTB	R4, R3
; ADC_SampleTime end address is: 12 (R3)
LSLS	R4, R6
;stm32f10x_adc.c,951 :: 		tmpreg1 |= tmpreg2;
ORR	R4, R5, R4, LSL #0
;stm32f10x_adc.c,953 :: 		ADCx->SMPR1 = tmpreg1;
STR	R4, [R7, #0]
;stm32f10x_adc.c,954 :: 		}
IT	AL
BAL	L_ADC_InjectedChannelConfig67
L_ADC_InjectedChannelConfig66:
;stm32f10x_adc.c,958 :: 		tmpreg1 = ADCx->SMPR2;
; ADC_SampleTime start address is: 12 (R3)
ADDW	R7, R0, #16
LDR	R4, [R7, #0]
; tmpreg1 start address is: 32 (R8)
MOV	R8, R4
;stm32f10x_adc.c,960 :: 		tmpreg2 = SMPR2_SMP_Set << (3 * ADC_Channel);
MOVW	R4, #3
SXTH	R4, R4
MUL	R6, R4, R1
SXTH	R6, R6
MOV	R4, #7
LSLS	R4, R6
;stm32f10x_adc.c,962 :: 		tmpreg1 &= ~tmpreg2;
MVN	R4, R4
AND	R5, R8, R4, LSL #0
; tmpreg1 end address is: 32 (R8)
;stm32f10x_adc.c,964 :: 		tmpreg2 = (uint32_t)ADC_SampleTime << (3 * ADC_Channel);
UXTB	R4, R3
; ADC_SampleTime end address is: 12 (R3)
LSLS	R4, R6
;stm32f10x_adc.c,966 :: 		tmpreg1 |= tmpreg2;
ORR	R4, R5, R4, LSL #0
;stm32f10x_adc.c,968 :: 		ADCx->SMPR2 = tmpreg1;
STR	R4, [R7, #0]
;stm32f10x_adc.c,969 :: 		}
L_ADC_InjectedChannelConfig67:
;stm32f10x_adc.c,972 :: 		tmpreg1 = ADCx->JSQR;
ADD	R8, R0, #56
; ADCx end address is: 0 (R0)
LDR	R4, [R8, #0]
; tmpreg1 start address is: 12 (R3)
MOV	R3, R4
;stm32f10x_adc.c,974 :: 		tmpreg3 =  (tmpreg1 & JSQR_JL_Set)>> 20;
AND	R4, R4, #3145728
LSRS	R4, R4, #20
; tmpreg3 start address is: 0 (R0)
MOV	R0, R4
;stm32f10x_adc.c,976 :: 		tmpreg2 = JSQR_JSQ_Set << (5 * (uint8_t)((Rank + 3) - (tmpreg3 + 1)));
ADDS	R7, R2, #3
SXTH	R7, R7
; Rank end address is: 8 (R2)
ADDS	R4, R4, #1
SUB	R4, R7, R4
UXTB	R5, R4
MOVW	R4, #5
SXTH	R4, R4
MULS	R5, R4, R5
SXTH	R5, R5
MOV	R4, #31
LSLS	R4, R5
;stm32f10x_adc.c,978 :: 		tmpreg1 &= ~tmpreg2;
MVN	R4, R4
AND	R4, R3, R4, LSL #0
; tmpreg1 end address is: 12 (R3)
; tmpreg1 start address is: 8 (R2)
MOV	R2, R4
;stm32f10x_adc.c,980 :: 		tmpreg2 = (uint32_t)ADC_Channel << (5 * (uint8_t)((Rank + 3) - (tmpreg3 + 1)));
UXTB	R6, R1
; ADC_Channel end address is: 4 (R1)
ADDS	R4, R0, #1
; tmpreg3 end address is: 0 (R0)
SUB	R4, R7, R4
UXTB	R5, R4
MOVW	R4, #5
SXTH	R4, R4
MULS	R4, R5, R4
SXTH	R4, R4
LSL	R4, R6, R4
;stm32f10x_adc.c,982 :: 		tmpreg1 |= tmpreg2;
ORR	R4, R2, R4, LSL #0
; tmpreg1 end address is: 8 (R2)
;stm32f10x_adc.c,984 :: 		ADCx->JSQR = tmpreg1;
STR	R4, [R8, #0]
;stm32f10x_adc.c,985 :: 		}
L_end_ADC_InjectedChannelConfig:
BX	LR
; end of _ADC_InjectedChannelConfig
_ADC_InjectedSequencerLengthConfig:
;stm32f10x_adc.c,994 :: 		void ADC_InjectedSequencerLengthConfig(ADC_TypeDef* ADCx, uint8_t Length)
; Length start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; Length end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; Length start address is: 4 (R1)
;stm32f10x_adc.c,996 :: 		uint32_t tmpreg1 = 0;
;stm32f10x_adc.c,997 :: 		uint32_t tmpreg2 = 0;
;stm32f10x_adc.c,1003 :: 		tmpreg1 = ADCx->JSQR;
ADDW	R4, R0, #56
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
;stm32f10x_adc.c,1005 :: 		tmpreg1 &= JSQR_JL_Reset;
MVN	R2, #3145728
ANDS	R3, R2
;stm32f10x_adc.c,1007 :: 		tmpreg2 = Length - 1;
SUBS	R2, R1, #1
SXTH	R2, R2
; Length end address is: 4 (R1)
; tmpreg2 start address is: 0 (R0)
SXTH	R0, R2
;stm32f10x_adc.c,1008 :: 		tmpreg1 |= tmpreg2 << 20;
LSLS	R2, R0, #20
; tmpreg2 end address is: 0 (R0)
ORR	R2, R3, R2, LSL #0
;stm32f10x_adc.c,1010 :: 		ADCx->JSQR = tmpreg1;
STR	R2, [R4, #0]
;stm32f10x_adc.c,1011 :: 		}
L_end_ADC_InjectedSequencerLengthConfig:
BX	LR
; end of _ADC_InjectedSequencerLengthConfig
_ADC_SetInjectedOffset:
;stm32f10x_adc.c,1026 :: 		void ADC_SetInjectedOffset(ADC_TypeDef* ADCx, uint8_t ADC_InjectedChannel, uint16_t Offset)
; Offset start address is: 8 (R2)
; ADC_InjectedChannel start address is: 4 (R1)
; ADCx start address is: 0 (R0)
MOV	R3, R0
; Offset end address is: 8 (R2)
; ADC_InjectedChannel end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 12 (R3)
; ADC_InjectedChannel start address is: 4 (R1)
; Offset start address is: 8 (R2)
;stm32f10x_adc.c,1028 :: 		__IO uint32_t tmp = 0;
;stm32f10x_adc.c,1035 :: 		tmp = (uint32_t)ADCx;
; tmp start address is: 0 (R0)
MOV	R0, R3
; ADCx end address is: 12 (R3)
;stm32f10x_adc.c,1036 :: 		tmp += ADC_InjectedChannel;
ADDS	R0, R0, R1
; ADC_InjectedChannel end address is: 4 (R1)
;stm32f10x_adc.c,1039 :: 		*(__IO uint32_t *) tmp = (uint32_t)Offset;
MOV	R4, R0
; tmp end address is: 0 (R0)
UXTH	R3, R2
; Offset end address is: 8 (R2)
STR	R3, [R4, #0]
;stm32f10x_adc.c,1040 :: 		}
L_end_ADC_SetInjectedOffset:
BX	LR
; end of _ADC_SetInjectedOffset
_ADC_GetInjectedConversionValue:
;stm32f10x_adc.c,1053 :: 		uint16_t ADC_GetInjectedConversionValue(ADC_TypeDef* ADCx, uint8_t ADC_InjectedChannel)
; ADC_InjectedChannel start address is: 4 (R1)
; ADCx start address is: 0 (R0)
MOV	R2, R0
; ADC_InjectedChannel end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 8 (R2)
; ADC_InjectedChannel start address is: 4 (R1)
;stm32f10x_adc.c,1055 :: 		__IO uint32_t tmp = 0;
;stm32f10x_adc.c,1061 :: 		tmp = (uint32_t)ADCx;
; tmp start address is: 0 (R0)
MOV	R0, R2
; ADCx end address is: 8 (R2)
;stm32f10x_adc.c,1062 :: 		tmp += ADC_InjectedChannel + JDR_Offset;
ADDW	R2, R1, #40
SXTH	R2, R2
; ADC_InjectedChannel end address is: 4 (R1)
ADDS	R0, R0, R2
;stm32f10x_adc.c,1065 :: 		return (uint16_t) (*(__IO uint32_t*)  tmp);
MOV	R2, R0
; tmp end address is: 0 (R0)
LDR	R2, [R2, #0]
UXTH	R2, R2
UXTH	R0, R2
;stm32f10x_adc.c,1066 :: 		}
L_end_ADC_GetInjectedConversionValue:
BX	LR
; end of _ADC_GetInjectedConversionValue
_ADC_AnalogWatchdogCmd:
;stm32f10x_adc.c,1083 :: 		void ADC_AnalogWatchdogCmd(ADC_TypeDef* ADCx, uint32_t ADC_AnalogWatchdog)
; ADC_AnalogWatchdog start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; ADC_AnalogWatchdog end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_AnalogWatchdog start address is: 4 (R1)
;stm32f10x_adc.c,1085 :: 		uint32_t tmpreg = 0;
;stm32f10x_adc.c,1090 :: 		tmpreg = ADCx->CR1;
ADDS	R4, R0, #4
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
;stm32f10x_adc.c,1092 :: 		tmpreg &= CR1_AWDMode_Reset;
MOVW	R2, #65023
MOVT	R2, #65343
AND	R2, R3, R2, LSL #0
;stm32f10x_adc.c,1094 :: 		tmpreg |= ADC_AnalogWatchdog;
ORRS	R2, R1
; ADC_AnalogWatchdog end address is: 4 (R1)
;stm32f10x_adc.c,1096 :: 		ADCx->CR1 = tmpreg;
STR	R2, [R4, #0]
;stm32f10x_adc.c,1097 :: 		}
L_end_ADC_AnalogWatchdogCmd:
BX	LR
; end of _ADC_AnalogWatchdogCmd
_ADC_AnalogWatchdogThresholdsConfig:
;stm32f10x_adc.c,1109 :: 		uint16_t LowThreshold)
; LowThreshold start address is: 8 (R2)
; HighThreshold start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; LowThreshold end address is: 8 (R2)
; HighThreshold end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; HighThreshold start address is: 4 (R1)
; LowThreshold start address is: 8 (R2)
;stm32f10x_adc.c,1116 :: 		ADCx->HTR = HighThreshold;
ADDW	R3, R0, #36
STR	R1, [R3, #0]
; HighThreshold end address is: 4 (R1)
;stm32f10x_adc.c,1118 :: 		ADCx->LTR = LowThreshold;
ADDW	R3, R0, #40
; ADCx end address is: 0 (R0)
STR	R2, [R3, #0]
; LowThreshold end address is: 8 (R2)
;stm32f10x_adc.c,1119 :: 		}
L_end_ADC_AnalogWatchdogThresholdsConfig:
BX	LR
; end of _ADC_AnalogWatchdogThresholdsConfig
_ADC_AnalogWatchdogSingleChannelConfig:
;stm32f10x_adc.c,1146 :: 		void ADC_AnalogWatchdogSingleChannelConfig(ADC_TypeDef* ADCx, uint8_t ADC_Channel)
; ADC_Channel start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; ADC_Channel end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_Channel start address is: 4 (R1)
;stm32f10x_adc.c,1148 :: 		uint32_t tmpreg = 0;
;stm32f10x_adc.c,1153 :: 		tmpreg = ADCx->CR1;
ADDS	R4, R0, #4
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
;stm32f10x_adc.c,1155 :: 		tmpreg &= CR1_AWDCH_Reset;
MVN	R2, #31
AND	R2, R3, R2, LSL #0
;stm32f10x_adc.c,1157 :: 		tmpreg |= ADC_Channel;
ORRS	R2, R1
; ADC_Channel end address is: 4 (R1)
;stm32f10x_adc.c,1159 :: 		ADCx->CR1 = tmpreg;
STR	R2, [R4, #0]
;stm32f10x_adc.c,1160 :: 		}
L_end_ADC_AnalogWatchdogSingleChannelConfig:
BX	LR
; end of _ADC_AnalogWatchdogSingleChannelConfig
_ADC_TempSensorVrefintCmd:
;stm32f10x_adc.c,1168 :: 		void ADC_TempSensorVrefintCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f10x_adc.c,1172 :: 		if (NewState != DISABLE)
CMP	R0, #0
IT	EQ
BEQ	L_ADC_TempSensorVrefintCmd68
; NewState end address is: 0 (R0)
;stm32f10x_adc.c,1175 :: 		ADC1->CR2 |= CR2_TSVREFE_Set;
MOVW	R2, #9224
MOVT	R2, #16385
LDR	R1, [R2, #0]
ORR	R1, R1, #8388608
STR	R1, [R2, #0]
;stm32f10x_adc.c,1176 :: 		}
IT	AL
BAL	L_ADC_TempSensorVrefintCmd69
L_ADC_TempSensorVrefintCmd68:
;stm32f10x_adc.c,1180 :: 		ADC1->CR2 &= CR2_TSVREFE_Reset;
MOVW	R3, #9224
MOVT	R3, #16385
LDR	R2, [R3, #0]
MVN	R1, #8388608
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f10x_adc.c,1181 :: 		}
L_ADC_TempSensorVrefintCmd69:
;stm32f10x_adc.c,1182 :: 		}
L_end_ADC_TempSensorVrefintCmd:
BX	LR
; end of _ADC_TempSensorVrefintCmd
_ADC_GetFlagStatus:
;stm32f10x_adc.c,1196 :: 		FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, uint8_t ADC_FLAG)
; ADC_FLAG start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; ADC_FLAG end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_FLAG start address is: 4 (R1)
;stm32f10x_adc.c,1198 :: 		FlagStatus bitstatus = RESET;
;stm32f10x_adc.c,1203 :: 		if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
LDR	R2, [R0, #0]
; ADCx end address is: 0 (R0)
ANDS	R2, R1
; ADC_FLAG end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_ADC_GetFlagStatus70
;stm32f10x_adc.c,1206 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_adc.c,1207 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_ADC_GetFlagStatus71
L_ADC_GetFlagStatus70:
;stm32f10x_adc.c,1211 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_adc.c,1212 :: 		}
L_ADC_GetFlagStatus71:
;stm32f10x_adc.c,1214 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_adc.c,1215 :: 		}
L_end_ADC_GetFlagStatus:
BX	LR
; end of _ADC_GetFlagStatus
_ADC_ClearFlag:
;stm32f10x_adc.c,1229 :: 		void ADC_ClearFlag(ADC_TypeDef* ADCx, uint8_t ADC_FLAG)
; ADC_FLAG start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; ADC_FLAG end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_FLAG start address is: 4 (R1)
;stm32f10x_adc.c,1235 :: 		ADCx->SR = ~(uint32_t)ADC_FLAG;
UXTB	R2, R1
; ADC_FLAG end address is: 4 (R1)
MVN	R2, R2
STR	R2, [R0, #0]
; ADCx end address is: 0 (R0)
;stm32f10x_adc.c,1236 :: 		}
L_end_ADC_ClearFlag:
BX	LR
; end of _ADC_ClearFlag
_ADC_GetITStatus:
;stm32f10x_adc.c,1248 :: 		ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx, uint16_t ADC_IT)
; ADC_IT start address is: 4 (R1)
; ADCx start address is: 0 (R0)
UXTH	R4, R1
; ADC_IT end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_IT start address is: 16 (R4)
;stm32f10x_adc.c,1250 :: 		ITStatus bitstatus = RESET;
;stm32f10x_adc.c,1251 :: 		uint32_t itmask = 0, enablestatus = 0;
;stm32f10x_adc.c,1256 :: 		itmask = ADC_IT >> 8;
LSRS	R2, R4, #8
UXTH	R2, R2
; itmask start address is: 4 (R1)
UXTH	R1, R2
;stm32f10x_adc.c,1258 :: 		enablestatus = (ADCx->CR1 & (uint8_t)ADC_IT) ;
ADDS	R2, R0, #4
LDR	R3, [R2, #0]
UXTB	R2, R4
; ADC_IT end address is: 16 (R4)
AND	R2, R3, R2, LSL #0
; enablestatus start address is: 12 (R3)
MOV	R3, R2
;stm32f10x_adc.c,1260 :: 		if (((ADCx->SR & itmask) != (uint32_t)RESET) && enablestatus)
LDR	R2, [R0, #0]
; ADCx end address is: 0 (R0)
ANDS	R2, R1
; itmask end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L__ADC_GetITStatus85
CMP	R3, #0
IT	EQ
BEQ	L__ADC_GetITStatus84
; enablestatus end address is: 12 (R3)
L__ADC_GetITStatus83:
;stm32f10x_adc.c,1263 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_adc.c,1264 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_ADC_GetITStatus75
;stm32f10x_adc.c,1260 :: 		if (((ADCx->SR & itmask) != (uint32_t)RESET) && enablestatus)
L__ADC_GetITStatus85:
L__ADC_GetITStatus84:
;stm32f10x_adc.c,1268 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_adc.c,1269 :: 		}
L_ADC_GetITStatus75:
;stm32f10x_adc.c,1271 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_adc.c,1272 :: 		}
L_end_ADC_GetITStatus:
BX	LR
; end of _ADC_GetITStatus
_ADC_ClearITPendingBit:
;stm32f10x_adc.c,1284 :: 		void ADC_ClearITPendingBit(ADC_TypeDef* ADCx, uint16_t ADC_IT)
; ADC_IT start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; ADC_IT end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_IT start address is: 4 (R1)
;stm32f10x_adc.c,1286 :: 		uint8_t itmask = 0;
;stm32f10x_adc.c,1291 :: 		itmask = (uint8_t)(ADC_IT >> 8);
LSRS	R2, R1, #8
UXTH	R2, R2
; ADC_IT end address is: 4 (R1)
;stm32f10x_adc.c,1293 :: 		ADCx->SR = ~(uint32_t)itmask;
UXTB	R2, R2
MVN	R2, R2
STR	R2, [R0, #0]
; ADCx end address is: 0 (R0)
;stm32f10x_adc.c,1294 :: 		}
L_end_ADC_ClearITPendingBit:
BX	LR
; end of _ADC_ClearITPendingBit
