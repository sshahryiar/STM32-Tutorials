stm32f10x_fsmc_NVIC_SetPriorityGrouping:
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
; end of stm32f10x_fsmc_NVIC_SetPriorityGrouping
stm32f10x_fsmc_NVIC_GetPriorityGrouping:
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
; end of stm32f10x_fsmc_NVIC_GetPriorityGrouping
stm32f10x_fsmc_NVIC_EnableIRQ:
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
; end of stm32f10x_fsmc_NVIC_EnableIRQ
stm32f10x_fsmc_NVIC_DisableIRQ:
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
; end of stm32f10x_fsmc_NVIC_DisableIRQ
stm32f10x_fsmc_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f10x_fsmc_NVIC_GetPendingIRQ0
; ?FLOC__stm32f10x_fsmc_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_fsmc_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_fsmc_NVIC_GetPendingIRQ1
L_stm32f10x_fsmc_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f10x_fsmc_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_fsmc_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
L_stm32f10x_fsmc_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f10x_fsmc_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_fsmc_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1593 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f10x_fsmc_NVIC_GetPendingIRQ
stm32f10x_fsmc_NVIC_SetPendingIRQ:
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
; end of stm32f10x_fsmc_NVIC_SetPendingIRQ
stm32f10x_fsmc_NVIC_ClearPendingIRQ:
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
; end of stm32f10x_fsmc_NVIC_ClearPendingIRQ
stm32f10x_fsmc_NVIC_GetActive:
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
BEQ	L_stm32f10x_fsmc_NVIC_GetActive2
; ?FLOC__stm32f10x_fsmc_NVIC_GetActive?T72 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_fsmc_NVIC_GetActive?T72 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_fsmc_NVIC_GetActive3
L_stm32f10x_fsmc_NVIC_GetActive2:
; ?FLOC__stm32f10x_fsmc_NVIC_GetActive?T72 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_fsmc_NVIC_GetActive?T72 end address is: 0 (R0)
L_stm32f10x_fsmc_NVIC_GetActive3:
; ?FLOC__stm32f10x_fsmc_NVIC_GetActive?T72 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_fsmc_NVIC_GetActive?T72 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1633 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f10x_fsmc_NVIC_GetActive
stm32f10x_fsmc_NVIC_SetPriority:
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
BGE	L_stm32f10x_fsmc_NVIC_SetPriority4
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
BAL	L_stm32f10x_fsmc_NVIC_SetPriority5
L_stm32f10x_fsmc_NVIC_SetPriority4:
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
L_stm32f10x_fsmc_NVIC_SetPriority5:
;core_cm3.h,1653 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f10x_fsmc_NVIC_SetPriority
stm32f10x_fsmc_NVIC_GetPriority:
;core_cm3.h,1670 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1673 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f10x_fsmc_NVIC_GetPriority6
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
L_stm32f10x_fsmc_NVIC_GetPriority6:
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
; end of stm32f10x_fsmc_NVIC_GetPriority
stm32f10x_fsmc_NVIC_EncodePriority:
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
BLS	L_stm32f10x_fsmc_NVIC_EncodePriority8
; ?FLOC__stm32f10x_fsmc_NVIC_EncodePriority?T112 start address is: 12 (R3)
MOVW	R3, #4
; ?FLOC__stm32f10x_fsmc_NVIC_EncodePriority?T112 end address is: 12 (R3)
IT	AL
BAL	L_stm32f10x_fsmc_NVIC_EncodePriority9
L_stm32f10x_fsmc_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f10x_fsmc_NVIC_EncodePriority?T112 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_fsmc_NVIC_EncodePriority?T112 end address is: 0 (R0)
MOV	R3, R0
L_stm32f10x_fsmc_NVIC_EncodePriority9:
; ?FLOC__stm32f10x_fsmc_NVIC_EncodePriority?T112 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_fsmc_NVIC_EncodePriority?T112 end address is: 12 (R3)
;core_cm3.h,1702 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f10x_fsmc_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f10x_fsmc_NVIC_EncodePriority?T116 start address is: 20 (R5)
MOVW	R5, #0
; ?FLOC__stm32f10x_fsmc_NVIC_EncodePriority?T116 end address is: 20 (R5)
IT	AL
BAL	L_stm32f10x_fsmc_NVIC_EncodePriority11
L_stm32f10x_fsmc_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f10x_fsmc_NVIC_EncodePriority?T116 start address is: 20 (R5)
; ?FLOC__stm32f10x_fsmc_NVIC_EncodePriority?T116 end address is: 20 (R5)
L_stm32f10x_fsmc_NVIC_EncodePriority11:
;core_cm3.h,1705 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f10x_fsmc_NVIC_EncodePriority?T116 start address is: 20 (R5)
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
; ?FLOC__stm32f10x_fsmc_NVIC_EncodePriority?T116 end address is: 20 (R5)
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
; end of stm32f10x_fsmc_NVIC_EncodePriority
stm32f10x_fsmc_NVIC_DecodePriority:
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
BLS	L_stm32f10x_fsmc_NVIC_DecodePriority12
; ?FLOC__stm32f10x_fsmc_NVIC_DecodePriority?T130 start address is: 16 (R4)
MOVW	R4, #4
; ?FLOC__stm32f10x_fsmc_NVIC_DecodePriority?T130 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_fsmc_NVIC_DecodePriority13
L_stm32f10x_fsmc_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f10x_fsmc_NVIC_DecodePriority?T130 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_fsmc_NVIC_DecodePriority?T130 end address is: 4 (R1)
MOV	R4, R1
L_stm32f10x_fsmc_NVIC_DecodePriority13:
; ?FLOC__stm32f10x_fsmc_NVIC_DecodePriority?T130 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_fsmc_NVIC_DecodePriority?T130 end address is: 16 (R4)
;core_cm3.h,1733 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f10x_fsmc_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f10x_fsmc_NVIC_DecodePriority?T134 start address is: 16 (R4)
MOVW	R4, #0
; ?FLOC__stm32f10x_fsmc_NVIC_DecodePriority?T134 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_fsmc_NVIC_DecodePriority15
L_stm32f10x_fsmc_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f10x_fsmc_NVIC_DecodePriority?T134 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f10x_fsmc_NVIC_DecodePriority?T134 end address is: 20 (R5)
MOV	R4, R5
L_stm32f10x_fsmc_NVIC_DecodePriority15:
; ?FLOC__stm32f10x_fsmc_NVIC_DecodePriority?T134 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm3.h,1735 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f10x_fsmc_NVIC_DecodePriority?T134 end address is: 16 (R4)
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
; end of stm32f10x_fsmc_NVIC_DecodePriority
stm32f10x_fsmc_SysTick_Config:
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
BLS	L_stm32f10x_fsmc_SysTick_Config16
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f10x_fsmc_SysTick_Config16:
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
BL	stm32f10x_fsmc_NVIC_SetPriority+0
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
; end of stm32f10x_fsmc_SysTick_Config
stm32f10x_fsmc_NVIC_SystemReset:
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
L_stm32f10x_fsmc_NVIC_SystemReset17:
IT	AL
BAL	L_stm32f10x_fsmc_NVIC_SystemReset17
;core_cm3.h,1787 :: 		}
L_end_NVIC_SystemReset:
BX	LR
; end of stm32f10x_fsmc_NVIC_SystemReset
stm32f10x_fsmc_ITM_SendChar:
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
BEQ	L_stm32f10x_fsmc_ITM_SendChar90
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_fsmc_ITM_SendChar91
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_fsmc_ITM_SendChar92
L_stm32f10x_fsmc_ITM_SendChar86:
;core_cm3.h,1823 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f10x_fsmc_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f10x_fsmc_ITM_SendChar23
IT	AL
BAL	L_stm32f10x_fsmc_ITM_SendChar22
L_stm32f10x_fsmc_ITM_SendChar23:
;core_cm3.h,1824 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm3.h,1820 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f10x_fsmc_ITM_SendChar89
L_stm32f10x_fsmc_ITM_SendChar90:
L_stm32f10x_fsmc_ITM_SendChar89:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_fsmc_ITM_SendChar88
L_stm32f10x_fsmc_ITM_SendChar91:
L_stm32f10x_fsmc_ITM_SendChar88:
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_fsmc_ITM_SendChar87
L_stm32f10x_fsmc_ITM_SendChar92:
L_stm32f10x_fsmc_ITM_SendChar87:
;core_cm3.h,1826 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm3.h,1827 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f10x_fsmc_ITM_SendChar
stm32f10x_fsmc_ITM_ReceiveChar:
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
BEQ	L_stm32f10x_fsmc_ITM_ReceiveChar24
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
L_stm32f10x_fsmc_ITM_ReceiveChar24:
;core_cm3.h,1847 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm3.h,1848 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f10x_fsmc_ITM_ReceiveChar
stm32f10x_fsmc_ITM_CheckChar:
;core_cm3.h,1859 :: 		static __INLINE int ITM_CheckChar (void) {
;core_cm3.h,1861 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f10x_fsmc_ITM_CheckChar25
;core_cm3.h,1862 :: 		return (0);                                 /* no character available */
MOVW	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm3.h,1863 :: 		} else {
L_stm32f10x_fsmc_ITM_CheckChar25:
;core_cm3.h,1864 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm3.h,1866 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f10x_fsmc_ITM_CheckChar
_FSMC_NORSRAMDeInit:
;stm32f10x_fsmc.c,102 :: 		void FSMC_NORSRAMDeInit(uint32_t FSMC_Bank)
; FSMC_Bank start address is: 0 (R0)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
;stm32f10x_fsmc.c,108 :: 		if(FSMC_Bank == FSMC_Bank1_NORSRAM1)
CMP	R0, #0
IT	NE
BNE	L_FSMC_NORSRAMDeInit27
;stm32f10x_fsmc.c,110 :: 		FSMC_Bank1->BTCR[FSMC_Bank] = 0x000030DB;
LSLS	R2, R0, #2
MOVW	R1, #0
MOVT	R1, #40960
ADDS	R2, R1, R2
MOVW	R1, #12507
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,111 :: 		}
IT	AL
BAL	L_FSMC_NORSRAMDeInit28
L_FSMC_NORSRAMDeInit27:
;stm32f10x_fsmc.c,115 :: 		FSMC_Bank1->BTCR[FSMC_Bank] = 0x000030D2;
LSLS	R2, R0, #2
MOVW	R1, #0
MOVT	R1, #40960
ADDS	R2, R1, R2
MOVW	R1, #12498
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,116 :: 		}
L_FSMC_NORSRAMDeInit28:
;stm32f10x_fsmc.c,117 :: 		FSMC_Bank1->BTCR[FSMC_Bank + 1] = 0x0FFFFFFF;
ADDS	R1, R0, #1
LSLS	R2, R1, #2
MOVW	R1, #0
MOVT	R1, #40960
ADDS	R2, R1, R2
MVN	R1, #-268435456
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,118 :: 		FSMC_Bank1E->BWTR[FSMC_Bank] = 0x0FFFFFFF;
LSLS	R2, R0, #2
; FSMC_Bank end address is: 0 (R0)
MOVW	R1, #260
MOVT	R1, #40960
ADDS	R2, R1, R2
MVN	R1, #-268435456
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,119 :: 		}
L_end_FSMC_NORSRAMDeInit:
BX	LR
; end of _FSMC_NORSRAMDeInit
_FSMC_NANDDeInit:
;stm32f10x_fsmc.c,129 :: 		void FSMC_NANDDeInit(uint32_t FSMC_Bank)
; FSMC_Bank start address is: 0 (R0)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
;stm32f10x_fsmc.c,134 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
CMP	R0, #16
IT	NE
BNE	L_FSMC_NANDDeInit29
; FSMC_Bank end address is: 0 (R0)
;stm32f10x_fsmc.c,137 :: 		FSMC_Bank2->PCR2 = 0x00000018;
MOVW	R2, #24
MOVW	R1, #96
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f10x_fsmc.c,138 :: 		FSMC_Bank2->SR2 = 0x00000040;
MOVW	R2, #64
MOVW	R1, #100
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f10x_fsmc.c,139 :: 		FSMC_Bank2->PMEM2 = 0xFCFCFCFC;
MOV	R2, #-50529028
MOVW	R1, #104
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f10x_fsmc.c,140 :: 		FSMC_Bank2->PATT2 = 0xFCFCFCFC;
MOV	R2, #-50529028
MOVW	R1, #108
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f10x_fsmc.c,141 :: 		}
IT	AL
BAL	L_FSMC_NANDDeInit30
L_FSMC_NANDDeInit29:
;stm32f10x_fsmc.c,146 :: 		FSMC_Bank3->PCR3 = 0x00000018;
MOVW	R2, #24
MOVW	R1, #128
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f10x_fsmc.c,147 :: 		FSMC_Bank3->SR3 = 0x00000040;
MOVW	R2, #64
MOVW	R1, #132
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f10x_fsmc.c,148 :: 		FSMC_Bank3->PMEM3 = 0xFCFCFCFC;
MOV	R2, #-50529028
MOVW	R1, #136
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f10x_fsmc.c,149 :: 		FSMC_Bank3->PATT3 = 0xFCFCFCFC;
MOV	R2, #-50529028
MOVW	R1, #140
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f10x_fsmc.c,150 :: 		}
L_FSMC_NANDDeInit30:
;stm32f10x_fsmc.c,151 :: 		}
L_end_FSMC_NANDDeInit:
BX	LR
; end of _FSMC_NANDDeInit
_FSMC_PCCARDDeInit:
;stm32f10x_fsmc.c,158 :: 		void FSMC_PCCARDDeInit(void)
;stm32f10x_fsmc.c,161 :: 		FSMC_Bank4->PCR4 = 0x00000018;
MOVW	R1, #24
MOVW	R0, #160
MOVT	R0, #40960
STR	R1, [R0, #0]
;stm32f10x_fsmc.c,162 :: 		FSMC_Bank4->SR4 = 0x00000000;
MOVW	R1, #0
MOVW	R0, #164
MOVT	R0, #40960
STR	R1, [R0, #0]
;stm32f10x_fsmc.c,163 :: 		FSMC_Bank4->PMEM4 = 0xFCFCFCFC;
MOV	R1, #-50529028
MOVW	R0, #168
MOVT	R0, #40960
STR	R1, [R0, #0]
;stm32f10x_fsmc.c,164 :: 		FSMC_Bank4->PATT4 = 0xFCFCFCFC;
MOV	R1, #-50529028
MOVW	R0, #172
MOVT	R0, #40960
STR	R1, [R0, #0]
;stm32f10x_fsmc.c,165 :: 		FSMC_Bank4->PIO4 = 0xFCFCFCFC;
MOV	R1, #-50529028
MOVW	R0, #176
MOVT	R0, #40960
STR	R1, [R0, #0]
;stm32f10x_fsmc.c,166 :: 		}
L_end_FSMC_PCCARDDeInit:
BX	LR
; end of _FSMC_PCCARDDeInit
_FSMC_NORSRAMInit:
;stm32f10x_fsmc.c,176 :: 		void FSMC_NORSRAMInit(FSMC_NORSRAMInitTypeDef* FSMC_NORSRAMInitStruct)
; FSMC_NORSRAMInitStruct start address is: 0 (R0)
; FSMC_NORSRAMInitStruct end address is: 0 (R0)
; FSMC_NORSRAMInitStruct start address is: 0 (R0)
;stm32f10x_fsmc.c,201 :: 		FSMC_Bank1->BTCR[FSMC_NORSRAMInitStruct->FSMC_Bank] =
LDR	R1, [R0, #0]
LSLS	R2, R1, #2
MOVW	R1, #0
MOVT	R1, #40960
ADDS	R3, R1, R2
;stm32f10x_fsmc.c,202 :: 		(uint32_t)FSMC_NORSRAMInitStruct->FSMC_DataAddressMux |
ADDS	R1, R0, #4
LDR	R2, [R1, #0]
;stm32f10x_fsmc.c,203 :: 		FSMC_NORSRAMInitStruct->FSMC_MemoryType |
ADDW	R1, R0, #8
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f10x_fsmc.c,204 :: 		FSMC_NORSRAMInitStruct->FSMC_MemoryDataWidth |
ADDW	R1, R0, #12
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f10x_fsmc.c,205 :: 		FSMC_NORSRAMInitStruct->FSMC_BurstAccessMode |
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f10x_fsmc.c,206 :: 		FSMC_NORSRAMInitStruct->FSMC_AsynchronousWait |
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f10x_fsmc.c,207 :: 		FSMC_NORSRAMInitStruct->FSMC_WaitSignalPolarity |
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f10x_fsmc.c,208 :: 		FSMC_NORSRAMInitStruct->FSMC_WrapMode |
ADDW	R1, R0, #28
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f10x_fsmc.c,209 :: 		FSMC_NORSRAMInitStruct->FSMC_WaitSignalActive |
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f10x_fsmc.c,210 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteOperation |
ADDW	R1, R0, #36
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f10x_fsmc.c,211 :: 		FSMC_NORSRAMInitStruct->FSMC_WaitSignal |
ADDW	R1, R0, #40
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f10x_fsmc.c,212 :: 		FSMC_NORSRAMInitStruct->FSMC_ExtendedMode |
ADDW	R1, R0, #44
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f10x_fsmc.c,213 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteBurst;
ADDW	R1, R0, #48
LDR	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f10x_fsmc.c,215 :: 		if(FSMC_NORSRAMInitStruct->FSMC_MemoryType == FSMC_MemoryType_NOR)
ADDW	R1, R0, #8
LDR	R1, [R1, #0]
CMP	R1, #8
IT	NE
BNE	L_FSMC_NORSRAMInit31
;stm32f10x_fsmc.c,217 :: 		FSMC_Bank1->BTCR[FSMC_NORSRAMInitStruct->FSMC_Bank] |= (uint32_t)BCR_FACCEN_Set;
LDR	R1, [R0, #0]
LSLS	R2, R1, #2
MOVW	R1, #0
MOVT	R1, #40960
ADDS	R2, R1, R2
LDR	R1, [R2, #0]
ORR	R1, R1, #64
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,218 :: 		}
L_FSMC_NORSRAMInit31:
;stm32f10x_fsmc.c,221 :: 		FSMC_Bank1->BTCR[FSMC_NORSRAMInitStruct->FSMC_Bank+1] =
LDR	R1, [R0, #0]
ADDS	R1, R1, #1
LSLS	R2, R1, #2
MOVW	R1, #0
MOVT	R1, #40960
ADDS	R4, R1, R2
;stm32f10x_fsmc.c,222 :: 		(uint32_t)FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_AddressSetupTime |
ADDW	R1, R0, #52
LDR	R3, [R1, #0]
LDR	R2, [R3, #0]
;stm32f10x_fsmc.c,223 :: 		(FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_AddressHoldTime << 4) |
ADDS	R1, R3, #4
LDR	R1, [R1, #0]
LSLS	R1, R1, #4
ORRS	R2, R1
;stm32f10x_fsmc.c,224 :: 		(FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_DataSetupTime << 8) |
ADDW	R1, R3, #8
LDR	R1, [R1, #0]
LSLS	R1, R1, #8
ORRS	R2, R1
;stm32f10x_fsmc.c,225 :: 		(FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_BusTurnAroundDuration << 16) |
ADDW	R1, R3, #12
LDR	R1, [R1, #0]
LSLS	R1, R1, #16
ORRS	R2, R1
;stm32f10x_fsmc.c,226 :: 		(FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_CLKDivision << 20) |
ADDW	R1, R3, #16
LDR	R1, [R1, #0]
LSLS	R1, R1, #20
ORRS	R2, R1
;stm32f10x_fsmc.c,227 :: 		(FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_DataLatency << 24) |
ADDW	R1, R3, #20
LDR	R1, [R1, #0]
LSLS	R1, R1, #24
ORRS	R2, R1
;stm32f10x_fsmc.c,228 :: 		FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_AccessMode;
ADDW	R1, R3, #24
LDR	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
STR	R1, [R4, #0]
;stm32f10x_fsmc.c,232 :: 		if(FSMC_NORSRAMInitStruct->FSMC_ExtendedMode == FSMC_ExtendedMode_Enable)
ADDW	R1, R0, #44
LDR	R1, [R1, #0]
CMP	R1, #16384
IT	NE
BNE	L_FSMC_NORSRAMInit32
;stm32f10x_fsmc.c,240 :: 		FSMC_Bank1E->BWTR[FSMC_NORSRAMInitStruct->FSMC_Bank] =
LDR	R1, [R0, #0]
LSLS	R2, R1, #2
MOVW	R1, #260
MOVT	R1, #40960
ADDS	R4, R1, R2
;stm32f10x_fsmc.c,241 :: 		(uint32_t)FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_AddressSetupTime |
ADDW	R1, R0, #56
; FSMC_NORSRAMInitStruct end address is: 0 (R0)
LDR	R3, [R1, #0]
LDR	R2, [R3, #0]
;stm32f10x_fsmc.c,242 :: 		(FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_AddressHoldTime << 4 )|
ADDS	R1, R3, #4
LDR	R1, [R1, #0]
LSLS	R1, R1, #4
ORRS	R2, R1
;stm32f10x_fsmc.c,243 :: 		(FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_DataSetupTime << 8) |
ADDW	R1, R3, #8
LDR	R1, [R1, #0]
LSLS	R1, R1, #8
ORRS	R2, R1
;stm32f10x_fsmc.c,244 :: 		(FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_CLKDivision << 20) |
ADDW	R1, R3, #16
LDR	R1, [R1, #0]
LSLS	R1, R1, #20
ORRS	R2, R1
;stm32f10x_fsmc.c,245 :: 		(FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_DataLatency << 24) |
ADDW	R1, R3, #20
LDR	R1, [R1, #0]
LSLS	R1, R1, #24
ORRS	R2, R1
;stm32f10x_fsmc.c,246 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_AccessMode;
ADDW	R1, R3, #24
LDR	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
STR	R1, [R4, #0]
;stm32f10x_fsmc.c,247 :: 		}
IT	AL
BAL	L_FSMC_NORSRAMInit33
L_FSMC_NORSRAMInit32:
;stm32f10x_fsmc.c,250 :: 		FSMC_Bank1E->BWTR[FSMC_NORSRAMInitStruct->FSMC_Bank] = 0x0FFFFFFF;
; FSMC_NORSRAMInitStruct start address is: 0 (R0)
LDR	R1, [R0, #0]
; FSMC_NORSRAMInitStruct end address is: 0 (R0)
LSLS	R2, R1, #2
MOVW	R1, #260
MOVT	R1, #40960
ADDS	R2, R1, R2
MVN	R1, #-268435456
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,251 :: 		}
L_FSMC_NORSRAMInit33:
;stm32f10x_fsmc.c,252 :: 		}
L_end_FSMC_NORSRAMInit:
BX	LR
; end of _FSMC_NORSRAMInit
_FSMC_NANDInit:
;stm32f10x_fsmc.c,262 :: 		void FSMC_NANDInit(FSMC_NANDInitTypeDef* FSMC_NANDInitStruct)
; FSMC_NANDInitStruct start address is: 0 (R0)
; FSMC_NANDInitStruct end address is: 0 (R0)
; FSMC_NANDInitStruct start address is: 0 (R0)
;stm32f10x_fsmc.c,264 :: 		uint32_t tmppcr = 0x00000000, tmppmem = 0x00000000, tmppatt = 0x00000000;
;stm32f10x_fsmc.c,284 :: 		tmppcr = (uint32_t)FSMC_NANDInitStruct->FSMC_Waitfeature |
ADDS	R1, R0, #4
LDR	R1, [R1, #0]
;stm32f10x_fsmc.c,285 :: 		PCR_MemoryType_NAND |
ORR	R2, R1, #8
;stm32f10x_fsmc.c,286 :: 		FSMC_NANDInitStruct->FSMC_MemoryDataWidth |
ADDW	R1, R0, #8
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f10x_fsmc.c,287 :: 		FSMC_NANDInitStruct->FSMC_ECC |
ADDW	R1, R0, #12
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f10x_fsmc.c,288 :: 		FSMC_NANDInitStruct->FSMC_ECCPageSize |
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f10x_fsmc.c,289 :: 		(FSMC_NANDInitStruct->FSMC_TCLRSetupTime << 9 )|
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
LSLS	R1, R1, #9
ORRS	R2, R1
;stm32f10x_fsmc.c,290 :: 		(FSMC_NANDInitStruct->FSMC_TARSetupTime << 13);
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
LSLS	R1, R1, #13
ORR	R1, R2, R1, LSL #0
; tmppcr start address is: 16 (R4)
MOV	R4, R1
;stm32f10x_fsmc.c,293 :: 		tmppmem = (uint32_t)FSMC_NANDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_SetupTime |
ADDW	R1, R0, #28
LDR	R3, [R1, #0]
LDR	R2, [R3, #0]
;stm32f10x_fsmc.c,294 :: 		(FSMC_NANDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_WaitSetupTime << 8) |
ADDS	R1, R3, #4
LDR	R1, [R1, #0]
LSLS	R1, R1, #8
ORRS	R2, R1
;stm32f10x_fsmc.c,295 :: 		(FSMC_NANDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_HoldSetupTime << 16)|
ADDW	R1, R3, #8
LDR	R1, [R1, #0]
LSLS	R1, R1, #16
ORRS	R2, R1
;stm32f10x_fsmc.c,296 :: 		(FSMC_NANDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_HiZSetupTime << 24);
ADDW	R1, R3, #12
LDR	R1, [R1, #0]
LSLS	R1, R1, #24
ORR	R1, R2, R1, LSL #0
; tmppmem start address is: 20 (R5)
MOV	R5, R1
;stm32f10x_fsmc.c,299 :: 		tmppatt = (uint32_t)FSMC_NANDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_SetupTime |
ADDW	R1, R0, #32
LDR	R3, [R1, #0]
LDR	R2, [R3, #0]
;stm32f10x_fsmc.c,300 :: 		(FSMC_NANDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_WaitSetupTime << 8) |
ADDS	R1, R3, #4
LDR	R1, [R1, #0]
LSLS	R1, R1, #8
ORRS	R2, R1
;stm32f10x_fsmc.c,301 :: 		(FSMC_NANDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_HoldSetupTime << 16)|
ADDW	R1, R3, #8
LDR	R1, [R1, #0]
LSLS	R1, R1, #16
ORRS	R2, R1
;stm32f10x_fsmc.c,302 :: 		(FSMC_NANDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_HiZSetupTime << 24);
ADDW	R1, R3, #12
LDR	R1, [R1, #0]
LSLS	R1, R1, #24
ORR	R1, R2, R1, LSL #0
; tmppatt start address is: 8 (R2)
MOV	R2, R1
;stm32f10x_fsmc.c,304 :: 		if(FSMC_NANDInitStruct->FSMC_Bank == FSMC_Bank2_NAND)
LDR	R1, [R0, #0]
; FSMC_NANDInitStruct end address is: 0 (R0)
CMP	R1, #16
IT	NE
BNE	L_FSMC_NANDInit34
;stm32f10x_fsmc.c,307 :: 		FSMC_Bank2->PCR2 = tmppcr;
MOVW	R1, #96
MOVT	R1, #40960
STR	R4, [R1, #0]
; tmppcr end address is: 16 (R4)
;stm32f10x_fsmc.c,308 :: 		FSMC_Bank2->PMEM2 = tmppmem;
MOVW	R1, #104
MOVT	R1, #40960
STR	R5, [R1, #0]
; tmppmem end address is: 20 (R5)
;stm32f10x_fsmc.c,309 :: 		FSMC_Bank2->PATT2 = tmppatt;
MOVW	R1, #108
MOVT	R1, #40960
STR	R2, [R1, #0]
; tmppatt end address is: 8 (R2)
;stm32f10x_fsmc.c,310 :: 		}
IT	AL
BAL	L_FSMC_NANDInit35
L_FSMC_NANDInit34:
;stm32f10x_fsmc.c,314 :: 		FSMC_Bank3->PCR3 = tmppcr;
; tmppatt start address is: 8 (R2)
; tmppmem start address is: 20 (R5)
; tmppcr start address is: 16 (R4)
MOVW	R1, #128
MOVT	R1, #40960
STR	R4, [R1, #0]
; tmppcr end address is: 16 (R4)
;stm32f10x_fsmc.c,315 :: 		FSMC_Bank3->PMEM3 = tmppmem;
MOVW	R1, #136
MOVT	R1, #40960
STR	R5, [R1, #0]
; tmppmem end address is: 20 (R5)
;stm32f10x_fsmc.c,316 :: 		FSMC_Bank3->PATT3 = tmppatt;
MOVW	R1, #140
MOVT	R1, #40960
STR	R2, [R1, #0]
; tmppatt end address is: 8 (R2)
;stm32f10x_fsmc.c,317 :: 		}
L_FSMC_NANDInit35:
;stm32f10x_fsmc.c,318 :: 		}
L_end_FSMC_NANDInit:
BX	LR
; end of _FSMC_NANDInit
_FSMC_PCCARDInit:
;stm32f10x_fsmc.c,328 :: 		void FSMC_PCCARDInit(FSMC_PCCARDInitTypeDef* FSMC_PCCARDInitStruct)
; FSMC_PCCARDInitStruct start address is: 0 (R0)
; FSMC_PCCARDInitStruct end address is: 0 (R0)
; FSMC_PCCARDInitStruct start address is: 0 (R0)
;stm32f10x_fsmc.c,350 :: 		FSMC_Bank4->PCR4 = (uint32_t)FSMC_PCCARDInitStruct->FSMC_Waitfeature |
LDR	R1, [R0, #0]
;stm32f10x_fsmc.c,351 :: 		FSMC_MemoryDataWidth_16b |
ORR	R2, R1, #16
;stm32f10x_fsmc.c,352 :: 		(FSMC_PCCARDInitStruct->FSMC_TCLRSetupTime << 9) |
ADDS	R1, R0, #4
LDR	R1, [R1, #0]
LSLS	R1, R1, #9
ORRS	R2, R1
;stm32f10x_fsmc.c,353 :: 		(FSMC_PCCARDInitStruct->FSMC_TARSetupTime << 13);
ADDW	R1, R0, #8
LDR	R1, [R1, #0]
LSLS	R1, R1, #13
ORRS	R2, R1
MOVW	R1, #160
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f10x_fsmc.c,356 :: 		FSMC_Bank4->PMEM4 = (uint32_t)FSMC_PCCARDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_SetupTime |
ADDW	R1, R0, #12
LDR	R3, [R1, #0]
LDR	R2, [R3, #0]
;stm32f10x_fsmc.c,357 :: 		(FSMC_PCCARDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_WaitSetupTime << 8) |
ADDS	R1, R3, #4
LDR	R1, [R1, #0]
LSLS	R1, R1, #8
ORRS	R2, R1
;stm32f10x_fsmc.c,358 :: 		(FSMC_PCCARDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_HoldSetupTime << 16)|
ADDW	R1, R3, #8
LDR	R1, [R1, #0]
LSLS	R1, R1, #16
ORRS	R2, R1
;stm32f10x_fsmc.c,359 :: 		(FSMC_PCCARDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_HiZSetupTime << 24);
ADDW	R1, R3, #12
LDR	R1, [R1, #0]
LSLS	R1, R1, #24
ORRS	R2, R1
MOVW	R1, #168
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f10x_fsmc.c,362 :: 		FSMC_Bank4->PATT4 = (uint32_t)FSMC_PCCARDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_SetupTime |
ADDW	R1, R0, #16
LDR	R3, [R1, #0]
LDR	R2, [R3, #0]
;stm32f10x_fsmc.c,363 :: 		(FSMC_PCCARDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_WaitSetupTime << 8) |
ADDS	R1, R3, #4
LDR	R1, [R1, #0]
LSLS	R1, R1, #8
ORRS	R2, R1
;stm32f10x_fsmc.c,364 :: 		(FSMC_PCCARDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_HoldSetupTime << 16)|
ADDW	R1, R3, #8
LDR	R1, [R1, #0]
LSLS	R1, R1, #16
ORRS	R2, R1
;stm32f10x_fsmc.c,365 :: 		(FSMC_PCCARDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_HiZSetupTime << 24);
ADDW	R1, R3, #12
LDR	R1, [R1, #0]
LSLS	R1, R1, #24
ORRS	R2, R1
MOVW	R1, #172
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f10x_fsmc.c,368 :: 		FSMC_Bank4->PIO4 = (uint32_t)FSMC_PCCARDInitStruct->FSMC_IOSpaceTimingStruct->FSMC_SetupTime |
ADDW	R1, R0, #20
; FSMC_PCCARDInitStruct end address is: 0 (R0)
LDR	R3, [R1, #0]
LDR	R2, [R3, #0]
;stm32f10x_fsmc.c,369 :: 		(FSMC_PCCARDInitStruct->FSMC_IOSpaceTimingStruct->FSMC_WaitSetupTime << 8) |
ADDS	R1, R3, #4
LDR	R1, [R1, #0]
LSLS	R1, R1, #8
ORRS	R2, R1
;stm32f10x_fsmc.c,370 :: 		(FSMC_PCCARDInitStruct->FSMC_IOSpaceTimingStruct->FSMC_HoldSetupTime << 16)|
ADDW	R1, R3, #8
LDR	R1, [R1, #0]
LSLS	R1, R1, #16
ORRS	R2, R1
;stm32f10x_fsmc.c,371 :: 		(FSMC_PCCARDInitStruct->FSMC_IOSpaceTimingStruct->FSMC_HiZSetupTime << 24);
ADDW	R1, R3, #12
LDR	R1, [R1, #0]
LSLS	R1, R1, #24
ORRS	R2, R1
MOVW	R1, #176
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f10x_fsmc.c,372 :: 		}
L_end_FSMC_PCCARDInit:
BX	LR
; end of _FSMC_PCCARDInit
_FSMC_NORSRAMStructInit:
;stm32f10x_fsmc.c,380 :: 		void FSMC_NORSRAMStructInit(FSMC_NORSRAMInitTypeDef* FSMC_NORSRAMInitStruct)
; FSMC_NORSRAMInitStruct start address is: 0 (R0)
; FSMC_NORSRAMInitStruct end address is: 0 (R0)
; FSMC_NORSRAMInitStruct start address is: 0 (R0)
;stm32f10x_fsmc.c,383 :: 		FSMC_NORSRAMInitStruct->FSMC_Bank = FSMC_Bank1_NORSRAM1;
MOV	R1, #0
STR	R1, [R0, #0]
;stm32f10x_fsmc.c,384 :: 		FSMC_NORSRAMInitStruct->FSMC_DataAddressMux = FSMC_DataAddressMux_Enable;
ADDS	R2, R0, #4
MOV	R1, #2
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,385 :: 		FSMC_NORSRAMInitStruct->FSMC_MemoryType = FSMC_MemoryType_SRAM;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,386 :: 		FSMC_NORSRAMInitStruct->FSMC_MemoryDataWidth = FSMC_MemoryDataWidth_8b;
ADDW	R2, R0, #12
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,387 :: 		FSMC_NORSRAMInitStruct->FSMC_BurstAccessMode = FSMC_BurstAccessMode_Disable;
ADDW	R2, R0, #16
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,388 :: 		FSMC_NORSRAMInitStruct->FSMC_AsynchronousWait = FSMC_AsynchronousWait_Disable;
ADDW	R2, R0, #20
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,389 :: 		FSMC_NORSRAMInitStruct->FSMC_WaitSignalPolarity = FSMC_WaitSignalPolarity_Low;
ADDW	R2, R0, #24
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,390 :: 		FSMC_NORSRAMInitStruct->FSMC_WrapMode = FSMC_WrapMode_Disable;
ADDW	R2, R0, #28
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,391 :: 		FSMC_NORSRAMInitStruct->FSMC_WaitSignalActive = FSMC_WaitSignalActive_BeforeWaitState;
ADDW	R2, R0, #32
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,392 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteOperation = FSMC_WriteOperation_Enable;
ADDW	R2, R0, #36
MOV	R1, #4096
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,393 :: 		FSMC_NORSRAMInitStruct->FSMC_WaitSignal = FSMC_WaitSignal_Enable;
ADDW	R2, R0, #40
MOV	R1, #8192
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,394 :: 		FSMC_NORSRAMInitStruct->FSMC_ExtendedMode = FSMC_ExtendedMode_Disable;
ADDW	R2, R0, #44
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,395 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteBurst = FSMC_WriteBurst_Disable;
ADDW	R2, R0, #48
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,396 :: 		FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_AddressSetupTime = 0xF;
ADDW	R1, R0, #52
LDR	R2, [R1, #0]
MOVW	R1, #15
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,397 :: 		FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_AddressHoldTime = 0xF;
ADDW	R1, R0, #52
LDR	R1, [R1, #0]
ADDS	R2, R1, #4
MOVW	R1, #15
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,398 :: 		FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_DataSetupTime = 0xFF;
ADDW	R1, R0, #52
LDR	R1, [R1, #0]
ADDW	R2, R1, #8
MOVW	R1, #255
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,399 :: 		FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_BusTurnAroundDuration = 0xF;
ADDW	R1, R0, #52
LDR	R1, [R1, #0]
ADDW	R2, R1, #12
MOVW	R1, #15
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,400 :: 		FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_CLKDivision = 0xF;
ADDW	R1, R0, #52
LDR	R1, [R1, #0]
ADDW	R2, R1, #16
MOVW	R1, #15
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,401 :: 		FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_DataLatency = 0xF;
ADDW	R1, R0, #52
LDR	R1, [R1, #0]
ADDW	R2, R1, #20
MOVW	R1, #15
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,402 :: 		FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_AccessMode = FSMC_AccessMode_A;
ADDW	R1, R0, #52
LDR	R1, [R1, #0]
ADDW	R2, R1, #24
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,403 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_AddressSetupTime = 0xF;
ADDW	R1, R0, #56
LDR	R2, [R1, #0]
MOVW	R1, #15
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,404 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_AddressHoldTime = 0xF;
ADDW	R1, R0, #56
LDR	R1, [R1, #0]
ADDS	R2, R1, #4
MOVW	R1, #15
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,405 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_DataSetupTime = 0xFF;
ADDW	R1, R0, #56
LDR	R1, [R1, #0]
ADDW	R2, R1, #8
MOVW	R1, #255
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,406 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_BusTurnAroundDuration = 0xF;
ADDW	R1, R0, #56
LDR	R1, [R1, #0]
ADDW	R2, R1, #12
MOVW	R1, #15
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,407 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_CLKDivision = 0xF;
ADDW	R1, R0, #56
LDR	R1, [R1, #0]
ADDW	R2, R1, #16
MOVW	R1, #15
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,408 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_DataLatency = 0xF;
ADDW	R1, R0, #56
LDR	R1, [R1, #0]
ADDW	R2, R1, #20
MOVW	R1, #15
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,409 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_AccessMode = FSMC_AccessMode_A;
ADDW	R1, R0, #56
; FSMC_NORSRAMInitStruct end address is: 0 (R0)
LDR	R1, [R1, #0]
ADDW	R2, R1, #24
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,410 :: 		}
L_end_FSMC_NORSRAMStructInit:
BX	LR
; end of _FSMC_NORSRAMStructInit
_FSMC_NANDStructInit:
;stm32f10x_fsmc.c,418 :: 		void FSMC_NANDStructInit(FSMC_NANDInitTypeDef* FSMC_NANDInitStruct)
; FSMC_NANDInitStruct start address is: 0 (R0)
; FSMC_NANDInitStruct end address is: 0 (R0)
; FSMC_NANDInitStruct start address is: 0 (R0)
;stm32f10x_fsmc.c,421 :: 		FSMC_NANDInitStruct->FSMC_Bank = FSMC_Bank2_NAND;
MOV	R1, #16
STR	R1, [R0, #0]
;stm32f10x_fsmc.c,422 :: 		FSMC_NANDInitStruct->FSMC_Waitfeature = FSMC_Waitfeature_Disable;
ADDS	R2, R0, #4
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,423 :: 		FSMC_NANDInitStruct->FSMC_MemoryDataWidth = FSMC_MemoryDataWidth_8b;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,424 :: 		FSMC_NANDInitStruct->FSMC_ECC = FSMC_ECC_Disable;
ADDW	R2, R0, #12
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,425 :: 		FSMC_NANDInitStruct->FSMC_ECCPageSize = FSMC_ECCPageSize_256Bytes;
ADDW	R2, R0, #16
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,426 :: 		FSMC_NANDInitStruct->FSMC_TCLRSetupTime = 0x0;
ADDW	R2, R0, #20
MOVW	R1, #0
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,427 :: 		FSMC_NANDInitStruct->FSMC_TARSetupTime = 0x0;
ADDW	R2, R0, #24
MOVW	R1, #0
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,428 :: 		FSMC_NANDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_SetupTime = 0xFC;
ADDW	R1, R0, #28
LDR	R2, [R1, #0]
MOVW	R1, #252
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,429 :: 		FSMC_NANDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_WaitSetupTime = 0xFC;
ADDW	R1, R0, #28
LDR	R1, [R1, #0]
ADDS	R2, R1, #4
MOVW	R1, #252
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,430 :: 		FSMC_NANDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_HoldSetupTime = 0xFC;
ADDW	R1, R0, #28
LDR	R1, [R1, #0]
ADDW	R2, R1, #8
MOVW	R1, #252
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,431 :: 		FSMC_NANDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_HiZSetupTime = 0xFC;
ADDW	R1, R0, #28
LDR	R1, [R1, #0]
ADDW	R2, R1, #12
MOVW	R1, #252
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,432 :: 		FSMC_NANDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_SetupTime = 0xFC;
ADDW	R1, R0, #32
LDR	R2, [R1, #0]
MOVW	R1, #252
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,433 :: 		FSMC_NANDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_WaitSetupTime = 0xFC;
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
ADDS	R2, R1, #4
MOVW	R1, #252
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,434 :: 		FSMC_NANDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_HoldSetupTime = 0xFC;
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
ADDW	R2, R1, #8
MOVW	R1, #252
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,435 :: 		FSMC_NANDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_HiZSetupTime = 0xFC;
ADDW	R1, R0, #32
; FSMC_NANDInitStruct end address is: 0 (R0)
LDR	R1, [R1, #0]
ADDW	R2, R1, #12
MOVW	R1, #252
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,436 :: 		}
L_end_FSMC_NANDStructInit:
BX	LR
; end of _FSMC_NANDStructInit
_FSMC_PCCARDStructInit:
;stm32f10x_fsmc.c,444 :: 		void FSMC_PCCARDStructInit(FSMC_PCCARDInitTypeDef* FSMC_PCCARDInitStruct)
; FSMC_PCCARDInitStruct start address is: 0 (R0)
; FSMC_PCCARDInitStruct end address is: 0 (R0)
; FSMC_PCCARDInitStruct start address is: 0 (R0)
;stm32f10x_fsmc.c,447 :: 		FSMC_PCCARDInitStruct->FSMC_Waitfeature = FSMC_Waitfeature_Disable;
MOV	R1, #0
STR	R1, [R0, #0]
;stm32f10x_fsmc.c,448 :: 		FSMC_PCCARDInitStruct->FSMC_TCLRSetupTime = 0x0;
ADDS	R2, R0, #4
MOVW	R1, #0
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,449 :: 		FSMC_PCCARDInitStruct->FSMC_TARSetupTime = 0x0;
ADDW	R2, R0, #8
MOVW	R1, #0
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,450 :: 		FSMC_PCCARDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_SetupTime = 0xFC;
ADDW	R1, R0, #12
LDR	R2, [R1, #0]
MOVW	R1, #252
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,451 :: 		FSMC_PCCARDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_WaitSetupTime = 0xFC;
ADDW	R1, R0, #12
LDR	R1, [R1, #0]
ADDS	R2, R1, #4
MOVW	R1, #252
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,452 :: 		FSMC_PCCARDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_HoldSetupTime = 0xFC;
ADDW	R1, R0, #12
LDR	R1, [R1, #0]
ADDW	R2, R1, #8
MOVW	R1, #252
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,453 :: 		FSMC_PCCARDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_HiZSetupTime = 0xFC;
ADDW	R1, R0, #12
LDR	R1, [R1, #0]
ADDW	R2, R1, #12
MOVW	R1, #252
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,454 :: 		FSMC_PCCARDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_SetupTime = 0xFC;
ADDW	R1, R0, #16
LDR	R2, [R1, #0]
MOVW	R1, #252
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,455 :: 		FSMC_PCCARDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_WaitSetupTime = 0xFC;
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
ADDS	R2, R1, #4
MOVW	R1, #252
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,456 :: 		FSMC_PCCARDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_HoldSetupTime = 0xFC;
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
ADDW	R2, R1, #8
MOVW	R1, #252
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,457 :: 		FSMC_PCCARDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_HiZSetupTime = 0xFC;
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
ADDW	R2, R1, #12
MOVW	R1, #252
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,458 :: 		FSMC_PCCARDInitStruct->FSMC_IOSpaceTimingStruct->FSMC_SetupTime = 0xFC;
ADDW	R1, R0, #20
LDR	R2, [R1, #0]
MOVW	R1, #252
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,459 :: 		FSMC_PCCARDInitStruct->FSMC_IOSpaceTimingStruct->FSMC_WaitSetupTime = 0xFC;
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
ADDS	R2, R1, #4
MOVW	R1, #252
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,460 :: 		FSMC_PCCARDInitStruct->FSMC_IOSpaceTimingStruct->FSMC_HoldSetupTime = 0xFC;
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
ADDW	R2, R1, #8
MOVW	R1, #252
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,461 :: 		FSMC_PCCARDInitStruct->FSMC_IOSpaceTimingStruct->FSMC_HiZSetupTime = 0xFC;
ADDW	R1, R0, #20
; FSMC_PCCARDInitStruct end address is: 0 (R0)
LDR	R1, [R1, #0]
ADDW	R2, R1, #12
MOVW	R1, #252
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,462 :: 		}
L_end_FSMC_PCCARDStructInit:
BX	LR
; end of _FSMC_PCCARDStructInit
_FSMC_NORSRAMCmd:
;stm32f10x_fsmc.c,475 :: 		void FSMC_NORSRAMCmd(uint32_t FSMC_Bank, FunctionalState NewState)
; NewState start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
; NewState end address is: 4 (R1)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_fsmc.c,480 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_FSMC_NORSRAMCmd36
; NewState end address is: 4 (R1)
;stm32f10x_fsmc.c,483 :: 		FSMC_Bank1->BTCR[FSMC_Bank] |= BCR_MBKEN_Set;
LSLS	R3, R0, #2
; FSMC_Bank end address is: 0 (R0)
MOVW	R2, #0
MOVT	R2, #40960
ADDS	R3, R2, R3
LDR	R2, [R3, #0]
ORR	R2, R2, #1
STR	R2, [R3, #0]
;stm32f10x_fsmc.c,484 :: 		}
IT	AL
BAL	L_FSMC_NORSRAMCmd37
L_FSMC_NORSRAMCmd36:
;stm32f10x_fsmc.c,488 :: 		FSMC_Bank1->BTCR[FSMC_Bank] &= BCR_MBKEN_Reset;
; FSMC_Bank start address is: 0 (R0)
LSLS	R3, R0, #2
; FSMC_Bank end address is: 0 (R0)
MOVW	R2, #0
MOVT	R2, #40960
ADDS	R4, R2, R3
LDR	R3, [R4, #0]
MOVW	R2, #65534
MOVT	R2, #15
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_fsmc.c,489 :: 		}
L_FSMC_NORSRAMCmd37:
;stm32f10x_fsmc.c,490 :: 		}
L_end_FSMC_NORSRAMCmd:
BX	LR
; end of _FSMC_NORSRAMCmd
_FSMC_NANDCmd:
;stm32f10x_fsmc.c,501 :: 		void FSMC_NANDCmd(uint32_t FSMC_Bank, FunctionalState NewState)
; NewState start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
; NewState end address is: 4 (R1)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_fsmc.c,506 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_FSMC_NANDCmd38
; NewState end address is: 4 (R1)
;stm32f10x_fsmc.c,509 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
CMP	R0, #16
IT	NE
BNE	L_FSMC_NANDCmd39
; FSMC_Bank end address is: 0 (R0)
;stm32f10x_fsmc.c,511 :: 		FSMC_Bank2->PCR2 |= PCR_PBKEN_Set;
MOVW	R3, #96
MOVT	R3, #40960
LDR	R2, [R3, #0]
ORR	R2, R2, #4
STR	R2, [R3, #0]
;stm32f10x_fsmc.c,512 :: 		}
IT	AL
BAL	L_FSMC_NANDCmd40
L_FSMC_NANDCmd39:
;stm32f10x_fsmc.c,515 :: 		FSMC_Bank3->PCR3 |= PCR_PBKEN_Set;
MOVW	R3, #128
MOVT	R3, #40960
LDR	R2, [R3, #0]
ORR	R2, R2, #4
STR	R2, [R3, #0]
;stm32f10x_fsmc.c,516 :: 		}
L_FSMC_NANDCmd40:
;stm32f10x_fsmc.c,517 :: 		}
IT	AL
BAL	L_FSMC_NANDCmd41
L_FSMC_NANDCmd38:
;stm32f10x_fsmc.c,521 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
; FSMC_Bank start address is: 0 (R0)
CMP	R0, #16
IT	NE
BNE	L_FSMC_NANDCmd42
; FSMC_Bank end address is: 0 (R0)
;stm32f10x_fsmc.c,523 :: 		FSMC_Bank2->PCR2 &= PCR_PBKEN_Reset;
MOVW	R4, #96
MOVT	R4, #40960
LDR	R3, [R4, #0]
MOVW	R2, #65531
MOVT	R2, #15
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_fsmc.c,524 :: 		}
IT	AL
BAL	L_FSMC_NANDCmd43
L_FSMC_NANDCmd42:
;stm32f10x_fsmc.c,527 :: 		FSMC_Bank3->PCR3 &= PCR_PBKEN_Reset;
MOVW	R4, #128
MOVT	R4, #40960
LDR	R3, [R4, #0]
MOVW	R2, #65531
MOVT	R2, #15
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_fsmc.c,528 :: 		}
L_FSMC_NANDCmd43:
;stm32f10x_fsmc.c,529 :: 		}
L_FSMC_NANDCmd41:
;stm32f10x_fsmc.c,530 :: 		}
L_end_FSMC_NANDCmd:
BX	LR
; end of _FSMC_NANDCmd
_FSMC_PCCARDCmd:
;stm32f10x_fsmc.c,538 :: 		void FSMC_PCCARDCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f10x_fsmc.c,542 :: 		if (NewState != DISABLE)
CMP	R0, #0
IT	EQ
BEQ	L_FSMC_PCCARDCmd44
; NewState end address is: 0 (R0)
;stm32f10x_fsmc.c,545 :: 		FSMC_Bank4->PCR4 |= PCR_PBKEN_Set;
MOVW	R2, #160
MOVT	R2, #40960
LDR	R1, [R2, #0]
ORR	R1, R1, #4
STR	R1, [R2, #0]
;stm32f10x_fsmc.c,546 :: 		}
IT	AL
BAL	L_FSMC_PCCARDCmd45
L_FSMC_PCCARDCmd44:
;stm32f10x_fsmc.c,550 :: 		FSMC_Bank4->PCR4 &= PCR_PBKEN_Reset;
MOVW	R3, #160
MOVT	R3, #40960
LDR	R2, [R3, #0]
MOVW	R1, #65531
MOVT	R1, #15
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f10x_fsmc.c,551 :: 		}
L_FSMC_PCCARDCmd45:
;stm32f10x_fsmc.c,552 :: 		}
L_end_FSMC_PCCARDCmd:
BX	LR
; end of _FSMC_PCCARDCmd
_FSMC_NANDECCCmd:
;stm32f10x_fsmc.c,564 :: 		void FSMC_NANDECCCmd(uint32_t FSMC_Bank, FunctionalState NewState)
; NewState start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
; NewState end address is: 4 (R1)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_fsmc.c,569 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_FSMC_NANDECCCmd46
; NewState end address is: 4 (R1)
;stm32f10x_fsmc.c,572 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
CMP	R0, #16
IT	NE
BNE	L_FSMC_NANDECCCmd47
; FSMC_Bank end address is: 0 (R0)
;stm32f10x_fsmc.c,574 :: 		FSMC_Bank2->PCR2 |= PCR_ECCEN_Set;
MOVW	R3, #96
MOVT	R3, #40960
LDR	R2, [R3, #0]
ORR	R2, R2, #64
STR	R2, [R3, #0]
;stm32f10x_fsmc.c,575 :: 		}
IT	AL
BAL	L_FSMC_NANDECCCmd48
L_FSMC_NANDECCCmd47:
;stm32f10x_fsmc.c,578 :: 		FSMC_Bank3->PCR3 |= PCR_ECCEN_Set;
MOVW	R3, #128
MOVT	R3, #40960
LDR	R2, [R3, #0]
ORR	R2, R2, #64
STR	R2, [R3, #0]
;stm32f10x_fsmc.c,579 :: 		}
L_FSMC_NANDECCCmd48:
;stm32f10x_fsmc.c,580 :: 		}
IT	AL
BAL	L_FSMC_NANDECCCmd49
L_FSMC_NANDECCCmd46:
;stm32f10x_fsmc.c,584 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
; FSMC_Bank start address is: 0 (R0)
CMP	R0, #16
IT	NE
BNE	L_FSMC_NANDECCCmd50
; FSMC_Bank end address is: 0 (R0)
;stm32f10x_fsmc.c,586 :: 		FSMC_Bank2->PCR2 &= PCR_ECCEN_Reset;
MOVW	R4, #96
MOVT	R4, #40960
LDR	R3, [R4, #0]
MOVW	R2, #65471
MOVT	R2, #15
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_fsmc.c,587 :: 		}
IT	AL
BAL	L_FSMC_NANDECCCmd51
L_FSMC_NANDECCCmd50:
;stm32f10x_fsmc.c,590 :: 		FSMC_Bank3->PCR3 &= PCR_ECCEN_Reset;
MOVW	R4, #128
MOVT	R4, #40960
LDR	R3, [R4, #0]
MOVW	R2, #65471
MOVT	R2, #15
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_fsmc.c,591 :: 		}
L_FSMC_NANDECCCmd51:
;stm32f10x_fsmc.c,592 :: 		}
L_FSMC_NANDECCCmd49:
;stm32f10x_fsmc.c,593 :: 		}
L_end_FSMC_NANDECCCmd:
BX	LR
; end of _FSMC_NANDECCCmd
_FSMC_GetECC:
;stm32f10x_fsmc.c,603 :: 		uint32_t FSMC_GetECC(uint32_t FSMC_Bank)
; FSMC_Bank start address is: 0 (R0)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
;stm32f10x_fsmc.c,605 :: 		uint32_t eccval = 0x00000000;
;stm32f10x_fsmc.c,607 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
CMP	R0, #16
IT	NE
BNE	L_FSMC_GetECC52
; FSMC_Bank end address is: 0 (R0)
;stm32f10x_fsmc.c,610 :: 		eccval = FSMC_Bank2->ECCR2;
MOVW	R1, #116
MOVT	R1, #40960
; eccval start address is: 0 (R0)
LDR	R0, [R1, #0]
;stm32f10x_fsmc.c,611 :: 		}
; eccval end address is: 0 (R0)
IT	AL
BAL	L_FSMC_GetECC53
L_FSMC_GetECC52:
;stm32f10x_fsmc.c,615 :: 		eccval = FSMC_Bank3->ECCR3;
MOVW	R1, #148
MOVT	R1, #40960
; eccval start address is: 0 (R0)
LDR	R0, [R1, #0]
; eccval end address is: 0 (R0)
;stm32f10x_fsmc.c,616 :: 		}
L_FSMC_GetECC53:
;stm32f10x_fsmc.c,618 :: 		return(eccval);
; eccval start address is: 0 (R0)
; eccval end address is: 0 (R0)
;stm32f10x_fsmc.c,619 :: 		}
L_end_FSMC_GetECC:
BX	LR
; end of _FSMC_GetECC
_FSMC_ITConfig:
;stm32f10x_fsmc.c,637 :: 		void FSMC_ITConfig(uint32_t FSMC_Bank, uint32_t FSMC_IT, FunctionalState NewState)
; NewState start address is: 8 (R2)
; FSMC_IT start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
; NewState end address is: 8 (R2)
; FSMC_IT end address is: 4 (R1)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
; FSMC_IT start address is: 4 (R1)
; NewState start address is: 8 (R2)
;stm32f10x_fsmc.c,643 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_FSMC_ITConfig54
; NewState end address is: 8 (R2)
;stm32f10x_fsmc.c,646 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
CMP	R0, #16
IT	NE
BNE	L_FSMC_ITConfig55
; FSMC_Bank end address is: 0 (R0)
;stm32f10x_fsmc.c,648 :: 		FSMC_Bank2->SR2 |= FSMC_IT;
MOVW	R4, #100
MOVT	R4, #40960
LDR	R3, [R4, #0]
ORRS	R3, R1
; FSMC_IT end address is: 4 (R1)
STR	R3, [R4, #0]
;stm32f10x_fsmc.c,649 :: 		}
IT	AL
BAL	L_FSMC_ITConfig56
L_FSMC_ITConfig55:
;stm32f10x_fsmc.c,651 :: 		else if (FSMC_Bank == FSMC_Bank3_NAND)
; FSMC_IT start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
CMP	R0, #256
IT	NE
BNE	L_FSMC_ITConfig57
; FSMC_Bank end address is: 0 (R0)
;stm32f10x_fsmc.c,653 :: 		FSMC_Bank3->SR3 |= FSMC_IT;
MOVW	R4, #132
MOVT	R4, #40960
LDR	R3, [R4, #0]
ORRS	R3, R1
; FSMC_IT end address is: 4 (R1)
STR	R3, [R4, #0]
;stm32f10x_fsmc.c,654 :: 		}
IT	AL
BAL	L_FSMC_ITConfig58
L_FSMC_ITConfig57:
;stm32f10x_fsmc.c,658 :: 		FSMC_Bank4->SR4 |= FSMC_IT;
; FSMC_IT start address is: 4 (R1)
MOVW	R4, #164
MOVT	R4, #40960
LDR	R3, [R4, #0]
ORRS	R3, R1
; FSMC_IT end address is: 4 (R1)
STR	R3, [R4, #0]
;stm32f10x_fsmc.c,659 :: 		}
L_FSMC_ITConfig58:
L_FSMC_ITConfig56:
;stm32f10x_fsmc.c,660 :: 		}
IT	AL
BAL	L_FSMC_ITConfig59
L_FSMC_ITConfig54:
;stm32f10x_fsmc.c,664 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
; FSMC_IT start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
CMP	R0, #16
IT	NE
BNE	L_FSMC_ITConfig60
; FSMC_Bank end address is: 0 (R0)
;stm32f10x_fsmc.c,667 :: 		FSMC_Bank2->SR2 &= (uint32_t)~FSMC_IT;
MVN	R5, R1
; FSMC_IT end address is: 4 (R1)
MOVW	R4, #100
MOVT	R4, #40960
LDR	R3, [R4, #0]
ANDS	R3, R5
STR	R3, [R4, #0]
;stm32f10x_fsmc.c,668 :: 		}
IT	AL
BAL	L_FSMC_ITConfig61
L_FSMC_ITConfig60:
;stm32f10x_fsmc.c,670 :: 		else if (FSMC_Bank == FSMC_Bank3_NAND)
; FSMC_IT start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
CMP	R0, #256
IT	NE
BNE	L_FSMC_ITConfig62
; FSMC_Bank end address is: 0 (R0)
;stm32f10x_fsmc.c,672 :: 		FSMC_Bank3->SR3 &= (uint32_t)~FSMC_IT;
MVN	R5, R1
; FSMC_IT end address is: 4 (R1)
MOVW	R4, #132
MOVT	R4, #40960
LDR	R3, [R4, #0]
ANDS	R3, R5
STR	R3, [R4, #0]
;stm32f10x_fsmc.c,673 :: 		}
IT	AL
BAL	L_FSMC_ITConfig63
L_FSMC_ITConfig62:
;stm32f10x_fsmc.c,677 :: 		FSMC_Bank4->SR4 &= (uint32_t)~FSMC_IT;
; FSMC_IT start address is: 4 (R1)
MVN	R5, R1
; FSMC_IT end address is: 4 (R1)
MOVW	R4, #164
MOVT	R4, #40960
LDR	R3, [R4, #0]
ANDS	R3, R5
STR	R3, [R4, #0]
;stm32f10x_fsmc.c,678 :: 		}
L_FSMC_ITConfig63:
L_FSMC_ITConfig61:
;stm32f10x_fsmc.c,679 :: 		}
L_FSMC_ITConfig59:
;stm32f10x_fsmc.c,680 :: 		}
L_end_FSMC_ITConfig:
BX	LR
; end of _FSMC_ITConfig
_FSMC_GetFlagStatus:
;stm32f10x_fsmc.c,697 :: 		FlagStatus FSMC_GetFlagStatus(uint32_t FSMC_Bank, uint32_t FSMC_FLAG)
; FSMC_FLAG start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
; FSMC_FLAG end address is: 4 (R1)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
; FSMC_FLAG start address is: 4 (R1)
;stm32f10x_fsmc.c,699 :: 		FlagStatus bitstatus = RESET;
;stm32f10x_fsmc.c,700 :: 		uint32_t tmpsr = 0x00000000;
;stm32f10x_fsmc.c,706 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
CMP	R0, #16
IT	NE
BNE	L_FSMC_GetFlagStatus64
; FSMC_Bank end address is: 0 (R0)
;stm32f10x_fsmc.c,708 :: 		tmpsr = FSMC_Bank2->SR2;
MOVW	R2, #100
MOVT	R2, #40960
; tmpsr start address is: 0 (R0)
LDR	R0, [R2, #0]
;stm32f10x_fsmc.c,709 :: 		}
; tmpsr end address is: 0 (R0)
IT	AL
BAL	L_FSMC_GetFlagStatus65
L_FSMC_GetFlagStatus64:
;stm32f10x_fsmc.c,710 :: 		else if(FSMC_Bank == FSMC_Bank3_NAND)
; FSMC_Bank start address is: 0 (R0)
CMP	R0, #256
IT	NE
BNE	L_FSMC_GetFlagStatus66
; FSMC_Bank end address is: 0 (R0)
;stm32f10x_fsmc.c,712 :: 		tmpsr = FSMC_Bank3->SR3;
MOVW	R2, #132
MOVT	R2, #40960
; tmpsr start address is: 0 (R0)
LDR	R0, [R2, #0]
;stm32f10x_fsmc.c,713 :: 		}
; tmpsr end address is: 0 (R0)
IT	AL
BAL	L_FSMC_GetFlagStatus67
L_FSMC_GetFlagStatus66:
;stm32f10x_fsmc.c,717 :: 		tmpsr = FSMC_Bank4->SR4;
MOVW	R2, #164
MOVT	R2, #40960
; tmpsr start address is: 0 (R0)
LDR	R0, [R2, #0]
; tmpsr end address is: 0 (R0)
;stm32f10x_fsmc.c,718 :: 		}
L_FSMC_GetFlagStatus67:
; tmpsr start address is: 0 (R0)
; tmpsr end address is: 0 (R0)
L_FSMC_GetFlagStatus65:
;stm32f10x_fsmc.c,721 :: 		if ((tmpsr & FSMC_FLAG) != (uint16_t)RESET )
; tmpsr start address is: 0 (R0)
AND	R2, R0, R1, LSL #0
; FSMC_FLAG end address is: 4 (R1)
; tmpsr end address is: 0 (R0)
CMP	R2, #0
IT	EQ
BEQ	L_FSMC_GetFlagStatus68
;stm32f10x_fsmc.c,723 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_fsmc.c,724 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_FSMC_GetFlagStatus69
L_FSMC_GetFlagStatus68:
;stm32f10x_fsmc.c,727 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_fsmc.c,728 :: 		}
L_FSMC_GetFlagStatus69:
;stm32f10x_fsmc.c,730 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_fsmc.c,731 :: 		}
L_end_FSMC_GetFlagStatus:
BX	LR
; end of _FSMC_GetFlagStatus
_FSMC_ClearFlag:
;stm32f10x_fsmc.c,747 :: 		void FSMC_ClearFlag(uint32_t FSMC_Bank, uint32_t FSMC_FLAG)
; FSMC_FLAG start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
; FSMC_FLAG end address is: 4 (R1)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
; FSMC_FLAG start address is: 4 (R1)
;stm32f10x_fsmc.c,753 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
CMP	R0, #16
IT	NE
BNE	L_FSMC_ClearFlag70
; FSMC_Bank end address is: 0 (R0)
;stm32f10x_fsmc.c,755 :: 		FSMC_Bank2->SR2 &= ~FSMC_FLAG;
MVN	R4, R1
; FSMC_FLAG end address is: 4 (R1)
MOVW	R3, #100
MOVT	R3, #40960
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f10x_fsmc.c,756 :: 		}
IT	AL
BAL	L_FSMC_ClearFlag71
L_FSMC_ClearFlag70:
;stm32f10x_fsmc.c,757 :: 		else if(FSMC_Bank == FSMC_Bank3_NAND)
; FSMC_FLAG start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
CMP	R0, #256
IT	NE
BNE	L_FSMC_ClearFlag72
; FSMC_Bank end address is: 0 (R0)
;stm32f10x_fsmc.c,759 :: 		FSMC_Bank3->SR3 &= ~FSMC_FLAG;
MVN	R4, R1
; FSMC_FLAG end address is: 4 (R1)
MOVW	R3, #132
MOVT	R3, #40960
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f10x_fsmc.c,760 :: 		}
IT	AL
BAL	L_FSMC_ClearFlag73
L_FSMC_ClearFlag72:
;stm32f10x_fsmc.c,764 :: 		FSMC_Bank4->SR4 &= ~FSMC_FLAG;
; FSMC_FLAG start address is: 4 (R1)
MVN	R4, R1
; FSMC_FLAG end address is: 4 (R1)
MOVW	R3, #164
MOVT	R3, #40960
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f10x_fsmc.c,765 :: 		}
L_FSMC_ClearFlag73:
L_FSMC_ClearFlag71:
;stm32f10x_fsmc.c,766 :: 		}
L_end_FSMC_ClearFlag:
BX	LR
; end of _FSMC_ClearFlag
_FSMC_GetITStatus:
;stm32f10x_fsmc.c,782 :: 		ITStatus FSMC_GetITStatus(uint32_t FSMC_Bank, uint32_t FSMC_IT)
; FSMC_IT start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
; FSMC_IT end address is: 4 (R1)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
; FSMC_IT start address is: 4 (R1)
;stm32f10x_fsmc.c,784 :: 		ITStatus bitstatus = RESET;
;stm32f10x_fsmc.c,785 :: 		uint32_t tmpsr = 0x0, itstatus = 0x0, itenable = 0x0;
;stm32f10x_fsmc.c,791 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
CMP	R0, #16
IT	NE
BNE	L_FSMC_GetITStatus74
; FSMC_Bank end address is: 0 (R0)
;stm32f10x_fsmc.c,793 :: 		tmpsr = FSMC_Bank2->SR2;
MOVW	R2, #100
MOVT	R2, #40960
; tmpsr start address is: 0 (R0)
LDR	R0, [R2, #0]
;stm32f10x_fsmc.c,794 :: 		}
; tmpsr end address is: 0 (R0)
IT	AL
BAL	L_FSMC_GetITStatus75
L_FSMC_GetITStatus74:
;stm32f10x_fsmc.c,795 :: 		else if(FSMC_Bank == FSMC_Bank3_NAND)
; FSMC_Bank start address is: 0 (R0)
CMP	R0, #256
IT	NE
BNE	L_FSMC_GetITStatus76
; FSMC_Bank end address is: 0 (R0)
;stm32f10x_fsmc.c,797 :: 		tmpsr = FSMC_Bank3->SR3;
MOVW	R2, #132
MOVT	R2, #40960
; tmpsr start address is: 0 (R0)
LDR	R0, [R2, #0]
;stm32f10x_fsmc.c,798 :: 		}
; tmpsr end address is: 0 (R0)
IT	AL
BAL	L_FSMC_GetITStatus77
L_FSMC_GetITStatus76:
;stm32f10x_fsmc.c,802 :: 		tmpsr = FSMC_Bank4->SR4;
MOVW	R2, #164
MOVT	R2, #40960
; tmpsr start address is: 0 (R0)
LDR	R0, [R2, #0]
; tmpsr end address is: 0 (R0)
;stm32f10x_fsmc.c,803 :: 		}
L_FSMC_GetITStatus77:
; tmpsr start address is: 0 (R0)
; tmpsr end address is: 0 (R0)
L_FSMC_GetITStatus75:
;stm32f10x_fsmc.c,805 :: 		itstatus = tmpsr & FSMC_IT;
; tmpsr start address is: 0 (R0)
AND	R3, R0, R1, LSL #0
;stm32f10x_fsmc.c,807 :: 		itenable = tmpsr & (FSMC_IT >> 3);
LSRS	R2, R1, #3
; FSMC_IT end address is: 4 (R1)
AND	R2, R0, R2, LSL #0
; tmpsr end address is: 0 (R0)
; itenable start address is: 0 (R0)
MOV	R0, R2
;stm32f10x_fsmc.c,808 :: 		if ((itstatus != (uint32_t)RESET)  && (itenable != (uint32_t)RESET))
CMP	R3, #0
IT	EQ
BEQ	L__FSMC_GetITStatus95
CMP	R0, #0
IT	EQ
BEQ	L__FSMC_GetITStatus94
; itenable end address is: 0 (R0)
L__FSMC_GetITStatus93:
;stm32f10x_fsmc.c,810 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_fsmc.c,811 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_FSMC_GetITStatus81
;stm32f10x_fsmc.c,808 :: 		if ((itstatus != (uint32_t)RESET)  && (itenable != (uint32_t)RESET))
L__FSMC_GetITStatus95:
L__FSMC_GetITStatus94:
;stm32f10x_fsmc.c,814 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_fsmc.c,815 :: 		}
L_FSMC_GetITStatus81:
;stm32f10x_fsmc.c,816 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_fsmc.c,817 :: 		}
L_end_FSMC_GetITStatus:
BX	LR
; end of _FSMC_GetITStatus
_FSMC_ClearITPendingBit:
;stm32f10x_fsmc.c,833 :: 		void FSMC_ClearITPendingBit(uint32_t FSMC_Bank, uint32_t FSMC_IT)
; FSMC_IT start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
; FSMC_IT end address is: 4 (R1)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
; FSMC_IT start address is: 4 (R1)
;stm32f10x_fsmc.c,839 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
CMP	R0, #16
IT	NE
BNE	L_FSMC_ClearITPendingBit82
; FSMC_Bank end address is: 0 (R0)
;stm32f10x_fsmc.c,841 :: 		FSMC_Bank2->SR2 &= ~(FSMC_IT >> 3);
LSRS	R2, R1, #3
; FSMC_IT end address is: 4 (R1)
MVN	R4, R2
MOVW	R3, #100
MOVT	R3, #40960
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f10x_fsmc.c,842 :: 		}
IT	AL
BAL	L_FSMC_ClearITPendingBit83
L_FSMC_ClearITPendingBit82:
;stm32f10x_fsmc.c,843 :: 		else if(FSMC_Bank == FSMC_Bank3_NAND)
; FSMC_IT start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
CMP	R0, #256
IT	NE
BNE	L_FSMC_ClearITPendingBit84
; FSMC_Bank end address is: 0 (R0)
;stm32f10x_fsmc.c,845 :: 		FSMC_Bank3->SR3 &= ~(FSMC_IT >> 3);
LSRS	R2, R1, #3
; FSMC_IT end address is: 4 (R1)
MVN	R4, R2
MOVW	R3, #132
MOVT	R3, #40960
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f10x_fsmc.c,846 :: 		}
IT	AL
BAL	L_FSMC_ClearITPendingBit85
L_FSMC_ClearITPendingBit84:
;stm32f10x_fsmc.c,850 :: 		FSMC_Bank4->SR4 &= ~(FSMC_IT >> 3);
; FSMC_IT start address is: 4 (R1)
LSRS	R2, R1, #3
; FSMC_IT end address is: 4 (R1)
MVN	R4, R2
MOVW	R3, #164
MOVT	R3, #40960
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f10x_fsmc.c,851 :: 		}
L_FSMC_ClearITPendingBit85:
L_FSMC_ClearITPendingBit83:
;stm32f10x_fsmc.c,852 :: 		}
L_end_FSMC_ClearITPendingBit:
BX	LR
; end of _FSMC_ClearITPendingBit
