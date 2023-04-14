stm32f10x_usart_NVIC_SetPriorityGrouping:
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
; end of stm32f10x_usart_NVIC_SetPriorityGrouping
stm32f10x_usart_NVIC_GetPriorityGrouping:
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
; end of stm32f10x_usart_NVIC_GetPriorityGrouping
stm32f10x_usart_NVIC_EnableIRQ:
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
; end of stm32f10x_usart_NVIC_EnableIRQ
stm32f10x_usart_NVIC_DisableIRQ:
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
; end of stm32f10x_usart_NVIC_DisableIRQ
stm32f10x_usart_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f10x_usart_NVIC_GetPendingIRQ0
; ?FLOC__stm32f10x_usart_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_usart_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_usart_NVIC_GetPendingIRQ1
L_stm32f10x_usart_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f10x_usart_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_usart_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
L_stm32f10x_usart_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f10x_usart_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_usart_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1593 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f10x_usart_NVIC_GetPendingIRQ
stm32f10x_usart_NVIC_SetPendingIRQ:
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
; end of stm32f10x_usart_NVIC_SetPendingIRQ
stm32f10x_usart_NVIC_ClearPendingIRQ:
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
; end of stm32f10x_usart_NVIC_ClearPendingIRQ
stm32f10x_usart_NVIC_GetActive:
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
BEQ	L_stm32f10x_usart_NVIC_GetActive2
; ?FLOC__stm32f10x_usart_NVIC_GetActive?T72 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_usart_NVIC_GetActive?T72 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_usart_NVIC_GetActive3
L_stm32f10x_usart_NVIC_GetActive2:
; ?FLOC__stm32f10x_usart_NVIC_GetActive?T72 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_usart_NVIC_GetActive?T72 end address is: 0 (R0)
L_stm32f10x_usart_NVIC_GetActive3:
; ?FLOC__stm32f10x_usart_NVIC_GetActive?T72 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_usart_NVIC_GetActive?T72 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1633 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f10x_usart_NVIC_GetActive
stm32f10x_usart_NVIC_SetPriority:
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
BGE	L_stm32f10x_usart_NVIC_SetPriority4
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
BAL	L_stm32f10x_usart_NVIC_SetPriority5
L_stm32f10x_usart_NVIC_SetPriority4:
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
L_stm32f10x_usart_NVIC_SetPriority5:
;core_cm3.h,1653 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f10x_usart_NVIC_SetPriority
stm32f10x_usart_NVIC_GetPriority:
;core_cm3.h,1670 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1673 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f10x_usart_NVIC_GetPriority6
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
L_stm32f10x_usart_NVIC_GetPriority6:
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
; end of stm32f10x_usart_NVIC_GetPriority
stm32f10x_usart_NVIC_EncodePriority:
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
BLS	L_stm32f10x_usart_NVIC_EncodePriority8
; ?FLOC__stm32f10x_usart_NVIC_EncodePriority?T112 start address is: 12 (R3)
MOVW	R3, #4
; ?FLOC__stm32f10x_usart_NVIC_EncodePriority?T112 end address is: 12 (R3)
IT	AL
BAL	L_stm32f10x_usart_NVIC_EncodePriority9
L_stm32f10x_usart_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f10x_usart_NVIC_EncodePriority?T112 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_usart_NVIC_EncodePriority?T112 end address is: 0 (R0)
MOV	R3, R0
L_stm32f10x_usart_NVIC_EncodePriority9:
; ?FLOC__stm32f10x_usart_NVIC_EncodePriority?T112 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_usart_NVIC_EncodePriority?T112 end address is: 12 (R3)
;core_cm3.h,1702 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f10x_usart_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f10x_usart_NVIC_EncodePriority?T116 start address is: 20 (R5)
MOVW	R5, #0
; ?FLOC__stm32f10x_usart_NVIC_EncodePriority?T116 end address is: 20 (R5)
IT	AL
BAL	L_stm32f10x_usart_NVIC_EncodePriority11
L_stm32f10x_usart_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f10x_usart_NVIC_EncodePriority?T116 start address is: 20 (R5)
; ?FLOC__stm32f10x_usart_NVIC_EncodePriority?T116 end address is: 20 (R5)
L_stm32f10x_usart_NVIC_EncodePriority11:
;core_cm3.h,1705 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f10x_usart_NVIC_EncodePriority?T116 start address is: 20 (R5)
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
; ?FLOC__stm32f10x_usart_NVIC_EncodePriority?T116 end address is: 20 (R5)
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
; end of stm32f10x_usart_NVIC_EncodePriority
stm32f10x_usart_NVIC_DecodePriority:
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
BLS	L_stm32f10x_usart_NVIC_DecodePriority12
; ?FLOC__stm32f10x_usart_NVIC_DecodePriority?T130 start address is: 16 (R4)
MOVW	R4, #4
; ?FLOC__stm32f10x_usart_NVIC_DecodePriority?T130 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_usart_NVIC_DecodePriority13
L_stm32f10x_usart_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f10x_usart_NVIC_DecodePriority?T130 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_usart_NVIC_DecodePriority?T130 end address is: 4 (R1)
MOV	R4, R1
L_stm32f10x_usart_NVIC_DecodePriority13:
; ?FLOC__stm32f10x_usart_NVIC_DecodePriority?T130 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_usart_NVIC_DecodePriority?T130 end address is: 16 (R4)
;core_cm3.h,1733 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f10x_usart_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f10x_usart_NVIC_DecodePriority?T134 start address is: 16 (R4)
MOVW	R4, #0
; ?FLOC__stm32f10x_usart_NVIC_DecodePriority?T134 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_usart_NVIC_DecodePriority15
L_stm32f10x_usart_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f10x_usart_NVIC_DecodePriority?T134 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f10x_usart_NVIC_DecodePriority?T134 end address is: 20 (R5)
MOV	R4, R5
L_stm32f10x_usart_NVIC_DecodePriority15:
; ?FLOC__stm32f10x_usart_NVIC_DecodePriority?T134 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm3.h,1735 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f10x_usart_NVIC_DecodePriority?T134 end address is: 16 (R4)
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
; end of stm32f10x_usart_NVIC_DecodePriority
stm32f10x_usart_SysTick_Config:
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
BLS	L_stm32f10x_usart_SysTick_Config16
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f10x_usart_SysTick_Config16:
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
BL	stm32f10x_usart_NVIC_SetPriority+0
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
; end of stm32f10x_usart_SysTick_Config
stm32f10x_usart_NVIC_SystemReset:
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
L_stm32f10x_usart_NVIC_SystemReset17:
IT	AL
BAL	L_stm32f10x_usart_NVIC_SystemReset17
;core_cm3.h,1787 :: 		}
L_end_NVIC_SystemReset:
BX	LR
; end of stm32f10x_usart_NVIC_SystemReset
stm32f10x_usart_ITM_SendChar:
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
BEQ	L_stm32f10x_usart_ITM_SendChar88
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_usart_ITM_SendChar89
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_usart_ITM_SendChar90
L_stm32f10x_usart_ITM_SendChar84:
;core_cm3.h,1823 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f10x_usart_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f10x_usart_ITM_SendChar23
IT	AL
BAL	L_stm32f10x_usart_ITM_SendChar22
L_stm32f10x_usart_ITM_SendChar23:
;core_cm3.h,1824 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm3.h,1820 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f10x_usart_ITM_SendChar87
L_stm32f10x_usart_ITM_SendChar88:
L_stm32f10x_usart_ITM_SendChar87:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_usart_ITM_SendChar86
L_stm32f10x_usart_ITM_SendChar89:
L_stm32f10x_usart_ITM_SendChar86:
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_usart_ITM_SendChar85
L_stm32f10x_usart_ITM_SendChar90:
L_stm32f10x_usart_ITM_SendChar85:
;core_cm3.h,1826 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm3.h,1827 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f10x_usart_ITM_SendChar
stm32f10x_usart_ITM_ReceiveChar:
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
BEQ	L_stm32f10x_usart_ITM_ReceiveChar24
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
L_stm32f10x_usart_ITM_ReceiveChar24:
;core_cm3.h,1847 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm3.h,1848 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f10x_usart_ITM_ReceiveChar
stm32f10x_usart_ITM_CheckChar:
;core_cm3.h,1859 :: 		static __INLINE int ITM_CheckChar (void) {
;core_cm3.h,1861 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f10x_usart_ITM_CheckChar25
;core_cm3.h,1862 :: 		return (0);                                 /* no character available */
MOVW	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm3.h,1863 :: 		} else {
L_stm32f10x_usart_ITM_CheckChar25:
;core_cm3.h,1864 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm3.h,1866 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f10x_usart_ITM_CheckChar
_USART_DeInit:
;stm32f10x_usart.c,130 :: 		void USART_DeInit(USART_TypeDef* USARTx)
; USARTx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
;stm32f10x_usart.c,135 :: 		if (USARTx == USART1)
MOVW	R1, #14336
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_USART_DeInit27
; USARTx end address is: 0 (R0)
;stm32f10x_usart.c,137 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_USART1, ENABLE);
MOVS	R1, #1
MOV	R0, #16384
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_usart.c,138 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_USART1, DISABLE);
MOVS	R1, #0
MOV	R0, #16384
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_usart.c,139 :: 		}
IT	AL
BAL	L_USART_DeInit28
L_USART_DeInit27:
;stm32f10x_usart.c,140 :: 		else if (USARTx == USART2)
; USARTx start address is: 0 (R0)
MOVW	R1, #17408
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_USART_DeInit29
; USARTx end address is: 0 (R0)
;stm32f10x_usart.c,142 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART2, ENABLE);
MOVS	R1, #1
MOV	R0, #131072
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_usart.c,143 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART2, DISABLE);
MOVS	R1, #0
MOV	R0, #131072
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_usart.c,144 :: 		}
IT	AL
BAL	L_USART_DeInit30
L_USART_DeInit29:
;stm32f10x_usart.c,145 :: 		else if (USARTx == USART3)
; USARTx start address is: 0 (R0)
MOVW	R1, #18432
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_USART_DeInit31
; USARTx end address is: 0 (R0)
;stm32f10x_usart.c,147 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART3, ENABLE);
MOVS	R1, #1
MOV	R0, #262144
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_usart.c,148 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART3, DISABLE);
MOVS	R1, #0
MOV	R0, #262144
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_usart.c,149 :: 		}
IT	AL
BAL	L_USART_DeInit32
L_USART_DeInit31:
;stm32f10x_usart.c,150 :: 		else if (USARTx == UART4)
; USARTx start address is: 0 (R0)
MOVW	R1, #19456
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_USART_DeInit33
; USARTx end address is: 0 (R0)
;stm32f10x_usart.c,152 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART4, ENABLE);
MOVS	R1, #1
MOV	R0, #524288
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_usart.c,153 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART4, DISABLE);
MOVS	R1, #0
MOV	R0, #524288
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_usart.c,154 :: 		}
IT	AL
BAL	L_USART_DeInit34
L_USART_DeInit33:
;stm32f10x_usart.c,157 :: 		if (USARTx == UART5)
; USARTx start address is: 0 (R0)
MOVW	R1, #20480
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_USART_DeInit35
; USARTx end address is: 0 (R0)
;stm32f10x_usart.c,159 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART5, ENABLE);
MOVS	R1, #1
MOV	R0, #1048576
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_usart.c,160 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART5, DISABLE);
MOVS	R1, #0
MOV	R0, #1048576
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_usart.c,161 :: 		}
L_USART_DeInit35:
;stm32f10x_usart.c,162 :: 		}
L_USART_DeInit34:
L_USART_DeInit32:
L_USART_DeInit30:
L_USART_DeInit28:
;stm32f10x_usart.c,163 :: 		}
L_end_USART_DeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _USART_DeInit
_USART_Init:
;stm32f10x_usart.c,176 :: 		void USART_Init(USART_TypeDef* USARTx, USART_InitTypeDef* USART_InitStruct)
; USART_InitStruct start address is: 4 (R1)
; USARTx start address is: 0 (R0)
SUB	SP, SP, #36
STR	LR, [SP, #0]
; USART_InitStruct end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_InitStruct start address is: 4 (R1)
;stm32f10x_usart.c,178 :: 		uint32_t tmpreg = 0x00, apbclock = 0x00;
;stm32f10x_usart.c,179 :: 		uint32_t integerdivider = 0x00;
;stm32f10x_usart.c,180 :: 		uint32_t fractionaldivider = 0x00;
;stm32f10x_usart.c,181 :: 		uint32_t usartxbase = 0;
;stm32f10x_usart.c,192 :: 		if (USART_InitStruct->USART_HardwareFlowControl != USART_HardwareFlowControl_None)
ADDW	R2, R1, #12
LDRH	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_USART_Init36
;stm32f10x_usart.c,195 :: 		}
L_USART_Init36:
;stm32f10x_usart.c,197 :: 		usartxbase = (uint32_t)USARTx;
; usartxbase start address is: 24 (R6)
MOV	R6, R0
;stm32f10x_usart.c,200 :: 		tmpreg = USARTx->CR2;
ADDW	R4, R0, #16
LDRH	R5, [R4, #0]
; tmpreg start address is: 20 (R5)
UXTH	R5, R5
;stm32f10x_usart.c,202 :: 		tmpreg &= CR2_STOP_CLEAR_Mask;
MOVW	R2, #53247
AND	R3, R5, R2, LSL #0
; tmpreg end address is: 20 (R5)
;stm32f10x_usart.c,205 :: 		tmpreg |= (uint32_t)USART_InitStruct->USART_StopBits;
ADDS	R2, R1, #6
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
;stm32f10x_usart.c,208 :: 		USARTx->CR2 = (uint16_t)tmpreg;
UXTH	R2, R2
STRH	R2, [R4, #0]
;stm32f10x_usart.c,211 :: 		tmpreg = USARTx->CR1;
ADDW	R5, R0, #12
LDRH	R2, [R5, #0]
; tmpreg start address is: 12 (R3)
UXTH	R3, R2
;stm32f10x_usart.c,213 :: 		tmpreg &= CR1_CLEAR_Mask;
MOVW	R2, #59891
AND	R4, R3, R2, LSL #0
; tmpreg end address is: 12 (R3)
;stm32f10x_usart.c,218 :: 		tmpreg |= (uint32_t)USART_InitStruct->USART_WordLength | USART_InitStruct->USART_Parity |
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
UXTH	R3, R2
ADDW	R2, R1, #8
LDRH	R2, [R2, #0]
ORRS	R3, R2
;stm32f10x_usart.c,219 :: 		USART_InitStruct->USART_Mode;
ADDW	R2, R1, #10
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
ORR	R2, R4, R2, LSL #0
;stm32f10x_usart.c,221 :: 		USARTx->CR1 = (uint16_t)tmpreg;
UXTH	R2, R2
STRH	R2, [R5, #0]
;stm32f10x_usart.c,224 :: 		tmpreg = USARTx->CR3;
ADDW	R4, R0, #20
LDRH	R2, [R4, #0]
; tmpreg start address is: 20 (R5)
UXTH	R5, R2
;stm32f10x_usart.c,226 :: 		tmpreg &= CR3_CLEAR_Mask;
MOVW	R2, #64767
AND	R3, R5, R2, LSL #0
; tmpreg end address is: 20 (R5)
;stm32f10x_usart.c,229 :: 		tmpreg |= USART_InitStruct->USART_HardwareFlowControl;
ADDW	R2, R1, #12
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
;stm32f10x_usart.c,231 :: 		USARTx->CR3 = (uint16_t)tmpreg;
UXTH	R2, R2
STRH	R2, [R4, #0]
;stm32f10x_usart.c,235 :: 		RCC_GetClocksFreq(&RCC_ClocksStatus);
ADD	R2, SP, #16
STR	R6, [SP, #4]
STR	R1, [SP, #8]
STR	R0, [SP, #12]
MOV	R0, R2
BL	_RCC_GetClocksFreq+0
LDR	R0, [SP, #12]
LDR	R1, [SP, #8]
LDR	R6, [SP, #4]
;stm32f10x_usart.c,236 :: 		if (usartxbase == USART1_BASE)
MOVW	R2, #14336
MOVT	R2, #16385
CMP	R6, R2
IT	NE
BNE	L_USART_Init37
; usartxbase end address is: 24 (R6)
;stm32f10x_usart.c,238 :: 		apbclock = RCC_ClocksStatus.PCLK2_Frequency;
; apbclock start address is: 16 (R4)
LDR	R4, [SP, #28]
;stm32f10x_usart.c,239 :: 		}
; apbclock end address is: 16 (R4)
IT	AL
BAL	L_USART_Init38
L_USART_Init37:
;stm32f10x_usart.c,242 :: 		apbclock = RCC_ClocksStatus.PCLK1_Frequency;
; apbclock start address is: 16 (R4)
LDR	R4, [SP, #24]
; apbclock end address is: 16 (R4)
;stm32f10x_usart.c,243 :: 		}
L_USART_Init38:
;stm32f10x_usart.c,246 :: 		if ((USARTx->CR1 & CR1_OVER8_Set) != 0)
; apbclock start address is: 16 (R4)
ADDW	R2, R0, #12
LDRH	R2, [R2, #0]
AND	R2, R2, #32768
UXTH	R2, R2
CMP	R2, #0
IT	EQ
BEQ	L_USART_Init39
;stm32f10x_usart.c,249 :: 		integerdivider = ((25 * apbclock) / (2 * (USART_InitStruct->USART_BaudRate)));
MOVW	R2, #25
MULS	R4, R2, R4
; apbclock end address is: 16 (R4)
LDR	R2, [R1, #0]
; USART_InitStruct end address is: 4 (R1)
LSLS	R2, R2, #1
UDIV	R4, R4, R2
; integerdivider start address is: 16 (R4)
;stm32f10x_usart.c,250 :: 		}
; integerdivider end address is: 16 (R4)
IT	AL
BAL	L_USART_Init40
L_USART_Init39:
;stm32f10x_usart.c,254 :: 		integerdivider = ((25 * apbclock) / (4 * (USART_InitStruct->USART_BaudRate)));
; apbclock start address is: 16 (R4)
; USART_InitStruct start address is: 4 (R1)
MOVW	R2, #25
MULS	R4, R2, R4
; apbclock end address is: 16 (R4)
LDR	R2, [R1, #0]
; USART_InitStruct end address is: 4 (R1)
LSLS	R2, R2, #2
UDIV	R4, R4, R2
; integerdivider start address is: 16 (R4)
; integerdivider end address is: 16 (R4)
;stm32f10x_usart.c,255 :: 		}
L_USART_Init40:
;stm32f10x_usart.c,256 :: 		tmpreg = (integerdivider / 100) << 4;
; integerdivider start address is: 16 (R4)
MOVW	R2, #100
UDIV	R2, R4, R2
LSLS	R2, R2, #4
; tmpreg start address is: 4 (R1)
MOV	R1, R2
;stm32f10x_usart.c,259 :: 		fractionaldivider = integerdivider - (100 * (tmpreg >> 4));
LSRS	R3, R2, #4
MOVW	R2, #100
MULS	R2, R3, R2
SUB	R2, R4, R2
; integerdivider end address is: 16 (R4)
; fractionaldivider start address is: 12 (R3)
MOV	R3, R2
;stm32f10x_usart.c,262 :: 		if ((USARTx->CR1 & CR1_OVER8_Set) != 0)
ADDW	R2, R0, #12
LDRH	R2, [R2, #0]
AND	R2, R2, #32768
UXTH	R2, R2
CMP	R2, #0
IT	EQ
BEQ	L_USART_Init41
;stm32f10x_usart.c,264 :: 		tmpreg |= ((((fractionaldivider * 8) + 50) / 100)) & ((uint8_t)0x07);
LSLS	R2, R3, #3
; fractionaldivider end address is: 12 (R3)
ADDW	R3, R2, #50
MOVW	R2, #100
UDIV	R2, R3, R2
AND	R2, R2, #7
ORRS	R1, R2
;stm32f10x_usart.c,265 :: 		}
IT	AL
BAL	L_USART_Init42
L_USART_Init41:
;stm32f10x_usart.c,268 :: 		tmpreg |= ((((fractionaldivider * 16) + 50) / 100)) & ((uint8_t)0x0F);
; fractionaldivider start address is: 12 (R3)
LSLS	R2, R3, #4
; fractionaldivider end address is: 12 (R3)
ADDW	R3, R2, #50
MOVW	R2, #100
UDIV	R2, R3, R2
AND	R2, R2, #15
ORRS	R1, R2
; tmpreg end address is: 4 (R1)
;stm32f10x_usart.c,269 :: 		}
L_USART_Init42:
;stm32f10x_usart.c,272 :: 		USARTx->BRR = (uint16_t)tmpreg;
; tmpreg start address is: 4 (R1)
ADDW	R3, R0, #8
; USARTx end address is: 0 (R0)
UXTH	R2, R1
; tmpreg end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f10x_usart.c,273 :: 		}
L_end_USART_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #36
BX	LR
; end of _USART_Init
_USART_StructInit:
;stm32f10x_usart.c,281 :: 		void USART_StructInit(USART_InitTypeDef* USART_InitStruct)
; USART_InitStruct start address is: 0 (R0)
; USART_InitStruct end address is: 0 (R0)
; USART_InitStruct start address is: 0 (R0)
;stm32f10x_usart.c,284 :: 		USART_InitStruct->USART_BaudRate = 9600;
MOVW	R1, #9600
STR	R1, [R0, #0]
;stm32f10x_usart.c,285 :: 		USART_InitStruct->USART_WordLength = USART_WordLength_8b;
ADDS	R2, R0, #4
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_usart.c,286 :: 		USART_InitStruct->USART_StopBits = USART_StopBits_1;
ADDS	R2, R0, #6
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_usart.c,287 :: 		USART_InitStruct->USART_Parity = USART_Parity_No ;
ADDW	R2, R0, #8
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_usart.c,288 :: 		USART_InitStruct->USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
ADDW	R2, R0, #10
MOVW	R1, #12
STRH	R1, [R2, #0]
;stm32f10x_usart.c,289 :: 		USART_InitStruct->USART_HardwareFlowControl = USART_HardwareFlowControl_None;
ADDW	R2, R0, #12
; USART_InitStruct end address is: 0 (R0)
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_usart.c,290 :: 		}
L_end_USART_StructInit:
BX	LR
; end of _USART_StructInit
_USART_ClockInit:
;stm32f10x_usart.c,302 :: 		void USART_ClockInit(USART_TypeDef* USARTx, USART_ClockInitTypeDef* USART_ClockInitStruct)
; USART_ClockInitStruct start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_ClockInitStruct end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_ClockInitStruct start address is: 4 (R1)
;stm32f10x_usart.c,304 :: 		uint32_t tmpreg = 0x00;
;stm32f10x_usart.c,313 :: 		tmpreg = USARTx->CR2;
ADDW	R5, R0, #16
; USARTx end address is: 0 (R0)
LDRH	R2, [R5, #0]
; tmpreg start address is: 0 (R0)
UXTH	R0, R2
;stm32f10x_usart.c,315 :: 		tmpreg &= CR2_CLOCK_CLEAR_Mask;
MOVW	R2, #61695
AND	R4, R0, R2, LSL #0
; tmpreg end address is: 0 (R0)
;stm32f10x_usart.c,321 :: 		tmpreg |= (uint32_t)USART_ClockInitStruct->USART_Clock | USART_ClockInitStruct->USART_CPOL |
LDRH	R2, [R1, #0]
UXTH	R3, R2
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
ORRS	R3, R2
;stm32f10x_usart.c,322 :: 		USART_ClockInitStruct->USART_CPHA | USART_ClockInitStruct->USART_LastBit;
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
ORRS	R3, R2
ADDS	R2, R1, #6
; USART_ClockInitStruct end address is: 4 (R1)
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
ORR	R2, R4, R2, LSL #0
;stm32f10x_usart.c,324 :: 		USARTx->CR2 = (uint16_t)tmpreg;
UXTH	R2, R2
STRH	R2, [R5, #0]
;stm32f10x_usart.c,325 :: 		}
L_end_USART_ClockInit:
BX	LR
; end of _USART_ClockInit
_USART_ClockStructInit:
;stm32f10x_usart.c,333 :: 		void USART_ClockStructInit(USART_ClockInitTypeDef* USART_ClockInitStruct)
; USART_ClockInitStruct start address is: 0 (R0)
; USART_ClockInitStruct end address is: 0 (R0)
; USART_ClockInitStruct start address is: 0 (R0)
;stm32f10x_usart.c,336 :: 		USART_ClockInitStruct->USART_Clock = USART_Clock_Disable;
MOVW	R1, #0
STRH	R1, [R0, #0]
;stm32f10x_usart.c,337 :: 		USART_ClockInitStruct->USART_CPOL = USART_CPOL_Low;
ADDS	R2, R0, #2
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_usart.c,338 :: 		USART_ClockInitStruct->USART_CPHA = USART_CPHA_1Edge;
ADDS	R2, R0, #4
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_usart.c,339 :: 		USART_ClockInitStruct->USART_LastBit = USART_LastBit_Disable;
ADDS	R2, R0, #6
; USART_ClockInitStruct end address is: 0 (R0)
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_usart.c,340 :: 		}
L_end_USART_ClockStructInit:
BX	LR
; end of _USART_ClockStructInit
_USART_Cmd:
;stm32f10x_usart.c,351 :: 		void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_usart.c,357 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_USART_Cmd43
; NewState end address is: 4 (R1)
;stm32f10x_usart.c,360 :: 		USARTx->CR1 |= CR1_UE_Set;
ADDW	R3, R0, #12
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #8192
STRH	R2, [R3, #0]
;stm32f10x_usart.c,361 :: 		}
IT	AL
BAL	L_USART_Cmd44
L_USART_Cmd43:
;stm32f10x_usart.c,365 :: 		USARTx->CR1 &= CR1_UE_Reset;
; USARTx start address is: 0 (R0)
ADDW	R4, R0, #12
; USARTx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #57343
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_usart.c,366 :: 		}
L_USART_Cmd44:
;stm32f10x_usart.c,367 :: 		}
L_end_USART_Cmd:
BX	LR
; end of _USART_Cmd
_USART_ITConfig:
;stm32f10x_usart.c,388 :: 		void USART_ITConfig(USART_TypeDef* USARTx, uint16_t USART_IT, FunctionalState NewState)
; NewState start address is: 8 (R2)
; USART_IT start address is: 4 (R1)
; USARTx start address is: 0 (R0)
MOV	R4, R0
UXTH	R0, R1
; NewState end address is: 8 (R2)
; USART_IT end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 16 (R4)
; USART_IT start address is: 0 (R0)
; NewState start address is: 8 (R2)
;stm32f10x_usart.c,390 :: 		uint32_t usartreg = 0x00, itpos = 0x00, itmask = 0x00;
;stm32f10x_usart.c,391 :: 		uint32_t usartxbase = 0x00;
;stm32f10x_usart.c,397 :: 		if (USART_IT == USART_IT_CTS)
MOVW	R3, #2410
CMP	R0, R3
IT	NE
BNE	L_USART_ITConfig45
;stm32f10x_usart.c,400 :: 		}
L_USART_ITConfig45:
;stm32f10x_usart.c,402 :: 		usartxbase = (uint32_t)USARTx;
; usartxbase start address is: 4 (R1)
MOV	R1, R4
; USARTx end address is: 16 (R4)
;stm32f10x_usart.c,405 :: 		usartreg = (((uint8_t)USART_IT) >> 0x05);
UXTB	R3, R0
LSRS	R3, R3, #5
UXTB	R3, R3
; usartreg start address is: 16 (R4)
UXTB	R4, R3
;stm32f10x_usart.c,408 :: 		itpos = USART_IT & IT_Mask;
AND	R3, R0, #31
UXTH	R3, R3
; USART_IT end address is: 0 (R0)
; itpos start address is: 0 (R0)
UXTH	R0, R3
;stm32f10x_usart.c,409 :: 		itmask = (((uint32_t)0x01) << itpos);
MOV	R3, #1
LSLS	R3, R0
; itpos end address is: 0 (R0)
; itmask start address is: 0 (R0)
MOV	R0, R3
;stm32f10x_usart.c,411 :: 		if (usartreg == 0x01) /* The IT is in CR1 register */
CMP	R4, #1
IT	NE
BNE	L_USART_ITConfig46
; usartreg end address is: 16 (R4)
;stm32f10x_usart.c,413 :: 		usartxbase += 0x0C;
ADDS	R1, #12
;stm32f10x_usart.c,414 :: 		}
IT	AL
BAL	L_USART_ITConfig47
L_USART_ITConfig46:
;stm32f10x_usart.c,415 :: 		else if (usartreg == 0x02) /* The IT is in CR2 register */
; usartreg start address is: 16 (R4)
CMP	R4, #2
IT	NE
BNE	L_USART_ITConfig48
; usartreg end address is: 16 (R4)
;stm32f10x_usart.c,417 :: 		usartxbase += 0x10;
ADDS	R1, #16
;stm32f10x_usart.c,418 :: 		}
IT	AL
BAL	L_USART_ITConfig49
L_USART_ITConfig48:
;stm32f10x_usart.c,421 :: 		usartxbase += 0x14;
ADDS	R1, #20
; usartxbase end address is: 4 (R1)
;stm32f10x_usart.c,422 :: 		}
L_USART_ITConfig49:
; usartxbase start address is: 4 (R1)
; usartxbase end address is: 4 (R1)
L_USART_ITConfig47:
;stm32f10x_usart.c,423 :: 		if (NewState != DISABLE)
; usartxbase start address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_USART_ITConfig50
; NewState end address is: 8 (R2)
;stm32f10x_usart.c,425 :: 		*(__IO uint32_t*)usartxbase  |= itmask;
LDR	R3, [R1, #0]
ORRS	R3, R0
; itmask end address is: 0 (R0)
STR	R3, [R1, #0]
; usartxbase end address is: 4 (R1)
;stm32f10x_usart.c,426 :: 		}
IT	AL
BAL	L_USART_ITConfig51
L_USART_ITConfig50:
;stm32f10x_usart.c,429 :: 		*(__IO uint32_t*)usartxbase &= ~itmask;
; usartxbase start address is: 4 (R1)
; itmask start address is: 0 (R0)
MVN	R4, R0
; itmask end address is: 0 (R0)
LDR	R3, [R1, #0]
ANDS	R3, R4
STR	R3, [R1, #0]
; usartxbase end address is: 4 (R1)
;stm32f10x_usart.c,430 :: 		}
L_USART_ITConfig51:
;stm32f10x_usart.c,431 :: 		}
L_end_USART_ITConfig:
BX	LR
; end of _USART_ITConfig
_USART_DMACmd:
;stm32f10x_usart.c,448 :: 		void USART_DMACmd(USART_TypeDef* USARTx, uint16_t USART_DMAReq, FunctionalState NewState)
; NewState start address is: 8 (R2)
; USART_DMAReq start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; NewState end address is: 8 (R2)
; USART_DMAReq end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_DMAReq start address is: 4 (R1)
; NewState start address is: 8 (R2)
;stm32f10x_usart.c,454 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_USART_DMACmd52
; NewState end address is: 8 (R2)
;stm32f10x_usart.c,458 :: 		USARTx->CR3 |= USART_DMAReq;
ADDW	R4, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R3, [R4, #0]
ORRS	R3, R1
; USART_DMAReq end address is: 4 (R1)
STRH	R3, [R4, #0]
;stm32f10x_usart.c,459 :: 		}
IT	AL
BAL	L_USART_DMACmd53
L_USART_DMACmd52:
;stm32f10x_usart.c,464 :: 		USARTx->CR3 &= (uint16_t)~USART_DMAReq;
; USART_DMAReq start address is: 4 (R1)
; USARTx start address is: 0 (R0)
ADDW	R5, R0, #20
; USARTx end address is: 0 (R0)
MVN	R4, R1
UXTH	R4, R4
; USART_DMAReq end address is: 4 (R1)
LDRH	R3, [R5, #0]
ANDS	R3, R4
STRH	R3, [R5, #0]
;stm32f10x_usart.c,465 :: 		}
L_USART_DMACmd53:
;stm32f10x_usart.c,466 :: 		}
L_end_USART_DMACmd:
BX	LR
; end of _USART_DMACmd
_USART_SetAddress:
;stm32f10x_usart.c,476 :: 		void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
; USART_Address start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_Address end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_Address start address is: 4 (R1)
;stm32f10x_usart.c,483 :: 		USARTx->CR2 &= CR2_Address_Mask;
ADDW	R4, R0, #16
LDRH	R3, [R4, #0]
MOVW	R2, #65520
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_usart.c,485 :: 		USARTx->CR2 |= USART_Address;
ADDW	R3, R0, #16
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORRS	R2, R1
; USART_Address end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f10x_usart.c,486 :: 		}
L_end_USART_SetAddress:
BX	LR
; end of _USART_SetAddress
_USART_WakeUpConfig:
;stm32f10x_usart.c,499 :: 		void USART_WakeUpConfig(USART_TypeDef* USARTx, uint16_t USART_WakeUp)
; USART_WakeUp start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_WakeUp end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_WakeUp start address is: 4 (R1)
;stm32f10x_usart.c,505 :: 		USARTx->CR1 &= CR1_WAKE_Mask;
ADDW	R4, R0, #12
LDRH	R3, [R4, #0]
MOVW	R2, #63487
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_usart.c,506 :: 		USARTx->CR1 |= USART_WakeUp;
ADDW	R3, R0, #12
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORRS	R2, R1
; USART_WakeUp end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f10x_usart.c,507 :: 		}
L_end_USART_WakeUpConfig:
BX	LR
; end of _USART_WakeUpConfig
_USART_ReceiverWakeUpCmd:
;stm32f10x_usart.c,518 :: 		void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_usart.c,524 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_USART_ReceiverWakeUpCmd54
; NewState end address is: 4 (R1)
;stm32f10x_usart.c,527 :: 		USARTx->CR1 |= CR1_RWU_Set;
ADDW	R3, R0, #12
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #2
STRH	R2, [R3, #0]
;stm32f10x_usart.c,528 :: 		}
IT	AL
BAL	L_USART_ReceiverWakeUpCmd55
L_USART_ReceiverWakeUpCmd54:
;stm32f10x_usart.c,532 :: 		USARTx->CR1 &= CR1_RWU_Reset;
; USARTx start address is: 0 (R0)
ADDW	R4, R0, #12
; USARTx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65533
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_usart.c,533 :: 		}
L_USART_ReceiverWakeUpCmd55:
;stm32f10x_usart.c,534 :: 		}
L_end_USART_ReceiverWakeUpCmd:
BX	LR
; end of _USART_ReceiverWakeUpCmd
_USART_LINBreakDetectLengthConfig:
;stm32f10x_usart.c,547 :: 		void USART_LINBreakDetectLengthConfig(USART_TypeDef* USARTx, uint16_t USART_LINBreakDetectLength)
; USART_LINBreakDetectLength start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_LINBreakDetectLength end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_LINBreakDetectLength start address is: 4 (R1)
;stm32f10x_usart.c,553 :: 		USARTx->CR2 &= CR2_LBDL_Mask;
ADDW	R4, R0, #16
LDRH	R3, [R4, #0]
MOVW	R2, #65503
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_usart.c,554 :: 		USARTx->CR2 |= USART_LINBreakDetectLength;
ADDW	R3, R0, #16
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORRS	R2, R1
; USART_LINBreakDetectLength end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f10x_usart.c,555 :: 		}
L_end_USART_LINBreakDetectLengthConfig:
BX	LR
; end of _USART_LINBreakDetectLengthConfig
_USART_LINCmd:
;stm32f10x_usart.c,566 :: 		void USART_LINCmd(USART_TypeDef* USARTx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_usart.c,572 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_USART_LINCmd56
; NewState end address is: 4 (R1)
;stm32f10x_usart.c,575 :: 		USARTx->CR2 |= CR2_LINEN_Set;
ADDW	R3, R0, #16
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #16384
STRH	R2, [R3, #0]
;stm32f10x_usart.c,576 :: 		}
IT	AL
BAL	L_USART_LINCmd57
L_USART_LINCmd56:
;stm32f10x_usart.c,580 :: 		USARTx->CR2 &= CR2_LINEN_Reset;
; USARTx start address is: 0 (R0)
ADDW	R4, R0, #16
; USARTx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #49151
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_usart.c,581 :: 		}
L_USART_LINCmd57:
;stm32f10x_usart.c,582 :: 		}
L_end_USART_LINCmd:
BX	LR
; end of _USART_LINCmd
_USART_SendData:
;stm32f10x_usart.c,592 :: 		void USART_SendData(USART_TypeDef* USARTx, uint16_t Data)
; Data start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; Data end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; Data start address is: 4 (R1)
;stm32f10x_usart.c,599 :: 		USARTx->DR = (Data & (uint16_t)0x01FF);
ADDS	R3, R0, #4
; USARTx end address is: 0 (R0)
MOVW	R2, #511
AND	R2, R1, R2, LSL #0
; Data end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f10x_usart.c,600 :: 		}
L_end_USART_SendData:
BX	LR
; end of _USART_SendData
_USART_ReceiveData:
;stm32f10x_usart.c,609 :: 		uint16_t USART_ReceiveData(USART_TypeDef* USARTx)
; USARTx start address is: 0 (R0)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
;stm32f10x_usart.c,615 :: 		return (uint16_t)(USARTx->DR & (uint16_t)0x01FF);
ADDS	R1, R0, #4
; USARTx end address is: 0 (R0)
LDRH	R2, [R1, #0]
MOVW	R1, #511
AND	R1, R2, R1, LSL #0
UXTH	R0, R1
;stm32f10x_usart.c,616 :: 		}
L_end_USART_ReceiveData:
BX	LR
; end of _USART_ReceiveData
_USART_SendBreak:
;stm32f10x_usart.c,625 :: 		void USART_SendBreak(USART_TypeDef* USARTx)
; USARTx start address is: 0 (R0)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
;stm32f10x_usart.c,631 :: 		USARTx->CR1 |= CR1_SBK_Set;
ADDW	R2, R0, #12
; USARTx end address is: 0 (R0)
LDRH	R1, [R2, #0]
ORR	R1, R1, #1
STRH	R1, [R2, #0]
;stm32f10x_usart.c,632 :: 		}
L_end_USART_SendBreak:
BX	LR
; end of _USART_SendBreak
_USART_SetGuardTime:
;stm32f10x_usart.c,641 :: 		void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
; USART_GuardTime start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_GuardTime end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_GuardTime start address is: 4 (R1)
;stm32f10x_usart.c,647 :: 		USARTx->GTPR &= GTPR_LSB_Mask;
ADDW	R3, R0, #24
LDRH	R2, [R3, #0]
AND	R2, R2, #255
STRH	R2, [R3, #0]
;stm32f10x_usart.c,649 :: 		USARTx->GTPR |= (uint16_t)((uint16_t)USART_GuardTime << 0x08);
ADDW	R4, R0, #24
; USARTx end address is: 0 (R0)
UXTB	R2, R1
; USART_GuardTime end address is: 4 (R1)
LSLS	R3, R2, #8
UXTH	R3, R3
LDRH	R2, [R4, #0]
ORRS	R2, R3
STRH	R2, [R4, #0]
;stm32f10x_usart.c,650 :: 		}
L_end_USART_SetGuardTime:
BX	LR
; end of _USART_SetGuardTime
_USART_SetPrescaler:
;stm32f10x_usart.c,661 :: 		void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
; USART_Prescaler start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_Prescaler end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_Prescaler start address is: 4 (R1)
;stm32f10x_usart.c,667 :: 		USARTx->GTPR &= GTPR_MSB_Mask;
ADDW	R3, R0, #24
LDRH	R2, [R3, #0]
AND	R2, R2, #65280
STRH	R2, [R3, #0]
;stm32f10x_usart.c,669 :: 		USARTx->GTPR |= USART_Prescaler;
ADDW	R3, R0, #24
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORRS	R2, R1
; USART_Prescaler end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f10x_usart.c,670 :: 		}
L_end_USART_SetPrescaler:
BX	LR
; end of _USART_SetPrescaler
_USART_SmartCardCmd:
;stm32f10x_usart.c,680 :: 		void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_usart.c,685 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_USART_SmartCardCmd58
; NewState end address is: 4 (R1)
;stm32f10x_usart.c,688 :: 		USARTx->CR3 |= CR3_SCEN_Set;
ADDW	R3, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #32
STRH	R2, [R3, #0]
;stm32f10x_usart.c,689 :: 		}
IT	AL
BAL	L_USART_SmartCardCmd59
L_USART_SmartCardCmd58:
;stm32f10x_usart.c,693 :: 		USARTx->CR3 &= CR3_SCEN_Reset;
; USARTx start address is: 0 (R0)
ADDW	R4, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65503
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_usart.c,694 :: 		}
L_USART_SmartCardCmd59:
;stm32f10x_usart.c,695 :: 		}
L_end_USART_SmartCardCmd:
BX	LR
; end of _USART_SmartCardCmd
_USART_SmartCardNACKCmd:
;stm32f10x_usart.c,705 :: 		void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_usart.c,710 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_USART_SmartCardNACKCmd60
; NewState end address is: 4 (R1)
;stm32f10x_usart.c,713 :: 		USARTx->CR3 |= CR3_NACK_Set;
ADDW	R3, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #16
STRH	R2, [R3, #0]
;stm32f10x_usart.c,714 :: 		}
IT	AL
BAL	L_USART_SmartCardNACKCmd61
L_USART_SmartCardNACKCmd60:
;stm32f10x_usart.c,718 :: 		USARTx->CR3 &= CR3_NACK_Reset;
; USARTx start address is: 0 (R0)
ADDW	R4, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65519
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_usart.c,719 :: 		}
L_USART_SmartCardNACKCmd61:
;stm32f10x_usart.c,720 :: 		}
L_end_USART_SmartCardNACKCmd:
BX	LR
; end of _USART_SmartCardNACKCmd
_USART_HalfDuplexCmd:
;stm32f10x_usart.c,731 :: 		void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_usart.c,737 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_USART_HalfDuplexCmd62
; NewState end address is: 4 (R1)
;stm32f10x_usart.c,740 :: 		USARTx->CR3 |= CR3_HDSEL_Set;
ADDW	R3, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #8
STRH	R2, [R3, #0]
;stm32f10x_usart.c,741 :: 		}
IT	AL
BAL	L_USART_HalfDuplexCmd63
L_USART_HalfDuplexCmd62:
;stm32f10x_usart.c,745 :: 		USARTx->CR3 &= CR3_HDSEL_Reset;
; USARTx start address is: 0 (R0)
ADDW	R4, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65527
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_usart.c,746 :: 		}
L_USART_HalfDuplexCmd63:
;stm32f10x_usart.c,747 :: 		}
L_end_USART_HalfDuplexCmd:
BX	LR
; end of _USART_HalfDuplexCmd
_USART_OverSampling8Cmd:
;stm32f10x_usart.c,762 :: 		void USART_OverSampling8Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_usart.c,768 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_USART_OverSampling8Cmd64
; NewState end address is: 4 (R1)
;stm32f10x_usart.c,771 :: 		USARTx->CR1 |= CR1_OVER8_Set;
ADDW	R3, R0, #12
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #32768
STRH	R2, [R3, #0]
;stm32f10x_usart.c,772 :: 		}
IT	AL
BAL	L_USART_OverSampling8Cmd65
L_USART_OverSampling8Cmd64:
;stm32f10x_usart.c,776 :: 		USARTx->CR1 &= CR1_OVER8_Reset;
; USARTx start address is: 0 (R0)
ADDW	R4, R0, #12
; USARTx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #32767
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_usart.c,777 :: 		}
L_USART_OverSampling8Cmd65:
;stm32f10x_usart.c,778 :: 		}
L_end_USART_OverSampling8Cmd:
BX	LR
; end of _USART_OverSampling8Cmd
_USART_OneBitMethodCmd:
;stm32f10x_usart.c,789 :: 		void USART_OneBitMethodCmd(USART_TypeDef* USARTx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_usart.c,795 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_USART_OneBitMethodCmd66
; NewState end address is: 4 (R1)
;stm32f10x_usart.c,798 :: 		USARTx->CR3 |= CR3_ONEBITE_Set;
ADDW	R3, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #2048
STRH	R2, [R3, #0]
;stm32f10x_usart.c,799 :: 		}
IT	AL
BAL	L_USART_OneBitMethodCmd67
L_USART_OneBitMethodCmd66:
;stm32f10x_usart.c,803 :: 		USARTx->CR3 &= CR3_ONEBITE_Reset;
; USARTx start address is: 0 (R0)
ADDW	R4, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #63487
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_usart.c,804 :: 		}
L_USART_OneBitMethodCmd67:
;stm32f10x_usart.c,805 :: 		}
L_end_USART_OneBitMethodCmd:
BX	LR
; end of _USART_OneBitMethodCmd
_USART_IrDAConfig:
;stm32f10x_usart.c,818 :: 		void USART_IrDAConfig(USART_TypeDef* USARTx, uint16_t USART_IrDAMode)
; USART_IrDAMode start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_IrDAMode end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_IrDAMode start address is: 4 (R1)
;stm32f10x_usart.c,824 :: 		USARTx->CR3 &= CR3_IRLP_Mask;
ADDW	R4, R0, #20
LDRH	R3, [R4, #0]
MOVW	R2, #65531
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_usart.c,825 :: 		USARTx->CR3 |= USART_IrDAMode;
ADDW	R3, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORRS	R2, R1
; USART_IrDAMode end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f10x_usart.c,826 :: 		}
L_end_USART_IrDAConfig:
BX	LR
; end of _USART_IrDAConfig
_USART_IrDACmd:
;stm32f10x_usart.c,837 :: 		void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_usart.c,843 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_USART_IrDACmd68
; NewState end address is: 4 (R1)
;stm32f10x_usart.c,846 :: 		USARTx->CR3 |= CR3_IREN_Set;
ADDW	R3, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #2
STRH	R2, [R3, #0]
;stm32f10x_usart.c,847 :: 		}
IT	AL
BAL	L_USART_IrDACmd69
L_USART_IrDACmd68:
;stm32f10x_usart.c,851 :: 		USARTx->CR3 &= CR3_IREN_Reset;
; USARTx start address is: 0 (R0)
ADDW	R4, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65533
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_usart.c,852 :: 		}
L_USART_IrDACmd69:
;stm32f10x_usart.c,853 :: 		}
L_end_USART_IrDACmd:
BX	LR
; end of _USART_IrDACmd
_USART_GetFlagStatus:
;stm32f10x_usart.c,874 :: 		FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, uint16_t USART_FLAG)
; USART_FLAG start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_FLAG end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_FLAG start address is: 4 (R1)
;stm32f10x_usart.c,876 :: 		FlagStatus bitstatus = RESET;
;stm32f10x_usart.c,881 :: 		if (USART_FLAG == USART_FLAG_CTS)
CMP	R1, #512
IT	NE
BNE	L_USART_GetFlagStatus70
;stm32f10x_usart.c,884 :: 		}
L_USART_GetFlagStatus70:
;stm32f10x_usart.c,886 :: 		if ((USARTx->SR & USART_FLAG) != (uint16_t)RESET)
LDRH	R2, [R0, #0]
; USARTx end address is: 0 (R0)
ANDS	R2, R1
UXTH	R2, R2
; USART_FLAG end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_USART_GetFlagStatus71
;stm32f10x_usart.c,888 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_usart.c,889 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_USART_GetFlagStatus72
L_USART_GetFlagStatus71:
;stm32f10x_usart.c,892 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_usart.c,893 :: 		}
L_USART_GetFlagStatus72:
;stm32f10x_usart.c,894 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_usart.c,895 :: 		}
L_end_USART_GetFlagStatus:
BX	LR
; end of _USART_GetFlagStatus
_USART_ClearFlag:
;stm32f10x_usart.c,923 :: 		void USART_ClearFlag(USART_TypeDef* USARTx, uint16_t USART_FLAG)
; USART_FLAG start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_FLAG end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_FLAG start address is: 4 (R1)
;stm32f10x_usart.c,929 :: 		if ((USART_FLAG & USART_FLAG_CTS) == USART_FLAG_CTS)
AND	R2, R1, #512
UXTH	R2, R2
CMP	R2, #512
IT	NE
BNE	L_USART_ClearFlag73
;stm32f10x_usart.c,932 :: 		}
L_USART_ClearFlag73:
;stm32f10x_usart.c,934 :: 		USARTx->SR = (uint16_t)~USART_FLAG;
MVN	R2, R1
; USART_FLAG end address is: 4 (R1)
STRH	R2, [R0, #0]
; USARTx end address is: 0 (R0)
;stm32f10x_usart.c,935 :: 		}
L_end_USART_ClearFlag:
BX	LR
; end of _USART_ClearFlag
_USART_GetITStatus:
;stm32f10x_usart.c,956 :: 		ITStatus USART_GetITStatus(USART_TypeDef* USARTx, uint16_t USART_IT)
; USART_IT start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_IT end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_IT start address is: 4 (R1)
;stm32f10x_usart.c,958 :: 		uint32_t bitpos = 0x00, itmask = 0x00, usartreg = 0x00;
;stm32f10x_usart.c,959 :: 		ITStatus bitstatus = RESET;
;stm32f10x_usart.c,964 :: 		if (USART_IT == USART_IT_CTS)
MOVW	R2, #2410
CMP	R1, R2
IT	NE
BNE	L_USART_GetITStatus74
;stm32f10x_usart.c,967 :: 		}
L_USART_GetITStatus74:
;stm32f10x_usart.c,970 :: 		usartreg = (((uint8_t)USART_IT) >> 0x05);
UXTB	R2, R1
LSRS	R2, R2, #5
UXTB	R2, R2
; usartreg start address is: 12 (R3)
UXTB	R3, R2
;stm32f10x_usart.c,972 :: 		itmask = USART_IT & IT_Mask;
AND	R4, R1, #31
; itmask start address is: 16 (R4)
UXTH	R4, R4
;stm32f10x_usart.c,973 :: 		itmask = (uint32_t)0x01 << itmask;
MOV	R2, #1
LSL	R4, R2, R4
;stm32f10x_usart.c,975 :: 		if (usartreg == 0x01) /* The IT  is in CR1 register */
CMP	R3, #1
IT	NE
BNE	L_USART_GetITStatus75
; usartreg end address is: 12 (R3)
;stm32f10x_usart.c,977 :: 		itmask &= USARTx->CR1;
ADDW	R2, R0, #12
LDRH	R2, [R2, #0]
ANDS	R4, R2
;stm32f10x_usart.c,978 :: 		}
IT	AL
BAL	L_USART_GetITStatus76
L_USART_GetITStatus75:
;stm32f10x_usart.c,979 :: 		else if (usartreg == 0x02) /* The IT  is in CR2 register */
; usartreg start address is: 12 (R3)
CMP	R3, #2
IT	NE
BNE	L_USART_GetITStatus77
; usartreg end address is: 12 (R3)
;stm32f10x_usart.c,981 :: 		itmask &= USARTx->CR2;
ADDW	R2, R0, #16
LDRH	R2, [R2, #0]
AND	R2, R4, R2, LSL #0
; itmask end address is: 16 (R4)
; itmask start address is: 8 (R2)
;stm32f10x_usart.c,982 :: 		}
MOV	R4, R2
; itmask end address is: 8 (R2)
IT	AL
BAL	L_USART_GetITStatus78
L_USART_GetITStatus77:
;stm32f10x_usart.c,985 :: 		itmask &= USARTx->CR3;
; itmask start address is: 16 (R4)
ADDW	R2, R0, #20
LDRH	R2, [R2, #0]
AND	R2, R4, R2, LSL #0
; itmask end address is: 16 (R4)
; itmask start address is: 12 (R3)
MOV	R3, R2
; itmask end address is: 12 (R3)
MOV	R4, R3
;stm32f10x_usart.c,986 :: 		}
L_USART_GetITStatus78:
; itmask start address is: 16 (R4)
; itmask end address is: 16 (R4)
L_USART_GetITStatus76:
;stm32f10x_usart.c,988 :: 		bitpos = USART_IT >> 0x08;
; itmask start address is: 16 (R4)
LSRS	R2, R1, #8
UXTH	R2, R2
; USART_IT end address is: 4 (R1)
; bitpos start address is: 4 (R1)
UXTH	R1, R2
;stm32f10x_usart.c,989 :: 		bitpos = (uint32_t)0x01 << bitpos;
MOV	R2, #1
LSL	R3, R2, R1
; bitpos end address is: 4 (R1)
;stm32f10x_usart.c,990 :: 		bitpos &= USARTx->SR;
LDRH	R2, [R0, #0]
; USARTx end address is: 0 (R0)
AND	R2, R3, R2, LSL #0
; bitpos start address is: 0 (R0)
MOV	R0, R2
;stm32f10x_usart.c,991 :: 		if ((itmask != (uint16_t)RESET)&&(bitpos != (uint16_t)RESET))
CMP	R4, #0
IT	EQ
BEQ	L__USART_GetITStatus93
; itmask end address is: 16 (R4)
CMP	R0, #0
IT	EQ
BEQ	L__USART_GetITStatus92
; bitpos end address is: 0 (R0)
L__USART_GetITStatus91:
;stm32f10x_usart.c,993 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_usart.c,994 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_USART_GetITStatus82
;stm32f10x_usart.c,991 :: 		if ((itmask != (uint16_t)RESET)&&(bitpos != (uint16_t)RESET))
L__USART_GetITStatus93:
L__USART_GetITStatus92:
;stm32f10x_usart.c,997 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_usart.c,998 :: 		}
L_USART_GetITStatus82:
;stm32f10x_usart.c,1000 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_usart.c,1001 :: 		}
L_end_USART_GetITStatus:
BX	LR
; end of _USART_GetITStatus
_USART_ClearITPendingBit:
;stm32f10x_usart.c,1030 :: 		void USART_ClearITPendingBit(USART_TypeDef* USARTx, uint16_t USART_IT)
; USART_IT start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_IT end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_IT start address is: 4 (R1)
;stm32f10x_usart.c,1032 :: 		uint16_t bitpos = 0x00, itmask = 0x00;
;stm32f10x_usart.c,1037 :: 		if (USART_IT == USART_IT_CTS)
MOVW	R2, #2410
CMP	R1, R2
IT	NE
BNE	L_USART_ClearITPendingBit83
;stm32f10x_usart.c,1040 :: 		}
L_USART_ClearITPendingBit83:
;stm32f10x_usart.c,1042 :: 		bitpos = USART_IT >> 0x08;
LSRS	R3, R1, #8
UXTH	R3, R3
; USART_IT end address is: 4 (R1)
;stm32f10x_usart.c,1043 :: 		itmask = ((uint16_t)0x01 << (uint16_t)bitpos);
MOVW	R2, #1
LSLS	R2, R3
UXTH	R2, R2
;stm32f10x_usart.c,1044 :: 		USARTx->SR = (uint16_t)~itmask;
MVN	R2, R2
STRH	R2, [R0, #0]
; USARTx end address is: 0 (R0)
;stm32f10x_usart.c,1045 :: 		}
L_end_USART_ClearITPendingBit:
BX	LR
; end of _USART_ClearITPendingBit
