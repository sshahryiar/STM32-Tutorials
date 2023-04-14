stm32f10x_rcc_NVIC_SetPriorityGrouping:
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
; end of stm32f10x_rcc_NVIC_SetPriorityGrouping
stm32f10x_rcc_NVIC_GetPriorityGrouping:
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
; end of stm32f10x_rcc_NVIC_GetPriorityGrouping
stm32f10x_rcc_NVIC_EnableIRQ:
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
; end of stm32f10x_rcc_NVIC_EnableIRQ
stm32f10x_rcc_NVIC_DisableIRQ:
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
; end of stm32f10x_rcc_NVIC_DisableIRQ
stm32f10x_rcc_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f10x_rcc_NVIC_GetPendingIRQ0
; ?FLOC__stm32f10x_rcc_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_rcc_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_rcc_NVIC_GetPendingIRQ1
L_stm32f10x_rcc_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f10x_rcc_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_rcc_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
L_stm32f10x_rcc_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f10x_rcc_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_rcc_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1593 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f10x_rcc_NVIC_GetPendingIRQ
stm32f10x_rcc_NVIC_SetPendingIRQ:
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
; end of stm32f10x_rcc_NVIC_SetPendingIRQ
stm32f10x_rcc_NVIC_ClearPendingIRQ:
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
; end of stm32f10x_rcc_NVIC_ClearPendingIRQ
stm32f10x_rcc_NVIC_GetActive:
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
BEQ	L_stm32f10x_rcc_NVIC_GetActive2
; ?FLOC__stm32f10x_rcc_NVIC_GetActive?T72 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_rcc_NVIC_GetActive?T72 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_rcc_NVIC_GetActive3
L_stm32f10x_rcc_NVIC_GetActive2:
; ?FLOC__stm32f10x_rcc_NVIC_GetActive?T72 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_rcc_NVIC_GetActive?T72 end address is: 0 (R0)
L_stm32f10x_rcc_NVIC_GetActive3:
; ?FLOC__stm32f10x_rcc_NVIC_GetActive?T72 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_rcc_NVIC_GetActive?T72 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1633 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f10x_rcc_NVIC_GetActive
stm32f10x_rcc_NVIC_SetPriority:
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
BGE	L_stm32f10x_rcc_NVIC_SetPriority4
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
BAL	L_stm32f10x_rcc_NVIC_SetPriority5
L_stm32f10x_rcc_NVIC_SetPriority4:
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
L_stm32f10x_rcc_NVIC_SetPriority5:
;core_cm3.h,1653 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f10x_rcc_NVIC_SetPriority
stm32f10x_rcc_NVIC_GetPriority:
;core_cm3.h,1670 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1673 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f10x_rcc_NVIC_GetPriority6
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
L_stm32f10x_rcc_NVIC_GetPriority6:
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
; end of stm32f10x_rcc_NVIC_GetPriority
stm32f10x_rcc_NVIC_EncodePriority:
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
BLS	L_stm32f10x_rcc_NVIC_EncodePriority8
; ?FLOC__stm32f10x_rcc_NVIC_EncodePriority?T112 start address is: 12 (R3)
MOVW	R3, #4
; ?FLOC__stm32f10x_rcc_NVIC_EncodePriority?T112 end address is: 12 (R3)
IT	AL
BAL	L_stm32f10x_rcc_NVIC_EncodePriority9
L_stm32f10x_rcc_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f10x_rcc_NVIC_EncodePriority?T112 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_rcc_NVIC_EncodePriority?T112 end address is: 0 (R0)
MOV	R3, R0
L_stm32f10x_rcc_NVIC_EncodePriority9:
; ?FLOC__stm32f10x_rcc_NVIC_EncodePriority?T112 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_rcc_NVIC_EncodePriority?T112 end address is: 12 (R3)
;core_cm3.h,1702 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f10x_rcc_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f10x_rcc_NVIC_EncodePriority?T116 start address is: 20 (R5)
MOVW	R5, #0
; ?FLOC__stm32f10x_rcc_NVIC_EncodePriority?T116 end address is: 20 (R5)
IT	AL
BAL	L_stm32f10x_rcc_NVIC_EncodePriority11
L_stm32f10x_rcc_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f10x_rcc_NVIC_EncodePriority?T116 start address is: 20 (R5)
; ?FLOC__stm32f10x_rcc_NVIC_EncodePriority?T116 end address is: 20 (R5)
L_stm32f10x_rcc_NVIC_EncodePriority11:
;core_cm3.h,1705 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f10x_rcc_NVIC_EncodePriority?T116 start address is: 20 (R5)
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
; ?FLOC__stm32f10x_rcc_NVIC_EncodePriority?T116 end address is: 20 (R5)
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
; end of stm32f10x_rcc_NVIC_EncodePriority
stm32f10x_rcc_NVIC_DecodePriority:
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
BLS	L_stm32f10x_rcc_NVIC_DecodePriority12
; ?FLOC__stm32f10x_rcc_NVIC_DecodePriority?T130 start address is: 16 (R4)
MOVW	R4, #4
; ?FLOC__stm32f10x_rcc_NVIC_DecodePriority?T130 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_rcc_NVIC_DecodePriority13
L_stm32f10x_rcc_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f10x_rcc_NVIC_DecodePriority?T130 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_rcc_NVIC_DecodePriority?T130 end address is: 4 (R1)
MOV	R4, R1
L_stm32f10x_rcc_NVIC_DecodePriority13:
; ?FLOC__stm32f10x_rcc_NVIC_DecodePriority?T130 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_rcc_NVIC_DecodePriority?T130 end address is: 16 (R4)
;core_cm3.h,1733 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f10x_rcc_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f10x_rcc_NVIC_DecodePriority?T134 start address is: 16 (R4)
MOVW	R4, #0
; ?FLOC__stm32f10x_rcc_NVIC_DecodePriority?T134 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_rcc_NVIC_DecodePriority15
L_stm32f10x_rcc_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f10x_rcc_NVIC_DecodePriority?T134 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f10x_rcc_NVIC_DecodePriority?T134 end address is: 20 (R5)
MOV	R4, R5
L_stm32f10x_rcc_NVIC_DecodePriority15:
; ?FLOC__stm32f10x_rcc_NVIC_DecodePriority?T134 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm3.h,1735 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f10x_rcc_NVIC_DecodePriority?T134 end address is: 16 (R4)
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
; end of stm32f10x_rcc_NVIC_DecodePriority
stm32f10x_rcc_SysTick_Config:
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
BLS	L_stm32f10x_rcc_SysTick_Config16
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f10x_rcc_SysTick_Config16:
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
BL	stm32f10x_rcc_NVIC_SetPriority+0
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
; end of stm32f10x_rcc_SysTick_Config
stm32f10x_rcc_NVIC_SystemReset:
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
L_stm32f10x_rcc_NVIC_SystemReset17:
IT	AL
BAL	L_stm32f10x_rcc_NVIC_SystemReset17
;core_cm3.h,1787 :: 		}
L_end_NVIC_SystemReset:
BX	LR
; end of stm32f10x_rcc_NVIC_SystemReset
stm32f10x_rcc_ITM_SendChar:
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
BEQ	L_stm32f10x_rcc_ITM_SendChar78
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_rcc_ITM_SendChar79
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_rcc_ITM_SendChar80
L_stm32f10x_rcc_ITM_SendChar74:
;core_cm3.h,1823 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f10x_rcc_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f10x_rcc_ITM_SendChar23
IT	AL
BAL	L_stm32f10x_rcc_ITM_SendChar22
L_stm32f10x_rcc_ITM_SendChar23:
;core_cm3.h,1824 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm3.h,1820 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f10x_rcc_ITM_SendChar77
L_stm32f10x_rcc_ITM_SendChar78:
L_stm32f10x_rcc_ITM_SendChar77:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_rcc_ITM_SendChar76
L_stm32f10x_rcc_ITM_SendChar79:
L_stm32f10x_rcc_ITM_SendChar76:
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_rcc_ITM_SendChar75
L_stm32f10x_rcc_ITM_SendChar80:
L_stm32f10x_rcc_ITM_SendChar75:
;core_cm3.h,1826 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm3.h,1827 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f10x_rcc_ITM_SendChar
stm32f10x_rcc_ITM_ReceiveChar:
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
BEQ	L_stm32f10x_rcc_ITM_ReceiveChar24
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
L_stm32f10x_rcc_ITM_ReceiveChar24:
;core_cm3.h,1847 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm3.h,1848 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f10x_rcc_ITM_ReceiveChar
stm32f10x_rcc_ITM_CheckChar:
;core_cm3.h,1859 :: 		static __INLINE int ITM_CheckChar (void) {
;core_cm3.h,1861 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f10x_rcc_ITM_CheckChar25
;core_cm3.h,1862 :: 		return (0);                                 /* no character available */
MOVW	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm3.h,1863 :: 		} else {
L_stm32f10x_rcc_ITM_CheckChar25:
;core_cm3.h,1864 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm3.h,1866 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f10x_rcc_ITM_CheckChar
_RCC_DeInit:
;stm32f10x_rcc.c,217 :: 		void RCC_DeInit(void)
;stm32f10x_rcc.c,220 :: 		RCC->CR |= (uint32_t)0x00000001;
MOVW	R5, #4096
MOVT	R5, #16386
LDR	R0, [R5, #0]
ORR	R4, R0, #1
STR	R4, [R5, #0]
;stm32f10x_rcc.c,224 :: 		RCC->CFGR &= (uint32_t)0xF8FF0000;
MOVW	R3, #4100
MOVT	R3, #16386
LDR	R1, [R3, #0]
MOVW	R0, #0
MOVT	R0, #63743
AND	R2, R1, R0, LSL #0
STR	R2, [R3, #0]
;stm32f10x_rcc.c,230 :: 		RCC->CR &= (uint32_t)0xFEF6FFFF;
MOVW	R0, #65535
MOVT	R0, #65270
AND	R1, R4, R0, LSL #0
STR	R1, [R5, #0]
;stm32f10x_rcc.c,233 :: 		RCC->CR &= (uint32_t)0xFFFBFFFF;
MVN	R0, #262144
AND	R0, R1, R0, LSL #0
STR	R0, [R5, #0]
;stm32f10x_rcc.c,236 :: 		RCC->CFGR &= (uint32_t)0xFF80FFFF;
MVN	R0, #8323072
AND	R0, R2, R0, LSL #0
STR	R0, [R3, #0]
;stm32f10x_rcc.c,255 :: 		RCC->CIR = 0x009F0000;
MOV	R1, #10420224
MOVW	R0, #4104
MOVT	R0, #16386
STR	R1, [R0, #0]
;stm32f10x_rcc.c,258 :: 		}
L_end_RCC_DeInit:
BX	LR
; end of _RCC_DeInit
_RCC_HSEConfig:
;stm32f10x_rcc.c,270 :: 		void RCC_HSEConfig(uint32_t RCC_HSE)
; RCC_HSE start address is: 0 (R0)
; RCC_HSE end address is: 0 (R0)
; RCC_HSE start address is: 0 (R0)
;stm32f10x_rcc.c,276 :: 		RCC->CR &= CR_HSEON_Reset;
MOVW	R3, #4096
MOVT	R3, #16386
LDR	R2, [R3, #0]
MVN	R1, #65536
ANDS	R2, R1
STR	R2, [R3, #0]
;stm32f10x_rcc.c,278 :: 		RCC->CR &= CR_HSEBYP_Reset;
MVN	R1, #262144
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f10x_rcc.c,280 :: 		switch(RCC_HSE)
IT	AL
BAL	L_RCC_HSEConfig27
; RCC_HSE end address is: 0 (R0)
;stm32f10x_rcc.c,282 :: 		case RCC_HSE_ON:
L_RCC_HSEConfig29:
;stm32f10x_rcc.c,284 :: 		RCC->CR |= CR_HSEON_Set;
MOVW	R2, #4096
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORR	R1, R1, #65536
STR	R1, [R2, #0]
;stm32f10x_rcc.c,285 :: 		break;
IT	AL
BAL	L_RCC_HSEConfig28
;stm32f10x_rcc.c,287 :: 		case RCC_HSE_Bypass:
L_RCC_HSEConfig30:
;stm32f10x_rcc.c,289 :: 		RCC->CR |= CR_HSEBYP_Set | CR_HSEON_Set;
MOVW	R2, #4096
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORR	R1, R1, #327680
STR	R1, [R2, #0]
;stm32f10x_rcc.c,290 :: 		break;
IT	AL
BAL	L_RCC_HSEConfig28
;stm32f10x_rcc.c,292 :: 		default:
L_RCC_HSEConfig31:
;stm32f10x_rcc.c,293 :: 		break;
IT	AL
BAL	L_RCC_HSEConfig28
;stm32f10x_rcc.c,294 :: 		}
L_RCC_HSEConfig27:
; RCC_HSE start address is: 0 (R0)
CMP	R0, #65536
IT	EQ
BEQ	L_RCC_HSEConfig29
CMP	R0, #262144
IT	EQ
BEQ	L_RCC_HSEConfig30
; RCC_HSE end address is: 0 (R0)
IT	AL
BAL	L_RCC_HSEConfig31
L_RCC_HSEConfig28:
;stm32f10x_rcc.c,295 :: 		}
L_end_RCC_HSEConfig:
BX	LR
; end of _RCC_HSEConfig
_RCC_WaitForHSEStartUp:
;stm32f10x_rcc.c,304 :: 		ErrorStatus RCC_WaitForHSEStartUp(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;stm32f10x_rcc.c,306 :: 		__IO uint32_t StartUpCounter = 0;
; StartUpCounter start address is: 12 (R3)
MOV	R3, #0
;stm32f10x_rcc.c,307 :: 		ErrorStatus status = ERROR;
;stm32f10x_rcc.c,308 :: 		FlagStatus HSEStatus = RESET;
; StartUpCounter end address is: 12 (R3)
;stm32f10x_rcc.c,311 :: 		do
L_RCC_WaitForHSEStartUp32:
;stm32f10x_rcc.c,313 :: 		HSEStatus = RCC_GetFlagStatus(RCC_FLAG_HSERDY);
; StartUpCounter start address is: 12 (R3)
MOVS	R0, #49
BL	_RCC_GetFlagStatus+0
; HSEStatus start address is: 4 (R1)
UXTB	R1, R0
;stm32f10x_rcc.c,314 :: 		StartUpCounter++;
ADDS	R0, R3, #1
MOV	R3, R0
;stm32f10x_rcc.c,315 :: 		} while((StartUpCounter != HSE_STARTUP_TIMEOUT) && (HSEStatus == RESET));
CMP	R3, #1280
IT	EQ
BEQ	L__RCC_WaitForHSEStartUp83
CMP	R1, #0
IT	NE
BNE	L__RCC_WaitForHSEStartUp82
; HSEStatus end address is: 4 (R1)
; StartUpCounter end address is: 12 (R3)
IT	AL
BAL	L_RCC_WaitForHSEStartUp32
L__RCC_WaitForHSEStartUp83:
L__RCC_WaitForHSEStartUp82:
;stm32f10x_rcc.c,317 :: 		if (RCC_GetFlagStatus(RCC_FLAG_HSERDY) != RESET)
MOVS	R0, #49
BL	_RCC_GetFlagStatus+0
CMP	R0, #0
IT	EQ
BEQ	L_RCC_WaitForHSEStartUp37
;stm32f10x_rcc.c,319 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_rcc.c,320 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_RCC_WaitForHSEStartUp38
L_RCC_WaitForHSEStartUp37:
;stm32f10x_rcc.c,323 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
; status end address is: 0 (R0)
;stm32f10x_rcc.c,324 :: 		}
L_RCC_WaitForHSEStartUp38:
;stm32f10x_rcc.c,325 :: 		return (status);
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f10x_rcc.c,326 :: 		}
L_end_RCC_WaitForHSEStartUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RCC_WaitForHSEStartUp
_RCC_AdjustHSICalibrationValue:
;stm32f10x_rcc.c,334 :: 		void RCC_AdjustHSICalibrationValue(uint8_t HSICalibrationValue)
; HSICalibrationValue start address is: 0 (R0)
; HSICalibrationValue end address is: 0 (R0)
; HSICalibrationValue start address is: 0 (R0)
;stm32f10x_rcc.c,336 :: 		uint32_t tmpreg = 0;
;stm32f10x_rcc.c,341 :: 		tmpreg &= CR_HSITRIM_Mask;
MOVW	R3, #4096
MOVT	R3, #16386
LDR	R2, [R3, #0]
MVN	R1, #248
ANDS	R2, R1
;stm32f10x_rcc.c,343 :: 		tmpreg |= (uint32_t)HSICalibrationValue << 3;
UXTB	R1, R0
; HSICalibrationValue end address is: 0 (R0)
LSLS	R1, R1, #3
ORR	R1, R2, R1, LSL #0
;stm32f10x_rcc.c,345 :: 		RCC->CR = tmpreg;
STR	R1, [R3, #0]
;stm32f10x_rcc.c,346 :: 		}
L_end_RCC_AdjustHSICalibrationValue:
BX	LR
; end of _RCC_AdjustHSICalibrationValue
_RCC_HSICmd:
;stm32f10x_rcc.c,354 :: 		void RCC_HSICmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f10x_rcc.c,358 :: 		*(__IO uint32_t *) CR_HSION_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1111621632
MOVT	R1, 16962
STR	R2, [R1, #0]
;stm32f10x_rcc.c,359 :: 		}
L_end_RCC_HSICmd:
BX	LR
; end of _RCC_HSICmd
_RCC_PLLConfig:
;stm32f10x_rcc.c,378 :: 		void RCC_PLLConfig(uint32_t RCC_PLLSource, uint32_t RCC_PLLMul)
; RCC_PLLMul start address is: 4 (R1)
; RCC_PLLSource start address is: 0 (R0)
; RCC_PLLMul end address is: 4 (R1)
; RCC_PLLSource end address is: 0 (R0)
; RCC_PLLSource start address is: 0 (R0)
; RCC_PLLMul start address is: 4 (R1)
;stm32f10x_rcc.c,380 :: 		uint32_t tmpreg = 0;
;stm32f10x_rcc.c,388 :: 		tmpreg &= CFGR_PLL_Mask;
MOVW	R4, #4100
MOVT	R4, #16386
LDR	R3, [R4, #0]
MVN	R2, #4128768
ANDS	R3, R2
;stm32f10x_rcc.c,390 :: 		tmpreg |= RCC_PLLSource | RCC_PLLMul;
ORR	R2, R0, R1, LSL #0
; RCC_PLLSource end address is: 0 (R0)
; RCC_PLLMul end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f10x_rcc.c,392 :: 		RCC->CFGR = tmpreg;
STR	R2, [R4, #0]
;stm32f10x_rcc.c,393 :: 		}
L_end_RCC_PLLConfig:
BX	LR
; end of _RCC_PLLConfig
_RCC_PLLCmd:
;stm32f10x_rcc.c,401 :: 		void RCC_PLLCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f10x_rcc.c,406 :: 		*(__IO uint32_t *) CR_PLLON_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1111621728
MOVT	R1, 16962
STR	R2, [R1, #0]
;stm32f10x_rcc.c,407 :: 		}
L_end_RCC_PLLCmd:
BX	LR
; end of _RCC_PLLCmd
_RCC_SYSCLKConfig:
;stm32f10x_rcc.c,564 :: 		void RCC_SYSCLKConfig(uint32_t RCC_SYSCLKSource)
; RCC_SYSCLKSource start address is: 0 (R0)
; RCC_SYSCLKSource end address is: 0 (R0)
; RCC_SYSCLKSource start address is: 0 (R0)
;stm32f10x_rcc.c,566 :: 		uint32_t tmpreg = 0;
;stm32f10x_rcc.c,571 :: 		tmpreg &= CFGR_SW_Mask;
MOVW	R3, #4100
MOVT	R3, #16386
LDR	R2, [R3, #0]
MVN	R1, #3
AND	R1, R2, R1, LSL #0
;stm32f10x_rcc.c,573 :: 		tmpreg |= RCC_SYSCLKSource;
ORRS	R1, R0
; RCC_SYSCLKSource end address is: 0 (R0)
;stm32f10x_rcc.c,575 :: 		RCC->CFGR = tmpreg;
STR	R1, [R3, #0]
;stm32f10x_rcc.c,576 :: 		}
L_end_RCC_SYSCLKConfig:
BX	LR
; end of _RCC_SYSCLKConfig
_RCC_GetSYSCLKSource:
;stm32f10x_rcc.c,587 :: 		uint8_t RCC_GetSYSCLKSource(void)
;stm32f10x_rcc.c,589 :: 		return ((uint8_t)(RCC->CFGR & CFGR_SWS_Mask));
MOVW	R0, #4100
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #12
UXTB	R0, R0
;stm32f10x_rcc.c,590 :: 		}
L_end_RCC_GetSYSCLKSource:
BX	LR
; end of _RCC_GetSYSCLKSource
_RCC_HCLKConfig:
;stm32f10x_rcc.c,608 :: 		void RCC_HCLKConfig(uint32_t RCC_SYSCLK)
; RCC_SYSCLK start address is: 0 (R0)
; RCC_SYSCLK end address is: 0 (R0)
; RCC_SYSCLK start address is: 0 (R0)
;stm32f10x_rcc.c,610 :: 		uint32_t tmpreg = 0;
;stm32f10x_rcc.c,615 :: 		tmpreg &= CFGR_HPRE_Reset_Mask;
MOVW	R3, #4100
MOVT	R3, #16386
LDR	R2, [R3, #0]
MVN	R1, #240
AND	R1, R2, R1, LSL #0
;stm32f10x_rcc.c,617 :: 		tmpreg |= RCC_SYSCLK;
ORRS	R1, R0
; RCC_SYSCLK end address is: 0 (R0)
;stm32f10x_rcc.c,619 :: 		RCC->CFGR = tmpreg;
STR	R1, [R3, #0]
;stm32f10x_rcc.c,620 :: 		}
L_end_RCC_HCLKConfig:
BX	LR
; end of _RCC_HCLKConfig
_RCC_PCLK1Config:
;stm32f10x_rcc.c,634 :: 		void RCC_PCLK1Config(uint32_t RCC_HCLK)
; RCC_HCLK start address is: 0 (R0)
; RCC_HCLK end address is: 0 (R0)
; RCC_HCLK start address is: 0 (R0)
;stm32f10x_rcc.c,636 :: 		uint32_t tmpreg = 0;
;stm32f10x_rcc.c,641 :: 		tmpreg &= CFGR_PPRE1_Reset_Mask;
MOVW	R3, #4100
MOVT	R3, #16386
LDR	R2, [R3, #0]
MVN	R1, #1792
AND	R1, R2, R1, LSL #0
;stm32f10x_rcc.c,643 :: 		tmpreg |= RCC_HCLK;
ORRS	R1, R0
; RCC_HCLK end address is: 0 (R0)
;stm32f10x_rcc.c,645 :: 		RCC->CFGR = tmpreg;
STR	R1, [R3, #0]
;stm32f10x_rcc.c,646 :: 		}
L_end_RCC_PCLK1Config:
BX	LR
; end of _RCC_PCLK1Config
_RCC_PCLK2Config:
;stm32f10x_rcc.c,660 :: 		void RCC_PCLK2Config(uint32_t RCC_HCLK)
; RCC_HCLK start address is: 0 (R0)
; RCC_HCLK end address is: 0 (R0)
; RCC_HCLK start address is: 0 (R0)
;stm32f10x_rcc.c,662 :: 		uint32_t tmpreg = 0;
;stm32f10x_rcc.c,667 :: 		tmpreg &= CFGR_PPRE2_Reset_Mask;
MOVW	R3, #4100
MOVT	R3, #16386
LDR	R2, [R3, #0]
MVN	R1, #14336
ANDS	R2, R1
;stm32f10x_rcc.c,669 :: 		tmpreg |= RCC_HCLK << 3;
LSLS	R1, R0, #3
; RCC_HCLK end address is: 0 (R0)
ORR	R1, R2, R1, LSL #0
;stm32f10x_rcc.c,671 :: 		RCC->CFGR = tmpreg;
STR	R1, [R3, #0]
;stm32f10x_rcc.c,672 :: 		}
L_end_RCC_PCLK2Config:
BX	LR
; end of _RCC_PCLK2Config
_RCC_ITConfig:
;stm32f10x_rcc.c,700 :: 		void RCC_ITConfig(uint8_t RCC_IT, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_IT start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_IT end address is: 0 (R0)
; RCC_IT start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_rcc.c,705 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_ITConfig39
; NewState end address is: 4 (R1)
;stm32f10x_rcc.c,708 :: 		*(__IO uint8_t *) CIR_BYTE2_ADDRESS |= RCC_IT;
MOVW	R2, 1073877001
MOVT	R2, 16386
LDRB	R2, [R2, #0]
ORR	R3, R2, R0, LSL #0
; RCC_IT end address is: 0 (R0)
MOVW	R2, 1073877001
MOVT	R2, 16386
STRB	R3, [R2, #0]
;stm32f10x_rcc.c,709 :: 		}
IT	AL
BAL	L_RCC_ITConfig40
L_RCC_ITConfig39:
;stm32f10x_rcc.c,713 :: 		*(__IO uint8_t *) CIR_BYTE2_ADDRESS &= (uint8_t)~RCC_IT;
; RCC_IT start address is: 0 (R0)
MVN	R3, R0
UXTB	R3, R3
; RCC_IT end address is: 0 (R0)
MOVW	R2, 1073877001
MOVT	R2, 16386
LDRB	R2, [R2, #0]
AND	R3, R2, R3, LSL #0
MOVW	R2, 1073877001
MOVT	R2, 16386
STRB	R3, [R2, #0]
;stm32f10x_rcc.c,714 :: 		}
L_RCC_ITConfig40:
;stm32f10x_rcc.c,715 :: 		}
L_end_RCC_ITConfig:
BX	LR
; end of _RCC_ITConfig
_RCC_USBCLKConfig:
;stm32f10x_rcc.c,728 :: 		void RCC_USBCLKConfig(uint32_t RCC_USBCLKSource)
; RCC_USBCLKSource start address is: 0 (R0)
; RCC_USBCLKSource end address is: 0 (R0)
; RCC_USBCLKSource start address is: 0 (R0)
;stm32f10x_rcc.c,733 :: 		*(__IO uint32_t *) CFGR_USBPRE_BB = RCC_USBCLKSource;
MOVW	R1, 1111621848
MOVT	R1, 16962
STR	R0, [R1, #0]
; RCC_USBCLKSource end address is: 0 (R0)
;stm32f10x_rcc.c,734 :: 		}
L_end_RCC_USBCLKConfig:
BX	LR
; end of _RCC_USBCLKConfig
_RCC_ADCCLKConfig:
;stm32f10x_rcc.c,766 :: 		void RCC_ADCCLKConfig(uint32_t RCC_PCLK2)
; RCC_PCLK2 start address is: 0 (R0)
; RCC_PCLK2 end address is: 0 (R0)
; RCC_PCLK2 start address is: 0 (R0)
;stm32f10x_rcc.c,768 :: 		uint32_t tmpreg = 0;
;stm32f10x_rcc.c,773 :: 		tmpreg &= CFGR_ADCPRE_Reset_Mask;
MOVW	R3, #4100
MOVT	R3, #16386
LDR	R2, [R3, #0]
MVN	R1, #49152
AND	R1, R2, R1, LSL #0
;stm32f10x_rcc.c,775 :: 		tmpreg |= RCC_PCLK2;
ORRS	R1, R0
; RCC_PCLK2 end address is: 0 (R0)
;stm32f10x_rcc.c,777 :: 		RCC->CFGR = tmpreg;
STR	R1, [R3, #0]
;stm32f10x_rcc.c,778 :: 		}
L_end_RCC_ADCCLKConfig:
BX	LR
; end of _RCC_ADCCLKConfig
_RCC_LSEConfig:
;stm32f10x_rcc.c,829 :: 		void RCC_LSEConfig(uint8_t RCC_LSE)
; RCC_LSE start address is: 0 (R0)
; RCC_LSE end address is: 0 (R0)
; RCC_LSE start address is: 0 (R0)
;stm32f10x_rcc.c,835 :: 		*(__IO uint8_t *) BDCR_ADDRESS = RCC_LSE_OFF;
MOVS	R2, #0
MOVW	R1, 1073877024
MOVT	R1, 16386
STRB	R2, [R1, #0]
;stm32f10x_rcc.c,837 :: 		*(__IO uint8_t *) BDCR_ADDRESS = RCC_LSE_OFF;
MOVS	R2, #0
MOVW	R1, 1073877024
MOVT	R1, 16386
STRB	R2, [R1, #0]
;stm32f10x_rcc.c,839 :: 		switch(RCC_LSE)
IT	AL
BAL	L_RCC_LSEConfig41
; RCC_LSE end address is: 0 (R0)
;stm32f10x_rcc.c,841 :: 		case RCC_LSE_ON:
L_RCC_LSEConfig43:
;stm32f10x_rcc.c,843 :: 		*(__IO uint8_t *) BDCR_ADDRESS = RCC_LSE_ON;
MOVS	R2, #1
MOVW	R1, 1073877024
MOVT	R1, 16386
STRB	R2, [R1, #0]
;stm32f10x_rcc.c,844 :: 		break;
IT	AL
BAL	L_RCC_LSEConfig42
;stm32f10x_rcc.c,846 :: 		case RCC_LSE_Bypass:
L_RCC_LSEConfig44:
;stm32f10x_rcc.c,848 :: 		*(__IO uint8_t *) BDCR_ADDRESS = RCC_LSE_Bypass | RCC_LSE_ON;
MOVS	R2, #5
MOVW	R1, 1073877024
MOVT	R1, 16386
STRB	R2, [R1, #0]
;stm32f10x_rcc.c,849 :: 		break;
IT	AL
BAL	L_RCC_LSEConfig42
;stm32f10x_rcc.c,851 :: 		default:
L_RCC_LSEConfig45:
;stm32f10x_rcc.c,852 :: 		break;
IT	AL
BAL	L_RCC_LSEConfig42
;stm32f10x_rcc.c,853 :: 		}
L_RCC_LSEConfig41:
; RCC_LSE start address is: 0 (R0)
CMP	R0, #1
IT	EQ
BEQ	L_RCC_LSEConfig43
CMP	R0, #4
IT	EQ
BEQ	L_RCC_LSEConfig44
; RCC_LSE end address is: 0 (R0)
IT	AL
BAL	L_RCC_LSEConfig45
L_RCC_LSEConfig42:
;stm32f10x_rcc.c,854 :: 		}
L_end_RCC_LSEConfig:
BX	LR
; end of _RCC_LSEConfig
_RCC_LSICmd:
;stm32f10x_rcc.c,862 :: 		void RCC_LSICmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f10x_rcc.c,866 :: 		*(__IO uint32_t *) CSR_LSION_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1111622784
MOVT	R1, 16962
STR	R2, [R1, #0]
;stm32f10x_rcc.c,867 :: 		}
L_end_RCC_LSICmd:
BX	LR
; end of _RCC_LSICmd
_RCC_RTCCLKConfig:
;stm32f10x_rcc.c,879 :: 		void RCC_RTCCLKConfig(uint32_t RCC_RTCCLKSource)
; RCC_RTCCLKSource start address is: 0 (R0)
; RCC_RTCCLKSource end address is: 0 (R0)
; RCC_RTCCLKSource start address is: 0 (R0)
;stm32f10x_rcc.c,884 :: 		RCC->BDCR |= RCC_RTCCLKSource;
MOVW	R2, #4128
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORRS	R1, R0
; RCC_RTCCLKSource end address is: 0 (R0)
STR	R1, [R2, #0]
;stm32f10x_rcc.c,885 :: 		}
L_end_RCC_RTCCLKConfig:
BX	LR
; end of _RCC_RTCCLKConfig
_RCC_RTCCLKCmd:
;stm32f10x_rcc.c,893 :: 		void RCC_RTCCLKCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f10x_rcc.c,897 :: 		*(__IO uint32_t *) BDCR_RTCEN_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1111622716
MOVT	R1, 16962
STR	R2, [R1, #0]
;stm32f10x_rcc.c,898 :: 		}
L_end_RCC_RTCCLKCmd:
BX	LR
; end of _RCC_RTCCLKCmd
_RCC_GetClocksFreq:
;stm32f10x_rcc.c,908 :: 		void RCC_GetClocksFreq(RCC_ClocksTypeDef* RCC_Clocks)
; RCC_Clocks start address is: 0 (R0)
; RCC_Clocks end address is: 0 (R0)
; RCC_Clocks start address is: 0 (R0)
;stm32f10x_rcc.c,910 :: 		uint32_t tmp = 0, pllmull = 0, pllsource = 0, presc = 0;
;stm32f10x_rcc.c,921 :: 		tmp = RCC->CFGR & CFGR_SWS_Mask;
MOVW	R1, #4100
MOVT	R1, #16386
LDR	R1, [R1, #0]
AND	R1, R1, #12
; tmp start address is: 4 (R1)
;stm32f10x_rcc.c,923 :: 		switch (tmp)
IT	AL
BAL	L_RCC_GetClocksFreq46
; tmp end address is: 4 (R1)
;stm32f10x_rcc.c,925 :: 		case 0x00:  /* HSI used as system clock */
L_RCC_GetClocksFreq48:
;stm32f10x_rcc.c,926 :: 		RCC_Clocks->SYSCLK_Frequency = HSI_VALUE;
MOVW	R1, #4608
MOVT	R1, #122
STR	R1, [R0, #0]
;stm32f10x_rcc.c,927 :: 		break;
IT	AL
BAL	L_RCC_GetClocksFreq47
;stm32f10x_rcc.c,928 :: 		case 0x04:  /* HSE used as system clock */
L_RCC_GetClocksFreq49:
;stm32f10x_rcc.c,929 :: 		RCC_Clocks->SYSCLK_Frequency = HSE_VALUE;
MOVW	R1, #4608
MOVT	R1, #122
STR	R1, [R0, #0]
;stm32f10x_rcc.c,930 :: 		break;
IT	AL
BAL	L_RCC_GetClocksFreq47
;stm32f10x_rcc.c,931 :: 		case 0x08:  /* PLL used as system clock */
L_RCC_GetClocksFreq50:
;stm32f10x_rcc.c,934 :: 		pllmull = RCC->CFGR & CFGR_PLLMull_Mask;
MOVW	R2, #4100
MOVT	R2, #16386
LDR	R1, [R2, #0]
AND	R3, R1, #3932160
;stm32f10x_rcc.c,935 :: 		pllsource = RCC->CFGR & CFGR_PLLSRC_Mask;
MOV	R1, R2
LDR	R1, [R1, #0]
AND	R2, R1, #65536
;stm32f10x_rcc.c,938 :: 		pllmull = ( pllmull >> 18) + 2;
LSRS	R1, R3, #18
ADDS	R1, R1, #2
; pllmull start address is: 12 (R3)
MOV	R3, R1
;stm32f10x_rcc.c,940 :: 		if (pllsource == 0x00)
CMP	R2, #0
IT	NE
BNE	L_RCC_GetClocksFreq51
;stm32f10x_rcc.c,942 :: 		RCC_Clocks->SYSCLK_Frequency = (HSI_VALUE >> 1) * pllmull;
MOV	R2, R0
MOVW	R1, #2304
MOVT	R1, #61
MULS	R1, R3, R1
; pllmull end address is: 12 (R3)
STR	R1, [R2, #0]
;stm32f10x_rcc.c,943 :: 		}
IT	AL
BAL	L_RCC_GetClocksFreq52
L_RCC_GetClocksFreq51:
;stm32f10x_rcc.c,952 :: 		if ((RCC->CFGR & CFGR_PLLXTPRE_Mask) != (uint32_t)RESET)
; pllmull start address is: 12 (R3)
MOVW	R1, #4100
MOVT	R1, #16386
LDR	R1, [R1, #0]
AND	R1, R1, #131072
CMP	R1, #0
IT	EQ
BEQ	L_RCC_GetClocksFreq53
;stm32f10x_rcc.c,954 :: 		RCC_Clocks->SYSCLK_Frequency = (HSE_VALUE >> 1) * pllmull;
MOV	R2, R0
MOVW	R1, #2304
MOVT	R1, #61
MULS	R1, R3, R1
; pllmull end address is: 12 (R3)
STR	R1, [R2, #0]
;stm32f10x_rcc.c,955 :: 		}
IT	AL
BAL	L_RCC_GetClocksFreq54
L_RCC_GetClocksFreq53:
;stm32f10x_rcc.c,958 :: 		RCC_Clocks->SYSCLK_Frequency = HSE_VALUE * pllmull;
; pllmull start address is: 12 (R3)
MOV	R2, R0
MOVW	R1, #4608
MOVT	R1, #122
MULS	R1, R3, R1
; pllmull end address is: 12 (R3)
STR	R1, [R2, #0]
;stm32f10x_rcc.c,959 :: 		}
L_RCC_GetClocksFreq54:
;stm32f10x_rcc.c,961 :: 		}
L_RCC_GetClocksFreq52:
;stm32f10x_rcc.c,999 :: 		break;
IT	AL
BAL	L_RCC_GetClocksFreq47
;stm32f10x_rcc.c,1001 :: 		default:
L_RCC_GetClocksFreq55:
;stm32f10x_rcc.c,1002 :: 		RCC_Clocks->SYSCLK_Frequency = HSI_VALUE;
MOVW	R1, #4608
MOVT	R1, #122
STR	R1, [R0, #0]
;stm32f10x_rcc.c,1003 :: 		break;
IT	AL
BAL	L_RCC_GetClocksFreq47
;stm32f10x_rcc.c,1004 :: 		}
L_RCC_GetClocksFreq46:
; tmp start address is: 4 (R1)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_GetClocksFreq48
CMP	R1, #4
IT	EQ
BEQ	L_RCC_GetClocksFreq49
CMP	R1, #8
IT	EQ
BEQ	L_RCC_GetClocksFreq50
; tmp end address is: 4 (R1)
IT	AL
BAL	L_RCC_GetClocksFreq55
L_RCC_GetClocksFreq47:
;stm32f10x_rcc.c,1008 :: 		tmp = RCC->CFGR & CFGR_HPRE_Set_Mask;
MOVW	R3, #4100
MOVT	R3, #16386
LDR	R1, [R3, #0]
AND	R1, R1, #240
;stm32f10x_rcc.c,1009 :: 		tmp = tmp >> 4;
LSRS	R2, R1, #4
;stm32f10x_rcc.c,1010 :: 		presc = APBAHBPrescTable[tmp];
MOVW	R1, #lo_addr(stm32f10x_rcc_APBAHBPrescTable+0)
MOVT	R1, #hi_addr(stm32f10x_rcc_APBAHBPrescTable+0)
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
; presc start address is: 16 (R4)
UXTB	R4, R1
;stm32f10x_rcc.c,1012 :: 		RCC_Clocks->HCLK_Frequency = RCC_Clocks->SYSCLK_Frequency >> presc;
ADDS	R2, R0, #4
LDR	R1, [R0, #0]
LSRS	R1, R4
; presc end address is: 16 (R4)
STR	R1, [R2, #0]
;stm32f10x_rcc.c,1014 :: 		tmp = RCC->CFGR & CFGR_PPRE1_Set_Mask;
MOV	R1, R3
LDR	R1, [R1, #0]
AND	R1, R1, #1792
;stm32f10x_rcc.c,1015 :: 		tmp = tmp >> 8;
LSRS	R2, R1, #8
;stm32f10x_rcc.c,1016 :: 		presc = APBAHBPrescTable[tmp];
MOVW	R1, #lo_addr(stm32f10x_rcc_APBAHBPrescTable+0)
MOVT	R1, #hi_addr(stm32f10x_rcc_APBAHBPrescTable+0)
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
; presc start address is: 16 (R4)
UXTB	R4, R1
;stm32f10x_rcc.c,1018 :: 		RCC_Clocks->PCLK1_Frequency = RCC_Clocks->HCLK_Frequency >> presc;
ADDW	R2, R0, #8
ADDS	R1, R0, #4
LDR	R1, [R1, #0]
LSRS	R1, R4
; presc end address is: 16 (R4)
STR	R1, [R2, #0]
;stm32f10x_rcc.c,1020 :: 		tmp = RCC->CFGR & CFGR_PPRE2_Set_Mask;
MOV	R1, R3
LDR	R1, [R1, #0]
AND	R1, R1, #14336
;stm32f10x_rcc.c,1021 :: 		tmp = tmp >> 11;
LSRS	R2, R1, #11
;stm32f10x_rcc.c,1022 :: 		presc = APBAHBPrescTable[tmp];
MOVW	R1, #lo_addr(stm32f10x_rcc_APBAHBPrescTable+0)
MOVT	R1, #hi_addr(stm32f10x_rcc_APBAHBPrescTable+0)
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
; presc start address is: 16 (R4)
UXTB	R4, R1
;stm32f10x_rcc.c,1024 :: 		RCC_Clocks->PCLK2_Frequency = RCC_Clocks->HCLK_Frequency >> presc;
ADDW	R2, R0, #12
ADDS	R1, R0, #4
LDR	R1, [R1, #0]
LSRS	R1, R4
; presc end address is: 16 (R4)
STR	R1, [R2, #0]
;stm32f10x_rcc.c,1026 :: 		tmp = RCC->CFGR & CFGR_ADCPRE_Set_Mask;
MOV	R1, R3
LDR	R1, [R1, #0]
AND	R1, R1, #49152
;stm32f10x_rcc.c,1027 :: 		tmp = tmp >> 14;
LSRS	R2, R1, #14
;stm32f10x_rcc.c,1028 :: 		presc = ADCPrescTable[tmp];
MOVW	R1, #lo_addr(stm32f10x_rcc_ADCPrescTable+0)
MOVT	R1, #hi_addr(stm32f10x_rcc_ADCPrescTable+0)
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
; presc start address is: 12 (R3)
UXTB	R3, R1
;stm32f10x_rcc.c,1030 :: 		RCC_Clocks->ADCCLK_Frequency = RCC_Clocks->PCLK2_Frequency / presc;
ADDW	R2, R0, #16
ADDW	R1, R0, #12
; RCC_Clocks end address is: 0 (R0)
LDR	R1, [R1, #0]
UDIV	R1, R1, R3
; presc end address is: 12 (R3)
STR	R1, [R2, #0]
;stm32f10x_rcc.c,1031 :: 		}
L_end_RCC_GetClocksFreq:
BX	LR
; end of _RCC_GetClocksFreq
_RCC_AHBPeriphClockCmd:
;stm32f10x_rcc.c,1064 :: 		void RCC_AHBPeriphClockCmd(uint32_t RCC_AHBPeriph, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_AHBPeriph start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_AHBPeriph end address is: 0 (R0)
; RCC_AHBPeriph start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_rcc.c,1070 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_AHBPeriphClockCmd56
; NewState end address is: 4 (R1)
;stm32f10x_rcc.c,1072 :: 		RCC->AHBENR |= RCC_AHBPeriph;
MOVW	R3, #4116
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; RCC_AHBPeriph end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f10x_rcc.c,1073 :: 		}
IT	AL
BAL	L_RCC_AHBPeriphClockCmd57
L_RCC_AHBPeriphClockCmd56:
;stm32f10x_rcc.c,1076 :: 		RCC->AHBENR &= ~RCC_AHBPeriph;
; RCC_AHBPeriph start address is: 0 (R0)
MVN	R4, R0
; RCC_AHBPeriph end address is: 0 (R0)
MOVW	R3, #4116
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f10x_rcc.c,1077 :: 		}
L_RCC_AHBPeriphClockCmd57:
;stm32f10x_rcc.c,1078 :: 		}
L_end_RCC_AHBPeriphClockCmd:
BX	LR
; end of _RCC_AHBPeriphClockCmd
_RCC_APB2PeriphClockCmd:
;stm32f10x_rcc.c,1095 :: 		void RCC_APB2PeriphClockCmd(uint32_t RCC_APB2Periph, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_APB2Periph start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_APB2Periph end address is: 0 (R0)
; RCC_APB2Periph start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_rcc.c,1100 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_APB2PeriphClockCmd58
; NewState end address is: 4 (R1)
;stm32f10x_rcc.c,1102 :: 		RCC->APB2ENR |= RCC_APB2Periph;
MOVW	R3, #4120
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; RCC_APB2Periph end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f10x_rcc.c,1103 :: 		}
IT	AL
BAL	L_RCC_APB2PeriphClockCmd59
L_RCC_APB2PeriphClockCmd58:
;stm32f10x_rcc.c,1106 :: 		RCC->APB2ENR &= ~RCC_APB2Periph;
; RCC_APB2Periph start address is: 0 (R0)
MVN	R4, R0
; RCC_APB2Periph end address is: 0 (R0)
MOVW	R3, #4120
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f10x_rcc.c,1107 :: 		}
L_RCC_APB2PeriphClockCmd59:
;stm32f10x_rcc.c,1108 :: 		}
L_end_RCC_APB2PeriphClockCmd:
BX	LR
; end of _RCC_APB2PeriphClockCmd
_RCC_APB1PeriphClockCmd:
;stm32f10x_rcc.c,1126 :: 		void RCC_APB1PeriphClockCmd(uint32_t RCC_APB1Periph, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_APB1Periph start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_APB1Periph end address is: 0 (R0)
; RCC_APB1Periph start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_rcc.c,1131 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_APB1PeriphClockCmd60
; NewState end address is: 4 (R1)
;stm32f10x_rcc.c,1133 :: 		RCC->APB1ENR |= RCC_APB1Periph;
MOVW	R3, #4124
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; RCC_APB1Periph end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f10x_rcc.c,1134 :: 		}
IT	AL
BAL	L_RCC_APB1PeriphClockCmd61
L_RCC_APB1PeriphClockCmd60:
;stm32f10x_rcc.c,1137 :: 		RCC->APB1ENR &= ~RCC_APB1Periph;
; RCC_APB1Periph start address is: 0 (R0)
MVN	R4, R0
; RCC_APB1Periph end address is: 0 (R0)
MOVW	R3, #4124
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f10x_rcc.c,1138 :: 		}
L_RCC_APB1PeriphClockCmd61:
;stm32f10x_rcc.c,1139 :: 		}
L_end_RCC_APB1PeriphClockCmd:
BX	LR
; end of _RCC_APB1PeriphClockCmd
_RCC_APB2PeriphResetCmd:
;stm32f10x_rcc.c,1185 :: 		void RCC_APB2PeriphResetCmd(uint32_t RCC_APB2Periph, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_APB2Periph start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_APB2Periph end address is: 0 (R0)
; RCC_APB2Periph start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_rcc.c,1190 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_APB2PeriphResetCmd62
; NewState end address is: 4 (R1)
;stm32f10x_rcc.c,1192 :: 		RCC->APB2RSTR |= RCC_APB2Periph;
MOVW	R3, #4108
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; RCC_APB2Periph end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f10x_rcc.c,1193 :: 		}
IT	AL
BAL	L_RCC_APB2PeriphResetCmd63
L_RCC_APB2PeriphResetCmd62:
;stm32f10x_rcc.c,1196 :: 		RCC->APB2RSTR &= ~RCC_APB2Periph;
; RCC_APB2Periph start address is: 0 (R0)
MVN	R4, R0
; RCC_APB2Periph end address is: 0 (R0)
MOVW	R3, #4108
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f10x_rcc.c,1197 :: 		}
L_RCC_APB2PeriphResetCmd63:
;stm32f10x_rcc.c,1198 :: 		}
L_end_RCC_APB2PeriphResetCmd:
BX	LR
; end of _RCC_APB2PeriphResetCmd
_RCC_APB1PeriphResetCmd:
;stm32f10x_rcc.c,1216 :: 		void RCC_APB1PeriphResetCmd(uint32_t RCC_APB1Periph, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_APB1Periph start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_APB1Periph end address is: 0 (R0)
; RCC_APB1Periph start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_rcc.c,1221 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_APB1PeriphResetCmd64
; NewState end address is: 4 (R1)
;stm32f10x_rcc.c,1223 :: 		RCC->APB1RSTR |= RCC_APB1Periph;
MOVW	R3, #4112
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; RCC_APB1Periph end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f10x_rcc.c,1224 :: 		}
IT	AL
BAL	L_RCC_APB1PeriphResetCmd65
L_RCC_APB1PeriphResetCmd64:
;stm32f10x_rcc.c,1227 :: 		RCC->APB1RSTR &= ~RCC_APB1Periph;
; RCC_APB1Periph start address is: 0 (R0)
MVN	R4, R0
; RCC_APB1Periph end address is: 0 (R0)
MOVW	R3, #4112
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f10x_rcc.c,1228 :: 		}
L_RCC_APB1PeriphResetCmd65:
;stm32f10x_rcc.c,1229 :: 		}
L_end_RCC_APB1PeriphResetCmd:
BX	LR
; end of _RCC_APB1PeriphResetCmd
_RCC_BackupResetCmd:
;stm32f10x_rcc.c,1237 :: 		void RCC_BackupResetCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f10x_rcc.c,1241 :: 		*(__IO uint32_t *) BDCR_BDRST_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1111622720
MOVT	R1, 16962
STR	R2, [R1, #0]
;stm32f10x_rcc.c,1242 :: 		}
L_end_RCC_BackupResetCmd:
BX	LR
; end of _RCC_BackupResetCmd
_RCC_ClockSecuritySystemCmd:
;stm32f10x_rcc.c,1250 :: 		void RCC_ClockSecuritySystemCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f10x_rcc.c,1254 :: 		*(__IO uint32_t *) CR_CSSON_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1111621708
MOVT	R1, 16962
STR	R2, [R1, #0]
;stm32f10x_rcc.c,1255 :: 		}
L_end_RCC_ClockSecuritySystemCmd:
BX	LR
; end of _RCC_ClockSecuritySystemCmd
_RCC_MCOConfig:
;stm32f10x_rcc.c,1282 :: 		void RCC_MCOConfig(uint8_t RCC_MCO)
; RCC_MCO start address is: 0 (R0)
; RCC_MCO end address is: 0 (R0)
; RCC_MCO start address is: 0 (R0)
;stm32f10x_rcc.c,1288 :: 		*(__IO uint8_t *) CFGR_BYTE4_ADDRESS = RCC_MCO;
MOVW	R1, 1073876999
MOVT	R1, 16386
STRB	R0, [R1, #0]
; RCC_MCO end address is: 0 (R0)
;stm32f10x_rcc.c,1289 :: 		}
L_end_RCC_MCOConfig:
BX	LR
; end of _RCC_MCOConfig
_RCC_GetFlagStatus:
;stm32f10x_rcc.c,1326 :: 		FlagStatus RCC_GetFlagStatus(uint8_t RCC_FLAG)
; RCC_FLAG start address is: 0 (R0)
; RCC_FLAG end address is: 0 (R0)
; RCC_FLAG start address is: 0 (R0)
;stm32f10x_rcc.c,1328 :: 		uint32_t tmp = 0;
;stm32f10x_rcc.c,1329 :: 		uint32_t statusreg = 0;
;stm32f10x_rcc.c,1330 :: 		FlagStatus bitstatus = RESET;
;stm32f10x_rcc.c,1335 :: 		tmp = RCC_FLAG >> 5;
LSRS	R1, R0, #5
UXTB	R1, R1
; tmp start address is: 4 (R1)
;stm32f10x_rcc.c,1336 :: 		if (tmp == 1)               /* The flag to check is in CR register */
CMP	R1, #1
IT	NE
BNE	L_RCC_GetFlagStatus66
; tmp end address is: 4 (R1)
;stm32f10x_rcc.c,1338 :: 		statusreg = RCC->CR;
MOVW	R1, #4096
MOVT	R1, #16386
; statusreg start address is: 8 (R2)
LDR	R2, [R1, #0]
;stm32f10x_rcc.c,1339 :: 		}
; statusreg end address is: 8 (R2)
IT	AL
BAL	L_RCC_GetFlagStatus67
L_RCC_GetFlagStatus66:
;stm32f10x_rcc.c,1340 :: 		else if (tmp == 2)          /* The flag to check is in BDCR register */
; tmp start address is: 4 (R1)
CMP	R1, #2
IT	NE
BNE	L_RCC_GetFlagStatus68
; tmp end address is: 4 (R1)
;stm32f10x_rcc.c,1342 :: 		statusreg = RCC->BDCR;
MOVW	R1, #4128
MOVT	R1, #16386
; statusreg start address is: 4 (R1)
LDR	R1, [R1, #0]
;stm32f10x_rcc.c,1343 :: 		}
MOV	R2, R1
; statusreg end address is: 4 (R1)
IT	AL
BAL	L_RCC_GetFlagStatus69
L_RCC_GetFlagStatus68:
;stm32f10x_rcc.c,1346 :: 		statusreg = RCC->CSR;
MOVW	R1, #4132
MOVT	R1, #16386
; statusreg start address is: 8 (R2)
LDR	R2, [R1, #0]
; statusreg end address is: 8 (R2)
;stm32f10x_rcc.c,1347 :: 		}
L_RCC_GetFlagStatus69:
; statusreg start address is: 8 (R2)
; statusreg end address is: 8 (R2)
L_RCC_GetFlagStatus67:
;stm32f10x_rcc.c,1350 :: 		tmp = RCC_FLAG & FLAG_Mask;
; statusreg start address is: 8 (R2)
AND	R1, R0, #31
UXTB	R1, R1
; RCC_FLAG end address is: 0 (R0)
; tmp start address is: 0 (R0)
UXTB	R0, R1
;stm32f10x_rcc.c,1351 :: 		if ((statusreg & ((uint32_t)1 << tmp)) != (uint32_t)RESET)
MOV	R1, #1
LSLS	R1, R0
; tmp end address is: 0 (R0)
AND	R1, R2, R1, LSL #0
; statusreg end address is: 8 (R2)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_GetFlagStatus70
;stm32f10x_rcc.c,1353 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_rcc.c,1354 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_RCC_GetFlagStatus71
L_RCC_GetFlagStatus70:
;stm32f10x_rcc.c,1357 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_rcc.c,1358 :: 		}
L_RCC_GetFlagStatus71:
;stm32f10x_rcc.c,1361 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_rcc.c,1362 :: 		}
L_end_RCC_GetFlagStatus:
BX	LR
; end of _RCC_GetFlagStatus
_RCC_ClearFlag:
;stm32f10x_rcc.c,1371 :: 		void RCC_ClearFlag(void)
;stm32f10x_rcc.c,1374 :: 		RCC->CSR |= CSR_RMVF_Set;
MOVW	R1, #4132
MOVT	R1, #16386
LDR	R0, [R1, #0]
ORR	R0, R0, #16777216
STR	R0, [R1, #0]
;stm32f10x_rcc.c,1375 :: 		}
L_end_RCC_ClearFlag:
BX	LR
; end of _RCC_ClearFlag
_RCC_GetITStatus:
;stm32f10x_rcc.c,1402 :: 		ITStatus RCC_GetITStatus(uint8_t RCC_IT)
; RCC_IT start address is: 0 (R0)
; RCC_IT end address is: 0 (R0)
; RCC_IT start address is: 0 (R0)
;stm32f10x_rcc.c,1404 :: 		ITStatus bitstatus = RESET;
;stm32f10x_rcc.c,1409 :: 		if ((RCC->CIR & RCC_IT) != (uint32_t)RESET)
MOVW	R1, #4104
MOVT	R1, #16386
LDR	R1, [R1, #0]
ANDS	R1, R0
; RCC_IT end address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_GetITStatus72
;stm32f10x_rcc.c,1411 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_rcc.c,1412 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_RCC_GetITStatus73
L_RCC_GetITStatus72:
;stm32f10x_rcc.c,1415 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_rcc.c,1416 :: 		}
L_RCC_GetITStatus73:
;stm32f10x_rcc.c,1419 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_rcc.c,1420 :: 		}
L_end_RCC_GetITStatus:
BX	LR
; end of _RCC_GetITStatus
_RCC_ClearITPendingBit:
;stm32f10x_rcc.c,1448 :: 		void RCC_ClearITPendingBit(uint8_t RCC_IT)
; RCC_IT start address is: 0 (R0)
; RCC_IT end address is: 0 (R0)
; RCC_IT start address is: 0 (R0)
;stm32f10x_rcc.c,1455 :: 		*(__IO uint8_t *) CIR_BYTE3_ADDRESS = RCC_IT;
MOVW	R1, 1073877002
MOVT	R1, 16386
STRB	R0, [R1, #0]
; RCC_IT end address is: 0 (R0)
;stm32f10x_rcc.c,1456 :: 		}
L_end_RCC_ClearITPendingBit:
BX	LR
; end of _RCC_ClearITPendingBit
