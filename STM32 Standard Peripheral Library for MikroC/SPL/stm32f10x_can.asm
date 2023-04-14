stm32f10x_can_NVIC_SetPriorityGrouping:
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
; end of stm32f10x_can_NVIC_SetPriorityGrouping
stm32f10x_can_NVIC_GetPriorityGrouping:
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
; end of stm32f10x_can_NVIC_GetPriorityGrouping
stm32f10x_can_NVIC_EnableIRQ:
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
; end of stm32f10x_can_NVIC_EnableIRQ
stm32f10x_can_NVIC_DisableIRQ:
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
; end of stm32f10x_can_NVIC_DisableIRQ
stm32f10x_can_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f10x_can_NVIC_GetPendingIRQ0
; ?FLOC__stm32f10x_can_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_can_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_can_NVIC_GetPendingIRQ1
L_stm32f10x_can_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f10x_can_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_can_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
L_stm32f10x_can_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f10x_can_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_can_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1593 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f10x_can_NVIC_GetPendingIRQ
stm32f10x_can_NVIC_SetPendingIRQ:
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
; end of stm32f10x_can_NVIC_SetPendingIRQ
stm32f10x_can_NVIC_ClearPendingIRQ:
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
; end of stm32f10x_can_NVIC_ClearPendingIRQ
stm32f10x_can_NVIC_GetActive:
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
BEQ	L_stm32f10x_can_NVIC_GetActive2
; ?FLOC__stm32f10x_can_NVIC_GetActive?T72 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_can_NVIC_GetActive?T72 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_can_NVIC_GetActive3
L_stm32f10x_can_NVIC_GetActive2:
; ?FLOC__stm32f10x_can_NVIC_GetActive?T72 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_can_NVIC_GetActive?T72 end address is: 0 (R0)
L_stm32f10x_can_NVIC_GetActive3:
; ?FLOC__stm32f10x_can_NVIC_GetActive?T72 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_can_NVIC_GetActive?T72 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1633 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f10x_can_NVIC_GetActive
stm32f10x_can_NVIC_SetPriority:
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
BGE	L_stm32f10x_can_NVIC_SetPriority4
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
BAL	L_stm32f10x_can_NVIC_SetPriority5
L_stm32f10x_can_NVIC_SetPriority4:
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
L_stm32f10x_can_NVIC_SetPriority5:
;core_cm3.h,1653 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f10x_can_NVIC_SetPriority
stm32f10x_can_NVIC_GetPriority:
;core_cm3.h,1670 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1673 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f10x_can_NVIC_GetPriority6
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
L_stm32f10x_can_NVIC_GetPriority6:
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
; end of stm32f10x_can_NVIC_GetPriority
stm32f10x_can_NVIC_EncodePriority:
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
BLS	L_stm32f10x_can_NVIC_EncodePriority8
; ?FLOC__stm32f10x_can_NVIC_EncodePriority?T112 start address is: 12 (R3)
MOVW	R3, #4
; ?FLOC__stm32f10x_can_NVIC_EncodePriority?T112 end address is: 12 (R3)
IT	AL
BAL	L_stm32f10x_can_NVIC_EncodePriority9
L_stm32f10x_can_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f10x_can_NVIC_EncodePriority?T112 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_can_NVIC_EncodePriority?T112 end address is: 0 (R0)
MOV	R3, R0
L_stm32f10x_can_NVIC_EncodePriority9:
; ?FLOC__stm32f10x_can_NVIC_EncodePriority?T112 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_can_NVIC_EncodePriority?T112 end address is: 12 (R3)
;core_cm3.h,1702 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f10x_can_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f10x_can_NVIC_EncodePriority?T116 start address is: 20 (R5)
MOVW	R5, #0
; ?FLOC__stm32f10x_can_NVIC_EncodePriority?T116 end address is: 20 (R5)
IT	AL
BAL	L_stm32f10x_can_NVIC_EncodePriority11
L_stm32f10x_can_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f10x_can_NVIC_EncodePriority?T116 start address is: 20 (R5)
; ?FLOC__stm32f10x_can_NVIC_EncodePriority?T116 end address is: 20 (R5)
L_stm32f10x_can_NVIC_EncodePriority11:
;core_cm3.h,1705 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f10x_can_NVIC_EncodePriority?T116 start address is: 20 (R5)
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
; ?FLOC__stm32f10x_can_NVIC_EncodePriority?T116 end address is: 20 (R5)
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
; end of stm32f10x_can_NVIC_EncodePriority
stm32f10x_can_NVIC_DecodePriority:
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
BLS	L_stm32f10x_can_NVIC_DecodePriority12
; ?FLOC__stm32f10x_can_NVIC_DecodePriority?T130 start address is: 16 (R4)
MOVW	R4, #4
; ?FLOC__stm32f10x_can_NVIC_DecodePriority?T130 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_can_NVIC_DecodePriority13
L_stm32f10x_can_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f10x_can_NVIC_DecodePriority?T130 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_can_NVIC_DecodePriority?T130 end address is: 4 (R1)
MOV	R4, R1
L_stm32f10x_can_NVIC_DecodePriority13:
; ?FLOC__stm32f10x_can_NVIC_DecodePriority?T130 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_can_NVIC_DecodePriority?T130 end address is: 16 (R4)
;core_cm3.h,1733 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f10x_can_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f10x_can_NVIC_DecodePriority?T134 start address is: 16 (R4)
MOVW	R4, #0
; ?FLOC__stm32f10x_can_NVIC_DecodePriority?T134 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_can_NVIC_DecodePriority15
L_stm32f10x_can_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f10x_can_NVIC_DecodePriority?T134 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f10x_can_NVIC_DecodePriority?T134 end address is: 20 (R5)
MOV	R4, R5
L_stm32f10x_can_NVIC_DecodePriority15:
; ?FLOC__stm32f10x_can_NVIC_DecodePriority?T134 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm3.h,1735 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f10x_can_NVIC_DecodePriority?T134 end address is: 16 (R4)
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
; end of stm32f10x_can_NVIC_DecodePriority
stm32f10x_can_SysTick_Config:
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
BLS	L_stm32f10x_can_SysTick_Config16
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f10x_can_SysTick_Config16:
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
BL	stm32f10x_can_NVIC_SetPriority+0
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
; end of stm32f10x_can_SysTick_Config
stm32f10x_can_NVIC_SystemReset:
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
L_stm32f10x_can_NVIC_SystemReset17:
IT	AL
BAL	L_stm32f10x_can_NVIC_SystemReset17
;core_cm3.h,1787 :: 		}
L_end_NVIC_SystemReset:
BX	LR
; end of stm32f10x_can_NVIC_SystemReset
stm32f10x_can_ITM_SendChar:
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
BEQ	L_stm32f10x_can_ITM_SendChar203
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_can_ITM_SendChar204
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_can_ITM_SendChar205
L_stm32f10x_can_ITM_SendChar199:
;core_cm3.h,1823 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f10x_can_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f10x_can_ITM_SendChar23
IT	AL
BAL	L_stm32f10x_can_ITM_SendChar22
L_stm32f10x_can_ITM_SendChar23:
;core_cm3.h,1824 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm3.h,1820 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f10x_can_ITM_SendChar202
L_stm32f10x_can_ITM_SendChar203:
L_stm32f10x_can_ITM_SendChar202:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_can_ITM_SendChar201
L_stm32f10x_can_ITM_SendChar204:
L_stm32f10x_can_ITM_SendChar201:
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_can_ITM_SendChar200
L_stm32f10x_can_ITM_SendChar205:
L_stm32f10x_can_ITM_SendChar200:
;core_cm3.h,1826 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm3.h,1827 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f10x_can_ITM_SendChar
stm32f10x_can_ITM_ReceiveChar:
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
BEQ	L_stm32f10x_can_ITM_ReceiveChar24
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
L_stm32f10x_can_ITM_ReceiveChar24:
;core_cm3.h,1847 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm3.h,1848 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f10x_can_ITM_ReceiveChar
stm32f10x_can_ITM_CheckChar:
;core_cm3.h,1859 :: 		static __INLINE int ITM_CheckChar (void) {
;core_cm3.h,1861 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f10x_can_ITM_CheckChar25
;core_cm3.h,1862 :: 		return (0);                                 /* no character available */
MOVW	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm3.h,1863 :: 		} else {
L_stm32f10x_can_ITM_CheckChar25:
;core_cm3.h,1864 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm3.h,1866 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f10x_can_ITM_CheckChar
_CAN_DeInit:
;stm32f10x_can.c,122 :: 		void CAN_DeInit(CAN_TypeDef* CANx)
; CANx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
;stm32f10x_can.c,127 :: 		if (CANx == CAN1)
MOVW	R1, #25600
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_CAN_DeInit27
; CANx end address is: 0 (R0)
;stm32f10x_can.c,130 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_CAN1, ENABLE);
MOVS	R1, #1
MOV	R0, #33554432
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_can.c,132 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_CAN1, DISABLE);
MOVS	R1, #0
MOV	R0, #33554432
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_can.c,133 :: 		}
IT	AL
BAL	L_CAN_DeInit28
L_CAN_DeInit27:
;stm32f10x_can.c,137 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_CAN2, ENABLE);
MOVS	R1, #1
MOV	R0, #67108864
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_can.c,139 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_CAN2, DISABLE);
MOVS	R1, #0
MOV	R0, #67108864
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_can.c,140 :: 		}
L_CAN_DeInit28:
;stm32f10x_can.c,141 :: 		}
L_end_CAN_DeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _CAN_DeInit
_CAN_Init:
;stm32f10x_can.c,154 :: 		uint8_t CAN_Init(CAN_TypeDef* CANx, CAN_InitTypeDef* CAN_InitStruct)
; CAN_InitStruct start address is: 4 (R1)
; CANx start address is: 0 (R0)
; CAN_InitStruct end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; CAN_InitStruct start address is: 4 (R1)
;stm32f10x_can.c,156 :: 		uint8_t InitStatus = CAN_InitStatus_Failed;
;stm32f10x_can.c,157 :: 		uint32_t wait_ack = 0x00000000;
; wait_ack start address is: 16 (R4)
MOV	R4, #0
;stm32f10x_can.c,173 :: 		CANx->MCR &= (~(uint32_t)CAN_MCR_SLEEP);
LDR	R3, [R0, #0]
MVN	R2, #2
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
;stm32f10x_can.c,176 :: 		CANx->MCR |= CAN_MCR_INRQ ;
LDR	R2, [R0, #0]
ORR	R2, R2, #1
STR	R2, [R0, #0]
; wait_ack end address is: 16 (R4)
; CAN_InitStruct end address is: 4 (R1)
; CANx end address is: 0 (R0)
MOV	R3, R4
;stm32f10x_can.c,179 :: 		while (((CANx->MSR & CAN_MSR_INAK) != CAN_MSR_INAK) && (wait_ack != INAK_TIMEOUT))
L_CAN_Init29:
; wait_ack start address is: 12 (R3)
; CAN_InitStruct start address is: 4 (R1)
; CANx start address is: 0 (R0)
ADDS	R2, R0, #4
LDR	R2, [R2, #0]
AND	R2, R2, #1
CMP	R2, #1
IT	EQ
BEQ	L__CAN_Init209
MOVW	R2, #65535
MOVT	R2, #0
CMP	R3, R2
IT	EQ
BEQ	L__CAN_Init208
L__CAN_Init207:
;stm32f10x_can.c,181 :: 		wait_ack++;
ADDS	R3, R3, #1
;stm32f10x_can.c,182 :: 		}
; wait_ack end address is: 12 (R3)
IT	AL
BAL	L_CAN_Init29
;stm32f10x_can.c,179 :: 		while (((CANx->MSR & CAN_MSR_INAK) != CAN_MSR_INAK) && (wait_ack != INAK_TIMEOUT))
L__CAN_Init209:
L__CAN_Init208:
;stm32f10x_can.c,185 :: 		if ((CANx->MSR & CAN_MSR_INAK) != CAN_MSR_INAK)
ADDS	R2, R0, #4
LDR	R2, [R2, #0]
AND	R2, R2, #1
CMP	R2, #1
IT	EQ
BEQ	L_CAN_Init33
; CAN_InitStruct end address is: 4 (R1)
; CANx end address is: 0 (R0)
;stm32f10x_can.c,187 :: 		InitStatus = CAN_InitStatus_Failed;
; InitStatus start address is: 0 (R0)
MOVS	R0, #0
;stm32f10x_can.c,188 :: 		}
; InitStatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_Init34
L_CAN_Init33:
;stm32f10x_can.c,192 :: 		if (CAN_InitStruct->CAN_TTCM == ENABLE)
; CANx start address is: 0 (R0)
; CAN_InitStruct start address is: 4 (R1)
ADDS	R2, R1, #6
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_CAN_Init35
;stm32f10x_can.c,194 :: 		CANx->MCR |= CAN_MCR_TTCM;
LDR	R2, [R0, #0]
ORR	R2, R2, #128
STR	R2, [R0, #0]
;stm32f10x_can.c,195 :: 		}
IT	AL
BAL	L_CAN_Init36
L_CAN_Init35:
;stm32f10x_can.c,198 :: 		CANx->MCR &= ~(uint32_t)CAN_MCR_TTCM;
LDR	R3, [R0, #0]
MVN	R2, #128
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
;stm32f10x_can.c,199 :: 		}
L_CAN_Init36:
;stm32f10x_can.c,202 :: 		if (CAN_InitStruct->CAN_ABOM == ENABLE)
ADDS	R2, R1, #7
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_CAN_Init37
;stm32f10x_can.c,204 :: 		CANx->MCR |= CAN_MCR_ABOM;
LDR	R2, [R0, #0]
ORR	R2, R2, #64
STR	R2, [R0, #0]
;stm32f10x_can.c,205 :: 		}
IT	AL
BAL	L_CAN_Init38
L_CAN_Init37:
;stm32f10x_can.c,208 :: 		CANx->MCR &= ~(uint32_t)CAN_MCR_ABOM;
LDR	R3, [R0, #0]
MVN	R2, #64
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
;stm32f10x_can.c,209 :: 		}
L_CAN_Init38:
;stm32f10x_can.c,212 :: 		if (CAN_InitStruct->CAN_AWUM == ENABLE)
ADDW	R2, R1, #8
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_CAN_Init39
;stm32f10x_can.c,214 :: 		CANx->MCR |= CAN_MCR_AWUM;
LDR	R2, [R0, #0]
ORR	R2, R2, #32
STR	R2, [R0, #0]
;stm32f10x_can.c,215 :: 		}
IT	AL
BAL	L_CAN_Init40
L_CAN_Init39:
;stm32f10x_can.c,218 :: 		CANx->MCR &= ~(uint32_t)CAN_MCR_AWUM;
LDR	R3, [R0, #0]
MVN	R2, #32
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
;stm32f10x_can.c,219 :: 		}
L_CAN_Init40:
;stm32f10x_can.c,222 :: 		if (CAN_InitStruct->CAN_NART == ENABLE)
ADDW	R2, R1, #9
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_CAN_Init41
;stm32f10x_can.c,224 :: 		CANx->MCR |= CAN_MCR_NART;
LDR	R2, [R0, #0]
ORR	R2, R2, #16
STR	R2, [R0, #0]
;stm32f10x_can.c,225 :: 		}
IT	AL
BAL	L_CAN_Init42
L_CAN_Init41:
;stm32f10x_can.c,228 :: 		CANx->MCR &= ~(uint32_t)CAN_MCR_NART;
LDR	R3, [R0, #0]
MVN	R2, #16
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
;stm32f10x_can.c,229 :: 		}
L_CAN_Init42:
;stm32f10x_can.c,232 :: 		if (CAN_InitStruct->CAN_RFLM == ENABLE)
ADDW	R2, R1, #10
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_CAN_Init43
;stm32f10x_can.c,234 :: 		CANx->MCR |= CAN_MCR_RFLM;
LDR	R2, [R0, #0]
ORR	R2, R2, #8
STR	R2, [R0, #0]
;stm32f10x_can.c,235 :: 		}
IT	AL
BAL	L_CAN_Init44
L_CAN_Init43:
;stm32f10x_can.c,238 :: 		CANx->MCR &= ~(uint32_t)CAN_MCR_RFLM;
LDR	R3, [R0, #0]
MVN	R2, #8
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
;stm32f10x_can.c,239 :: 		}
L_CAN_Init44:
;stm32f10x_can.c,242 :: 		if (CAN_InitStruct->CAN_TXFP == ENABLE)
ADDW	R2, R1, #11
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_CAN_Init45
;stm32f10x_can.c,244 :: 		CANx->MCR |= CAN_MCR_TXFP;
LDR	R2, [R0, #0]
ORR	R2, R2, #4
STR	R2, [R0, #0]
;stm32f10x_can.c,245 :: 		}
IT	AL
BAL	L_CAN_Init46
L_CAN_Init45:
;stm32f10x_can.c,248 :: 		CANx->MCR &= ~(uint32_t)CAN_MCR_TXFP;
LDR	R3, [R0, #0]
MVN	R2, #4
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
;stm32f10x_can.c,249 :: 		}
L_CAN_Init46:
;stm32f10x_can.c,256 :: 		((uint32_t)CAN_InitStruct->CAN_Prescaler - 1);
ADDW	R4, R0, #28
ADDS	R2, R1, #2
LDRB	R2, [R2, #0]
LSLS	R3, R2, #30
ADDS	R2, R1, #3
LDRB	R2, [R2, #0]
LSLS	R2, R2, #24
ORRS	R3, R2
ADDS	R2, R1, #4
LDRB	R2, [R2, #0]
LSLS	R2, R2, #16
ORRS	R3, R2
ADDS	R2, R1, #5
LDRB	R2, [R2, #0]
LSLS	R2, R2, #20
ORRS	R3, R2
LDRH	R2, [R1, #0]
; CAN_InitStruct end address is: 4 (R1)
SUBS	R2, R2, #1
ORR	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_can.c,259 :: 		CANx->MCR &= ~(uint32_t)CAN_MCR_INRQ;
LDR	R3, [R0, #0]
MVN	R2, #1
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
;stm32f10x_can.c,262 :: 		wait_ack = 0;
; wait_ack start address is: 4 (R1)
MOVW	R1, #0
; CANx end address is: 0 (R0)
; wait_ack end address is: 4 (R1)
;stm32f10x_can.c,264 :: 		while (((CANx->MSR & CAN_MSR_INAK) == CAN_MSR_INAK) && (wait_ack != INAK_TIMEOUT))
L_CAN_Init47:
; wait_ack start address is: 4 (R1)
; CANx start address is: 0 (R0)
ADDS	R2, R0, #4
LDR	R2, [R2, #0]
AND	R2, R2, #1
CMP	R2, #1
IT	NE
BNE	L__CAN_Init211
MOVW	R2, #65535
MOVT	R2, #0
CMP	R1, R2
IT	EQ
BEQ	L__CAN_Init210
L__CAN_Init206:
;stm32f10x_can.c,266 :: 		wait_ack++;
ADDS	R1, R1, #1
;stm32f10x_can.c,267 :: 		}
; wait_ack end address is: 4 (R1)
IT	AL
BAL	L_CAN_Init47
;stm32f10x_can.c,264 :: 		while (((CANx->MSR & CAN_MSR_INAK) == CAN_MSR_INAK) && (wait_ack != INAK_TIMEOUT))
L__CAN_Init211:
L__CAN_Init210:
;stm32f10x_can.c,270 :: 		if ((CANx->MSR & CAN_MSR_INAK) == CAN_MSR_INAK)
ADDS	R2, R0, #4
; CANx end address is: 0 (R0)
LDR	R2, [R2, #0]
AND	R2, R2, #1
CMP	R2, #1
IT	NE
BNE	L_CAN_Init51
;stm32f10x_can.c,272 :: 		InitStatus = CAN_InitStatus_Failed;
; InitStatus start address is: 0 (R0)
MOVS	R0, #0
;stm32f10x_can.c,273 :: 		}
; InitStatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_Init52
L_CAN_Init51:
;stm32f10x_can.c,276 :: 		InitStatus = CAN_InitStatus_Success ;
; InitStatus start address is: 0 (R0)
MOVS	R0, #1
; InitStatus end address is: 0 (R0)
;stm32f10x_can.c,277 :: 		}
L_CAN_Init52:
;stm32f10x_can.c,278 :: 		}
; InitStatus start address is: 0 (R0)
; InitStatus end address is: 0 (R0)
L_CAN_Init34:
;stm32f10x_can.c,281 :: 		return InitStatus;
; InitStatus start address is: 0 (R0)
; InitStatus end address is: 0 (R0)
;stm32f10x_can.c,282 :: 		}
L_end_CAN_Init:
BX	LR
; end of _CAN_Init
_CAN_FilterInit:
;stm32f10x_can.c,292 :: 		void CAN_FilterInit(CAN_FilterInitTypeDef* CAN_FilterInitStruct)
; CAN_FilterInitStruct start address is: 0 (R0)
; CAN_FilterInitStruct end address is: 0 (R0)
; CAN_FilterInitStruct start address is: 0 (R0)
;stm32f10x_can.c,294 :: 		uint32_t filter_number_bit_pos = 0;
;stm32f10x_can.c,302 :: 		filter_number_bit_pos = ((uint32_t)1) << CAN_FilterInitStruct->CAN_FilterNumber;
ADDW	R1, R0, #10
LDRB	R2, [R1, #0]
MOV	R1, #1
LSL	R3, R1, R2
; filter_number_bit_pos start address is: 20 (R5)
MOV	R5, R3
;stm32f10x_can.c,305 :: 		CAN1->FMR |= FMR_FINIT;
MOVW	R2, #26112
MOVT	R2, #16384
LDR	R1, [R2, #0]
ORR	R1, R1, #1
STR	R1, [R2, #0]
;stm32f10x_can.c,308 :: 		CAN1->FA1R &= ~(uint32_t)filter_number_bit_pos;
MVN	R3, R3
MOVW	R2, #26140
MOVT	R2, #16384
LDR	R1, [R2, #0]
ANDS	R1, R3
STR	R1, [R2, #0]
;stm32f10x_can.c,311 :: 		if (CAN_FilterInitStruct->CAN_FilterScale == CAN_FilterScale_16bit)
ADDW	R1, R0, #12
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_CAN_FilterInit53
;stm32f10x_can.c,314 :: 		CAN1->FS1R &= ~(uint32_t)filter_number_bit_pos;
MVN	R3, R5
MOVW	R2, #26124
MOVT	R2, #16384
LDR	R1, [R2, #0]
ANDS	R1, R3
STR	R1, [R2, #0]
;stm32f10x_can.c,318 :: 		CAN1->sFilterRegister[CAN_FilterInitStruct->CAN_FilterNumber].FR1 =
ADDW	R1, R0, #10
LDRB	R1, [R1, #0]
LSLS	R2, R1, #3
MOVW	R1, #26176
MOVT	R1, #16384
ADDS	R4, R1, R2
;stm32f10x_can.c,319 :: 		((0x0000FFFF & (uint32_t)CAN_FilterInitStruct->CAN_FilterMaskIdLow) << 16) |
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOVW	R1, #65535
ANDS	R1, R2
LSLS	R3, R1, #16
;stm32f10x_can.c,320 :: 		(0x0000FFFF & (uint32_t)CAN_FilterInitStruct->CAN_FilterIdLow);
ADDS	R1, R0, #2
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOVW	R1, #65535
ANDS	R1, R2
ORR	R1, R3, R1, LSL #0
STR	R1, [R4, #0]
;stm32f10x_can.c,324 :: 		CAN1->sFilterRegister[CAN_FilterInitStruct->CAN_FilterNumber].FR2 =
ADDW	R1, R0, #10
LDRB	R1, [R1, #0]
LSLS	R2, R1, #3
MOVW	R1, #26176
MOVT	R1, #16384
ADDS	R1, R1, R2
ADDS	R4, R1, #4
;stm32f10x_can.c,325 :: 		((0x0000FFFF & (uint32_t)CAN_FilterInitStruct->CAN_FilterMaskIdHigh) << 16) |
ADDS	R1, R0, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOVW	R1, #65535
ANDS	R1, R2
LSLS	R3, R1, #16
;stm32f10x_can.c,326 :: 		(0x0000FFFF & (uint32_t)CAN_FilterInitStruct->CAN_FilterIdHigh);
LDRH	R1, [R0, #0]
UXTH	R2, R1
MOVW	R1, #65535
ANDS	R1, R2
ORR	R1, R3, R1, LSL #0
STR	R1, [R4, #0]
;stm32f10x_can.c,327 :: 		}
L_CAN_FilterInit53:
;stm32f10x_can.c,329 :: 		if (CAN_FilterInitStruct->CAN_FilterScale == CAN_FilterScale_32bit)
ADDW	R1, R0, #12
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_CAN_FilterInit54
;stm32f10x_can.c,332 :: 		CAN1->FS1R |= filter_number_bit_pos;
MOVW	R2, #26124
MOVT	R2, #16384
LDR	R1, [R2, #0]
ORRS	R1, R5
STR	R1, [R2, #0]
;stm32f10x_can.c,334 :: 		CAN1->sFilterRegister[CAN_FilterInitStruct->CAN_FilterNumber].FR1 =
ADDW	R1, R0, #10
LDRB	R1, [R1, #0]
LSLS	R2, R1, #3
MOVW	R1, #26176
MOVT	R1, #16384
ADDS	R4, R1, R2
;stm32f10x_can.c,335 :: 		((0x0000FFFF & (uint32_t)CAN_FilterInitStruct->CAN_FilterIdHigh) << 16) |
LDRH	R1, [R0, #0]
UXTH	R2, R1
MOVW	R1, #65535
ANDS	R1, R2
LSLS	R3, R1, #16
;stm32f10x_can.c,336 :: 		(0x0000FFFF & (uint32_t)CAN_FilterInitStruct->CAN_FilterIdLow);
ADDS	R1, R0, #2
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOVW	R1, #65535
ANDS	R1, R2
ORR	R1, R3, R1, LSL #0
STR	R1, [R4, #0]
;stm32f10x_can.c,338 :: 		CAN1->sFilterRegister[CAN_FilterInitStruct->CAN_FilterNumber].FR2 =
ADDW	R1, R0, #10
LDRB	R1, [R1, #0]
LSLS	R2, R1, #3
MOVW	R1, #26176
MOVT	R1, #16384
ADDS	R1, R1, R2
ADDS	R4, R1, #4
;stm32f10x_can.c,339 :: 		((0x0000FFFF & (uint32_t)CAN_FilterInitStruct->CAN_FilterMaskIdHigh) << 16) |
ADDS	R1, R0, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOVW	R1, #65535
ANDS	R1, R2
LSLS	R3, R1, #16
;stm32f10x_can.c,340 :: 		(0x0000FFFF & (uint32_t)CAN_FilterInitStruct->CAN_FilterMaskIdLow);
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOVW	R1, #65535
ANDS	R1, R2
ORR	R1, R3, R1, LSL #0
STR	R1, [R4, #0]
;stm32f10x_can.c,341 :: 		}
L_CAN_FilterInit54:
;stm32f10x_can.c,344 :: 		if (CAN_FilterInitStruct->CAN_FilterMode == CAN_FilterMode_IdMask)
ADDW	R1, R0, #11
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_CAN_FilterInit55
;stm32f10x_can.c,347 :: 		CAN1->FM1R &= ~(uint32_t)filter_number_bit_pos;
MVN	R3, R5
MOVW	R2, #26116
MOVT	R2, #16384
LDR	R1, [R2, #0]
ANDS	R1, R3
STR	R1, [R2, #0]
;stm32f10x_can.c,348 :: 		}
IT	AL
BAL	L_CAN_FilterInit56
L_CAN_FilterInit55:
;stm32f10x_can.c,352 :: 		CAN1->FM1R |= (uint32_t)filter_number_bit_pos;
MOVW	R2, #26116
MOVT	R2, #16384
LDR	R1, [R2, #0]
ORRS	R1, R5
STR	R1, [R2, #0]
;stm32f10x_can.c,353 :: 		}
L_CAN_FilterInit56:
;stm32f10x_can.c,356 :: 		if (CAN_FilterInitStruct->CAN_FilterFIFOAssignment == CAN_Filter_FIFO0)
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_CAN_FilterInit57
;stm32f10x_can.c,359 :: 		CAN1->FFA1R &= ~(uint32_t)filter_number_bit_pos;
MVN	R3, R5
MOVW	R2, #26132
MOVT	R2, #16384
LDR	R1, [R2, #0]
ANDS	R1, R3
STR	R1, [R2, #0]
;stm32f10x_can.c,360 :: 		}
L_CAN_FilterInit57:
;stm32f10x_can.c,362 :: 		if (CAN_FilterInitStruct->CAN_FilterFIFOAssignment == CAN_Filter_FIFO1)
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_CAN_FilterInit58
;stm32f10x_can.c,365 :: 		CAN1->FFA1R |= (uint32_t)filter_number_bit_pos;
MOVW	R2, #26132
MOVT	R2, #16384
LDR	R1, [R2, #0]
ORRS	R1, R5
STR	R1, [R2, #0]
;stm32f10x_can.c,366 :: 		}
L_CAN_FilterInit58:
;stm32f10x_can.c,369 :: 		if (CAN_FilterInitStruct->CAN_FilterActivation == ENABLE)
ADDW	R1, R0, #13
; CAN_FilterInitStruct end address is: 0 (R0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_CAN_FilterInit59
;stm32f10x_can.c,371 :: 		CAN1->FA1R |= filter_number_bit_pos;
MOVW	R2, #26140
MOVT	R2, #16384
LDR	R1, [R2, #0]
ORRS	R1, R5
; filter_number_bit_pos end address is: 20 (R5)
STR	R1, [R2, #0]
;stm32f10x_can.c,372 :: 		}
L_CAN_FilterInit59:
;stm32f10x_can.c,375 :: 		CAN1->FMR &= ~FMR_FINIT;
MOVW	R3, #26112
MOVT	R3, #16384
LDR	R2, [R3, #0]
MVN	R1, #1
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f10x_can.c,376 :: 		}
L_end_CAN_FilterInit:
BX	LR
; end of _CAN_FilterInit
_CAN_StructInit:
;stm32f10x_can.c,384 :: 		void CAN_StructInit(CAN_InitTypeDef* CAN_InitStruct)
; CAN_InitStruct start address is: 0 (R0)
; CAN_InitStruct end address is: 0 (R0)
; CAN_InitStruct start address is: 0 (R0)
;stm32f10x_can.c,389 :: 		CAN_InitStruct->CAN_TTCM = DISABLE;
ADDS	R2, R0, #6
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f10x_can.c,392 :: 		CAN_InitStruct->CAN_ABOM = DISABLE;
ADDS	R2, R0, #7
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f10x_can.c,395 :: 		CAN_InitStruct->CAN_AWUM = DISABLE;
ADDW	R2, R0, #8
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f10x_can.c,398 :: 		CAN_InitStruct->CAN_NART = DISABLE;
ADDW	R2, R0, #9
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f10x_can.c,401 :: 		CAN_InitStruct->CAN_RFLM = DISABLE;
ADDW	R2, R0, #10
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f10x_can.c,404 :: 		CAN_InitStruct->CAN_TXFP = DISABLE;
ADDW	R2, R0, #11
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f10x_can.c,407 :: 		CAN_InitStruct->CAN_Mode = CAN_Mode_Normal;
ADDS	R2, R0, #2
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f10x_can.c,410 :: 		CAN_InitStruct->CAN_SJW = CAN_SJW_1tq;
ADDS	R2, R0, #3
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f10x_can.c,413 :: 		CAN_InitStruct->CAN_BS1 = CAN_BS1_4tq;
ADDS	R2, R0, #4
MOVS	R1, #3
STRB	R1, [R2, #0]
;stm32f10x_can.c,416 :: 		CAN_InitStruct->CAN_BS2 = CAN_BS2_3tq;
ADDS	R2, R0, #5
MOVS	R1, #2
STRB	R1, [R2, #0]
;stm32f10x_can.c,419 :: 		CAN_InitStruct->CAN_Prescaler = 1;
MOVS	R1, #1
STRH	R1, [R0, #0]
; CAN_InitStruct end address is: 0 (R0)
;stm32f10x_can.c,420 :: 		}
L_end_CAN_StructInit:
BX	LR
; end of _CAN_StructInit
_CAN_SlaveStartBank:
;stm32f10x_can.c,428 :: 		void CAN_SlaveStartBank(uint8_t CAN_BankNumber)
; CAN_BankNumber start address is: 0 (R0)
; CAN_BankNumber end address is: 0 (R0)
; CAN_BankNumber start address is: 0 (R0)
;stm32f10x_can.c,434 :: 		CAN1->FMR |= FMR_FINIT;
MOVW	R3, #26112
MOVT	R3, #16384
LDR	R1, [R3, #0]
ORR	R2, R1, #1
STR	R2, [R3, #0]
;stm32f10x_can.c,437 :: 		CAN1->FMR &= (uint32_t)0xFFFFC0F1 ;
MOVW	R1, #49393
MOVT	R1, #65535
ANDS	R2, R1
STR	R2, [R3, #0]
;stm32f10x_can.c,438 :: 		CAN1->FMR |= (uint32_t)(CAN_BankNumber)<<8;
UXTB	R1, R0
; CAN_BankNumber end address is: 0 (R0)
LSLS	R1, R1, #8
ORRS	R2, R1
STR	R2, [R3, #0]
;stm32f10x_can.c,441 :: 		CAN1->FMR &= ~FMR_FINIT;
MVN	R1, #1
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f10x_can.c,442 :: 		}
L_end_CAN_SlaveStartBank:
BX	LR
; end of _CAN_SlaveStartBank
_CAN_DBGFreeze:
;stm32f10x_can.c,451 :: 		void CAN_DBGFreeze(CAN_TypeDef* CANx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; CANx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_can.c,457 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_CAN_DBGFreeze60
; NewState end address is: 4 (R1)
;stm32f10x_can.c,460 :: 		CANx->MCR |= MCR_DBF;
LDR	R2, [R0, #0]
ORR	R2, R2, #65536
STR	R2, [R0, #0]
; CANx end address is: 0 (R0)
;stm32f10x_can.c,461 :: 		}
IT	AL
BAL	L_CAN_DBGFreeze61
L_CAN_DBGFreeze60:
;stm32f10x_can.c,465 :: 		CANx->MCR &= ~MCR_DBF;
; CANx start address is: 0 (R0)
LDR	R3, [R0, #0]
MVN	R2, #65536
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
; CANx end address is: 0 (R0)
;stm32f10x_can.c,466 :: 		}
L_CAN_DBGFreeze61:
;stm32f10x_can.c,467 :: 		}
L_end_CAN_DBGFreeze:
BX	LR
; end of _CAN_DBGFreeze
_CAN_TTComModeCmd:
;stm32f10x_can.c,481 :: 		void CAN_TTComModeCmd(CAN_TypeDef* CANx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; CANx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_can.c,486 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_CAN_TTComModeCmd62
; NewState end address is: 4 (R1)
;stm32f10x_can.c,489 :: 		CANx->MCR |= CAN_MCR_TTCM;
LDR	R2, [R0, #0]
ORR	R2, R2, #128
STR	R2, [R0, #0]
;stm32f10x_can.c,492 :: 		CANx->sTxMailBox[0].TDTR |= ((uint32_t)CAN_TDT0R_TGT);
ADD	R2, R0, #384
ADDS	R3, R2, #4
LDR	R2, [R3, #0]
ORR	R2, R2, #256
STR	R2, [R3, #0]
;stm32f10x_can.c,493 :: 		CANx->sTxMailBox[1].TDTR |= ((uint32_t)CAN_TDT1R_TGT);
ADD	R2, R0, #384
ADDS	R2, #16
ADDS	R3, R2, #4
LDR	R2, [R3, #0]
ORR	R2, R2, #256
STR	R2, [R3, #0]
;stm32f10x_can.c,494 :: 		CANx->sTxMailBox[2].TDTR |= ((uint32_t)CAN_TDT2R_TGT);
ADD	R2, R0, #384
; CANx end address is: 0 (R0)
ADDS	R2, #32
ADDS	R3, R2, #4
LDR	R2, [R3, #0]
ORR	R2, R2, #256
STR	R2, [R3, #0]
;stm32f10x_can.c,495 :: 		}
IT	AL
BAL	L_CAN_TTComModeCmd63
L_CAN_TTComModeCmd62:
;stm32f10x_can.c,499 :: 		CANx->MCR &= (uint32_t)(~(uint32_t)CAN_MCR_TTCM);
; CANx start address is: 0 (R0)
LDR	R3, [R0, #0]
MVN	R2, #128
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
;stm32f10x_can.c,502 :: 		CANx->sTxMailBox[0].TDTR &= ((uint32_t)~CAN_TDT0R_TGT);
ADD	R2, R0, #384
ADDS	R4, R2, #4
LDR	R3, [R4, #0]
MVN	R2, #256
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_can.c,503 :: 		CANx->sTxMailBox[1].TDTR &= ((uint32_t)~CAN_TDT1R_TGT);
ADD	R2, R0, #384
ADDS	R2, #16
ADDS	R4, R2, #4
LDR	R3, [R4, #0]
MVN	R2, #256
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_can.c,504 :: 		CANx->sTxMailBox[2].TDTR &= ((uint32_t)~CAN_TDT2R_TGT);
ADD	R2, R0, #384
; CANx end address is: 0 (R0)
ADDS	R2, #32
ADDS	R4, R2, #4
LDR	R3, [R4, #0]
MVN	R2, #256
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_can.c,505 :: 		}
L_CAN_TTComModeCmd63:
;stm32f10x_can.c,506 :: 		}
L_end_CAN_TTComModeCmd:
BX	LR
; end of _CAN_TTComModeCmd
_CAN_Transmit:
;stm32f10x_can.c,515 :: 		uint8_t CAN_Transmit(CAN_TypeDef* CANx, CanTxMsg* TxMessage)
; TxMessage start address is: 4 (R1)
; CANx start address is: 0 (R0)
; TxMessage end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; TxMessage start address is: 4 (R1)
;stm32f10x_can.c,517 :: 		uint8_t transmit_mailbox = 0;
;stm32f10x_can.c,525 :: 		if ((CANx->TSR&CAN_TSR_TME0) == CAN_TSR_TME0)
ADDW	R2, R0, #8
LDR	R2, [R2, #0]
AND	R2, R2, #67108864
CMP	R2, #67108864
IT	NE
BNE	L_CAN_Transmit64
;stm32f10x_can.c,527 :: 		transmit_mailbox = 0;
; transmit_mailbox start address is: 24 (R6)
MOVS	R6, #0
;stm32f10x_can.c,528 :: 		}
; transmit_mailbox end address is: 24 (R6)
IT	AL
BAL	L_CAN_Transmit65
L_CAN_Transmit64:
;stm32f10x_can.c,529 :: 		else if ((CANx->TSR&CAN_TSR_TME1) == CAN_TSR_TME1)
ADDW	R2, R0, #8
LDR	R2, [R2, #0]
AND	R2, R2, #134217728
CMP	R2, #134217728
IT	NE
BNE	L_CAN_Transmit66
;stm32f10x_can.c,531 :: 		transmit_mailbox = 1;
; transmit_mailbox start address is: 8 (R2)
MOVS	R2, #1
;stm32f10x_can.c,532 :: 		}
UXTB	R6, R2
; transmit_mailbox end address is: 8 (R2)
IT	AL
BAL	L_CAN_Transmit67
L_CAN_Transmit66:
;stm32f10x_can.c,533 :: 		else if ((CANx->TSR&CAN_TSR_TME2) == CAN_TSR_TME2)
ADDW	R2, R0, #8
LDR	R2, [R2, #0]
AND	R2, R2, #268435456
CMP	R2, #268435456
IT	NE
BNE	L_CAN_Transmit68
;stm32f10x_can.c,535 :: 		transmit_mailbox = 2;
; transmit_mailbox start address is: 8 (R2)
MOVS	R2, #2
;stm32f10x_can.c,536 :: 		}
; transmit_mailbox end address is: 8 (R2)
IT	AL
BAL	L_CAN_Transmit69
L_CAN_Transmit68:
;stm32f10x_can.c,539 :: 		transmit_mailbox = CAN_TxStatus_NoMailBox;
; transmit_mailbox start address is: 8 (R2)
MOVS	R2, #4
; transmit_mailbox end address is: 8 (R2)
;stm32f10x_can.c,540 :: 		}
L_CAN_Transmit69:
; transmit_mailbox start address is: 8 (R2)
UXTB	R6, R2
; transmit_mailbox end address is: 8 (R2)
L_CAN_Transmit67:
; transmit_mailbox start address is: 24 (R6)
; transmit_mailbox end address is: 24 (R6)
L_CAN_Transmit65:
;stm32f10x_can.c,542 :: 		if (transmit_mailbox != CAN_TxStatus_NoMailBox)
; transmit_mailbox start address is: 24 (R6)
CMP	R6, #4
IT	EQ
BEQ	L_CAN_Transmit70
;stm32f10x_can.c,545 :: 		CANx->sTxMailBox[transmit_mailbox].TIR &= TMIDxR_TXRQ;
ADD	R3, R0, #384
LSLS	R2, R6, #4
ADDS	R3, R3, R2
LDR	R2, [R3, #0]
AND	R2, R2, #1
STR	R2, [R3, #0]
;stm32f10x_can.c,546 :: 		if (TxMessage->IDE == CAN_Id_Standard)
ADDW	R2, R1, #8
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	NE
BNE	L_CAN_Transmit71
;stm32f10x_can.c,550 :: 		TxMessage->RTR);
ADD	R3, R0, #384
LSLS	R2, R6, #4
ADDS	R4, R3, R2
LDR	R2, [R1, #0]
LSLS	R3, R2, #21
ADDW	R2, R1, #9
LDRB	R2, [R2, #0]
ORRS	R3, R2
LDR	R2, [R4, #0]
ORRS	R2, R3
STR	R2, [R4, #0]
;stm32f10x_can.c,551 :: 		}
IT	AL
BAL	L_CAN_Transmit72
L_CAN_Transmit71:
;stm32f10x_can.c,557 :: 		TxMessage->RTR);
ADD	R3, R0, #384
LSLS	R2, R6, #4
ADDS	R4, R3, R2
ADDS	R2, R1, #4
LDR	R2, [R2, #0]
LSLS	R3, R2, #3
ADDW	R2, R1, #8
LDRB	R2, [R2, #0]
ORRS	R3, R2
ADDW	R2, R1, #9
LDRB	R2, [R2, #0]
ORRS	R3, R2
LDR	R2, [R4, #0]
ORRS	R2, R3
STR	R2, [R4, #0]
;stm32f10x_can.c,558 :: 		}
L_CAN_Transmit72:
;stm32f10x_can.c,561 :: 		TxMessage->DLC &= (uint8_t)0x0000000F;
ADDW	R3, R1, #10
LDRB	R2, [R3, #0]
AND	R2, R2, #15
STRB	R2, [R3, #0]
;stm32f10x_can.c,562 :: 		CANx->sTxMailBox[transmit_mailbox].TDTR &= (uint32_t)0xFFFFFFF0;
ADD	R3, R0, #384
LSLS	R2, R6, #4
ADDS	R2, R3, R2
ADDS	R4, R2, #4
LDR	R3, [R4, #0]
MVN	R2, #15
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_can.c,563 :: 		CANx->sTxMailBox[transmit_mailbox].TDTR |= TxMessage->DLC;
ADD	R3, R0, #384
LSLS	R2, R6, #4
ADDS	R2, R3, R2
ADDS	R4, R2, #4
ADDW	R2, R1, #10
LDRB	R3, [R2, #0]
LDR	R2, [R4, #0]
ORRS	R2, R3
STR	R2, [R4, #0]
;stm32f10x_can.c,566 :: 		CANx->sTxMailBox[transmit_mailbox].TDLR = (((uint32_t)TxMessage->Data[3] << 24) |
ADD	R3, R0, #384
LSLS	R2, R6, #4
ADDS	R2, R3, R2
ADDW	R5, R2, #8
ADDW	R4, R1, #11
ADDS	R2, R4, #3
LDRB	R2, [R2, #0]
LSLS	R3, R2, #24
;stm32f10x_can.c,567 :: 		((uint32_t)TxMessage->Data[2] << 16) |
ADDS	R2, R4, #2
LDRB	R2, [R2, #0]
LSLS	R2, R2, #16
ORRS	R3, R2
;stm32f10x_can.c,568 :: 		((uint32_t)TxMessage->Data[1] << 8) |
ADDS	R2, R4, #1
LDRB	R2, [R2, #0]
LSLS	R2, R2, #8
ORRS	R3, R2
;stm32f10x_can.c,569 :: 		((uint32_t)TxMessage->Data[0]));
LDRB	R2, [R4, #0]
ORR	R2, R3, R2, LSL #0
STR	R2, [R5, #0]
;stm32f10x_can.c,570 :: 		CANx->sTxMailBox[transmit_mailbox].TDHR = (((uint32_t)TxMessage->Data[7] << 24) |
ADD	R3, R0, #384
LSLS	R2, R6, #4
ADDS	R2, R3, R2
ADDW	R5, R2, #12
ADDW	R4, R1, #11
; TxMessage end address is: 4 (R1)
ADDS	R2, R4, #7
LDRB	R2, [R2, #0]
LSLS	R3, R2, #24
;stm32f10x_can.c,571 :: 		((uint32_t)TxMessage->Data[6] << 16) |
ADDS	R2, R4, #6
LDRB	R2, [R2, #0]
LSLS	R2, R2, #16
ORRS	R3, R2
;stm32f10x_can.c,572 :: 		((uint32_t)TxMessage->Data[5] << 8) |
ADDS	R2, R4, #5
LDRB	R2, [R2, #0]
LSLS	R2, R2, #8
ORRS	R3, R2
;stm32f10x_can.c,573 :: 		((uint32_t)TxMessage->Data[4]));
ADDS	R2, R4, #4
LDRB	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
STR	R2, [R5, #0]
;stm32f10x_can.c,575 :: 		CANx->sTxMailBox[transmit_mailbox].TIR |= TMIDxR_TXRQ;
ADD	R3, R0, #384
; CANx end address is: 0 (R0)
LSLS	R2, R6, #4
ADDS	R3, R3, R2
LDR	R2, [R3, #0]
ORR	R2, R2, #1
STR	R2, [R3, #0]
;stm32f10x_can.c,576 :: 		}
L_CAN_Transmit70:
;stm32f10x_can.c,577 :: 		return transmit_mailbox;
UXTB	R0, R6
; transmit_mailbox end address is: 24 (R6)
;stm32f10x_can.c,578 :: 		}
L_end_CAN_Transmit:
BX	LR
; end of _CAN_Transmit
_CAN_TransmitStatus:
;stm32f10x_can.c,589 :: 		uint8_t CAN_TransmitStatus(CAN_TypeDef* CANx, uint8_t TransmitMailbox)
; TransmitMailbox start address is: 4 (R1)
; CANx start address is: 0 (R0)
; TransmitMailbox end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; TransmitMailbox start address is: 4 (R1)
;stm32f10x_can.c,591 :: 		uint32_t state = 0;
;stm32f10x_can.c,597 :: 		switch (TransmitMailbox)
IT	AL
BAL	L_CAN_TransmitStatus73
; TransmitMailbox end address is: 4 (R1)
;stm32f10x_can.c,599 :: 		case (CAN_TXMAILBOX_0):
L_CAN_TransmitStatus75:
;stm32f10x_can.c,600 :: 		state =   CANx->TSR &  (CAN_TSR_RQCP0 | CAN_TSR_TXOK0 | CAN_TSR_TME0);
ADDW	R2, R0, #8
; CANx end address is: 0 (R0)
LDR	R3, [R2, #0]
MOVW	R2, #3
MOVT	R2, #1024
AND	R0, R3, R2, LSL #0
; state start address is: 0 (R0)
;stm32f10x_can.c,601 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus74
;stm32f10x_can.c,602 :: 		case (CAN_TXMAILBOX_1):
L_CAN_TransmitStatus76:
;stm32f10x_can.c,603 :: 		state =   CANx->TSR &  (CAN_TSR_RQCP1 | CAN_TSR_TXOK1 | CAN_TSR_TME1);
; CANx start address is: 0 (R0)
ADDW	R2, R0, #8
; CANx end address is: 0 (R0)
LDR	R3, [R2, #0]
MOVW	R2, #768
MOVT	R2, #2048
AND	R0, R3, R2, LSL #0
; state start address is: 0 (R0)
;stm32f10x_can.c,604 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus74
;stm32f10x_can.c,605 :: 		case (CAN_TXMAILBOX_2):
L_CAN_TransmitStatus77:
;stm32f10x_can.c,606 :: 		state =   CANx->TSR &  (CAN_TSR_RQCP2 | CAN_TSR_TXOK2 | CAN_TSR_TME2);
; CANx start address is: 0 (R0)
ADDW	R2, R0, #8
; CANx end address is: 0 (R0)
LDR	R3, [R2, #0]
MOVW	R2, #0
MOVT	R2, #4099
AND	R0, R3, R2, LSL #0
; state start address is: 0 (R0)
;stm32f10x_can.c,607 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus74
;stm32f10x_can.c,608 :: 		default:
L_CAN_TransmitStatus78:
;stm32f10x_can.c,609 :: 		state = CAN_TxStatus_Failed;
; state start address is: 0 (R0)
MOVS	R0, #0
;stm32f10x_can.c,610 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus74
;stm32f10x_can.c,611 :: 		}
L_CAN_TransmitStatus73:
; TransmitMailbox start address is: 4 (R1)
; CANx start address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_CAN_TransmitStatus75
CMP	R1, #1
IT	EQ
BEQ	L_CAN_TransmitStatus76
CMP	R1, #2
IT	EQ
BEQ	L_CAN_TransmitStatus77
; CANx end address is: 0 (R0)
; TransmitMailbox end address is: 4 (R1)
IT	AL
BAL	L_CAN_TransmitStatus78
L_CAN_TransmitStatus74:
;stm32f10x_can.c,612 :: 		switch (state)
; state start address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus79
; state end address is: 0 (R0)
;stm32f10x_can.c,615 :: 		case (0x0): state = CAN_TxStatus_Pending;
L_CAN_TransmitStatus81:
; state start address is: 0 (R0)
MOVS	R0, #2
;stm32f10x_can.c,616 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus80
;stm32f10x_can.c,618 :: 		case (CAN_TSR_RQCP0 | CAN_TSR_TME0): state = CAN_TxStatus_Failed;
L_CAN_TransmitStatus82:
; state start address is: 0 (R0)
MOVS	R0, #0
;stm32f10x_can.c,619 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus80
;stm32f10x_can.c,620 :: 		case (CAN_TSR_RQCP1 | CAN_TSR_TME1): state = CAN_TxStatus_Failed;
L_CAN_TransmitStatus83:
; state start address is: 0 (R0)
MOVS	R0, #0
;stm32f10x_can.c,621 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus80
;stm32f10x_can.c,622 :: 		case (CAN_TSR_RQCP2 | CAN_TSR_TME2): state = CAN_TxStatus_Failed;
L_CAN_TransmitStatus84:
; state start address is: 0 (R0)
MOVS	R0, #0
;stm32f10x_can.c,623 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus80
;stm32f10x_can.c,625 :: 		case (CAN_TSR_RQCP0 | CAN_TSR_TXOK0 | CAN_TSR_TME0):state = CAN_TxStatus_Ok;
L_CAN_TransmitStatus85:
; state start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_can.c,626 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus80
;stm32f10x_can.c,627 :: 		case (CAN_TSR_RQCP1 | CAN_TSR_TXOK1 | CAN_TSR_TME1):state = CAN_TxStatus_Ok;
L_CAN_TransmitStatus86:
; state start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_can.c,628 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus80
;stm32f10x_can.c,629 :: 		case (CAN_TSR_RQCP2 | CAN_TSR_TXOK2 | CAN_TSR_TME2):state = CAN_TxStatus_Ok;
L_CAN_TransmitStatus87:
; state start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_can.c,630 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus80
;stm32f10x_can.c,631 :: 		default: state = CAN_TxStatus_Failed;
L_CAN_TransmitStatus88:
; state start address is: 0 (R0)
MOVS	R0, #0
;stm32f10x_can.c,632 :: 		break;
IT	AL
BAL	L_CAN_TransmitStatus80
;stm32f10x_can.c,633 :: 		}
L_CAN_TransmitStatus79:
CMP	R0, #0
IT	EQ
BEQ	L_CAN_TransmitStatus81
MOVW	R2, #1
MOVT	R2, #1024
CMP	R0, R2
IT	EQ
BEQ	L_CAN_TransmitStatus82
MOVW	R2, #256
MOVT	R2, #2048
CMP	R0, R2
IT	EQ
BEQ	L_CAN_TransmitStatus83
MOVW	R2, #0
MOVT	R2, #4097
CMP	R0, R2
IT	EQ
BEQ	L_CAN_TransmitStatus84
MOVW	R2, #3
MOVT	R2, #1024
CMP	R0, R2
IT	EQ
BEQ	L_CAN_TransmitStatus85
MOVW	R2, #768
MOVT	R2, #2048
CMP	R0, R2
IT	EQ
BEQ	L_CAN_TransmitStatus86
MOVW	R2, #0
MOVT	R2, #4099
CMP	R0, R2
IT	EQ
BEQ	L_CAN_TransmitStatus87
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus88
L_CAN_TransmitStatus80:
;stm32f10x_can.c,634 :: 		return (uint8_t) state;
; state start address is: 0 (R0)
UXTB	R0, R0
; state end address is: 0 (R0)
;stm32f10x_can.c,635 :: 		}
L_end_CAN_TransmitStatus:
BX	LR
; end of _CAN_TransmitStatus
_CAN_CancelTransmit:
;stm32f10x_can.c,643 :: 		void CAN_CancelTransmit(CAN_TypeDef* CANx, uint8_t Mailbox)
; Mailbox start address is: 4 (R1)
; CANx start address is: 0 (R0)
; Mailbox end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; Mailbox start address is: 4 (R1)
;stm32f10x_can.c,649 :: 		switch (Mailbox)
IT	AL
BAL	L_CAN_CancelTransmit89
; Mailbox end address is: 4 (R1)
;stm32f10x_can.c,651 :: 		case (CAN_TXMAILBOX_0): CANx->TSR |= CAN_TSR_ABRQ0;
L_CAN_CancelTransmit91:
ADDW	R3, R0, #8
; CANx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #128
STR	R2, [R3, #0]
;stm32f10x_can.c,652 :: 		break;
IT	AL
BAL	L_CAN_CancelTransmit90
;stm32f10x_can.c,653 :: 		case (CAN_TXMAILBOX_1): CANx->TSR |= CAN_TSR_ABRQ1;
L_CAN_CancelTransmit92:
; CANx start address is: 0 (R0)
ADDW	R3, R0, #8
; CANx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #32768
STR	R2, [R3, #0]
;stm32f10x_can.c,654 :: 		break;
IT	AL
BAL	L_CAN_CancelTransmit90
;stm32f10x_can.c,655 :: 		case (CAN_TXMAILBOX_2): CANx->TSR |= CAN_TSR_ABRQ2;
L_CAN_CancelTransmit93:
; CANx start address is: 0 (R0)
ADDW	R3, R0, #8
; CANx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #8388608
STR	R2, [R3, #0]
;stm32f10x_can.c,656 :: 		break;
IT	AL
BAL	L_CAN_CancelTransmit90
;stm32f10x_can.c,657 :: 		default:
L_CAN_CancelTransmit94:
;stm32f10x_can.c,658 :: 		break;
IT	AL
BAL	L_CAN_CancelTransmit90
;stm32f10x_can.c,659 :: 		}
L_CAN_CancelTransmit89:
; Mailbox start address is: 4 (R1)
; CANx start address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_CAN_CancelTransmit91
CMP	R1, #1
IT	EQ
BEQ	L_CAN_CancelTransmit92
CMP	R1, #2
IT	EQ
BEQ	L_CAN_CancelTransmit93
; CANx end address is: 0 (R0)
; Mailbox end address is: 4 (R1)
IT	AL
BAL	L_CAN_CancelTransmit94
L_CAN_CancelTransmit90:
;stm32f10x_can.c,660 :: 		}
L_end_CAN_CancelTransmit:
BX	LR
; end of _CAN_CancelTransmit
_CAN_Receive:
;stm32f10x_can.c,671 :: 		void CAN_Receive(CAN_TypeDef* CANx, uint8_t FIFONumber, CanRxMsg* RxMessage)
; RxMessage start address is: 8 (R2)
; FIFONumber start address is: 4 (R1)
; CANx start address is: 0 (R0)
; RxMessage end address is: 8 (R2)
; FIFONumber end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; FIFONumber start address is: 4 (R1)
; RxMessage start address is: 8 (R2)
;stm32f10x_can.c,677 :: 		RxMessage->IDE = (uint8_t)0x04 & CANx->sFIFOMailBox[FIFONumber].RIR;
ADDW	R5, R2, #8
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
LDR	R3, [R3, #0]
AND	R3, R3, #4
STRB	R3, [R5, #0]
;stm32f10x_can.c,678 :: 		if (RxMessage->IDE == CAN_Id_Standard)
ADDW	R3, R2, #8
LDRB	R3, [R3, #0]
CMP	R3, #0
IT	NE
BNE	L_CAN_Receive95
;stm32f10x_can.c,680 :: 		RxMessage->StdId = (uint32_t)0x000007FF & (CANx->sFIFOMailBox[FIFONumber].RIR >> 21);
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
LDR	R3, [R3, #0]
LSRS	R4, R3, #21
MOVW	R3, #2047
MOVT	R3, #0
ANDS	R3, R4
STR	R3, [R2, #0]
;stm32f10x_can.c,681 :: 		}
IT	AL
BAL	L_CAN_Receive96
L_CAN_Receive95:
;stm32f10x_can.c,684 :: 		RxMessage->ExtId = (uint32_t)0x1FFFFFFF & (CANx->sFIFOMailBox[FIFONumber].RIR >> 3);
ADDS	R5, R2, #4
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
LDR	R3, [R3, #0]
LSRS	R4, R3, #3
MVN	R3, #-536870912
ANDS	R3, R4
STR	R3, [R5, #0]
;stm32f10x_can.c,685 :: 		}
L_CAN_Receive96:
;stm32f10x_can.c,687 :: 		RxMessage->RTR = (uint8_t)0x02 & CANx->sFIFOMailBox[FIFONumber].RIR;
ADDW	R5, R2, #9
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
LDR	R3, [R3, #0]
AND	R3, R3, #2
STRB	R3, [R5, #0]
;stm32f10x_can.c,689 :: 		RxMessage->DLC = (uint8_t)0x0F & CANx->sFIFOMailBox[FIFONumber].RDTR;
ADDW	R5, R2, #10
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
ADDS	R3, R3, #4
LDR	R3, [R3, #0]
AND	R3, R3, #15
STRB	R3, [R5, #0]
;stm32f10x_can.c,691 :: 		RxMessage->FMI = (uint8_t)0xFF & (CANx->sFIFOMailBox[FIFONumber].RDTR >> 8);
ADDW	R5, R2, #19
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
ADDS	R3, R3, #4
LDR	R3, [R3, #0]
LSRS	R3, R3, #8
AND	R3, R3, #255
STRB	R3, [R5, #0]
;stm32f10x_can.c,693 :: 		RxMessage->Data[0] = (uint8_t)0xFF & CANx->sFIFOMailBox[FIFONumber].RDLR;
ADDW	R5, R2, #11
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
ADDS	R3, #8
LDR	R3, [R3, #0]
AND	R3, R3, #255
STRB	R3, [R5, #0]
;stm32f10x_can.c,694 :: 		RxMessage->Data[1] = (uint8_t)0xFF & (CANx->sFIFOMailBox[FIFONumber].RDLR >> 8);
ADDW	R3, R2, #11
ADDS	R5, R3, #1
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
ADDS	R3, #8
LDR	R3, [R3, #0]
LSRS	R3, R3, #8
AND	R3, R3, #255
STRB	R3, [R5, #0]
;stm32f10x_can.c,695 :: 		RxMessage->Data[2] = (uint8_t)0xFF & (CANx->sFIFOMailBox[FIFONumber].RDLR >> 16);
ADDW	R3, R2, #11
ADDS	R5, R3, #2
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
ADDS	R3, #8
LDR	R3, [R3, #0]
LSRS	R3, R3, #16
AND	R3, R3, #255
STRB	R3, [R5, #0]
;stm32f10x_can.c,696 :: 		RxMessage->Data[3] = (uint8_t)0xFF & (CANx->sFIFOMailBox[FIFONumber].RDLR >> 24);
ADDW	R3, R2, #11
ADDS	R5, R3, #3
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
ADDS	R3, #8
LDR	R3, [R3, #0]
LSRS	R3, R3, #24
AND	R3, R3, #255
STRB	R3, [R5, #0]
;stm32f10x_can.c,697 :: 		RxMessage->Data[4] = (uint8_t)0xFF & CANx->sFIFOMailBox[FIFONumber].RDHR;
ADDW	R3, R2, #11
ADDS	R5, R3, #4
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
ADDS	R3, #12
LDR	R3, [R3, #0]
AND	R3, R3, #255
STRB	R3, [R5, #0]
;stm32f10x_can.c,698 :: 		RxMessage->Data[5] = (uint8_t)0xFF & (CANx->sFIFOMailBox[FIFONumber].RDHR >> 8);
ADDW	R3, R2, #11
ADDS	R5, R3, #5
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
ADDS	R3, #12
LDR	R3, [R3, #0]
LSRS	R3, R3, #8
AND	R3, R3, #255
STRB	R3, [R5, #0]
;stm32f10x_can.c,699 :: 		RxMessage->Data[6] = (uint8_t)0xFF & (CANx->sFIFOMailBox[FIFONumber].RDHR >> 16);
ADDW	R3, R2, #11
ADDS	R5, R3, #6
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
ADDS	R3, #12
LDR	R3, [R3, #0]
LSRS	R3, R3, #16
AND	R3, R3, #255
STRB	R3, [R5, #0]
;stm32f10x_can.c,700 :: 		RxMessage->Data[7] = (uint8_t)0xFF & (CANx->sFIFOMailBox[FIFONumber].RDHR >> 24);
ADDW	R3, R2, #11
; RxMessage end address is: 8 (R2)
ADDS	R5, R3, #7
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
ADDS	R3, #12
LDR	R3, [R3, #0]
LSRS	R3, R3, #24
AND	R3, R3, #255
STRB	R3, [R5, #0]
;stm32f10x_can.c,703 :: 		if (FIFONumber == CAN_FIFO0)
CMP	R1, #0
IT	NE
BNE	L_CAN_Receive97
; FIFONumber end address is: 4 (R1)
;stm32f10x_can.c,705 :: 		CANx->RF0R |= CAN_RF0R_RFOM0;
ADDW	R4, R0, #12
; CANx end address is: 0 (R0)
LDR	R3, [R4, #0]
ORR	R3, R3, #32
STR	R3, [R4, #0]
;stm32f10x_can.c,706 :: 		}
IT	AL
BAL	L_CAN_Receive98
L_CAN_Receive97:
;stm32f10x_can.c,710 :: 		CANx->RF1R |= CAN_RF1R_RFOM1;
; CANx start address is: 0 (R0)
ADDW	R4, R0, #16
; CANx end address is: 0 (R0)
LDR	R3, [R4, #0]
ORR	R3, R3, #32
STR	R3, [R4, #0]
;stm32f10x_can.c,711 :: 		}
L_CAN_Receive98:
;stm32f10x_can.c,712 :: 		}
L_end_CAN_Receive:
BX	LR
; end of _CAN_Receive
_CAN_FIFORelease:
;stm32f10x_can.c,720 :: 		void CAN_FIFORelease(CAN_TypeDef* CANx, uint8_t FIFONumber)
; FIFONumber start address is: 4 (R1)
; CANx start address is: 0 (R0)
; FIFONumber end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; FIFONumber start address is: 4 (R1)
;stm32f10x_can.c,726 :: 		if (FIFONumber == CAN_FIFO0)
CMP	R1, #0
IT	NE
BNE	L_CAN_FIFORelease99
; FIFONumber end address is: 4 (R1)
;stm32f10x_can.c,728 :: 		CANx->RF0R |= CAN_RF0R_RFOM0;
ADDW	R3, R0, #12
; CANx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #32
STR	R2, [R3, #0]
;stm32f10x_can.c,729 :: 		}
IT	AL
BAL	L_CAN_FIFORelease100
L_CAN_FIFORelease99:
;stm32f10x_can.c,733 :: 		CANx->RF1R |= CAN_RF1R_RFOM1;
; CANx start address is: 0 (R0)
ADDW	R3, R0, #16
; CANx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #32
STR	R2, [R3, #0]
;stm32f10x_can.c,734 :: 		}
L_CAN_FIFORelease100:
;stm32f10x_can.c,735 :: 		}
L_end_CAN_FIFORelease:
BX	LR
; end of _CAN_FIFORelease
_CAN_MessagePending:
;stm32f10x_can.c,743 :: 		uint8_t CAN_MessagePending(CAN_TypeDef* CANx, uint8_t FIFONumber)
; FIFONumber start address is: 4 (R1)
; CANx start address is: 0 (R0)
; FIFONumber end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; FIFONumber start address is: 4 (R1)
;stm32f10x_can.c,745 :: 		uint8_t message_pending=0;
;stm32f10x_can.c,749 :: 		if (FIFONumber == CAN_FIFO0)
CMP	R1, #0
IT	NE
BNE	L_CAN_MessagePending101
; FIFONumber end address is: 4 (R1)
;stm32f10x_can.c,751 :: 		message_pending = (uint8_t)(CANx->RF0R&(uint32_t)0x03);
ADDW	R2, R0, #12
; CANx end address is: 0 (R0)
LDR	R2, [R2, #0]
AND	R2, R2, #3
; message_pending start address is: 0 (R0)
UXTB	R0, R2
;stm32f10x_can.c,752 :: 		}
; message_pending end address is: 0 (R0)
IT	AL
BAL	L_CAN_MessagePending102
L_CAN_MessagePending101:
;stm32f10x_can.c,753 :: 		else if (FIFONumber == CAN_FIFO1)
; FIFONumber start address is: 4 (R1)
; CANx start address is: 0 (R0)
CMP	R1, #1
IT	NE
BNE	L_CAN_MessagePending103
; FIFONumber end address is: 4 (R1)
;stm32f10x_can.c,755 :: 		message_pending = (uint8_t)(CANx->RF1R&(uint32_t)0x03);
ADDW	R2, R0, #16
; CANx end address is: 0 (R0)
LDR	R2, [R2, #0]
AND	R2, R2, #3
; message_pending start address is: 0 (R0)
UXTB	R0, R2
;stm32f10x_can.c,756 :: 		}
; message_pending end address is: 0 (R0)
IT	AL
BAL	L_CAN_MessagePending104
L_CAN_MessagePending103:
;stm32f10x_can.c,759 :: 		message_pending = 0;
; message_pending start address is: 0 (R0)
MOVS	R0, #0
; message_pending end address is: 0 (R0)
;stm32f10x_can.c,760 :: 		}
L_CAN_MessagePending104:
; message_pending start address is: 0 (R0)
; message_pending end address is: 0 (R0)
L_CAN_MessagePending102:
;stm32f10x_can.c,761 :: 		return message_pending;
; message_pending start address is: 0 (R0)
; message_pending end address is: 0 (R0)
;stm32f10x_can.c,762 :: 		}
L_end_CAN_MessagePending:
BX	LR
; end of _CAN_MessagePending
_CAN_OperatingModeRequest:
;stm32f10x_can.c,774 :: 		uint8_t CAN_OperatingModeRequest(CAN_TypeDef* CANx, uint8_t CAN_OperatingMode)
; CAN_OperatingMode start address is: 4 (R1)
; CANx start address is: 0 (R0)
UXTB	R2, R1
; CAN_OperatingMode end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; CAN_OperatingMode start address is: 8 (R2)
;stm32f10x_can.c,776 :: 		uint8_t status = CAN_ModeStatus_Failed;
;stm32f10x_can.c,779 :: 		uint32_t timeout = INAK_TIMEOUT;
; timeout start address is: 4 (R1)
MOVW	R1, #65535
MOVT	R1, #0
;stm32f10x_can.c,785 :: 		if (CAN_OperatingMode == CAN_OperatingMode_Initialization)
CMP	R2, #0
IT	NE
BNE	L_CAN_OperatingModeRequest105
; CAN_OperatingMode end address is: 8 (R2)
;stm32f10x_can.c,788 :: 		CANx->MCR = (uint32_t)((CANx->MCR & (uint32_t)(~(uint32_t)CAN_MCR_SLEEP)) | CAN_MCR_INRQ);
LDR	R3, [R0, #0]
MVN	R2, #2
AND	R2, R3, R2, LSL #0
ORR	R2, R2, #1
STR	R2, [R0, #0]
; CANx end address is: 0 (R0)
; timeout end address is: 4 (R1)
;stm32f10x_can.c,791 :: 		while (((CANx->MSR & CAN_MODE_MASK) != CAN_MSR_INAK) && (timeout != 0))
L_CAN_OperatingModeRequest106:
; timeout start address is: 4 (R1)
; CANx start address is: 0 (R0)
ADDS	R2, R0, #4
LDR	R2, [R2, #0]
AND	R2, R2, #3
CMP	R2, #1
IT	EQ
BEQ	L__CAN_OperatingModeRequest216
CMP	R1, #0
IT	EQ
BEQ	L__CAN_OperatingModeRequest215
L__CAN_OperatingModeRequest214:
;stm32f10x_can.c,793 :: 		timeout--;
SUBS	R1, R1, #1
;stm32f10x_can.c,794 :: 		}
; timeout end address is: 4 (R1)
IT	AL
BAL	L_CAN_OperatingModeRequest106
;stm32f10x_can.c,791 :: 		while (((CANx->MSR & CAN_MODE_MASK) != CAN_MSR_INAK) && (timeout != 0))
L__CAN_OperatingModeRequest216:
L__CAN_OperatingModeRequest215:
;stm32f10x_can.c,795 :: 		if ((CANx->MSR & CAN_MODE_MASK) != CAN_MSR_INAK)
ADDS	R2, R0, #4
; CANx end address is: 0 (R0)
LDR	R2, [R2, #0]
AND	R2, R2, #3
CMP	R2, #1
IT	EQ
BEQ	L_CAN_OperatingModeRequest110
;stm32f10x_can.c,797 :: 		status = CAN_ModeStatus_Failed;
; status start address is: 0 (R0)
MOVS	R0, #0
;stm32f10x_can.c,798 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_CAN_OperatingModeRequest111
L_CAN_OperatingModeRequest110:
;stm32f10x_can.c,801 :: 		status = CAN_ModeStatus_Success;
; status start address is: 0 (R0)
MOVS	R0, #1
; status end address is: 0 (R0)
;stm32f10x_can.c,802 :: 		}
L_CAN_OperatingModeRequest111:
;stm32f10x_can.c,803 :: 		}
; status start address is: 0 (R0)
; status end address is: 0 (R0)
IT	AL
BAL	L_CAN_OperatingModeRequest112
L_CAN_OperatingModeRequest105:
;stm32f10x_can.c,804 :: 		else  if (CAN_OperatingMode == CAN_OperatingMode_Normal)
; timeout start address is: 4 (R1)
; CANx start address is: 0 (R0)
; CAN_OperatingMode start address is: 8 (R2)
CMP	R2, #1
IT	NE
BNE	L_CAN_OperatingModeRequest113
; CAN_OperatingMode end address is: 8 (R2)
;stm32f10x_can.c,807 :: 		CANx->MCR &= (uint32_t)(~(CAN_MCR_SLEEP|CAN_MCR_INRQ));
LDR	R3, [R0, #0]
MVN	R2, #3
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
; CANx end address is: 0 (R0)
; timeout end address is: 4 (R1)
;stm32f10x_can.c,810 :: 		while (((CANx->MSR & CAN_MODE_MASK) != 0) && (timeout!=0))
L_CAN_OperatingModeRequest114:
; timeout start address is: 4 (R1)
; CANx start address is: 0 (R0)
ADDS	R2, R0, #4
LDR	R2, [R2, #0]
AND	R2, R2, #3
CMP	R2, #0
IT	EQ
BEQ	L__CAN_OperatingModeRequest218
CMP	R1, #0
IT	EQ
BEQ	L__CAN_OperatingModeRequest217
L__CAN_OperatingModeRequest213:
;stm32f10x_can.c,812 :: 		timeout--;
SUBS	R1, R1, #1
;stm32f10x_can.c,813 :: 		}
; timeout end address is: 4 (R1)
IT	AL
BAL	L_CAN_OperatingModeRequest114
;stm32f10x_can.c,810 :: 		while (((CANx->MSR & CAN_MODE_MASK) != 0) && (timeout!=0))
L__CAN_OperatingModeRequest218:
L__CAN_OperatingModeRequest217:
;stm32f10x_can.c,814 :: 		if ((CANx->MSR & CAN_MODE_MASK) != 0)
ADDS	R2, R0, #4
; CANx end address is: 0 (R0)
LDR	R2, [R2, #0]
AND	R2, R2, #3
CMP	R2, #0
IT	EQ
BEQ	L_CAN_OperatingModeRequest118
;stm32f10x_can.c,816 :: 		status = CAN_ModeStatus_Failed;
; status start address is: 0 (R0)
MOVS	R0, #0
;stm32f10x_can.c,817 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_CAN_OperatingModeRequest119
L_CAN_OperatingModeRequest118:
;stm32f10x_can.c,820 :: 		status = CAN_ModeStatus_Success;
; status start address is: 0 (R0)
MOVS	R0, #1
; status end address is: 0 (R0)
;stm32f10x_can.c,821 :: 		}
L_CAN_OperatingModeRequest119:
;stm32f10x_can.c,822 :: 		}
; status start address is: 0 (R0)
; status end address is: 0 (R0)
IT	AL
BAL	L_CAN_OperatingModeRequest120
L_CAN_OperatingModeRequest113:
;stm32f10x_can.c,823 :: 		else  if (CAN_OperatingMode == CAN_OperatingMode_Sleep)
; timeout start address is: 4 (R1)
; CANx start address is: 0 (R0)
; CAN_OperatingMode start address is: 8 (R2)
CMP	R2, #2
IT	NE
BNE	L_CAN_OperatingModeRequest121
; CAN_OperatingMode end address is: 8 (R2)
;stm32f10x_can.c,826 :: 		CANx->MCR = (uint32_t)((CANx->MCR & (uint32_t)(~(uint32_t)CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
LDR	R3, [R0, #0]
MVN	R2, #1
AND	R2, R3, R2, LSL #0
ORR	R2, R2, #2
STR	R2, [R0, #0]
; CANx end address is: 0 (R0)
; timeout end address is: 4 (R1)
;stm32f10x_can.c,829 :: 		while (((CANx->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK) && (timeout!=0))
L_CAN_OperatingModeRequest122:
; timeout start address is: 4 (R1)
; CANx start address is: 0 (R0)
ADDS	R2, R0, #4
LDR	R2, [R2, #0]
AND	R2, R2, #3
CMP	R2, #2
IT	EQ
BEQ	L__CAN_OperatingModeRequest220
CMP	R1, #0
IT	EQ
BEQ	L__CAN_OperatingModeRequest219
L__CAN_OperatingModeRequest212:
;stm32f10x_can.c,831 :: 		timeout--;
SUBS	R1, R1, #1
;stm32f10x_can.c,832 :: 		}
; timeout end address is: 4 (R1)
IT	AL
BAL	L_CAN_OperatingModeRequest122
;stm32f10x_can.c,829 :: 		while (((CANx->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK) && (timeout!=0))
L__CAN_OperatingModeRequest220:
L__CAN_OperatingModeRequest219:
;stm32f10x_can.c,833 :: 		if ((CANx->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK)
ADDS	R2, R0, #4
; CANx end address is: 0 (R0)
LDR	R2, [R2, #0]
AND	R2, R2, #3
CMP	R2, #2
IT	EQ
BEQ	L_CAN_OperatingModeRequest126
;stm32f10x_can.c,835 :: 		status = CAN_ModeStatus_Failed;
; status start address is: 0 (R0)
MOVS	R0, #0
;stm32f10x_can.c,836 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_CAN_OperatingModeRequest127
L_CAN_OperatingModeRequest126:
;stm32f10x_can.c,839 :: 		status = CAN_ModeStatus_Success;
; status start address is: 0 (R0)
MOVS	R0, #1
; status end address is: 0 (R0)
;stm32f10x_can.c,840 :: 		}
L_CAN_OperatingModeRequest127:
;stm32f10x_can.c,841 :: 		}
; status start address is: 0 (R0)
; status end address is: 0 (R0)
IT	AL
BAL	L_CAN_OperatingModeRequest128
L_CAN_OperatingModeRequest121:
;stm32f10x_can.c,844 :: 		status = CAN_ModeStatus_Failed;
; status start address is: 0 (R0)
MOVS	R0, #0
; status end address is: 0 (R0)
;stm32f10x_can.c,845 :: 		}
L_CAN_OperatingModeRequest128:
; status start address is: 0 (R0)
; status end address is: 0 (R0)
L_CAN_OperatingModeRequest120:
; status start address is: 0 (R0)
; status end address is: 0 (R0)
L_CAN_OperatingModeRequest112:
;stm32f10x_can.c,847 :: 		return  (uint8_t) status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f10x_can.c,848 :: 		}
L_end_CAN_OperatingModeRequest:
BX	LR
; end of _CAN_OperatingModeRequest
_CAN_Sleep:
;stm32f10x_can.c,856 :: 		uint8_t CAN_Sleep(CAN_TypeDef* CANx)
; CANx start address is: 0 (R0)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
;stm32f10x_can.c,858 :: 		uint8_t sleepstatus = CAN_Sleep_Failed;
; sleepstatus start address is: 12 (R3)
MOVS	R3, #0
;stm32f10x_can.c,864 :: 		CANx->MCR = (((CANx->MCR) & (uint32_t)(~(uint32_t)CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
LDR	R2, [R0, #0]
MVN	R1, #1
AND	R1, R2, R1, LSL #0
ORR	R1, R1, #2
STR	R1, [R0, #0]
;stm32f10x_can.c,867 :: 		if ((CANx->MSR & (CAN_MSR_SLAK|CAN_MSR_INAK)) == CAN_MSR_SLAK)
ADDS	R1, R0, #4
; CANx end address is: 0 (R0)
LDR	R1, [R1, #0]
AND	R1, R1, #3
CMP	R1, #2
IT	NE
BNE	L__CAN_Sleep221
; sleepstatus end address is: 12 (R3)
;stm32f10x_can.c,870 :: 		sleepstatus =  CAN_Sleep_Ok;
; sleepstatus start address is: 0 (R0)
MOVS	R0, #1
; sleepstatus end address is: 0 (R0)
;stm32f10x_can.c,871 :: 		}
IT	AL
BAL	L_CAN_Sleep129
L__CAN_Sleep221:
;stm32f10x_can.c,867 :: 		if ((CANx->MSR & (CAN_MSR_SLAK|CAN_MSR_INAK)) == CAN_MSR_SLAK)
UXTB	R0, R3
;stm32f10x_can.c,871 :: 		}
L_CAN_Sleep129:
;stm32f10x_can.c,873 :: 		return (uint8_t)sleepstatus;
; sleepstatus start address is: 0 (R0)
; sleepstatus end address is: 0 (R0)
;stm32f10x_can.c,874 :: 		}
L_end_CAN_Sleep:
BX	LR
; end of _CAN_Sleep
_CAN_WakeUp:
;stm32f10x_can.c,882 :: 		uint8_t CAN_WakeUp(CAN_TypeDef* CANx)
; CANx start address is: 0 (R0)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
;stm32f10x_can.c,884 :: 		uint32_t wait_slak = SLAK_TIMEOUT;
; wait_slak start address is: 12 (R3)
MOVW	R3, #65535
MOVT	R3, #0
;stm32f10x_can.c,885 :: 		uint8_t wakeupstatus = CAN_WakeUp_Failed;
; wakeupstatus start address is: 16 (R4)
MOVS	R4, #0
;stm32f10x_can.c,891 :: 		CANx->MCR &= ~(uint32_t)CAN_MCR_SLEEP;
LDR	R2, [R0, #0]
MVN	R1, #2
AND	R1, R2, R1, LSL #0
STR	R1, [R0, #0]
; wakeupstatus end address is: 16 (R4)
; CANx end address is: 0 (R0)
; wait_slak end address is: 12 (R3)
UXTB	R2, R4
;stm32f10x_can.c,894 :: 		while(((CANx->MSR & CAN_MSR_SLAK) == CAN_MSR_SLAK)&&(wait_slak!=0x00))
L_CAN_WakeUp130:
; wakeupstatus start address is: 8 (R2)
; wait_slak start address is: 12 (R3)
; CANx start address is: 0 (R0)
ADDS	R1, R0, #4
LDR	R1, [R1, #0]
AND	R1, R1, #2
CMP	R1, #2
IT	NE
BNE	L__CAN_WakeUp224
CMP	R3, #0
IT	EQ
BEQ	L__CAN_WakeUp223
L__CAN_WakeUp222:
;stm32f10x_can.c,896 :: 		wait_slak--;
SUBS	R3, R3, #1
;stm32f10x_can.c,897 :: 		}
; wait_slak end address is: 12 (R3)
IT	AL
BAL	L_CAN_WakeUp130
;stm32f10x_can.c,894 :: 		while(((CANx->MSR & CAN_MSR_SLAK) == CAN_MSR_SLAK)&&(wait_slak!=0x00))
L__CAN_WakeUp224:
L__CAN_WakeUp223:
;stm32f10x_can.c,898 :: 		if((CANx->MSR & CAN_MSR_SLAK) != CAN_MSR_SLAK)
ADDS	R1, R0, #4
; CANx end address is: 0 (R0)
LDR	R1, [R1, #0]
AND	R1, R1, #2
CMP	R1, #2
IT	EQ
BEQ	L__CAN_WakeUp225
; wakeupstatus end address is: 8 (R2)
;stm32f10x_can.c,901 :: 		wakeupstatus = CAN_WakeUp_Ok;
; wakeupstatus start address is: 0 (R0)
MOVS	R0, #1
; wakeupstatus end address is: 0 (R0)
;stm32f10x_can.c,902 :: 		}
IT	AL
BAL	L_CAN_WakeUp134
L__CAN_WakeUp225:
;stm32f10x_can.c,898 :: 		if((CANx->MSR & CAN_MSR_SLAK) != CAN_MSR_SLAK)
UXTB	R0, R2
;stm32f10x_can.c,902 :: 		}
L_CAN_WakeUp134:
;stm32f10x_can.c,904 :: 		return (uint8_t)wakeupstatus;
; wakeupstatus start address is: 0 (R0)
; wakeupstatus end address is: 0 (R0)
;stm32f10x_can.c,905 :: 		}
L_end_CAN_WakeUp:
BX	LR
; end of _CAN_WakeUp
_CAN_GetLastErrorCode:
;stm32f10x_can.c,922 :: 		uint8_t CAN_GetLastErrorCode(CAN_TypeDef* CANx)
; CANx start address is: 0 (R0)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
;stm32f10x_can.c,924 :: 		uint8_t errorcode=0;
;stm32f10x_can.c,930 :: 		errorcode = (((uint8_t)CANx->ESR) & (uint8_t)CAN_ESR_LEC);
ADDW	R1, R0, #24
; CANx end address is: 0 (R0)
LDR	R1, [R1, #0]
UXTB	R1, R1
AND	R1, R1, #112
;stm32f10x_can.c,933 :: 		return errorcode;
UXTB	R0, R1
;stm32f10x_can.c,934 :: 		}
L_end_CAN_GetLastErrorCode:
BX	LR
; end of _CAN_GetLastErrorCode
_CAN_GetReceiveErrorCounter:
;stm32f10x_can.c,946 :: 		uint8_t CAN_GetReceiveErrorCounter(CAN_TypeDef* CANx)
; CANx start address is: 0 (R0)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
;stm32f10x_can.c,948 :: 		uint8_t counter=0;
;stm32f10x_can.c,954 :: 		counter = (uint8_t)((CANx->ESR & CAN_ESR_REC)>> 24);
ADDW	R1, R0, #24
; CANx end address is: 0 (R0)
LDR	R1, [R1, #0]
AND	R1, R1, #-16777216
LSRS	R1, R1, #24
;stm32f10x_can.c,957 :: 		return counter;
UXTB	R0, R1
;stm32f10x_can.c,958 :: 		}
L_end_CAN_GetReceiveErrorCounter:
BX	LR
; end of _CAN_GetReceiveErrorCounter
_CAN_GetLSBTransmitErrorCounter:
;stm32f10x_can.c,966 :: 		uint8_t CAN_GetLSBTransmitErrorCounter(CAN_TypeDef* CANx)
; CANx start address is: 0 (R0)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
;stm32f10x_can.c,968 :: 		uint8_t counter=0;
;stm32f10x_can.c,974 :: 		counter = (uint8_t)((CANx->ESR & CAN_ESR_TEC)>> 16);
ADDW	R1, R0, #24
; CANx end address is: 0 (R0)
LDR	R1, [R1, #0]
AND	R1, R1, #16711680
LSRS	R1, R1, #16
;stm32f10x_can.c,977 :: 		return counter;
UXTB	R0, R1
;stm32f10x_can.c,978 :: 		}
L_end_CAN_GetLSBTransmitErrorCounter:
BX	LR
; end of _CAN_GetLSBTransmitErrorCounter
_CAN_ITConfig:
;stm32f10x_can.c,1003 :: 		void CAN_ITConfig(CAN_TypeDef* CANx, uint32_t CAN_IT, FunctionalState NewState)
; NewState start address is: 8 (R2)
; CAN_IT start address is: 4 (R1)
; CANx start address is: 0 (R0)
; NewState end address is: 8 (R2)
; CAN_IT end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; CAN_IT start address is: 4 (R1)
; NewState start address is: 8 (R2)
;stm32f10x_can.c,1010 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_CAN_ITConfig135
; NewState end address is: 8 (R2)
;stm32f10x_can.c,1013 :: 		CANx->IER |= CAN_IT;
ADDW	R4, R0, #20
; CANx end address is: 0 (R0)
LDR	R3, [R4, #0]
ORRS	R3, R1
; CAN_IT end address is: 4 (R1)
STR	R3, [R4, #0]
;stm32f10x_can.c,1014 :: 		}
IT	AL
BAL	L_CAN_ITConfig136
L_CAN_ITConfig135:
;stm32f10x_can.c,1018 :: 		CANx->IER &= ~CAN_IT;
; CAN_IT start address is: 4 (R1)
; CANx start address is: 0 (R0)
ADDW	R5, R0, #20
; CANx end address is: 0 (R0)
MVN	R4, R1
; CAN_IT end address is: 4 (R1)
LDR	R3, [R5, #0]
ANDS	R3, R4
STR	R3, [R5, #0]
;stm32f10x_can.c,1019 :: 		}
L_CAN_ITConfig136:
;stm32f10x_can.c,1020 :: 		}
L_end_CAN_ITConfig:
BX	LR
; end of _CAN_ITConfig
_CAN_GetFlagStatus:
;stm32f10x_can.c,1043 :: 		FlagStatus CAN_GetFlagStatus(CAN_TypeDef* CANx, uint32_t CAN_FLAG)
; CAN_FLAG start address is: 4 (R1)
; CANx start address is: 0 (R0)
; CAN_FLAG end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; CAN_FLAG start address is: 4 (R1)
;stm32f10x_can.c,1045 :: 		FlagStatus bitstatus = RESET;
;stm32f10x_can.c,1052 :: 		if((CAN_FLAG & CAN_FLAGS_ESR) != (uint32_t)RESET)
AND	R2, R1, #15728640
CMP	R2, #0
IT	EQ
BEQ	L_CAN_GetFlagStatus137
;stm32f10x_can.c,1055 :: 		if ((CANx->ESR & (CAN_FLAG & 0x000FFFFF)) != (uint32_t)RESET)
ADDW	R2, R0, #24
; CANx end address is: 0 (R0)
LDR	R3, [R2, #0]
MOVW	R2, #65535
MOVT	R2, #15
AND	R2, R1, R2, LSL #0
; CAN_FLAG end address is: 4 (R1)
AND	R2, R3, R2, LSL #0
CMP	R2, #0
IT	EQ
BEQ	L_CAN_GetFlagStatus138
;stm32f10x_can.c,1058 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_can.c,1059 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetFlagStatus139
L_CAN_GetFlagStatus138:
;stm32f10x_can.c,1063 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_can.c,1064 :: 		}
L_CAN_GetFlagStatus139:
;stm32f10x_can.c,1065 :: 		}
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetFlagStatus140
L_CAN_GetFlagStatus137:
;stm32f10x_can.c,1066 :: 		else if((CAN_FLAG & CAN_FLAGS_MSR) != (uint32_t)RESET)
; CAN_FLAG start address is: 4 (R1)
; CANx start address is: 0 (R0)
AND	R2, R1, #16777216
CMP	R2, #0
IT	EQ
BEQ	L_CAN_GetFlagStatus141
;stm32f10x_can.c,1069 :: 		if ((CANx->MSR & (CAN_FLAG & 0x000FFFFF)) != (uint32_t)RESET)
ADDS	R2, R0, #4
; CANx end address is: 0 (R0)
LDR	R3, [R2, #0]
MOVW	R2, #65535
MOVT	R2, #15
AND	R2, R1, R2, LSL #0
; CAN_FLAG end address is: 4 (R1)
AND	R2, R3, R2, LSL #0
CMP	R2, #0
IT	EQ
BEQ	L_CAN_GetFlagStatus142
;stm32f10x_can.c,1072 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_can.c,1073 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetFlagStatus143
L_CAN_GetFlagStatus142:
;stm32f10x_can.c,1077 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_can.c,1078 :: 		}
L_CAN_GetFlagStatus143:
;stm32f10x_can.c,1079 :: 		}
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetFlagStatus144
L_CAN_GetFlagStatus141:
;stm32f10x_can.c,1080 :: 		else if((CAN_FLAG & CAN_FLAGS_TSR) != (uint32_t)RESET)
; CAN_FLAG start address is: 4 (R1)
; CANx start address is: 0 (R0)
AND	R2, R1, #134217728
CMP	R2, #0
IT	EQ
BEQ	L_CAN_GetFlagStatus145
;stm32f10x_can.c,1083 :: 		if ((CANx->TSR & (CAN_FLAG & 0x000FFFFF)) != (uint32_t)RESET)
ADDW	R2, R0, #8
; CANx end address is: 0 (R0)
LDR	R3, [R2, #0]
MOVW	R2, #65535
MOVT	R2, #15
AND	R2, R1, R2, LSL #0
; CAN_FLAG end address is: 4 (R1)
AND	R2, R3, R2, LSL #0
CMP	R2, #0
IT	EQ
BEQ	L_CAN_GetFlagStatus146
;stm32f10x_can.c,1086 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_can.c,1087 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetFlagStatus147
L_CAN_GetFlagStatus146:
;stm32f10x_can.c,1091 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_can.c,1092 :: 		}
L_CAN_GetFlagStatus147:
;stm32f10x_can.c,1093 :: 		}
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetFlagStatus148
L_CAN_GetFlagStatus145:
;stm32f10x_can.c,1094 :: 		else if((CAN_FLAG & CAN_FLAGS_RF0R) != (uint32_t)RESET)
; CAN_FLAG start address is: 4 (R1)
; CANx start address is: 0 (R0)
AND	R2, R1, #33554432
CMP	R2, #0
IT	EQ
BEQ	L_CAN_GetFlagStatus149
;stm32f10x_can.c,1097 :: 		if ((CANx->RF0R & (CAN_FLAG & 0x000FFFFF)) != (uint32_t)RESET)
ADDW	R2, R0, #12
; CANx end address is: 0 (R0)
LDR	R3, [R2, #0]
MOVW	R2, #65535
MOVT	R2, #15
AND	R2, R1, R2, LSL #0
; CAN_FLAG end address is: 4 (R1)
AND	R2, R3, R2, LSL #0
CMP	R2, #0
IT	EQ
BEQ	L_CAN_GetFlagStatus150
;stm32f10x_can.c,1100 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_can.c,1101 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetFlagStatus151
L_CAN_GetFlagStatus150:
;stm32f10x_can.c,1105 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_can.c,1106 :: 		}
L_CAN_GetFlagStatus151:
;stm32f10x_can.c,1107 :: 		}
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetFlagStatus152
L_CAN_GetFlagStatus149:
;stm32f10x_can.c,1111 :: 		if ((uint32_t)(CANx->RF1R & (CAN_FLAG & 0x000FFFFF)) != (uint32_t)RESET)
; CAN_FLAG start address is: 4 (R1)
; CANx start address is: 0 (R0)
ADDW	R2, R0, #16
; CANx end address is: 0 (R0)
LDR	R3, [R2, #0]
MOVW	R2, #65535
MOVT	R2, #15
AND	R2, R1, R2, LSL #0
; CAN_FLAG end address is: 4 (R1)
AND	R2, R3, R2, LSL #0
CMP	R2, #0
IT	EQ
BEQ	L_CAN_GetFlagStatus153
;stm32f10x_can.c,1114 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_can.c,1115 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetFlagStatus154
L_CAN_GetFlagStatus153:
;stm32f10x_can.c,1119 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_can.c,1120 :: 		}
L_CAN_GetFlagStatus154:
;stm32f10x_can.c,1121 :: 		}
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
L_CAN_GetFlagStatus152:
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
L_CAN_GetFlagStatus148:
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
L_CAN_GetFlagStatus144:
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
L_CAN_GetFlagStatus140:
;stm32f10x_can.c,1123 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_can.c,1124 :: 		}
L_end_CAN_GetFlagStatus:
BX	LR
; end of _CAN_GetFlagStatus
_CAN_ClearFlag:
;stm32f10x_can.c,1143 :: 		void CAN_ClearFlag(CAN_TypeDef* CANx, uint32_t CAN_FLAG)
; CAN_FLAG start address is: 4 (R1)
; CANx start address is: 0 (R0)
; CAN_FLAG end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; CAN_FLAG start address is: 4 (R1)
;stm32f10x_can.c,1145 :: 		uint32_t flagtmp=0;
;stm32f10x_can.c,1150 :: 		if (CAN_FLAG == CAN_FLAG_LEC) /* ESR register */
MOVW	R2, #112
MOVT	R2, #12528
CMP	R1, R2
IT	NE
BNE	L_CAN_ClearFlag155
; CAN_FLAG end address is: 4 (R1)
;stm32f10x_can.c,1153 :: 		CANx->ESR = (uint32_t)RESET;
ADDW	R3, R0, #24
; CANx end address is: 0 (R0)
MOV	R2, #0
STR	R2, [R3, #0]
;stm32f10x_can.c,1154 :: 		}
IT	AL
BAL	L_CAN_ClearFlag156
L_CAN_ClearFlag155:
;stm32f10x_can.c,1157 :: 		flagtmp = CAN_FLAG & 0x000FFFFF;
; CAN_FLAG start address is: 4 (R1)
; CANx start address is: 0 (R0)
MOVW	R2, #65535
MOVT	R2, #15
AND	R2, R1, R2, LSL #0
; flagtmp start address is: 12 (R3)
MOV	R3, R2
;stm32f10x_can.c,1159 :: 		if ((CAN_FLAG & CAN_FLAGS_RF0R)!=(uint32_t)RESET)
AND	R2, R1, #33554432
CMP	R2, #0
IT	EQ
BEQ	L_CAN_ClearFlag157
; CAN_FLAG end address is: 4 (R1)
;stm32f10x_can.c,1162 :: 		CANx->RF0R = (uint32_t)(flagtmp);
ADDW	R2, R0, #12
; CANx end address is: 0 (R0)
STR	R3, [R2, #0]
; flagtmp end address is: 12 (R3)
;stm32f10x_can.c,1163 :: 		}
IT	AL
BAL	L_CAN_ClearFlag158
L_CAN_ClearFlag157:
;stm32f10x_can.c,1164 :: 		else if ((CAN_FLAG & CAN_FLAGS_RF1R)!=(uint32_t)RESET)
; flagtmp start address is: 12 (R3)
; CAN_FLAG start address is: 4 (R1)
; CANx start address is: 0 (R0)
AND	R2, R1, #67108864
CMP	R2, #0
IT	EQ
BEQ	L_CAN_ClearFlag159
; CAN_FLAG end address is: 4 (R1)
;stm32f10x_can.c,1167 :: 		CANx->RF1R = (uint32_t)(flagtmp);
ADDW	R2, R0, #16
; CANx end address is: 0 (R0)
STR	R3, [R2, #0]
; flagtmp end address is: 12 (R3)
;stm32f10x_can.c,1168 :: 		}
IT	AL
BAL	L_CAN_ClearFlag160
L_CAN_ClearFlag159:
;stm32f10x_can.c,1169 :: 		else if ((CAN_FLAG & CAN_FLAGS_TSR)!=(uint32_t)RESET)
; flagtmp start address is: 12 (R3)
; CAN_FLAG start address is: 4 (R1)
; CANx start address is: 0 (R0)
AND	R2, R1, #134217728
; CAN_FLAG end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_CAN_ClearFlag161
;stm32f10x_can.c,1172 :: 		CANx->TSR = (uint32_t)(flagtmp);
ADDW	R2, R0, #8
; CANx end address is: 0 (R0)
STR	R3, [R2, #0]
; flagtmp end address is: 12 (R3)
;stm32f10x_can.c,1173 :: 		}
IT	AL
BAL	L_CAN_ClearFlag162
L_CAN_ClearFlag161:
;stm32f10x_can.c,1177 :: 		CANx->MSR = (uint32_t)(flagtmp);
; flagtmp start address is: 12 (R3)
; CANx start address is: 0 (R0)
ADDS	R2, R0, #4
; CANx end address is: 0 (R0)
STR	R3, [R2, #0]
; flagtmp end address is: 12 (R3)
;stm32f10x_can.c,1178 :: 		}
L_CAN_ClearFlag162:
L_CAN_ClearFlag160:
L_CAN_ClearFlag158:
;stm32f10x_can.c,1179 :: 		}
L_CAN_ClearFlag156:
;stm32f10x_can.c,1180 :: 		}
L_end_CAN_ClearFlag:
BX	LR
; end of _CAN_ClearFlag
_CAN_GetITStatus:
;stm32f10x_can.c,1203 :: 		ITStatus CAN_GetITStatus(CAN_TypeDef* CANx, uint32_t CAN_IT)
; CAN_IT start address is: 4 (R1)
; CANx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R3, R0
; CAN_IT end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 12 (R3)
; CAN_IT start address is: 4 (R1)
;stm32f10x_can.c,1205 :: 		ITStatus itstatus = RESET;
;stm32f10x_can.c,1211 :: 		if((CANx->IER & CAN_IT) != RESET)
ADDW	R2, R3, #20
LDR	R2, [R2, #0]
ANDS	R2, R1
CMP	R2, #0
IT	EQ
BEQ	L_CAN_GetITStatus163
;stm32f10x_can.c,1214 :: 		switch (CAN_IT)
IT	AL
BAL	L_CAN_GetITStatus164
; CAN_IT end address is: 4 (R1)
;stm32f10x_can.c,1216 :: 		case CAN_IT_TME:
L_CAN_GetITStatus166:
;stm32f10x_can.c,1218 :: 		itstatus = CheckITStatus(CANx->TSR, CAN_TSR_RQCP0|CAN_TSR_RQCP1|CAN_TSR_RQCP2);
ADDW	R2, R3, #8
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOVW	R1, #257
MOVT	R1, #1
MOV	R0, R2
BL	stm32f10x_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f10x_can.c,1219 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f10x_can.c,1220 :: 		case CAN_IT_FMP0:
L_CAN_GetITStatus167:
;stm32f10x_can.c,1222 :: 		itstatus = CheckITStatus(CANx->RF0R, CAN_RF0R_FMP0);
; CANx start address is: 12 (R3)
ADDW	R2, R3, #12
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOVS	R1, #3
MOV	R0, R2
BL	stm32f10x_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f10x_can.c,1223 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f10x_can.c,1224 :: 		case CAN_IT_FF0:
L_CAN_GetITStatus168:
;stm32f10x_can.c,1226 :: 		itstatus = CheckITStatus(CANx->RF0R, CAN_RF0R_FULL0);
; CANx start address is: 12 (R3)
ADDW	R2, R3, #12
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOVS	R1, #8
MOV	R0, R2
BL	stm32f10x_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f10x_can.c,1227 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f10x_can.c,1228 :: 		case CAN_IT_FOV0:
L_CAN_GetITStatus169:
;stm32f10x_can.c,1230 :: 		itstatus = CheckITStatus(CANx->RF0R, CAN_RF0R_FOVR0);
; CANx start address is: 12 (R3)
ADDW	R2, R3, #12
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOVS	R1, #16
MOV	R0, R2
BL	stm32f10x_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f10x_can.c,1231 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f10x_can.c,1232 :: 		case CAN_IT_FMP1:
L_CAN_GetITStatus170:
;stm32f10x_can.c,1234 :: 		itstatus = CheckITStatus(CANx->RF1R, CAN_RF1R_FMP1);
; CANx start address is: 12 (R3)
ADDW	R2, R3, #16
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOVS	R1, #3
MOV	R0, R2
BL	stm32f10x_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f10x_can.c,1235 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f10x_can.c,1236 :: 		case CAN_IT_FF1:
L_CAN_GetITStatus171:
;stm32f10x_can.c,1238 :: 		itstatus = CheckITStatus(CANx->RF1R, CAN_RF1R_FULL1);
; CANx start address is: 12 (R3)
ADDW	R2, R3, #16
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOVS	R1, #8
MOV	R0, R2
BL	stm32f10x_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f10x_can.c,1239 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f10x_can.c,1240 :: 		case CAN_IT_FOV1:
L_CAN_GetITStatus172:
;stm32f10x_can.c,1242 :: 		itstatus = CheckITStatus(CANx->RF1R, CAN_RF1R_FOVR1);
; CANx start address is: 12 (R3)
ADDW	R2, R3, #16
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOVS	R1, #16
MOV	R0, R2
BL	stm32f10x_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f10x_can.c,1243 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f10x_can.c,1244 :: 		case CAN_IT_WKU:
L_CAN_GetITStatus173:
;stm32f10x_can.c,1246 :: 		itstatus = CheckITStatus(CANx->MSR, CAN_MSR_WKUI);
; CANx start address is: 12 (R3)
ADDS	R2, R3, #4
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOVW	R1, #8
MOV	R0, R2
BL	stm32f10x_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f10x_can.c,1247 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f10x_can.c,1248 :: 		case CAN_IT_SLK:
L_CAN_GetITStatus174:
;stm32f10x_can.c,1250 :: 		itstatus = CheckITStatus(CANx->MSR, CAN_MSR_SLAKI);
; CANx start address is: 12 (R3)
ADDS	R2, R3, #4
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOVW	R1, #16
MOV	R0, R2
BL	stm32f10x_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f10x_can.c,1251 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f10x_can.c,1252 :: 		case CAN_IT_EWG:
L_CAN_GetITStatus175:
;stm32f10x_can.c,1254 :: 		itstatus = CheckITStatus(CANx->ESR, CAN_ESR_EWGF);
; CANx start address is: 12 (R3)
ADDW	R2, R3, #24
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOV	R1, #1
MOV	R0, R2
BL	stm32f10x_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f10x_can.c,1255 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f10x_can.c,1256 :: 		case CAN_IT_EPV:
L_CAN_GetITStatus176:
;stm32f10x_can.c,1258 :: 		itstatus = CheckITStatus(CANx->ESR, CAN_ESR_EPVF);
; CANx start address is: 12 (R3)
ADDW	R2, R3, #24
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOV	R1, #2
MOV	R0, R2
BL	stm32f10x_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f10x_can.c,1259 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f10x_can.c,1260 :: 		case CAN_IT_BOF:
L_CAN_GetITStatus177:
;stm32f10x_can.c,1262 :: 		itstatus = CheckITStatus(CANx->ESR, CAN_ESR_BOFF);
; CANx start address is: 12 (R3)
ADDW	R2, R3, #24
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOV	R1, #4
MOV	R0, R2
BL	stm32f10x_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f10x_can.c,1263 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f10x_can.c,1264 :: 		case CAN_IT_LEC:
L_CAN_GetITStatus178:
;stm32f10x_can.c,1266 :: 		itstatus = CheckITStatus(CANx->ESR, CAN_ESR_LEC);
; CANx start address is: 12 (R3)
ADDW	R2, R3, #24
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOV	R1, #112
MOV	R0, R2
BL	stm32f10x_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f10x_can.c,1267 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f10x_can.c,1268 :: 		case CAN_IT_ERR:
L_CAN_GetITStatus179:
;stm32f10x_can.c,1270 :: 		itstatus = CheckITStatus(CANx->MSR, CAN_MSR_ERRI);
; CANx start address is: 12 (R3)
ADDS	R2, R3, #4
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOVW	R1, #4
MOV	R0, R2
BL	stm32f10x_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f10x_can.c,1271 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f10x_can.c,1272 :: 		default :
L_CAN_GetITStatus180:
;stm32f10x_can.c,1274 :: 		itstatus = RESET;
; itstatus start address is: 0 (R0)
MOVS	R0, #0
;stm32f10x_can.c,1275 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f10x_can.c,1276 :: 		}
L_CAN_GetITStatus164:
; CAN_IT start address is: 4 (R1)
; CANx start address is: 12 (R3)
CMP	R1, #1
IT	EQ
BEQ	L_CAN_GetITStatus166
CMP	R1, #2
IT	EQ
BEQ	L_CAN_GetITStatus167
CMP	R1, #4
IT	EQ
BEQ	L_CAN_GetITStatus168
CMP	R1, #8
IT	EQ
BEQ	L_CAN_GetITStatus169
CMP	R1, #16
IT	EQ
BEQ	L_CAN_GetITStatus170
CMP	R1, #32
IT	EQ
BEQ	L_CAN_GetITStatus171
CMP	R1, #64
IT	EQ
BEQ	L_CAN_GetITStatus172
CMP	R1, #65536
IT	EQ
BEQ	L_CAN_GetITStatus173
CMP	R1, #131072
IT	EQ
BEQ	L_CAN_GetITStatus174
CMP	R1, #256
IT	EQ
BEQ	L_CAN_GetITStatus175
CMP	R1, #512
IT	EQ
BEQ	L_CAN_GetITStatus176
CMP	R1, #1024
IT	EQ
BEQ	L_CAN_GetITStatus177
CMP	R1, #2048
IT	EQ
BEQ	L_CAN_GetITStatus178
CMP	R1, #32768
IT	EQ
BEQ	L_CAN_GetITStatus179
; CANx end address is: 12 (R3)
; CAN_IT end address is: 4 (R1)
IT	AL
BAL	L_CAN_GetITStatus180
L_CAN_GetITStatus165:
;stm32f10x_can.c,1277 :: 		}
; itstatus start address is: 0 (R0)
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus181
L_CAN_GetITStatus163:
;stm32f10x_can.c,1281 :: 		itstatus  = RESET;
; itstatus start address is: 0 (R0)
MOVS	R0, #0
; itstatus end address is: 0 (R0)
;stm32f10x_can.c,1282 :: 		}
L_CAN_GetITStatus181:
;stm32f10x_can.c,1285 :: 		return  itstatus;
; itstatus start address is: 0 (R0)
; itstatus end address is: 0 (R0)
;stm32f10x_can.c,1286 :: 		}
L_end_CAN_GetITStatus:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _CAN_GetITStatus
_CAN_ClearITPendingBit:
;stm32f10x_can.c,1306 :: 		void CAN_ClearITPendingBit(CAN_TypeDef* CANx, uint32_t CAN_IT)
; CAN_IT start address is: 4 (R1)
; CANx start address is: 0 (R0)
; CAN_IT end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; CAN_IT start address is: 4 (R1)
;stm32f10x_can.c,1312 :: 		switch (CAN_IT)
IT	AL
BAL	L_CAN_ClearITPendingBit182
; CAN_IT end address is: 4 (R1)
;stm32f10x_can.c,1314 :: 		case CAN_IT_TME:
L_CAN_ClearITPendingBit184:
;stm32f10x_can.c,1316 :: 		CANx->TSR = CAN_TSR_RQCP0|CAN_TSR_RQCP1|CAN_TSR_RQCP2;
ADDW	R3, R0, #8
; CANx end address is: 0 (R0)
MOVW	R2, #257
MOVT	R2, #1
STR	R2, [R3, #0]
;stm32f10x_can.c,1317 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f10x_can.c,1318 :: 		case CAN_IT_FF0:
L_CAN_ClearITPendingBit185:
;stm32f10x_can.c,1320 :: 		CANx->RF0R = CAN_RF0R_FULL0;
; CANx start address is: 0 (R0)
ADDW	R3, R0, #12
; CANx end address is: 0 (R0)
MOVS	R2, #8
STR	R2, [R3, #0]
;stm32f10x_can.c,1321 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f10x_can.c,1322 :: 		case CAN_IT_FOV0:
L_CAN_ClearITPendingBit186:
;stm32f10x_can.c,1324 :: 		CANx->RF0R = CAN_RF0R_FOVR0;
; CANx start address is: 0 (R0)
ADDW	R3, R0, #12
; CANx end address is: 0 (R0)
MOVS	R2, #16
STR	R2, [R3, #0]
;stm32f10x_can.c,1325 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f10x_can.c,1326 :: 		case CAN_IT_FF1:
L_CAN_ClearITPendingBit187:
;stm32f10x_can.c,1328 :: 		CANx->RF1R = CAN_RF1R_FULL1;
; CANx start address is: 0 (R0)
ADDW	R3, R0, #16
; CANx end address is: 0 (R0)
MOVS	R2, #8
STR	R2, [R3, #0]
;stm32f10x_can.c,1329 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f10x_can.c,1330 :: 		case CAN_IT_FOV1:
L_CAN_ClearITPendingBit188:
;stm32f10x_can.c,1332 :: 		CANx->RF1R = CAN_RF1R_FOVR1;
; CANx start address is: 0 (R0)
ADDW	R3, R0, #16
; CANx end address is: 0 (R0)
MOVS	R2, #16
STR	R2, [R3, #0]
;stm32f10x_can.c,1333 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f10x_can.c,1334 :: 		case CAN_IT_WKU:
L_CAN_ClearITPendingBit189:
;stm32f10x_can.c,1336 :: 		CANx->MSR = CAN_MSR_WKUI;
; CANx start address is: 0 (R0)
ADDS	R3, R0, #4
; CANx end address is: 0 (R0)
MOVW	R2, #8
STR	R2, [R3, #0]
;stm32f10x_can.c,1337 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f10x_can.c,1338 :: 		case CAN_IT_SLK:
L_CAN_ClearITPendingBit190:
;stm32f10x_can.c,1340 :: 		CANx->MSR = CAN_MSR_SLAKI;
; CANx start address is: 0 (R0)
ADDS	R3, R0, #4
; CANx end address is: 0 (R0)
MOVW	R2, #16
STR	R2, [R3, #0]
;stm32f10x_can.c,1341 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f10x_can.c,1342 :: 		case CAN_IT_EWG:
L_CAN_ClearITPendingBit191:
;stm32f10x_can.c,1344 :: 		CANx->MSR = CAN_MSR_ERRI;
; CANx start address is: 0 (R0)
ADDS	R3, R0, #4
; CANx end address is: 0 (R0)
MOVW	R2, #4
STR	R2, [R3, #0]
;stm32f10x_can.c,1347 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f10x_can.c,1348 :: 		case CAN_IT_EPV:
L_CAN_ClearITPendingBit192:
;stm32f10x_can.c,1350 :: 		CANx->MSR = CAN_MSR_ERRI;
; CANx start address is: 0 (R0)
ADDS	R3, R0, #4
; CANx end address is: 0 (R0)
MOVW	R2, #4
STR	R2, [R3, #0]
;stm32f10x_can.c,1353 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f10x_can.c,1354 :: 		case CAN_IT_BOF:
L_CAN_ClearITPendingBit193:
;stm32f10x_can.c,1356 :: 		CANx->MSR = CAN_MSR_ERRI;
; CANx start address is: 0 (R0)
ADDS	R3, R0, #4
; CANx end address is: 0 (R0)
MOVW	R2, #4
STR	R2, [R3, #0]
;stm32f10x_can.c,1359 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f10x_can.c,1360 :: 		case CAN_IT_LEC:
L_CAN_ClearITPendingBit194:
;stm32f10x_can.c,1362 :: 		CANx->ESR = RESET;
; CANx start address is: 0 (R0)
ADDW	R3, R0, #24
MOVS	R2, #0
STR	R2, [R3, #0]
;stm32f10x_can.c,1364 :: 		CANx->MSR = CAN_MSR_ERRI;
ADDS	R3, R0, #4
; CANx end address is: 0 (R0)
MOVW	R2, #4
STR	R2, [R3, #0]
;stm32f10x_can.c,1365 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f10x_can.c,1366 :: 		case CAN_IT_ERR:
L_CAN_ClearITPendingBit195:
;stm32f10x_can.c,1368 :: 		CANx->ESR = RESET;
; CANx start address is: 0 (R0)
ADDW	R3, R0, #24
MOVS	R2, #0
STR	R2, [R3, #0]
;stm32f10x_can.c,1370 :: 		CANx->MSR = CAN_MSR_ERRI;
ADDS	R3, R0, #4
; CANx end address is: 0 (R0)
MOVW	R2, #4
STR	R2, [R3, #0]
;stm32f10x_can.c,1373 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f10x_can.c,1374 :: 		default :
L_CAN_ClearITPendingBit196:
;stm32f10x_can.c,1375 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f10x_can.c,1376 :: 		}
L_CAN_ClearITPendingBit182:
; CAN_IT start address is: 4 (R1)
; CANx start address is: 0 (R0)
CMP	R1, #1
IT	EQ
BEQ	L_CAN_ClearITPendingBit184
CMP	R1, #4
IT	EQ
BEQ	L_CAN_ClearITPendingBit185
CMP	R1, #8
IT	EQ
BEQ	L_CAN_ClearITPendingBit186
CMP	R1, #32
IT	EQ
BEQ	L_CAN_ClearITPendingBit187
CMP	R1, #64
IT	EQ
BEQ	L_CAN_ClearITPendingBit188
CMP	R1, #65536
IT	EQ
BEQ	L_CAN_ClearITPendingBit189
CMP	R1, #131072
IT	EQ
BEQ	L_CAN_ClearITPendingBit190
CMP	R1, #256
IT	EQ
BEQ	L_CAN_ClearITPendingBit191
CMP	R1, #512
IT	EQ
BEQ	L_CAN_ClearITPendingBit192
CMP	R1, #1024
IT	EQ
BEQ	L_CAN_ClearITPendingBit193
CMP	R1, #2048
IT	EQ
BEQ	L_CAN_ClearITPendingBit194
CMP	R1, #32768
IT	EQ
BEQ	L_CAN_ClearITPendingBit195
; CANx end address is: 0 (R0)
; CAN_IT end address is: 4 (R1)
IT	AL
BAL	L_CAN_ClearITPendingBit196
L_CAN_ClearITPendingBit183:
;stm32f10x_can.c,1377 :: 		}
L_end_CAN_ClearITPendingBit:
BX	LR
; end of _CAN_ClearITPendingBit
stm32f10x_can_CheckITStatus:
;stm32f10x_can.c,1385 :: 		static ITStatus CheckITStatus(uint32_t CAN_Reg, uint32_t It_Bit)
; It_Bit start address is: 4 (R1)
; CAN_Reg start address is: 0 (R0)
; It_Bit end address is: 4 (R1)
; CAN_Reg end address is: 0 (R0)
; CAN_Reg start address is: 0 (R0)
; It_Bit start address is: 4 (R1)
;stm32f10x_can.c,1387 :: 		ITStatus pendingbitstatus = RESET;
;stm32f10x_can.c,1389 :: 		if ((CAN_Reg & It_Bit) != (uint32_t)RESET)
AND	R2, R0, R1, LSL #0
; CAN_Reg end address is: 0 (R0)
; It_Bit end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_stm32f10x_can_CheckITStatus197
;stm32f10x_can.c,1392 :: 		pendingbitstatus = SET;
; pendingbitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_can.c,1393 :: 		}
; pendingbitstatus end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_can_CheckITStatus198
L_stm32f10x_can_CheckITStatus197:
;stm32f10x_can.c,1397 :: 		pendingbitstatus = RESET;
; pendingbitstatus start address is: 0 (R0)
MOVS	R0, #0
; pendingbitstatus end address is: 0 (R0)
;stm32f10x_can.c,1398 :: 		}
L_stm32f10x_can_CheckITStatus198:
;stm32f10x_can.c,1399 :: 		return pendingbitstatus;
; pendingbitstatus start address is: 0 (R0)
; pendingbitstatus end address is: 0 (R0)
;stm32f10x_can.c,1400 :: 		}
L_end_CheckITStatus:
BX	LR
; end of stm32f10x_can_CheckITStatus
