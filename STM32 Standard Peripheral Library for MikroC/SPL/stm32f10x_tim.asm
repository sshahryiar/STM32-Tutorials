stm32f10x_tim_NVIC_SetPriorityGrouping:
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
; end of stm32f10x_tim_NVIC_SetPriorityGrouping
stm32f10x_tim_NVIC_GetPriorityGrouping:
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
; end of stm32f10x_tim_NVIC_GetPriorityGrouping
stm32f10x_tim_NVIC_EnableIRQ:
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
; end of stm32f10x_tim_NVIC_EnableIRQ
stm32f10x_tim_NVIC_DisableIRQ:
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
; end of stm32f10x_tim_NVIC_DisableIRQ
stm32f10x_tim_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f10x_tim_NVIC_GetPendingIRQ0
; ?FLOC__stm32f10x_tim_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_tim_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_tim_NVIC_GetPendingIRQ1
L_stm32f10x_tim_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f10x_tim_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_tim_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
L_stm32f10x_tim_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f10x_tim_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_tim_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1593 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f10x_tim_NVIC_GetPendingIRQ
stm32f10x_tim_NVIC_SetPendingIRQ:
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
; end of stm32f10x_tim_NVIC_SetPendingIRQ
stm32f10x_tim_NVIC_ClearPendingIRQ:
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
; end of stm32f10x_tim_NVIC_ClearPendingIRQ
stm32f10x_tim_NVIC_GetActive:
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
BEQ	L_stm32f10x_tim_NVIC_GetActive2
; ?FLOC__stm32f10x_tim_NVIC_GetActive?T72 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_tim_NVIC_GetActive?T72 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_tim_NVIC_GetActive3
L_stm32f10x_tim_NVIC_GetActive2:
; ?FLOC__stm32f10x_tim_NVIC_GetActive?T72 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_tim_NVIC_GetActive?T72 end address is: 0 (R0)
L_stm32f10x_tim_NVIC_GetActive3:
; ?FLOC__stm32f10x_tim_NVIC_GetActive?T72 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_tim_NVIC_GetActive?T72 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1633 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f10x_tim_NVIC_GetActive
stm32f10x_tim_NVIC_SetPriority:
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
BGE	L_stm32f10x_tim_NVIC_SetPriority4
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
BAL	L_stm32f10x_tim_NVIC_SetPriority5
L_stm32f10x_tim_NVIC_SetPriority4:
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
L_stm32f10x_tim_NVIC_SetPriority5:
;core_cm3.h,1653 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f10x_tim_NVIC_SetPriority
stm32f10x_tim_NVIC_GetPriority:
;core_cm3.h,1670 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1673 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f10x_tim_NVIC_GetPriority6
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
L_stm32f10x_tim_NVIC_GetPriority6:
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
; end of stm32f10x_tim_NVIC_GetPriority
stm32f10x_tim_NVIC_EncodePriority:
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
BLS	L_stm32f10x_tim_NVIC_EncodePriority8
; ?FLOC__stm32f10x_tim_NVIC_EncodePriority?T112 start address is: 12 (R3)
MOVW	R3, #4
; ?FLOC__stm32f10x_tim_NVIC_EncodePriority?T112 end address is: 12 (R3)
IT	AL
BAL	L_stm32f10x_tim_NVIC_EncodePriority9
L_stm32f10x_tim_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f10x_tim_NVIC_EncodePriority?T112 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_tim_NVIC_EncodePriority?T112 end address is: 0 (R0)
MOV	R3, R0
L_stm32f10x_tim_NVIC_EncodePriority9:
; ?FLOC__stm32f10x_tim_NVIC_EncodePriority?T112 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_tim_NVIC_EncodePriority?T112 end address is: 12 (R3)
;core_cm3.h,1702 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f10x_tim_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f10x_tim_NVIC_EncodePriority?T116 start address is: 20 (R5)
MOVW	R5, #0
; ?FLOC__stm32f10x_tim_NVIC_EncodePriority?T116 end address is: 20 (R5)
IT	AL
BAL	L_stm32f10x_tim_NVIC_EncodePriority11
L_stm32f10x_tim_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f10x_tim_NVIC_EncodePriority?T116 start address is: 20 (R5)
; ?FLOC__stm32f10x_tim_NVIC_EncodePriority?T116 end address is: 20 (R5)
L_stm32f10x_tim_NVIC_EncodePriority11:
;core_cm3.h,1705 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f10x_tim_NVIC_EncodePriority?T116 start address is: 20 (R5)
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
; ?FLOC__stm32f10x_tim_NVIC_EncodePriority?T116 end address is: 20 (R5)
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
; end of stm32f10x_tim_NVIC_EncodePriority
stm32f10x_tim_NVIC_DecodePriority:
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
BLS	L_stm32f10x_tim_NVIC_DecodePriority12
; ?FLOC__stm32f10x_tim_NVIC_DecodePriority?T130 start address is: 16 (R4)
MOVW	R4, #4
; ?FLOC__stm32f10x_tim_NVIC_DecodePriority?T130 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_tim_NVIC_DecodePriority13
L_stm32f10x_tim_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f10x_tim_NVIC_DecodePriority?T130 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_tim_NVIC_DecodePriority?T130 end address is: 4 (R1)
MOV	R4, R1
L_stm32f10x_tim_NVIC_DecodePriority13:
; ?FLOC__stm32f10x_tim_NVIC_DecodePriority?T130 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_tim_NVIC_DecodePriority?T130 end address is: 16 (R4)
;core_cm3.h,1733 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f10x_tim_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f10x_tim_NVIC_DecodePriority?T134 start address is: 16 (R4)
MOVW	R4, #0
; ?FLOC__stm32f10x_tim_NVIC_DecodePriority?T134 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_tim_NVIC_DecodePriority15
L_stm32f10x_tim_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f10x_tim_NVIC_DecodePriority?T134 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f10x_tim_NVIC_DecodePriority?T134 end address is: 20 (R5)
MOV	R4, R5
L_stm32f10x_tim_NVIC_DecodePriority15:
; ?FLOC__stm32f10x_tim_NVIC_DecodePriority?T134 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm3.h,1735 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f10x_tim_NVIC_DecodePriority?T134 end address is: 16 (R4)
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
; end of stm32f10x_tim_NVIC_DecodePriority
stm32f10x_tim_SysTick_Config:
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
BLS	L_stm32f10x_tim_SysTick_Config16
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f10x_tim_SysTick_Config16:
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
BL	stm32f10x_tim_NVIC_SetPriority+0
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
; end of stm32f10x_tim_SysTick_Config
stm32f10x_tim_NVIC_SystemReset:
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
L_stm32f10x_tim_NVIC_SystemReset17:
IT	AL
BAL	L_stm32f10x_tim_NVIC_SystemReset17
;core_cm3.h,1787 :: 		}
L_end_NVIC_SystemReset:
BX	LR
; end of stm32f10x_tim_NVIC_SystemReset
stm32f10x_tim_ITM_SendChar:
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
BEQ	L_stm32f10x_tim_ITM_SendChar151
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_tim_ITM_SendChar152
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_tim_ITM_SendChar153
L_stm32f10x_tim_ITM_SendChar147:
;core_cm3.h,1823 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f10x_tim_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f10x_tim_ITM_SendChar23
IT	AL
BAL	L_stm32f10x_tim_ITM_SendChar22
L_stm32f10x_tim_ITM_SendChar23:
;core_cm3.h,1824 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm3.h,1820 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f10x_tim_ITM_SendChar150
L_stm32f10x_tim_ITM_SendChar151:
L_stm32f10x_tim_ITM_SendChar150:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_tim_ITM_SendChar149
L_stm32f10x_tim_ITM_SendChar152:
L_stm32f10x_tim_ITM_SendChar149:
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_tim_ITM_SendChar148
L_stm32f10x_tim_ITM_SendChar153:
L_stm32f10x_tim_ITM_SendChar148:
;core_cm3.h,1826 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm3.h,1827 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f10x_tim_ITM_SendChar
stm32f10x_tim_ITM_ReceiveChar:
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
BEQ	L_stm32f10x_tim_ITM_ReceiveChar24
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
L_stm32f10x_tim_ITM_ReceiveChar24:
;core_cm3.h,1847 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm3.h,1848 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f10x_tim_ITM_ReceiveChar
stm32f10x_tim_ITM_CheckChar:
;core_cm3.h,1859 :: 		static __INLINE int ITM_CheckChar (void) {
;core_cm3.h,1861 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f10x_tim_ITM_CheckChar25
;core_cm3.h,1862 :: 		return (0);                                 /* no character available */
MOVW	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm3.h,1863 :: 		} else {
L_stm32f10x_tim_ITM_CheckChar25:
;core_cm3.h,1864 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm3.h,1866 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f10x_tim_ITM_CheckChar
_TIM_DeInit:
;stm32f10x_tim.c,122 :: 		void TIM_DeInit(TIM_TypeDef* TIMx)
; TIMx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
;stm32f10x_tim.c,127 :: 		if (TIMx == TIM1)
MOVW	R1, #11264
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit27
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,129 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM1, ENABLE);
MOVS	R1, #1
MOV	R0, #2048
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_tim.c,130 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM1, DISABLE);
MOVS	R1, #0
MOV	R0, #2048
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_tim.c,131 :: 		}
IT	AL
BAL	L_TIM_DeInit28
L_TIM_DeInit27:
;stm32f10x_tim.c,132 :: 		else if (TIMx == TIM2)
; TIMx start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit29
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,134 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM2, ENABLE);
MOVS	R1, #1
MOV	R0, #1
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_tim.c,135 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM2, DISABLE);
MOVS	R1, #0
MOV	R0, #1
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_tim.c,136 :: 		}
IT	AL
BAL	L_TIM_DeInit30
L_TIM_DeInit29:
;stm32f10x_tim.c,137 :: 		else if (TIMx == TIM3)
; TIMx start address is: 0 (R0)
MOVW	R1, #1024
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit31
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,139 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM3, ENABLE);
MOVS	R1, #1
MOV	R0, #2
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_tim.c,140 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM3, DISABLE);
MOVS	R1, #0
MOV	R0, #2
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_tim.c,141 :: 		}
IT	AL
BAL	L_TIM_DeInit32
L_TIM_DeInit31:
;stm32f10x_tim.c,142 :: 		else if (TIMx == TIM4)
; TIMx start address is: 0 (R0)
MOVW	R1, #2048
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit33
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,144 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM4, ENABLE);
MOVS	R1, #1
MOV	R0, #4
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_tim.c,145 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM4, DISABLE);
MOVS	R1, #0
MOV	R0, #4
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_tim.c,146 :: 		}
IT	AL
BAL	L_TIM_DeInit34
L_TIM_DeInit33:
;stm32f10x_tim.c,147 :: 		else if (TIMx == TIM5)
; TIMx start address is: 0 (R0)
MOVW	R1, #3072
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit35
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,149 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM5, ENABLE);
MOVS	R1, #1
MOV	R0, #8
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_tim.c,150 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM5, DISABLE);
MOVS	R1, #0
MOV	R0, #8
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_tim.c,151 :: 		}
IT	AL
BAL	L_TIM_DeInit36
L_TIM_DeInit35:
;stm32f10x_tim.c,152 :: 		else if (TIMx == TIM6)
; TIMx start address is: 0 (R0)
MOVW	R1, #4096
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit37
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,154 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM6, ENABLE);
MOVS	R1, #1
MOV	R0, #16
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_tim.c,155 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM6, DISABLE);
MOVS	R1, #0
MOV	R0, #16
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_tim.c,156 :: 		}
IT	AL
BAL	L_TIM_DeInit38
L_TIM_DeInit37:
;stm32f10x_tim.c,157 :: 		else if (TIMx == TIM7)
; TIMx start address is: 0 (R0)
MOVW	R1, #5120
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit39
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,159 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM7, ENABLE);
MOVS	R1, #1
MOV	R0, #32
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_tim.c,160 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM7, DISABLE);
MOVS	R1, #0
MOV	R0, #32
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_tim.c,161 :: 		}
IT	AL
BAL	L_TIM_DeInit40
L_TIM_DeInit39:
;stm32f10x_tim.c,162 :: 		else if (TIMx == TIM8)
; TIMx start address is: 0 (R0)
MOVW	R1, #13312
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit41
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,164 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM8, ENABLE);
MOVS	R1, #1
MOV	R0, #8192
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_tim.c,165 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM8, DISABLE);
MOVS	R1, #0
MOV	R0, #8192
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_tim.c,166 :: 		}
IT	AL
BAL	L_TIM_DeInit42
L_TIM_DeInit41:
;stm32f10x_tim.c,167 :: 		else if (TIMx == TIM9)
; TIMx start address is: 0 (R0)
MOVW	R1, #19456
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit43
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,169 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM9, ENABLE);
MOVS	R1, #1
MOV	R0, #524288
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_tim.c,170 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM9, DISABLE);
MOVS	R1, #0
MOV	R0, #524288
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_tim.c,171 :: 		}
IT	AL
BAL	L_TIM_DeInit44
L_TIM_DeInit43:
;stm32f10x_tim.c,172 :: 		else if (TIMx == TIM10)
; TIMx start address is: 0 (R0)
MOVW	R1, #20480
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit45
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,174 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM10, ENABLE);
MOVS	R1, #1
MOV	R0, #1048576
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_tim.c,175 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM10, DISABLE);
MOVS	R1, #0
MOV	R0, #1048576
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_tim.c,176 :: 		}
IT	AL
BAL	L_TIM_DeInit46
L_TIM_DeInit45:
;stm32f10x_tim.c,177 :: 		else if (TIMx == TIM11)
; TIMx start address is: 0 (R0)
MOVW	R1, #21504
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit47
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,179 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM11, ENABLE);
MOVS	R1, #1
MOV	R0, #2097152
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_tim.c,180 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM11, DISABLE);
MOVS	R1, #0
MOV	R0, #2097152
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_tim.c,181 :: 		}
IT	AL
BAL	L_TIM_DeInit48
L_TIM_DeInit47:
;stm32f10x_tim.c,182 :: 		else if (TIMx == TIM12)
; TIMx start address is: 0 (R0)
MOVW	R1, #6144
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit49
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,184 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM12, ENABLE);
MOVS	R1, #1
MOV	R0, #64
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_tim.c,185 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM12, DISABLE);
MOVS	R1, #0
MOV	R0, #64
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_tim.c,186 :: 		}
IT	AL
BAL	L_TIM_DeInit50
L_TIM_DeInit49:
;stm32f10x_tim.c,187 :: 		else if (TIMx == TIM13)
; TIMx start address is: 0 (R0)
MOVW	R1, #7168
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit51
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,189 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM13, ENABLE);
MOVS	R1, #1
MOV	R0, #128
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_tim.c,190 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM13, DISABLE);
MOVS	R1, #0
MOV	R0, #128
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_tim.c,191 :: 		}
IT	AL
BAL	L_TIM_DeInit52
L_TIM_DeInit51:
;stm32f10x_tim.c,192 :: 		else if (TIMx == TIM14)
; TIMx start address is: 0 (R0)
MOVW	R1, #8192
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit53
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,194 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM14, ENABLE);
MOVS	R1, #1
MOV	R0, #256
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_tim.c,195 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM14, DISABLE);
MOVS	R1, #0
MOV	R0, #256
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_tim.c,196 :: 		}
IT	AL
BAL	L_TIM_DeInit54
L_TIM_DeInit53:
;stm32f10x_tim.c,197 :: 		else if (TIMx == TIM15)
; TIMx start address is: 0 (R0)
MOVW	R1, #16384
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit55
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,199 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM15, ENABLE);
MOVS	R1, #1
MOV	R0, #65536
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_tim.c,200 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM15, DISABLE);
MOVS	R1, #0
MOV	R0, #65536
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_tim.c,201 :: 		}
IT	AL
BAL	L_TIM_DeInit56
L_TIM_DeInit55:
;stm32f10x_tim.c,202 :: 		else if (TIMx == TIM16)
; TIMx start address is: 0 (R0)
MOVW	R1, #17408
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit57
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,204 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM16, ENABLE);
MOVS	R1, #1
MOV	R0, #131072
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_tim.c,205 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM16, DISABLE);
MOVS	R1, #0
MOV	R0, #131072
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_tim.c,206 :: 		}
IT	AL
BAL	L_TIM_DeInit58
L_TIM_DeInit57:
;stm32f10x_tim.c,209 :: 		if (TIMx == TIM17)
; TIMx start address is: 0 (R0)
MOVW	R1, #18432
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit59
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,211 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM17, ENABLE);
MOVS	R1, #1
MOV	R0, #262144
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_tim.c,212 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM17, DISABLE);
MOVS	R1, #0
MOV	R0, #262144
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_tim.c,213 :: 		}
L_TIM_DeInit59:
;stm32f10x_tim.c,214 :: 		}
L_TIM_DeInit58:
L_TIM_DeInit56:
L_TIM_DeInit54:
L_TIM_DeInit52:
L_TIM_DeInit50:
L_TIM_DeInit48:
L_TIM_DeInit46:
L_TIM_DeInit44:
L_TIM_DeInit42:
L_TIM_DeInit40:
L_TIM_DeInit38:
L_TIM_DeInit36:
L_TIM_DeInit34:
L_TIM_DeInit32:
L_TIM_DeInit30:
L_TIM_DeInit28:
;stm32f10x_tim.c,215 :: 		}
L_end_TIM_DeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TIM_DeInit
_TIM_TimeBaseInit:
;stm32f10x_tim.c,226 :: 		void TIM_TimeBaseInit(TIM_TypeDef* TIMx, TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct)
; TIM_TimeBaseInitStruct start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_TimeBaseInitStruct end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_TimeBaseInitStruct start address is: 4 (R1)
;stm32f10x_tim.c,228 :: 		uint16_t tmpcr1 = 0;
;stm32f10x_tim.c,235 :: 		tmpcr1 = TIMx->CR1;
LDRH	R4, [R0, #0]
; tmpcr1 start address is: 16 (R4)
;stm32f10x_tim.c,237 :: 		if((TIMx == TIM1) || (TIMx == TIM8)|| (TIMx == TIM2) || (TIMx == TIM3)||
MOVW	R2, #11264
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit162
MOVW	R2, #13312
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit161
MOVW	R2, #0
MOVT	R2, #16384
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit160
MOVW	R2, #1024
MOVT	R2, #16384
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit159
;stm32f10x_tim.c,238 :: 		(TIMx == TIM4) || (TIMx == TIM5))
MOVW	R2, #2048
MOVT	R2, #16384
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit158
MOVW	R2, #3072
MOVT	R2, #16384
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit157
IT	AL
BAL	L_TIM_TimeBaseInit62
;stm32f10x_tim.c,237 :: 		if((TIMx == TIM1) || (TIMx == TIM8)|| (TIMx == TIM2) || (TIMx == TIM3)||
L__TIM_TimeBaseInit162:
L__TIM_TimeBaseInit161:
L__TIM_TimeBaseInit160:
L__TIM_TimeBaseInit159:
;stm32f10x_tim.c,238 :: 		(TIMx == TIM4) || (TIMx == TIM5))
L__TIM_TimeBaseInit158:
L__TIM_TimeBaseInit157:
;stm32f10x_tim.c,241 :: 		tmpcr1 &= (uint16_t)(~((uint16_t)(TIM_CR1_DIR | TIM_CR1_CMS)));
MOVW	R2, #65423
AND	R3, R4, R2, LSL #0
UXTH	R3, R3
; tmpcr1 end address is: 16 (R4)
;stm32f10x_tim.c,242 :: 		tmpcr1 |= (uint32_t)TIM_TimeBaseInitStruct->TIM_CounterMode;
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
; tmpcr1 start address is: 16 (R4)
UXTH	R4, R2
; tmpcr1 end address is: 16 (R4)
;stm32f10x_tim.c,243 :: 		}
L_TIM_TimeBaseInit62:
;stm32f10x_tim.c,245 :: 		if((TIMx != TIM6) && (TIMx != TIM7))
; tmpcr1 start address is: 16 (R4)
MOVW	R2, #4096
MOVT	R2, #16384
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit170
MOVW	R2, #5120
MOVT	R2, #16384
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit171
L__TIM_TimeBaseInit155:
;stm32f10x_tim.c,248 :: 		tmpcr1 &= (uint16_t)(~((uint16_t)TIM_CR1_CKD));
MOVW	R2, #64767
AND	R3, R4, R2, LSL #0
UXTH	R3, R3
; tmpcr1 end address is: 16 (R4)
;stm32f10x_tim.c,249 :: 		tmpcr1 |= (uint32_t)TIM_TimeBaseInitStruct->TIM_ClockDivision;
ADDS	R2, R1, #6
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
; tmpcr1 start address is: 12 (R3)
UXTH	R3, R2
; tmpcr1 end address is: 12 (R3)
UXTH	R2, R3
;stm32f10x_tim.c,245 :: 		if((TIMx != TIM6) && (TIMx != TIM7))
IT	AL
BAL	L__TIM_TimeBaseInit164
L__TIM_TimeBaseInit170:
UXTH	R2, R4
L__TIM_TimeBaseInit164:
; tmpcr1 start address is: 8 (R2)
; tmpcr1 end address is: 8 (R2)
IT	AL
BAL	L__TIM_TimeBaseInit163
L__TIM_TimeBaseInit171:
UXTH	R2, R4
L__TIM_TimeBaseInit163:
;stm32f10x_tim.c,252 :: 		TIMx->CR1 = tmpcr1;
; tmpcr1 start address is: 8 (R2)
STRH	R2, [R0, #0]
; tmpcr1 end address is: 8 (R2)
;stm32f10x_tim.c,255 :: 		TIMx->ARR = TIM_TimeBaseInitStruct->TIM_Period ;
ADDW	R3, R0, #44
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
STRH	R2, [R3, #0]
;stm32f10x_tim.c,258 :: 		TIMx->PSC = TIM_TimeBaseInitStruct->TIM_Prescaler;
ADDW	R3, R0, #40
LDRH	R2, [R1, #0]
STRH	R2, [R3, #0]
;stm32f10x_tim.c,260 :: 		if ((TIMx == TIM1) || (TIMx == TIM8)|| (TIMx == TIM15)|| (TIMx == TIM16) || (TIMx == TIM17))
MOVW	R2, #11264
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit169
MOVW	R2, #13312
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit168
MOVW	R2, #16384
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit167
MOVW	R2, #17408
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit166
MOVW	R2, #18432
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit165
; TIM_TimeBaseInitStruct end address is: 4 (R1)
IT	AL
BAL	L_TIM_TimeBaseInit68
L__TIM_TimeBaseInit169:
; TIM_TimeBaseInitStruct start address is: 4 (R1)
L__TIM_TimeBaseInit168:
L__TIM_TimeBaseInit167:
L__TIM_TimeBaseInit166:
L__TIM_TimeBaseInit165:
;stm32f10x_tim.c,263 :: 		TIMx->RCR = TIM_TimeBaseInitStruct->TIM_RepetitionCounter;
ADDW	R3, R0, #48
ADDW	R2, R1, #8
; TIM_TimeBaseInitStruct end address is: 4 (R1)
LDRB	R2, [R2, #0]
STRH	R2, [R3, #0]
;stm32f10x_tim.c,264 :: 		}
L_TIM_TimeBaseInit68:
;stm32f10x_tim.c,268 :: 		TIMx->EGR = TIM_PSCReloadMode_Immediate;
ADDW	R3, R0, #20
; TIMx end address is: 0 (R0)
MOVW	R2, #1
STRH	R2, [R3, #0]
;stm32f10x_tim.c,269 :: 		}
L_end_TIM_TimeBaseInit:
BX	LR
; end of _TIM_TimeBaseInit
_TIM_OC1Init:
;stm32f10x_tim.c,279 :: 		void TIM_OC1Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
; TIM_OCInitStruct start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCInitStruct end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCInitStruct start address is: 4 (R1)
;stm32f10x_tim.c,281 :: 		uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
;stm32f10x_tim.c,289 :: 		TIMx->CCER &= (uint16_t)(~(uint16_t)TIM_CCER_CC1E);
ADDW	R4, R0, #32
LDRH	R3, [R4, #0]
MOVW	R2, #65534
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_tim.c,291 :: 		tmpccer = TIMx->CCER;
ADDW	R2, R0, #32
LDRH	R4, [R2, #0]
;stm32f10x_tim.c,293 :: 		tmpcr2 =  TIMx->CR2;
ADDS	R2, R0, #4
LDRH	R2, [R2, #0]
; tmpcr2 start address is: 24 (R6)
UXTH	R6, R2
;stm32f10x_tim.c,296 :: 		tmpccmrx = TIMx->CCMR1;
ADDW	R2, R0, #24
LDRH	R3, [R2, #0]
;stm32f10x_tim.c,299 :: 		tmpccmrx &= (uint16_t)(~((uint16_t)TIM_CCMR1_OC1M));
MOVW	R2, #65423
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,300 :: 		tmpccmrx &= (uint16_t)(~((uint16_t)TIM_CCMR1_CC1S));
MOVW	R2, #65532
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,303 :: 		tmpccmrx |= TIM_OCInitStruct->TIM_OCMode;
LDRH	R2, [R1, #0]
ORR	R2, R3, R2, LSL #0
; tmpccmrx start address is: 20 (R5)
UXTH	R5, R2
;stm32f10x_tim.c,306 :: 		tmpccer &= (uint16_t)(~((uint16_t)TIM_CCER_CC1P));
MOVW	R2, #65533
ANDS	R4, R2
UXTH	R4, R4
;stm32f10x_tim.c,308 :: 		tmpccer |= TIM_OCInitStruct->TIM_OCPolarity;
ADDW	R2, R1, #8
LDRH	R2, [R2, #0]
ORRS	R4, R2
UXTH	R4, R4
;stm32f10x_tim.c,311 :: 		tmpccer |= TIM_OCInitStruct->TIM_OutputState;
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
ORRS	R4, R2
UXTH	R4, R4
; tmpccer start address is: 16 (R4)
;stm32f10x_tim.c,313 :: 		if((TIMx == TIM1) || (TIMx == TIM8)|| (TIMx == TIM15)||
MOVW	R2, #11264
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_OC1Init177
MOVW	R2, #13312
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_OC1Init176
MOVW	R2, #16384
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_OC1Init175
;stm32f10x_tim.c,314 :: 		(TIMx == TIM16)|| (TIMx == TIM17))
MOVW	R2, #17408
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_OC1Init174
MOVW	R2, #18432
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_OC1Init173
UXTH	R3, R6
IT	AL
BAL	L_TIM_OC1Init71
;stm32f10x_tim.c,313 :: 		if((TIMx == TIM1) || (TIMx == TIM8)|| (TIMx == TIM15)||
L__TIM_OC1Init177:
L__TIM_OC1Init176:
L__TIM_OC1Init175:
;stm32f10x_tim.c,314 :: 		(TIMx == TIM16)|| (TIMx == TIM17))
L__TIM_OC1Init174:
L__TIM_OC1Init173:
;stm32f10x_tim.c,322 :: 		tmpccer &= (uint16_t)(~((uint16_t)TIM_CCER_CC1NP));
MOVW	R2, #65527
ANDS	R4, R2
UXTH	R4, R4
; tmpccer end address is: 16 (R4)
;stm32f10x_tim.c,324 :: 		tmpccer |= TIM_OCInitStruct->TIM_OCNPolarity;
ADDW	R2, R1, #10
LDRH	R2, [R2, #0]
ORRS	R4, R2
UXTH	R4, R4
;stm32f10x_tim.c,327 :: 		tmpccer &= (uint16_t)(~((uint16_t)TIM_CCER_CC1NE));
MOVW	R2, #65531
ANDS	R4, R2
UXTH	R4, R4
;stm32f10x_tim.c,329 :: 		tmpccer |= TIM_OCInitStruct->TIM_OutputNState;
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
ORRS	R4, R2
UXTH	R4, R4
; tmpccer start address is: 16 (R4)
;stm32f10x_tim.c,332 :: 		tmpcr2 &= (uint16_t)(~((uint16_t)TIM_CR2_OIS1));
MOVW	R2, #65279
AND	R3, R6, R2, LSL #0
UXTH	R3, R3
; tmpcr2 end address is: 24 (R6)
;stm32f10x_tim.c,333 :: 		tmpcr2 &= (uint16_t)(~((uint16_t)TIM_CR2_OIS1N));
MOVW	R2, #65023
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,336 :: 		tmpcr2 |= TIM_OCInitStruct->TIM_OCIdleState;
ADDW	R2, R1, #12
LDRH	R2, [R2, #0]
ORRS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,338 :: 		tmpcr2 |= TIM_OCInitStruct->TIM_OCNIdleState;
ADDW	R2, R1, #14
LDRH	R2, [R2, #0]
ORRS	R3, R2
UXTH	R3, R3
; tmpcr2 start address is: 12 (R3)
; tmpcr2 end address is: 12 (R3)
; tmpccer end address is: 16 (R4)
;stm32f10x_tim.c,339 :: 		}
L_TIM_OC1Init71:
;stm32f10x_tim.c,341 :: 		TIMx->CR2 = tmpcr2;
; tmpcr2 start address is: 12 (R3)
; tmpccer start address is: 16 (R4)
ADDS	R2, R0, #4
STRH	R3, [R2, #0]
; tmpcr2 end address is: 12 (R3)
;stm32f10x_tim.c,344 :: 		TIMx->CCMR1 = tmpccmrx;
ADDW	R2, R0, #24
STRH	R5, [R2, #0]
; tmpccmrx end address is: 20 (R5)
;stm32f10x_tim.c,347 :: 		TIMx->CCR1 = TIM_OCInitStruct->TIM_Pulse;
ADDW	R3, R0, #52
ADDS	R2, R1, #6
; TIM_OCInitStruct end address is: 4 (R1)
LDRH	R2, [R2, #0]
STRH	R2, [R3, #0]
;stm32f10x_tim.c,350 :: 		TIMx->CCER = tmpccer;
ADDW	R2, R0, #32
; TIMx end address is: 0 (R0)
STRH	R4, [R2, #0]
; tmpccer end address is: 16 (R4)
;stm32f10x_tim.c,351 :: 		}
L_end_TIM_OC1Init:
BX	LR
; end of _TIM_OC1Init
_TIM_OC2Init:
;stm32f10x_tim.c,362 :: 		void TIM_OC2Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
; TIM_OCInitStruct start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCInitStruct end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCInitStruct start address is: 4 (R1)
;stm32f10x_tim.c,364 :: 		uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
;stm32f10x_tim.c,372 :: 		TIMx->CCER &= (uint16_t)(~((uint16_t)TIM_CCER_CC2E));
ADDW	R4, R0, #32
LDRH	R3, [R4, #0]
MOVW	R2, #65519
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_tim.c,375 :: 		tmpccer = TIMx->CCER;
ADDW	R2, R0, #32
LDRH	R4, [R2, #0]
;stm32f10x_tim.c,377 :: 		tmpcr2 =  TIMx->CR2;
ADDS	R2, R0, #4
LDRH	R2, [R2, #0]
; tmpcr2 start address is: 24 (R6)
UXTH	R6, R2
;stm32f10x_tim.c,380 :: 		tmpccmrx = TIMx->CCMR1;
ADDW	R2, R0, #24
LDRH	R3, [R2, #0]
;stm32f10x_tim.c,383 :: 		tmpccmrx &= (uint16_t)(~((uint16_t)TIM_CCMR1_OC2M));
MOVW	R2, #36863
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,384 :: 		tmpccmrx &= (uint16_t)(~((uint16_t)TIM_CCMR1_CC2S));
MOVW	R2, #64767
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,387 :: 		tmpccmrx |= (uint16_t)(TIM_OCInitStruct->TIM_OCMode << 8);
LDRH	R2, [R1, #0]
LSLS	R2, R2, #8
UXTH	R2, R2
ORR	R2, R3, R2, LSL #0
; tmpccmrx start address is: 20 (R5)
UXTH	R5, R2
;stm32f10x_tim.c,390 :: 		tmpccer &= (uint16_t)(~((uint16_t)TIM_CCER_CC2P));
MOVW	R2, #65503
ANDS	R4, R2
UXTH	R4, R4
;stm32f10x_tim.c,392 :: 		tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 4);
ADDW	R2, R1, #8
LDRH	R2, [R2, #0]
LSLS	R2, R2, #4
UXTH	R2, R2
ORRS	R4, R2
UXTH	R4, R4
;stm32f10x_tim.c,395 :: 		tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 4);
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
LSLS	R2, R2, #4
UXTH	R2, R2
ORRS	R4, R2
UXTH	R4, R4
; tmpccer start address is: 16 (R4)
;stm32f10x_tim.c,397 :: 		if((TIMx == TIM1) || (TIMx == TIM8))
MOVW	R2, #11264
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_OC2Init180
MOVW	R2, #13312
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_OC2Init179
UXTH	R3, R6
IT	AL
BAL	L_TIM_OC2Init74
L__TIM_OC2Init180:
L__TIM_OC2Init179:
;stm32f10x_tim.c,405 :: 		tmpccer &= (uint16_t)(~((uint16_t)TIM_CCER_CC2NP));
MOVW	R2, #65407
ANDS	R4, R2
UXTH	R4, R4
; tmpccer end address is: 16 (R4)
;stm32f10x_tim.c,407 :: 		tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCNPolarity << 4);
ADDW	R2, R1, #10
LDRH	R2, [R2, #0]
LSLS	R2, R2, #4
UXTH	R2, R2
ORRS	R4, R2
UXTH	R4, R4
;stm32f10x_tim.c,410 :: 		tmpccer &= (uint16_t)(~((uint16_t)TIM_CCER_CC2NE));
MOVW	R2, #65471
ANDS	R4, R2
UXTH	R4, R4
;stm32f10x_tim.c,412 :: 		tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputNState << 4);
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
LSLS	R2, R2, #4
UXTH	R2, R2
ORRS	R4, R2
UXTH	R4, R4
; tmpccer start address is: 16 (R4)
;stm32f10x_tim.c,415 :: 		tmpcr2 &= (uint16_t)(~((uint16_t)TIM_CR2_OIS2));
MOVW	R2, #64511
AND	R3, R6, R2, LSL #0
UXTH	R3, R3
; tmpcr2 end address is: 24 (R6)
;stm32f10x_tim.c,416 :: 		tmpcr2 &= (uint16_t)(~((uint16_t)TIM_CR2_OIS2N));
MOVW	R2, #63487
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,419 :: 		tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 2);
ADDW	R2, R1, #12
LDRH	R2, [R2, #0]
LSLS	R2, R2, #2
UXTH	R2, R2
ORRS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,421 :: 		tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCNIdleState << 2);
ADDW	R2, R1, #14
LDRH	R2, [R2, #0]
LSLS	R2, R2, #2
UXTH	R2, R2
ORRS	R3, R2
UXTH	R3, R3
; tmpcr2 start address is: 12 (R3)
; tmpcr2 end address is: 12 (R3)
; tmpccer end address is: 16 (R4)
;stm32f10x_tim.c,422 :: 		}
L_TIM_OC2Init74:
;stm32f10x_tim.c,424 :: 		TIMx->CR2 = tmpcr2;
; tmpcr2 start address is: 12 (R3)
; tmpccer start address is: 16 (R4)
ADDS	R2, R0, #4
STRH	R3, [R2, #0]
; tmpcr2 end address is: 12 (R3)
;stm32f10x_tim.c,427 :: 		TIMx->CCMR1 = tmpccmrx;
ADDW	R2, R0, #24
STRH	R5, [R2, #0]
; tmpccmrx end address is: 20 (R5)
;stm32f10x_tim.c,430 :: 		TIMx->CCR2 = TIM_OCInitStruct->TIM_Pulse;
ADDW	R3, R0, #56
ADDS	R2, R1, #6
; TIM_OCInitStruct end address is: 4 (R1)
LDRH	R2, [R2, #0]
STRH	R2, [R3, #0]
;stm32f10x_tim.c,433 :: 		TIMx->CCER = tmpccer;
ADDW	R2, R0, #32
; TIMx end address is: 0 (R0)
STRH	R4, [R2, #0]
; tmpccer end address is: 16 (R4)
;stm32f10x_tim.c,434 :: 		}
L_end_TIM_OC2Init:
BX	LR
; end of _TIM_OC2Init
_TIM_OC3Init:
;stm32f10x_tim.c,444 :: 		void TIM_OC3Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
; TIM_OCInitStruct start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCInitStruct end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCInitStruct start address is: 4 (R1)
;stm32f10x_tim.c,446 :: 		uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
;stm32f10x_tim.c,454 :: 		TIMx->CCER &= (uint16_t)(~((uint16_t)TIM_CCER_CC3E));
ADDW	R4, R0, #32
LDRH	R3, [R4, #0]
MOVW	R2, #65279
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_tim.c,457 :: 		tmpccer = TIMx->CCER;
ADDW	R2, R0, #32
LDRH	R4, [R2, #0]
;stm32f10x_tim.c,459 :: 		tmpcr2 =  TIMx->CR2;
ADDS	R2, R0, #4
LDRH	R2, [R2, #0]
; tmpcr2 start address is: 24 (R6)
UXTH	R6, R2
;stm32f10x_tim.c,462 :: 		tmpccmrx = TIMx->CCMR2;
ADDW	R2, R0, #28
LDRH	R3, [R2, #0]
;stm32f10x_tim.c,465 :: 		tmpccmrx &= (uint16_t)(~((uint16_t)TIM_CCMR2_OC3M));
MOVW	R2, #65423
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,466 :: 		tmpccmrx &= (uint16_t)(~((uint16_t)TIM_CCMR2_CC3S));
MOVW	R2, #65532
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,468 :: 		tmpccmrx |= TIM_OCInitStruct->TIM_OCMode;
LDRH	R2, [R1, #0]
ORR	R2, R3, R2, LSL #0
; tmpccmrx start address is: 20 (R5)
UXTH	R5, R2
;stm32f10x_tim.c,471 :: 		tmpccer &= (uint16_t)(~((uint16_t)TIM_CCER_CC3P));
MOVW	R2, #65023
ANDS	R4, R2
UXTH	R4, R4
;stm32f10x_tim.c,473 :: 		tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 8);
ADDW	R2, R1, #8
LDRH	R2, [R2, #0]
LSLS	R2, R2, #8
UXTH	R2, R2
ORRS	R4, R2
UXTH	R4, R4
;stm32f10x_tim.c,476 :: 		tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 8);
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
LSLS	R2, R2, #8
UXTH	R2, R2
ORRS	R4, R2
UXTH	R4, R4
; tmpccer start address is: 16 (R4)
;stm32f10x_tim.c,478 :: 		if((TIMx == TIM1) || (TIMx == TIM8))
MOVW	R2, #11264
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_OC3Init183
MOVW	R2, #13312
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_OC3Init182
UXTH	R3, R6
IT	AL
BAL	L_TIM_OC3Init77
L__TIM_OC3Init183:
L__TIM_OC3Init182:
;stm32f10x_tim.c,486 :: 		tmpccer &= (uint16_t)(~((uint16_t)TIM_CCER_CC3NP));
MOVW	R2, #63487
ANDS	R4, R2
UXTH	R4, R4
; tmpccer end address is: 16 (R4)
;stm32f10x_tim.c,488 :: 		tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCNPolarity << 8);
ADDW	R2, R1, #10
LDRH	R2, [R2, #0]
LSLS	R2, R2, #8
UXTH	R2, R2
ORRS	R4, R2
UXTH	R4, R4
;stm32f10x_tim.c,490 :: 		tmpccer &= (uint16_t)(~((uint16_t)TIM_CCER_CC3NE));
MOVW	R2, #64511
ANDS	R4, R2
UXTH	R4, R4
;stm32f10x_tim.c,493 :: 		tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputNState << 8);
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
LSLS	R2, R2, #8
UXTH	R2, R2
ORRS	R4, R2
UXTH	R4, R4
; tmpccer start address is: 16 (R4)
;stm32f10x_tim.c,495 :: 		tmpcr2 &= (uint16_t)(~((uint16_t)TIM_CR2_OIS3));
MOVW	R2, #61439
AND	R3, R6, R2, LSL #0
UXTH	R3, R3
; tmpcr2 end address is: 24 (R6)
;stm32f10x_tim.c,496 :: 		tmpcr2 &= (uint16_t)(~((uint16_t)TIM_CR2_OIS3N));
MOVW	R2, #57343
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,498 :: 		tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 4);
ADDW	R2, R1, #12
LDRH	R2, [R2, #0]
LSLS	R2, R2, #4
UXTH	R2, R2
ORRS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,500 :: 		tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCNIdleState << 4);
ADDW	R2, R1, #14
LDRH	R2, [R2, #0]
LSLS	R2, R2, #4
UXTH	R2, R2
ORRS	R3, R2
UXTH	R3, R3
; tmpcr2 start address is: 12 (R3)
; tmpcr2 end address is: 12 (R3)
; tmpccer end address is: 16 (R4)
;stm32f10x_tim.c,501 :: 		}
L_TIM_OC3Init77:
;stm32f10x_tim.c,503 :: 		TIMx->CR2 = tmpcr2;
; tmpcr2 start address is: 12 (R3)
; tmpccer start address is: 16 (R4)
ADDS	R2, R0, #4
STRH	R3, [R2, #0]
; tmpcr2 end address is: 12 (R3)
;stm32f10x_tim.c,506 :: 		TIMx->CCMR2 = tmpccmrx;
ADDW	R2, R0, #28
STRH	R5, [R2, #0]
; tmpccmrx end address is: 20 (R5)
;stm32f10x_tim.c,509 :: 		TIMx->CCR3 = TIM_OCInitStruct->TIM_Pulse;
ADDW	R3, R0, #60
ADDS	R2, R1, #6
; TIM_OCInitStruct end address is: 4 (R1)
LDRH	R2, [R2, #0]
STRH	R2, [R3, #0]
;stm32f10x_tim.c,512 :: 		TIMx->CCER = tmpccer;
ADDW	R2, R0, #32
; TIMx end address is: 0 (R0)
STRH	R4, [R2, #0]
; tmpccer end address is: 16 (R4)
;stm32f10x_tim.c,513 :: 		}
L_end_TIM_OC3Init:
BX	LR
; end of _TIM_OC3Init
_TIM_OC4Init:
;stm32f10x_tim.c,523 :: 		void TIM_OC4Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
; TIM_OCInitStruct start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCInitStruct end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCInitStruct start address is: 4 (R1)
;stm32f10x_tim.c,525 :: 		uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
;stm32f10x_tim.c,533 :: 		TIMx->CCER &= (uint16_t)(~((uint16_t)TIM_CCER_CC4E));
ADDW	R4, R0, #32
LDRH	R3, [R4, #0]
MOVW	R2, #61439
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_tim.c,536 :: 		tmpccer = TIMx->CCER;
ADDW	R2, R0, #32
LDRH	R4, [R2, #0]
;stm32f10x_tim.c,538 :: 		tmpcr2 =  TIMx->CR2;
ADDS	R2, R0, #4
LDRH	R2, [R2, #0]
; tmpcr2 start address is: 24 (R6)
UXTH	R6, R2
;stm32f10x_tim.c,541 :: 		tmpccmrx = TIMx->CCMR2;
ADDW	R2, R0, #28
LDRH	R3, [R2, #0]
;stm32f10x_tim.c,544 :: 		tmpccmrx &= (uint16_t)(~((uint16_t)TIM_CCMR2_OC4M));
MOVW	R2, #36863
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,545 :: 		tmpccmrx &= (uint16_t)(~((uint16_t)TIM_CCMR2_CC4S));
MOVW	R2, #64767
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,548 :: 		tmpccmrx |= (uint16_t)(TIM_OCInitStruct->TIM_OCMode << 8);
LDRH	R2, [R1, #0]
LSLS	R2, R2, #8
UXTH	R2, R2
ORR	R2, R3, R2, LSL #0
; tmpccmrx start address is: 20 (R5)
UXTH	R5, R2
;stm32f10x_tim.c,551 :: 		tmpccer &= (uint16_t)(~((uint16_t)TIM_CCER_CC4P));
MOVW	R2, #57343
AND	R3, R4, R2, LSL #0
UXTH	R3, R3
;stm32f10x_tim.c,553 :: 		tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 12);
ADDW	R2, R1, #8
LDRH	R2, [R2, #0]
LSLS	R2, R2, #12
UXTH	R2, R2
ORRS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,556 :: 		tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 12);
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
LSLS	R2, R2, #12
UXTH	R2, R2
ORR	R2, R3, R2, LSL #0
; tmpccer start address is: 16 (R4)
UXTH	R4, R2
;stm32f10x_tim.c,558 :: 		if((TIMx == TIM1) || (TIMx == TIM8))
MOVW	R2, #11264
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_OC4Init186
MOVW	R2, #13312
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_OC4Init185
UXTH	R3, R6
IT	AL
BAL	L_TIM_OC4Init80
L__TIM_OC4Init186:
L__TIM_OC4Init185:
;stm32f10x_tim.c,562 :: 		tmpcr2 &= (uint16_t)(~((uint16_t)TIM_CR2_OIS4));
MOVW	R2, #49151
AND	R3, R6, R2, LSL #0
UXTH	R3, R3
; tmpcr2 end address is: 24 (R6)
;stm32f10x_tim.c,564 :: 		tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 6);
ADDW	R2, R1, #12
LDRH	R2, [R2, #0]
LSLS	R2, R2, #6
UXTH	R2, R2
ORRS	R3, R2
UXTH	R3, R3
; tmpcr2 start address is: 12 (R3)
; tmpcr2 end address is: 12 (R3)
;stm32f10x_tim.c,565 :: 		}
L_TIM_OC4Init80:
;stm32f10x_tim.c,567 :: 		TIMx->CR2 = tmpcr2;
; tmpcr2 start address is: 12 (R3)
ADDS	R2, R0, #4
STRH	R3, [R2, #0]
; tmpcr2 end address is: 12 (R3)
;stm32f10x_tim.c,570 :: 		TIMx->CCMR2 = tmpccmrx;
ADDW	R2, R0, #28
STRH	R5, [R2, #0]
; tmpccmrx end address is: 20 (R5)
;stm32f10x_tim.c,573 :: 		TIMx->CCR4 = TIM_OCInitStruct->TIM_Pulse;
ADDW	R3, R0, #64
ADDS	R2, R1, #6
; TIM_OCInitStruct end address is: 4 (R1)
LDRH	R2, [R2, #0]
STRH	R2, [R3, #0]
;stm32f10x_tim.c,576 :: 		TIMx->CCER = tmpccer;
ADDW	R2, R0, #32
; TIMx end address is: 0 (R0)
STRH	R4, [R2, #0]
; tmpccer end address is: 16 (R4)
;stm32f10x_tim.c,577 :: 		}
L_end_TIM_OC4Init:
BX	LR
; end of _TIM_OC4Init
_TIM_ICInit:
;stm32f10x_tim.c,587 :: 		void TIM_ICInit(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct)
; TIM_ICInitStruct start address is: 4 (R1)
; TIMx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R8, R0
MOV	R9, R1
; TIM_ICInitStruct end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 32 (R8)
; TIM_ICInitStruct start address is: 36 (R9)
;stm32f10x_tim.c,595 :: 		if((TIMx == TIM1) || (TIMx == TIM8) || (TIMx == TIM2) || (TIMx == TIM3) ||
MOVW	R2, #11264
MOVT	R2, #16385
CMP	R8, R2
IT	EQ
BEQ	L__TIM_ICInit221
MOVW	R2, #13312
MOVT	R2, #16385
CMP	R8, R2
IT	EQ
BEQ	L__TIM_ICInit220
MOVW	R2, #0
MOVT	R2, #16384
CMP	R8, R2
IT	EQ
BEQ	L__TIM_ICInit219
MOVW	R2, #1024
MOVT	R2, #16384
CMP	R8, R2
IT	EQ
BEQ	L__TIM_ICInit218
;stm32f10x_tim.c,596 :: 		(TIMx == TIM4) ||(TIMx == TIM5))
MOVW	R2, #2048
MOVT	R2, #16384
CMP	R8, R2
IT	EQ
BEQ	L__TIM_ICInit217
MOVW	R2, #3072
MOVT	R2, #16384
CMP	R8, R2
IT	EQ
BEQ	L__TIM_ICInit216
IT	AL
BAL	L_TIM_ICInit83
;stm32f10x_tim.c,595 :: 		if((TIMx == TIM1) || (TIMx == TIM8) || (TIMx == TIM2) || (TIMx == TIM3) ||
L__TIM_ICInit221:
L__TIM_ICInit220:
L__TIM_ICInit219:
L__TIM_ICInit218:
;stm32f10x_tim.c,596 :: 		(TIMx == TIM4) ||(TIMx == TIM5))
L__TIM_ICInit217:
L__TIM_ICInit216:
;stm32f10x_tim.c,599 :: 		}
IT	AL
BAL	L_TIM_ICInit84
L_TIM_ICInit83:
;stm32f10x_tim.c,603 :: 		}
L_TIM_ICInit84:
;stm32f10x_tim.c,604 :: 		if (TIM_ICInitStruct->TIM_Channel == TIM_Channel_1)
LDRH	R2, [R9, #0]
CMP	R2, #0
IT	NE
BNE	L_TIM_ICInit85
;stm32f10x_tim.c,610 :: 		TIM_ICInitStruct->TIM_ICFilter);
ADD	R2, R9, #8
LDRH	R2, [R2, #0]
UXTH	R4, R2
;stm32f10x_tim.c,609 :: 		TIM_ICInitStruct->TIM_ICSelection,
ADD	R2, R9, #4
LDRH	R2, [R2, #0]
UXTH	R3, R2
;stm32f10x_tim.c,608 :: 		TI1_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
ADD	R2, R9, #2
LDRH	R2, [R2, #0]
UXTH	R1, R2
;stm32f10x_tim.c,609 :: 		TIM_ICInitStruct->TIM_ICSelection,
UXTH	R2, R3
;stm32f10x_tim.c,610 :: 		TIM_ICInitStruct->TIM_ICFilter);
UXTH	R3, R4
;stm32f10x_tim.c,608 :: 		TI1_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
MOV	R0, R8
;stm32f10x_tim.c,610 :: 		TIM_ICInitStruct->TIM_ICFilter);
BL	stm32f10x_tim_TI1_Config+0
;stm32f10x_tim.c,612 :: 		TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
ADD	R2, R9, #6
; TIM_ICInitStruct end address is: 36 (R9)
LDRH	R2, [R2, #0]
UXTH	R1, R2
MOV	R0, R8
; TIMx end address is: 32 (R8)
BL	_TIM_SetIC1Prescaler+0
;stm32f10x_tim.c,613 :: 		}
IT	AL
BAL	L_TIM_ICInit86
L_TIM_ICInit85:
;stm32f10x_tim.c,614 :: 		else if (TIM_ICInitStruct->TIM_Channel == TIM_Channel_2)
; TIM_ICInitStruct start address is: 36 (R9)
; TIMx start address is: 32 (R8)
LDRH	R2, [R9, #0]
CMP	R2, #4
IT	NE
BNE	L_TIM_ICInit87
;stm32f10x_tim.c,620 :: 		TIM_ICInitStruct->TIM_ICFilter);
ADD	R2, R9, #8
LDRH	R2, [R2, #0]
UXTH	R4, R2
;stm32f10x_tim.c,619 :: 		TIM_ICInitStruct->TIM_ICSelection,
ADD	R2, R9, #4
LDRH	R2, [R2, #0]
UXTH	R3, R2
;stm32f10x_tim.c,618 :: 		TI2_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
ADD	R2, R9, #2
LDRH	R2, [R2, #0]
UXTH	R1, R2
;stm32f10x_tim.c,619 :: 		TIM_ICInitStruct->TIM_ICSelection,
UXTH	R2, R3
;stm32f10x_tim.c,620 :: 		TIM_ICInitStruct->TIM_ICFilter);
UXTH	R3, R4
;stm32f10x_tim.c,618 :: 		TI2_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
MOV	R0, R8
;stm32f10x_tim.c,620 :: 		TIM_ICInitStruct->TIM_ICFilter);
BL	stm32f10x_tim_TI2_Config+0
;stm32f10x_tim.c,622 :: 		TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
ADD	R2, R9, #6
; TIM_ICInitStruct end address is: 36 (R9)
LDRH	R2, [R2, #0]
UXTH	R1, R2
MOV	R0, R8
; TIMx end address is: 32 (R8)
BL	_TIM_SetIC2Prescaler+0
;stm32f10x_tim.c,623 :: 		}
IT	AL
BAL	L_TIM_ICInit88
L_TIM_ICInit87:
;stm32f10x_tim.c,624 :: 		else if (TIM_ICInitStruct->TIM_Channel == TIM_Channel_3)
; TIM_ICInitStruct start address is: 36 (R9)
; TIMx start address is: 32 (R8)
LDRH	R2, [R9, #0]
CMP	R2, #8
IT	NE
BNE	L_TIM_ICInit89
;stm32f10x_tim.c,630 :: 		TIM_ICInitStruct->TIM_ICFilter);
ADD	R2, R9, #8
LDRH	R2, [R2, #0]
UXTH	R4, R2
;stm32f10x_tim.c,629 :: 		TIM_ICInitStruct->TIM_ICSelection,
ADD	R2, R9, #4
LDRH	R2, [R2, #0]
UXTH	R3, R2
;stm32f10x_tim.c,628 :: 		TI3_Config(TIMx,  TIM_ICInitStruct->TIM_ICPolarity,
ADD	R2, R9, #2
LDRH	R2, [R2, #0]
UXTH	R1, R2
;stm32f10x_tim.c,629 :: 		TIM_ICInitStruct->TIM_ICSelection,
UXTH	R2, R3
;stm32f10x_tim.c,630 :: 		TIM_ICInitStruct->TIM_ICFilter);
UXTH	R3, R4
;stm32f10x_tim.c,628 :: 		TI3_Config(TIMx,  TIM_ICInitStruct->TIM_ICPolarity,
MOV	R0, R8
;stm32f10x_tim.c,630 :: 		TIM_ICInitStruct->TIM_ICFilter);
BL	stm32f10x_tim_TI3_Config+0
;stm32f10x_tim.c,632 :: 		TIM_SetIC3Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
ADD	R2, R9, #6
; TIM_ICInitStruct end address is: 36 (R9)
LDRH	R2, [R2, #0]
UXTH	R1, R2
MOV	R0, R8
; TIMx end address is: 32 (R8)
BL	_TIM_SetIC3Prescaler+0
;stm32f10x_tim.c,633 :: 		}
IT	AL
BAL	L_TIM_ICInit90
L_TIM_ICInit89:
;stm32f10x_tim.c,640 :: 		TIM_ICInitStruct->TIM_ICFilter);
; TIM_ICInitStruct start address is: 36 (R9)
; TIMx start address is: 32 (R8)
ADD	R2, R9, #8
LDRH	R2, [R2, #0]
UXTH	R4, R2
;stm32f10x_tim.c,639 :: 		TIM_ICInitStruct->TIM_ICSelection,
ADD	R2, R9, #4
LDRH	R2, [R2, #0]
UXTH	R3, R2
;stm32f10x_tim.c,638 :: 		TI4_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
ADD	R2, R9, #2
LDRH	R2, [R2, #0]
UXTH	R1, R2
;stm32f10x_tim.c,639 :: 		TIM_ICInitStruct->TIM_ICSelection,
UXTH	R2, R3
;stm32f10x_tim.c,640 :: 		TIM_ICInitStruct->TIM_ICFilter);
UXTH	R3, R4
;stm32f10x_tim.c,638 :: 		TI4_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
MOV	R0, R8
;stm32f10x_tim.c,640 :: 		TIM_ICInitStruct->TIM_ICFilter);
BL	stm32f10x_tim_TI4_Config+0
;stm32f10x_tim.c,642 :: 		TIM_SetIC4Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
ADD	R2, R9, #6
; TIM_ICInitStruct end address is: 36 (R9)
LDRH	R2, [R2, #0]
UXTH	R1, R2
MOV	R0, R8
; TIMx end address is: 32 (R8)
BL	_TIM_SetIC4Prescaler+0
;stm32f10x_tim.c,643 :: 		}
L_TIM_ICInit90:
L_TIM_ICInit88:
L_TIM_ICInit86:
;stm32f10x_tim.c,644 :: 		}
L_end_TIM_ICInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TIM_ICInit
_TIM_PWMIConfig:
;stm32f10x_tim.c,654 :: 		void TIM_PWMIConfig(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct)
; TIM_ICInitStruct start address is: 4 (R1)
; TIMx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R8, R0
MOV	R9, R1
; TIM_ICInitStruct end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 32 (R8)
; TIM_ICInitStruct start address is: 36 (R9)
;stm32f10x_tim.c,656 :: 		uint16_t icoppositepolarity = TIM_ICPolarity_Rising;
;stm32f10x_tim.c,657 :: 		uint16_t icoppositeselection = TIM_ICSelection_DirectTI;
;stm32f10x_tim.c,661 :: 		if (TIM_ICInitStruct->TIM_ICPolarity == TIM_ICPolarity_Rising)
ADD	R2, R9, #2
LDRH	R2, [R2, #0]
CMP	R2, #0
IT	NE
BNE	L_TIM_PWMIConfig91
;stm32f10x_tim.c,663 :: 		icoppositepolarity = TIM_ICPolarity_Falling;
; icoppositepolarity start address is: 40 (R10)
MOVW	R10, #2
;stm32f10x_tim.c,664 :: 		}
; icoppositepolarity end address is: 40 (R10)
IT	AL
BAL	L_TIM_PWMIConfig92
L_TIM_PWMIConfig91:
;stm32f10x_tim.c,667 :: 		icoppositepolarity = TIM_ICPolarity_Rising;
; icoppositepolarity start address is: 40 (R10)
MOVW	R10, #0
; icoppositepolarity end address is: 40 (R10)
;stm32f10x_tim.c,668 :: 		}
L_TIM_PWMIConfig92:
;stm32f10x_tim.c,670 :: 		if (TIM_ICInitStruct->TIM_ICSelection == TIM_ICSelection_DirectTI)
; icoppositepolarity start address is: 40 (R10)
ADD	R2, R9, #4
LDRH	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_TIM_PWMIConfig93
;stm32f10x_tim.c,672 :: 		icoppositeselection = TIM_ICSelection_IndirectTI;
; icoppositeselection start address is: 44 (R11)
MOVW	R11, #2
;stm32f10x_tim.c,673 :: 		}
; icoppositeselection end address is: 44 (R11)
IT	AL
BAL	L_TIM_PWMIConfig94
L_TIM_PWMIConfig93:
;stm32f10x_tim.c,676 :: 		icoppositeselection = TIM_ICSelection_DirectTI;
; icoppositeselection start address is: 44 (R11)
MOVW	R11, #1
; icoppositeselection end address is: 44 (R11)
;stm32f10x_tim.c,677 :: 		}
L_TIM_PWMIConfig94:
;stm32f10x_tim.c,678 :: 		if (TIM_ICInitStruct->TIM_Channel == TIM_Channel_1)
; icoppositeselection start address is: 44 (R11)
LDRH	R2, [R9, #0]
CMP	R2, #0
IT	NE
BNE	L_TIM_PWMIConfig95
;stm32f10x_tim.c,682 :: 		TIM_ICInitStruct->TIM_ICFilter);
ADD	R2, R9, #8
LDRH	R2, [R2, #0]
UXTH	R4, R2
;stm32f10x_tim.c,681 :: 		TI1_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity, TIM_ICInitStruct->TIM_ICSelection,
ADD	R2, R9, #4
LDRH	R2, [R2, #0]
UXTH	R3, R2
ADD	R2, R9, #2
LDRH	R2, [R2, #0]
UXTH	R1, R2
UXTH	R2, R3
;stm32f10x_tim.c,682 :: 		TIM_ICInitStruct->TIM_ICFilter);
UXTH	R3, R4
;stm32f10x_tim.c,681 :: 		TI1_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity, TIM_ICInitStruct->TIM_ICSelection,
MOV	R0, R8
;stm32f10x_tim.c,682 :: 		TIM_ICInitStruct->TIM_ICFilter);
BL	stm32f10x_tim_TI1_Config+0
;stm32f10x_tim.c,684 :: 		TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
ADD	R2, R9, #6
LDRH	R2, [R2, #0]
UXTH	R1, R2
MOV	R0, R8
BL	_TIM_SetIC1Prescaler+0
;stm32f10x_tim.c,686 :: 		TI2_Config(TIMx, icoppositepolarity, icoppositeselection, TIM_ICInitStruct->TIM_ICFilter);
ADD	R2, R9, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
UXTH	R2, R11
; icoppositeselection end address is: 44 (R11)
UXTH	R1, R10
; icoppositepolarity end address is: 40 (R10)
MOV	R0, R8
BL	stm32f10x_tim_TI2_Config+0
;stm32f10x_tim.c,688 :: 		TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
ADD	R2, R9, #6
; TIM_ICInitStruct end address is: 36 (R9)
LDRH	R2, [R2, #0]
UXTH	R1, R2
MOV	R0, R8
; TIMx end address is: 32 (R8)
BL	_TIM_SetIC2Prescaler+0
;stm32f10x_tim.c,689 :: 		}
IT	AL
BAL	L_TIM_PWMIConfig96
L_TIM_PWMIConfig95:
;stm32f10x_tim.c,694 :: 		TIM_ICInitStruct->TIM_ICFilter);
; icoppositeselection start address is: 44 (R11)
; icoppositepolarity start address is: 40 (R10)
; TIM_ICInitStruct start address is: 36 (R9)
; TIMx start address is: 32 (R8)
ADD	R2, R9, #8
LDRH	R2, [R2, #0]
UXTH	R4, R2
;stm32f10x_tim.c,693 :: 		TI2_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity, TIM_ICInitStruct->TIM_ICSelection,
ADD	R2, R9, #4
LDRH	R2, [R2, #0]
UXTH	R3, R2
ADD	R2, R9, #2
LDRH	R2, [R2, #0]
UXTH	R1, R2
UXTH	R2, R3
;stm32f10x_tim.c,694 :: 		TIM_ICInitStruct->TIM_ICFilter);
UXTH	R3, R4
;stm32f10x_tim.c,693 :: 		TI2_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity, TIM_ICInitStruct->TIM_ICSelection,
MOV	R0, R8
;stm32f10x_tim.c,694 :: 		TIM_ICInitStruct->TIM_ICFilter);
BL	stm32f10x_tim_TI2_Config+0
;stm32f10x_tim.c,696 :: 		TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
ADD	R2, R9, #6
LDRH	R2, [R2, #0]
UXTH	R1, R2
MOV	R0, R8
BL	_TIM_SetIC2Prescaler+0
;stm32f10x_tim.c,698 :: 		TI1_Config(TIMx, icoppositepolarity, icoppositeselection, TIM_ICInitStruct->TIM_ICFilter);
ADD	R2, R9, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
UXTH	R2, R11
; icoppositeselection end address is: 44 (R11)
UXTH	R1, R10
; icoppositepolarity end address is: 40 (R10)
MOV	R0, R8
BL	stm32f10x_tim_TI1_Config+0
;stm32f10x_tim.c,700 :: 		TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
ADD	R2, R9, #6
; TIM_ICInitStruct end address is: 36 (R9)
LDRH	R2, [R2, #0]
UXTH	R1, R2
MOV	R0, R8
; TIMx end address is: 32 (R8)
BL	_TIM_SetIC1Prescaler+0
;stm32f10x_tim.c,701 :: 		}
L_TIM_PWMIConfig96:
;stm32f10x_tim.c,702 :: 		}
L_end_TIM_PWMIConfig:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TIM_PWMIConfig
_TIM_BDTRConfig:
;stm32f10x_tim.c,712 :: 		void TIM_BDTRConfig(TIM_TypeDef* TIMx, TIM_BDTRInitTypeDef *TIM_BDTRInitStruct)
; TIM_BDTRInitStruct start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_BDTRInitStruct end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_BDTRInitStruct start address is: 4 (R1)
;stm32f10x_tim.c,724 :: 		TIMx->BDTR = (uint32_t)TIM_BDTRInitStruct->TIM_OSSRState | TIM_BDTRInitStruct->TIM_OSSIState |
ADDW	R4, R0, #68
; TIMx end address is: 0 (R0)
LDRH	R2, [R1, #0]
UXTH	R3, R2
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
ORRS	R3, R2
;stm32f10x_tim.c,725 :: 		TIM_BDTRInitStruct->TIM_LOCKLevel | TIM_BDTRInitStruct->TIM_DeadTime |
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
ORRS	R3, R2
ADDS	R2, R1, #6
LDRH	R2, [R2, #0]
ORRS	R3, R2
;stm32f10x_tim.c,726 :: 		TIM_BDTRInitStruct->TIM_Break | TIM_BDTRInitStruct->TIM_BreakPolarity |
ADDW	R2, R1, #8
LDRH	R2, [R2, #0]
ORRS	R3, R2
ADDW	R2, R1, #10
LDRH	R2, [R2, #0]
ORRS	R3, R2
;stm32f10x_tim.c,727 :: 		TIM_BDTRInitStruct->TIM_AutomaticOutput;
ADDW	R2, R1, #12
; TIM_BDTRInitStruct end address is: 4 (R1)
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_tim.c,728 :: 		}
L_end_TIM_BDTRConfig:
BX	LR
; end of _TIM_BDTRConfig
_TIM_TimeBaseStructInit:
;stm32f10x_tim.c,736 :: 		void TIM_TimeBaseStructInit(TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct)
; TIM_TimeBaseInitStruct start address is: 0 (R0)
; TIM_TimeBaseInitStruct end address is: 0 (R0)
; TIM_TimeBaseInitStruct start address is: 0 (R0)
;stm32f10x_tim.c,739 :: 		TIM_TimeBaseInitStruct->TIM_Period = 0xFFFF;
ADDS	R2, R0, #4
MOVW	R1, #65535
STRH	R1, [R2, #0]
;stm32f10x_tim.c,740 :: 		TIM_TimeBaseInitStruct->TIM_Prescaler = 0x0000;
MOVW	R1, #0
STRH	R1, [R0, #0]
;stm32f10x_tim.c,741 :: 		TIM_TimeBaseInitStruct->TIM_ClockDivision = TIM_CKD_DIV1;
ADDS	R2, R0, #6
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_tim.c,742 :: 		TIM_TimeBaseInitStruct->TIM_CounterMode = TIM_CounterMode_Up;
ADDS	R2, R0, #2
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_tim.c,743 :: 		TIM_TimeBaseInitStruct->TIM_RepetitionCounter = 0x0000;
ADDW	R2, R0, #8
; TIM_TimeBaseInitStruct end address is: 0 (R0)
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f10x_tim.c,744 :: 		}
L_end_TIM_TimeBaseStructInit:
BX	LR
; end of _TIM_TimeBaseStructInit
_TIM_OCStructInit:
;stm32f10x_tim.c,752 :: 		void TIM_OCStructInit(TIM_OCInitTypeDef* TIM_OCInitStruct)
; TIM_OCInitStruct start address is: 0 (R0)
; TIM_OCInitStruct end address is: 0 (R0)
; TIM_OCInitStruct start address is: 0 (R0)
;stm32f10x_tim.c,755 :: 		TIM_OCInitStruct->TIM_OCMode = TIM_OCMode_Timing;
MOVW	R1, #0
STRH	R1, [R0, #0]
;stm32f10x_tim.c,756 :: 		TIM_OCInitStruct->TIM_OutputState = TIM_OutputState_Disable;
ADDS	R2, R0, #2
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_tim.c,757 :: 		TIM_OCInitStruct->TIM_OutputNState = TIM_OutputNState_Disable;
ADDS	R2, R0, #4
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_tim.c,758 :: 		TIM_OCInitStruct->TIM_Pulse = 0x0000;
ADDS	R2, R0, #6
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_tim.c,759 :: 		TIM_OCInitStruct->TIM_OCPolarity = TIM_OCPolarity_High;
ADDW	R2, R0, #8
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_tim.c,760 :: 		TIM_OCInitStruct->TIM_OCNPolarity = TIM_OCPolarity_High;
ADDW	R2, R0, #10
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_tim.c,761 :: 		TIM_OCInitStruct->TIM_OCIdleState = TIM_OCIdleState_Reset;
ADDW	R2, R0, #12
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_tim.c,762 :: 		TIM_OCInitStruct->TIM_OCNIdleState = TIM_OCNIdleState_Reset;
ADDW	R2, R0, #14
; TIM_OCInitStruct end address is: 0 (R0)
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_tim.c,763 :: 		}
L_end_TIM_OCStructInit:
BX	LR
; end of _TIM_OCStructInit
_TIM_ICStructInit:
;stm32f10x_tim.c,771 :: 		void TIM_ICStructInit(TIM_ICInitTypeDef* TIM_ICInitStruct)
; TIM_ICInitStruct start address is: 0 (R0)
; TIM_ICInitStruct end address is: 0 (R0)
; TIM_ICInitStruct start address is: 0 (R0)
;stm32f10x_tim.c,774 :: 		TIM_ICInitStruct->TIM_Channel = TIM_Channel_1;
MOVW	R1, #0
STRH	R1, [R0, #0]
;stm32f10x_tim.c,775 :: 		TIM_ICInitStruct->TIM_ICPolarity = TIM_ICPolarity_Rising;
ADDS	R2, R0, #2
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_tim.c,776 :: 		TIM_ICInitStruct->TIM_ICSelection = TIM_ICSelection_DirectTI;
ADDS	R2, R0, #4
MOVW	R1, #1
STRH	R1, [R2, #0]
;stm32f10x_tim.c,777 :: 		TIM_ICInitStruct->TIM_ICPrescaler = TIM_ICPSC_DIV1;
ADDS	R2, R0, #6
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_tim.c,778 :: 		TIM_ICInitStruct->TIM_ICFilter = 0x00;
ADDW	R2, R0, #8
; TIM_ICInitStruct end address is: 0 (R0)
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_tim.c,779 :: 		}
L_end_TIM_ICStructInit:
BX	LR
; end of _TIM_ICStructInit
_TIM_BDTRStructInit:
;stm32f10x_tim.c,787 :: 		void TIM_BDTRStructInit(TIM_BDTRInitTypeDef* TIM_BDTRInitStruct)
; TIM_BDTRInitStruct start address is: 0 (R0)
; TIM_BDTRInitStruct end address is: 0 (R0)
; TIM_BDTRInitStruct start address is: 0 (R0)
;stm32f10x_tim.c,790 :: 		TIM_BDTRInitStruct->TIM_OSSRState = TIM_OSSRState_Disable;
MOVW	R1, #0
STRH	R1, [R0, #0]
;stm32f10x_tim.c,791 :: 		TIM_BDTRInitStruct->TIM_OSSIState = TIM_OSSIState_Disable;
ADDS	R2, R0, #2
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_tim.c,792 :: 		TIM_BDTRInitStruct->TIM_LOCKLevel = TIM_LOCKLevel_OFF;
ADDS	R2, R0, #4
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_tim.c,793 :: 		TIM_BDTRInitStruct->TIM_DeadTime = 0x00;
ADDS	R2, R0, #6
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_tim.c,794 :: 		TIM_BDTRInitStruct->TIM_Break = TIM_Break_Disable;
ADDW	R2, R0, #8
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_tim.c,795 :: 		TIM_BDTRInitStruct->TIM_BreakPolarity = TIM_BreakPolarity_Low;
ADDW	R2, R0, #10
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_tim.c,796 :: 		TIM_BDTRInitStruct->TIM_AutomaticOutput = TIM_AutomaticOutput_Disable;
ADDW	R2, R0, #12
; TIM_BDTRInitStruct end address is: 0 (R0)
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_tim.c,797 :: 		}
L_end_TIM_BDTRStructInit:
BX	LR
; end of _TIM_BDTRStructInit
_TIM_Cmd:
;stm32f10x_tim.c,806 :: 		void TIM_Cmd(TIM_TypeDef* TIMx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_tim.c,812 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_TIM_Cmd97
; NewState end address is: 4 (R1)
;stm32f10x_tim.c,815 :: 		TIMx->CR1 |= TIM_CR1_CEN;
LDRH	R2, [R0, #0]
ORR	R2, R2, #1
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,816 :: 		}
IT	AL
BAL	L_TIM_Cmd98
L_TIM_Cmd97:
;stm32f10x_tim.c,820 :: 		TIMx->CR1 &= (uint16_t)(~((uint16_t)TIM_CR1_CEN));
; TIMx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65534
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,821 :: 		}
L_TIM_Cmd98:
;stm32f10x_tim.c,822 :: 		}
L_end_TIM_Cmd:
BX	LR
; end of _TIM_Cmd
_TIM_CtrlPWMOutputs:
;stm32f10x_tim.c,831 :: 		void TIM_CtrlPWMOutputs(TIM_TypeDef* TIMx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_tim.c,836 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_TIM_CtrlPWMOutputs99
; NewState end address is: 4 (R1)
;stm32f10x_tim.c,839 :: 		TIMx->BDTR |= TIM_BDTR_MOE;
ADDW	R3, R0, #68
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #32768
STRH	R2, [R3, #0]
;stm32f10x_tim.c,840 :: 		}
IT	AL
BAL	L_TIM_CtrlPWMOutputs100
L_TIM_CtrlPWMOutputs99:
;stm32f10x_tim.c,844 :: 		TIMx->BDTR &= (uint16_t)(~((uint16_t)TIM_BDTR_MOE));
; TIMx start address is: 0 (R0)
ADDW	R4, R0, #68
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #32767
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_tim.c,845 :: 		}
L_TIM_CtrlPWMOutputs100:
;stm32f10x_tim.c,846 :: 		}
L_end_TIM_CtrlPWMOutputs:
BX	LR
; end of _TIM_CtrlPWMOutputs
_TIM_ITConfig:
;stm32f10x_tim.c,872 :: 		void TIM_ITConfig(TIM_TypeDef* TIMx, uint16_t TIM_IT, FunctionalState NewState)
; NewState start address is: 8 (R2)
; TIM_IT start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; NewState end address is: 8 (R2)
; TIM_IT end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_IT start address is: 4 (R1)
; NewState start address is: 8 (R2)
;stm32f10x_tim.c,879 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_TIM_ITConfig101
; NewState end address is: 8 (R2)
;stm32f10x_tim.c,882 :: 		TIMx->DIER |= TIM_IT;
ADDW	R4, R0, #12
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
ORRS	R3, R1
; TIM_IT end address is: 4 (R1)
STRH	R3, [R4, #0]
;stm32f10x_tim.c,883 :: 		}
IT	AL
BAL	L_TIM_ITConfig102
L_TIM_ITConfig101:
;stm32f10x_tim.c,887 :: 		TIMx->DIER &= (uint16_t)~TIM_IT;
; TIM_IT start address is: 4 (R1)
; TIMx start address is: 0 (R0)
ADDW	R5, R0, #12
; TIMx end address is: 0 (R0)
MVN	R4, R1
UXTH	R4, R4
; TIM_IT end address is: 4 (R1)
LDRH	R3, [R5, #0]
ANDS	R3, R4
STRH	R3, [R5, #0]
;stm32f10x_tim.c,888 :: 		}
L_TIM_ITConfig102:
;stm32f10x_tim.c,889 :: 		}
L_end_TIM_ITConfig:
BX	LR
; end of _TIM_ITConfig
_TIM_GenerateEvent:
;stm32f10x_tim.c,909 :: 		void TIM_GenerateEvent(TIM_TypeDef* TIMx, uint16_t TIM_EventSource)
; TIM_EventSource start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_EventSource end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_EventSource start address is: 4 (R1)
;stm32f10x_tim.c,916 :: 		TIMx->EGR = TIM_EventSource;
ADDW	R2, R0, #20
; TIMx end address is: 0 (R0)
STRH	R1, [R2, #0]
; TIM_EventSource end address is: 4 (R1)
;stm32f10x_tim.c,917 :: 		}
L_end_TIM_GenerateEvent:
BX	LR
; end of _TIM_GenerateEvent
_TIM_DMAConfig:
;stm32f10x_tim.c,937 :: 		void TIM_DMAConfig(TIM_TypeDef* TIMx, uint16_t TIM_DMABase, uint16_t TIM_DMABurstLength)
; TIM_DMABurstLength start address is: 8 (R2)
; TIM_DMABase start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_DMABurstLength end address is: 8 (R2)
; TIM_DMABase end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_DMABase start address is: 4 (R1)
; TIM_DMABurstLength start address is: 8 (R2)
;stm32f10x_tim.c,944 :: 		TIMx->DCR = TIM_DMABase | TIM_DMABurstLength;
ADDW	R4, R0, #72
; TIMx end address is: 0 (R0)
ORR	R3, R1, R2, LSL #0
; TIM_DMABase end address is: 4 (R1)
; TIM_DMABurstLength end address is: 8 (R2)
STRH	R3, [R4, #0]
;stm32f10x_tim.c,945 :: 		}
L_end_TIM_DMAConfig:
BX	LR
; end of _TIM_DMAConfig
_TIM_DMACmd:
;stm32f10x_tim.c,964 :: 		void TIM_DMACmd(TIM_TypeDef* TIMx, uint16_t TIM_DMASource, FunctionalState NewState)
; NewState start address is: 8 (R2)
; TIM_DMASource start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; NewState end address is: 8 (R2)
; TIM_DMASource end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_DMASource start address is: 4 (R1)
; NewState start address is: 8 (R2)
;stm32f10x_tim.c,971 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_TIM_DMACmd103
; NewState end address is: 8 (R2)
;stm32f10x_tim.c,974 :: 		TIMx->DIER |= TIM_DMASource;
ADDW	R4, R0, #12
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
ORRS	R3, R1
; TIM_DMASource end address is: 4 (R1)
STRH	R3, [R4, #0]
;stm32f10x_tim.c,975 :: 		}
IT	AL
BAL	L_TIM_DMACmd104
L_TIM_DMACmd103:
;stm32f10x_tim.c,979 :: 		TIMx->DIER &= (uint16_t)~TIM_DMASource;
; TIM_DMASource start address is: 4 (R1)
; TIMx start address is: 0 (R0)
ADDW	R5, R0, #12
; TIMx end address is: 0 (R0)
MVN	R4, R1
UXTH	R4, R4
; TIM_DMASource end address is: 4 (R1)
LDRH	R3, [R5, #0]
ANDS	R3, R4
STRH	R3, [R5, #0]
;stm32f10x_tim.c,980 :: 		}
L_TIM_DMACmd104:
;stm32f10x_tim.c,981 :: 		}
L_end_TIM_DMACmd:
BX	LR
; end of _TIM_DMACmd
_TIM_InternalClockConfig:
;stm32f10x_tim.c,989 :: 		void TIM_InternalClockConfig(TIM_TypeDef* TIMx)
; TIMx start address is: 0 (R0)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
;stm32f10x_tim.c,994 :: 		TIMx->SMCR &=  (uint16_t)(~((uint16_t)TIM_SMCR_SMS));
ADDW	R3, R0, #8
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
MOVW	R1, #65528
AND	R1, R2, R1, LSL #0
STRH	R1, [R3, #0]
;stm32f10x_tim.c,995 :: 		}
L_end_TIM_InternalClockConfig:
BX	LR
; end of _TIM_InternalClockConfig
_TIM_ITRxExternalClockConfig:
;stm32f10x_tim.c,1008 :: 		void TIM_ITRxExternalClockConfig(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource)
; TIM_InputTriggerSource start address is: 4 (R1)
; TIMx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R5, R0
; TIM_InputTriggerSource end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 20 (R5)
; TIM_InputTriggerSource start address is: 4 (R1)
;stm32f10x_tim.c,1014 :: 		TIM_SelectInputTrigger(TIMx, TIM_InputTriggerSource);
; TIM_InputTriggerSource end address is: 4 (R1)
MOV	R0, R5
BL	_TIM_SelectInputTrigger+0
;stm32f10x_tim.c,1016 :: 		TIMx->SMCR |= TIM_SlaveMode_External1;
ADDW	R3, R5, #8
; TIMx end address is: 20 (R5)
LDRH	R2, [R3, #0]
ORR	R2, R2, #7
STRH	R2, [R3, #0]
;stm32f10x_tim.c,1017 :: 		}
L_end_TIM_ITRxExternalClockConfig:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TIM_ITRxExternalClockConfig
_TIM_TIxExternalClockConfig:
;stm32f10x_tim.c,1036 :: 		uint16_t TIM_ICPolarity, uint16_t ICFilter)
; ICFilter start address is: 12 (R3)
; TIM_ICPolarity start address is: 8 (R2)
; TIM_TIxExternalCLKSource start address is: 4 (R1)
; TIMx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R8, R0
UXTH	R9, R1
UXTH	R7, R2
UXTH	R10, R3
; ICFilter end address is: 12 (R3)
; TIM_ICPolarity end address is: 8 (R2)
; TIM_TIxExternalCLKSource end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 32 (R8)
; TIM_TIxExternalCLKSource start address is: 36 (R9)
; TIM_ICPolarity start address is: 28 (R7)
; ICFilter start address is: 40 (R10)
;stm32f10x_tim.c,1044 :: 		if (TIM_TIxExternalCLKSource == TIM_TIxExternalCLK1Source_TI2)
CMP	R9, #96
IT	NE
BNE	L_TIM_TIxExternalClockConfig105
;stm32f10x_tim.c,1046 :: 		TI2_Config(TIMx, TIM_ICPolarity, TIM_ICSelection_DirectTI, ICFilter);
UXTH	R3, R10
; ICFilter end address is: 40 (R10)
MOVW	R2, #1
UXTH	R1, R7
; TIM_ICPolarity end address is: 28 (R7)
MOV	R0, R8
BL	stm32f10x_tim_TI2_Config+0
;stm32f10x_tim.c,1047 :: 		}
IT	AL
BAL	L_TIM_TIxExternalClockConfig106
L_TIM_TIxExternalClockConfig105:
;stm32f10x_tim.c,1050 :: 		TI1_Config(TIMx, TIM_ICPolarity, TIM_ICSelection_DirectTI, ICFilter);
; ICFilter start address is: 40 (R10)
; TIM_ICPolarity start address is: 28 (R7)
UXTH	R3, R10
; ICFilter end address is: 40 (R10)
MOVW	R2, #1
UXTH	R1, R7
; TIM_ICPolarity end address is: 28 (R7)
MOV	R0, R8
BL	stm32f10x_tim_TI1_Config+0
;stm32f10x_tim.c,1051 :: 		}
L_TIM_TIxExternalClockConfig106:
;stm32f10x_tim.c,1053 :: 		TIM_SelectInputTrigger(TIMx, TIM_TIxExternalCLKSource);
UXTH	R1, R9
; TIM_TIxExternalCLKSource end address is: 36 (R9)
MOV	R0, R8
BL	_TIM_SelectInputTrigger+0
;stm32f10x_tim.c,1055 :: 		TIMx->SMCR |= TIM_SlaveMode_External1;
ADD	R5, R8, #8
; TIMx end address is: 32 (R8)
LDRH	R4, [R5, #0]
ORR	R4, R4, #7
STRH	R4, [R5, #0]
;stm32f10x_tim.c,1056 :: 		}
L_end_TIM_TIxExternalClockConfig:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TIM_TIxExternalClockConfig
_TIM_ETRClockMode1Config:
;stm32f10x_tim.c,1076 :: 		uint16_t ExtTRGFilter)
; ExtTRGFilter start address is: 12 (R3)
; TIM_ExtTRGPolarity start address is: 8 (R2)
; TIM_ExtTRGPrescaler start address is: 4 (R1)
; TIMx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R7, R0
; ExtTRGFilter end address is: 12 (R3)
; TIM_ExtTRGPolarity end address is: 8 (R2)
; TIM_ExtTRGPrescaler end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 28 (R7)
; TIM_ExtTRGPrescaler start address is: 4 (R1)
; TIM_ExtTRGPolarity start address is: 8 (R2)
; ExtTRGFilter start address is: 12 (R3)
;stm32f10x_tim.c,1078 :: 		uint16_t tmpsmcr = 0;
;stm32f10x_tim.c,1085 :: 		TIM_ETRConfig(TIMx, TIM_ExtTRGPrescaler, TIM_ExtTRGPolarity, ExtTRGFilter);
; ExtTRGFilter end address is: 12 (R3)
; TIM_ExtTRGPolarity end address is: 8 (R2)
; TIM_ExtTRGPrescaler end address is: 4 (R1)
MOV	R0, R7
BL	_TIM_ETRConfig+0
;stm32f10x_tim.c,1088 :: 		tmpsmcr = TIMx->SMCR;
ADDW	R6, R7, #8
; TIMx end address is: 28 (R7)
LDRH	R5, [R6, #0]
;stm32f10x_tim.c,1090 :: 		tmpsmcr &= (uint16_t)(~((uint16_t)TIM_SMCR_SMS));
MOVW	R4, #65528
AND	R4, R5, R4, LSL #0
UXTH	R4, R4
;stm32f10x_tim.c,1092 :: 		tmpsmcr |= TIM_SlaveMode_External1;
ORR	R5, R4, #7
UXTH	R5, R5
;stm32f10x_tim.c,1094 :: 		tmpsmcr &= (uint16_t)(~((uint16_t)TIM_SMCR_TS));
MOVW	R4, #65423
AND	R4, R5, R4, LSL #0
UXTH	R4, R4
;stm32f10x_tim.c,1095 :: 		tmpsmcr |= TIM_TS_ETRF;
ORR	R4, R4, #112
;stm32f10x_tim.c,1097 :: 		TIMx->SMCR = tmpsmcr;
STRH	R4, [R6, #0]
;stm32f10x_tim.c,1098 :: 		}
L_end_TIM_ETRClockMode1Config:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TIM_ETRClockMode1Config
_TIM_ETRClockMode2Config:
;stm32f10x_tim.c,1118 :: 		uint16_t TIM_ExtTRGPolarity, uint16_t ExtTRGFilter)
; ExtTRGFilter start address is: 12 (R3)
; TIM_ExtTRGPolarity start address is: 8 (R2)
; TIM_ExtTRGPrescaler start address is: 4 (R1)
; TIMx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R7, R0
; ExtTRGFilter end address is: 12 (R3)
; TIM_ExtTRGPolarity end address is: 8 (R2)
; TIM_ExtTRGPrescaler end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 28 (R7)
; TIM_ExtTRGPrescaler start address is: 4 (R1)
; TIM_ExtTRGPolarity start address is: 8 (R2)
; ExtTRGFilter start address is: 12 (R3)
;stm32f10x_tim.c,1126 :: 		TIM_ETRConfig(TIMx, TIM_ExtTRGPrescaler, TIM_ExtTRGPolarity, ExtTRGFilter);
; ExtTRGFilter end address is: 12 (R3)
; TIM_ExtTRGPolarity end address is: 8 (R2)
; TIM_ExtTRGPrescaler end address is: 4 (R1)
MOV	R0, R7
BL	_TIM_ETRConfig+0
;stm32f10x_tim.c,1128 :: 		TIMx->SMCR |= TIM_SMCR_ECE;
ADDW	R5, R7, #8
; TIMx end address is: 28 (R7)
LDRH	R4, [R5, #0]
ORR	R4, R4, #16384
STRH	R4, [R5, #0]
;stm32f10x_tim.c,1129 :: 		}
L_end_TIM_ETRClockMode2Config:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TIM_ETRClockMode2Config
_TIM_ETRConfig:
;stm32f10x_tim.c,1149 :: 		uint16_t ExtTRGFilter)
; ExtTRGFilter start address is: 12 (R3)
; TIM_ExtTRGPolarity start address is: 8 (R2)
; TIM_ExtTRGPrescaler start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; ExtTRGFilter end address is: 12 (R3)
; TIM_ExtTRGPolarity end address is: 8 (R2)
; TIM_ExtTRGPrescaler end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ExtTRGPrescaler start address is: 4 (R1)
; TIM_ExtTRGPolarity start address is: 8 (R2)
; ExtTRGFilter start address is: 12 (R3)
;stm32f10x_tim.c,1151 :: 		uint16_t tmpsmcr = 0;
;stm32f10x_tim.c,1157 :: 		tmpsmcr = TIMx->SMCR;
ADDW	R6, R0, #8
; TIMx end address is: 0 (R0)
LDRH	R4, [R6, #0]
;stm32f10x_tim.c,1159 :: 		tmpsmcr &= SMCR_ETR_Mask;
AND	R5, R4, #255
UXTH	R5, R5
;stm32f10x_tim.c,1161 :: 		tmpsmcr |= (uint16_t)(TIM_ExtTRGPrescaler | (uint16_t)(TIM_ExtTRGPolarity | (uint16_t)(ExtTRGFilter << (uint16_t)8)));
LSLS	R4, R3, #8
UXTH	R4, R4
; ExtTRGFilter end address is: 12 (R3)
ORR	R4, R2, R4, LSL #0
UXTH	R4, R4
; TIM_ExtTRGPolarity end address is: 8 (R2)
ORR	R4, R1, R4, LSL #0
UXTH	R4, R4
; TIM_ExtTRGPrescaler end address is: 4 (R1)
ORR	R4, R5, R4, LSL #0
;stm32f10x_tim.c,1163 :: 		TIMx->SMCR = tmpsmcr;
STRH	R4, [R6, #0]
;stm32f10x_tim.c,1164 :: 		}
L_end_TIM_ETRConfig:
BX	LR
; end of _TIM_ETRConfig
_TIM_PrescalerConfig:
;stm32f10x_tim.c,1176 :: 		void TIM_PrescalerConfig(TIM_TypeDef* TIMx, uint16_t Prescaler, uint16_t TIM_PSCReloadMode)
; TIM_PSCReloadMode start address is: 8 (R2)
; Prescaler start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_PSCReloadMode end address is: 8 (R2)
; Prescaler end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; Prescaler start address is: 4 (R1)
; TIM_PSCReloadMode start address is: 8 (R2)
;stm32f10x_tim.c,1182 :: 		TIMx->PSC = Prescaler;
ADDW	R3, R0, #40
STRH	R1, [R3, #0]
; Prescaler end address is: 4 (R1)
;stm32f10x_tim.c,1184 :: 		TIMx->EGR = TIM_PSCReloadMode;
ADDW	R3, R0, #20
; TIMx end address is: 0 (R0)
STRH	R2, [R3, #0]
; TIM_PSCReloadMode end address is: 8 (R2)
;stm32f10x_tim.c,1185 :: 		}
L_end_TIM_PrescalerConfig:
BX	LR
; end of _TIM_PrescalerConfig
_TIM_CounterModeConfig:
;stm32f10x_tim.c,1199 :: 		void TIM_CounterModeConfig(TIM_TypeDef* TIMx, uint16_t TIM_CounterMode)
; TIM_CounterMode start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_CounterMode end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_CounterMode start address is: 4 (R1)
;stm32f10x_tim.c,1201 :: 		uint16_t tmpcr1 = 0;
;stm32f10x_tim.c,1205 :: 		tmpcr1 = TIMx->CR1;
LDRH	R3, [R0, #0]
;stm32f10x_tim.c,1207 :: 		tmpcr1 &= (uint16_t)(~((uint16_t)(TIM_CR1_DIR | TIM_CR1_CMS)));
MOVW	R2, #65423
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f10x_tim.c,1209 :: 		tmpcr1 |= TIM_CounterMode;
ORRS	R2, R1
; TIM_CounterMode end address is: 4 (R1)
;stm32f10x_tim.c,1211 :: 		TIMx->CR1 = tmpcr1;
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,1212 :: 		}
L_end_TIM_CounterModeConfig:
BX	LR
; end of _TIM_CounterModeConfig
_TIM_SelectInputTrigger:
;stm32f10x_tim.c,1229 :: 		void TIM_SelectInputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource)
; TIM_InputTriggerSource start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_InputTriggerSource end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_InputTriggerSource start address is: 4 (R1)
;stm32f10x_tim.c,1231 :: 		uint16_t tmpsmcr = 0;
;stm32f10x_tim.c,1236 :: 		tmpsmcr = TIMx->SMCR;
ADDW	R4, R0, #8
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1238 :: 		tmpsmcr &= (uint16_t)(~((uint16_t)TIM_SMCR_TS));
MOVW	R2, #65423
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f10x_tim.c,1240 :: 		tmpsmcr |= TIM_InputTriggerSource;
ORRS	R2, R1
; TIM_InputTriggerSource end address is: 4 (R1)
;stm32f10x_tim.c,1242 :: 		TIMx->SMCR = tmpsmcr;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1243 :: 		}
L_end_TIM_SelectInputTrigger:
BX	LR
; end of _TIM_SelectInputTrigger
_TIM_EncoderInterfaceConfig:
;stm32f10x_tim.c,1265 :: 		uint16_t TIM_IC1Polarity, uint16_t TIM_IC2Polarity)
; TIM_IC2Polarity start address is: 12 (R3)
; TIM_IC1Polarity start address is: 8 (R2)
; TIM_EncoderMode start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_IC2Polarity end address is: 12 (R3)
; TIM_IC1Polarity end address is: 8 (R2)
; TIM_EncoderMode end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_EncoderMode start address is: 4 (R1)
; TIM_IC1Polarity start address is: 8 (R2)
; TIM_IC2Polarity start address is: 12 (R3)
;stm32f10x_tim.c,1267 :: 		uint16_t tmpsmcr = 0;
;stm32f10x_tim.c,1268 :: 		uint16_t tmpccmr1 = 0;
;stm32f10x_tim.c,1269 :: 		uint16_t tmpccer = 0;
;stm32f10x_tim.c,1278 :: 		tmpsmcr = TIMx->SMCR;
ADD	R8, R0, #8
LDRH	R6, [R8, #0]
;stm32f10x_tim.c,1281 :: 		tmpccmr1 = TIMx->CCMR1;
ADDW	R4, R0, #24
LDRH	R5, [R4, #0]
;stm32f10x_tim.c,1284 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
LDRH	R7, [R4, #0]
;stm32f10x_tim.c,1287 :: 		tmpsmcr &= (uint16_t)(~((uint16_t)TIM_SMCR_SMS));
MOVW	R4, #65528
AND	R4, R6, R4, LSL #0
UXTH	R4, R4
;stm32f10x_tim.c,1288 :: 		tmpsmcr |= TIM_EncoderMode;
ORR	R6, R4, R1, LSL #0
; TIM_EncoderMode end address is: 4 (R1)
;stm32f10x_tim.c,1291 :: 		tmpccmr1 &= (uint16_t)(((uint16_t)~((uint16_t)TIM_CCMR1_CC1S)) & (uint16_t)(~((uint16_t)TIM_CCMR1_CC2S)));
MOVW	R4, #64764
ANDS	R5, R4
UXTH	R5, R5
;stm32f10x_tim.c,1292 :: 		tmpccmr1 |= TIM_CCMR1_CC1S_0 | TIM_CCMR1_CC2S_0;
MOVW	R4, #257
ORR	R4, R5, R4, LSL #0
; tmpccmr1 start address is: 4 (R1)
UXTH	R1, R4
;stm32f10x_tim.c,1295 :: 		tmpccer &= (uint16_t)(((uint16_t)~((uint16_t)TIM_CCER_CC1P)) & ((uint16_t)~((uint16_t)TIM_CCER_CC2P)));
MOVW	R4, #65501
AND	R5, R7, R4, LSL #0
UXTH	R5, R5
;stm32f10x_tim.c,1296 :: 		tmpccer |= (uint16_t)(TIM_IC1Polarity | (uint16_t)(TIM_IC2Polarity << (uint16_t)4));
LSLS	R4, R3, #4
UXTH	R4, R4
; TIM_IC2Polarity end address is: 12 (R3)
ORR	R4, R2, R4, LSL #0
UXTH	R4, R4
; TIM_IC1Polarity end address is: 8 (R2)
ORR	R4, R5, R4, LSL #0
; tmpccer start address is: 8 (R2)
UXTH	R2, R4
;stm32f10x_tim.c,1299 :: 		TIMx->SMCR = tmpsmcr;
STRH	R6, [R8, #0]
;stm32f10x_tim.c,1301 :: 		TIMx->CCMR1 = tmpccmr1;
ADDW	R4, R0, #24
STRH	R1, [R4, #0]
; tmpccmr1 end address is: 4 (R1)
;stm32f10x_tim.c,1303 :: 		TIMx->CCER = tmpccer;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
STRH	R2, [R4, #0]
; tmpccer end address is: 8 (R2)
;stm32f10x_tim.c,1304 :: 		}
L_end_TIM_EncoderInterfaceConfig:
BX	LR
; end of _TIM_EncoderInterfaceConfig
_TIM_ForcedOC1Config:
;stm32f10x_tim.c,1315 :: 		void TIM_ForcedOC1Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
; TIM_ForcedAction start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ForcedAction end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ForcedAction start address is: 4 (R1)
;stm32f10x_tim.c,1317 :: 		uint16_t tmpccmr1 = 0;
;stm32f10x_tim.c,1321 :: 		tmpccmr1 = TIMx->CCMR1;
ADDW	R4, R0, #24
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1323 :: 		tmpccmr1 &= (uint16_t)~((uint16_t)TIM_CCMR1_OC1M);
MOVW	R2, #65423
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f10x_tim.c,1325 :: 		tmpccmr1 |= TIM_ForcedAction;
ORRS	R2, R1
; TIM_ForcedAction end address is: 4 (R1)
;stm32f10x_tim.c,1327 :: 		TIMx->CCMR1 = tmpccmr1;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1328 :: 		}
L_end_TIM_ForcedOC1Config:
BX	LR
; end of _TIM_ForcedOC1Config
_TIM_ForcedOC2Config:
;stm32f10x_tim.c,1339 :: 		void TIM_ForcedOC2Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
; TIM_ForcedAction start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ForcedAction end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ForcedAction start address is: 4 (R1)
;stm32f10x_tim.c,1341 :: 		uint16_t tmpccmr1 = 0;
;stm32f10x_tim.c,1345 :: 		tmpccmr1 = TIMx->CCMR1;
ADDW	R4, R0, #24
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1347 :: 		tmpccmr1 &= (uint16_t)~((uint16_t)TIM_CCMR1_OC2M);
MOVW	R2, #36863
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,1349 :: 		tmpccmr1 |= (uint16_t)(TIM_ForcedAction << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; TIM_ForcedAction end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f10x_tim.c,1351 :: 		TIMx->CCMR1 = tmpccmr1;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1352 :: 		}
L_end_TIM_ForcedOC2Config:
BX	LR
; end of _TIM_ForcedOC2Config
_TIM_ForcedOC3Config:
;stm32f10x_tim.c,1363 :: 		void TIM_ForcedOC3Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
; TIM_ForcedAction start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ForcedAction end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ForcedAction start address is: 4 (R1)
;stm32f10x_tim.c,1365 :: 		uint16_t tmpccmr2 = 0;
;stm32f10x_tim.c,1369 :: 		tmpccmr2 = TIMx->CCMR2;
ADDW	R4, R0, #28
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1371 :: 		tmpccmr2 &= (uint16_t)~((uint16_t)TIM_CCMR2_OC3M);
MOVW	R2, #65423
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f10x_tim.c,1373 :: 		tmpccmr2 |= TIM_ForcedAction;
ORRS	R2, R1
; TIM_ForcedAction end address is: 4 (R1)
;stm32f10x_tim.c,1375 :: 		TIMx->CCMR2 = tmpccmr2;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1376 :: 		}
L_end_TIM_ForcedOC3Config:
BX	LR
; end of _TIM_ForcedOC3Config
_TIM_ForcedOC4Config:
;stm32f10x_tim.c,1387 :: 		void TIM_ForcedOC4Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
; TIM_ForcedAction start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ForcedAction end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ForcedAction start address is: 4 (R1)
;stm32f10x_tim.c,1389 :: 		uint16_t tmpccmr2 = 0;
;stm32f10x_tim.c,1393 :: 		tmpccmr2 = TIMx->CCMR2;
ADDW	R4, R0, #28
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1395 :: 		tmpccmr2 &= (uint16_t)~((uint16_t)TIM_CCMR2_OC4M);
MOVW	R2, #36863
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,1397 :: 		tmpccmr2 |= (uint16_t)(TIM_ForcedAction << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; TIM_ForcedAction end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f10x_tim.c,1399 :: 		TIMx->CCMR2 = tmpccmr2;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1400 :: 		}
L_end_TIM_ForcedOC4Config:
BX	LR
; end of _TIM_ForcedOC4Config
_TIM_ARRPreloadConfig:
;stm32f10x_tim.c,1409 :: 		void TIM_ARRPreloadConfig(TIM_TypeDef* TIMx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_tim.c,1414 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_TIM_ARRPreloadConfig107
; NewState end address is: 4 (R1)
;stm32f10x_tim.c,1417 :: 		TIMx->CR1 |= TIM_CR1_ARPE;
LDRH	R2, [R0, #0]
ORR	R2, R2, #128
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,1418 :: 		}
IT	AL
BAL	L_TIM_ARRPreloadConfig108
L_TIM_ARRPreloadConfig107:
;stm32f10x_tim.c,1422 :: 		TIMx->CR1 &= (uint16_t)~((uint16_t)TIM_CR1_ARPE);
; TIMx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65407
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,1423 :: 		}
L_TIM_ARRPreloadConfig108:
;stm32f10x_tim.c,1424 :: 		}
L_end_TIM_ARRPreloadConfig:
BX	LR
; end of _TIM_ARRPreloadConfig
_TIM_SelectCOM:
;stm32f10x_tim.c,1433 :: 		void TIM_SelectCOM(TIM_TypeDef* TIMx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_tim.c,1438 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_TIM_SelectCOM109
; NewState end address is: 4 (R1)
;stm32f10x_tim.c,1441 :: 		TIMx->CR2 |= TIM_CR2_CCUS;
ADDS	R3, R0, #4
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #4
STRH	R2, [R3, #0]
;stm32f10x_tim.c,1442 :: 		}
IT	AL
BAL	L_TIM_SelectCOM110
L_TIM_SelectCOM109:
;stm32f10x_tim.c,1446 :: 		TIMx->CR2 &= (uint16_t)~((uint16_t)TIM_CR2_CCUS);
; TIMx start address is: 0 (R0)
ADDS	R4, R0, #4
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65531
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1447 :: 		}
L_TIM_SelectCOM110:
;stm32f10x_tim.c,1448 :: 		}
L_end_TIM_SelectCOM:
BX	LR
; end of _TIM_SelectCOM
_TIM_SelectCCDMA:
;stm32f10x_tim.c,1458 :: 		void TIM_SelectCCDMA(TIM_TypeDef* TIMx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_tim.c,1463 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_TIM_SelectCCDMA111
; NewState end address is: 4 (R1)
;stm32f10x_tim.c,1466 :: 		TIMx->CR2 |= TIM_CR2_CCDS;
ADDS	R3, R0, #4
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #8
STRH	R2, [R3, #0]
;stm32f10x_tim.c,1467 :: 		}
IT	AL
BAL	L_TIM_SelectCCDMA112
L_TIM_SelectCCDMA111:
;stm32f10x_tim.c,1471 :: 		TIMx->CR2 &= (uint16_t)~((uint16_t)TIM_CR2_CCDS);
; TIMx start address is: 0 (R0)
ADDS	R4, R0, #4
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65527
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1472 :: 		}
L_TIM_SelectCCDMA112:
;stm32f10x_tim.c,1473 :: 		}
L_end_TIM_SelectCCDMA:
BX	LR
; end of _TIM_SelectCCDMA
_TIM_CCPreloadControl:
;stm32f10x_tim.c,1483 :: 		void TIM_CCPreloadControl(TIM_TypeDef* TIMx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_tim.c,1488 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_TIM_CCPreloadControl113
; NewState end address is: 4 (R1)
;stm32f10x_tim.c,1491 :: 		TIMx->CR2 |= TIM_CR2_CCPC;
ADDS	R3, R0, #4
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #1
STRH	R2, [R3, #0]
;stm32f10x_tim.c,1492 :: 		}
IT	AL
BAL	L_TIM_CCPreloadControl114
L_TIM_CCPreloadControl113:
;stm32f10x_tim.c,1496 :: 		TIMx->CR2 &= (uint16_t)~((uint16_t)TIM_CR2_CCPC);
; TIMx start address is: 0 (R0)
ADDS	R4, R0, #4
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65534
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1497 :: 		}
L_TIM_CCPreloadControl114:
;stm32f10x_tim.c,1498 :: 		}
L_end_TIM_CCPreloadControl:
BX	LR
; end of _TIM_CCPreloadControl
_TIM_OC1PreloadConfig:
;stm32f10x_tim.c,1509 :: 		void TIM_OC1PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
; TIM_OCPreload start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCPreload end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCPreload start address is: 4 (R1)
;stm32f10x_tim.c,1511 :: 		uint16_t tmpccmr1 = 0;
;stm32f10x_tim.c,1515 :: 		tmpccmr1 = TIMx->CCMR1;
ADDW	R4, R0, #24
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1517 :: 		tmpccmr1 &= (uint16_t)~((uint16_t)TIM_CCMR1_OC1PE);
MOVW	R2, #65527
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f10x_tim.c,1519 :: 		tmpccmr1 |= TIM_OCPreload;
ORRS	R2, R1
; TIM_OCPreload end address is: 4 (R1)
;stm32f10x_tim.c,1521 :: 		TIMx->CCMR1 = tmpccmr1;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1522 :: 		}
L_end_TIM_OC1PreloadConfig:
BX	LR
; end of _TIM_OC1PreloadConfig
_TIM_OC2PreloadConfig:
;stm32f10x_tim.c,1534 :: 		void TIM_OC2PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
; TIM_OCPreload start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCPreload end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCPreload start address is: 4 (R1)
;stm32f10x_tim.c,1536 :: 		uint16_t tmpccmr1 = 0;
;stm32f10x_tim.c,1540 :: 		tmpccmr1 = TIMx->CCMR1;
ADDW	R4, R0, #24
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1542 :: 		tmpccmr1 &= (uint16_t)~((uint16_t)TIM_CCMR1_OC2PE);
MOVW	R2, #63487
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,1544 :: 		tmpccmr1 |= (uint16_t)(TIM_OCPreload << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; TIM_OCPreload end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f10x_tim.c,1546 :: 		TIMx->CCMR1 = tmpccmr1;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1547 :: 		}
L_end_TIM_OC2PreloadConfig:
BX	LR
; end of _TIM_OC2PreloadConfig
_TIM_OC3PreloadConfig:
;stm32f10x_tim.c,1558 :: 		void TIM_OC3PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
; TIM_OCPreload start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCPreload end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCPreload start address is: 4 (R1)
;stm32f10x_tim.c,1560 :: 		uint16_t tmpccmr2 = 0;
;stm32f10x_tim.c,1564 :: 		tmpccmr2 = TIMx->CCMR2;
ADDW	R4, R0, #28
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1566 :: 		tmpccmr2 &= (uint16_t)~((uint16_t)TIM_CCMR2_OC3PE);
MOVW	R2, #65527
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f10x_tim.c,1568 :: 		tmpccmr2 |= TIM_OCPreload;
ORRS	R2, R1
; TIM_OCPreload end address is: 4 (R1)
;stm32f10x_tim.c,1570 :: 		TIMx->CCMR2 = tmpccmr2;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1571 :: 		}
L_end_TIM_OC3PreloadConfig:
BX	LR
; end of _TIM_OC3PreloadConfig
_TIM_OC4PreloadConfig:
;stm32f10x_tim.c,1582 :: 		void TIM_OC4PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
; TIM_OCPreload start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCPreload end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCPreload start address is: 4 (R1)
;stm32f10x_tim.c,1584 :: 		uint16_t tmpccmr2 = 0;
;stm32f10x_tim.c,1588 :: 		tmpccmr2 = TIMx->CCMR2;
ADDW	R4, R0, #28
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1590 :: 		tmpccmr2 &= (uint16_t)~((uint16_t)TIM_CCMR2_OC4PE);
MOVW	R2, #63487
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,1592 :: 		tmpccmr2 |= (uint16_t)(TIM_OCPreload << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; TIM_OCPreload end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f10x_tim.c,1594 :: 		TIMx->CCMR2 = tmpccmr2;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1595 :: 		}
L_end_TIM_OC4PreloadConfig:
BX	LR
; end of _TIM_OC4PreloadConfig
_TIM_OC1FastConfig:
;stm32f10x_tim.c,1606 :: 		void TIM_OC1FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
; TIM_OCFast start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCFast end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCFast start address is: 4 (R1)
;stm32f10x_tim.c,1608 :: 		uint16_t tmpccmr1 = 0;
;stm32f10x_tim.c,1613 :: 		tmpccmr1 = TIMx->CCMR1;
ADDW	R4, R0, #24
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1615 :: 		tmpccmr1 &= (uint16_t)~((uint16_t)TIM_CCMR1_OC1FE);
MOVW	R2, #65531
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f10x_tim.c,1617 :: 		tmpccmr1 |= TIM_OCFast;
ORRS	R2, R1
; TIM_OCFast end address is: 4 (R1)
;stm32f10x_tim.c,1619 :: 		TIMx->CCMR1 = tmpccmr1;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1620 :: 		}
L_end_TIM_OC1FastConfig:
BX	LR
; end of _TIM_OC1FastConfig
_TIM_OC2FastConfig:
;stm32f10x_tim.c,1632 :: 		void TIM_OC2FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
; TIM_OCFast start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCFast end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCFast start address is: 4 (R1)
;stm32f10x_tim.c,1634 :: 		uint16_t tmpccmr1 = 0;
;stm32f10x_tim.c,1639 :: 		tmpccmr1 = TIMx->CCMR1;
ADDW	R4, R0, #24
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1641 :: 		tmpccmr1 &= (uint16_t)~((uint16_t)TIM_CCMR1_OC2FE);
MOVW	R2, #64511
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,1643 :: 		tmpccmr1 |= (uint16_t)(TIM_OCFast << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; TIM_OCFast end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f10x_tim.c,1645 :: 		TIMx->CCMR1 = tmpccmr1;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1646 :: 		}
L_end_TIM_OC2FastConfig:
BX	LR
; end of _TIM_OC2FastConfig
_TIM_OC3FastConfig:
;stm32f10x_tim.c,1657 :: 		void TIM_OC3FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
; TIM_OCFast start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCFast end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCFast start address is: 4 (R1)
;stm32f10x_tim.c,1659 :: 		uint16_t tmpccmr2 = 0;
;stm32f10x_tim.c,1664 :: 		tmpccmr2 = TIMx->CCMR2;
ADDW	R4, R0, #28
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1666 :: 		tmpccmr2 &= (uint16_t)~((uint16_t)TIM_CCMR2_OC3FE);
MOVW	R2, #65531
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f10x_tim.c,1668 :: 		tmpccmr2 |= TIM_OCFast;
ORRS	R2, R1
; TIM_OCFast end address is: 4 (R1)
;stm32f10x_tim.c,1670 :: 		TIMx->CCMR2 = tmpccmr2;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1671 :: 		}
L_end_TIM_OC3FastConfig:
BX	LR
; end of _TIM_OC3FastConfig
_TIM_OC4FastConfig:
;stm32f10x_tim.c,1682 :: 		void TIM_OC4FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
; TIM_OCFast start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCFast end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCFast start address is: 4 (R1)
;stm32f10x_tim.c,1684 :: 		uint16_t tmpccmr2 = 0;
;stm32f10x_tim.c,1689 :: 		tmpccmr2 = TIMx->CCMR2;
ADDW	R4, R0, #28
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1691 :: 		tmpccmr2 &= (uint16_t)~((uint16_t)TIM_CCMR2_OC4FE);
MOVW	R2, #64511
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,1693 :: 		tmpccmr2 |= (uint16_t)(TIM_OCFast << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; TIM_OCFast end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f10x_tim.c,1695 :: 		TIMx->CCMR2 = tmpccmr2;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1696 :: 		}
L_end_TIM_OC4FastConfig:
BX	LR
; end of _TIM_OC4FastConfig
_TIM_ClearOC1Ref:
;stm32f10x_tim.c,1707 :: 		void TIM_ClearOC1Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
; TIM_OCClear start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCClear end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCClear start address is: 4 (R1)
;stm32f10x_tim.c,1709 :: 		uint16_t tmpccmr1 = 0;
;stm32f10x_tim.c,1714 :: 		tmpccmr1 = TIMx->CCMR1;
ADDW	R4, R0, #24
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1717 :: 		tmpccmr1 &= (uint16_t)~((uint16_t)TIM_CCMR1_OC1CE);
MOVW	R2, #65407
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f10x_tim.c,1719 :: 		tmpccmr1 |= TIM_OCClear;
ORRS	R2, R1
; TIM_OCClear end address is: 4 (R1)
;stm32f10x_tim.c,1721 :: 		TIMx->CCMR1 = tmpccmr1;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1722 :: 		}
L_end_TIM_ClearOC1Ref:
BX	LR
; end of _TIM_ClearOC1Ref
_TIM_ClearOC2Ref:
;stm32f10x_tim.c,1733 :: 		void TIM_ClearOC2Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
; TIM_OCClear start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCClear end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCClear start address is: 4 (R1)
;stm32f10x_tim.c,1735 :: 		uint16_t tmpccmr1 = 0;
;stm32f10x_tim.c,1739 :: 		tmpccmr1 = TIMx->CCMR1;
ADDW	R4, R0, #24
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1741 :: 		tmpccmr1 &= (uint16_t)~((uint16_t)TIM_CCMR1_OC2CE);
MOVW	R2, #32767
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,1743 :: 		tmpccmr1 |= (uint16_t)(TIM_OCClear << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; TIM_OCClear end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f10x_tim.c,1745 :: 		TIMx->CCMR1 = tmpccmr1;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1746 :: 		}
L_end_TIM_ClearOC2Ref:
BX	LR
; end of _TIM_ClearOC2Ref
_TIM_ClearOC3Ref:
;stm32f10x_tim.c,1757 :: 		void TIM_ClearOC3Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
; TIM_OCClear start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCClear end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCClear start address is: 4 (R1)
;stm32f10x_tim.c,1759 :: 		uint16_t tmpccmr2 = 0;
;stm32f10x_tim.c,1763 :: 		tmpccmr2 = TIMx->CCMR2;
ADDW	R4, R0, #28
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1765 :: 		tmpccmr2 &= (uint16_t)~((uint16_t)TIM_CCMR2_OC3CE);
MOVW	R2, #65407
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f10x_tim.c,1767 :: 		tmpccmr2 |= TIM_OCClear;
ORRS	R2, R1
; TIM_OCClear end address is: 4 (R1)
;stm32f10x_tim.c,1769 :: 		TIMx->CCMR2 = tmpccmr2;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1770 :: 		}
L_end_TIM_ClearOC3Ref:
BX	LR
; end of _TIM_ClearOC3Ref
_TIM_ClearOC4Ref:
;stm32f10x_tim.c,1781 :: 		void TIM_ClearOC4Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
; TIM_OCClear start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCClear end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCClear start address is: 4 (R1)
;stm32f10x_tim.c,1783 :: 		uint16_t tmpccmr2 = 0;
;stm32f10x_tim.c,1787 :: 		tmpccmr2 = TIMx->CCMR2;
ADDW	R4, R0, #28
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1789 :: 		tmpccmr2 &= (uint16_t)~((uint16_t)TIM_CCMR2_OC4CE);
MOVW	R2, #32767
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,1791 :: 		tmpccmr2 |= (uint16_t)(TIM_OCClear << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; TIM_OCClear end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f10x_tim.c,1793 :: 		TIMx->CCMR2 = tmpccmr2;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1794 :: 		}
L_end_TIM_ClearOC4Ref:
BX	LR
; end of _TIM_ClearOC4Ref
_TIM_OC1PolarityConfig:
;stm32f10x_tim.c,1805 :: 		void TIM_OC1PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
; TIM_OCPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCPolarity start address is: 4 (R1)
;stm32f10x_tim.c,1807 :: 		uint16_t tmpccer = 0;
;stm32f10x_tim.c,1811 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1813 :: 		tmpccer &= (uint16_t)~((uint16_t)TIM_CCER_CC1P);
MOVW	R2, #65533
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f10x_tim.c,1814 :: 		tmpccer |= TIM_OCPolarity;
ORRS	R2, R1
; TIM_OCPolarity end address is: 4 (R1)
;stm32f10x_tim.c,1816 :: 		TIMx->CCER = tmpccer;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1817 :: 		}
L_end_TIM_OC1PolarityConfig:
BX	LR
; end of _TIM_OC1PolarityConfig
_TIM_OC1NPolarityConfig:
;stm32f10x_tim.c,1828 :: 		void TIM_OC1NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity)
; TIM_OCNPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCNPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCNPolarity start address is: 4 (R1)
;stm32f10x_tim.c,1830 :: 		uint16_t tmpccer = 0;
;stm32f10x_tim.c,1835 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1837 :: 		tmpccer &= (uint16_t)~((uint16_t)TIM_CCER_CC1NP);
MOVW	R2, #65527
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f10x_tim.c,1838 :: 		tmpccer |= TIM_OCNPolarity;
ORRS	R2, R1
; TIM_OCNPolarity end address is: 4 (R1)
;stm32f10x_tim.c,1840 :: 		TIMx->CCER = tmpccer;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1841 :: 		}
L_end_TIM_OC1NPolarityConfig:
BX	LR
; end of _TIM_OC1NPolarityConfig
_TIM_OC2PolarityConfig:
;stm32f10x_tim.c,1852 :: 		void TIM_OC2PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
; TIM_OCPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCPolarity start address is: 4 (R1)
;stm32f10x_tim.c,1854 :: 		uint16_t tmpccer = 0;
;stm32f10x_tim.c,1858 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1860 :: 		tmpccer &= (uint16_t)~((uint16_t)TIM_CCER_CC2P);
MOVW	R2, #65503
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,1861 :: 		tmpccer |= (uint16_t)(TIM_OCPolarity << 4);
LSLS	R2, R1, #4
UXTH	R2, R2
; TIM_OCPolarity end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f10x_tim.c,1863 :: 		TIMx->CCER = tmpccer;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1864 :: 		}
L_end_TIM_OC2PolarityConfig:
BX	LR
; end of _TIM_OC2PolarityConfig
_TIM_OC2NPolarityConfig:
;stm32f10x_tim.c,1875 :: 		void TIM_OC2NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity)
; TIM_OCNPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCNPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCNPolarity start address is: 4 (R1)
;stm32f10x_tim.c,1877 :: 		uint16_t tmpccer = 0;
;stm32f10x_tim.c,1882 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1884 :: 		tmpccer &= (uint16_t)~((uint16_t)TIM_CCER_CC2NP);
MOVW	R2, #65407
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,1885 :: 		tmpccer |= (uint16_t)(TIM_OCNPolarity << 4);
LSLS	R2, R1, #4
UXTH	R2, R2
; TIM_OCNPolarity end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f10x_tim.c,1887 :: 		TIMx->CCER = tmpccer;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1888 :: 		}
L_end_TIM_OC2NPolarityConfig:
BX	LR
; end of _TIM_OC2NPolarityConfig
_TIM_OC3PolarityConfig:
;stm32f10x_tim.c,1899 :: 		void TIM_OC3PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
; TIM_OCPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCPolarity start address is: 4 (R1)
;stm32f10x_tim.c,1901 :: 		uint16_t tmpccer = 0;
;stm32f10x_tim.c,1905 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1907 :: 		tmpccer &= (uint16_t)~((uint16_t)TIM_CCER_CC3P);
MOVW	R2, #65023
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,1908 :: 		tmpccer |= (uint16_t)(TIM_OCPolarity << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; TIM_OCPolarity end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f10x_tim.c,1910 :: 		TIMx->CCER = tmpccer;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1911 :: 		}
L_end_TIM_OC3PolarityConfig:
BX	LR
; end of _TIM_OC3PolarityConfig
_TIM_OC3NPolarityConfig:
;stm32f10x_tim.c,1922 :: 		void TIM_OC3NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity)
; TIM_OCNPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCNPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCNPolarity start address is: 4 (R1)
;stm32f10x_tim.c,1924 :: 		uint16_t tmpccer = 0;
;stm32f10x_tim.c,1930 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1932 :: 		tmpccer &= (uint16_t)~((uint16_t)TIM_CCER_CC3NP);
MOVW	R2, #63487
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,1933 :: 		tmpccer |= (uint16_t)(TIM_OCNPolarity << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; TIM_OCNPolarity end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f10x_tim.c,1935 :: 		TIMx->CCER = tmpccer;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1936 :: 		}
L_end_TIM_OC3NPolarityConfig:
BX	LR
; end of _TIM_OC3NPolarityConfig
_TIM_OC4PolarityConfig:
;stm32f10x_tim.c,1947 :: 		void TIM_OC4PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
; TIM_OCPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCPolarity start address is: 4 (R1)
;stm32f10x_tim.c,1949 :: 		uint16_t tmpccer = 0;
;stm32f10x_tim.c,1953 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_tim.c,1955 :: 		tmpccer &= (uint16_t)~((uint16_t)TIM_CCER_CC4P);
MOVW	R2, #57343
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_tim.c,1956 :: 		tmpccer |= (uint16_t)(TIM_OCPolarity << 12);
LSLS	R2, R1, #12
UXTH	R2, R2
; TIM_OCPolarity end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f10x_tim.c,1958 :: 		TIMx->CCER = tmpccer;
STRH	R2, [R4, #0]
;stm32f10x_tim.c,1959 :: 		}
L_end_TIM_OC4PolarityConfig:
BX	LR
; end of _TIM_OC4PolarityConfig
_TIM_CCxCmd:
;stm32f10x_tim.c,1974 :: 		void TIM_CCxCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCx)
; TIM_CCx start address is: 8 (R2)
; TIM_Channel start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_CCx end address is: 8 (R2)
; TIM_Channel end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_Channel start address is: 4 (R1)
; TIM_CCx start address is: 8 (R2)
;stm32f10x_tim.c,1976 :: 		uint16_t tmp = 0;
;stm32f10x_tim.c,1983 :: 		tmp = CCER_CCE_Set << TIM_Channel;
MOVW	R3, #1
LSLS	R3, R1
UXTH	R3, R3
;stm32f10x_tim.c,1986 :: 		TIMx->CCER &= (uint16_t)~ tmp;
ADDW	R5, R0, #32
MVN	R4, R3
UXTH	R4, R4
LDRH	R3, [R5, #0]
ANDS	R3, R4
STRH	R3, [R5, #0]
;stm32f10x_tim.c,1989 :: 		TIMx->CCER |=  (uint16_t)(TIM_CCx << TIM_Channel);
ADDW	R5, R0, #32
; TIMx end address is: 0 (R0)
LSL	R4, R2, R1
UXTH	R4, R4
; TIM_Channel end address is: 4 (R1)
; TIM_CCx end address is: 8 (R2)
LDRH	R3, [R5, #0]
ORRS	R3, R4
STRH	R3, [R5, #0]
;stm32f10x_tim.c,1990 :: 		}
L_end_TIM_CCxCmd:
BX	LR
; end of _TIM_CCxCmd
_TIM_CCxNCmd:
;stm32f10x_tim.c,2004 :: 		void TIM_CCxNCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCxN)
; TIM_CCxN start address is: 8 (R2)
; TIM_Channel start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_CCxN end address is: 8 (R2)
; TIM_Channel end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_Channel start address is: 4 (R1)
; TIM_CCxN start address is: 8 (R2)
;stm32f10x_tim.c,2006 :: 		uint16_t tmp = 0;
;stm32f10x_tim.c,2013 :: 		tmp = CCER_CCNE_Set << TIM_Channel;
MOVW	R3, #4
LSLS	R3, R1
UXTH	R3, R3
;stm32f10x_tim.c,2016 :: 		TIMx->CCER &= (uint16_t) ~tmp;
ADDW	R5, R0, #32
MVN	R4, R3
UXTH	R4, R4
LDRH	R3, [R5, #0]
ANDS	R3, R4
STRH	R3, [R5, #0]
;stm32f10x_tim.c,2019 :: 		TIMx->CCER |=  (uint16_t)(TIM_CCxN << TIM_Channel);
ADDW	R5, R0, #32
; TIMx end address is: 0 (R0)
LSL	R4, R2, R1
UXTH	R4, R4
; TIM_Channel end address is: 4 (R1)
; TIM_CCxN end address is: 8 (R2)
LDRH	R3, [R5, #0]
ORRS	R3, R4
STRH	R3, [R5, #0]
;stm32f10x_tim.c,2020 :: 		}
L_end_TIM_CCxNCmd:
BX	LR
; end of _TIM_CCxNCmd
_TIM_SelectOCxM:
;stm32f10x_tim.c,2045 :: 		void TIM_SelectOCxM(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_OCMode)
; TIM_OCMode start address is: 8 (R2)
; TIM_Channel start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCMode end address is: 8 (R2)
; TIM_Channel end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_Channel start address is: 4 (R1)
; TIM_OCMode start address is: 8 (R2)
;stm32f10x_tim.c,2047 :: 		uint32_t tmp = 0;
;stm32f10x_tim.c,2048 :: 		uint16_t tmp1 = 0;
;stm32f10x_tim.c,2056 :: 		tmp += CCMR_Offset;
ADDW	R3, R0, #24
; tmp start address is: 24 (R6)
MOV	R6, R3
;stm32f10x_tim.c,2058 :: 		tmp1 = CCER_CCE_Set << (uint16_t)TIM_Channel;
MOVW	R3, #1
LSLS	R3, R1
UXTH	R3, R3
;stm32f10x_tim.c,2061 :: 		TIMx->CCER &= (uint16_t) ~tmp1;
ADDW	R5, R0, #32
; TIMx end address is: 0 (R0)
MVN	R4, R3
UXTH	R4, R4
LDRH	R3, [R5, #0]
ANDS	R3, R4
STRH	R3, [R5, #0]
;stm32f10x_tim.c,2063 :: 		if((TIM_Channel == TIM_Channel_1) ||(TIM_Channel == TIM_Channel_3))
CMP	R1, #0
IT	EQ
BEQ	L__TIM_SelectOCxM224
CMP	R1, #8
IT	EQ
BEQ	L__TIM_SelectOCxM223
IT	AL
BAL	L_TIM_SelectOCxM117
L__TIM_SelectOCxM224:
L__TIM_SelectOCxM223:
;stm32f10x_tim.c,2065 :: 		tmp += (TIM_Channel>>1);
LSRS	R3, R1, #1
UXTH	R3, R3
; TIM_Channel end address is: 4 (R1)
ADDS	R5, R6, R3
; tmp end address is: 24 (R6)
; tmp start address is: 0 (R0)
MOV	R0, R5
;stm32f10x_tim.c,2068 :: 		*(__IO uint32_t *) tmp &= (uint32_t)~((uint32_t)TIM_CCMR1_OC1M);
LDR	R4, [R5, #0]
MVN	R3, #112
AND	R3, R4, R3, LSL #0
STR	R3, [R5, #0]
;stm32f10x_tim.c,2071 :: 		*(__IO uint32_t *) tmp |= TIM_OCMode;
LDR	R3, [R0, #0]
ORRS	R3, R2
; TIM_OCMode end address is: 8 (R2)
STR	R3, [R0, #0]
; tmp end address is: 0 (R0)
;stm32f10x_tim.c,2072 :: 		}
IT	AL
BAL	L_TIM_SelectOCxM118
L_TIM_SelectOCxM117:
;stm32f10x_tim.c,2075 :: 		tmp += (uint16_t)(TIM_Channel - (uint16_t)4)>> (uint16_t)1;
; tmp start address is: 24 (R6)
; TIM_OCMode start address is: 8 (R2)
; TIM_Channel start address is: 4 (R1)
SUBS	R3, R1, #4
UXTH	R3, R3
; TIM_Channel end address is: 4 (R1)
LSRS	R3, R3, #1
UXTH	R3, R3
ADDS	R5, R6, R3
; tmp end address is: 24 (R6)
; tmp start address is: 0 (R0)
MOV	R0, R5
;stm32f10x_tim.c,2078 :: 		*(__IO uint32_t *) tmp &= (uint32_t)~((uint32_t)TIM_CCMR1_OC2M);
LDR	R4, [R5, #0]
MVN	R3, #28672
AND	R3, R4, R3, LSL #0
STR	R3, [R5, #0]
;stm32f10x_tim.c,2081 :: 		*(__IO uint32_t *) tmp |= (uint16_t)(TIM_OCMode << 8);
LSLS	R4, R2, #8
UXTH	R4, R4
; TIM_OCMode end address is: 8 (R2)
LDR	R3, [R0, #0]
ORRS	R3, R4
STR	R3, [R0, #0]
; tmp end address is: 0 (R0)
;stm32f10x_tim.c,2082 :: 		}
L_TIM_SelectOCxM118:
;stm32f10x_tim.c,2083 :: 		}
L_end_TIM_SelectOCxM:
BX	LR
; end of _TIM_SelectOCxM
_TIM_UpdateDisableConfig:
;stm32f10x_tim.c,2092 :: 		void TIM_UpdateDisableConfig(TIM_TypeDef* TIMx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_tim.c,2097 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_TIM_UpdateDisableConfig119
; NewState end address is: 4 (R1)
;stm32f10x_tim.c,2100 :: 		TIMx->CR1 |= TIM_CR1_UDIS;
LDRH	R2, [R0, #0]
ORR	R2, R2, #2
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,2101 :: 		}
IT	AL
BAL	L_TIM_UpdateDisableConfig120
L_TIM_UpdateDisableConfig119:
;stm32f10x_tim.c,2105 :: 		TIMx->CR1 &= (uint16_t)~((uint16_t)TIM_CR1_UDIS);
; TIMx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65533
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,2106 :: 		}
L_TIM_UpdateDisableConfig120:
;stm32f10x_tim.c,2107 :: 		}
L_end_TIM_UpdateDisableConfig:
BX	LR
; end of _TIM_UpdateDisableConfig
_TIM_UpdateRequestConfig:
;stm32f10x_tim.c,2120 :: 		void TIM_UpdateRequestConfig(TIM_TypeDef* TIMx, uint16_t TIM_UpdateSource)
; TIM_UpdateSource start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_UpdateSource end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_UpdateSource start address is: 4 (R1)
;stm32f10x_tim.c,2125 :: 		if (TIM_UpdateSource != TIM_UpdateSource_Global)
CMP	R1, #0
IT	EQ
BEQ	L_TIM_UpdateRequestConfig121
; TIM_UpdateSource end address is: 4 (R1)
;stm32f10x_tim.c,2128 :: 		TIMx->CR1 |= TIM_CR1_URS;
LDRH	R2, [R0, #0]
ORR	R2, R2, #4
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,2129 :: 		}
IT	AL
BAL	L_TIM_UpdateRequestConfig122
L_TIM_UpdateRequestConfig121:
;stm32f10x_tim.c,2133 :: 		TIMx->CR1 &= (uint16_t)~((uint16_t)TIM_CR1_URS);
; TIMx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65531
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,2134 :: 		}
L_TIM_UpdateRequestConfig122:
;stm32f10x_tim.c,2135 :: 		}
L_end_TIM_UpdateRequestConfig:
BX	LR
; end of _TIM_UpdateRequestConfig
_TIM_SelectHallSensor:
;stm32f10x_tim.c,2144 :: 		void TIM_SelectHallSensor(TIM_TypeDef* TIMx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_tim.c,2149 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_TIM_SelectHallSensor123
; NewState end address is: 4 (R1)
;stm32f10x_tim.c,2152 :: 		TIMx->CR2 |= TIM_CR2_TI1S;
ADDS	R3, R0, #4
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #128
STRH	R2, [R3, #0]
;stm32f10x_tim.c,2153 :: 		}
IT	AL
BAL	L_TIM_SelectHallSensor124
L_TIM_SelectHallSensor123:
;stm32f10x_tim.c,2157 :: 		TIMx->CR2 &= (uint16_t)~((uint16_t)TIM_CR2_TI1S);
; TIMx start address is: 0 (R0)
ADDS	R4, R0, #4
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65407
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_tim.c,2158 :: 		}
L_TIM_SelectHallSensor124:
;stm32f10x_tim.c,2159 :: 		}
L_end_TIM_SelectHallSensor:
BX	LR
; end of _TIM_SelectHallSensor
_TIM_SelectOnePulseMode:
;stm32f10x_tim.c,2170 :: 		void TIM_SelectOnePulseMode(TIM_TypeDef* TIMx, uint16_t TIM_OPMode)
; TIM_OPMode start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OPMode end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OPMode start address is: 4 (R1)
;stm32f10x_tim.c,2176 :: 		TIMx->CR1 &= (uint16_t)~((uint16_t)TIM_CR1_OPM);
LDRH	R3, [R0, #0]
MOVW	R2, #65527
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
;stm32f10x_tim.c,2178 :: 		TIMx->CR1 |= TIM_OPMode;
LDRH	R2, [R0, #0]
ORRS	R2, R1
; TIM_OPMode end address is: 4 (R1)
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,2179 :: 		}
L_end_TIM_SelectOnePulseMode:
BX	LR
; end of _TIM_SelectOnePulseMode
_TIM_SelectOutputTrigger:
;stm32f10x_tim.c,2202 :: 		void TIM_SelectOutputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_TRGOSource)
; TIM_TRGOSource start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_TRGOSource end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_TRGOSource start address is: 4 (R1)
;stm32f10x_tim.c,2208 :: 		TIMx->CR2 &= (uint16_t)~((uint16_t)TIM_CR2_MMS);
ADDS	R4, R0, #4
LDRH	R3, [R4, #0]
MOVW	R2, #65423
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_tim.c,2210 :: 		TIMx->CR2 |=  TIM_TRGOSource;
ADDS	R3, R0, #4
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORRS	R2, R1
; TIM_TRGOSource end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f10x_tim.c,2211 :: 		}
L_end_TIM_SelectOutputTrigger:
BX	LR
; end of _TIM_SelectOutputTrigger
_TIM_SelectSlaveMode:
;stm32f10x_tim.c,2225 :: 		void TIM_SelectSlaveMode(TIM_TypeDef* TIMx, uint16_t TIM_SlaveMode)
; TIM_SlaveMode start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_SlaveMode end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_SlaveMode start address is: 4 (R1)
;stm32f10x_tim.c,2231 :: 		TIMx->SMCR &= (uint16_t)~((uint16_t)TIM_SMCR_SMS);
ADDW	R4, R0, #8
LDRH	R3, [R4, #0]
MOVW	R2, #65528
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_tim.c,2233 :: 		TIMx->SMCR |= TIM_SlaveMode;
ADDW	R3, R0, #8
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORRS	R2, R1
; TIM_SlaveMode end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f10x_tim.c,2234 :: 		}
L_end_TIM_SelectSlaveMode:
BX	LR
; end of _TIM_SelectSlaveMode
_TIM_SelectMasterSlaveMode:
;stm32f10x_tim.c,2246 :: 		void TIM_SelectMasterSlaveMode(TIM_TypeDef* TIMx, uint16_t TIM_MasterSlaveMode)
; TIM_MasterSlaveMode start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_MasterSlaveMode end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_MasterSlaveMode start address is: 4 (R1)
;stm32f10x_tim.c,2252 :: 		TIMx->SMCR &= (uint16_t)~((uint16_t)TIM_SMCR_MSM);
ADDW	R4, R0, #8
LDRH	R3, [R4, #0]
MOVW	R2, #65407
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_tim.c,2255 :: 		TIMx->SMCR |= TIM_MasterSlaveMode;
ADDW	R3, R0, #8
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORRS	R2, R1
; TIM_MasterSlaveMode end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f10x_tim.c,2256 :: 		}
L_end_TIM_SelectMasterSlaveMode:
BX	LR
; end of _TIM_SelectMasterSlaveMode
_TIM_SetCounter:
;stm32f10x_tim.c,2264 :: 		void TIM_SetCounter(TIM_TypeDef* TIMx, uint16_t Counter)
; Counter start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; Counter end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; Counter start address is: 4 (R1)
;stm32f10x_tim.c,2269 :: 		TIMx->CNT = Counter;
ADDW	R2, R0, #36
; TIMx end address is: 0 (R0)
STRH	R1, [R2, #0]
; Counter end address is: 4 (R1)
;stm32f10x_tim.c,2270 :: 		}
L_end_TIM_SetCounter:
BX	LR
; end of _TIM_SetCounter
_TIM_SetAutoreload:
;stm32f10x_tim.c,2278 :: 		void TIM_SetAutoreload(TIM_TypeDef* TIMx, uint16_t Autoreload)
; Autoreload start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; Autoreload end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; Autoreload start address is: 4 (R1)
;stm32f10x_tim.c,2283 :: 		TIMx->ARR = Autoreload;
ADDW	R2, R0, #44
; TIMx end address is: 0 (R0)
STRH	R1, [R2, #0]
; Autoreload end address is: 4 (R1)
;stm32f10x_tim.c,2284 :: 		}
L_end_TIM_SetAutoreload:
BX	LR
; end of _TIM_SetAutoreload
_TIM_SetCompare1:
;stm32f10x_tim.c,2292 :: 		void TIM_SetCompare1(TIM_TypeDef* TIMx, uint16_t Compare1)
; Compare1 start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; Compare1 end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; Compare1 start address is: 4 (R1)
;stm32f10x_tim.c,2297 :: 		TIMx->CCR1 = Compare1;
ADDW	R2, R0, #52
; TIMx end address is: 0 (R0)
STRH	R1, [R2, #0]
; Compare1 end address is: 4 (R1)
;stm32f10x_tim.c,2298 :: 		}
L_end_TIM_SetCompare1:
BX	LR
; end of _TIM_SetCompare1
_TIM_SetCompare2:
;stm32f10x_tim.c,2306 :: 		void TIM_SetCompare2(TIM_TypeDef* TIMx, uint16_t Compare2)
; Compare2 start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; Compare2 end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; Compare2 start address is: 4 (R1)
;stm32f10x_tim.c,2311 :: 		TIMx->CCR2 = Compare2;
ADDW	R2, R0, #56
; TIMx end address is: 0 (R0)
STRH	R1, [R2, #0]
; Compare2 end address is: 4 (R1)
;stm32f10x_tim.c,2312 :: 		}
L_end_TIM_SetCompare2:
BX	LR
; end of _TIM_SetCompare2
_TIM_SetCompare3:
;stm32f10x_tim.c,2320 :: 		void TIM_SetCompare3(TIM_TypeDef* TIMx, uint16_t Compare3)
; Compare3 start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; Compare3 end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; Compare3 start address is: 4 (R1)
;stm32f10x_tim.c,2325 :: 		TIMx->CCR3 = Compare3;
ADDW	R2, R0, #60
; TIMx end address is: 0 (R0)
STRH	R1, [R2, #0]
; Compare3 end address is: 4 (R1)
;stm32f10x_tim.c,2326 :: 		}
L_end_TIM_SetCompare3:
BX	LR
; end of _TIM_SetCompare3
_TIM_SetCompare4:
;stm32f10x_tim.c,2334 :: 		void TIM_SetCompare4(TIM_TypeDef* TIMx, uint16_t Compare4)
; Compare4 start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; Compare4 end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; Compare4 start address is: 4 (R1)
;stm32f10x_tim.c,2339 :: 		TIMx->CCR4 = Compare4;
ADDW	R2, R0, #64
; TIMx end address is: 0 (R0)
STRH	R1, [R2, #0]
; Compare4 end address is: 4 (R1)
;stm32f10x_tim.c,2340 :: 		}
L_end_TIM_SetCompare4:
BX	LR
; end of _TIM_SetCompare4
_TIM_SetIC1Prescaler:
;stm32f10x_tim.c,2353 :: 		void TIM_SetIC1Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
; TIM_ICPSC start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ICPSC end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ICPSC start address is: 4 (R1)
;stm32f10x_tim.c,2359 :: 		TIMx->CCMR1 &= (uint16_t)~((uint16_t)TIM_CCMR1_IC1PSC);
ADDW	R4, R0, #24
LDRH	R3, [R4, #0]
MOVW	R2, #65523
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_tim.c,2361 :: 		TIMx->CCMR1 |= TIM_ICPSC;
ADDW	R3, R0, #24
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORRS	R2, R1
; TIM_ICPSC end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f10x_tim.c,2362 :: 		}
L_end_TIM_SetIC1Prescaler:
BX	LR
; end of _TIM_SetIC1Prescaler
_TIM_SetIC2Prescaler:
;stm32f10x_tim.c,2375 :: 		void TIM_SetIC2Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
; TIM_ICPSC start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ICPSC end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ICPSC start address is: 4 (R1)
;stm32f10x_tim.c,2381 :: 		TIMx->CCMR1 &= (uint16_t)~((uint16_t)TIM_CCMR1_IC2PSC);
ADDW	R4, R0, #24
LDRH	R3, [R4, #0]
MOVW	R2, #62463
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_tim.c,2383 :: 		TIMx->CCMR1 |= (uint16_t)(TIM_ICPSC << 8);
ADDW	R4, R0, #24
; TIMx end address is: 0 (R0)
LSLS	R3, R1, #8
UXTH	R3, R3
; TIM_ICPSC end address is: 4 (R1)
LDRH	R2, [R4, #0]
ORRS	R2, R3
STRH	R2, [R4, #0]
;stm32f10x_tim.c,2384 :: 		}
L_end_TIM_SetIC2Prescaler:
BX	LR
; end of _TIM_SetIC2Prescaler
_TIM_SetIC3Prescaler:
;stm32f10x_tim.c,2397 :: 		void TIM_SetIC3Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
; TIM_ICPSC start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ICPSC end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ICPSC start address is: 4 (R1)
;stm32f10x_tim.c,2403 :: 		TIMx->CCMR2 &= (uint16_t)~((uint16_t)TIM_CCMR2_IC3PSC);
ADDW	R4, R0, #28
LDRH	R3, [R4, #0]
MOVW	R2, #65523
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_tim.c,2405 :: 		TIMx->CCMR2 |= TIM_ICPSC;
ADDW	R3, R0, #28
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORRS	R2, R1
; TIM_ICPSC end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f10x_tim.c,2406 :: 		}
L_end_TIM_SetIC3Prescaler:
BX	LR
; end of _TIM_SetIC3Prescaler
_TIM_SetIC4Prescaler:
;stm32f10x_tim.c,2419 :: 		void TIM_SetIC4Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
; TIM_ICPSC start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ICPSC end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ICPSC start address is: 4 (R1)
;stm32f10x_tim.c,2425 :: 		TIMx->CCMR2 &= (uint16_t)~((uint16_t)TIM_CCMR2_IC4PSC);
ADDW	R4, R0, #28
LDRH	R3, [R4, #0]
MOVW	R2, #62463
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_tim.c,2427 :: 		TIMx->CCMR2 |= (uint16_t)(TIM_ICPSC << 8);
ADDW	R4, R0, #28
; TIMx end address is: 0 (R0)
LSLS	R3, R1, #8
UXTH	R3, R3
; TIM_ICPSC end address is: 4 (R1)
LDRH	R2, [R4, #0]
ORRS	R2, R3
STRH	R2, [R4, #0]
;stm32f10x_tim.c,2428 :: 		}
L_end_TIM_SetIC4Prescaler:
BX	LR
; end of _TIM_SetIC4Prescaler
_TIM_SetClockDivision:
;stm32f10x_tim.c,2441 :: 		void TIM_SetClockDivision(TIM_TypeDef* TIMx, uint16_t TIM_CKD)
; TIM_CKD start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_CKD end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_CKD start address is: 4 (R1)
;stm32f10x_tim.c,2447 :: 		TIMx->CR1 &= (uint16_t)~((uint16_t)TIM_CR1_CKD);
LDRH	R3, [R0, #0]
MOVW	R2, #64767
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
;stm32f10x_tim.c,2449 :: 		TIMx->CR1 |= TIM_CKD;
LDRH	R2, [R0, #0]
ORRS	R2, R1
; TIM_CKD end address is: 4 (R1)
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f10x_tim.c,2450 :: 		}
L_end_TIM_SetClockDivision:
BX	LR
; end of _TIM_SetClockDivision
_TIM_GetCapture1:
;stm32f10x_tim.c,2457 :: 		uint16_t TIM_GetCapture1(TIM_TypeDef* TIMx)
; TIMx start address is: 0 (R0)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
;stm32f10x_tim.c,2462 :: 		return TIMx->CCR1;
ADDW	R1, R0, #52
; TIMx end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
;stm32f10x_tim.c,2463 :: 		}
L_end_TIM_GetCapture1:
BX	LR
; end of _TIM_GetCapture1
_TIM_GetCapture2:
;stm32f10x_tim.c,2470 :: 		uint16_t TIM_GetCapture2(TIM_TypeDef* TIMx)
; TIMx start address is: 0 (R0)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
;stm32f10x_tim.c,2475 :: 		return TIMx->CCR2;
ADDW	R1, R0, #56
; TIMx end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
;stm32f10x_tim.c,2476 :: 		}
L_end_TIM_GetCapture2:
BX	LR
; end of _TIM_GetCapture2
_TIM_GetCapture3:
;stm32f10x_tim.c,2483 :: 		uint16_t TIM_GetCapture3(TIM_TypeDef* TIMx)
; TIMx start address is: 0 (R0)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
;stm32f10x_tim.c,2488 :: 		return TIMx->CCR3;
ADDW	R1, R0, #60
; TIMx end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
;stm32f10x_tim.c,2489 :: 		}
L_end_TIM_GetCapture3:
BX	LR
; end of _TIM_GetCapture3
_TIM_GetCapture4:
;stm32f10x_tim.c,2496 :: 		uint16_t TIM_GetCapture4(TIM_TypeDef* TIMx)
; TIMx start address is: 0 (R0)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
;stm32f10x_tim.c,2501 :: 		return TIMx->CCR4;
ADDW	R1, R0, #64
; TIMx end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
;stm32f10x_tim.c,2502 :: 		}
L_end_TIM_GetCapture4:
BX	LR
; end of _TIM_GetCapture4
_TIM_GetCounter:
;stm32f10x_tim.c,2509 :: 		uint16_t TIM_GetCounter(TIM_TypeDef* TIMx)
; TIMx start address is: 0 (R0)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
;stm32f10x_tim.c,2514 :: 		return TIMx->CNT;
ADDW	R1, R0, #36
; TIMx end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
;stm32f10x_tim.c,2515 :: 		}
L_end_TIM_GetCounter:
BX	LR
; end of _TIM_GetCounter
_TIM_GetPrescaler:
;stm32f10x_tim.c,2522 :: 		uint16_t TIM_GetPrescaler(TIM_TypeDef* TIMx)
; TIMx start address is: 0 (R0)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
;stm32f10x_tim.c,2527 :: 		return TIMx->PSC;
ADDW	R1, R0, #40
; TIMx end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
;stm32f10x_tim.c,2528 :: 		}
L_end_TIM_GetPrescaler:
BX	LR
; end of _TIM_GetPrescaler
_TIM_GetFlagStatus:
;stm32f10x_tim.c,2556 :: 		FlagStatus TIM_GetFlagStatus(TIM_TypeDef* TIMx, uint16_t TIM_FLAG)
; TIM_FLAG start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_FLAG end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_FLAG start address is: 4 (R1)
;stm32f10x_tim.c,2558 :: 		ITStatus bitstatus = RESET;
;stm32f10x_tim.c,2563 :: 		if ((TIMx->SR & TIM_FLAG) != (uint16_t)RESET)
ADDW	R2, R0, #16
; TIMx end address is: 0 (R0)
LDRH	R2, [R2, #0]
ANDS	R2, R1
UXTH	R2, R2
; TIM_FLAG end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_TIM_GetFlagStatus125
;stm32f10x_tim.c,2565 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_tim.c,2566 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_TIM_GetFlagStatus126
L_TIM_GetFlagStatus125:
;stm32f10x_tim.c,2569 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_tim.c,2570 :: 		}
L_TIM_GetFlagStatus126:
;stm32f10x_tim.c,2571 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_tim.c,2572 :: 		}
L_end_TIM_GetFlagStatus:
BX	LR
; end of _TIM_GetFlagStatus
_TIM_ClearFlag:
;stm32f10x_tim.c,2600 :: 		void TIM_ClearFlag(TIM_TypeDef* TIMx, uint16_t TIM_FLAG)
; TIM_FLAG start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_FLAG end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_FLAG start address is: 4 (R1)
;stm32f10x_tim.c,2607 :: 		TIMx->SR = (uint16_t)~TIM_FLAG;
ADDW	R3, R0, #16
; TIMx end address is: 0 (R0)
MVN	R2, R1
; TIM_FLAG end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f10x_tim.c,2608 :: 		}
L_end_TIM_ClearFlag:
BX	LR
; end of _TIM_ClearFlag
_TIM_GetITStatus:
;stm32f10x_tim.c,2632 :: 		ITStatus TIM_GetITStatus(TIM_TypeDef* TIMx, uint16_t TIM_IT)
; TIM_IT start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_IT end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_IT start address is: 4 (R1)
;stm32f10x_tim.c,2634 :: 		ITStatus bitstatus = RESET;
;stm32f10x_tim.c,2635 :: 		uint16_t itstatus = 0x0, itenable = 0x0;
;stm32f10x_tim.c,2640 :: 		itstatus = TIMx->SR & TIM_IT;
ADDW	R2, R0, #16
LDRH	R2, [R2, #0]
AND	R3, R2, R1, LSL #0
UXTH	R3, R3
;stm32f10x_tim.c,2642 :: 		itenable = TIMx->DIER & TIM_IT;
ADDW	R2, R0, #12
; TIMx end address is: 0 (R0)
LDRH	R2, [R2, #0]
ANDS	R2, R1
; TIM_IT end address is: 4 (R1)
; itenable start address is: 0 (R0)
UXTH	R0, R2
;stm32f10x_tim.c,2643 :: 		if ((itstatus != (uint16_t)RESET) && (itenable != (uint16_t)RESET))
CMP	R3, #0
IT	EQ
BEQ	L__TIM_GetITStatus227
CMP	R0, #0
IT	EQ
BEQ	L__TIM_GetITStatus226
; itenable end address is: 0 (R0)
L__TIM_GetITStatus225:
;stm32f10x_tim.c,2645 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_tim.c,2646 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_TIM_GetITStatus130
;stm32f10x_tim.c,2643 :: 		if ((itstatus != (uint16_t)RESET) && (itenable != (uint16_t)RESET))
L__TIM_GetITStatus227:
L__TIM_GetITStatus226:
;stm32f10x_tim.c,2649 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_tim.c,2650 :: 		}
L_TIM_GetITStatus130:
;stm32f10x_tim.c,2651 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_tim.c,2652 :: 		}
L_end_TIM_GetITStatus:
BX	LR
; end of _TIM_GetITStatus
_TIM_ClearITPendingBit:
;stm32f10x_tim.c,2676 :: 		void TIM_ClearITPendingBit(TIM_TypeDef* TIMx, uint16_t TIM_IT)
; TIM_IT start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_IT end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_IT start address is: 4 (R1)
;stm32f10x_tim.c,2682 :: 		TIMx->SR = (uint16_t)~TIM_IT;
ADDW	R3, R0, #16
; TIMx end address is: 0 (R0)
MVN	R2, R1
; TIM_IT end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f10x_tim.c,2683 :: 		}
L_end_TIM_ClearITPendingBit:
BX	LR
; end of _TIM_ClearITPendingBit
stm32f10x_tim_TI1_Config:
;stm32f10x_tim.c,2702 :: 		uint16_t TIM_ICFilter)
; TIM_ICFilter start address is: 12 (R3)
; TIM_ICSelection start address is: 8 (R2)
; TIM_ICPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ICFilter end address is: 12 (R3)
; TIM_ICSelection end address is: 8 (R2)
; TIM_ICPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ICPolarity start address is: 4 (R1)
; TIM_ICSelection start address is: 8 (R2)
; TIM_ICFilter start address is: 12 (R3)
;stm32f10x_tim.c,2704 :: 		uint16_t tmpccmr1 = 0, tmpccer = 0;
;stm32f10x_tim.c,2706 :: 		TIMx->CCER &= (uint16_t)~((uint16_t)TIM_CCER_CC1E);
ADDW	R6, R0, #32
LDRH	R5, [R6, #0]
MOVW	R4, #65534
AND	R4, R5, R4, LSL #0
STRH	R4, [R6, #0]
;stm32f10x_tim.c,2707 :: 		tmpccmr1 = TIMx->CCMR1;
ADDW	R4, R0, #24
LDRH	R5, [R4, #0]
;stm32f10x_tim.c,2708 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
LDRH	R4, [R4, #0]
; tmpccer start address is: 24 (R6)
UXTH	R6, R4
;stm32f10x_tim.c,2710 :: 		tmpccmr1 &= (uint16_t)(((uint16_t)~((uint16_t)TIM_CCMR1_CC1S)) & ((uint16_t)~((uint16_t)TIM_CCMR1_IC1F)));
MOVW	R4, #65292
ANDS	R5, R4
UXTH	R5, R5
;stm32f10x_tim.c,2711 :: 		tmpccmr1 |= (uint16_t)(TIM_ICSelection | (uint16_t)(TIM_ICFilter << (uint16_t)4));
LSLS	R4, R3, #4
UXTH	R4, R4
; TIM_ICFilter end address is: 12 (R3)
ORR	R4, R2, R4, LSL #0
UXTH	R4, R4
; TIM_ICSelection end address is: 8 (R2)
ORR	R4, R5, R4, LSL #0
; tmpccmr1 start address is: 8 (R2)
UXTH	R2, R4
;stm32f10x_tim.c,2713 :: 		if((TIMx == TIM1) || (TIMx == TIM8) || (TIMx == TIM2) || (TIMx == TIM3) ||
MOVW	R4, #11264
MOVT	R4, #16385
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI1_Config193
MOVW	R4, #13312
MOVT	R4, #16385
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI1_Config192
MOVW	R4, #0
MOVT	R4, #16384
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI1_Config191
MOVW	R4, #1024
MOVT	R4, #16384
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI1_Config190
;stm32f10x_tim.c,2714 :: 		(TIMx == TIM4) ||(TIMx == TIM5))
MOVW	R4, #2048
MOVT	R4, #16384
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI1_Config189
MOVW	R4, #3072
MOVT	R4, #16384
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI1_Config188
IT	AL
BAL	L_stm32f10x_tim_TI1_Config133
;stm32f10x_tim.c,2713 :: 		if((TIMx == TIM1) || (TIMx == TIM8) || (TIMx == TIM2) || (TIMx == TIM3) ||
L_stm32f10x_tim_TI1_Config193:
L_stm32f10x_tim_TI1_Config192:
L_stm32f10x_tim_TI1_Config191:
L_stm32f10x_tim_TI1_Config190:
;stm32f10x_tim.c,2714 :: 		(TIMx == TIM4) ||(TIMx == TIM5))
L_stm32f10x_tim_TI1_Config189:
L_stm32f10x_tim_TI1_Config188:
;stm32f10x_tim.c,2717 :: 		tmpccer &= (uint16_t)~((uint16_t)(TIM_CCER_CC1P));
MOVW	R4, #65533
AND	R5, R6, R4, LSL #0
UXTH	R5, R5
; tmpccer end address is: 24 (R6)
;stm32f10x_tim.c,2718 :: 		tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)TIM_CCER_CC1E);
ORR	R4, R1, #1
UXTH	R4, R4
; TIM_ICPolarity end address is: 4 (R1)
ORR	R1, R5, R4, LSL #0
UXTH	R1, R1
; tmpccer start address is: 4 (R1)
;stm32f10x_tim.c,2719 :: 		}
; tmpccer end address is: 4 (R1)
IT	AL
BAL	L_stm32f10x_tim_TI1_Config134
L_stm32f10x_tim_TI1_Config133:
;stm32f10x_tim.c,2723 :: 		tmpccer &= (uint16_t)~((uint16_t)(TIM_CCER_CC1P | TIM_CCER_CC1NP));
; tmpccer start address is: 24 (R6)
; TIM_ICPolarity start address is: 4 (R1)
MOVW	R4, #65525
AND	R5, R6, R4, LSL #0
UXTH	R5, R5
; tmpccer end address is: 24 (R6)
;stm32f10x_tim.c,2724 :: 		tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)TIM_CCER_CC1E);
ORR	R4, R1, #1
UXTH	R4, R4
; TIM_ICPolarity end address is: 4 (R1)
ORR	R1, R5, R4, LSL #0
UXTH	R1, R1
; tmpccer start address is: 4 (R1)
; tmpccer end address is: 4 (R1)
;stm32f10x_tim.c,2725 :: 		}
L_stm32f10x_tim_TI1_Config134:
;stm32f10x_tim.c,2728 :: 		TIMx->CCMR1 = tmpccmr1;
; tmpccer start address is: 4 (R1)
ADDW	R4, R0, #24
STRH	R2, [R4, #0]
; tmpccmr1 end address is: 8 (R2)
;stm32f10x_tim.c,2729 :: 		TIMx->CCER = tmpccer;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
STRH	R1, [R4, #0]
; tmpccer end address is: 4 (R1)
;stm32f10x_tim.c,2730 :: 		}
L_end_TI1_Config:
BX	LR
; end of stm32f10x_tim_TI1_Config
stm32f10x_tim_TI2_Config:
;stm32f10x_tim.c,2749 :: 		uint16_t TIM_ICFilter)
; TIM_ICFilter start address is: 12 (R3)
; TIM_ICSelection start address is: 8 (R2)
; TIM_ICPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ICFilter end address is: 12 (R3)
; TIM_ICSelection end address is: 8 (R2)
; TIM_ICPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ICPolarity start address is: 4 (R1)
; TIM_ICSelection start address is: 8 (R2)
; TIM_ICFilter start address is: 12 (R3)
;stm32f10x_tim.c,2751 :: 		uint16_t tmpccmr1 = 0, tmpccer = 0, tmp = 0;
;stm32f10x_tim.c,2753 :: 		TIMx->CCER &= (uint16_t)~((uint16_t)TIM_CCER_CC2E);
ADDW	R6, R0, #32
LDRH	R5, [R6, #0]
MOVW	R4, #65519
AND	R4, R5, R4, LSL #0
STRH	R4, [R6, #0]
;stm32f10x_tim.c,2754 :: 		tmpccmr1 = TIMx->CCMR1;
ADDW	R4, R0, #24
LDRH	R5, [R4, #0]
;stm32f10x_tim.c,2755 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
LDRH	R4, [R4, #0]
; tmpccer start address is: 24 (R6)
UXTH	R6, R4
;stm32f10x_tim.c,2756 :: 		tmp = (uint16_t)(TIM_ICPolarity << 4);
LSLS	R4, R1, #4
; tmp start address is: 28 (R7)
UXTH	R7, R4
;stm32f10x_tim.c,2758 :: 		tmpccmr1 &= (uint16_t)(((uint16_t)~((uint16_t)TIM_CCMR1_CC2S)) & ((uint16_t)~((uint16_t)TIM_CCMR1_IC2F)));
MOVW	R4, #3327
ANDS	R5, R4
UXTH	R5, R5
;stm32f10x_tim.c,2759 :: 		tmpccmr1 |= (uint16_t)(TIM_ICFilter << 12);
LSLS	R4, R3, #12
UXTH	R4, R4
; TIM_ICFilter end address is: 12 (R3)
ORRS	R5, R4
UXTH	R5, R5
;stm32f10x_tim.c,2760 :: 		tmpccmr1 |= (uint16_t)(TIM_ICSelection << 8);
LSLS	R4, R2, #8
UXTH	R4, R4
; TIM_ICSelection end address is: 8 (R2)
ORR	R4, R5, R4, LSL #0
; tmpccmr1 start address is: 8 (R2)
UXTH	R2, R4
;stm32f10x_tim.c,2762 :: 		if((TIMx == TIM1) || (TIMx == TIM8) || (TIMx == TIM2) || (TIMx == TIM3) ||
MOVW	R4, #11264
MOVT	R4, #16385
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI2_Config200
MOVW	R4, #13312
MOVT	R4, #16385
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI2_Config199
MOVW	R4, #0
MOVT	R4, #16384
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI2_Config198
MOVW	R4, #1024
MOVT	R4, #16384
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI2_Config197
;stm32f10x_tim.c,2763 :: 		(TIMx == TIM4) ||(TIMx == TIM5))
MOVW	R4, #2048
MOVT	R4, #16384
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI2_Config196
MOVW	R4, #3072
MOVT	R4, #16384
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI2_Config195
; tmp end address is: 28 (R7)
IT	AL
BAL	L_stm32f10x_tim_TI2_Config137
; TIM_ICPolarity end address is: 4 (R1)
;stm32f10x_tim.c,2762 :: 		if((TIMx == TIM1) || (TIMx == TIM8) || (TIMx == TIM2) || (TIMx == TIM3) ||
L_stm32f10x_tim_TI2_Config200:
; tmp start address is: 28 (R7)
L_stm32f10x_tim_TI2_Config199:
L_stm32f10x_tim_TI2_Config198:
L_stm32f10x_tim_TI2_Config197:
;stm32f10x_tim.c,2763 :: 		(TIMx == TIM4) ||(TIMx == TIM5))
L_stm32f10x_tim_TI2_Config196:
L_stm32f10x_tim_TI2_Config195:
;stm32f10x_tim.c,2766 :: 		tmpccer &= (uint16_t)~((uint16_t)(TIM_CCER_CC2P));
MOVW	R4, #65503
AND	R1, R6, R4, LSL #0
UXTH	R1, R1
; tmpccer end address is: 24 (R6)
;stm32f10x_tim.c,2767 :: 		tmpccer |=  (uint16_t)(tmp | (uint16_t)TIM_CCER_CC2E);
ORR	R4, R7, #16
UXTH	R4, R4
; tmp end address is: 28 (R7)
ORRS	R1, R4
UXTH	R1, R1
; tmpccer start address is: 4 (R1)
;stm32f10x_tim.c,2768 :: 		}
; tmpccer end address is: 4 (R1)
IT	AL
BAL	L_stm32f10x_tim_TI2_Config138
L_stm32f10x_tim_TI2_Config137:
;stm32f10x_tim.c,2772 :: 		tmpccer &= (uint16_t)~((uint16_t)(TIM_CCER_CC2P | TIM_CCER_CC2NP));
; tmpccer start address is: 24 (R6)
; TIM_ICPolarity start address is: 4 (R1)
MOVW	R4, #65375
AND	R5, R6, R4, LSL #0
UXTH	R5, R5
; tmpccer end address is: 24 (R6)
;stm32f10x_tim.c,2773 :: 		tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)TIM_CCER_CC2E);
ORR	R4, R1, #16
UXTH	R4, R4
; TIM_ICPolarity end address is: 4 (R1)
ORR	R1, R5, R4, LSL #0
UXTH	R1, R1
; tmpccer start address is: 4 (R1)
; tmpccer end address is: 4 (R1)
;stm32f10x_tim.c,2774 :: 		}
L_stm32f10x_tim_TI2_Config138:
;stm32f10x_tim.c,2777 :: 		TIMx->CCMR1 = tmpccmr1 ;
; tmpccer start address is: 4 (R1)
ADDW	R4, R0, #24
STRH	R2, [R4, #0]
; tmpccmr1 end address is: 8 (R2)
;stm32f10x_tim.c,2778 :: 		TIMx->CCER = tmpccer;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
STRH	R1, [R4, #0]
; tmpccer end address is: 4 (R1)
;stm32f10x_tim.c,2779 :: 		}
L_end_TI2_Config:
BX	LR
; end of stm32f10x_tim_TI2_Config
stm32f10x_tim_TI3_Config:
;stm32f10x_tim.c,2798 :: 		uint16_t TIM_ICFilter)
; TIM_ICFilter start address is: 12 (R3)
; TIM_ICSelection start address is: 8 (R2)
; TIM_ICPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ICFilter end address is: 12 (R3)
; TIM_ICSelection end address is: 8 (R2)
; TIM_ICPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ICPolarity start address is: 4 (R1)
; TIM_ICSelection start address is: 8 (R2)
; TIM_ICFilter start address is: 12 (R3)
;stm32f10x_tim.c,2800 :: 		uint16_t tmpccmr2 = 0, tmpccer = 0, tmp = 0;
;stm32f10x_tim.c,2802 :: 		TIMx->CCER &= (uint16_t)~((uint16_t)TIM_CCER_CC3E);
ADDW	R6, R0, #32
LDRH	R5, [R6, #0]
MOVW	R4, #65279
AND	R4, R5, R4, LSL #0
STRH	R4, [R6, #0]
;stm32f10x_tim.c,2803 :: 		tmpccmr2 = TIMx->CCMR2;
ADDW	R4, R0, #28
LDRH	R5, [R4, #0]
;stm32f10x_tim.c,2804 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
LDRH	R4, [R4, #0]
; tmpccer start address is: 24 (R6)
UXTH	R6, R4
;stm32f10x_tim.c,2805 :: 		tmp = (uint16_t)(TIM_ICPolarity << 8);
LSLS	R4, R1, #8
; tmp start address is: 28 (R7)
UXTH	R7, R4
;stm32f10x_tim.c,2807 :: 		tmpccmr2 &= (uint16_t)(((uint16_t)~((uint16_t)TIM_CCMR2_CC3S)) & ((uint16_t)~((uint16_t)TIM_CCMR2_IC3F)));
MOVW	R4, #65292
ANDS	R5, R4
UXTH	R5, R5
;stm32f10x_tim.c,2808 :: 		tmpccmr2 |= (uint16_t)(TIM_ICSelection | (uint16_t)(TIM_ICFilter << (uint16_t)4));
LSLS	R4, R3, #4
UXTH	R4, R4
; TIM_ICFilter end address is: 12 (R3)
ORR	R4, R2, R4, LSL #0
UXTH	R4, R4
; TIM_ICSelection end address is: 8 (R2)
ORR	R4, R5, R4, LSL #0
; tmpccmr2 start address is: 8 (R2)
UXTH	R2, R4
;stm32f10x_tim.c,2810 :: 		if((TIMx == TIM1) || (TIMx == TIM8) || (TIMx == TIM2) || (TIMx == TIM3) ||
MOVW	R4, #11264
MOVT	R4, #16385
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI3_Config207
MOVW	R4, #13312
MOVT	R4, #16385
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI3_Config206
MOVW	R4, #0
MOVT	R4, #16384
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI3_Config205
MOVW	R4, #1024
MOVT	R4, #16384
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI3_Config204
;stm32f10x_tim.c,2811 :: 		(TIMx == TIM4) ||(TIMx == TIM5))
MOVW	R4, #2048
MOVT	R4, #16384
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI3_Config203
MOVW	R4, #3072
MOVT	R4, #16384
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI3_Config202
; tmp end address is: 28 (R7)
IT	AL
BAL	L_stm32f10x_tim_TI3_Config141
; TIM_ICPolarity end address is: 4 (R1)
;stm32f10x_tim.c,2810 :: 		if((TIMx == TIM1) || (TIMx == TIM8) || (TIMx == TIM2) || (TIMx == TIM3) ||
L_stm32f10x_tim_TI3_Config207:
; tmp start address is: 28 (R7)
L_stm32f10x_tim_TI3_Config206:
L_stm32f10x_tim_TI3_Config205:
L_stm32f10x_tim_TI3_Config204:
;stm32f10x_tim.c,2811 :: 		(TIMx == TIM4) ||(TIMx == TIM5))
L_stm32f10x_tim_TI3_Config203:
L_stm32f10x_tim_TI3_Config202:
;stm32f10x_tim.c,2814 :: 		tmpccer &= (uint16_t)~((uint16_t)(TIM_CCER_CC3P));
MOVW	R4, #65023
AND	R1, R6, R4, LSL #0
UXTH	R1, R1
; tmpccer end address is: 24 (R6)
;stm32f10x_tim.c,2815 :: 		tmpccer |= (uint16_t)(tmp | (uint16_t)TIM_CCER_CC3E);
ORR	R4, R7, #256
UXTH	R4, R4
; tmp end address is: 28 (R7)
ORRS	R1, R4
UXTH	R1, R1
; tmpccer start address is: 4 (R1)
;stm32f10x_tim.c,2816 :: 		}
; tmpccer end address is: 4 (R1)
IT	AL
BAL	L_stm32f10x_tim_TI3_Config142
L_stm32f10x_tim_TI3_Config141:
;stm32f10x_tim.c,2820 :: 		tmpccer &= (uint16_t)~((uint16_t)(TIM_CCER_CC3P | TIM_CCER_CC3NP));
; tmpccer start address is: 24 (R6)
; TIM_ICPolarity start address is: 4 (R1)
MOVW	R4, #62975
AND	R5, R6, R4, LSL #0
UXTH	R5, R5
; tmpccer end address is: 24 (R6)
;stm32f10x_tim.c,2821 :: 		tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)TIM_CCER_CC3E);
ORR	R4, R1, #256
UXTH	R4, R4
; TIM_ICPolarity end address is: 4 (R1)
ORR	R1, R5, R4, LSL #0
UXTH	R1, R1
; tmpccer start address is: 4 (R1)
; tmpccer end address is: 4 (R1)
;stm32f10x_tim.c,2822 :: 		}
L_stm32f10x_tim_TI3_Config142:
;stm32f10x_tim.c,2825 :: 		TIMx->CCMR2 = tmpccmr2;
; tmpccer start address is: 4 (R1)
ADDW	R4, R0, #28
STRH	R2, [R4, #0]
; tmpccmr2 end address is: 8 (R2)
;stm32f10x_tim.c,2826 :: 		TIMx->CCER = tmpccer;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
STRH	R1, [R4, #0]
; tmpccer end address is: 4 (R1)
;stm32f10x_tim.c,2827 :: 		}
L_end_TI3_Config:
BX	LR
; end of stm32f10x_tim_TI3_Config
stm32f10x_tim_TI4_Config:
;stm32f10x_tim.c,2846 :: 		uint16_t TIM_ICFilter)
; TIM_ICFilter start address is: 12 (R3)
; TIM_ICSelection start address is: 8 (R2)
; TIM_ICPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ICFilter end address is: 12 (R3)
; TIM_ICSelection end address is: 8 (R2)
; TIM_ICPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ICPolarity start address is: 4 (R1)
; TIM_ICSelection start address is: 8 (R2)
; TIM_ICFilter start address is: 12 (R3)
;stm32f10x_tim.c,2848 :: 		uint16_t tmpccmr2 = 0, tmpccer = 0, tmp = 0;
;stm32f10x_tim.c,2851 :: 		TIMx->CCER &= (uint16_t)~((uint16_t)TIM_CCER_CC4E);
ADDW	R6, R0, #32
LDRH	R5, [R6, #0]
MOVW	R4, #61439
AND	R4, R5, R4, LSL #0
STRH	R4, [R6, #0]
;stm32f10x_tim.c,2852 :: 		tmpccmr2 = TIMx->CCMR2;
ADDW	R4, R0, #28
LDRH	R5, [R4, #0]
;stm32f10x_tim.c,2853 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
LDRH	R4, [R4, #0]
; tmpccer start address is: 24 (R6)
UXTH	R6, R4
;stm32f10x_tim.c,2854 :: 		tmp = (uint16_t)(TIM_ICPolarity << 12);
LSLS	R4, R1, #12
; tmp start address is: 28 (R7)
UXTH	R7, R4
;stm32f10x_tim.c,2856 :: 		tmpccmr2 &= (uint16_t)((uint16_t)(~(uint16_t)TIM_CCMR2_CC4S) & ((uint16_t)~((uint16_t)TIM_CCMR2_IC4F)));
MOVW	R4, #3327
ANDS	R5, R4
UXTH	R5, R5
;stm32f10x_tim.c,2857 :: 		tmpccmr2 |= (uint16_t)(TIM_ICSelection << 8);
LSLS	R4, R2, #8
UXTH	R4, R4
; TIM_ICSelection end address is: 8 (R2)
ORRS	R5, R4
UXTH	R5, R5
;stm32f10x_tim.c,2858 :: 		tmpccmr2 |= (uint16_t)(TIM_ICFilter << 12);
LSLS	R4, R3, #12
UXTH	R4, R4
; TIM_ICFilter end address is: 12 (R3)
ORR	R4, R5, R4, LSL #0
; tmpccmr2 start address is: 8 (R2)
UXTH	R2, R4
;stm32f10x_tim.c,2860 :: 		if((TIMx == TIM1) || (TIMx == TIM8) || (TIMx == TIM2) || (TIMx == TIM3) ||
MOVW	R4, #11264
MOVT	R4, #16385
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI4_Config214
MOVW	R4, #13312
MOVT	R4, #16385
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI4_Config213
MOVW	R4, #0
MOVT	R4, #16384
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI4_Config212
MOVW	R4, #1024
MOVT	R4, #16384
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI4_Config211
;stm32f10x_tim.c,2861 :: 		(TIMx == TIM4) ||(TIMx == TIM5))
MOVW	R4, #2048
MOVT	R4, #16384
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI4_Config210
MOVW	R4, #3072
MOVT	R4, #16384
CMP	R0, R4
IT	EQ
BEQ	L_stm32f10x_tim_TI4_Config209
; tmp end address is: 28 (R7)
IT	AL
BAL	L_stm32f10x_tim_TI4_Config145
; TIM_ICPolarity end address is: 4 (R1)
;stm32f10x_tim.c,2860 :: 		if((TIMx == TIM1) || (TIMx == TIM8) || (TIMx == TIM2) || (TIMx == TIM3) ||
L_stm32f10x_tim_TI4_Config214:
; tmp start address is: 28 (R7)
L_stm32f10x_tim_TI4_Config213:
L_stm32f10x_tim_TI4_Config212:
L_stm32f10x_tim_TI4_Config211:
;stm32f10x_tim.c,2861 :: 		(TIMx == TIM4) ||(TIMx == TIM5))
L_stm32f10x_tim_TI4_Config210:
L_stm32f10x_tim_TI4_Config209:
;stm32f10x_tim.c,2864 :: 		tmpccer &= (uint16_t)~((uint16_t)(TIM_CCER_CC4P));
MOVW	R4, #57343
AND	R1, R6, R4, LSL #0
UXTH	R1, R1
; tmpccer end address is: 24 (R6)
;stm32f10x_tim.c,2865 :: 		tmpccer |= (uint16_t)(tmp | (uint16_t)TIM_CCER_CC4E);
ORR	R4, R7, #4096
UXTH	R4, R4
; tmp end address is: 28 (R7)
ORRS	R1, R4
UXTH	R1, R1
; tmpccer start address is: 4 (R1)
;stm32f10x_tim.c,2866 :: 		}
; tmpccer end address is: 4 (R1)
IT	AL
BAL	L_stm32f10x_tim_TI4_Config146
L_stm32f10x_tim_TI4_Config145:
;stm32f10x_tim.c,2870 :: 		tmpccer &= (uint16_t)~((uint16_t)(TIM_CCER_CC3P | TIM_CCER_CC4NP));
; tmpccer start address is: 24 (R6)
; TIM_ICPolarity start address is: 4 (R1)
MOVW	R4, #32255
AND	R5, R6, R4, LSL #0
UXTH	R5, R5
; tmpccer end address is: 24 (R6)
;stm32f10x_tim.c,2871 :: 		tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)TIM_CCER_CC4E);
ORR	R4, R1, #4096
UXTH	R4, R4
; TIM_ICPolarity end address is: 4 (R1)
ORR	R1, R5, R4, LSL #0
UXTH	R1, R1
; tmpccer start address is: 4 (R1)
; tmpccer end address is: 4 (R1)
;stm32f10x_tim.c,2872 :: 		}
L_stm32f10x_tim_TI4_Config146:
;stm32f10x_tim.c,2874 :: 		TIMx->CCMR2 = tmpccmr2;
; tmpccer start address is: 4 (R1)
ADDW	R4, R0, #28
STRH	R2, [R4, #0]
; tmpccmr2 end address is: 8 (R2)
;stm32f10x_tim.c,2875 :: 		TIMx->CCER = tmpccer;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
STRH	R1, [R4, #0]
; tmpccer end address is: 4 (R1)
;stm32f10x_tim.c,2876 :: 		}
L_end_TI4_Config:
BX	LR
; end of stm32f10x_tim_TI4_Config
