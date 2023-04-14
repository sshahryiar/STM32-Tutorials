misc_NVIC_SetPriorityGrouping:
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
; end of misc_NVIC_SetPriorityGrouping
misc_NVIC_GetPriorityGrouping:
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
; end of misc_NVIC_GetPriorityGrouping
misc_NVIC_EnableIRQ:
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
; end of misc_NVIC_EnableIRQ
misc_NVIC_DisableIRQ:
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
; end of misc_NVIC_DisableIRQ
misc_NVIC_GetPendingIRQ:
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
BEQ	L_misc_NVIC_GetPendingIRQ0
; ?FLOC__misc_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__misc_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
IT	AL
BAL	L_misc_NVIC_GetPendingIRQ1
L_misc_NVIC_GetPendingIRQ0:
; ?FLOC__misc_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__misc_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
L_misc_NVIC_GetPendingIRQ1:
; ?FLOC__misc_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__misc_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1593 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of misc_NVIC_GetPendingIRQ
misc_NVIC_SetPendingIRQ:
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
; end of misc_NVIC_SetPendingIRQ
misc_NVIC_ClearPendingIRQ:
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
; end of misc_NVIC_ClearPendingIRQ
misc_NVIC_GetActive:
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
BEQ	L_misc_NVIC_GetActive2
; ?FLOC__misc_NVIC_GetActive?T72 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__misc_NVIC_GetActive?T72 end address is: 0 (R0)
IT	AL
BAL	L_misc_NVIC_GetActive3
L_misc_NVIC_GetActive2:
; ?FLOC__misc_NVIC_GetActive?T72 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__misc_NVIC_GetActive?T72 end address is: 0 (R0)
L_misc_NVIC_GetActive3:
; ?FLOC__misc_NVIC_GetActive?T72 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__misc_NVIC_GetActive?T72 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1633 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of misc_NVIC_GetActive
misc_NVIC_SetPriority:
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
BGE	L_misc_NVIC_SetPriority4
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
BAL	L_misc_NVIC_SetPriority5
L_misc_NVIC_SetPriority4:
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
L_misc_NVIC_SetPriority5:
;core_cm3.h,1653 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of misc_NVIC_SetPriority
misc_NVIC_GetPriority:
;core_cm3.h,1670 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1673 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_misc_NVIC_GetPriority6
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
L_misc_NVIC_GetPriority6:
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
; end of misc_NVIC_GetPriority
misc_NVIC_EncodePriority:
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
BLS	L_misc_NVIC_EncodePriority8
; ?FLOC__misc_NVIC_EncodePriority?T112 start address is: 12 (R3)
MOVW	R3, #4
; ?FLOC__misc_NVIC_EncodePriority?T112 end address is: 12 (R3)
IT	AL
BAL	L_misc_NVIC_EncodePriority9
L_misc_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__misc_NVIC_EncodePriority?T112 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__misc_NVIC_EncodePriority?T112 end address is: 0 (R0)
MOV	R3, R0
L_misc_NVIC_EncodePriority9:
; ?FLOC__misc_NVIC_EncodePriority?T112 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__misc_NVIC_EncodePriority?T112 end address is: 12 (R3)
;core_cm3.h,1702 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_misc_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__misc_NVIC_EncodePriority?T116 start address is: 20 (R5)
MOVW	R5, #0
; ?FLOC__misc_NVIC_EncodePriority?T116 end address is: 20 (R5)
IT	AL
BAL	L_misc_NVIC_EncodePriority11
L_misc_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__misc_NVIC_EncodePriority?T116 start address is: 20 (R5)
; ?FLOC__misc_NVIC_EncodePriority?T116 end address is: 20 (R5)
L_misc_NVIC_EncodePriority11:
;core_cm3.h,1705 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__misc_NVIC_EncodePriority?T116 start address is: 20 (R5)
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
; ?FLOC__misc_NVIC_EncodePriority?T116 end address is: 20 (R5)
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
; end of misc_NVIC_EncodePriority
misc_NVIC_DecodePriority:
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
BLS	L_misc_NVIC_DecodePriority12
; ?FLOC__misc_NVIC_DecodePriority?T130 start address is: 16 (R4)
MOVW	R4, #4
; ?FLOC__misc_NVIC_DecodePriority?T130 end address is: 16 (R4)
IT	AL
BAL	L_misc_NVIC_DecodePriority13
L_misc_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__misc_NVIC_DecodePriority?T130 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__misc_NVIC_DecodePriority?T130 end address is: 4 (R1)
MOV	R4, R1
L_misc_NVIC_DecodePriority13:
; ?FLOC__misc_NVIC_DecodePriority?T130 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__misc_NVIC_DecodePriority?T130 end address is: 16 (R4)
;core_cm3.h,1733 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_misc_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__misc_NVIC_DecodePriority?T134 start address is: 16 (R4)
MOVW	R4, #0
; ?FLOC__misc_NVIC_DecodePriority?T134 end address is: 16 (R4)
IT	AL
BAL	L_misc_NVIC_DecodePriority15
L_misc_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__misc_NVIC_DecodePriority?T134 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__misc_NVIC_DecodePriority?T134 end address is: 20 (R5)
MOV	R4, R5
L_misc_NVIC_DecodePriority15:
; ?FLOC__misc_NVIC_DecodePriority?T134 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm3.h,1735 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__misc_NVIC_DecodePriority?T134 end address is: 16 (R4)
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
; end of misc_NVIC_DecodePriority
misc_SysTick_Config:
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
BLS	L_misc_SysTick_Config16
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_misc_SysTick_Config16:
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
BL	misc_NVIC_SetPriority+0
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
; end of misc_SysTick_Config
misc_NVIC_SystemReset:
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
L_misc_NVIC_SystemReset17:
IT	AL
BAL	L_misc_NVIC_SystemReset17
;core_cm3.h,1787 :: 		}
L_end_NVIC_SystemReset:
BX	LR
; end of misc_NVIC_SystemReset
misc_ITM_SendChar:
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
BEQ	L_misc_ITM_SendChar37
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_misc_ITM_SendChar38
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_misc_ITM_SendChar39
L_misc_ITM_SendChar33:
;core_cm3.h,1823 :: 		while (ITM->PORT[0].u32 == 0);
L_misc_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_misc_ITM_SendChar23
IT	AL
BAL	L_misc_ITM_SendChar22
L_misc_ITM_SendChar23:
;core_cm3.h,1824 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm3.h,1820 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_misc_ITM_SendChar36
L_misc_ITM_SendChar37:
L_misc_ITM_SendChar36:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_misc_ITM_SendChar35
L_misc_ITM_SendChar38:
L_misc_ITM_SendChar35:
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_misc_ITM_SendChar34
L_misc_ITM_SendChar39:
L_misc_ITM_SendChar34:
;core_cm3.h,1826 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm3.h,1827 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of misc_ITM_SendChar
misc_ITM_ReceiveChar:
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
BEQ	L_misc_ITM_ReceiveChar24
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
L_misc_ITM_ReceiveChar24:
;core_cm3.h,1847 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm3.h,1848 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of misc_ITM_ReceiveChar
misc_ITM_CheckChar:
;core_cm3.h,1859 :: 		static __INLINE int ITM_CheckChar (void) {
;core_cm3.h,1861 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_misc_ITM_CheckChar25
;core_cm3.h,1862 :: 		return (0);                                 /* no character available */
MOVW	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm3.h,1863 :: 		} else {
L_misc_ITM_CheckChar25:
;core_cm3.h,1864 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm3.h,1866 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of misc_ITM_CheckChar
_NVIC_PriorityGroupConfig:
;misc.c,97 :: 		void NVIC_PriorityGroupConfig(uint32_t NVIC_PriorityGroup)
; NVIC_PriorityGroup start address is: 0 (R0)
; NVIC_PriorityGroup end address is: 0 (R0)
; NVIC_PriorityGroup start address is: 0 (R0)
;misc.c,103 :: 		SCB->AIRCR = AIRCR_VECTKEY_MASK | NVIC_PriorityGroup;
MOVW	R1, #0
MOVT	R1, #1530
ORR	R2, R1, R0, LSL #0
; NVIC_PriorityGroup end address is: 0 (R0)
MOVW	R1, #60684
MOVT	R1, #57344
STR	R2, [R1, #0]
;misc.c,104 :: 		}
L_end_NVIC_PriorityGroupConfig:
BX	LR
; end of _NVIC_PriorityGroupConfig
_NVIC_Init:
;misc.c,113 :: 		void NVIC_Init(NVIC_InitTypeDef* NVIC_InitStruct)
; NVIC_InitStruct start address is: 0 (R0)
; NVIC_InitStruct end address is: 0 (R0)
; NVIC_InitStruct start address is: 0 (R0)
;misc.c,115 :: 		uint32_t tmppriority = 0x00, tmppre = 0x00, tmpsub = 0x0F;
; tmpsub start address is: 16 (R4)
MOV	R4, #15
;misc.c,122 :: 		if (NVIC_InitStruct->NVIC_IRQChannelCmd != DISABLE)
ADDS	R1, R0, #3
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_NVIC_Init27
;misc.c,125 :: 		tmppriority = (0x700 - ((SCB->AIRCR) & (uint32_t)0x700))>> 0x08;
MOVW	R1, #60684
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1792
RSB	R1, R1, #1792
LSRS	R1, R1, #8
;misc.c,126 :: 		tmppre = (0x4 - tmppriority);
RSB	R2, R1, #4
;misc.c,127 :: 		tmpsub = tmpsub >> tmppriority;
LSR	R3, R4, R1
; tmpsub end address is: 16 (R4)
;misc.c,129 :: 		tmppriority = (uint32_t)NVIC_InitStruct->NVIC_IRQChannelPreemptionPriority << tmppre;
ADDS	R1, R0, #1
LDRB	R1, [R1, #0]
LSL	R2, R1, R2
;misc.c,130 :: 		tmppriority |=  NVIC_InitStruct->NVIC_IRQChannelSubPriority & tmpsub;
ADDS	R1, R0, #2
LDRB	R1, [R1, #0]
ANDS	R1, R3
ORR	R1, R2, R1, LSL #0
;misc.c,131 :: 		tmppriority = tmppriority << 0x04;
LSLS	R3, R1, #4
;misc.c,133 :: 		NVIC->IP[NVIC_InitStruct->NVIC_IRQChannel] = tmppriority;
LDRB	R2, [R0, #0]
MOVW	R1, #58368
MOVT	R1, #57344
ADDS	R1, R1, R2
STRB	R3, [R1, #0]
;misc.c,136 :: 		NVIC->ISER[NVIC_InitStruct->NVIC_IRQChannel >> 0x05] =
LDRB	R4, [R0, #0]
; NVIC_InitStruct end address is: 0 (R0)
LSRS	R1, R4, #5
UXTB	R1, R1
LSLS	R2, R1, #2
MOVW	R1, #57600
MOVT	R1, #57344
ADDS	R3, R1, R2
;misc.c,137 :: 		(uint32_t)0x01 << (NVIC_InitStruct->NVIC_IRQChannel & (uint8_t)0x1F);
AND	R2, R4, #31
UXTB	R2, R2
MOV	R1, #1
LSLS	R1, R2
STR	R1, [R3, #0]
;misc.c,138 :: 		}
IT	AL
BAL	L_NVIC_Init28
L_NVIC_Init27:
;misc.c,142 :: 		NVIC->ICER[NVIC_InitStruct->NVIC_IRQChannel >> 0x05] =
; NVIC_InitStruct start address is: 0 (R0)
LDRB	R4, [R0, #0]
; NVIC_InitStruct end address is: 0 (R0)
LSRS	R1, R4, #5
UXTB	R1, R1
LSLS	R2, R1, #2
MOVW	R1, #57728
MOVT	R1, #57344
ADDS	R3, R1, R2
;misc.c,143 :: 		(uint32_t)0x01 << (NVIC_InitStruct->NVIC_IRQChannel & (uint8_t)0x1F);
AND	R2, R4, #31
UXTB	R2, R2
MOV	R1, #1
LSLS	R1, R2
STR	R1, [R3, #0]
;misc.c,144 :: 		}
L_NVIC_Init28:
;misc.c,145 :: 		}
L_end_NVIC_Init:
BX	LR
; end of _NVIC_Init
_NVIC_SetVectorTable:
;misc.c,157 :: 		void NVIC_SetVectorTable(uint32_t NVIC_VectTab, uint32_t Offset)
; Offset start address is: 4 (R1)
; NVIC_VectTab start address is: 0 (R0)
; Offset end address is: 4 (R1)
; NVIC_VectTab end address is: 0 (R0)
; NVIC_VectTab start address is: 0 (R0)
; Offset start address is: 4 (R1)
;misc.c,163 :: 		SCB->VTOR = NVIC_VectTab | (Offset & (uint32_t)0x1FFFFF80);
MOVW	R2, #65408
MOVT	R2, #8191
AND	R2, R1, R2, LSL #0
; Offset end address is: 4 (R1)
ORR	R3, R0, R2, LSL #0
; NVIC_VectTab end address is: 0 (R0)
MOVW	R2, #60680
MOVT	R2, #57344
STR	R3, [R2, #0]
;misc.c,164 :: 		}
L_end_NVIC_SetVectorTable:
BX	LR
; end of _NVIC_SetVectorTable
_NVIC_SystemLPConfig:
;misc.c,176 :: 		void NVIC_SystemLPConfig(uint8_t LowPowerMode, FunctionalState NewState)
; NewState start address is: 4 (R1)
; LowPowerMode start address is: 0 (R0)
; NewState end address is: 4 (R1)
; LowPowerMode end address is: 0 (R0)
; LowPowerMode start address is: 0 (R0)
; NewState start address is: 4 (R1)
;misc.c,182 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_NVIC_SystemLPConfig29
; NewState end address is: 4 (R1)
;misc.c,184 :: 		SCB->SCR |= LowPowerMode;
MOVW	R3, #60688
MOVT	R3, #57344
LDR	R2, [R3, #0]
ORRS	R2, R0
; LowPowerMode end address is: 0 (R0)
STR	R2, [R3, #0]
;misc.c,185 :: 		}
IT	AL
BAL	L_NVIC_SystemLPConfig30
L_NVIC_SystemLPConfig29:
;misc.c,188 :: 		SCB->SCR &= (uint32_t)(~(uint32_t)LowPowerMode);
; LowPowerMode start address is: 0 (R0)
UXTB	R2, R0
; LowPowerMode end address is: 0 (R0)
MVN	R4, R2
MOVW	R3, #60688
MOVT	R3, #57344
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;misc.c,189 :: 		}
L_NVIC_SystemLPConfig30:
;misc.c,190 :: 		}
L_end_NVIC_SystemLPConfig:
BX	LR
; end of _NVIC_SystemLPConfig
_SysTick_CLKSourceConfig:
;misc.c,200 :: 		void SysTick_CLKSourceConfig(uint32_t SysTick_CLKSource)
; SysTick_CLKSource start address is: 0 (R0)
; SysTick_CLKSource end address is: 0 (R0)
; SysTick_CLKSource start address is: 0 (R0)
;misc.c,204 :: 		if (SysTick_CLKSource == SysTick_CLKSource_HCLK)
CMP	R0, #4
IT	NE
BNE	L_SysTick_CLKSourceConfig31
; SysTick_CLKSource end address is: 0 (R0)
;misc.c,206 :: 		SysTick->CTRL |= SysTick_CLKSource_HCLK;
MOVW	R2, #57360
MOVT	R2, #57344
LDR	R1, [R2, #0]
ORR	R1, R1, #4
STR	R1, [R2, #0]
;misc.c,207 :: 		}
IT	AL
BAL	L_SysTick_CLKSourceConfig32
L_SysTick_CLKSourceConfig31:
;misc.c,210 :: 		SysTick->CTRL &= SysTick_CLKSource_HCLK_Div8;
MOVW	R3, #57360
MOVT	R3, #57344
LDR	R2, [R3, #0]
MVN	R1, #4
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;misc.c,211 :: 		}
L_SysTick_CLKSourceConfig32:
;misc.c,212 :: 		}
L_end_SysTick_CLKSourceConfig:
BX	LR
; end of _SysTick_CLKSourceConfig
