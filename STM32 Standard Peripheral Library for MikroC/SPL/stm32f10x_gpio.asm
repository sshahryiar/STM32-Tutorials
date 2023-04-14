stm32f10x_gpio_NVIC_SetPriorityGrouping:
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
; end of stm32f10x_gpio_NVIC_SetPriorityGrouping
stm32f10x_gpio_NVIC_GetPriorityGrouping:
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
; end of stm32f10x_gpio_NVIC_GetPriorityGrouping
stm32f10x_gpio_NVIC_EnableIRQ:
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
; end of stm32f10x_gpio_NVIC_EnableIRQ
stm32f10x_gpio_NVIC_DisableIRQ:
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
; end of stm32f10x_gpio_NVIC_DisableIRQ
stm32f10x_gpio_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f10x_gpio_NVIC_GetPendingIRQ0
; ?FLOC__stm32f10x_gpio_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_gpio_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_gpio_NVIC_GetPendingIRQ1
L_stm32f10x_gpio_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f10x_gpio_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_gpio_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
L_stm32f10x_gpio_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f10x_gpio_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_gpio_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1593 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f10x_gpio_NVIC_GetPendingIRQ
stm32f10x_gpio_NVIC_SetPendingIRQ:
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
; end of stm32f10x_gpio_NVIC_SetPendingIRQ
stm32f10x_gpio_NVIC_ClearPendingIRQ:
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
; end of stm32f10x_gpio_NVIC_ClearPendingIRQ
stm32f10x_gpio_NVIC_GetActive:
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
BEQ	L_stm32f10x_gpio_NVIC_GetActive2
; ?FLOC__stm32f10x_gpio_NVIC_GetActive?T72 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_gpio_NVIC_GetActive?T72 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_gpio_NVIC_GetActive3
L_stm32f10x_gpio_NVIC_GetActive2:
; ?FLOC__stm32f10x_gpio_NVIC_GetActive?T72 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_gpio_NVIC_GetActive?T72 end address is: 0 (R0)
L_stm32f10x_gpio_NVIC_GetActive3:
; ?FLOC__stm32f10x_gpio_NVIC_GetActive?T72 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_gpio_NVIC_GetActive?T72 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1633 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f10x_gpio_NVIC_GetActive
stm32f10x_gpio_NVIC_SetPriority:
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
BGE	L_stm32f10x_gpio_NVIC_SetPriority4
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
BAL	L_stm32f10x_gpio_NVIC_SetPriority5
L_stm32f10x_gpio_NVIC_SetPriority4:
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
L_stm32f10x_gpio_NVIC_SetPriority5:
;core_cm3.h,1653 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f10x_gpio_NVIC_SetPriority
stm32f10x_gpio_NVIC_GetPriority:
;core_cm3.h,1670 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1673 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f10x_gpio_NVIC_GetPriority6
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
L_stm32f10x_gpio_NVIC_GetPriority6:
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
; end of stm32f10x_gpio_NVIC_GetPriority
stm32f10x_gpio_NVIC_EncodePriority:
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
BLS	L_stm32f10x_gpio_NVIC_EncodePriority8
; ?FLOC__stm32f10x_gpio_NVIC_EncodePriority?T112 start address is: 12 (R3)
MOVW	R3, #4
; ?FLOC__stm32f10x_gpio_NVIC_EncodePriority?T112 end address is: 12 (R3)
IT	AL
BAL	L_stm32f10x_gpio_NVIC_EncodePriority9
L_stm32f10x_gpio_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f10x_gpio_NVIC_EncodePriority?T112 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_gpio_NVIC_EncodePriority?T112 end address is: 0 (R0)
MOV	R3, R0
L_stm32f10x_gpio_NVIC_EncodePriority9:
; ?FLOC__stm32f10x_gpio_NVIC_EncodePriority?T112 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_gpio_NVIC_EncodePriority?T112 end address is: 12 (R3)
;core_cm3.h,1702 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f10x_gpio_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f10x_gpio_NVIC_EncodePriority?T116 start address is: 20 (R5)
MOVW	R5, #0
; ?FLOC__stm32f10x_gpio_NVIC_EncodePriority?T116 end address is: 20 (R5)
IT	AL
BAL	L_stm32f10x_gpio_NVIC_EncodePriority11
L_stm32f10x_gpio_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f10x_gpio_NVIC_EncodePriority?T116 start address is: 20 (R5)
; ?FLOC__stm32f10x_gpio_NVIC_EncodePriority?T116 end address is: 20 (R5)
L_stm32f10x_gpio_NVIC_EncodePriority11:
;core_cm3.h,1705 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f10x_gpio_NVIC_EncodePriority?T116 start address is: 20 (R5)
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
; ?FLOC__stm32f10x_gpio_NVIC_EncodePriority?T116 end address is: 20 (R5)
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
; end of stm32f10x_gpio_NVIC_EncodePriority
stm32f10x_gpio_NVIC_DecodePriority:
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
BLS	L_stm32f10x_gpio_NVIC_DecodePriority12
; ?FLOC__stm32f10x_gpio_NVIC_DecodePriority?T130 start address is: 16 (R4)
MOVW	R4, #4
; ?FLOC__stm32f10x_gpio_NVIC_DecodePriority?T130 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_gpio_NVIC_DecodePriority13
L_stm32f10x_gpio_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f10x_gpio_NVIC_DecodePriority?T130 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_gpio_NVIC_DecodePriority?T130 end address is: 4 (R1)
MOV	R4, R1
L_stm32f10x_gpio_NVIC_DecodePriority13:
; ?FLOC__stm32f10x_gpio_NVIC_DecodePriority?T130 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_gpio_NVIC_DecodePriority?T130 end address is: 16 (R4)
;core_cm3.h,1733 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f10x_gpio_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f10x_gpio_NVIC_DecodePriority?T134 start address is: 16 (R4)
MOVW	R4, #0
; ?FLOC__stm32f10x_gpio_NVIC_DecodePriority?T134 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_gpio_NVIC_DecodePriority15
L_stm32f10x_gpio_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f10x_gpio_NVIC_DecodePriority?T134 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f10x_gpio_NVIC_DecodePriority?T134 end address is: 20 (R5)
MOV	R4, R5
L_stm32f10x_gpio_NVIC_DecodePriority15:
; ?FLOC__stm32f10x_gpio_NVIC_DecodePriority?T134 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm3.h,1735 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f10x_gpio_NVIC_DecodePriority?T134 end address is: 16 (R4)
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
; end of stm32f10x_gpio_NVIC_DecodePriority
stm32f10x_gpio_SysTick_Config:
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
BLS	L_stm32f10x_gpio_SysTick_Config16
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f10x_gpio_SysTick_Config16:
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
BL	stm32f10x_gpio_NVIC_SetPriority+0
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
; end of stm32f10x_gpio_SysTick_Config
stm32f10x_gpio_NVIC_SystemReset:
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
L_stm32f10x_gpio_NVIC_SystemReset17:
IT	AL
BAL	L_stm32f10x_gpio_NVIC_SystemReset17
;core_cm3.h,1787 :: 		}
L_end_NVIC_SystemReset:
BX	LR
; end of stm32f10x_gpio_NVIC_SystemReset
stm32f10x_gpio_ITM_SendChar:
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
BEQ	L_stm32f10x_gpio_ITM_SendChar75
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_gpio_ITM_SendChar76
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_gpio_ITM_SendChar77
L_stm32f10x_gpio_ITM_SendChar71:
;core_cm3.h,1823 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f10x_gpio_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f10x_gpio_ITM_SendChar23
IT	AL
BAL	L_stm32f10x_gpio_ITM_SendChar22
L_stm32f10x_gpio_ITM_SendChar23:
;core_cm3.h,1824 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm3.h,1820 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f10x_gpio_ITM_SendChar74
L_stm32f10x_gpio_ITM_SendChar75:
L_stm32f10x_gpio_ITM_SendChar74:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_gpio_ITM_SendChar73
L_stm32f10x_gpio_ITM_SendChar76:
L_stm32f10x_gpio_ITM_SendChar73:
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_gpio_ITM_SendChar72
L_stm32f10x_gpio_ITM_SendChar77:
L_stm32f10x_gpio_ITM_SendChar72:
;core_cm3.h,1826 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm3.h,1827 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f10x_gpio_ITM_SendChar
stm32f10x_gpio_ITM_ReceiveChar:
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
BEQ	L_stm32f10x_gpio_ITM_ReceiveChar24
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
L_stm32f10x_gpio_ITM_ReceiveChar24:
;core_cm3.h,1847 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm3.h,1848 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f10x_gpio_ITM_ReceiveChar
stm32f10x_gpio_ITM_CheckChar:
;core_cm3.h,1859 :: 		static __INLINE int ITM_CheckChar (void) {
;core_cm3.h,1861 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f10x_gpio_ITM_CheckChar25
;core_cm3.h,1862 :: 		return (0);                                 /* no character available */
MOVW	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm3.h,1863 :: 		} else {
L_stm32f10x_gpio_ITM_CheckChar25:
;core_cm3.h,1864 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm3.h,1866 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f10x_gpio_ITM_CheckChar
_GPIO_DeInit:
;stm32f10x_gpio.c,118 :: 		void GPIO_DeInit(GPIO_TypeDef* GPIOx)
; GPIOx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
;stm32f10x_gpio.c,123 :: 		if (GPIOx == GPIOA)
MOVW	R1, #2048
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_GPIO_DeInit27
; GPIOx end address is: 0 (R0)
;stm32f10x_gpio.c,125 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOA, ENABLE);
MOVS	R1, #1
MOV	R0, #4
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_gpio.c,126 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOA, DISABLE);
MOVS	R1, #0
MOV	R0, #4
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_gpio.c,127 :: 		}
IT	AL
BAL	L_GPIO_DeInit28
L_GPIO_DeInit27:
;stm32f10x_gpio.c,128 :: 		else if (GPIOx == GPIOB)
; GPIOx start address is: 0 (R0)
MOVW	R1, #3072
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_GPIO_DeInit29
; GPIOx end address is: 0 (R0)
;stm32f10x_gpio.c,130 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOB, ENABLE);
MOVS	R1, #1
MOV	R0, #8
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_gpio.c,131 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOB, DISABLE);
MOVS	R1, #0
MOV	R0, #8
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_gpio.c,132 :: 		}
IT	AL
BAL	L_GPIO_DeInit30
L_GPIO_DeInit29:
;stm32f10x_gpio.c,133 :: 		else if (GPIOx == GPIOC)
; GPIOx start address is: 0 (R0)
MOVW	R1, #4096
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_GPIO_DeInit31
; GPIOx end address is: 0 (R0)
;stm32f10x_gpio.c,135 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOC, ENABLE);
MOVS	R1, #1
MOV	R0, #16
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_gpio.c,136 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOC, DISABLE);
MOVS	R1, #0
MOV	R0, #16
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_gpio.c,137 :: 		}
IT	AL
BAL	L_GPIO_DeInit32
L_GPIO_DeInit31:
;stm32f10x_gpio.c,138 :: 		else if (GPIOx == GPIOD)
; GPIOx start address is: 0 (R0)
MOVW	R1, #5120
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_GPIO_DeInit33
; GPIOx end address is: 0 (R0)
;stm32f10x_gpio.c,140 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOD, ENABLE);
MOVS	R1, #1
MOV	R0, #32
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_gpio.c,141 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOD, DISABLE);
MOVS	R1, #0
MOV	R0, #32
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_gpio.c,142 :: 		}
IT	AL
BAL	L_GPIO_DeInit34
L_GPIO_DeInit33:
;stm32f10x_gpio.c,143 :: 		else if (GPIOx == GPIOE)
; GPIOx start address is: 0 (R0)
MOVW	R1, #6144
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_GPIO_DeInit35
; GPIOx end address is: 0 (R0)
;stm32f10x_gpio.c,145 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOE, ENABLE);
MOVS	R1, #1
MOV	R0, #64
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_gpio.c,146 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOE, DISABLE);
MOVS	R1, #0
MOV	R0, #64
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_gpio.c,147 :: 		}
IT	AL
BAL	L_GPIO_DeInit36
L_GPIO_DeInit35:
;stm32f10x_gpio.c,148 :: 		else if (GPIOx == GPIOF)
; GPIOx start address is: 0 (R0)
MOVW	R1, #7168
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_GPIO_DeInit37
; GPIOx end address is: 0 (R0)
;stm32f10x_gpio.c,150 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOF, ENABLE);
MOVS	R1, #1
MOV	R0, #128
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_gpio.c,151 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOF, DISABLE);
MOVS	R1, #0
MOV	R0, #128
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_gpio.c,152 :: 		}
IT	AL
BAL	L_GPIO_DeInit38
L_GPIO_DeInit37:
;stm32f10x_gpio.c,155 :: 		if (GPIOx == GPIOG)
; GPIOx start address is: 0 (R0)
MOVW	R1, #8192
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_GPIO_DeInit39
; GPIOx end address is: 0 (R0)
;stm32f10x_gpio.c,157 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOG, ENABLE);
MOVS	R1, #1
MOV	R0, #256
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_gpio.c,158 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOG, DISABLE);
MOVS	R1, #0
MOV	R0, #256
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_gpio.c,159 :: 		}
L_GPIO_DeInit39:
;stm32f10x_gpio.c,160 :: 		}
L_GPIO_DeInit38:
L_GPIO_DeInit36:
L_GPIO_DeInit34:
L_GPIO_DeInit32:
L_GPIO_DeInit30:
L_GPIO_DeInit28:
;stm32f10x_gpio.c,161 :: 		}
L_end_GPIO_DeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _GPIO_DeInit
_GPIO_AFIODeInit:
;stm32f10x_gpio.c,169 :: 		void GPIO_AFIODeInit(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;stm32f10x_gpio.c,171 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_AFIO, ENABLE);
MOVS	R1, #1
MOV	R0, #1
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_gpio.c,172 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_AFIO, DISABLE);
MOVS	R1, #0
MOV	R0, #1
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_gpio.c,173 :: 		}
L_end_GPIO_AFIODeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _GPIO_AFIODeInit
_GPIO_Init:
;stm32f10x_gpio.c,183 :: 		void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_InitTypeDef* GPIO_InitStruct)
; GPIO_InitStruct start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
; GPIO_InitStruct end address is: 4 (R1)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
; GPIO_InitStruct start address is: 4 (R1)
;stm32f10x_gpio.c,185 :: 		uint32_t currentmode = 0x00, currentpin = 0x00, pinpos = 0x00, pos = 0x00;
;stm32f10x_gpio.c,186 :: 		uint32_t tmpreg = 0x00, pinmask = 0x00;
;stm32f10x_gpio.c,193 :: 		currentmode = ((uint32_t)GPIO_InitStruct->GPIO_Mode) & ((uint32_t)0x0F);
ADDS	R2, R1, #3
LDRB	R3, [R2, #0]
UXTB	R6, R3
AND	R6, R6, #15
; currentmode start address is: 24 (R6)
;stm32f10x_gpio.c,194 :: 		if ((((uint32_t)GPIO_InitStruct->GPIO_Mode) & ((uint32_t)0x10)) != 0x00)
UXTB	R2, R3
AND	R2, R2, #16
CMP	R2, #0
IT	EQ
BEQ	L__GPIO_Init78
;stm32f10x_gpio.c,199 :: 		currentmode |= (uint32_t)GPIO_InitStruct->GPIO_Speed;
ADDS	R2, R1, #2
LDRB	R2, [R2, #0]
ORRS	R6, R2
; currentmode end address is: 24 (R6)
;stm32f10x_gpio.c,200 :: 		}
IT	AL
BAL	L_GPIO_Init40
L__GPIO_Init78:
;stm32f10x_gpio.c,194 :: 		if ((((uint32_t)GPIO_InitStruct->GPIO_Mode) & ((uint32_t)0x10)) != 0x00)
;stm32f10x_gpio.c,200 :: 		}
L_GPIO_Init40:
;stm32f10x_gpio.c,203 :: 		if (((uint32_t)GPIO_InitStruct->GPIO_Pin & ((uint32_t)0x00FF)) != 0x00)
; currentmode start address is: 24 (R6)
LDRH	R2, [R1, #0]
AND	R2, R2, #255
CMP	R2, #0
IT	EQ
BEQ	L__GPIO_Init80
;stm32f10x_gpio.c,205 :: 		tmpreg = GPIOx->CRL;
LDR	R7, [R0, #0]
; tmpreg start address is: 28 (R7)
;stm32f10x_gpio.c,206 :: 		for (pinpos = 0x00; pinpos < 0x08; pinpos++)
; pinpos start address is: 20 (R5)
MOVW	R5, #0
; GPIO_InitStruct end address is: 4 (R1)
; GPIOx end address is: 0 (R0)
; pinpos end address is: 20 (R5)
; currentmode end address is: 24 (R6)
; tmpreg end address is: 28 (R7)
L_GPIO_Init42:
; pinpos start address is: 20 (R5)
; tmpreg start address is: 28 (R7)
; currentmode start address is: 24 (R6)
; GPIO_InitStruct start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
CMP	R5, #8
IT	CS
BCS	L_GPIO_Init43
;stm32f10x_gpio.c,208 :: 		pos = ((uint32_t)0x01) << pinpos;
MOV	R2, #1
LSL	R3, R2, R5
;stm32f10x_gpio.c,210 :: 		currentpin = (GPIO_InitStruct->GPIO_Pin) & pos;
LDRH	R2, [R1, #0]
ANDS	R2, R3
;stm32f10x_gpio.c,211 :: 		if (currentpin == pos)
CMP	R2, R3
IT	NE
BNE	L__GPIO_Init79
;stm32f10x_gpio.c,213 :: 		pos = pinpos << 2;
LSLS	R4, R5, #2
;stm32f10x_gpio.c,215 :: 		pinmask = ((uint32_t)0x0F) << pos;
MOV	R2, #15
LSLS	R2, R4
;stm32f10x_gpio.c,216 :: 		tmpreg &= ~pinmask;
MVN	R2, R2
AND	R3, R7, R2, LSL #0
; tmpreg end address is: 28 (R7)
;stm32f10x_gpio.c,218 :: 		tmpreg |= (currentmode << pos);
LSL	R2, R6, R4
ORR	R2, R3, R2, LSL #0
; tmpreg start address is: 16 (R4)
MOV	R4, R2
;stm32f10x_gpio.c,220 :: 		if (GPIO_InitStruct->GPIO_Mode == GPIO_Mode_IPD)
ADDS	R2, R1, #3
LDRB	R2, [R2, #0]
CMP	R2, #40
IT	NE
BNE	L_GPIO_Init46
;stm32f10x_gpio.c,222 :: 		GPIOx->BRR = (((uint32_t)0x01) << pinpos);
ADDW	R3, R0, #20
MOV	R2, #1
LSLS	R2, R5
STR	R2, [R3, #0]
;stm32f10x_gpio.c,223 :: 		}
IT	AL
BAL	L_GPIO_Init47
L_GPIO_Init46:
;stm32f10x_gpio.c,227 :: 		if (GPIO_InitStruct->GPIO_Mode == GPIO_Mode_IPU)
ADDS	R2, R1, #3
LDRB	R2, [R2, #0]
CMP	R2, #72
IT	NE
BNE	L_GPIO_Init48
;stm32f10x_gpio.c,229 :: 		GPIOx->BSRR = (((uint32_t)0x01) << pinpos);
ADDW	R3, R0, #16
MOV	R2, #1
LSLS	R2, R5
STR	R2, [R3, #0]
;stm32f10x_gpio.c,230 :: 		}
L_GPIO_Init48:
;stm32f10x_gpio.c,231 :: 		}
L_GPIO_Init47:
;stm32f10x_gpio.c,232 :: 		}
MOV	R7, R4
IT	AL
BAL	L_GPIO_Init45
; tmpreg end address is: 16 (R4)
L__GPIO_Init79:
;stm32f10x_gpio.c,211 :: 		if (currentpin == pos)
;stm32f10x_gpio.c,232 :: 		}
L_GPIO_Init45:
;stm32f10x_gpio.c,206 :: 		for (pinpos = 0x00; pinpos < 0x08; pinpos++)
; tmpreg start address is: 28 (R7)
ADDS	R5, R5, #1
;stm32f10x_gpio.c,233 :: 		}
; pinpos end address is: 20 (R5)
IT	AL
BAL	L_GPIO_Init42
L_GPIO_Init43:
;stm32f10x_gpio.c,234 :: 		GPIOx->CRL = tmpreg;
STR	R7, [R0, #0]
; GPIO_InitStruct end address is: 4 (R1)
; GPIOx end address is: 0 (R0)
; currentmode end address is: 24 (R6)
; tmpreg end address is: 28 (R7)
MOV	R5, R1
MOV	R1, R0
;stm32f10x_gpio.c,235 :: 		}
IT	AL
BAL	L_GPIO_Init41
L__GPIO_Init80:
;stm32f10x_gpio.c,203 :: 		if (((uint32_t)GPIO_InitStruct->GPIO_Pin & ((uint32_t)0x00FF)) != 0x00)
MOV	R5, R1
MOV	R1, R0
;stm32f10x_gpio.c,235 :: 		}
L_GPIO_Init41:
;stm32f10x_gpio.c,238 :: 		if (GPIO_InitStruct->GPIO_Pin > 0x00FF)
; currentmode start address is: 24 (R6)
; GPIO_InitStruct start address is: 20 (R5)
; GPIOx start address is: 4 (R1)
LDRH	R2, [R5, #0]
CMP	R2, #255
IT	LS
BLS	L_GPIO_Init49
;stm32f10x_gpio.c,240 :: 		tmpreg = GPIOx->CRH;
ADDS	R2, R1, #4
LDR	R7, [R2, #0]
; tmpreg start address is: 28 (R7)
;stm32f10x_gpio.c,241 :: 		for (pinpos = 0x00; pinpos < 0x08; pinpos++)
; pinpos start address is: 0 (R0)
MOVW	R0, #0
; GPIOx end address is: 4 (R1)
; tmpreg end address is: 28 (R7)
; pinpos end address is: 0 (R0)
L_GPIO_Init50:
; pinpos start address is: 0 (R0)
; tmpreg start address is: 28 (R7)
; GPIOx start address is: 4 (R1)
; GPIO_InitStruct start address is: 20 (R5)
; GPIO_InitStruct end address is: 20 (R5)
; currentmode start address is: 24 (R6)
; currentmode end address is: 24 (R6)
CMP	R0, #8
IT	CS
BCS	L_GPIO_Init51
; GPIO_InitStruct end address is: 20 (R5)
; currentmode end address is: 24 (R6)
;stm32f10x_gpio.c,243 :: 		pos = (((uint32_t)0x01) << (pinpos + 0x08));
; currentmode start address is: 24 (R6)
; GPIO_InitStruct start address is: 20 (R5)
ADDW	R3, R0, #8
MOV	R2, #1
LSL	R3, R2, R3
;stm32f10x_gpio.c,245 :: 		currentpin = ((GPIO_InitStruct->GPIO_Pin) & pos);
LDRH	R2, [R5, #0]
ANDS	R2, R3
;stm32f10x_gpio.c,246 :: 		if (currentpin == pos)
CMP	R2, R3
IT	NE
BNE	L__GPIO_Init81
;stm32f10x_gpio.c,248 :: 		pos = pinpos << 2;
LSLS	R4, R0, #2
;stm32f10x_gpio.c,250 :: 		pinmask = ((uint32_t)0x0F) << pos;
MOV	R2, #15
LSLS	R2, R4
;stm32f10x_gpio.c,251 :: 		tmpreg &= ~pinmask;
MVN	R2, R2
ANDS	R7, R2
; tmpreg end address is: 28 (R7)
;stm32f10x_gpio.c,253 :: 		tmpreg |= (currentmode << pos);
LSL	R2, R6, R4
ORRS	R7, R2
; tmpreg start address is: 28 (R7)
;stm32f10x_gpio.c,255 :: 		if (GPIO_InitStruct->GPIO_Mode == GPIO_Mode_IPD)
ADDS	R2, R5, #3
LDRB	R2, [R2, #0]
CMP	R2, #40
IT	NE
BNE	L_GPIO_Init54
;stm32f10x_gpio.c,257 :: 		GPIOx->BRR = (((uint32_t)0x01) << (pinpos + 0x08));
ADDW	R4, R1, #20
ADDW	R3, R0, #8
MOV	R2, #1
LSLS	R2, R3
STR	R2, [R4, #0]
;stm32f10x_gpio.c,258 :: 		}
L_GPIO_Init54:
;stm32f10x_gpio.c,260 :: 		if (GPIO_InitStruct->GPIO_Mode == GPIO_Mode_IPU)
ADDS	R2, R5, #3
LDRB	R2, [R2, #0]
CMP	R2, #72
IT	NE
BNE	L_GPIO_Init55
;stm32f10x_gpio.c,262 :: 		GPIOx->BSRR = (((uint32_t)0x01) << (pinpos + 0x08));
ADDW	R4, R1, #16
ADDW	R3, R0, #8
MOV	R2, #1
LSLS	R2, R3
STR	R2, [R4, #0]
;stm32f10x_gpio.c,263 :: 		}
L_GPIO_Init55:
;stm32f10x_gpio.c,264 :: 		}
IT	AL
BAL	L_GPIO_Init53
; tmpreg end address is: 28 (R7)
L__GPIO_Init81:
;stm32f10x_gpio.c,246 :: 		if (currentpin == pos)
;stm32f10x_gpio.c,264 :: 		}
L_GPIO_Init53:
;stm32f10x_gpio.c,241 :: 		for (pinpos = 0x00; pinpos < 0x08; pinpos++)
; tmpreg start address is: 28 (R7)
ADDS	R0, R0, #1
;stm32f10x_gpio.c,265 :: 		}
; GPIO_InitStruct end address is: 20 (R5)
; currentmode end address is: 24 (R6)
; pinpos end address is: 0 (R0)
IT	AL
BAL	L_GPIO_Init50
L_GPIO_Init51:
;stm32f10x_gpio.c,266 :: 		GPIOx->CRH = tmpreg;
ADDS	R2, R1, #4
; GPIOx end address is: 4 (R1)
STR	R7, [R2, #0]
; tmpreg end address is: 28 (R7)
;stm32f10x_gpio.c,267 :: 		}
L_GPIO_Init49:
;stm32f10x_gpio.c,268 :: 		}
L_end_GPIO_Init:
BX	LR
; end of _GPIO_Init
_GPIO_StructInit:
;stm32f10x_gpio.c,276 :: 		void GPIO_StructInit(GPIO_InitTypeDef* GPIO_InitStruct)
; GPIO_InitStruct start address is: 0 (R0)
; GPIO_InitStruct end address is: 0 (R0)
; GPIO_InitStruct start address is: 0 (R0)
;stm32f10x_gpio.c,279 :: 		GPIO_InitStruct->GPIO_Pin  = GPIO_Pin_All;
MOVW	R1, #65535
STRH	R1, [R0, #0]
;stm32f10x_gpio.c,280 :: 		GPIO_InitStruct->GPIO_Speed = GPIO_Speed_2MHz;
ADDS	R2, R0, #2
MOVS	R1, #2
STRB	R1, [R2, #0]
;stm32f10x_gpio.c,281 :: 		GPIO_InitStruct->GPIO_Mode = GPIO_Mode_IN_FLOATING;
ADDS	R2, R0, #3
; GPIO_InitStruct end address is: 0 (R0)
MOVS	R1, #4
STRB	R1, [R2, #0]
;stm32f10x_gpio.c,282 :: 		}
L_end_GPIO_StructInit:
BX	LR
; end of _GPIO_StructInit
_GPIO_ReadInputDataBit:
;stm32f10x_gpio.c,291 :: 		uint8_t GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
; GPIO_Pin start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
; GPIO_Pin end address is: 4 (R1)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
; GPIO_Pin start address is: 4 (R1)
;stm32f10x_gpio.c,293 :: 		uint8_t bitstatus = 0x00;
;stm32f10x_gpio.c,299 :: 		if ((GPIOx->IDR & GPIO_Pin) != (uint32_t)Bit_RESET)
ADDW	R2, R0, #8
; GPIOx end address is: 0 (R0)
LDR	R2, [R2, #0]
ANDS	R2, R1
; GPIO_Pin end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_GPIO_ReadInputDataBit56
;stm32f10x_gpio.c,301 :: 		bitstatus = (uint8_t)Bit_SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_gpio.c,302 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_GPIO_ReadInputDataBit57
L_GPIO_ReadInputDataBit56:
;stm32f10x_gpio.c,305 :: 		bitstatus = (uint8_t)Bit_RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_gpio.c,306 :: 		}
L_GPIO_ReadInputDataBit57:
;stm32f10x_gpio.c,307 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_gpio.c,308 :: 		}
L_end_GPIO_ReadInputDataBit:
BX	LR
; end of _GPIO_ReadInputDataBit
_GPIO_ReadInputData:
;stm32f10x_gpio.c,315 :: 		uint16_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
; GPIOx start address is: 0 (R0)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
;stm32f10x_gpio.c,320 :: 		return ((uint16_t)GPIOx->IDR);
ADDW	R1, R0, #8
; GPIOx end address is: 0 (R0)
LDR	R1, [R1, #0]
UXTH	R0, R1
;stm32f10x_gpio.c,321 :: 		}
L_end_GPIO_ReadInputData:
BX	LR
; end of _GPIO_ReadInputData
_GPIO_ReadOutputDataBit:
;stm32f10x_gpio.c,330 :: 		uint8_t GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
; GPIO_Pin start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
; GPIO_Pin end address is: 4 (R1)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
; GPIO_Pin start address is: 4 (R1)
;stm32f10x_gpio.c,332 :: 		uint8_t bitstatus = 0x00;
;stm32f10x_gpio.c,337 :: 		if ((GPIOx->ODR & GPIO_Pin) != (uint32_t)Bit_RESET)
ADDW	R2, R0, #12
; GPIOx end address is: 0 (R0)
LDR	R2, [R2, #0]
ANDS	R2, R1
; GPIO_Pin end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_GPIO_ReadOutputDataBit58
;stm32f10x_gpio.c,339 :: 		bitstatus = (uint8_t)Bit_SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_gpio.c,340 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_GPIO_ReadOutputDataBit59
L_GPIO_ReadOutputDataBit58:
;stm32f10x_gpio.c,343 :: 		bitstatus = (uint8_t)Bit_RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_gpio.c,344 :: 		}
L_GPIO_ReadOutputDataBit59:
;stm32f10x_gpio.c,345 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_gpio.c,346 :: 		}
L_end_GPIO_ReadOutputDataBit:
BX	LR
; end of _GPIO_ReadOutputDataBit
_GPIO_ReadOutputData:
;stm32f10x_gpio.c,353 :: 		uint16_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
; GPIOx start address is: 0 (R0)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
;stm32f10x_gpio.c,358 :: 		return ((uint16_t)GPIOx->ODR);
ADDW	R1, R0, #12
; GPIOx end address is: 0 (R0)
LDR	R1, [R1, #0]
UXTH	R0, R1
;stm32f10x_gpio.c,359 :: 		}
L_end_GPIO_ReadOutputData:
BX	LR
; end of _GPIO_ReadOutputData
_GPIO_SetBits:
;stm32f10x_gpio.c,368 :: 		void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
; GPIO_Pin start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
; GPIO_Pin end address is: 4 (R1)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
; GPIO_Pin start address is: 4 (R1)
;stm32f10x_gpio.c,374 :: 		GPIOx->BSRR = GPIO_Pin;
ADDW	R2, R0, #16
; GPIOx end address is: 0 (R0)
STR	R1, [R2, #0]
; GPIO_Pin end address is: 4 (R1)
;stm32f10x_gpio.c,375 :: 		}
L_end_GPIO_SetBits:
BX	LR
; end of _GPIO_SetBits
_GPIO_ResetBits:
;stm32f10x_gpio.c,384 :: 		void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
; GPIO_Pin start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
; GPIO_Pin end address is: 4 (R1)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
; GPIO_Pin start address is: 4 (R1)
;stm32f10x_gpio.c,390 :: 		GPIOx->BRR = GPIO_Pin;
ADDW	R2, R0, #20
; GPIOx end address is: 0 (R0)
STR	R1, [R2, #0]
; GPIO_Pin end address is: 4 (R1)
;stm32f10x_gpio.c,391 :: 		}
L_end_GPIO_ResetBits:
BX	LR
; end of _GPIO_ResetBits
_GPIO_WriteBit:
;stm32f10x_gpio.c,404 :: 		void GPIO_WriteBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, BitAction BitVal)
; BitVal start address is: 8 (R2)
; GPIO_Pin start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
; BitVal end address is: 8 (R2)
; GPIO_Pin end address is: 4 (R1)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
; GPIO_Pin start address is: 4 (R1)
; BitVal start address is: 8 (R2)
;stm32f10x_gpio.c,411 :: 		if (BitVal != Bit_RESET)
CMP	R2, #0
IT	EQ
BEQ	L_GPIO_WriteBit60
; BitVal end address is: 8 (R2)
;stm32f10x_gpio.c,413 :: 		GPIOx->BSRR = GPIO_Pin;
ADDW	R3, R0, #16
; GPIOx end address is: 0 (R0)
STR	R1, [R3, #0]
; GPIO_Pin end address is: 4 (R1)
;stm32f10x_gpio.c,414 :: 		}
IT	AL
BAL	L_GPIO_WriteBit61
L_GPIO_WriteBit60:
;stm32f10x_gpio.c,417 :: 		GPIOx->BRR = GPIO_Pin;
; GPIO_Pin start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
ADDW	R3, R0, #20
; GPIOx end address is: 0 (R0)
STR	R1, [R3, #0]
; GPIO_Pin end address is: 4 (R1)
;stm32f10x_gpio.c,418 :: 		}
L_GPIO_WriteBit61:
;stm32f10x_gpio.c,419 :: 		}
L_end_GPIO_WriteBit:
BX	LR
; end of _GPIO_WriteBit
_GPIO_Write:
;stm32f10x_gpio.c,427 :: 		void GPIO_Write(GPIO_TypeDef* GPIOx, uint16_t PortVal)
; PortVal start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
; PortVal end address is: 4 (R1)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
; PortVal start address is: 4 (R1)
;stm32f10x_gpio.c,432 :: 		GPIOx->ODR = PortVal;
ADDW	R2, R0, #12
; GPIOx end address is: 0 (R0)
STR	R1, [R2, #0]
; PortVal end address is: 4 (R1)
;stm32f10x_gpio.c,433 :: 		}
L_end_GPIO_Write:
BX	LR
; end of _GPIO_Write
_GPIO_PinLockConfig:
;stm32f10x_gpio.c,442 :: 		void GPIO_PinLockConfig(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
; GPIO_Pin start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
; GPIO_Pin end address is: 4 (R1)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
; GPIO_Pin start address is: 4 (R1)
;stm32f10x_gpio.c,444 :: 		uint32_t tmp = 0x00010000;
; tmp start address is: 8 (R2)
MOV	R2, #65536
;stm32f10x_gpio.c,450 :: 		tmp |= GPIO_Pin;
ORR	R3, R2, R1, LSL #0
; tmp end address is: 8 (R2)
; tmp start address is: 16 (R4)
MOV	R4, R3
;stm32f10x_gpio.c,452 :: 		GPIOx->LCKR = tmp;
ADDW	R2, R0, #24
STR	R3, [R2, #0]
;stm32f10x_gpio.c,454 :: 		GPIOx->LCKR =  GPIO_Pin;
ADDW	R2, R0, #24
STR	R1, [R2, #0]
; GPIO_Pin end address is: 4 (R1)
;stm32f10x_gpio.c,456 :: 		GPIOx->LCKR = tmp;
ADDW	R2, R0, #24
; GPIOx end address is: 0 (R0)
STR	R4, [R2, #0]
; tmp end address is: 16 (R4)
;stm32f10x_gpio.c,461 :: 		}
L_end_GPIO_PinLockConfig:
BX	LR
; end of _GPIO_PinLockConfig
_GPIO_EventOutputConfig:
;stm32f10x_gpio.c,472 :: 		void GPIO_EventOutputConfig(uint8_t GPIO_PortSource, uint8_t GPIO_PinSource)
; GPIO_PinSource start address is: 4 (R1)
; GPIO_PortSource start address is: 0 (R0)
; GPIO_PinSource end address is: 4 (R1)
; GPIO_PortSource end address is: 0 (R0)
; GPIO_PortSource start address is: 0 (R0)
; GPIO_PinSource start address is: 4 (R1)
;stm32f10x_gpio.c,474 :: 		uint32_t tmpreg = 0x00;
;stm32f10x_gpio.c,481 :: 		tmpreg &= EVCR_PORTPINCONFIG_MASK;
MOVW	R4, #0
MOVT	R4, #16385
LDR	R3, [R4, #0]
MOVW	R2, #65408
ANDS	R3, R2
;stm32f10x_gpio.c,482 :: 		tmpreg |= (uint32_t)GPIO_PortSource << 0x04;
UXTB	R2, R0
; GPIO_PortSource end address is: 0 (R0)
LSLS	R2, R2, #4
ORR	R2, R3, R2, LSL #0
;stm32f10x_gpio.c,483 :: 		tmpreg |= GPIO_PinSource;
ORRS	R2, R1
; GPIO_PinSource end address is: 4 (R1)
;stm32f10x_gpio.c,484 :: 		AFIO->EVCR = tmpreg;
STR	R2, [R4, #0]
;stm32f10x_gpio.c,485 :: 		}
L_end_GPIO_EventOutputConfig:
BX	LR
; end of _GPIO_EventOutputConfig
_GPIO_EventOutputCmd:
;stm32f10x_gpio.c,493 :: 		void GPIO_EventOutputCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f10x_gpio.c,498 :: 		*(__IO uint32_t *) EVCR_EVOE_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1109393436
MOVT	R1, 16928
STR	R2, [R1, #0]
;stm32f10x_gpio.c,499 :: 		}
L_end_GPIO_EventOutputCmd:
BX	LR
; end of _GPIO_EventOutputCmd
_GPIO_PinRemapConfig:
;stm32f10x_gpio.c,559 :: 		void GPIO_PinRemapConfig(uint32_t GPIO_Remap, FunctionalState NewState)
; NewState start address is: 4 (R1)
; GPIO_Remap start address is: 0 (R0)
; NewState end address is: 4 (R1)
; GPIO_Remap end address is: 0 (R0)
; GPIO_Remap start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_gpio.c,561 :: 		uint32_t tmp = 0x00, tmp1 = 0x00, tmpreg = 0x00, tmpmask = 0x00;
;stm32f10x_gpio.c,567 :: 		if((GPIO_Remap & 0x80000000) == 0x80000000)
AND	R2, R0, #-2147483648
CMP	R2, #-2147483648
IT	NE
BNE	L_GPIO_PinRemapConfig62
;stm32f10x_gpio.c,569 :: 		tmpreg = AFIO->MAPR2;
MOVW	R2, #28
MOVT	R2, #16385
; tmpreg start address is: 12 (R3)
LDR	R3, [R2, #0]
;stm32f10x_gpio.c,570 :: 		}
; tmpreg end address is: 12 (R3)
IT	AL
BAL	L_GPIO_PinRemapConfig63
L_GPIO_PinRemapConfig62:
;stm32f10x_gpio.c,573 :: 		tmpreg = AFIO->MAPR;
MOVW	R2, #4
MOVT	R2, #16385
; tmpreg start address is: 12 (R3)
LDR	R3, [R2, #0]
; tmpreg end address is: 12 (R3)
;stm32f10x_gpio.c,574 :: 		}
L_GPIO_PinRemapConfig63:
;stm32f10x_gpio.c,576 :: 		tmpmask = (GPIO_Remap & DBGAFR_POSITION_MASK) >> 0x10;
; tmpreg start address is: 12 (R3)
AND	R2, R0, #983040
LSRS	R2, R2, #16
; tmpmask start address is: 16 (R4)
MOV	R4, R2
;stm32f10x_gpio.c,577 :: 		tmp = GPIO_Remap & LSB_MASK;
MOVW	R2, #65535
AND	R2, R0, R2, LSL #0
; tmp start address is: 20 (R5)
MOV	R5, R2
;stm32f10x_gpio.c,579 :: 		if ((GPIO_Remap & (DBGAFR_LOCATION_MASK | DBGAFR_NUMBITS_MASK)) == (DBGAFR_LOCATION_MASK | DBGAFR_NUMBITS_MASK))
AND	R2, R0, #3145728
CMP	R2, #3145728
IT	NE
BNE	L_GPIO_PinRemapConfig64
; tmpmask end address is: 16 (R4)
;stm32f10x_gpio.c,581 :: 		tmpreg &= DBGAFR_SWJCFG_MASK;
MVN	R2, #251658240
AND	R2, R3, R2, LSL #0
; tmpreg end address is: 12 (R3)
; tmpreg start address is: 24 (R6)
MOV	R6, R2
;stm32f10x_gpio.c,582 :: 		AFIO->MAPR &= DBGAFR_SWJCFG_MASK;
MOVW	R4, #4
MOVT	R4, #16385
LDR	R3, [R4, #0]
MVN	R2, #251658240
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_gpio.c,583 :: 		}
MOV	R3, R6
; tmpreg end address is: 24 (R6)
IT	AL
BAL	L_GPIO_PinRemapConfig65
L_GPIO_PinRemapConfig64:
;stm32f10x_gpio.c,584 :: 		else if ((GPIO_Remap & DBGAFR_NUMBITS_MASK) == DBGAFR_NUMBITS_MASK)
; tmpreg start address is: 12 (R3)
; tmpmask start address is: 16 (R4)
AND	R2, R0, #1048576
CMP	R2, #1048576
IT	NE
BNE	L_GPIO_PinRemapConfig66
;stm32f10x_gpio.c,586 :: 		tmp1 = ((uint32_t)0x03) << tmpmask;
MOV	R2, #3
LSLS	R2, R4
; tmpmask end address is: 16 (R4)
;stm32f10x_gpio.c,587 :: 		tmpreg &= ~tmp1;
MVN	R2, R2
AND	R2, R3, R2, LSL #0
; tmpreg end address is: 12 (R3)
;stm32f10x_gpio.c,588 :: 		tmpreg |= ~DBGAFR_SWJCFG_MASK;
ORR	R2, R2, #251658240
; tmpreg start address is: 8 (R2)
;stm32f10x_gpio.c,589 :: 		}
MOV	R3, R2
; tmpreg end address is: 8 (R2)
IT	AL
BAL	L_GPIO_PinRemapConfig67
L_GPIO_PinRemapConfig66:
;stm32f10x_gpio.c,592 :: 		tmpreg &= ~(tmp << ((GPIO_Remap >> 0x15)*0x10));
; tmpreg start address is: 12 (R3)
LSRS	R2, R0, #21
LSLS	R2, R2, #4
LSL	R2, R5, R2
MVN	R2, R2
ANDS	R3, R2
; tmpreg end address is: 12 (R3)
;stm32f10x_gpio.c,593 :: 		tmpreg |= ~DBGAFR_SWJCFG_MASK;
ORR	R3, R3, #251658240
; tmpreg start address is: 12 (R3)
; tmpreg end address is: 12 (R3)
;stm32f10x_gpio.c,594 :: 		}
L_GPIO_PinRemapConfig67:
; tmpreg start address is: 12 (R3)
; tmpreg end address is: 12 (R3)
L_GPIO_PinRemapConfig65:
;stm32f10x_gpio.c,596 :: 		if (NewState != DISABLE)
; tmpreg start address is: 12 (R3)
CMP	R1, #0
IT	EQ
BEQ	L__GPIO_PinRemapConfig82
; NewState end address is: 4 (R1)
;stm32f10x_gpio.c,598 :: 		tmpreg |= (tmp << ((GPIO_Remap >> 0x15)*0x10));
LSRS	R2, R0, #21
LSLS	R2, R2, #4
LSL	R2, R5, R2
; tmp end address is: 20 (R5)
ORR	R1, R3, R2, LSL #0
; tmpreg end address is: 12 (R3)
; tmpreg start address is: 4 (R1)
; tmpreg end address is: 4 (R1)
;stm32f10x_gpio.c,599 :: 		}
IT	AL
BAL	L_GPIO_PinRemapConfig68
L__GPIO_PinRemapConfig82:
;stm32f10x_gpio.c,596 :: 		if (NewState != DISABLE)
MOV	R1, R3
;stm32f10x_gpio.c,599 :: 		}
L_GPIO_PinRemapConfig68:
;stm32f10x_gpio.c,601 :: 		if((GPIO_Remap & 0x80000000) == 0x80000000)
; tmpreg start address is: 4 (R1)
AND	R2, R0, #-2147483648
; GPIO_Remap end address is: 0 (R0)
CMP	R2, #-2147483648
IT	NE
BNE	L_GPIO_PinRemapConfig69
;stm32f10x_gpio.c,603 :: 		AFIO->MAPR2 = tmpreg;
MOVW	R2, #28
MOVT	R2, #16385
STR	R1, [R2, #0]
; tmpreg end address is: 4 (R1)
;stm32f10x_gpio.c,604 :: 		}
IT	AL
BAL	L_GPIO_PinRemapConfig70
L_GPIO_PinRemapConfig69:
;stm32f10x_gpio.c,607 :: 		AFIO->MAPR = tmpreg;
; tmpreg start address is: 4 (R1)
MOVW	R2, #4
MOVT	R2, #16385
STR	R1, [R2, #0]
; tmpreg end address is: 4 (R1)
;stm32f10x_gpio.c,608 :: 		}
L_GPIO_PinRemapConfig70:
;stm32f10x_gpio.c,609 :: 		}
L_end_GPIO_PinRemapConfig:
BX	LR
; end of _GPIO_PinRemapConfig
_GPIO_EXTILineConfig:
;stm32f10x_gpio.c,619 :: 		void GPIO_EXTILineConfig(uint8_t GPIO_PortSource, uint8_t GPIO_PinSource)
; GPIO_PinSource start address is: 4 (R1)
; GPIO_PortSource start address is: 0 (R0)
; GPIO_PinSource end address is: 4 (R1)
; GPIO_PortSource end address is: 0 (R0)
; GPIO_PortSource start address is: 0 (R0)
; GPIO_PinSource start address is: 4 (R1)
;stm32f10x_gpio.c,621 :: 		uint32_t tmp = 0x00;
;stm32f10x_gpio.c,626 :: 		tmp = ((uint32_t)0x0F) << (0x04 * (GPIO_PinSource & (uint8_t)0x03));
AND	R2, R1, #3
UXTB	R2, R2
LSLS	R3, R2, #2
SXTH	R3, R3
MOV	R2, #15
LSL	R5, R2, R3
;stm32f10x_gpio.c,627 :: 		AFIO->EXTICR[GPIO_PinSource >> 0x02] &= ~tmp;
LSRS	R2, R1, #2
UXTB	R2, R2
LSLS	R3, R2, #2
MOVW	R2, #8
MOVT	R2, #16385
ADDS	R4, R2, R3
MVN	R3, R5
LDR	R2, [R4, #0]
ANDS	R2, R3
STR	R2, [R4, #0]
;stm32f10x_gpio.c,628 :: 		AFIO->EXTICR[GPIO_PinSource >> 0x02] |= (((uint32_t)GPIO_PortSource) << (0x04 * (GPIO_PinSource & (uint8_t)0x03)));
LSRS	R2, R1, #2
UXTB	R2, R2
LSLS	R3, R2, #2
MOVW	R2, #8
MOVT	R2, #16385
ADDS	R4, R2, R3
UXTB	R3, R0
; GPIO_PortSource end address is: 0 (R0)
AND	R2, R1, #3
UXTB	R2, R2
; GPIO_PinSource end address is: 4 (R1)
LSLS	R2, R2, #2
SXTH	R2, R2
LSLS	R3, R2
LDR	R2, [R4, #0]
ORRS	R2, R3
STR	R2, [R4, #0]
;stm32f10x_gpio.c,629 :: 		}
L_end_GPIO_EXTILineConfig:
BX	LR
; end of _GPIO_EXTILineConfig
_GPIO_ETH_MediaInterfaceConfig:
;stm32f10x_gpio.c,640 :: 		void GPIO_ETH_MediaInterfaceConfig(uint32_t GPIO_ETH_MediaInterface)
; GPIO_ETH_MediaInterface start address is: 0 (R0)
; GPIO_ETH_MediaInterface end address is: 0 (R0)
; GPIO_ETH_MediaInterface start address is: 0 (R0)
;stm32f10x_gpio.c,645 :: 		*(__IO uint32_t *) MAPR_MII_RMII_SEL_BB = GPIO_ETH_MediaInterface;
MOVW	R1, 1109393628
MOVT	R1, 16928
STR	R0, [R1, #0]
; GPIO_ETH_MediaInterface end address is: 0 (R0)
;stm32f10x_gpio.c,646 :: 		}
L_end_GPIO_ETH_MediaInterfaceConfig:
BX	LR
; end of _GPIO_ETH_MediaInterfaceConfig
