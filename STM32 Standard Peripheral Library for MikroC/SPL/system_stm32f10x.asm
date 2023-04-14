system_stm32f10x_NVIC_SetPriorityGrouping:
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
; end of system_stm32f10x_NVIC_SetPriorityGrouping
system_stm32f10x_NVIC_GetPriorityGrouping:
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
; end of system_stm32f10x_NVIC_GetPriorityGrouping
system_stm32f10x_NVIC_EnableIRQ:
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
; end of system_stm32f10x_NVIC_EnableIRQ
system_stm32f10x_NVIC_DisableIRQ:
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
; end of system_stm32f10x_NVIC_DisableIRQ
system_stm32f10x_NVIC_GetPendingIRQ:
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
BEQ	L_system_stm32f10x_NVIC_GetPendingIRQ0
; ?FLOC__system_stm32f10x_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__system_stm32f10x_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
IT	AL
BAL	L_system_stm32f10x_NVIC_GetPendingIRQ1
L_system_stm32f10x_NVIC_GetPendingIRQ0:
; ?FLOC__system_stm32f10x_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__system_stm32f10x_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
L_system_stm32f10x_NVIC_GetPendingIRQ1:
; ?FLOC__system_stm32f10x_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__system_stm32f10x_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1593 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of system_stm32f10x_NVIC_GetPendingIRQ
system_stm32f10x_NVIC_SetPendingIRQ:
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
; end of system_stm32f10x_NVIC_SetPendingIRQ
system_stm32f10x_NVIC_ClearPendingIRQ:
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
; end of system_stm32f10x_NVIC_ClearPendingIRQ
system_stm32f10x_NVIC_GetActive:
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
BEQ	L_system_stm32f10x_NVIC_GetActive2
; ?FLOC__system_stm32f10x_NVIC_GetActive?T72 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__system_stm32f10x_NVIC_GetActive?T72 end address is: 0 (R0)
IT	AL
BAL	L_system_stm32f10x_NVIC_GetActive3
L_system_stm32f10x_NVIC_GetActive2:
; ?FLOC__system_stm32f10x_NVIC_GetActive?T72 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__system_stm32f10x_NVIC_GetActive?T72 end address is: 0 (R0)
L_system_stm32f10x_NVIC_GetActive3:
; ?FLOC__system_stm32f10x_NVIC_GetActive?T72 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__system_stm32f10x_NVIC_GetActive?T72 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1633 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of system_stm32f10x_NVIC_GetActive
system_stm32f10x_NVIC_SetPriority:
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
BGE	L_system_stm32f10x_NVIC_SetPriority4
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
BAL	L_system_stm32f10x_NVIC_SetPriority5
L_system_stm32f10x_NVIC_SetPriority4:
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
L_system_stm32f10x_NVIC_SetPriority5:
;core_cm3.h,1653 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of system_stm32f10x_NVIC_SetPriority
system_stm32f10x_NVIC_GetPriority:
;core_cm3.h,1670 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1673 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_system_stm32f10x_NVIC_GetPriority6
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
L_system_stm32f10x_NVIC_GetPriority6:
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
; end of system_stm32f10x_NVIC_GetPriority
system_stm32f10x_NVIC_EncodePriority:
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
BLS	L_system_stm32f10x_NVIC_EncodePriority8
; ?FLOC__system_stm32f10x_NVIC_EncodePriority?T112 start address is: 12 (R3)
MOVW	R3, #4
; ?FLOC__system_stm32f10x_NVIC_EncodePriority?T112 end address is: 12 (R3)
IT	AL
BAL	L_system_stm32f10x_NVIC_EncodePriority9
L_system_stm32f10x_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__system_stm32f10x_NVIC_EncodePriority?T112 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__system_stm32f10x_NVIC_EncodePriority?T112 end address is: 0 (R0)
MOV	R3, R0
L_system_stm32f10x_NVIC_EncodePriority9:
; ?FLOC__system_stm32f10x_NVIC_EncodePriority?T112 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__system_stm32f10x_NVIC_EncodePriority?T112 end address is: 12 (R3)
;core_cm3.h,1702 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_system_stm32f10x_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__system_stm32f10x_NVIC_EncodePriority?T116 start address is: 20 (R5)
MOVW	R5, #0
; ?FLOC__system_stm32f10x_NVIC_EncodePriority?T116 end address is: 20 (R5)
IT	AL
BAL	L_system_stm32f10x_NVIC_EncodePriority11
L_system_stm32f10x_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__system_stm32f10x_NVIC_EncodePriority?T116 start address is: 20 (R5)
; ?FLOC__system_stm32f10x_NVIC_EncodePriority?T116 end address is: 20 (R5)
L_system_stm32f10x_NVIC_EncodePriority11:
;core_cm3.h,1705 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__system_stm32f10x_NVIC_EncodePriority?T116 start address is: 20 (R5)
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
; ?FLOC__system_stm32f10x_NVIC_EncodePriority?T116 end address is: 20 (R5)
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
; end of system_stm32f10x_NVIC_EncodePriority
system_stm32f10x_NVIC_DecodePriority:
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
BLS	L_system_stm32f10x_NVIC_DecodePriority12
; ?FLOC__system_stm32f10x_NVIC_DecodePriority?T130 start address is: 16 (R4)
MOVW	R4, #4
; ?FLOC__system_stm32f10x_NVIC_DecodePriority?T130 end address is: 16 (R4)
IT	AL
BAL	L_system_stm32f10x_NVIC_DecodePriority13
L_system_stm32f10x_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__system_stm32f10x_NVIC_DecodePriority?T130 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__system_stm32f10x_NVIC_DecodePriority?T130 end address is: 4 (R1)
MOV	R4, R1
L_system_stm32f10x_NVIC_DecodePriority13:
; ?FLOC__system_stm32f10x_NVIC_DecodePriority?T130 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__system_stm32f10x_NVIC_DecodePriority?T130 end address is: 16 (R4)
;core_cm3.h,1733 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_system_stm32f10x_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__system_stm32f10x_NVIC_DecodePriority?T134 start address is: 16 (R4)
MOVW	R4, #0
; ?FLOC__system_stm32f10x_NVIC_DecodePriority?T134 end address is: 16 (R4)
IT	AL
BAL	L_system_stm32f10x_NVIC_DecodePriority15
L_system_stm32f10x_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__system_stm32f10x_NVIC_DecodePriority?T134 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__system_stm32f10x_NVIC_DecodePriority?T134 end address is: 20 (R5)
MOV	R4, R5
L_system_stm32f10x_NVIC_DecodePriority15:
; ?FLOC__system_stm32f10x_NVIC_DecodePriority?T134 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm3.h,1735 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__system_stm32f10x_NVIC_DecodePriority?T134 end address is: 16 (R4)
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
; end of system_stm32f10x_NVIC_DecodePriority
system_stm32f10x_SysTick_Config:
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
BLS	L_system_stm32f10x_SysTick_Config16
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_system_stm32f10x_SysTick_Config16:
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
BL	system_stm32f10x_NVIC_SetPriority+0
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
; end of system_stm32f10x_SysTick_Config
system_stm32f10x_NVIC_SystemReset:
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
L_system_stm32f10x_NVIC_SystemReset17:
IT	AL
BAL	L_system_stm32f10x_NVIC_SystemReset17
;core_cm3.h,1787 :: 		}
L_end_NVIC_SystemReset:
BX	LR
; end of system_stm32f10x_NVIC_SystemReset
system_stm32f10x_ITM_SendChar:
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
BEQ	L_system_stm32f10x_ITM_SendChar54
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_system_stm32f10x_ITM_SendChar55
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_system_stm32f10x_ITM_SendChar56
L_system_stm32f10x_ITM_SendChar50:
;core_cm3.h,1823 :: 		while (ITM->PORT[0].u32 == 0);
L_system_stm32f10x_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_system_stm32f10x_ITM_SendChar23
IT	AL
BAL	L_system_stm32f10x_ITM_SendChar22
L_system_stm32f10x_ITM_SendChar23:
;core_cm3.h,1824 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm3.h,1820 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_system_stm32f10x_ITM_SendChar53
L_system_stm32f10x_ITM_SendChar54:
L_system_stm32f10x_ITM_SendChar53:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_system_stm32f10x_ITM_SendChar52
L_system_stm32f10x_ITM_SendChar55:
L_system_stm32f10x_ITM_SendChar52:
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_system_stm32f10x_ITM_SendChar51
L_system_stm32f10x_ITM_SendChar56:
L_system_stm32f10x_ITM_SendChar51:
;core_cm3.h,1826 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm3.h,1827 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of system_stm32f10x_ITM_SendChar
system_stm32f10x_ITM_ReceiveChar:
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
BEQ	L_system_stm32f10x_ITM_ReceiveChar24
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
L_system_stm32f10x_ITM_ReceiveChar24:
;core_cm3.h,1847 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm3.h,1848 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of system_stm32f10x_ITM_ReceiveChar
system_stm32f10x_ITM_CheckChar:
;core_cm3.h,1859 :: 		static __INLINE int ITM_CheckChar (void) {
;core_cm3.h,1861 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_system_stm32f10x_ITM_CheckChar25
;core_cm3.h,1862 :: 		return (0);                                 /* no character available */
MOVW	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm3.h,1863 :: 		} else {
L_system_stm32f10x_ITM_CheckChar25:
;core_cm3.h,1864 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm3.h,1866 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of system_stm32f10x_ITM_CheckChar
_SystemInit:
;system_stm32f10x.c,212 :: 		void SystemInit (void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;system_stm32f10x.c,216 :: 		RCC->CR |= (uint32_t)0x00000001;
MOVW	R5, #4096
MOVT	R5, #16386
LDR	R0, [R5, #0]
ORR	R4, R0, #1
STR	R4, [R5, #0]
;system_stm32f10x.c,220 :: 		RCC->CFGR &= (uint32_t)0xF8FF0000;
MOVW	R3, #4100
MOVT	R3, #16386
LDR	R1, [R3, #0]
MOVW	R0, #0
MOVT	R0, #63743
AND	R2, R1, R0, LSL #0
STR	R2, [R3, #0]
;system_stm32f10x.c,226 :: 		RCC->CR &= (uint32_t)0xFEF6FFFF;
MOVW	R0, #65535
MOVT	R0, #65270
AND	R1, R4, R0, LSL #0
STR	R1, [R5, #0]
;system_stm32f10x.c,229 :: 		RCC->CR &= (uint32_t)0xFFFBFFFF;
MVN	R0, #262144
AND	R0, R1, R0, LSL #0
STR	R0, [R5, #0]
;system_stm32f10x.c,232 :: 		RCC->CFGR &= (uint32_t)0xFF80FFFF;
MVN	R0, #8323072
AND	R0, R2, R0, LSL #0
STR	R0, [R3, #0]
;system_stm32f10x.c,251 :: 		RCC->CIR = 0x009F0000;
MOV	R1, #10420224
MOVW	R0, #4104
MOVT	R0, #16386
STR	R1, [R0, #0]
;system_stm32f10x.c,262 :: 		SetSysClock();
BL	system_stm32f10x_SetSysClock+0
;system_stm32f10x.c,267 :: 		SCB->VTOR = FLASH_BASE | VECT_TAB_OFFSET; /* Vector Table Relocation in Internal FLASH. */
MOV	R1, #134217728
MOVW	R0, #60680
MOVT	R0, #57344
STR	R1, [R0, #0]
;system_stm32f10x.c,269 :: 		}
L_end_SystemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _SystemInit
_SystemCoreClockUpdate:
;system_stm32f10x.c,306 :: 		void SystemCoreClockUpdate (void)
;system_stm32f10x.c,308 :: 		uint32_t tmp = 0, pllmull = 0, pllsource = 0;
;system_stm32f10x.c,319 :: 		tmp = RCC->CFGR & RCC_CFGR_SWS;
MOVW	R0, #4100
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #12
; tmp start address is: 0 (R0)
;system_stm32f10x.c,321 :: 		switch (tmp)
IT	AL
BAL	L_SystemCoreClockUpdate27
; tmp end address is: 0 (R0)
;system_stm32f10x.c,323 :: 		case 0x00:  /* HSI used as system clock */
L_SystemCoreClockUpdate29:
;system_stm32f10x.c,324 :: 		SystemCoreClock = HSI_VALUE;
MOVW	R1, #4608
MOVT	R1, #122
MOVW	R0, #lo_addr(_SystemCoreClock+0)
MOVT	R0, #hi_addr(_SystemCoreClock+0)
STR	R1, [R0, #0]
;system_stm32f10x.c,325 :: 		break;
IT	AL
BAL	L_SystemCoreClockUpdate28
;system_stm32f10x.c,326 :: 		case 0x04:  /* HSE used as system clock */
L_SystemCoreClockUpdate30:
;system_stm32f10x.c,327 :: 		SystemCoreClock = HSE_VALUE;
MOVW	R1, #4608
MOVT	R1, #122
MOVW	R0, #lo_addr(_SystemCoreClock+0)
MOVT	R0, #hi_addr(_SystemCoreClock+0)
STR	R1, [R0, #0]
;system_stm32f10x.c,328 :: 		break;
IT	AL
BAL	L_SystemCoreClockUpdate28
;system_stm32f10x.c,329 :: 		case 0x08:  /* PLL used as system clock */
L_SystemCoreClockUpdate31:
;system_stm32f10x.c,332 :: 		pllmull = RCC->CFGR & RCC_CFGR_PLLMULL;
MOVW	R1, #4100
MOVT	R1, #16386
LDR	R0, [R1, #0]
AND	R2, R0, #3932160
;system_stm32f10x.c,333 :: 		pllsource = RCC->CFGR & RCC_CFGR_PLLSRC;
MOV	R0, R1
LDR	R0, [R0, #0]
AND	R1, R0, #65536
;system_stm32f10x.c,336 :: 		pllmull = ( pllmull >> 18) + 2;
LSRS	R0, R2, #18
ADDS	R0, R0, #2
; pllmull start address is: 8 (R2)
MOV	R2, R0
;system_stm32f10x.c,338 :: 		if (pllsource == 0x00)
CMP	R1, #0
IT	NE
BNE	L_SystemCoreClockUpdate32
;system_stm32f10x.c,341 :: 		SystemCoreClock = (HSI_VALUE >> 1) * pllmull;
MOVW	R0, #2304
MOVT	R0, #61
MUL	R1, R0, R2
; pllmull end address is: 8 (R2)
MOVW	R0, #lo_addr(_SystemCoreClock+0)
MOVT	R0, #hi_addr(_SystemCoreClock+0)
STR	R1, [R0, #0]
;system_stm32f10x.c,342 :: 		}
IT	AL
BAL	L_SystemCoreClockUpdate33
L_SystemCoreClockUpdate32:
;system_stm32f10x.c,351 :: 		if ((RCC->CFGR & RCC_CFGR_PLLXTPRE) != (uint32_t)RESET)
; pllmull start address is: 8 (R2)
MOVW	R0, #4100
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #131072
CMP	R0, #0
IT	EQ
BEQ	L_SystemCoreClockUpdate34
;system_stm32f10x.c,353 :: 		SystemCoreClock = (HSE_VALUE >> 1) * pllmull;
MOVW	R0, #2304
MOVT	R0, #61
MUL	R1, R0, R2
; pllmull end address is: 8 (R2)
MOVW	R0, #lo_addr(_SystemCoreClock+0)
MOVT	R0, #hi_addr(_SystemCoreClock+0)
STR	R1, [R0, #0]
;system_stm32f10x.c,354 :: 		}
IT	AL
BAL	L_SystemCoreClockUpdate35
L_SystemCoreClockUpdate34:
;system_stm32f10x.c,357 :: 		SystemCoreClock = HSE_VALUE * pllmull;
; pllmull start address is: 8 (R2)
MOVW	R0, #4608
MOVT	R0, #122
MUL	R1, R0, R2
; pllmull end address is: 8 (R2)
MOVW	R0, #lo_addr(_SystemCoreClock+0)
MOVT	R0, #hi_addr(_SystemCoreClock+0)
STR	R1, [R0, #0]
;system_stm32f10x.c,358 :: 		}
L_SystemCoreClockUpdate35:
;system_stm32f10x.c,360 :: 		}
L_SystemCoreClockUpdate33:
;system_stm32f10x.c,400 :: 		break;
IT	AL
BAL	L_SystemCoreClockUpdate28
;system_stm32f10x.c,402 :: 		default:
L_SystemCoreClockUpdate36:
;system_stm32f10x.c,403 :: 		SystemCoreClock = HSI_VALUE;
MOVW	R1, #4608
MOVT	R1, #122
MOVW	R0, #lo_addr(_SystemCoreClock+0)
MOVT	R0, #hi_addr(_SystemCoreClock+0)
STR	R1, [R0, #0]
;system_stm32f10x.c,404 :: 		break;
IT	AL
BAL	L_SystemCoreClockUpdate28
;system_stm32f10x.c,405 :: 		}
L_SystemCoreClockUpdate27:
; tmp start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_SystemCoreClockUpdate29
CMP	R0, #4
IT	EQ
BEQ	L_SystemCoreClockUpdate30
CMP	R0, #8
IT	EQ
BEQ	L_SystemCoreClockUpdate31
; tmp end address is: 0 (R0)
IT	AL
BAL	L_SystemCoreClockUpdate36
L_SystemCoreClockUpdate28:
;system_stm32f10x.c,409 :: 		tmp = AHBPrescTable[((RCC->CFGR & RCC_CFGR_HPRE) >> 4)];
MOVW	R0, #4100
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #240
LSRS	R1, R0, #4
MOVW	R0, #lo_addr(_AHBPrescTable+0)
MOVT	R0, #hi_addr(_AHBPrescTable+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
; tmp start address is: 8 (R2)
UXTB	R2, R0
;system_stm32f10x.c,411 :: 		SystemCoreClock >>= tmp;
MOVW	R1, #lo_addr(_SystemCoreClock+0)
MOVT	R1, #hi_addr(_SystemCoreClock+0)
LDR	R0, [R1, #0]
LSRS	R0, R2
; tmp end address is: 8 (R2)
STR	R0, [R1, #0]
;system_stm32f10x.c,412 :: 		}
L_end_SystemCoreClockUpdate:
BX	LR
; end of _SystemCoreClockUpdate
system_stm32f10x_SetSysClock:
;system_stm32f10x.c,419 :: 		static void SetSysClock(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;system_stm32f10x.c,432 :: 		SetSysClockTo72();
BL	system_stm32f10x_SetSysClockTo72+0
;system_stm32f10x.c,437 :: 		}
L_end_SetSysClock:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of system_stm32f10x_SetSysClock
system_stm32f10x_SetSysClockTo72:
;system_stm32f10x.c,987 :: 		static void SetSysClockTo72(void)
;system_stm32f10x.c,989 :: 		__IO uint32_t StartUpCounter = 0, HSEStatus = 0;
; StartUpCounter start address is: 8 (R2)
MOV	R2, #0
;system_stm32f10x.c,993 :: 		RCC->CR |= ((uint32_t)RCC_CR_HSEON);
MOVW	R1, #4096
MOVT	R1, #16386
LDR	R0, [R1, #0]
ORR	R0, R0, #65536
STR	R0, [R1, #0]
;system_stm32f10x.c,996 :: 		do
L_system_stm32f10x_SetSysClockTo7237:
;system_stm32f10x.c,998 :: 		HSEStatus = RCC->CR & RCC_CR_HSERDY;
; StartUpCounter start address is: 8 (R2)
MOVW	R0, #4096
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #131072
; HSEStatus start address is: 4 (R1)
MOV	R1, R0
;system_stm32f10x.c,999 :: 		StartUpCounter++;
ADDS	R0, R2, #1
MOV	R2, R0
; StartUpCounter end address is: 8 (R2)
;system_stm32f10x.c,1000 :: 		} while((HSEStatus == 0) && (StartUpCounter != HSE_STARTUP_TIMEOUT));
CMP	R1, #0
IT	NE
BNE	L_system_stm32f10x_SetSysClockTo7259
; StartUpCounter end address is: 8 (R2)
; StartUpCounter start address is: 8 (R2)
CMP	R2, #1280
IT	EQ
BEQ	L_system_stm32f10x_SetSysClockTo7258
; HSEStatus end address is: 4 (R1)
; StartUpCounter end address is: 8 (R2)
IT	AL
BAL	L_system_stm32f10x_SetSysClockTo7237
L_system_stm32f10x_SetSysClockTo7259:
L_system_stm32f10x_SetSysClockTo7258:
;system_stm32f10x.c,1002 :: 		if ((RCC->CR & RCC_CR_HSERDY) != RESET)
MOVW	R0, #4096
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #131072
CMP	R0, #0
IT	EQ
BEQ	L_system_stm32f10x_SetSysClockTo7242
;system_stm32f10x.c,1004 :: 		HSEStatus = (uint32_t)0x01;
; HSEStatus start address is: 0 (R0)
MOV	R0, #1
;system_stm32f10x.c,1005 :: 		}
; HSEStatus end address is: 0 (R0)
IT	AL
BAL	L_system_stm32f10x_SetSysClockTo7243
L_system_stm32f10x_SetSysClockTo7242:
;system_stm32f10x.c,1008 :: 		HSEStatus = (uint32_t)0x00;
; HSEStatus start address is: 0 (R0)
MOV	R0, #0
; HSEStatus end address is: 0 (R0)
;system_stm32f10x.c,1009 :: 		}
L_system_stm32f10x_SetSysClockTo7243:
;system_stm32f10x.c,1011 :: 		if (HSEStatus == (uint32_t)0x01)
; HSEStatus start address is: 0 (R0)
CMP	R0, #1
IT	NE
BNE	L_system_stm32f10x_SetSysClockTo7244
; HSEStatus end address is: 0 (R0)
;system_stm32f10x.c,1014 :: 		FLASH->ACR |= FLASH_ACR_PRFTBE;
MOVW	R1, #8192
MOVT	R1, #16386
LDR	R0, [R1, #0]
ORR	R0, R0, #16
STR	R0, [R1, #0]
;system_stm32f10x.c,1017 :: 		FLASH->ACR &= (uint32_t)((uint32_t)~FLASH_ACR_LATENCY);
AND	R0, R0, #252
STR	R0, [R1, #0]
;system_stm32f10x.c,1018 :: 		FLASH->ACR |= (uint32_t)FLASH_ACR_LATENCY_2;
ORR	R0, R0, #2
STR	R0, [R1, #0]
;system_stm32f10x.c,1022 :: 		RCC->CFGR |= (uint32_t)RCC_CFGR_HPRE_DIV1;
;system_stm32f10x.c,1025 :: 		RCC->CFGR |= (uint32_t)RCC_CFGR_PPRE2_DIV1;
;system_stm32f10x.c,1028 :: 		RCC->CFGR |= (uint32_t)RCC_CFGR_PPRE1_DIV2;
MOVW	R2, #4100
MOVT	R2, #16386
LDR	R0, [R2, #0]
ORR	R1, R0, #1024
STR	R1, [R2, #0]
;system_stm32f10x.c,1055 :: 		RCC_CFGR_PLLMULL));
MVN	R0, #4128768
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;system_stm32f10x.c,1056 :: 		RCC->CFGR |= (uint32_t)(RCC_CFGR_PLLSRC_HSE | RCC_CFGR_PLLMULL9);
ORR	R0, R0, #1900544
STR	R0, [R2, #0]
;system_stm32f10x.c,1060 :: 		RCC->CR |= RCC_CR_PLLON;
MOVW	R1, #4096
MOVT	R1, #16386
LDR	R0, [R1, #0]
ORR	R0, R0, #16777216
STR	R0, [R1, #0]
;system_stm32f10x.c,1063 :: 		while((RCC->CR & RCC_CR_PLLRDY) == 0)
L_system_stm32f10x_SetSysClockTo7245:
MOVW	R0, #4096
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #33554432
CMP	R0, #0
IT	NE
BNE	L_system_stm32f10x_SetSysClockTo7246
;system_stm32f10x.c,1065 :: 		}
IT	AL
BAL	L_system_stm32f10x_SetSysClockTo7245
L_system_stm32f10x_SetSysClockTo7246:
;system_stm32f10x.c,1068 :: 		RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_SW));
MOVW	R2, #4100
MOVT	R2, #16386
LDR	R1, [R2, #0]
MVN	R0, #3
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;system_stm32f10x.c,1069 :: 		RCC->CFGR |= (uint32_t)RCC_CFGR_SW_PLL;
ORR	R0, R0, #2
STR	R0, [R2, #0]
;system_stm32f10x.c,1072 :: 		while ((RCC->CFGR & (uint32_t)RCC_CFGR_SWS) != (uint32_t)0x08)
L_system_stm32f10x_SetSysClockTo7247:
MOVW	R0, #4100
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #12
CMP	R0, #8
IT	EQ
BEQ	L_system_stm32f10x_SetSysClockTo7248
;system_stm32f10x.c,1074 :: 		}
IT	AL
BAL	L_system_stm32f10x_SetSysClockTo7247
L_system_stm32f10x_SetSysClockTo7248:
;system_stm32f10x.c,1075 :: 		}
IT	AL
BAL	L_system_stm32f10x_SetSysClockTo7249
L_system_stm32f10x_SetSysClockTo7244:
;system_stm32f10x.c,1079 :: 		}
L_system_stm32f10x_SetSysClockTo7249:
;system_stm32f10x.c,1080 :: 		}
L_end_SetSysClockTo72:
BX	LR
; end of system_stm32f10x_SetSysClockTo72
