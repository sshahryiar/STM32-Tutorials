stm32f10x_flash_NVIC_SetPriorityGrouping:
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
; end of stm32f10x_flash_NVIC_SetPriorityGrouping
stm32f10x_flash_NVIC_GetPriorityGrouping:
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
; end of stm32f10x_flash_NVIC_GetPriorityGrouping
stm32f10x_flash_NVIC_EnableIRQ:
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
; end of stm32f10x_flash_NVIC_EnableIRQ
stm32f10x_flash_NVIC_DisableIRQ:
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
; end of stm32f10x_flash_NVIC_DisableIRQ
stm32f10x_flash_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f10x_flash_NVIC_GetPendingIRQ0
; ?FLOC__stm32f10x_flash_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_flash_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_flash_NVIC_GetPendingIRQ1
L_stm32f10x_flash_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f10x_flash_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_flash_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
L_stm32f10x_flash_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f10x_flash_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_flash_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1593 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f10x_flash_NVIC_GetPendingIRQ
stm32f10x_flash_NVIC_SetPendingIRQ:
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
; end of stm32f10x_flash_NVIC_SetPendingIRQ
stm32f10x_flash_NVIC_ClearPendingIRQ:
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
; end of stm32f10x_flash_NVIC_ClearPendingIRQ
stm32f10x_flash_NVIC_GetActive:
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
BEQ	L_stm32f10x_flash_NVIC_GetActive2
; ?FLOC__stm32f10x_flash_NVIC_GetActive?T72 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_flash_NVIC_GetActive?T72 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_flash_NVIC_GetActive3
L_stm32f10x_flash_NVIC_GetActive2:
; ?FLOC__stm32f10x_flash_NVIC_GetActive?T72 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_flash_NVIC_GetActive?T72 end address is: 0 (R0)
L_stm32f10x_flash_NVIC_GetActive3:
; ?FLOC__stm32f10x_flash_NVIC_GetActive?T72 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_flash_NVIC_GetActive?T72 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1633 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f10x_flash_NVIC_GetActive
stm32f10x_flash_NVIC_SetPriority:
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
BGE	L_stm32f10x_flash_NVIC_SetPriority4
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
BAL	L_stm32f10x_flash_NVIC_SetPriority5
L_stm32f10x_flash_NVIC_SetPriority4:
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
L_stm32f10x_flash_NVIC_SetPriority5:
;core_cm3.h,1653 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f10x_flash_NVIC_SetPriority
stm32f10x_flash_NVIC_GetPriority:
;core_cm3.h,1670 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1673 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f10x_flash_NVIC_GetPriority6
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
L_stm32f10x_flash_NVIC_GetPriority6:
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
; end of stm32f10x_flash_NVIC_GetPriority
stm32f10x_flash_NVIC_EncodePriority:
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
BLS	L_stm32f10x_flash_NVIC_EncodePriority8
; ?FLOC__stm32f10x_flash_NVIC_EncodePriority?T112 start address is: 12 (R3)
MOVW	R3, #4
; ?FLOC__stm32f10x_flash_NVIC_EncodePriority?T112 end address is: 12 (R3)
IT	AL
BAL	L_stm32f10x_flash_NVIC_EncodePriority9
L_stm32f10x_flash_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f10x_flash_NVIC_EncodePriority?T112 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_flash_NVIC_EncodePriority?T112 end address is: 0 (R0)
MOV	R3, R0
L_stm32f10x_flash_NVIC_EncodePriority9:
; ?FLOC__stm32f10x_flash_NVIC_EncodePriority?T112 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_flash_NVIC_EncodePriority?T112 end address is: 12 (R3)
;core_cm3.h,1702 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f10x_flash_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f10x_flash_NVIC_EncodePriority?T116 start address is: 20 (R5)
MOVW	R5, #0
; ?FLOC__stm32f10x_flash_NVIC_EncodePriority?T116 end address is: 20 (R5)
IT	AL
BAL	L_stm32f10x_flash_NVIC_EncodePriority11
L_stm32f10x_flash_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f10x_flash_NVIC_EncodePriority?T116 start address is: 20 (R5)
; ?FLOC__stm32f10x_flash_NVIC_EncodePriority?T116 end address is: 20 (R5)
L_stm32f10x_flash_NVIC_EncodePriority11:
;core_cm3.h,1705 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f10x_flash_NVIC_EncodePriority?T116 start address is: 20 (R5)
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
; ?FLOC__stm32f10x_flash_NVIC_EncodePriority?T116 end address is: 20 (R5)
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
; end of stm32f10x_flash_NVIC_EncodePriority
stm32f10x_flash_NVIC_DecodePriority:
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
BLS	L_stm32f10x_flash_NVIC_DecodePriority12
; ?FLOC__stm32f10x_flash_NVIC_DecodePriority?T130 start address is: 16 (R4)
MOVW	R4, #4
; ?FLOC__stm32f10x_flash_NVIC_DecodePriority?T130 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_flash_NVIC_DecodePriority13
L_stm32f10x_flash_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f10x_flash_NVIC_DecodePriority?T130 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_flash_NVIC_DecodePriority?T130 end address is: 4 (R1)
MOV	R4, R1
L_stm32f10x_flash_NVIC_DecodePriority13:
; ?FLOC__stm32f10x_flash_NVIC_DecodePriority?T130 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_flash_NVIC_DecodePriority?T130 end address is: 16 (R4)
;core_cm3.h,1733 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f10x_flash_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f10x_flash_NVIC_DecodePriority?T134 start address is: 16 (R4)
MOVW	R4, #0
; ?FLOC__stm32f10x_flash_NVIC_DecodePriority?T134 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_flash_NVIC_DecodePriority15
L_stm32f10x_flash_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f10x_flash_NVIC_DecodePriority?T134 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f10x_flash_NVIC_DecodePriority?T134 end address is: 20 (R5)
MOV	R4, R5
L_stm32f10x_flash_NVIC_DecodePriority15:
; ?FLOC__stm32f10x_flash_NVIC_DecodePriority?T134 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm3.h,1735 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f10x_flash_NVIC_DecodePriority?T134 end address is: 16 (R4)
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
; end of stm32f10x_flash_NVIC_DecodePriority
stm32f10x_flash_SysTick_Config:
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
BLS	L_stm32f10x_flash_SysTick_Config16
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f10x_flash_SysTick_Config16:
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
BL	stm32f10x_flash_NVIC_SetPriority+0
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
; end of stm32f10x_flash_SysTick_Config
stm32f10x_flash_NVIC_SystemReset:
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
L_stm32f10x_flash_NVIC_SystemReset17:
IT	AL
BAL	L_stm32f10x_flash_NVIC_SystemReset17
;core_cm3.h,1787 :: 		}
L_end_NVIC_SystemReset:
BX	LR
; end of stm32f10x_flash_NVIC_SystemReset
stm32f10x_flash_ITM_SendChar:
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
BEQ	L_stm32f10x_flash_ITM_SendChar101
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_flash_ITM_SendChar102
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_flash_ITM_SendChar103
L_stm32f10x_flash_ITM_SendChar97:
;core_cm3.h,1823 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f10x_flash_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f10x_flash_ITM_SendChar23
IT	AL
BAL	L_stm32f10x_flash_ITM_SendChar22
L_stm32f10x_flash_ITM_SendChar23:
;core_cm3.h,1824 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm3.h,1820 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f10x_flash_ITM_SendChar100
L_stm32f10x_flash_ITM_SendChar101:
L_stm32f10x_flash_ITM_SendChar100:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_flash_ITM_SendChar99
L_stm32f10x_flash_ITM_SendChar102:
L_stm32f10x_flash_ITM_SendChar99:
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_flash_ITM_SendChar98
L_stm32f10x_flash_ITM_SendChar103:
L_stm32f10x_flash_ITM_SendChar98:
;core_cm3.h,1826 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm3.h,1827 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f10x_flash_ITM_SendChar
stm32f10x_flash_ITM_ReceiveChar:
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
BEQ	L_stm32f10x_flash_ITM_ReceiveChar24
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
L_stm32f10x_flash_ITM_ReceiveChar24:
;core_cm3.h,1847 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm3.h,1848 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f10x_flash_ITM_ReceiveChar
stm32f10x_flash_ITM_CheckChar:
;core_cm3.h,1859 :: 		static __INLINE int ITM_CheckChar (void) {
;core_cm3.h,1861 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f10x_flash_ITM_CheckChar25
;core_cm3.h,1862 :: 		return (0);                                 /* no character available */
MOVW	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm3.h,1863 :: 		} else {
L_stm32f10x_flash_ITM_CheckChar25:
;core_cm3.h,1864 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm3.h,1866 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f10x_flash_ITM_CheckChar
_FLASH_SetLatency:
;stm32f10x_flash.c,254 :: 		void FLASH_SetLatency(uint32_t FLASH_Latency)
; FLASH_Latency start address is: 0 (R0)
; FLASH_Latency end address is: 0 (R0)
; FLASH_Latency start address is: 0 (R0)
;stm32f10x_flash.c,256 :: 		uint32_t tmpreg = 0;
;stm32f10x_flash.c,265 :: 		tmpreg &= ACR_LATENCY_Mask;
MOVW	R2, #8192
MOVT	R2, #16386
LDR	R1, [R2, #0]
AND	R1, R1, #56
;stm32f10x_flash.c,266 :: 		tmpreg |= FLASH_Latency;
ORRS	R1, R0
; FLASH_Latency end address is: 0 (R0)
;stm32f10x_flash.c,269 :: 		FLASH->ACR = tmpreg;
STR	R1, [R2, #0]
;stm32f10x_flash.c,270 :: 		}
L_end_FLASH_SetLatency:
BX	LR
; end of _FLASH_SetLatency
_FLASH_HalfCycleAccessCmd:
;stm32f10x_flash.c,281 :: 		void FLASH_HalfCycleAccessCmd(uint32_t FLASH_HalfCycleAccess)
; FLASH_HalfCycleAccess start address is: 0 (R0)
; FLASH_HalfCycleAccess end address is: 0 (R0)
; FLASH_HalfCycleAccess start address is: 0 (R0)
;stm32f10x_flash.c,287 :: 		FLASH->ACR &= ACR_HLFCYA_Mask;
MOVW	R3, #8192
MOVT	R3, #16386
LDR	R2, [R3, #0]
MVN	R1, #8
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f10x_flash.c,288 :: 		FLASH->ACR |= FLASH_HalfCycleAccess;
ORRS	R1, R0
; FLASH_HalfCycleAccess end address is: 0 (R0)
STR	R1, [R3, #0]
;stm32f10x_flash.c,289 :: 		}
L_end_FLASH_HalfCycleAccessCmd:
BX	LR
; end of _FLASH_HalfCycleAccessCmd
_FLASH_PrefetchBufferCmd:
;stm32f10x_flash.c,300 :: 		void FLASH_PrefetchBufferCmd(uint32_t FLASH_PrefetchBuffer)
; FLASH_PrefetchBuffer start address is: 0 (R0)
; FLASH_PrefetchBuffer end address is: 0 (R0)
; FLASH_PrefetchBuffer start address is: 0 (R0)
;stm32f10x_flash.c,306 :: 		FLASH->ACR &= ACR_PRFTBE_Mask;
MOVW	R3, #8192
MOVT	R3, #16386
LDR	R2, [R3, #0]
MVN	R1, #16
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f10x_flash.c,307 :: 		FLASH->ACR |= FLASH_PrefetchBuffer;
ORRS	R1, R0
; FLASH_PrefetchBuffer end address is: 0 (R0)
STR	R1, [R3, #0]
;stm32f10x_flash.c,308 :: 		}
L_end_FLASH_PrefetchBufferCmd:
BX	LR
; end of _FLASH_PrefetchBufferCmd
_FLASH_Unlock:
;stm32f10x_flash.c,319 :: 		void FLASH_Unlock(void)
;stm32f10x_flash.c,322 :: 		FLASH->KEYR = FLASH_KEY1;
MOVW	R0, #291
MOVT	R0, #17767
MOVW	R1, #8196
MOVT	R1, #16386
STR	R0, [R1, #0]
;stm32f10x_flash.c,323 :: 		FLASH->KEYR = FLASH_KEY2;
MOVW	R0, #35243
MOVT	R0, #52719
STR	R0, [R1, #0]
;stm32f10x_flash.c,330 :: 		}
L_end_FLASH_Unlock:
BX	LR
; end of _FLASH_Unlock
_FLASH_UnlockBank1:
;stm32f10x_flash.c,340 :: 		void FLASH_UnlockBank1(void)
;stm32f10x_flash.c,343 :: 		FLASH->KEYR = FLASH_KEY1;
MOVW	R0, #291
MOVT	R0, #17767
MOVW	R1, #8196
MOVT	R1, #16386
STR	R0, [R1, #0]
;stm32f10x_flash.c,344 :: 		FLASH->KEYR = FLASH_KEY2;
MOVW	R0, #35243
MOVT	R0, #52719
STR	R0, [R1, #0]
;stm32f10x_flash.c,345 :: 		}
L_end_FLASH_UnlockBank1:
BX	LR
; end of _FLASH_UnlockBank1
_FLASH_Lock:
;stm32f10x_flash.c,372 :: 		void FLASH_Lock(void)
;stm32f10x_flash.c,375 :: 		FLASH->CR |= CR_LOCK_Set;
MOVW	R1, #8208
MOVT	R1, #16386
LDR	R0, [R1, #0]
ORR	R0, R0, #128
STR	R0, [R1, #0]
;stm32f10x_flash.c,381 :: 		}
L_end_FLASH_Lock:
BX	LR
; end of _FLASH_Lock
_FLASH_LockBank1:
;stm32f10x_flash.c,392 :: 		void FLASH_LockBank1(void)
;stm32f10x_flash.c,395 :: 		FLASH->CR |= CR_LOCK_Set;
MOVW	R1, #8208
MOVT	R1, #16386
LDR	R0, [R1, #0]
ORR	R0, R0, #128
STR	R0, [R1, #0]
;stm32f10x_flash.c,396 :: 		}
L_end_FLASH_LockBank1:
BX	LR
; end of _FLASH_LockBank1
_FLASH_ErasePage:
;stm32f10x_flash.c,419 :: 		FLASH_Status FLASH_ErasePage(uint32_t Page_Address)
; Page_Address start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R4, R0
; Page_Address end address is: 0 (R0)
; Page_Address start address is: 16 (R4)
;stm32f10x_flash.c,421 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f10x_flash.c,464 :: 		status = FLASH_WaitForLastOperation(EraseTimeout);
MOV	R0, #720896
BL	_FLASH_WaitForLastOperation+0
; status start address is: 4 (R1)
UXTB	R1, R0
;stm32f10x_flash.c,466 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #4
IT	NE
BNE	L__FLASH_ErasePage108
; status end address is: 4 (R1)
;stm32f10x_flash.c,469 :: 		FLASH->CR|= CR_PER_Set;
MOVW	R3, #8208
MOVT	R3, #16386
LDR	R1, [R3, #0]
ORR	R2, R1, #2
STR	R2, [R3, #0]
;stm32f10x_flash.c,470 :: 		FLASH->AR = Page_Address;
MOVW	R1, #8212
MOVT	R1, #16386
STR	R4, [R1, #0]
; Page_Address end address is: 16 (R4)
;stm32f10x_flash.c,471 :: 		FLASH->CR|= CR_STRT_Set;
ORR	R1, R2, #64
STR	R1, [R3, #0]
;stm32f10x_flash.c,474 :: 		status = FLASH_WaitForLastOperation(EraseTimeout);
MOV	R0, #720896
BL	_FLASH_WaitForLastOperation+0
; status start address is: 0 (R0)
;stm32f10x_flash.c,477 :: 		FLASH->CR &= CR_PER_Reset;
MOVW	R3, #8208
MOVT	R3, #16386
LDR	R2, [R3, #0]
MOVW	R1, #8189
MOVT	R1, #0
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
; status end address is: 0 (R0)
;stm32f10x_flash.c,478 :: 		}
IT	AL
BAL	L_FLASH_ErasePage27
L__FLASH_ErasePage108:
;stm32f10x_flash.c,466 :: 		if(status == FLASH_COMPLETE)
UXTB	R0, R1
;stm32f10x_flash.c,478 :: 		}
L_FLASH_ErasePage27:
;stm32f10x_flash.c,482 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f10x_flash.c,483 :: 		}
L_end_FLASH_ErasePage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_ErasePage
_FLASH_EraseAllPages:
;stm32f10x_flash.c,492 :: 		FLASH_Status FLASH_EraseAllPages(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;stm32f10x_flash.c,494 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f10x_flash.c,526 :: 		status = FLASH_WaitForLastOperation(EraseTimeout);
MOV	R0, #720896
BL	_FLASH_WaitForLastOperation+0
; status start address is: 4 (R1)
UXTB	R1, R0
;stm32f10x_flash.c,527 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #4
IT	NE
BNE	L__FLASH_EraseAllPages109
; status end address is: 4 (R1)
;stm32f10x_flash.c,530 :: 		FLASH->CR |= CR_MER_Set;
MOVW	R1, #8208
MOVT	R1, #16386
LDR	R0, [R1, #0]
ORR	R0, R0, #4
STR	R0, [R1, #0]
;stm32f10x_flash.c,531 :: 		FLASH->CR |= CR_STRT_Set;
ORR	R0, R0, #64
STR	R0, [R1, #0]
;stm32f10x_flash.c,534 :: 		status = FLASH_WaitForLastOperation(EraseTimeout);
MOV	R0, #720896
BL	_FLASH_WaitForLastOperation+0
; status start address is: 12 (R3)
UXTB	R3, R0
;stm32f10x_flash.c,537 :: 		FLASH->CR &= CR_MER_Reset;
MOVW	R2, #8208
MOVT	R2, #16386
LDR	R1, [R2, #0]
MOVW	R0, #8187
MOVT	R0, #0
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
; status end address is: 12 (R3)
UXTB	R0, R3
;stm32f10x_flash.c,538 :: 		}
IT	AL
BAL	L_FLASH_EraseAllPages28
L__FLASH_EraseAllPages109:
;stm32f10x_flash.c,527 :: 		if(status == FLASH_COMPLETE)
UXTB	R0, R1
;stm32f10x_flash.c,538 :: 		}
L_FLASH_EraseAllPages28:
;stm32f10x_flash.c,542 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f10x_flash.c,543 :: 		}
L_end_FLASH_EraseAllPages:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_EraseAllPages
_FLASH_EraseAllBank1Pages:
;stm32f10x_flash.c,555 :: 		FLASH_Status FLASH_EraseAllBank1Pages(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;stm32f10x_flash.c,557 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f10x_flash.c,559 :: 		status = FLASH_WaitForLastBank1Operation(EraseTimeout);
MOV	R0, #720896
BL	_FLASH_WaitForLastBank1Operation+0
; status start address is: 4 (R1)
UXTB	R1, R0
;stm32f10x_flash.c,561 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #4
IT	NE
BNE	L__FLASH_EraseAllBank1Pages114
; status end address is: 4 (R1)
;stm32f10x_flash.c,564 :: 		FLASH->CR |= CR_MER_Set;
MOVW	R1, #8208
MOVT	R1, #16386
LDR	R0, [R1, #0]
ORR	R0, R0, #4
STR	R0, [R1, #0]
;stm32f10x_flash.c,565 :: 		FLASH->CR |= CR_STRT_Set;
ORR	R0, R0, #64
STR	R0, [R1, #0]
;stm32f10x_flash.c,568 :: 		status = FLASH_WaitForLastBank1Operation(EraseTimeout);
MOV	R0, #720896
BL	_FLASH_WaitForLastBank1Operation+0
; status start address is: 12 (R3)
UXTB	R3, R0
;stm32f10x_flash.c,571 :: 		FLASH->CR &= CR_MER_Reset;
MOVW	R2, #8208
MOVT	R2, #16386
LDR	R1, [R2, #0]
MOVW	R0, #8187
MOVT	R0, #0
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
; status end address is: 12 (R3)
UXTB	R0, R3
;stm32f10x_flash.c,572 :: 		}
IT	AL
BAL	L_FLASH_EraseAllBank1Pages29
L__FLASH_EraseAllBank1Pages114:
;stm32f10x_flash.c,561 :: 		if(status == FLASH_COMPLETE)
UXTB	R0, R1
;stm32f10x_flash.c,572 :: 		}
L_FLASH_EraseAllBank1Pages29:
;stm32f10x_flash.c,574 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f10x_flash.c,575 :: 		}
L_end_FLASH_EraseAllBank1Pages:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_EraseAllBank1Pages
_FLASH_EraseOptionBytes:
;stm32f10x_flash.c,616 :: 		FLASH_Status FLASH_EraseOptionBytes(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;stm32f10x_flash.c,618 :: 		uint16_t rdptmp = RDP_Key;
; rdptmp start address is: 12 (R3)
MOVW	R3, #165
;stm32f10x_flash.c,620 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f10x_flash.c,623 :: 		if(FLASH_GetReadOutProtectionStatus() != RESET)
BL	_FLASH_GetReadOutProtectionStatus+0
CMP	R0, #0
IT	EQ
BEQ	L__FLASH_EraseOptionBytes115
;stm32f10x_flash.c,625 :: 		rdptmp = 0x00;
MOVW	R3, #0
; rdptmp end address is: 12 (R3)
;stm32f10x_flash.c,626 :: 		}
IT	AL
BAL	L_FLASH_EraseOptionBytes30
L__FLASH_EraseOptionBytes115:
;stm32f10x_flash.c,623 :: 		if(FLASH_GetReadOutProtectionStatus() != RESET)
;stm32f10x_flash.c,626 :: 		}
L_FLASH_EraseOptionBytes30:
;stm32f10x_flash.c,629 :: 		status = FLASH_WaitForLastOperation(EraseTimeout);
; rdptmp start address is: 12 (R3)
MOV	R0, #720896
BL	_FLASH_WaitForLastOperation+0
; status start address is: 4 (R1)
UXTB	R1, R0
;stm32f10x_flash.c,630 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #4
IT	NE
BNE	L__FLASH_EraseOptionBytes116
; status end address is: 4 (R1)
;stm32f10x_flash.c,633 :: 		FLASH->OPTKEYR = FLASH_KEY1;
MOVW	R0, #291
MOVT	R0, #17767
MOVW	R1, #8200
MOVT	R1, #16386
STR	R0, [R1, #0]
;stm32f10x_flash.c,634 :: 		FLASH->OPTKEYR = FLASH_KEY2;
MOVW	R0, #35243
MOVT	R0, #52719
STR	R0, [R1, #0]
;stm32f10x_flash.c,637 :: 		FLASH->CR |= CR_OPTER_Set;
MOVW	R1, #8208
MOVT	R1, #16386
LDR	R0, [R1, #0]
ORR	R0, R0, #32
STR	R0, [R1, #0]
;stm32f10x_flash.c,638 :: 		FLASH->CR |= CR_STRT_Set;
ORR	R0, R0, #64
STR	R0, [R1, #0]
;stm32f10x_flash.c,640 :: 		status = FLASH_WaitForLastOperation(EraseTimeout);
MOV	R0, #720896
BL	_FLASH_WaitForLastOperation+0
; status start address is: 16 (R4)
UXTB	R4, R0
;stm32f10x_flash.c,642 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #4
IT	NE
BNE	L_FLASH_EraseOptionBytes32
; status end address is: 16 (R4)
;stm32f10x_flash.c,645 :: 		FLASH->CR &= CR_OPTER_Reset;
MOVW	R2, #8208
MOVT	R2, #16386
LDR	R1, [R2, #0]
MOVW	R0, #8159
MOVT	R0, #0
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;stm32f10x_flash.c,648 :: 		FLASH->CR |= CR_OPTPG_Set;
ORR	R0, R0, #16
STR	R0, [R2, #0]
;stm32f10x_flash.c,650 :: 		OB->RDP = (uint16_t)rdptmp;
MOVW	R0, #63488
MOVT	R0, #8191
STRH	R3, [R0, #0]
; rdptmp end address is: 12 (R3)
;stm32f10x_flash.c,652 :: 		status = FLASH_WaitForLastOperation(ProgramTimeout);
MOV	R0, #8192
BL	_FLASH_WaitForLastOperation+0
; status start address is: 12 (R3)
UXTB	R3, R0
;stm32f10x_flash.c,654 :: 		if(status != FLASH_TIMEOUT)
CMP	R0, #5
IT	EQ
BEQ	L_FLASH_EraseOptionBytes33
;stm32f10x_flash.c,657 :: 		FLASH->CR &= CR_OPTPG_Reset;
MOVW	R2, #8208
MOVT	R2, #16386
LDR	R1, [R2, #0]
MOVW	R0, #8175
MOVT	R0, #0
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;stm32f10x_flash.c,658 :: 		}
L_FLASH_EraseOptionBytes33:
;stm32f10x_flash.c,659 :: 		}
UXTB	R0, R3
; status end address is: 12 (R3)
IT	AL
BAL	L_FLASH_EraseOptionBytes34
L_FLASH_EraseOptionBytes32:
;stm32f10x_flash.c,662 :: 		if (status != FLASH_TIMEOUT)
; status start address is: 16 (R4)
CMP	R4, #5
IT	EQ
BEQ	L_FLASH_EraseOptionBytes35
;stm32f10x_flash.c,665 :: 		FLASH->CR &= CR_OPTPG_Reset;
MOVW	R2, #8208
MOVT	R2, #16386
LDR	R1, [R2, #0]
MOVW	R0, #8175
MOVT	R0, #0
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;stm32f10x_flash.c,666 :: 		}
L_FLASH_EraseOptionBytes35:
;stm32f10x_flash.c,667 :: 		}
UXTB	R0, R4
L_FLASH_EraseOptionBytes34:
; status end address is: 16 (R4)
;stm32f10x_flash.c,668 :: 		}
; status start address is: 0 (R0)
; status end address is: 0 (R0)
IT	AL
BAL	L_FLASH_EraseOptionBytes31
L__FLASH_EraseOptionBytes116:
;stm32f10x_flash.c,630 :: 		if(status == FLASH_COMPLETE)
UXTB	R0, R1
;stm32f10x_flash.c,668 :: 		}
L_FLASH_EraseOptionBytes31:
;stm32f10x_flash.c,670 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f10x_flash.c,671 :: 		}
L_end_FLASH_EraseOptionBytes:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_EraseOptionBytes
_FLASH_ProgramWord:
;stm32f10x_flash.c,681 :: 		FLASH_Status FLASH_ProgramWord(uint32_t Address, uint32_t Data)
; Data start address is: 4 (R1)
; Address start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R5, R0
MOV	R4, R1
; Data end address is: 4 (R1)
; Address end address is: 0 (R0)
; Address start address is: 20 (R5)
; Data start address is: 16 (R4)
;stm32f10x_flash.c,683 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f10x_flash.c,684 :: 		__IO uint32_t tmp = 0;
;stm32f10x_flash.c,812 :: 		status = FLASH_WaitForLastOperation(ProgramTimeout);
MOV	R0, #8192
BL	_FLASH_WaitForLastOperation+0
; status start address is: 4 (R1)
UXTB	R1, R0
;stm32f10x_flash.c,814 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #4
IT	NE
BNE	L__FLASH_ProgramWord117
; status end address is: 4 (R1)
;stm32f10x_flash.c,818 :: 		FLASH->CR |= CR_PG_Set;
MOVW	R3, #8208
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORR	R2, R2, #1
STR	R2, [R3, #0]
;stm32f10x_flash.c,820 :: 		*(__IO uint16_t*)Address = (uint16_t)Data;
UXTH	R2, R4
STRH	R2, [R5, #0]
;stm32f10x_flash.c,822 :: 		status = FLASH_WaitForLastOperation(ProgramTimeout);
MOV	R0, #8192
BL	_FLASH_WaitForLastOperation+0
; status start address is: 4 (R1)
UXTB	R1, R0
;stm32f10x_flash.c,824 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #4
IT	NE
BNE	L_FLASH_ProgramWord37
; status end address is: 4 (R1)
;stm32f10x_flash.c,828 :: 		tmp = Address + 2;
ADDS	R2, R5, #2
; Address end address is: 20 (R5)
; tmp start address is: 0 (R0)
MOV	R0, R2
;stm32f10x_flash.c,830 :: 		*(__IO uint16_t*) tmp = Data >> 16;
MOV	R3, R0
; tmp end address is: 0 (R0)
LSRS	R2, R4, #16
; Data end address is: 16 (R4)
STRH	R2, [R3, #0]
;stm32f10x_flash.c,833 :: 		status = FLASH_WaitForLastOperation(ProgramTimeout);
MOV	R0, #8192
BL	_FLASH_WaitForLastOperation+0
; status start address is: 0 (R0)
;stm32f10x_flash.c,836 :: 		FLASH->CR &= CR_PG_Reset;
MOVW	R4, #8208
MOVT	R4, #16386
LDR	R3, [R4, #0]
MOVW	R2, #8190
MOVT	R2, #0
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_flash.c,837 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_FLASH_ProgramWord38
L_FLASH_ProgramWord37:
;stm32f10x_flash.c,841 :: 		FLASH->CR &= CR_PG_Reset;
; status start address is: 4 (R1)
MOVW	R4, #8208
MOVT	R4, #16386
LDR	R3, [R4, #0]
MOVW	R2, #8190
MOVT	R2, #0
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
; status end address is: 4 (R1)
UXTB	R0, R1
;stm32f10x_flash.c,842 :: 		}
L_FLASH_ProgramWord38:
;stm32f10x_flash.c,843 :: 		}
; status start address is: 0 (R0)
; status end address is: 0 (R0)
IT	AL
BAL	L_FLASH_ProgramWord36
L__FLASH_ProgramWord117:
;stm32f10x_flash.c,814 :: 		if(status == FLASH_COMPLETE)
UXTB	R0, R1
;stm32f10x_flash.c,843 :: 		}
L_FLASH_ProgramWord36:
;stm32f10x_flash.c,847 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f10x_flash.c,848 :: 		}
L_end_FLASH_ProgramWord:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_ProgramWord
_FLASH_ProgramHalfWord:
;stm32f10x_flash.c,858 :: 		FLASH_Status FLASH_ProgramHalfWord(uint32_t Address, uint16_t Data)
; Data start address is: 4 (R1)
; Address start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R4, R0
UXTH	R5, R1
; Data end address is: 4 (R1)
; Address end address is: 0 (R0)
; Address start address is: 16 (R4)
; Data start address is: 20 (R5)
;stm32f10x_flash.c,860 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f10x_flash.c,900 :: 		status = FLASH_WaitForLastOperation(ProgramTimeout);
MOV	R0, #8192
BL	_FLASH_WaitForLastOperation+0
; status start address is: 4 (R1)
UXTB	R1, R0
;stm32f10x_flash.c,902 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #4
IT	NE
BNE	L__FLASH_ProgramHalfWord118
; status end address is: 4 (R1)
;stm32f10x_flash.c,905 :: 		FLASH->CR |= CR_PG_Set;
MOVW	R3, #8208
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORR	R2, R2, #1
STR	R2, [R3, #0]
;stm32f10x_flash.c,907 :: 		*(__IO uint16_t*)Address = Data;
STRH	R5, [R4, #0]
; Address end address is: 16 (R4)
; Data end address is: 20 (R5)
;stm32f10x_flash.c,909 :: 		status = FLASH_WaitForLastOperation(ProgramTimeout);
MOV	R0, #8192
BL	_FLASH_WaitForLastOperation+0
; status start address is: 0 (R0)
;stm32f10x_flash.c,912 :: 		FLASH->CR &= CR_PG_Reset;
MOVW	R4, #8208
MOVT	R4, #16386
LDR	R3, [R4, #0]
MOVW	R2, #8190
MOVT	R2, #0
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
; status end address is: 0 (R0)
;stm32f10x_flash.c,913 :: 		}
IT	AL
BAL	L_FLASH_ProgramHalfWord39
L__FLASH_ProgramHalfWord118:
;stm32f10x_flash.c,902 :: 		if(status == FLASH_COMPLETE)
UXTB	R0, R1
;stm32f10x_flash.c,913 :: 		}
L_FLASH_ProgramHalfWord39:
;stm32f10x_flash.c,917 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f10x_flash.c,918 :: 		}
L_end_FLASH_ProgramHalfWord:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_ProgramHalfWord
_FLASH_ProgramOptionByteData:
;stm32f10x_flash.c,929 :: 		FLASH_Status FLASH_ProgramOptionByteData(uint32_t Address, uint8_t Data)
; Data start address is: 4 (R1)
; Address start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R4, R0
UXTB	R5, R1
; Data end address is: 4 (R1)
; Address end address is: 0 (R0)
; Address start address is: 16 (R4)
; Data start address is: 20 (R5)
;stm32f10x_flash.c,931 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f10x_flash.c,934 :: 		status = FLASH_WaitForLastOperation(ProgramTimeout);
MOV	R0, #8192
BL	_FLASH_WaitForLastOperation+0
; status start address is: 4 (R1)
UXTB	R1, R0
;stm32f10x_flash.c,936 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #4
IT	NE
BNE	L__FLASH_ProgramOptionByteData119
; status end address is: 4 (R1)
;stm32f10x_flash.c,939 :: 		FLASH->OPTKEYR = FLASH_KEY1;
MOVW	R2, #291
MOVT	R2, #17767
MOVW	R3, #8200
MOVT	R3, #16386
STR	R2, [R3, #0]
;stm32f10x_flash.c,940 :: 		FLASH->OPTKEYR = FLASH_KEY2;
MOVW	R2, #35243
MOVT	R2, #52719
STR	R2, [R3, #0]
;stm32f10x_flash.c,942 :: 		FLASH->CR |= CR_OPTPG_Set;
MOVW	R3, #8208
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORR	R2, R2, #16
STR	R2, [R3, #0]
;stm32f10x_flash.c,943 :: 		*(__IO uint16_t*)Address = Data;
STRH	R5, [R4, #0]
; Address end address is: 16 (R4)
; Data end address is: 20 (R5)
;stm32f10x_flash.c,946 :: 		status = FLASH_WaitForLastOperation(ProgramTimeout);
MOV	R0, #8192
BL	_FLASH_WaitForLastOperation+0
; status start address is: 4 (R1)
UXTB	R1, R0
;stm32f10x_flash.c,947 :: 		if(status != FLASH_TIMEOUT)
CMP	R0, #5
IT	EQ
BEQ	L_FLASH_ProgramOptionByteData41
;stm32f10x_flash.c,950 :: 		FLASH->CR &= CR_OPTPG_Reset;
MOVW	R4, #8208
MOVT	R4, #16386
LDR	R3, [R4, #0]
MOVW	R2, #8175
MOVT	R2, #0
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f10x_flash.c,951 :: 		}
L_FLASH_ProgramOptionByteData41:
;stm32f10x_flash.c,952 :: 		}
UXTB	R0, R1
IT	AL
BAL	L_FLASH_ProgramOptionByteData40
; status end address is: 4 (R1)
L__FLASH_ProgramOptionByteData119:
;stm32f10x_flash.c,936 :: 		if(status == FLASH_COMPLETE)
UXTB	R0, R1
;stm32f10x_flash.c,952 :: 		}
L_FLASH_ProgramOptionByteData40:
;stm32f10x_flash.c,954 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f10x_flash.c,955 :: 		}
L_end_FLASH_ProgramOptionByteData:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_ProgramOptionByteData
_FLASH_EnableWriteProtection:
;stm32f10x_flash.c,975 :: 		FLASH_Status FLASH_EnableWriteProtection(uint32_t FLASH_Pages)
; FLASH_Pages start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; FLASH_Pages end address is: 0 (R0)
; FLASH_Pages start address is: 0 (R0)
;stm32f10x_flash.c,977 :: 		uint16_t WRP0_Data = 0xFFFF, WRP1_Data = 0xFFFF, WRP2_Data = 0xFFFF, WRP3_Data = 0xFFFF;
;stm32f10x_flash.c,979 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f10x_flash.c,984 :: 		FLASH_Pages = (uint32_t)(~FLASH_Pages);
MVN	R2, R0
; FLASH_Pages end address is: 0 (R0)
;stm32f10x_flash.c,985 :: 		WRP0_Data = (uint16_t)(FLASH_Pages & WRP0_Mask);
AND	R1, R2, #255
; WRP0_Data start address is: 24 (R6)
UXTH	R6, R1
;stm32f10x_flash.c,986 :: 		WRP1_Data = (uint16_t)((FLASH_Pages & WRP1_Mask) >> 8);
AND	R1, R2, #65280
LSRS	R1, R1, #8
; WRP1_Data start address is: 20 (R5)
UXTH	R5, R1
;stm32f10x_flash.c,987 :: 		WRP2_Data = (uint16_t)((FLASH_Pages & WRP2_Mask) >> 16);
AND	R1, R2, #16711680
LSRS	R1, R1, #16
; WRP2_Data start address is: 16 (R4)
UXTH	R4, R1
;stm32f10x_flash.c,988 :: 		WRP3_Data = (uint16_t)((FLASH_Pages & WRP3_Mask) >> 24);
AND	R1, R2, #-16777216
LSRS	R1, R1, #24
; WRP3_Data start address is: 12 (R3)
UXTH	R3, R1
;stm32f10x_flash.c,991 :: 		status = FLASH_WaitForLastOperation(ProgramTimeout);
MOV	R0, #8192
BL	_FLASH_WaitForLastOperation+0
; status start address is: 28 (R7)
UXTB	R7, R0
;stm32f10x_flash.c,993 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #4
IT	NE
BNE	L__FLASH_EnableWriteProtection136
;stm32f10x_flash.c,996 :: 		FLASH->OPTKEYR = FLASH_KEY1;
MOVW	R1, #291
MOVT	R1, #17767
MOVW	R2, #8200
MOVT	R2, #16386
STR	R1, [R2, #0]
;stm32f10x_flash.c,997 :: 		FLASH->OPTKEYR = FLASH_KEY2;
MOVW	R1, #35243
MOVT	R1, #52719
STR	R1, [R2, #0]
;stm32f10x_flash.c,998 :: 		FLASH->CR |= CR_OPTPG_Set;
MOVW	R2, #8208
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORR	R1, R1, #16
STR	R1, [R2, #0]
;stm32f10x_flash.c,999 :: 		if(WRP0_Data != 0xFF)
CMP	R6, #255
IT	EQ
BEQ	L__FLASH_EnableWriteProtection129
; status end address is: 28 (R7)
;stm32f10x_flash.c,1001 :: 		OB->WRP0 = WRP0_Data;
MOVW	R1, #63496
MOVT	R1, #8191
STRH	R6, [R1, #0]
; WRP0_Data end address is: 24 (R6)
;stm32f10x_flash.c,1004 :: 		status = FLASH_WaitForLastOperation(ProgramTimeout);
MOV	R0, #8192
BL	_FLASH_WaitForLastOperation+0
; status start address is: 4 (R1)
UXTB	R1, R0
; status end address is: 4 (R1)
UXTB	R0, R1
;stm32f10x_flash.c,1005 :: 		}
IT	AL
BAL	L_FLASH_EnableWriteProtection43
L__FLASH_EnableWriteProtection129:
;stm32f10x_flash.c,999 :: 		if(WRP0_Data != 0xFF)
UXTB	R0, R7
;stm32f10x_flash.c,1005 :: 		}
L_FLASH_EnableWriteProtection43:
;stm32f10x_flash.c,1006 :: 		if((status == FLASH_COMPLETE) && (WRP1_Data != 0xFF))
; status start address is: 0 (R0)
CMP	R0, #4
IT	NE
BNE	L__FLASH_EnableWriteProtection130
CMP	R5, #255
IT	EQ
BEQ	L__FLASH_EnableWriteProtection131
; status end address is: 0 (R0)
L__FLASH_EnableWriteProtection122:
;stm32f10x_flash.c,1008 :: 		OB->WRP1 = WRP1_Data;
MOVW	R1, #63498
MOVT	R1, #8191
STRH	R5, [R1, #0]
; WRP1_Data end address is: 20 (R5)
;stm32f10x_flash.c,1011 :: 		status = FLASH_WaitForLastOperation(ProgramTimeout);
MOV	R0, #8192
BL	_FLASH_WaitForLastOperation+0
; status start address is: 4 (R1)
UXTB	R1, R0
; status end address is: 4 (R1)
UXTB	R0, R1
;stm32f10x_flash.c,1006 :: 		if((status == FLASH_COMPLETE) && (WRP1_Data != 0xFF))
IT	AL
BAL	L__FLASH_EnableWriteProtection124
L__FLASH_EnableWriteProtection130:
L__FLASH_EnableWriteProtection124:
; status start address is: 0 (R0)
; status end address is: 0 (R0)
IT	AL
BAL	L__FLASH_EnableWriteProtection123
L__FLASH_EnableWriteProtection131:
L__FLASH_EnableWriteProtection123:
;stm32f10x_flash.c,1013 :: 		if((status == FLASH_COMPLETE) && (WRP2_Data != 0xFF))
; status start address is: 0 (R0)
CMP	R0, #4
IT	NE
BNE	L__FLASH_EnableWriteProtection132
CMP	R4, #255
IT	EQ
BEQ	L__FLASH_EnableWriteProtection133
; status end address is: 0 (R0)
L__FLASH_EnableWriteProtection121:
;stm32f10x_flash.c,1015 :: 		OB->WRP2 = WRP2_Data;
MOVW	R1, #63500
MOVT	R1, #8191
STRH	R4, [R1, #0]
; WRP2_Data end address is: 16 (R4)
;stm32f10x_flash.c,1018 :: 		status = FLASH_WaitForLastOperation(ProgramTimeout);
MOV	R0, #8192
BL	_FLASH_WaitForLastOperation+0
; status start address is: 4 (R1)
UXTB	R1, R0
; status end address is: 4 (R1)
UXTB	R0, R1
;stm32f10x_flash.c,1013 :: 		if((status == FLASH_COMPLETE) && (WRP2_Data != 0xFF))
IT	AL
BAL	L__FLASH_EnableWriteProtection126
L__FLASH_EnableWriteProtection132:
L__FLASH_EnableWriteProtection126:
; status start address is: 0 (R0)
; status end address is: 0 (R0)
IT	AL
BAL	L__FLASH_EnableWriteProtection125
L__FLASH_EnableWriteProtection133:
L__FLASH_EnableWriteProtection125:
;stm32f10x_flash.c,1021 :: 		if((status == FLASH_COMPLETE)&& (WRP3_Data != 0xFF))
; status start address is: 0 (R0)
CMP	R0, #4
IT	NE
BNE	L__FLASH_EnableWriteProtection134
CMP	R3, #255
IT	EQ
BEQ	L__FLASH_EnableWriteProtection135
; status end address is: 0 (R0)
L__FLASH_EnableWriteProtection120:
;stm32f10x_flash.c,1023 :: 		OB->WRP3 = WRP3_Data;
MOVW	R1, #63502
MOVT	R1, #8191
STRH	R3, [R1, #0]
; WRP3_Data end address is: 12 (R3)
;stm32f10x_flash.c,1026 :: 		status = FLASH_WaitForLastOperation(ProgramTimeout);
MOV	R0, #8192
BL	_FLASH_WaitForLastOperation+0
; status start address is: 4 (R1)
UXTB	R1, R0
; status end address is: 4 (R1)
UXTB	R0, R1
;stm32f10x_flash.c,1021 :: 		if((status == FLASH_COMPLETE)&& (WRP3_Data != 0xFF))
IT	AL
BAL	L__FLASH_EnableWriteProtection128
L__FLASH_EnableWriteProtection134:
L__FLASH_EnableWriteProtection128:
; status start address is: 0 (R0)
; status end address is: 0 (R0)
IT	AL
BAL	L__FLASH_EnableWriteProtection127
L__FLASH_EnableWriteProtection135:
L__FLASH_EnableWriteProtection127:
;stm32f10x_flash.c,1029 :: 		if(status != FLASH_TIMEOUT)
; status start address is: 0 (R0)
CMP	R0, #5
IT	EQ
BEQ	L_FLASH_EnableWriteProtection53
;stm32f10x_flash.c,1032 :: 		FLASH->CR &= CR_OPTPG_Reset;
MOVW	R3, #8208
MOVT	R3, #16386
LDR	R2, [R3, #0]
MOVW	R1, #8175
MOVT	R1, #0
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f10x_flash.c,1033 :: 		}
L_FLASH_EnableWriteProtection53:
;stm32f10x_flash.c,1034 :: 		}
IT	AL
BAL	L_FLASH_EnableWriteProtection42
; status end address is: 0 (R0)
L__FLASH_EnableWriteProtection136:
;stm32f10x_flash.c,993 :: 		if(status == FLASH_COMPLETE)
UXTB	R0, R7
;stm32f10x_flash.c,1034 :: 		}
L_FLASH_EnableWriteProtection42:
;stm32f10x_flash.c,1036 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f10x_flash.c,1037 :: 		}
L_end_FLASH_EnableWriteProtection:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_EnableWriteProtection
_FLASH_ReadOutProtection:
;stm32f10x_flash.c,1049 :: 		FLASH_Status FLASH_ReadOutProtection(FunctionalState NewState)
; NewState start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R4, R0
; NewState end address is: 0 (R0)
; NewState start address is: 16 (R4)
;stm32f10x_flash.c,1051 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f10x_flash.c,1054 :: 		status = FLASH_WaitForLastOperation(EraseTimeout);
MOV	R0, #720896
BL	_FLASH_WaitForLastOperation+0
; status start address is: 4 (R1)
UXTB	R1, R0
;stm32f10x_flash.c,1055 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #4
IT	NE
BNE	L__FLASH_ReadOutProtection137
; status end address is: 4 (R1)
;stm32f10x_flash.c,1058 :: 		FLASH->OPTKEYR = FLASH_KEY1;
MOVW	R1, #291
MOVT	R1, #17767
MOVW	R2, #8200
MOVT	R2, #16386
STR	R1, [R2, #0]
;stm32f10x_flash.c,1059 :: 		FLASH->OPTKEYR = FLASH_KEY2;
MOVW	R1, #35243
MOVT	R1, #52719
STR	R1, [R2, #0]
;stm32f10x_flash.c,1060 :: 		FLASH->CR |= CR_OPTER_Set;
MOVW	R2, #8208
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORR	R1, R1, #32
STR	R1, [R2, #0]
;stm32f10x_flash.c,1061 :: 		FLASH->CR |= CR_STRT_Set;
ORR	R1, R1, #64
STR	R1, [R2, #0]
;stm32f10x_flash.c,1063 :: 		status = FLASH_WaitForLastOperation(EraseTimeout);
MOV	R0, #720896
BL	_FLASH_WaitForLastOperation+0
; status start address is: 20 (R5)
UXTB	R5, R0
;stm32f10x_flash.c,1064 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #4
IT	NE
BNE	L_FLASH_ReadOutProtection55
; status end address is: 20 (R5)
;stm32f10x_flash.c,1067 :: 		FLASH->CR &= CR_OPTER_Reset;
MOVW	R3, #8208
MOVT	R3, #16386
LDR	R2, [R3, #0]
MOVW	R1, #8159
MOVT	R1, #0
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f10x_flash.c,1069 :: 		FLASH->CR |= CR_OPTPG_Set;
ORR	R1, R1, #16
STR	R1, [R3, #0]
;stm32f10x_flash.c,1070 :: 		if(NewState != DISABLE)
CMP	R4, #0
IT	EQ
BEQ	L_FLASH_ReadOutProtection56
; NewState end address is: 16 (R4)
;stm32f10x_flash.c,1072 :: 		OB->RDP = 0x00;
MOVW	R2, #0
MOVW	R1, #63488
MOVT	R1, #8191
STRH	R2, [R1, #0]
;stm32f10x_flash.c,1073 :: 		}
IT	AL
BAL	L_FLASH_ReadOutProtection57
L_FLASH_ReadOutProtection56:
;stm32f10x_flash.c,1076 :: 		OB->RDP = RDP_Key;
MOVW	R2, #165
MOVW	R1, #63488
MOVT	R1, #8191
STRH	R2, [R1, #0]
;stm32f10x_flash.c,1077 :: 		}
L_FLASH_ReadOutProtection57:
;stm32f10x_flash.c,1079 :: 		status = FLASH_WaitForLastOperation(EraseTimeout);
MOV	R0, #720896
BL	_FLASH_WaitForLastOperation+0
; status start address is: 16 (R4)
UXTB	R4, R0
;stm32f10x_flash.c,1081 :: 		if(status != FLASH_TIMEOUT)
CMP	R0, #5
IT	EQ
BEQ	L_FLASH_ReadOutProtection58
;stm32f10x_flash.c,1084 :: 		FLASH->CR &= CR_OPTPG_Reset;
MOVW	R3, #8208
MOVT	R3, #16386
LDR	R2, [R3, #0]
MOVW	R1, #8175
MOVT	R1, #0
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f10x_flash.c,1085 :: 		}
L_FLASH_ReadOutProtection58:
;stm32f10x_flash.c,1086 :: 		}
UXTB	R0, R4
; status end address is: 16 (R4)
IT	AL
BAL	L_FLASH_ReadOutProtection59
L_FLASH_ReadOutProtection55:
;stm32f10x_flash.c,1089 :: 		if(status != FLASH_TIMEOUT)
; status start address is: 20 (R5)
CMP	R5, #5
IT	EQ
BEQ	L_FLASH_ReadOutProtection60
;stm32f10x_flash.c,1092 :: 		FLASH->CR &= CR_OPTER_Reset;
MOVW	R3, #8208
MOVT	R3, #16386
LDR	R2, [R3, #0]
MOVW	R1, #8159
MOVT	R1, #0
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f10x_flash.c,1093 :: 		}
L_FLASH_ReadOutProtection60:
;stm32f10x_flash.c,1094 :: 		}
UXTB	R0, R5
L_FLASH_ReadOutProtection59:
; status end address is: 20 (R5)
;stm32f10x_flash.c,1095 :: 		}
; status start address is: 0 (R0)
; status end address is: 0 (R0)
IT	AL
BAL	L_FLASH_ReadOutProtection54
L__FLASH_ReadOutProtection137:
;stm32f10x_flash.c,1055 :: 		if(status == FLASH_COMPLETE)
UXTB	R0, R1
;stm32f10x_flash.c,1095 :: 		}
L_FLASH_ReadOutProtection54:
;stm32f10x_flash.c,1097 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f10x_flash.c,1098 :: 		}
L_end_FLASH_ReadOutProtection:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_ReadOutProtection
_FLASH_UserOptionByteConfig:
;stm32f10x_flash.c,1118 :: 		FLASH_Status FLASH_UserOptionByteConfig(uint16_t OB_IWDG, uint16_t OB_STOP, uint16_t OB_STDBY)
; OB_STDBY start address is: 8 (R2)
; OB_STOP start address is: 4 (R1)
; OB_IWDG start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R5, R0
UXTH	R6, R1
UXTH	R7, R2
; OB_STDBY end address is: 8 (R2)
; OB_STOP end address is: 4 (R1)
; OB_IWDG end address is: 0 (R0)
; OB_IWDG start address is: 20 (R5)
; OB_STOP start address is: 24 (R6)
; OB_STDBY start address is: 28 (R7)
;stm32f10x_flash.c,1120 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f10x_flash.c,1128 :: 		FLASH->OPTKEYR = FLASH_KEY1;
MOVW	R3, #291
MOVT	R3, #17767
MOVW	R4, #8200
MOVT	R4, #16386
STR	R3, [R4, #0]
;stm32f10x_flash.c,1129 :: 		FLASH->OPTKEYR = FLASH_KEY2;
MOVW	R3, #35243
MOVT	R3, #52719
STR	R3, [R4, #0]
;stm32f10x_flash.c,1132 :: 		status = FLASH_WaitForLastOperation(ProgramTimeout);
MOV	R0, #8192
BL	_FLASH_WaitForLastOperation+0
; status start address is: 4 (R1)
UXTB	R1, R0
;stm32f10x_flash.c,1134 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #4
IT	NE
BNE	L__FLASH_UserOptionByteConfig138
; status end address is: 4 (R1)
;stm32f10x_flash.c,1137 :: 		FLASH->CR |= CR_OPTPG_Set;
MOVW	R4, #8208
MOVT	R4, #16386
LDR	R3, [R4, #0]
ORR	R3, R3, #16
STR	R3, [R4, #0]
;stm32f10x_flash.c,1139 :: 		OB->USER = OB_IWDG | (uint16_t)(OB_STOP | (uint16_t)(OB_STDBY | ((uint16_t)0xF8)));
ORR	R3, R7, #248
UXTH	R3, R3
; OB_STDBY end address is: 28 (R7)
ORR	R3, R6, R3, LSL #0
UXTH	R3, R3
; OB_STOP end address is: 24 (R6)
ORR	R4, R5, R3, LSL #0
; OB_IWDG end address is: 20 (R5)
MOVW	R3, #63490
MOVT	R3, #8191
STRH	R4, [R3, #0]
;stm32f10x_flash.c,1142 :: 		status = FLASH_WaitForLastOperation(ProgramTimeout);
MOV	R0, #8192
BL	_FLASH_WaitForLastOperation+0
; status start address is: 4 (R1)
UXTB	R1, R0
;stm32f10x_flash.c,1143 :: 		if(status != FLASH_TIMEOUT)
CMP	R0, #5
IT	EQ
BEQ	L_FLASH_UserOptionByteConfig62
;stm32f10x_flash.c,1146 :: 		FLASH->CR &= CR_OPTPG_Reset;
MOVW	R5, #8208
MOVT	R5, #16386
LDR	R4, [R5, #0]
MOVW	R3, #8175
MOVT	R3, #0
AND	R3, R4, R3, LSL #0
STR	R3, [R5, #0]
;stm32f10x_flash.c,1147 :: 		}
L_FLASH_UserOptionByteConfig62:
;stm32f10x_flash.c,1148 :: 		}
UXTB	R0, R1
IT	AL
BAL	L_FLASH_UserOptionByteConfig61
; status end address is: 4 (R1)
L__FLASH_UserOptionByteConfig138:
;stm32f10x_flash.c,1134 :: 		if(status == FLASH_COMPLETE)
UXTB	R0, R1
;stm32f10x_flash.c,1148 :: 		}
L_FLASH_UserOptionByteConfig61:
;stm32f10x_flash.c,1150 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f10x_flash.c,1151 :: 		}
L_end_FLASH_UserOptionByteConfig:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_UserOptionByteConfig
_FLASH_GetUserOptionByte:
;stm32f10x_flash.c,1216 :: 		uint32_t FLASH_GetUserOptionByte(void)
;stm32f10x_flash.c,1219 :: 		return (uint32_t)(FLASH->OBR >> 2);
MOVW	R0, #8220
MOVT	R0, #16386
LDR	R0, [R0, #0]
LSRS	R0, R0, #2
;stm32f10x_flash.c,1220 :: 		}
L_end_FLASH_GetUserOptionByte:
BX	LR
; end of _FLASH_GetUserOptionByte
_FLASH_GetWriteProtectionOptionByte:
;stm32f10x_flash.c,1228 :: 		uint32_t FLASH_GetWriteProtectionOptionByte(void)
;stm32f10x_flash.c,1231 :: 		return (uint32_t)(FLASH->WRPR);
MOVW	R0, #8224
MOVT	R0, #16386
LDR	R0, [R0, #0]
;stm32f10x_flash.c,1232 :: 		}
L_end_FLASH_GetWriteProtectionOptionByte:
BX	LR
; end of _FLASH_GetWriteProtectionOptionByte
_FLASH_GetReadOutProtectionStatus:
;stm32f10x_flash.c,1240 :: 		FlagStatus FLASH_GetReadOutProtectionStatus(void)
;stm32f10x_flash.c,1242 :: 		FlagStatus readoutstatus = RESET;
;stm32f10x_flash.c,1243 :: 		if ((FLASH->OBR & RDPRT_Mask) != (uint32_t)RESET)
MOVW	R0, #8220
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #2
CMP	R0, #0
IT	EQ
BEQ	L_FLASH_GetReadOutProtectionStatus63
;stm32f10x_flash.c,1245 :: 		readoutstatus = SET;
; readoutstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_flash.c,1246 :: 		}
; readoutstatus end address is: 0 (R0)
IT	AL
BAL	L_FLASH_GetReadOutProtectionStatus64
L_FLASH_GetReadOutProtectionStatus63:
;stm32f10x_flash.c,1249 :: 		readoutstatus = RESET;
; readoutstatus start address is: 0 (R0)
MOVS	R0, #0
; readoutstatus end address is: 0 (R0)
;stm32f10x_flash.c,1250 :: 		}
L_FLASH_GetReadOutProtectionStatus64:
;stm32f10x_flash.c,1251 :: 		return readoutstatus;
; readoutstatus start address is: 0 (R0)
; readoutstatus end address is: 0 (R0)
;stm32f10x_flash.c,1252 :: 		}
L_end_FLASH_GetReadOutProtectionStatus:
BX	LR
; end of _FLASH_GetReadOutProtectionStatus
_FLASH_GetPrefetchBufferStatus:
;stm32f10x_flash.c,1260 :: 		FlagStatus FLASH_GetPrefetchBufferStatus(void)
;stm32f10x_flash.c,1262 :: 		FlagStatus bitstatus = RESET;
;stm32f10x_flash.c,1264 :: 		if ((FLASH->ACR & ACR_PRFTBS_Mask) != (uint32_t)RESET)
MOVW	R0, #8192
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #32
CMP	R0, #0
IT	EQ
BEQ	L_FLASH_GetPrefetchBufferStatus65
;stm32f10x_flash.c,1266 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_flash.c,1267 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_FLASH_GetPrefetchBufferStatus66
L_FLASH_GetPrefetchBufferStatus65:
;stm32f10x_flash.c,1270 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_flash.c,1271 :: 		}
L_FLASH_GetPrefetchBufferStatus66:
;stm32f10x_flash.c,1273 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_flash.c,1274 :: 		}
L_end_FLASH_GetPrefetchBufferStatus:
BX	LR
; end of _FLASH_GetPrefetchBufferStatus
_FLASH_ITConfig:
;stm32f10x_flash.c,1290 :: 		void FLASH_ITConfig(uint32_t FLASH_IT, FunctionalState NewState)
; NewState start address is: 4 (R1)
; FLASH_IT start address is: 0 (R0)
; NewState end address is: 4 (R1)
; FLASH_IT end address is: 0 (R0)
; FLASH_IT start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_flash.c,1328 :: 		if(NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_FLASH_ITConfig67
; NewState end address is: 4 (R1)
;stm32f10x_flash.c,1331 :: 		FLASH->CR |= FLASH_IT;
MOVW	R3, #8208
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; FLASH_IT end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f10x_flash.c,1332 :: 		}
IT	AL
BAL	L_FLASH_ITConfig68
L_FLASH_ITConfig67:
;stm32f10x_flash.c,1336 :: 		FLASH->CR &= ~(uint32_t)FLASH_IT;
; FLASH_IT start address is: 0 (R0)
MVN	R4, R0
; FLASH_IT end address is: 0 (R0)
MOVW	R3, #8208
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f10x_flash.c,1337 :: 		}
L_FLASH_ITConfig68:
;stm32f10x_flash.c,1339 :: 		}
L_end_FLASH_ITConfig:
BX	LR
; end of _FLASH_ITConfig
_FLASH_GetFlagStatus:
;stm32f10x_flash.c,1357 :: 		FlagStatus FLASH_GetFlagStatus(uint32_t FLASH_FLAG)
; FLASH_FLAG start address is: 0 (R0)
; FLASH_FLAG end address is: 0 (R0)
; FLASH_FLAG start address is: 0 (R0)
;stm32f10x_flash.c,1359 :: 		FlagStatus bitstatus = RESET;
;stm32f10x_flash.c,1403 :: 		if(FLASH_FLAG == FLASH_FLAG_OPTERR)
CMP	R0, #1
IT	NE
BNE	L_FLASH_GetFlagStatus69
; FLASH_FLAG end address is: 0 (R0)
;stm32f10x_flash.c,1405 :: 		if((FLASH->OBR & FLASH_FLAG_OPTERR) != (uint32_t)RESET)
MOVW	R1, #8220
MOVT	R1, #16386
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_FLASH_GetFlagStatus70
;stm32f10x_flash.c,1407 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_flash.c,1408 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_FLASH_GetFlagStatus71
L_FLASH_GetFlagStatus70:
;stm32f10x_flash.c,1411 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_flash.c,1412 :: 		}
L_FLASH_GetFlagStatus71:
;stm32f10x_flash.c,1413 :: 		}
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_FLASH_GetFlagStatus72
L_FLASH_GetFlagStatus69:
;stm32f10x_flash.c,1416 :: 		if((FLASH->SR & FLASH_FLAG) != (uint32_t)RESET)
; FLASH_FLAG start address is: 0 (R0)
MOVW	R1, #8204
MOVT	R1, #16386
LDR	R1, [R1, #0]
ANDS	R1, R0
; FLASH_FLAG end address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_FLASH_GetFlagStatus73
;stm32f10x_flash.c,1418 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_flash.c,1419 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_FLASH_GetFlagStatus74
L_FLASH_GetFlagStatus73:
;stm32f10x_flash.c,1422 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_flash.c,1423 :: 		}
L_FLASH_GetFlagStatus74:
;stm32f10x_flash.c,1424 :: 		}
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
L_FLASH_GetFlagStatus72:
;stm32f10x_flash.c,1428 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_flash.c,1429 :: 		}
L_end_FLASH_GetFlagStatus:
BX	LR
; end of _FLASH_GetFlagStatus
_FLASH_ClearFlag:
;stm32f10x_flash.c,1443 :: 		void FLASH_ClearFlag(uint32_t FLASH_FLAG)
; FLASH_FLAG start address is: 0 (R0)
; FLASH_FLAG end address is: 0 (R0)
; FLASH_FLAG start address is: 0 (R0)
;stm32f10x_flash.c,1465 :: 		FLASH->SR = FLASH_FLAG;
MOVW	R1, #8204
MOVT	R1, #16386
STR	R0, [R1, #0]
; FLASH_FLAG end address is: 0 (R0)
;stm32f10x_flash.c,1467 :: 		}
L_end_FLASH_ClearFlag:
BX	LR
; end of _FLASH_ClearFlag
_FLASH_GetStatus:
;stm32f10x_flash.c,1477 :: 		FLASH_Status FLASH_GetStatus(void)
;stm32f10x_flash.c,1479 :: 		FLASH_Status flashstatus = FLASH_COMPLETE;
;stm32f10x_flash.c,1481 :: 		if((FLASH->SR & FLASH_FLAG_BSY) == FLASH_FLAG_BSY)
MOVW	R0, #8204
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #1
CMP	R0, #1
IT	NE
BNE	L_FLASH_GetStatus75
;stm32f10x_flash.c,1483 :: 		flashstatus = FLASH_BUSY;
; flashstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_flash.c,1484 :: 		}
; flashstatus end address is: 0 (R0)
IT	AL
BAL	L_FLASH_GetStatus76
L_FLASH_GetStatus75:
;stm32f10x_flash.c,1487 :: 		if((FLASH->SR & FLASH_FLAG_PGERR) != 0)
MOVW	R0, #8204
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #4
CMP	R0, #0
IT	EQ
BEQ	L_FLASH_GetStatus77
;stm32f10x_flash.c,1489 :: 		flashstatus = FLASH_ERROR_PG;
; flashstatus start address is: 0 (R0)
MOVS	R0, #2
;stm32f10x_flash.c,1490 :: 		}
; flashstatus end address is: 0 (R0)
IT	AL
BAL	L_FLASH_GetStatus78
L_FLASH_GetStatus77:
;stm32f10x_flash.c,1493 :: 		if((FLASH->SR & FLASH_FLAG_WRPRTERR) != 0 )
MOVW	R0, #8204
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #16
CMP	R0, #0
IT	EQ
BEQ	L_FLASH_GetStatus79
;stm32f10x_flash.c,1495 :: 		flashstatus = FLASH_ERROR_WRP;
; flashstatus start address is: 0 (R0)
MOVS	R0, #3
;stm32f10x_flash.c,1496 :: 		}
; flashstatus end address is: 0 (R0)
IT	AL
BAL	L_FLASH_GetStatus80
L_FLASH_GetStatus79:
;stm32f10x_flash.c,1499 :: 		flashstatus = FLASH_COMPLETE;
; flashstatus start address is: 0 (R0)
MOVS	R0, #4
; flashstatus end address is: 0 (R0)
;stm32f10x_flash.c,1500 :: 		}
L_FLASH_GetStatus80:
;stm32f10x_flash.c,1501 :: 		}
; flashstatus start address is: 0 (R0)
; flashstatus end address is: 0 (R0)
L_FLASH_GetStatus78:
;stm32f10x_flash.c,1502 :: 		}
; flashstatus start address is: 0 (R0)
; flashstatus end address is: 0 (R0)
L_FLASH_GetStatus76:
;stm32f10x_flash.c,1504 :: 		return flashstatus;
; flashstatus start address is: 0 (R0)
; flashstatus end address is: 0 (R0)
;stm32f10x_flash.c,1505 :: 		}
L_end_FLASH_GetStatus:
BX	LR
; end of _FLASH_GetStatus
_FLASH_GetBank1Status:
;stm32f10x_flash.c,1515 :: 		FLASH_Status FLASH_GetBank1Status(void)
;stm32f10x_flash.c,1517 :: 		FLASH_Status flashstatus = FLASH_COMPLETE;
;stm32f10x_flash.c,1519 :: 		if((FLASH->SR & FLASH_FLAG_BANK1_BSY) == FLASH_FLAG_BSY)
MOVW	R0, #8204
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #1
CMP	R0, #1
IT	NE
BNE	L_FLASH_GetBank1Status81
;stm32f10x_flash.c,1521 :: 		flashstatus = FLASH_BUSY;
; flashstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_flash.c,1522 :: 		}
; flashstatus end address is: 0 (R0)
IT	AL
BAL	L_FLASH_GetBank1Status82
L_FLASH_GetBank1Status81:
;stm32f10x_flash.c,1525 :: 		if((FLASH->SR & FLASH_FLAG_BANK1_PGERR) != 0)
MOVW	R0, #8204
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #4
CMP	R0, #0
IT	EQ
BEQ	L_FLASH_GetBank1Status83
;stm32f10x_flash.c,1527 :: 		flashstatus = FLASH_ERROR_PG;
; flashstatus start address is: 0 (R0)
MOVS	R0, #2
;stm32f10x_flash.c,1528 :: 		}
; flashstatus end address is: 0 (R0)
IT	AL
BAL	L_FLASH_GetBank1Status84
L_FLASH_GetBank1Status83:
;stm32f10x_flash.c,1531 :: 		if((FLASH->SR & FLASH_FLAG_BANK1_WRPRTERR) != 0 )
MOVW	R0, #8204
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #16
CMP	R0, #0
IT	EQ
BEQ	L_FLASH_GetBank1Status85
;stm32f10x_flash.c,1533 :: 		flashstatus = FLASH_ERROR_WRP;
; flashstatus start address is: 0 (R0)
MOVS	R0, #3
;stm32f10x_flash.c,1534 :: 		}
; flashstatus end address is: 0 (R0)
IT	AL
BAL	L_FLASH_GetBank1Status86
L_FLASH_GetBank1Status85:
;stm32f10x_flash.c,1537 :: 		flashstatus = FLASH_COMPLETE;
; flashstatus start address is: 0 (R0)
MOVS	R0, #4
; flashstatus end address is: 0 (R0)
;stm32f10x_flash.c,1538 :: 		}
L_FLASH_GetBank1Status86:
;stm32f10x_flash.c,1539 :: 		}
; flashstatus start address is: 0 (R0)
; flashstatus end address is: 0 (R0)
L_FLASH_GetBank1Status84:
;stm32f10x_flash.c,1540 :: 		}
; flashstatus start address is: 0 (R0)
; flashstatus end address is: 0 (R0)
L_FLASH_GetBank1Status82:
;stm32f10x_flash.c,1542 :: 		return flashstatus;
; flashstatus start address is: 0 (R0)
; flashstatus end address is: 0 (R0)
;stm32f10x_flash.c,1543 :: 		}
L_end_FLASH_GetBank1Status:
BX	LR
; end of _FLASH_GetBank1Status
_FLASH_WaitForLastOperation:
;stm32f10x_flash.c,1595 :: 		FLASH_Status FLASH_WaitForLastOperation(uint32_t Timeout)
; Timeout start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R1, R0
; Timeout end address is: 0 (R0)
; Timeout start address is: 4 (R1)
;stm32f10x_flash.c,1597 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f10x_flash.c,1600 :: 		status = FLASH_GetBank1Status();
BL	_FLASH_GetBank1Status+0
; status start address is: 8 (R2)
UXTB	R2, R0
; Timeout end address is: 4 (R1)
; status end address is: 8 (R2)
UXTB	R0, R2
MOV	R2, R1
;stm32f10x_flash.c,1602 :: 		while((status == FLASH_BUSY) && (Timeout != 0x00))
L_FLASH_WaitForLastOperation87:
; status start address is: 0 (R0)
; Timeout start address is: 8 (R2)
CMP	R0, #1
IT	NE
BNE	L__FLASH_WaitForLastOperation106
CMP	R2, #0
IT	EQ
BEQ	L__FLASH_WaitForLastOperation105
; status end address is: 0 (R0)
L__FLASH_WaitForLastOperation104:
;stm32f10x_flash.c,1604 :: 		status = FLASH_GetBank1Status();
BL	_FLASH_GetBank1Status+0
; status start address is: 0 (R0)
;stm32f10x_flash.c,1605 :: 		Timeout--;
SUBS	R2, R2, #1
;stm32f10x_flash.c,1606 :: 		}
IT	AL
BAL	L_FLASH_WaitForLastOperation87
;stm32f10x_flash.c,1602 :: 		while((status == FLASH_BUSY) && (Timeout != 0x00))
L__FLASH_WaitForLastOperation106:
L__FLASH_WaitForLastOperation105:
;stm32f10x_flash.c,1607 :: 		if(Timeout == 0x00 )
CMP	R2, #0
IT	NE
BNE	L__FLASH_WaitForLastOperation107
; Timeout end address is: 8 (R2)
;stm32f10x_flash.c,1609 :: 		status = FLASH_TIMEOUT;
MOVS	R0, #5
; status end address is: 0 (R0)
;stm32f10x_flash.c,1610 :: 		}
IT	AL
BAL	L_FLASH_WaitForLastOperation91
L__FLASH_WaitForLastOperation107:
;stm32f10x_flash.c,1607 :: 		if(Timeout == 0x00 )
;stm32f10x_flash.c,1610 :: 		}
L_FLASH_WaitForLastOperation91:
;stm32f10x_flash.c,1612 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f10x_flash.c,1613 :: 		}
L_end_FLASH_WaitForLastOperation:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_WaitForLastOperation
_FLASH_WaitForLastBank1Operation:
;stm32f10x_flash.c,1623 :: 		FLASH_Status FLASH_WaitForLastBank1Operation(uint32_t Timeout)
; Timeout start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R1, R0
; Timeout end address is: 0 (R0)
; Timeout start address is: 4 (R1)
;stm32f10x_flash.c,1625 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f10x_flash.c,1628 :: 		status = FLASH_GetBank1Status();
BL	_FLASH_GetBank1Status+0
; status start address is: 8 (R2)
UXTB	R2, R0
; Timeout end address is: 4 (R1)
; status end address is: 8 (R2)
UXTB	R0, R2
MOV	R2, R1
;stm32f10x_flash.c,1630 :: 		while((status == FLASH_FLAG_BANK1_BSY) && (Timeout != 0x00))
L_FLASH_WaitForLastBank1Operation92:
; status start address is: 0 (R0)
; Timeout start address is: 8 (R2)
CMP	R0, #1
IT	NE
BNE	L__FLASH_WaitForLastBank1Operation112
CMP	R2, #0
IT	EQ
BEQ	L__FLASH_WaitForLastBank1Operation111
; status end address is: 0 (R0)
L__FLASH_WaitForLastBank1Operation110:
;stm32f10x_flash.c,1632 :: 		status = FLASH_GetBank1Status();
BL	_FLASH_GetBank1Status+0
; status start address is: 0 (R0)
;stm32f10x_flash.c,1633 :: 		Timeout--;
SUBS	R2, R2, #1
;stm32f10x_flash.c,1634 :: 		}
IT	AL
BAL	L_FLASH_WaitForLastBank1Operation92
;stm32f10x_flash.c,1630 :: 		while((status == FLASH_FLAG_BANK1_BSY) && (Timeout != 0x00))
L__FLASH_WaitForLastBank1Operation112:
L__FLASH_WaitForLastBank1Operation111:
;stm32f10x_flash.c,1635 :: 		if(Timeout == 0x00 )
CMP	R2, #0
IT	NE
BNE	L__FLASH_WaitForLastBank1Operation113
; Timeout end address is: 8 (R2)
;stm32f10x_flash.c,1637 :: 		status = FLASH_TIMEOUT;
MOVS	R0, #5
; status end address is: 0 (R0)
;stm32f10x_flash.c,1638 :: 		}
IT	AL
BAL	L_FLASH_WaitForLastBank1Operation96
L__FLASH_WaitForLastBank1Operation113:
;stm32f10x_flash.c,1635 :: 		if(Timeout == 0x00 )
;stm32f10x_flash.c,1638 :: 		}
L_FLASH_WaitForLastBank1Operation96:
;stm32f10x_flash.c,1640 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f10x_flash.c,1641 :: 		}
L_end_FLASH_WaitForLastBank1Operation:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_WaitForLastBank1Operation
