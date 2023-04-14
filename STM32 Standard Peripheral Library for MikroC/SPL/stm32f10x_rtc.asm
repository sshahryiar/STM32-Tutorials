stm32f10x_rtc_NVIC_SetPriorityGrouping:
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
; end of stm32f10x_rtc_NVIC_SetPriorityGrouping
stm32f10x_rtc_NVIC_GetPriorityGrouping:
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
; end of stm32f10x_rtc_NVIC_GetPriorityGrouping
stm32f10x_rtc_NVIC_EnableIRQ:
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
; end of stm32f10x_rtc_NVIC_EnableIRQ
stm32f10x_rtc_NVIC_DisableIRQ:
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
; end of stm32f10x_rtc_NVIC_DisableIRQ
stm32f10x_rtc_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f10x_rtc_NVIC_GetPendingIRQ0
; ?FLOC__stm32f10x_rtc_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_rtc_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_rtc_NVIC_GetPendingIRQ1
L_stm32f10x_rtc_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f10x_rtc_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_rtc_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
L_stm32f10x_rtc_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f10x_rtc_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_rtc_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1593 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f10x_rtc_NVIC_GetPendingIRQ
stm32f10x_rtc_NVIC_SetPendingIRQ:
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
; end of stm32f10x_rtc_NVIC_SetPendingIRQ
stm32f10x_rtc_NVIC_ClearPendingIRQ:
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
; end of stm32f10x_rtc_NVIC_ClearPendingIRQ
stm32f10x_rtc_NVIC_GetActive:
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
BEQ	L_stm32f10x_rtc_NVIC_GetActive2
; ?FLOC__stm32f10x_rtc_NVIC_GetActive?T72 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_rtc_NVIC_GetActive?T72 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_rtc_NVIC_GetActive3
L_stm32f10x_rtc_NVIC_GetActive2:
; ?FLOC__stm32f10x_rtc_NVIC_GetActive?T72 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_rtc_NVIC_GetActive?T72 end address is: 0 (R0)
L_stm32f10x_rtc_NVIC_GetActive3:
; ?FLOC__stm32f10x_rtc_NVIC_GetActive?T72 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_rtc_NVIC_GetActive?T72 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1633 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f10x_rtc_NVIC_GetActive
stm32f10x_rtc_NVIC_SetPriority:
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
BGE	L_stm32f10x_rtc_NVIC_SetPriority4
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
BAL	L_stm32f10x_rtc_NVIC_SetPriority5
L_stm32f10x_rtc_NVIC_SetPriority4:
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
L_stm32f10x_rtc_NVIC_SetPriority5:
;core_cm3.h,1653 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f10x_rtc_NVIC_SetPriority
stm32f10x_rtc_NVIC_GetPriority:
;core_cm3.h,1670 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1673 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f10x_rtc_NVIC_GetPriority6
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
L_stm32f10x_rtc_NVIC_GetPriority6:
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
; end of stm32f10x_rtc_NVIC_GetPriority
stm32f10x_rtc_NVIC_EncodePriority:
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
BLS	L_stm32f10x_rtc_NVIC_EncodePriority8
; ?FLOC__stm32f10x_rtc_NVIC_EncodePriority?T112 start address is: 12 (R3)
MOVW	R3, #4
; ?FLOC__stm32f10x_rtc_NVIC_EncodePriority?T112 end address is: 12 (R3)
IT	AL
BAL	L_stm32f10x_rtc_NVIC_EncodePriority9
L_stm32f10x_rtc_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f10x_rtc_NVIC_EncodePriority?T112 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_rtc_NVIC_EncodePriority?T112 end address is: 0 (R0)
MOV	R3, R0
L_stm32f10x_rtc_NVIC_EncodePriority9:
; ?FLOC__stm32f10x_rtc_NVIC_EncodePriority?T112 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_rtc_NVIC_EncodePriority?T112 end address is: 12 (R3)
;core_cm3.h,1702 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f10x_rtc_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f10x_rtc_NVIC_EncodePriority?T116 start address is: 20 (R5)
MOVW	R5, #0
; ?FLOC__stm32f10x_rtc_NVIC_EncodePriority?T116 end address is: 20 (R5)
IT	AL
BAL	L_stm32f10x_rtc_NVIC_EncodePriority11
L_stm32f10x_rtc_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f10x_rtc_NVIC_EncodePriority?T116 start address is: 20 (R5)
; ?FLOC__stm32f10x_rtc_NVIC_EncodePriority?T116 end address is: 20 (R5)
L_stm32f10x_rtc_NVIC_EncodePriority11:
;core_cm3.h,1705 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f10x_rtc_NVIC_EncodePriority?T116 start address is: 20 (R5)
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
; ?FLOC__stm32f10x_rtc_NVIC_EncodePriority?T116 end address is: 20 (R5)
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
; end of stm32f10x_rtc_NVIC_EncodePriority
stm32f10x_rtc_NVIC_DecodePriority:
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
BLS	L_stm32f10x_rtc_NVIC_DecodePriority12
; ?FLOC__stm32f10x_rtc_NVIC_DecodePriority?T130 start address is: 16 (R4)
MOVW	R4, #4
; ?FLOC__stm32f10x_rtc_NVIC_DecodePriority?T130 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_rtc_NVIC_DecodePriority13
L_stm32f10x_rtc_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f10x_rtc_NVIC_DecodePriority?T130 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_rtc_NVIC_DecodePriority?T130 end address is: 4 (R1)
MOV	R4, R1
L_stm32f10x_rtc_NVIC_DecodePriority13:
; ?FLOC__stm32f10x_rtc_NVIC_DecodePriority?T130 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_rtc_NVIC_DecodePriority?T130 end address is: 16 (R4)
;core_cm3.h,1733 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f10x_rtc_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f10x_rtc_NVIC_DecodePriority?T134 start address is: 16 (R4)
MOVW	R4, #0
; ?FLOC__stm32f10x_rtc_NVIC_DecodePriority?T134 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_rtc_NVIC_DecodePriority15
L_stm32f10x_rtc_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f10x_rtc_NVIC_DecodePriority?T134 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f10x_rtc_NVIC_DecodePriority?T134 end address is: 20 (R5)
MOV	R4, R5
L_stm32f10x_rtc_NVIC_DecodePriority15:
; ?FLOC__stm32f10x_rtc_NVIC_DecodePriority?T134 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm3.h,1735 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f10x_rtc_NVIC_DecodePriority?T134 end address is: 16 (R4)
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
; end of stm32f10x_rtc_NVIC_DecodePriority
stm32f10x_rtc_SysTick_Config:
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
BLS	L_stm32f10x_rtc_SysTick_Config16
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f10x_rtc_SysTick_Config16:
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
BL	stm32f10x_rtc_NVIC_SetPriority+0
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
; end of stm32f10x_rtc_SysTick_Config
stm32f10x_rtc_NVIC_SystemReset:
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
L_stm32f10x_rtc_NVIC_SystemReset17:
IT	AL
BAL	L_stm32f10x_rtc_NVIC_SystemReset17
;core_cm3.h,1787 :: 		}
L_end_NVIC_SystemReset:
BX	LR
; end of stm32f10x_rtc_NVIC_SystemReset
stm32f10x_rtc_ITM_SendChar:
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
BEQ	L_stm32f10x_rtc_ITM_SendChar43
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_rtc_ITM_SendChar44
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_rtc_ITM_SendChar45
L_stm32f10x_rtc_ITM_SendChar39:
;core_cm3.h,1823 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f10x_rtc_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f10x_rtc_ITM_SendChar23
IT	AL
BAL	L_stm32f10x_rtc_ITM_SendChar22
L_stm32f10x_rtc_ITM_SendChar23:
;core_cm3.h,1824 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm3.h,1820 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f10x_rtc_ITM_SendChar42
L_stm32f10x_rtc_ITM_SendChar43:
L_stm32f10x_rtc_ITM_SendChar42:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_rtc_ITM_SendChar41
L_stm32f10x_rtc_ITM_SendChar44:
L_stm32f10x_rtc_ITM_SendChar41:
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_rtc_ITM_SendChar40
L_stm32f10x_rtc_ITM_SendChar45:
L_stm32f10x_rtc_ITM_SendChar40:
;core_cm3.h,1826 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm3.h,1827 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f10x_rtc_ITM_SendChar
stm32f10x_rtc_ITM_ReceiveChar:
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
BEQ	L_stm32f10x_rtc_ITM_ReceiveChar24
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
L_stm32f10x_rtc_ITM_ReceiveChar24:
;core_cm3.h,1847 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm3.h,1848 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f10x_rtc_ITM_ReceiveChar
stm32f10x_rtc_ITM_CheckChar:
;core_cm3.h,1859 :: 		static __INLINE int ITM_CheckChar (void) {
;core_cm3.h,1861 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f10x_rtc_ITM_CheckChar25
;core_cm3.h,1862 :: 		return (0);                                 /* no character available */
MOVW	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm3.h,1863 :: 		} else {
L_stm32f10x_rtc_ITM_CheckChar25:
;core_cm3.h,1864 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm3.h,1866 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f10x_rtc_ITM_CheckChar
_RTC_ITConfig:
;stm32f10x_rtc.c,90 :: 		void RTC_ITConfig(uint16_t RTC_IT, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RTC_IT start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RTC_IT end address is: 0 (R0)
; RTC_IT start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_rtc.c,96 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RTC_ITConfig27
; NewState end address is: 4 (R1)
;stm32f10x_rtc.c,98 :: 		RTC->CRH |= RTC_IT;
MOVW	R3, #10240
MOVT	R3, #16384
LDRH	R2, [R3, #0]
ORRS	R2, R0
; RTC_IT end address is: 0 (R0)
STRH	R2, [R3, #0]
;stm32f10x_rtc.c,99 :: 		}
IT	AL
BAL	L_RTC_ITConfig28
L_RTC_ITConfig27:
;stm32f10x_rtc.c,102 :: 		RTC->CRH &= (uint16_t)~RTC_IT;
; RTC_IT start address is: 0 (R0)
MVN	R4, R0
UXTH	R4, R4
; RTC_IT end address is: 0 (R0)
MOVW	R3, #10240
MOVT	R3, #16384
LDRH	R2, [R3, #0]
ANDS	R2, R4
STRH	R2, [R3, #0]
;stm32f10x_rtc.c,103 :: 		}
L_RTC_ITConfig28:
;stm32f10x_rtc.c,104 :: 		}
L_end_RTC_ITConfig:
BX	LR
; end of _RTC_ITConfig
_RTC_EnterConfigMode:
;stm32f10x_rtc.c,111 :: 		void RTC_EnterConfigMode(void)
;stm32f10x_rtc.c,114 :: 		RTC->CRL |= RTC_CRL_CNF;
MOVW	R1, #10244
MOVT	R1, #16384
LDRH	R0, [R1, #0]
ORR	R0, R0, #16
STRH	R0, [R1, #0]
;stm32f10x_rtc.c,115 :: 		}
L_end_RTC_EnterConfigMode:
BX	LR
; end of _RTC_EnterConfigMode
_RTC_ExitConfigMode:
;stm32f10x_rtc.c,122 :: 		void RTC_ExitConfigMode(void)
;stm32f10x_rtc.c,125 :: 		RTC->CRL &= (uint16_t)~((uint16_t)RTC_CRL_CNF);
MOVW	R2, #10244
MOVT	R2, #16384
LDRH	R1, [R2, #0]
MOVW	R0, #65519
AND	R0, R1, R0, LSL #0
STRH	R0, [R2, #0]
;stm32f10x_rtc.c,126 :: 		}
L_end_RTC_ExitConfigMode:
BX	LR
; end of _RTC_ExitConfigMode
_RTC_GetCounter:
;stm32f10x_rtc.c,133 :: 		uint32_t RTC_GetCounter(void)
;stm32f10x_rtc.c,135 :: 		uint16_t tmp = 0;
;stm32f10x_rtc.c,137 :: 		return (((uint32_t)RTC->CNTH << 16 ) | tmp) ;
MOVW	R0, #10264
MOVT	R0, #16384
LDRH	R0, [R0, #0]
LSLS	R1, R0, #16
MOVW	R0, #10268
MOVT	R0, #16384
LDRH	R0, [R0, #0]
ORR	R0, R1, R0, LSL #0
;stm32f10x_rtc.c,138 :: 		}
L_end_RTC_GetCounter:
BX	LR
; end of _RTC_GetCounter
_RTC_SetCounter:
;stm32f10x_rtc.c,145 :: 		void RTC_SetCounter(uint32_t CounterValue)
; CounterValue start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R3, R0
; CounterValue end address is: 0 (R0)
; CounterValue start address is: 12 (R3)
;stm32f10x_rtc.c,147 :: 		RTC_EnterConfigMode();
BL	_RTC_EnterConfigMode+0
;stm32f10x_rtc.c,149 :: 		RTC->CNTH = CounterValue >> 16;
LSRS	R2, R3, #16
MOVW	R1, #10264
MOVT	R1, #16384
STRH	R2, [R1, #0]
;stm32f10x_rtc.c,151 :: 		RTC->CNTL = (CounterValue & RTC_LSB_MASK);
MOVW	R1, #65535
MOVT	R1, #0
AND	R2, R3, R1, LSL #0
; CounterValue end address is: 12 (R3)
MOVW	R1, #10268
MOVT	R1, #16384
STRH	R2, [R1, #0]
;stm32f10x_rtc.c,152 :: 		RTC_ExitConfigMode();
BL	_RTC_ExitConfigMode+0
;stm32f10x_rtc.c,153 :: 		}
L_end_RTC_SetCounter:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RTC_SetCounter
_RTC_SetPrescaler:
;stm32f10x_rtc.c,160 :: 		void RTC_SetPrescaler(uint32_t PrescalerValue)
; PrescalerValue start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R3, R0
; PrescalerValue end address is: 0 (R0)
; PrescalerValue start address is: 12 (R3)
;stm32f10x_rtc.c,165 :: 		RTC_EnterConfigMode();
BL	_RTC_EnterConfigMode+0
;stm32f10x_rtc.c,167 :: 		RTC->PRLH = (PrescalerValue & PRLH_MSB_MASK) >> 16;
AND	R1, R3, #983040
LSRS	R2, R1, #16
MOVW	R1, #10248
MOVT	R1, #16384
STRH	R2, [R1, #0]
;stm32f10x_rtc.c,169 :: 		RTC->PRLL = (PrescalerValue & RTC_LSB_MASK);
MOVW	R1, #65535
MOVT	R1, #0
AND	R2, R3, R1, LSL #0
; PrescalerValue end address is: 12 (R3)
MOVW	R1, #10252
MOVT	R1, #16384
STRH	R2, [R1, #0]
;stm32f10x_rtc.c,170 :: 		RTC_ExitConfigMode();
BL	_RTC_ExitConfigMode+0
;stm32f10x_rtc.c,171 :: 		}
L_end_RTC_SetPrescaler:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RTC_SetPrescaler
_RTC_SetAlarm:
;stm32f10x_rtc.c,178 :: 		void RTC_SetAlarm(uint32_t AlarmValue)
; AlarmValue start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R3, R0
; AlarmValue end address is: 0 (R0)
; AlarmValue start address is: 12 (R3)
;stm32f10x_rtc.c,180 :: 		RTC_EnterConfigMode();
BL	_RTC_EnterConfigMode+0
;stm32f10x_rtc.c,182 :: 		RTC->ALRH = AlarmValue >> 16;
LSRS	R2, R3, #16
MOVW	R1, #10272
MOVT	R1, #16384
STRH	R2, [R1, #0]
;stm32f10x_rtc.c,184 :: 		RTC->ALRL = (AlarmValue & RTC_LSB_MASK);
MOVW	R1, #65535
MOVT	R1, #0
AND	R2, R3, R1, LSL #0
; AlarmValue end address is: 12 (R3)
MOVW	R1, #10276
MOVT	R1, #16384
STRH	R2, [R1, #0]
;stm32f10x_rtc.c,185 :: 		RTC_ExitConfigMode();
BL	_RTC_ExitConfigMode+0
;stm32f10x_rtc.c,186 :: 		}
L_end_RTC_SetAlarm:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RTC_SetAlarm
_RTC_GetDivider:
;stm32f10x_rtc.c,193 :: 		uint32_t RTC_GetDivider(void)
;stm32f10x_rtc.c,195 :: 		uint32_t tmp = 0x00;
;stm32f10x_rtc.c,196 :: 		tmp = ((uint32_t)RTC->DIVH & (uint32_t)0x000F) << 16;
MOVW	R0, #10256
MOVT	R0, #16384
LDRH	R0, [R0, #0]
AND	R0, R0, #15
LSLS	R1, R0, #16
;stm32f10x_rtc.c,197 :: 		tmp |= RTC->DIVL;
MOVW	R0, #10260
MOVT	R0, #16384
LDRH	R0, [R0, #0]
ORR	R0, R1, R0, LSL #0
;stm32f10x_rtc.c,198 :: 		return tmp;
;stm32f10x_rtc.c,199 :: 		}
L_end_RTC_GetDivider:
BX	LR
; end of _RTC_GetDivider
_RTC_WaitForLastTask:
;stm32f10x_rtc.c,207 :: 		void RTC_WaitForLastTask(void)
;stm32f10x_rtc.c,210 :: 		while ((RTC->CRL & RTC_FLAG_RTOFF) == (uint16_t)RESET)
L_RTC_WaitForLastTask29:
MOVW	R0, #10244
MOVT	R0, #16384
LDRH	R0, [R0, #0]
AND	R0, R0, #32
UXTH	R0, R0
CMP	R0, #0
IT	NE
BNE	L_RTC_WaitForLastTask30
;stm32f10x_rtc.c,212 :: 		}
IT	AL
BAL	L_RTC_WaitForLastTask29
L_RTC_WaitForLastTask30:
;stm32f10x_rtc.c,213 :: 		}
L_end_RTC_WaitForLastTask:
BX	LR
; end of _RTC_WaitForLastTask
_RTC_WaitForSynchro:
;stm32f10x_rtc.c,223 :: 		void RTC_WaitForSynchro(void)
;stm32f10x_rtc.c,226 :: 		RTC->CRL &= (uint16_t)~RTC_FLAG_RSF;
MOVW	R2, #10244
MOVT	R2, #16384
LDRH	R1, [R2, #0]
MOVW	R0, #65527
AND	R0, R1, R0, LSL #0
STRH	R0, [R2, #0]
;stm32f10x_rtc.c,228 :: 		while ((RTC->CRL & RTC_FLAG_RSF) == (uint16_t)RESET)
L_RTC_WaitForSynchro31:
MOVW	R0, #10244
MOVT	R0, #16384
LDRH	R0, [R0, #0]
AND	R0, R0, #8
UXTH	R0, R0
CMP	R0, #0
IT	NE
BNE	L_RTC_WaitForSynchro32
;stm32f10x_rtc.c,230 :: 		}
IT	AL
BAL	L_RTC_WaitForSynchro31
L_RTC_WaitForSynchro32:
;stm32f10x_rtc.c,231 :: 		}
L_end_RTC_WaitForSynchro:
BX	LR
; end of _RTC_WaitForSynchro
_RTC_GetFlagStatus:
;stm32f10x_rtc.c,244 :: 		FlagStatus RTC_GetFlagStatus(uint16_t RTC_FLAG)
; RTC_FLAG start address is: 0 (R0)
; RTC_FLAG end address is: 0 (R0)
; RTC_FLAG start address is: 0 (R0)
;stm32f10x_rtc.c,246 :: 		FlagStatus bitstatus = RESET;
;stm32f10x_rtc.c,251 :: 		if ((RTC->CRL & RTC_FLAG) != (uint16_t)RESET)
MOVW	R1, #10244
MOVT	R1, #16384
LDRH	R1, [R1, #0]
ANDS	R1, R0
UXTH	R1, R1
; RTC_FLAG end address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_RTC_GetFlagStatus33
;stm32f10x_rtc.c,253 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_rtc.c,254 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_RTC_GetFlagStatus34
L_RTC_GetFlagStatus33:
;stm32f10x_rtc.c,257 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_rtc.c,258 :: 		}
L_RTC_GetFlagStatus34:
;stm32f10x_rtc.c,259 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_rtc.c,260 :: 		}
L_end_RTC_GetFlagStatus:
BX	LR
; end of _RTC_GetFlagStatus
_RTC_ClearFlag:
;stm32f10x_rtc.c,273 :: 		void RTC_ClearFlag(uint16_t RTC_FLAG)
; RTC_FLAG start address is: 0 (R0)
; RTC_FLAG end address is: 0 (R0)
; RTC_FLAG start address is: 0 (R0)
;stm32f10x_rtc.c,279 :: 		RTC->CRL &= (uint16_t)~RTC_FLAG;
MVN	R3, R0
UXTH	R3, R3
; RTC_FLAG end address is: 0 (R0)
MOVW	R2, #10244
MOVT	R2, #16384
LDRH	R1, [R2, #0]
ANDS	R1, R3
STRH	R1, [R2, #0]
;stm32f10x_rtc.c,280 :: 		}
L_end_RTC_ClearFlag:
BX	LR
; end of _RTC_ClearFlag
_RTC_GetITStatus:
;stm32f10x_rtc.c,291 :: 		ITStatus RTC_GetITStatus(uint16_t RTC_IT)
; RTC_IT start address is: 0 (R0)
; RTC_IT end address is: 0 (R0)
; RTC_IT start address is: 0 (R0)
;stm32f10x_rtc.c,293 :: 		ITStatus bitstatus = RESET;
;stm32f10x_rtc.c,297 :: 		bitstatus = (ITStatus)(RTC->CRL & RTC_IT);
MOVW	R1, #10244
MOVT	R1, #16384
LDRH	R1, [R1, #0]
ANDS	R1, R0
; bitstatus start address is: 8 (R2)
UXTB	R2, R1
;stm32f10x_rtc.c,298 :: 		if (((RTC->CRH & RTC_IT) != (uint16_t)RESET) && (bitstatus != (uint16_t)RESET))
MOVW	R1, #10240
MOVT	R1, #16384
LDRH	R1, [R1, #0]
ANDS	R1, R0
UXTH	R1, R1
; RTC_IT end address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L__RTC_GetITStatus48
CMP	R2, #0
IT	EQ
BEQ	L__RTC_GetITStatus47
; bitstatus end address is: 8 (R2)
L__RTC_GetITStatus46:
;stm32f10x_rtc.c,300 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_rtc.c,301 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_RTC_GetITStatus38
;stm32f10x_rtc.c,298 :: 		if (((RTC->CRH & RTC_IT) != (uint16_t)RESET) && (bitstatus != (uint16_t)RESET))
L__RTC_GetITStatus48:
L__RTC_GetITStatus47:
;stm32f10x_rtc.c,304 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_rtc.c,305 :: 		}
L_RTC_GetITStatus38:
;stm32f10x_rtc.c,306 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_rtc.c,307 :: 		}
L_end_RTC_GetITStatus:
BX	LR
; end of _RTC_GetITStatus
_RTC_ClearITPendingBit:
;stm32f10x_rtc.c,318 :: 		void RTC_ClearITPendingBit(uint16_t RTC_IT)
; RTC_IT start address is: 0 (R0)
; RTC_IT end address is: 0 (R0)
; RTC_IT start address is: 0 (R0)
;stm32f10x_rtc.c,324 :: 		RTC->CRL &= (uint16_t)~RTC_IT;
MVN	R3, R0
UXTH	R3, R3
; RTC_IT end address is: 0 (R0)
MOVW	R2, #10244
MOVT	R2, #16384
LDRH	R1, [R2, #0]
ANDS	R1, R3
STRH	R1, [R2, #0]
;stm32f10x_rtc.c,325 :: 		}
L_end_RTC_ClearITPendingBit:
BX	LR
; end of _RTC_ClearITPendingBit
