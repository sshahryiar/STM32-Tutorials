stm32f10x_dma_NVIC_SetPriorityGrouping:
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
; end of stm32f10x_dma_NVIC_SetPriorityGrouping
stm32f10x_dma_NVIC_GetPriorityGrouping:
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
; end of stm32f10x_dma_NVIC_GetPriorityGrouping
stm32f10x_dma_NVIC_EnableIRQ:
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
; end of stm32f10x_dma_NVIC_EnableIRQ
stm32f10x_dma_NVIC_DisableIRQ:
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
; end of stm32f10x_dma_NVIC_DisableIRQ
stm32f10x_dma_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f10x_dma_NVIC_GetPendingIRQ0
; ?FLOC__stm32f10x_dma_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_dma_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_dma_NVIC_GetPendingIRQ1
L_stm32f10x_dma_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f10x_dma_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_dma_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
L_stm32f10x_dma_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f10x_dma_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_dma_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1593 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f10x_dma_NVIC_GetPendingIRQ
stm32f10x_dma_NVIC_SetPendingIRQ:
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
; end of stm32f10x_dma_NVIC_SetPendingIRQ
stm32f10x_dma_NVIC_ClearPendingIRQ:
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
; end of stm32f10x_dma_NVIC_ClearPendingIRQ
stm32f10x_dma_NVIC_GetActive:
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
BEQ	L_stm32f10x_dma_NVIC_GetActive2
; ?FLOC__stm32f10x_dma_NVIC_GetActive?T72 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_dma_NVIC_GetActive?T72 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_dma_NVIC_GetActive3
L_stm32f10x_dma_NVIC_GetActive2:
; ?FLOC__stm32f10x_dma_NVIC_GetActive?T72 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_dma_NVIC_GetActive?T72 end address is: 0 (R0)
L_stm32f10x_dma_NVIC_GetActive3:
; ?FLOC__stm32f10x_dma_NVIC_GetActive?T72 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_dma_NVIC_GetActive?T72 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1633 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f10x_dma_NVIC_GetActive
stm32f10x_dma_NVIC_SetPriority:
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
BGE	L_stm32f10x_dma_NVIC_SetPriority4
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
BAL	L_stm32f10x_dma_NVIC_SetPriority5
L_stm32f10x_dma_NVIC_SetPriority4:
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
L_stm32f10x_dma_NVIC_SetPriority5:
;core_cm3.h,1653 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f10x_dma_NVIC_SetPriority
stm32f10x_dma_NVIC_GetPriority:
;core_cm3.h,1670 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1673 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f10x_dma_NVIC_GetPriority6
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
L_stm32f10x_dma_NVIC_GetPriority6:
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
; end of stm32f10x_dma_NVIC_GetPriority
stm32f10x_dma_NVIC_EncodePriority:
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
BLS	L_stm32f10x_dma_NVIC_EncodePriority8
; ?FLOC__stm32f10x_dma_NVIC_EncodePriority?T112 start address is: 12 (R3)
MOVW	R3, #4
; ?FLOC__stm32f10x_dma_NVIC_EncodePriority?T112 end address is: 12 (R3)
IT	AL
BAL	L_stm32f10x_dma_NVIC_EncodePriority9
L_stm32f10x_dma_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f10x_dma_NVIC_EncodePriority?T112 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_dma_NVIC_EncodePriority?T112 end address is: 0 (R0)
MOV	R3, R0
L_stm32f10x_dma_NVIC_EncodePriority9:
; ?FLOC__stm32f10x_dma_NVIC_EncodePriority?T112 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_dma_NVIC_EncodePriority?T112 end address is: 12 (R3)
;core_cm3.h,1702 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f10x_dma_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f10x_dma_NVIC_EncodePriority?T116 start address is: 20 (R5)
MOVW	R5, #0
; ?FLOC__stm32f10x_dma_NVIC_EncodePriority?T116 end address is: 20 (R5)
IT	AL
BAL	L_stm32f10x_dma_NVIC_EncodePriority11
L_stm32f10x_dma_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f10x_dma_NVIC_EncodePriority?T116 start address is: 20 (R5)
; ?FLOC__stm32f10x_dma_NVIC_EncodePriority?T116 end address is: 20 (R5)
L_stm32f10x_dma_NVIC_EncodePriority11:
;core_cm3.h,1705 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f10x_dma_NVIC_EncodePriority?T116 start address is: 20 (R5)
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
; ?FLOC__stm32f10x_dma_NVIC_EncodePriority?T116 end address is: 20 (R5)
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
; end of stm32f10x_dma_NVIC_EncodePriority
stm32f10x_dma_NVIC_DecodePriority:
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
BLS	L_stm32f10x_dma_NVIC_DecodePriority12
; ?FLOC__stm32f10x_dma_NVIC_DecodePriority?T130 start address is: 16 (R4)
MOVW	R4, #4
; ?FLOC__stm32f10x_dma_NVIC_DecodePriority?T130 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_dma_NVIC_DecodePriority13
L_stm32f10x_dma_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f10x_dma_NVIC_DecodePriority?T130 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_dma_NVIC_DecodePriority?T130 end address is: 4 (R1)
MOV	R4, R1
L_stm32f10x_dma_NVIC_DecodePriority13:
; ?FLOC__stm32f10x_dma_NVIC_DecodePriority?T130 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_dma_NVIC_DecodePriority?T130 end address is: 16 (R4)
;core_cm3.h,1733 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f10x_dma_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f10x_dma_NVIC_DecodePriority?T134 start address is: 16 (R4)
MOVW	R4, #0
; ?FLOC__stm32f10x_dma_NVIC_DecodePriority?T134 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_dma_NVIC_DecodePriority15
L_stm32f10x_dma_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f10x_dma_NVIC_DecodePriority?T134 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f10x_dma_NVIC_DecodePriority?T134 end address is: 20 (R5)
MOV	R4, R5
L_stm32f10x_dma_NVIC_DecodePriority15:
; ?FLOC__stm32f10x_dma_NVIC_DecodePriority?T134 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm3.h,1735 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f10x_dma_NVIC_DecodePriority?T134 end address is: 16 (R4)
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
; end of stm32f10x_dma_NVIC_DecodePriority
stm32f10x_dma_SysTick_Config:
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
BLS	L_stm32f10x_dma_SysTick_Config16
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f10x_dma_SysTick_Config16:
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
BL	stm32f10x_dma_NVIC_SetPriority+0
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
; end of stm32f10x_dma_SysTick_Config
stm32f10x_dma_NVIC_SystemReset:
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
L_stm32f10x_dma_NVIC_SystemReset17:
IT	AL
BAL	L_stm32f10x_dma_NVIC_SystemReset17
;core_cm3.h,1787 :: 		}
L_end_NVIC_SystemReset:
BX	LR
; end of stm32f10x_dma_NVIC_SystemReset
stm32f10x_dma_ITM_SendChar:
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
BEQ	L_stm32f10x_dma_ITM_SendChar70
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_dma_ITM_SendChar71
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_dma_ITM_SendChar72
L_stm32f10x_dma_ITM_SendChar66:
;core_cm3.h,1823 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f10x_dma_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f10x_dma_ITM_SendChar23
IT	AL
BAL	L_stm32f10x_dma_ITM_SendChar22
L_stm32f10x_dma_ITM_SendChar23:
;core_cm3.h,1824 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm3.h,1820 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f10x_dma_ITM_SendChar69
L_stm32f10x_dma_ITM_SendChar70:
L_stm32f10x_dma_ITM_SendChar69:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_dma_ITM_SendChar68
L_stm32f10x_dma_ITM_SendChar71:
L_stm32f10x_dma_ITM_SendChar68:
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_dma_ITM_SendChar67
L_stm32f10x_dma_ITM_SendChar72:
L_stm32f10x_dma_ITM_SendChar67:
;core_cm3.h,1826 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm3.h,1827 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f10x_dma_ITM_SendChar
stm32f10x_dma_ITM_ReceiveChar:
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
BEQ	L_stm32f10x_dma_ITM_ReceiveChar24
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
L_stm32f10x_dma_ITM_ReceiveChar24:
;core_cm3.h,1847 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm3.h,1848 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f10x_dma_ITM_ReceiveChar
stm32f10x_dma_ITM_CheckChar:
;core_cm3.h,1859 :: 		static __INLINE int ITM_CheckChar (void) {
;core_cm3.h,1861 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f10x_dma_ITM_CheckChar25
;core_cm3.h,1862 :: 		return (0);                                 /* no character available */
MOVW	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm3.h,1863 :: 		} else {
L_stm32f10x_dma_ITM_CheckChar25:
;core_cm3.h,1864 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm3.h,1866 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f10x_dma_ITM_CheckChar
_DMA_DeInit:
;stm32f10x_dma.c,108 :: 		void DMA_DeInit(DMA_Channel_TypeDef* DMAy_Channelx)
; DMAy_Channelx start address is: 0 (R0)
; DMAy_Channelx end address is: 0 (R0)
; DMAy_Channelx start address is: 0 (R0)
;stm32f10x_dma.c,114 :: 		DMAy_Channelx->CCR &= (uint16_t)(~DMA_CCR1_EN);
LDR	R2, [R0, #0]
MOVW	R1, #65534
AND	R1, R2, R1, LSL #0
STR	R1, [R0, #0]
;stm32f10x_dma.c,117 :: 		DMAy_Channelx->CCR  = 0;
MOVW	R1, #0
STR	R1, [R0, #0]
;stm32f10x_dma.c,120 :: 		DMAy_Channelx->CNDTR = 0;
ADDS	R2, R0, #4
MOVW	R1, #0
STR	R1, [R2, #0]
;stm32f10x_dma.c,123 :: 		DMAy_Channelx->CPAR  = 0;
ADDW	R2, R0, #8
MOVW	R1, #0
STR	R1, [R2, #0]
;stm32f10x_dma.c,126 :: 		DMAy_Channelx->CMAR = 0;
ADDW	R2, R0, #12
MOVW	R1, #0
STR	R1, [R2, #0]
;stm32f10x_dma.c,128 :: 		if (DMAy_Channelx == DMA1_Channel1)
MOVW	R1, #8
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit27
; DMAy_Channelx end address is: 0 (R0)
;stm32f10x_dma.c,131 :: 		DMA1->IFCR |= DMA1_Channel1_IT_Mask;
MOVW	R2, #4
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORR	R1, R1, #15
STR	R1, [R2, #0]
;stm32f10x_dma.c,132 :: 		}
IT	AL
BAL	L_DMA_DeInit28
L_DMA_DeInit27:
;stm32f10x_dma.c,133 :: 		else if (DMAy_Channelx == DMA1_Channel2)
; DMAy_Channelx start address is: 0 (R0)
MOVW	R1, #28
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit29
; DMAy_Channelx end address is: 0 (R0)
;stm32f10x_dma.c,136 :: 		DMA1->IFCR |= DMA1_Channel2_IT_Mask;
MOVW	R2, #4
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORR	R1, R1, #240
STR	R1, [R2, #0]
;stm32f10x_dma.c,137 :: 		}
IT	AL
BAL	L_DMA_DeInit30
L_DMA_DeInit29:
;stm32f10x_dma.c,138 :: 		else if (DMAy_Channelx == DMA1_Channel3)
; DMAy_Channelx start address is: 0 (R0)
MOVW	R1, #48
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit31
; DMAy_Channelx end address is: 0 (R0)
;stm32f10x_dma.c,141 :: 		DMA1->IFCR |= DMA1_Channel3_IT_Mask;
MOVW	R2, #4
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORR	R1, R1, #3840
STR	R1, [R2, #0]
;stm32f10x_dma.c,142 :: 		}
IT	AL
BAL	L_DMA_DeInit32
L_DMA_DeInit31:
;stm32f10x_dma.c,143 :: 		else if (DMAy_Channelx == DMA1_Channel4)
; DMAy_Channelx start address is: 0 (R0)
MOVW	R1, #68
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit33
; DMAy_Channelx end address is: 0 (R0)
;stm32f10x_dma.c,146 :: 		DMA1->IFCR |= DMA1_Channel4_IT_Mask;
MOVW	R2, #4
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORR	R1, R1, #61440
STR	R1, [R2, #0]
;stm32f10x_dma.c,147 :: 		}
IT	AL
BAL	L_DMA_DeInit34
L_DMA_DeInit33:
;stm32f10x_dma.c,148 :: 		else if (DMAy_Channelx == DMA1_Channel5)
; DMAy_Channelx start address is: 0 (R0)
MOVW	R1, #88
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit35
; DMAy_Channelx end address is: 0 (R0)
;stm32f10x_dma.c,151 :: 		DMA1->IFCR |= DMA1_Channel5_IT_Mask;
MOVW	R2, #4
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORR	R1, R1, #983040
STR	R1, [R2, #0]
;stm32f10x_dma.c,152 :: 		}
IT	AL
BAL	L_DMA_DeInit36
L_DMA_DeInit35:
;stm32f10x_dma.c,153 :: 		else if (DMAy_Channelx == DMA1_Channel6)
; DMAy_Channelx start address is: 0 (R0)
MOVW	R1, #108
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit37
; DMAy_Channelx end address is: 0 (R0)
;stm32f10x_dma.c,156 :: 		DMA1->IFCR |= DMA1_Channel6_IT_Mask;
MOVW	R2, #4
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORR	R1, R1, #15728640
STR	R1, [R2, #0]
;stm32f10x_dma.c,157 :: 		}
IT	AL
BAL	L_DMA_DeInit38
L_DMA_DeInit37:
;stm32f10x_dma.c,158 :: 		else if (DMAy_Channelx == DMA1_Channel7)
; DMAy_Channelx start address is: 0 (R0)
MOVW	R1, #128
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit39
; DMAy_Channelx end address is: 0 (R0)
;stm32f10x_dma.c,161 :: 		DMA1->IFCR |= DMA1_Channel7_IT_Mask;
MOVW	R2, #4
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORR	R1, R1, #251658240
STR	R1, [R2, #0]
;stm32f10x_dma.c,162 :: 		}
IT	AL
BAL	L_DMA_DeInit40
L_DMA_DeInit39:
;stm32f10x_dma.c,163 :: 		else if (DMAy_Channelx == DMA2_Channel1)
; DMAy_Channelx start address is: 0 (R0)
MOVW	R1, #1032
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit41
; DMAy_Channelx end address is: 0 (R0)
;stm32f10x_dma.c,166 :: 		DMA2->IFCR |= DMA2_Channel1_IT_Mask;
MOVW	R2, #1028
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORR	R1, R1, #15
STR	R1, [R2, #0]
;stm32f10x_dma.c,167 :: 		}
IT	AL
BAL	L_DMA_DeInit42
L_DMA_DeInit41:
;stm32f10x_dma.c,168 :: 		else if (DMAy_Channelx == DMA2_Channel2)
; DMAy_Channelx start address is: 0 (R0)
MOVW	R1, #1052
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit43
; DMAy_Channelx end address is: 0 (R0)
;stm32f10x_dma.c,171 :: 		DMA2->IFCR |= DMA2_Channel2_IT_Mask;
MOVW	R2, #1028
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORR	R1, R1, #240
STR	R1, [R2, #0]
;stm32f10x_dma.c,172 :: 		}
IT	AL
BAL	L_DMA_DeInit44
L_DMA_DeInit43:
;stm32f10x_dma.c,173 :: 		else if (DMAy_Channelx == DMA2_Channel3)
; DMAy_Channelx start address is: 0 (R0)
MOVW	R1, #1072
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit45
; DMAy_Channelx end address is: 0 (R0)
;stm32f10x_dma.c,176 :: 		DMA2->IFCR |= DMA2_Channel3_IT_Mask;
MOVW	R2, #1028
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORR	R1, R1, #3840
STR	R1, [R2, #0]
;stm32f10x_dma.c,177 :: 		}
IT	AL
BAL	L_DMA_DeInit46
L_DMA_DeInit45:
;stm32f10x_dma.c,178 :: 		else if (DMAy_Channelx == DMA2_Channel4)
; DMAy_Channelx start address is: 0 (R0)
MOVW	R1, #1092
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit47
; DMAy_Channelx end address is: 0 (R0)
;stm32f10x_dma.c,181 :: 		DMA2->IFCR |= DMA2_Channel4_IT_Mask;
MOVW	R2, #1028
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORR	R1, R1, #61440
STR	R1, [R2, #0]
;stm32f10x_dma.c,182 :: 		}
IT	AL
BAL	L_DMA_DeInit48
L_DMA_DeInit47:
;stm32f10x_dma.c,185 :: 		if (DMAy_Channelx == DMA2_Channel5)
; DMAy_Channelx start address is: 0 (R0)
MOVW	R1, #1112
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit49
; DMAy_Channelx end address is: 0 (R0)
;stm32f10x_dma.c,188 :: 		DMA2->IFCR |= DMA2_Channel5_IT_Mask;
MOVW	R2, #1028
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORR	R1, R1, #983040
STR	R1, [R2, #0]
;stm32f10x_dma.c,189 :: 		}
L_DMA_DeInit49:
;stm32f10x_dma.c,190 :: 		}
L_DMA_DeInit48:
L_DMA_DeInit46:
L_DMA_DeInit44:
L_DMA_DeInit42:
L_DMA_DeInit40:
L_DMA_DeInit38:
L_DMA_DeInit36:
L_DMA_DeInit34:
L_DMA_DeInit32:
L_DMA_DeInit30:
L_DMA_DeInit28:
;stm32f10x_dma.c,191 :: 		}
L_end_DMA_DeInit:
BX	LR
; end of _DMA_DeInit
_DMA_Init:
;stm32f10x_dma.c,202 :: 		void DMA_Init(DMA_Channel_TypeDef* DMAy_Channelx, DMA_InitTypeDef* DMA_InitStruct)
; DMA_InitStruct start address is: 4 (R1)
; DMAy_Channelx start address is: 0 (R0)
; DMA_InitStruct end address is: 4 (R1)
; DMAy_Channelx end address is: 0 (R0)
; DMAy_Channelx start address is: 0 (R0)
; DMA_InitStruct start address is: 4 (R1)
;stm32f10x_dma.c,204 :: 		uint32_t tmpreg = 0;
;stm32f10x_dma.c,220 :: 		tmpreg = DMAy_Channelx->CCR;
LDR	R3, [R0, #0]
;stm32f10x_dma.c,222 :: 		tmpreg &= CCR_CLEAR_Mask;
MOVW	R2, #32783
MOVT	R2, #65535
AND	R4, R3, R2, LSL #0
;stm32f10x_dma.c,232 :: 		tmpreg |= DMA_InitStruct->DMA_DIR | DMA_InitStruct->DMA_Mode |
ADDW	R2, R1, #8
LDR	R3, [R2, #0]
ADDW	R2, R1, #32
LDR	R2, [R2, #0]
ORRS	R3, R2
;stm32f10x_dma.c,233 :: 		DMA_InitStruct->DMA_PeripheralInc | DMA_InitStruct->DMA_MemoryInc |
ADDW	R2, R1, #16
LDR	R2, [R2, #0]
ORRS	R3, R2
ADDW	R2, R1, #20
LDR	R2, [R2, #0]
ORRS	R3, R2
;stm32f10x_dma.c,234 :: 		DMA_InitStruct->DMA_PeripheralDataSize | DMA_InitStruct->DMA_MemoryDataSize |
ADDW	R2, R1, #24
LDR	R2, [R2, #0]
ORRS	R3, R2
ADDW	R2, R1, #28
LDR	R2, [R2, #0]
ORRS	R3, R2
;stm32f10x_dma.c,235 :: 		DMA_InitStruct->DMA_Priority | DMA_InitStruct->DMA_M2M;
ADDW	R2, R1, #36
LDR	R2, [R2, #0]
ORRS	R3, R2
ADDW	R2, R1, #40
LDR	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
ORR	R2, R4, R2, LSL #0
;stm32f10x_dma.c,238 :: 		DMAy_Channelx->CCR = tmpreg;
STR	R2, [R0, #0]
;stm32f10x_dma.c,242 :: 		DMAy_Channelx->CNDTR = DMA_InitStruct->DMA_BufferSize;
ADDS	R3, R0, #4
ADDW	R2, R1, #12
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f10x_dma.c,246 :: 		DMAy_Channelx->CPAR = DMA_InitStruct->DMA_PeripheralBaseAddr;
ADDW	R3, R0, #8
LDR	R2, [R1, #0]
STR	R2, [R3, #0]
;stm32f10x_dma.c,250 :: 		DMAy_Channelx->CMAR = DMA_InitStruct->DMA_MemoryBaseAddr;
ADDW	R3, R0, #12
; DMAy_Channelx end address is: 0 (R0)
ADDS	R2, R1, #4
; DMA_InitStruct end address is: 4 (R1)
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f10x_dma.c,251 :: 		}
L_end_DMA_Init:
BX	LR
; end of _DMA_Init
_DMA_StructInit:
;stm32f10x_dma.c,259 :: 		void DMA_StructInit(DMA_InitTypeDef* DMA_InitStruct)
; DMA_InitStruct start address is: 0 (R0)
; DMA_InitStruct end address is: 0 (R0)
; DMA_InitStruct start address is: 0 (R0)
;stm32f10x_dma.c,263 :: 		DMA_InitStruct->DMA_PeripheralBaseAddr = 0;
MOVW	R1, #0
STR	R1, [R0, #0]
;stm32f10x_dma.c,265 :: 		DMA_InitStruct->DMA_MemoryBaseAddr = 0;
ADDS	R2, R0, #4
MOVW	R1, #0
STR	R1, [R2, #0]
;stm32f10x_dma.c,267 :: 		DMA_InitStruct->DMA_DIR = DMA_DIR_PeripheralSRC;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_dma.c,269 :: 		DMA_InitStruct->DMA_BufferSize = 0;
ADDW	R2, R0, #12
MOVW	R1, #0
STR	R1, [R2, #0]
;stm32f10x_dma.c,271 :: 		DMA_InitStruct->DMA_PeripheralInc = DMA_PeripheralInc_Disable;
ADDW	R2, R0, #16
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_dma.c,273 :: 		DMA_InitStruct->DMA_MemoryInc = DMA_MemoryInc_Disable;
ADDW	R2, R0, #20
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_dma.c,275 :: 		DMA_InitStruct->DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
ADDW	R2, R0, #24
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_dma.c,277 :: 		DMA_InitStruct->DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
ADDW	R2, R0, #28
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_dma.c,279 :: 		DMA_InitStruct->DMA_Mode = DMA_Mode_Normal;
ADDW	R2, R0, #32
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_dma.c,281 :: 		DMA_InitStruct->DMA_Priority = DMA_Priority_Low;
ADDW	R2, R0, #36
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_dma.c,283 :: 		DMA_InitStruct->DMA_M2M = DMA_M2M_Disable;
ADDW	R2, R0, #40
; DMA_InitStruct end address is: 0 (R0)
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_dma.c,284 :: 		}
L_end_DMA_StructInit:
BX	LR
; end of _DMA_StructInit
_DMA_Cmd:
;stm32f10x_dma.c,294 :: 		void DMA_Cmd(DMA_Channel_TypeDef* DMAy_Channelx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; DMAy_Channelx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; DMAy_Channelx end address is: 0 (R0)
; DMAy_Channelx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_dma.c,300 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_DMA_Cmd50
; NewState end address is: 4 (R1)
;stm32f10x_dma.c,303 :: 		DMAy_Channelx->CCR |= DMA_CCR1_EN;
LDR	R2, [R0, #0]
ORR	R2, R2, #1
STR	R2, [R0, #0]
; DMAy_Channelx end address is: 0 (R0)
;stm32f10x_dma.c,304 :: 		}
IT	AL
BAL	L_DMA_Cmd51
L_DMA_Cmd50:
;stm32f10x_dma.c,308 :: 		DMAy_Channelx->CCR &= (uint16_t)(~DMA_CCR1_EN);
; DMAy_Channelx start address is: 0 (R0)
LDR	R3, [R0, #0]
MOVW	R2, #65534
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
; DMAy_Channelx end address is: 0 (R0)
;stm32f10x_dma.c,309 :: 		}
L_DMA_Cmd51:
;stm32f10x_dma.c,310 :: 		}
L_end_DMA_Cmd:
BX	LR
; end of _DMA_Cmd
_DMA_ITConfig:
;stm32f10x_dma.c,326 :: 		void DMA_ITConfig(DMA_Channel_TypeDef* DMAy_Channelx, uint32_t DMA_IT, FunctionalState NewState)
; NewState start address is: 8 (R2)
; DMA_IT start address is: 4 (R1)
; DMAy_Channelx start address is: 0 (R0)
; NewState end address is: 8 (R2)
; DMA_IT end address is: 4 (R1)
; DMAy_Channelx end address is: 0 (R0)
; DMAy_Channelx start address is: 0 (R0)
; DMA_IT start address is: 4 (R1)
; NewState start address is: 8 (R2)
;stm32f10x_dma.c,332 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_DMA_ITConfig52
; NewState end address is: 8 (R2)
;stm32f10x_dma.c,335 :: 		DMAy_Channelx->CCR |= DMA_IT;
LDR	R3, [R0, #0]
ORRS	R3, R1
; DMA_IT end address is: 4 (R1)
STR	R3, [R0, #0]
; DMAy_Channelx end address is: 0 (R0)
;stm32f10x_dma.c,336 :: 		}
IT	AL
BAL	L_DMA_ITConfig53
L_DMA_ITConfig52:
;stm32f10x_dma.c,340 :: 		DMAy_Channelx->CCR &= ~DMA_IT;
; DMA_IT start address is: 4 (R1)
; DMAy_Channelx start address is: 0 (R0)
MVN	R4, R1
; DMA_IT end address is: 4 (R1)
LDR	R3, [R0, #0]
ANDS	R3, R4
STR	R3, [R0, #0]
; DMAy_Channelx end address is: 0 (R0)
;stm32f10x_dma.c,341 :: 		}
L_DMA_ITConfig53:
;stm32f10x_dma.c,342 :: 		}
L_end_DMA_ITConfig:
BX	LR
; end of _DMA_ITConfig
_DMA_SetCurrDataCounter:
;stm32f10x_dma.c,353 :: 		void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMAy_Channelx, uint16_t DataNumber)
; DataNumber start address is: 4 (R1)
; DMAy_Channelx start address is: 0 (R0)
; DataNumber end address is: 4 (R1)
; DMAy_Channelx end address is: 0 (R0)
; DMAy_Channelx start address is: 0 (R0)
; DataNumber start address is: 4 (R1)
;stm32f10x_dma.c,360 :: 		DMAy_Channelx->CNDTR = DataNumber;
ADDS	R2, R0, #4
; DMAy_Channelx end address is: 0 (R0)
STR	R1, [R2, #0]
; DataNumber end address is: 4 (R1)
;stm32f10x_dma.c,361 :: 		}
L_end_DMA_SetCurrDataCounter:
BX	LR
; end of _DMA_SetCurrDataCounter
_DMA_GetCurrDataCounter:
;stm32f10x_dma.c,371 :: 		uint16_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMAy_Channelx)
; DMAy_Channelx start address is: 0 (R0)
; DMAy_Channelx end address is: 0 (R0)
; DMAy_Channelx start address is: 0 (R0)
;stm32f10x_dma.c,376 :: 		return ((uint16_t)(DMAy_Channelx->CNDTR));
ADDS	R1, R0, #4
; DMAy_Channelx end address is: 0 (R0)
LDR	R1, [R1, #0]
UXTH	R0, R1
;stm32f10x_dma.c,377 :: 		}
L_end_DMA_GetCurrDataCounter:
BX	LR
; end of _DMA_GetCurrDataCounter
_DMA_GetFlagStatus:
;stm32f10x_dma.c,433 :: 		FlagStatus DMA_GetFlagStatus(uint32_t DMAy_FLAG)
; DMAy_FLAG start address is: 0 (R0)
; DMAy_FLAG end address is: 0 (R0)
; DMAy_FLAG start address is: 0 (R0)
;stm32f10x_dma.c,435 :: 		FlagStatus bitstatus = RESET;
;stm32f10x_dma.c,436 :: 		uint32_t tmpreg = 0;
;stm32f10x_dma.c,442 :: 		if ((DMAy_FLAG & FLAG_Mask) != (uint32_t)RESET)
AND	R1, R0, #268435456
CMP	R1, #0
IT	EQ
BEQ	L_DMA_GetFlagStatus54
;stm32f10x_dma.c,445 :: 		tmpreg = DMA2->ISR ;
MOVW	R1, #1024
MOVT	R1, #16386
; tmpreg start address is: 8 (R2)
LDR	R2, [R1, #0]
;stm32f10x_dma.c,446 :: 		}
; tmpreg end address is: 8 (R2)
IT	AL
BAL	L_DMA_GetFlagStatus55
L_DMA_GetFlagStatus54:
;stm32f10x_dma.c,450 :: 		tmpreg = DMA1->ISR ;
MOVW	R1, #0
MOVT	R1, #16386
; tmpreg start address is: 8 (R2)
LDR	R2, [R1, #0]
; tmpreg end address is: 8 (R2)
;stm32f10x_dma.c,451 :: 		}
L_DMA_GetFlagStatus55:
;stm32f10x_dma.c,454 :: 		if ((tmpreg & DMAy_FLAG) != (uint32_t)RESET)
; tmpreg start address is: 8 (R2)
AND	R1, R2, R0, LSL #0
; DMAy_FLAG end address is: 0 (R0)
; tmpreg end address is: 8 (R2)
CMP	R1, #0
IT	EQ
BEQ	L_DMA_GetFlagStatus56
;stm32f10x_dma.c,457 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_dma.c,458 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_DMA_GetFlagStatus57
L_DMA_GetFlagStatus56:
;stm32f10x_dma.c,462 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_dma.c,463 :: 		}
L_DMA_GetFlagStatus57:
;stm32f10x_dma.c,466 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_dma.c,467 :: 		}
L_end_DMA_GetFlagStatus:
BX	LR
; end of _DMA_GetFlagStatus
_DMA_ClearFlag:
;stm32f10x_dma.c,523 :: 		void DMA_ClearFlag(uint32_t DMAy_FLAG)
; DMAy_FLAG start address is: 0 (R0)
; DMAy_FLAG end address is: 0 (R0)
; DMAy_FLAG start address is: 0 (R0)
;stm32f10x_dma.c,529 :: 		if ((DMAy_FLAG & FLAG_Mask) != (uint32_t)RESET)
AND	R1, R0, #268435456
CMP	R1, #0
IT	EQ
BEQ	L_DMA_ClearFlag58
;stm32f10x_dma.c,532 :: 		DMA2->IFCR = DMAy_FLAG;
MOVW	R1, #1028
MOVT	R1, #16386
STR	R0, [R1, #0]
; DMAy_FLAG end address is: 0 (R0)
;stm32f10x_dma.c,533 :: 		}
IT	AL
BAL	L_DMA_ClearFlag59
L_DMA_ClearFlag58:
;stm32f10x_dma.c,537 :: 		DMA1->IFCR = DMAy_FLAG;
; DMAy_FLAG start address is: 0 (R0)
MOVW	R1, #4
MOVT	R1, #16386
STR	R0, [R1, #0]
; DMAy_FLAG end address is: 0 (R0)
;stm32f10x_dma.c,538 :: 		}
L_DMA_ClearFlag59:
;stm32f10x_dma.c,539 :: 		}
L_end_DMA_ClearFlag:
BX	LR
; end of _DMA_ClearFlag
_DMA_GetITStatus:
;stm32f10x_dma.c,595 :: 		ITStatus DMA_GetITStatus(uint32_t DMAy_IT)
; DMAy_IT start address is: 0 (R0)
; DMAy_IT end address is: 0 (R0)
; DMAy_IT start address is: 0 (R0)
;stm32f10x_dma.c,597 :: 		ITStatus bitstatus = RESET;
;stm32f10x_dma.c,598 :: 		uint32_t tmpreg = 0;
;stm32f10x_dma.c,604 :: 		if ((DMAy_IT & FLAG_Mask) != (uint32_t)RESET)
AND	R1, R0, #268435456
CMP	R1, #0
IT	EQ
BEQ	L_DMA_GetITStatus60
;stm32f10x_dma.c,607 :: 		tmpreg = DMA2->ISR;
MOVW	R1, #1024
MOVT	R1, #16386
; tmpreg start address is: 8 (R2)
LDR	R2, [R1, #0]
;stm32f10x_dma.c,608 :: 		}
; tmpreg end address is: 8 (R2)
IT	AL
BAL	L_DMA_GetITStatus61
L_DMA_GetITStatus60:
;stm32f10x_dma.c,612 :: 		tmpreg = DMA1->ISR;
MOVW	R1, #0
MOVT	R1, #16386
; tmpreg start address is: 8 (R2)
LDR	R2, [R1, #0]
; tmpreg end address is: 8 (R2)
;stm32f10x_dma.c,613 :: 		}
L_DMA_GetITStatus61:
;stm32f10x_dma.c,616 :: 		if ((tmpreg & DMAy_IT) != (uint32_t)RESET)
; tmpreg start address is: 8 (R2)
AND	R1, R2, R0, LSL #0
; DMAy_IT end address is: 0 (R0)
; tmpreg end address is: 8 (R2)
CMP	R1, #0
IT	EQ
BEQ	L_DMA_GetITStatus62
;stm32f10x_dma.c,619 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_dma.c,620 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_DMA_GetITStatus63
L_DMA_GetITStatus62:
;stm32f10x_dma.c,624 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_dma.c,625 :: 		}
L_DMA_GetITStatus63:
;stm32f10x_dma.c,627 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_dma.c,628 :: 		}
L_end_DMA_GetITStatus:
BX	LR
; end of _DMA_GetITStatus
_DMA_ClearITPendingBit:
;stm32f10x_dma.c,684 :: 		void DMA_ClearITPendingBit(uint32_t DMAy_IT)
; DMAy_IT start address is: 0 (R0)
; DMAy_IT end address is: 0 (R0)
; DMAy_IT start address is: 0 (R0)
;stm32f10x_dma.c,690 :: 		if ((DMAy_IT & FLAG_Mask) != (uint32_t)RESET)
AND	R1, R0, #268435456
CMP	R1, #0
IT	EQ
BEQ	L_DMA_ClearITPendingBit64
;stm32f10x_dma.c,693 :: 		DMA2->IFCR = DMAy_IT;
MOVW	R1, #1028
MOVT	R1, #16386
STR	R0, [R1, #0]
; DMAy_IT end address is: 0 (R0)
;stm32f10x_dma.c,694 :: 		}
IT	AL
BAL	L_DMA_ClearITPendingBit65
L_DMA_ClearITPendingBit64:
;stm32f10x_dma.c,698 :: 		DMA1->IFCR = DMAy_IT;
; DMAy_IT start address is: 0 (R0)
MOVW	R1, #4
MOVT	R1, #16386
STR	R0, [R1, #0]
; DMAy_IT end address is: 0 (R0)
;stm32f10x_dma.c,699 :: 		}
L_DMA_ClearITPendingBit65:
;stm32f10x_dma.c,700 :: 		}
L_end_DMA_ClearITPendingBit:
BX	LR
; end of _DMA_ClearITPendingBit
