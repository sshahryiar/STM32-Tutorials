stm32f10x_i2c_NVIC_SetPriorityGrouping:
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
; end of stm32f10x_i2c_NVIC_SetPriorityGrouping
stm32f10x_i2c_NVIC_GetPriorityGrouping:
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
; end of stm32f10x_i2c_NVIC_GetPriorityGrouping
stm32f10x_i2c_NVIC_EnableIRQ:
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
; end of stm32f10x_i2c_NVIC_EnableIRQ
stm32f10x_i2c_NVIC_DisableIRQ:
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
; end of stm32f10x_i2c_NVIC_DisableIRQ
stm32f10x_i2c_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f10x_i2c_NVIC_GetPendingIRQ0
; ?FLOC__stm32f10x_i2c_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_i2c_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_i2c_NVIC_GetPendingIRQ1
L_stm32f10x_i2c_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f10x_i2c_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_i2c_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
L_stm32f10x_i2c_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f10x_i2c_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_i2c_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1593 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f10x_i2c_NVIC_GetPendingIRQ
stm32f10x_i2c_NVIC_SetPendingIRQ:
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
; end of stm32f10x_i2c_NVIC_SetPendingIRQ
stm32f10x_i2c_NVIC_ClearPendingIRQ:
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
; end of stm32f10x_i2c_NVIC_ClearPendingIRQ
stm32f10x_i2c_NVIC_GetActive:
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
BEQ	L_stm32f10x_i2c_NVIC_GetActive2
; ?FLOC__stm32f10x_i2c_NVIC_GetActive?T72 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_i2c_NVIC_GetActive?T72 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_i2c_NVIC_GetActive3
L_stm32f10x_i2c_NVIC_GetActive2:
; ?FLOC__stm32f10x_i2c_NVIC_GetActive?T72 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_i2c_NVIC_GetActive?T72 end address is: 0 (R0)
L_stm32f10x_i2c_NVIC_GetActive3:
; ?FLOC__stm32f10x_i2c_NVIC_GetActive?T72 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_i2c_NVIC_GetActive?T72 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1633 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f10x_i2c_NVIC_GetActive
stm32f10x_i2c_NVIC_SetPriority:
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
BGE	L_stm32f10x_i2c_NVIC_SetPriority4
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
BAL	L_stm32f10x_i2c_NVIC_SetPriority5
L_stm32f10x_i2c_NVIC_SetPriority4:
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
L_stm32f10x_i2c_NVIC_SetPriority5:
;core_cm3.h,1653 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f10x_i2c_NVIC_SetPriority
stm32f10x_i2c_NVIC_GetPriority:
;core_cm3.h,1670 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1673 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f10x_i2c_NVIC_GetPriority6
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
L_stm32f10x_i2c_NVIC_GetPriority6:
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
; end of stm32f10x_i2c_NVIC_GetPriority
stm32f10x_i2c_NVIC_EncodePriority:
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
BLS	L_stm32f10x_i2c_NVIC_EncodePriority8
; ?FLOC__stm32f10x_i2c_NVIC_EncodePriority?T112 start address is: 12 (R3)
MOVW	R3, #4
; ?FLOC__stm32f10x_i2c_NVIC_EncodePriority?T112 end address is: 12 (R3)
IT	AL
BAL	L_stm32f10x_i2c_NVIC_EncodePriority9
L_stm32f10x_i2c_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f10x_i2c_NVIC_EncodePriority?T112 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_i2c_NVIC_EncodePriority?T112 end address is: 0 (R0)
MOV	R3, R0
L_stm32f10x_i2c_NVIC_EncodePriority9:
; ?FLOC__stm32f10x_i2c_NVIC_EncodePriority?T112 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_i2c_NVIC_EncodePriority?T112 end address is: 12 (R3)
;core_cm3.h,1702 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f10x_i2c_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f10x_i2c_NVIC_EncodePriority?T116 start address is: 20 (R5)
MOVW	R5, #0
; ?FLOC__stm32f10x_i2c_NVIC_EncodePriority?T116 end address is: 20 (R5)
IT	AL
BAL	L_stm32f10x_i2c_NVIC_EncodePriority11
L_stm32f10x_i2c_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f10x_i2c_NVIC_EncodePriority?T116 start address is: 20 (R5)
; ?FLOC__stm32f10x_i2c_NVIC_EncodePriority?T116 end address is: 20 (R5)
L_stm32f10x_i2c_NVIC_EncodePriority11:
;core_cm3.h,1705 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f10x_i2c_NVIC_EncodePriority?T116 start address is: 20 (R5)
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
; ?FLOC__stm32f10x_i2c_NVIC_EncodePriority?T116 end address is: 20 (R5)
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
; end of stm32f10x_i2c_NVIC_EncodePriority
stm32f10x_i2c_NVIC_DecodePriority:
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
BLS	L_stm32f10x_i2c_NVIC_DecodePriority12
; ?FLOC__stm32f10x_i2c_NVIC_DecodePriority?T130 start address is: 16 (R4)
MOVW	R4, #4
; ?FLOC__stm32f10x_i2c_NVIC_DecodePriority?T130 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_i2c_NVIC_DecodePriority13
L_stm32f10x_i2c_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f10x_i2c_NVIC_DecodePriority?T130 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_i2c_NVIC_DecodePriority?T130 end address is: 4 (R1)
MOV	R4, R1
L_stm32f10x_i2c_NVIC_DecodePriority13:
; ?FLOC__stm32f10x_i2c_NVIC_DecodePriority?T130 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_i2c_NVIC_DecodePriority?T130 end address is: 16 (R4)
;core_cm3.h,1733 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f10x_i2c_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f10x_i2c_NVIC_DecodePriority?T134 start address is: 16 (R4)
MOVW	R4, #0
; ?FLOC__stm32f10x_i2c_NVIC_DecodePriority?T134 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_i2c_NVIC_DecodePriority15
L_stm32f10x_i2c_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f10x_i2c_NVIC_DecodePriority?T134 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f10x_i2c_NVIC_DecodePriority?T134 end address is: 20 (R5)
MOV	R4, R5
L_stm32f10x_i2c_NVIC_DecodePriority15:
; ?FLOC__stm32f10x_i2c_NVIC_DecodePriority?T134 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm3.h,1735 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f10x_i2c_NVIC_DecodePriority?T134 end address is: 16 (R4)
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
; end of stm32f10x_i2c_NVIC_DecodePriority
stm32f10x_i2c_SysTick_Config:
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
BLS	L_stm32f10x_i2c_SysTick_Config16
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f10x_i2c_SysTick_Config16:
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
BL	stm32f10x_i2c_NVIC_SetPriority+0
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
; end of stm32f10x_i2c_SysTick_Config
stm32f10x_i2c_NVIC_SystemReset:
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
L_stm32f10x_i2c_NVIC_SystemReset17:
IT	AL
BAL	L_stm32f10x_i2c_NVIC_SystemReset17
;core_cm3.h,1787 :: 		}
L_end_NVIC_SystemReset:
BX	LR
; end of stm32f10x_i2c_NVIC_SystemReset
stm32f10x_i2c_ITM_SendChar:
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
BEQ	L_stm32f10x_i2c_ITM_SendChar87
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_i2c_ITM_SendChar88
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_i2c_ITM_SendChar89
L_stm32f10x_i2c_ITM_SendChar83:
;core_cm3.h,1823 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f10x_i2c_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f10x_i2c_ITM_SendChar23
IT	AL
BAL	L_stm32f10x_i2c_ITM_SendChar22
L_stm32f10x_i2c_ITM_SendChar23:
;core_cm3.h,1824 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm3.h,1820 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f10x_i2c_ITM_SendChar86
L_stm32f10x_i2c_ITM_SendChar87:
L_stm32f10x_i2c_ITM_SendChar86:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_i2c_ITM_SendChar85
L_stm32f10x_i2c_ITM_SendChar88:
L_stm32f10x_i2c_ITM_SendChar85:
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_i2c_ITM_SendChar84
L_stm32f10x_i2c_ITM_SendChar89:
L_stm32f10x_i2c_ITM_SendChar84:
;core_cm3.h,1826 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm3.h,1827 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f10x_i2c_ITM_SendChar
stm32f10x_i2c_ITM_ReceiveChar:
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
BEQ	L_stm32f10x_i2c_ITM_ReceiveChar24
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
L_stm32f10x_i2c_ITM_ReceiveChar24:
;core_cm3.h,1847 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm3.h,1848 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f10x_i2c_ITM_ReceiveChar
stm32f10x_i2c_ITM_CheckChar:
;core_cm3.h,1859 :: 		static __INLINE int ITM_CheckChar (void) {
;core_cm3.h,1861 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f10x_i2c_ITM_CheckChar25
;core_cm3.h,1862 :: 		return (0);                                 /* no character available */
MOVW	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm3.h,1863 :: 		} else {
L_stm32f10x_i2c_ITM_CheckChar25:
;core_cm3.h,1864 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm3.h,1866 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f10x_i2c_ITM_CheckChar
_I2C_DeInit:
;stm32f10x_i2c.c,162 :: 		void I2C_DeInit(I2C_TypeDef* I2Cx)
; I2Cx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
;stm32f10x_i2c.c,167 :: 		if (I2Cx == I2C1)
MOVW	R1, #21504
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_I2C_DeInit27
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,170 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_I2C1, ENABLE);
MOVS	R1, #1
MOV	R0, #2097152
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_i2c.c,172 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_I2C1, DISABLE);
MOVS	R1, #0
MOV	R0, #2097152
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_i2c.c,173 :: 		}
IT	AL
BAL	L_I2C_DeInit28
L_I2C_DeInit27:
;stm32f10x_i2c.c,177 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_I2C2, ENABLE);
MOVS	R1, #1
MOV	R0, #4194304
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_i2c.c,179 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_I2C2, DISABLE);
MOVS	R1, #0
MOV	R0, #4194304
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_i2c.c,180 :: 		}
L_I2C_DeInit28:
;stm32f10x_i2c.c,181 :: 		}
L_end_I2C_DeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _I2C_DeInit
_I2C_Init:
;stm32f10x_i2c.c,191 :: 		void I2C_Init(I2C_TypeDef* I2Cx, I2C_InitTypeDef* I2C_InitStruct)
; I2C_InitStruct start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
SUB	SP, SP, #36
STR	LR, [SP, #0]
; I2C_InitStruct end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; I2C_InitStruct start address is: 4 (R1)
;stm32f10x_i2c.c,193 :: 		uint16_t tmpreg = 0, freqrange = 0;
;stm32f10x_i2c.c,194 :: 		uint16_t result = 0x04;
;stm32f10x_i2c.c,195 :: 		uint32_t pclk1 = 8000000;
;stm32f10x_i2c.c,208 :: 		tmpreg = I2Cx->CR2;
ADDS	R2, R0, #4
LDRH	R3, [R2, #0]
;stm32f10x_i2c.c,210 :: 		tmpreg &= CR2_FREQ_Reset;
MOVW	R2, #65472
AND	R4, R3, R2, LSL #0
UXTH	R4, R4
; tmpreg start address is: 16 (R4)
;stm32f10x_i2c.c,212 :: 		RCC_GetClocksFreq(&rcc_clocks);
ADD	R2, SP, #16
STRH	R4, [SP, #4]
STR	R1, [SP, #8]
STR	R0, [SP, #12]
MOV	R0, R2
BL	_RCC_GetClocksFreq+0
LDR	R0, [SP, #12]
LDR	R1, [SP, #8]
LDRH	R4, [SP, #4]
;stm32f10x_i2c.c,213 :: 		pclk1 = rcc_clocks.PCLK1_Frequency;
; pclk1 start address is: 24 (R6)
LDR	R6, [SP, #24]
;stm32f10x_i2c.c,215 :: 		freqrange = (uint16_t)(pclk1 / 1000000);
LDR	R3, [SP, #24]
MOVW	R2, #16960
MOVT	R2, #15
UDIV	R2, R3, R2
; freqrange start address is: 20 (R5)
UXTH	R5, R2
;stm32f10x_i2c.c,216 :: 		tmpreg |= freqrange;
UXTH	R2, R2
ORR	R3, R4, R2, LSL #0
; tmpreg end address is: 16 (R4)
;stm32f10x_i2c.c,218 :: 		I2Cx->CR2 = tmpreg;
ADDS	R2, R0, #4
STRH	R3, [R2, #0]
;stm32f10x_i2c.c,222 :: 		I2Cx->CR1 &= CR1_PE_Reset;
LDRH	R3, [R0, #0]
MOVW	R2, #65534
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
;stm32f10x_i2c.c,225 :: 		tmpreg = 0;
; tmpreg start address is: 16 (R4)
MOVW	R4, #0
;stm32f10x_i2c.c,228 :: 		if (I2C_InitStruct->I2C_ClockSpeed <= 100000)
LDR	R3, [R1, #0]
MOVW	R2, #34464
MOVT	R2, #1
CMP	R3, R2
IT	HI
BHI	L_I2C_Init29
;stm32f10x_i2c.c,231 :: 		result = (uint16_t)(pclk1 / (I2C_InitStruct->I2C_ClockSpeed << 1));
LDR	R2, [R1, #0]
LSLS	R2, R2, #1
UDIV	R2, R6, R2
; pclk1 end address is: 24 (R6)
; result start address is: 12 (R3)
UXTH	R3, R2
;stm32f10x_i2c.c,233 :: 		if (result < 0x04)
UXTH	R2, R2
CMP	R2, #4
IT	CS
BCS	L__I2C_Init90
; result end address is: 12 (R3)
;stm32f10x_i2c.c,236 :: 		result = 0x04;
; result start address is: 8 (R2)
MOVW	R2, #4
; result end address is: 8 (R2)
UXTH	R3, R2
;stm32f10x_i2c.c,237 :: 		}
IT	AL
BAL	L_I2C_Init30
L__I2C_Init90:
;stm32f10x_i2c.c,233 :: 		if (result < 0x04)
;stm32f10x_i2c.c,237 :: 		}
L_I2C_Init30:
;stm32f10x_i2c.c,239 :: 		tmpreg |= result;
; result start address is: 12 (R3)
ORRS	R4, R3
UXTH	R4, R4
; result end address is: 12 (R3)
;stm32f10x_i2c.c,241 :: 		I2Cx->TRISE = freqrange + 1;
ADDW	R3, R0, #32
ADDS	R2, R5, #1
; freqrange end address is: 20 (R5)
STRH	R2, [R3, #0]
;stm32f10x_i2c.c,242 :: 		}
UXTH	R3, R4
IT	AL
BAL	L_I2C_Init31
L_I2C_Init29:
;stm32f10x_i2c.c,246 :: 		if (I2C_InitStruct->I2C_DutyCycle == I2C_DutyCycle_2)
; freqrange start address is: 20 (R5)
; pclk1 start address is: 24 (R6)
ADDS	R2, R1, #6
LDRH	R3, [R2, #0]
MOVW	R2, #49151
CMP	R3, R2
IT	NE
BNE	L_I2C_Init32
;stm32f10x_i2c.c,249 :: 		result = (uint16_t)(pclk1 / (I2C_InitStruct->I2C_ClockSpeed * 3));
LDR	R3, [R1, #0]
MOVW	R2, #3
MULS	R2, R3, R2
UDIV	R2, R6, R2
; pclk1 end address is: 24 (R6)
; result start address is: 12 (R3)
UXTH	R3, R2
;stm32f10x_i2c.c,250 :: 		}
; result end address is: 12 (R3)
IT	AL
BAL	L_I2C_Init33
L_I2C_Init32:
;stm32f10x_i2c.c,254 :: 		result = (uint16_t)(pclk1 / (I2C_InitStruct->I2C_ClockSpeed * 25));
; pclk1 start address is: 24 (R6)
LDR	R3, [R1, #0]
MOVW	R2, #25
MULS	R2, R3, R2
UDIV	R2, R6, R2
; pclk1 end address is: 24 (R6)
;stm32f10x_i2c.c,256 :: 		result |= I2C_DutyCycle_16_9;
UXTH	R2, R2
ORR	R3, R2, #16384
UXTH	R3, R3
; result start address is: 12 (R3)
; result end address is: 12 (R3)
;stm32f10x_i2c.c,257 :: 		}
L_I2C_Init33:
;stm32f10x_i2c.c,260 :: 		if ((result & CCR_CCR_Set) == 0)
; result start address is: 12 (R3)
MOVW	R2, #4095
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
CMP	R2, #0
IT	NE
BNE	L__I2C_Init91
;stm32f10x_i2c.c,263 :: 		result |= (uint16_t)0x0001;
ORR	R3, R3, #1
UXTH	R3, R3
; result end address is: 12 (R3)
;stm32f10x_i2c.c,264 :: 		}
IT	AL
BAL	L_I2C_Init34
L__I2C_Init91:
;stm32f10x_i2c.c,260 :: 		if ((result & CCR_CCR_Set) == 0)
;stm32f10x_i2c.c,264 :: 		}
L_I2C_Init34:
;stm32f10x_i2c.c,266 :: 		tmpreg |= (uint16_t)(result | CCR_FS_Set);
; result start address is: 12 (R3)
ORR	R2, R3, #32768
UXTH	R2, R2
; result end address is: 12 (R3)
ORR	R2, R4, R2, LSL #0
; tmpreg end address is: 16 (R4)
; tmpreg start address is: 24 (R6)
UXTH	R6, R2
;stm32f10x_i2c.c,268 :: 		I2Cx->TRISE = (uint16_t)(((freqrange * (uint16_t)300) / (uint16_t)1000) + (uint16_t)1);
ADDW	R4, R0, #32
MOVW	R2, #300
MUL	R3, R5, R2
UXTH	R3, R3
; freqrange end address is: 20 (R5)
MOVW	R2, #1000
UDIV	R2, R3, R2
UXTH	R2, R2
ADDS	R2, R2, #1
STRH	R2, [R4, #0]
; tmpreg end address is: 24 (R6)
UXTH	R3, R6
;stm32f10x_i2c.c,269 :: 		}
L_I2C_Init31:
;stm32f10x_i2c.c,272 :: 		I2Cx->CCR = tmpreg;
; tmpreg start address is: 12 (R3)
ADDW	R2, R0, #28
STRH	R3, [R2, #0]
; tmpreg end address is: 12 (R3)
;stm32f10x_i2c.c,274 :: 		I2Cx->CR1 |= CR1_PE_Set;
LDRH	R2, [R0, #0]
ORR	R2, R2, #1
STRH	R2, [R0, #0]
;stm32f10x_i2c.c,278 :: 		tmpreg = I2Cx->CR1;
LDRH	R3, [R0, #0]
;stm32f10x_i2c.c,280 :: 		tmpreg &= CR1_CLEAR_Mask;
MOVW	R2, #64501
AND	R4, R3, R2, LSL #0
UXTH	R4, R4
;stm32f10x_i2c.c,284 :: 		tmpreg |= (uint16_t)((uint32_t)I2C_InitStruct->I2C_Mode | I2C_InitStruct->I2C_Ack);
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
UXTH	R3, R2
ADDW	R2, R1, #10
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
UXTH	R2, R2
ORR	R2, R4, R2, LSL #0
;stm32f10x_i2c.c,286 :: 		I2Cx->CR1 = tmpreg;
STRH	R2, [R0, #0]
;stm32f10x_i2c.c,290 :: 		I2Cx->OAR1 = (I2C_InitStruct->I2C_AcknowledgedAddress | I2C_InitStruct->I2C_OwnAddress1);
ADDW	R4, R0, #8
; I2Cx end address is: 0 (R0)
ADDW	R2, R1, #12
LDRH	R3, [R2, #0]
ADDW	R2, R1, #8
; I2C_InitStruct end address is: 4 (R1)
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_i2c.c,291 :: 		}
L_end_I2C_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #36
BX	LR
; end of _I2C_Init
_I2C_StructInit:
;stm32f10x_i2c.c,298 :: 		void I2C_StructInit(I2C_InitTypeDef* I2C_InitStruct)
; I2C_InitStruct start address is: 0 (R0)
; I2C_InitStruct end address is: 0 (R0)
; I2C_InitStruct start address is: 0 (R0)
;stm32f10x_i2c.c,302 :: 		I2C_InitStruct->I2C_ClockSpeed = 5000;
MOVW	R1, #5000
STR	R1, [R0, #0]
;stm32f10x_i2c.c,304 :: 		I2C_InitStruct->I2C_Mode = I2C_Mode_I2C;
ADDS	R2, R0, #4
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_i2c.c,306 :: 		I2C_InitStruct->I2C_DutyCycle = I2C_DutyCycle_2;
ADDS	R2, R0, #6
MOVW	R1, #49151
STRH	R1, [R2, #0]
;stm32f10x_i2c.c,308 :: 		I2C_InitStruct->I2C_OwnAddress1 = 0;
ADDW	R2, R0, #8
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_i2c.c,310 :: 		I2C_InitStruct->I2C_Ack = I2C_Ack_Disable;
ADDW	R2, R0, #10
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_i2c.c,312 :: 		I2C_InitStruct->I2C_AcknowledgedAddress = I2C_AcknowledgedAddress_7bit;
ADDW	R2, R0, #12
; I2C_InitStruct end address is: 0 (R0)
MOVW	R1, #16384
STRH	R1, [R2, #0]
;stm32f10x_i2c.c,313 :: 		}
L_end_I2C_StructInit:
BX	LR
; end of _I2C_StructInit
_I2C_Cmd:
;stm32f10x_i2c.c,322 :: 		void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_i2c.c,327 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_Cmd35
; NewState end address is: 4 (R1)
;stm32f10x_i2c.c,330 :: 		I2Cx->CR1 |= CR1_PE_Set;
LDRH	R2, [R0, #0]
ORR	R2, R2, #1
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,331 :: 		}
IT	AL
BAL	L_I2C_Cmd36
L_I2C_Cmd35:
;stm32f10x_i2c.c,335 :: 		I2Cx->CR1 &= CR1_PE_Reset;
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65534
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,336 :: 		}
L_I2C_Cmd36:
;stm32f10x_i2c.c,337 :: 		}
L_end_I2C_Cmd:
BX	LR
; end of _I2C_Cmd
_I2C_DMACmd:
;stm32f10x_i2c.c,346 :: 		void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_i2c.c,351 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_DMACmd37
; NewState end address is: 4 (R1)
;stm32f10x_i2c.c,354 :: 		I2Cx->CR2 |= CR2_DMAEN_Set;
ADDS	R3, R0, #4
; I2Cx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #2048
STRH	R2, [R3, #0]
;stm32f10x_i2c.c,355 :: 		}
IT	AL
BAL	L_I2C_DMACmd38
L_I2C_DMACmd37:
;stm32f10x_i2c.c,359 :: 		I2Cx->CR2 &= CR2_DMAEN_Reset;
; I2Cx start address is: 0 (R0)
ADDS	R4, R0, #4
; I2Cx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #63487
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_i2c.c,360 :: 		}
L_I2C_DMACmd38:
;stm32f10x_i2c.c,361 :: 		}
L_end_I2C_DMACmd:
BX	LR
; end of _I2C_DMACmd
_I2C_DMALastTransferCmd:
;stm32f10x_i2c.c,370 :: 		void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_i2c.c,375 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_DMALastTransferCmd39
; NewState end address is: 4 (R1)
;stm32f10x_i2c.c,378 :: 		I2Cx->CR2 |= CR2_LAST_Set;
ADDS	R3, R0, #4
; I2Cx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #4096
STRH	R2, [R3, #0]
;stm32f10x_i2c.c,379 :: 		}
IT	AL
BAL	L_I2C_DMALastTransferCmd40
L_I2C_DMALastTransferCmd39:
;stm32f10x_i2c.c,383 :: 		I2Cx->CR2 &= CR2_LAST_Reset;
; I2Cx start address is: 0 (R0)
ADDS	R4, R0, #4
; I2Cx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #61439
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_i2c.c,384 :: 		}
L_I2C_DMALastTransferCmd40:
;stm32f10x_i2c.c,385 :: 		}
L_end_I2C_DMALastTransferCmd:
BX	LR
; end of _I2C_DMALastTransferCmd
_I2C_GenerateSTART:
;stm32f10x_i2c.c,394 :: 		void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_i2c.c,399 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_GenerateSTART41
; NewState end address is: 4 (R1)
;stm32f10x_i2c.c,402 :: 		I2Cx->CR1 |= CR1_START_Set;
LDRH	R2, [R0, #0]
ORR	R2, R2, #256
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,403 :: 		}
IT	AL
BAL	L_I2C_GenerateSTART42
L_I2C_GenerateSTART41:
;stm32f10x_i2c.c,407 :: 		I2Cx->CR1 &= CR1_START_Reset;
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65279
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,408 :: 		}
L_I2C_GenerateSTART42:
;stm32f10x_i2c.c,409 :: 		}
L_end_I2C_GenerateSTART:
BX	LR
; end of _I2C_GenerateSTART
_I2C_GenerateSTOP:
;stm32f10x_i2c.c,418 :: 		void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_i2c.c,423 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_GenerateSTOP43
; NewState end address is: 4 (R1)
;stm32f10x_i2c.c,426 :: 		I2Cx->CR1 |= CR1_STOP_Set;
LDRH	R2, [R0, #0]
ORR	R2, R2, #512
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,427 :: 		}
IT	AL
BAL	L_I2C_GenerateSTOP44
L_I2C_GenerateSTOP43:
;stm32f10x_i2c.c,431 :: 		I2Cx->CR1 &= CR1_STOP_Reset;
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65023
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,432 :: 		}
L_I2C_GenerateSTOP44:
;stm32f10x_i2c.c,433 :: 		}
L_end_I2C_GenerateSTOP:
BX	LR
; end of _I2C_GenerateSTOP
_I2C_AcknowledgeConfig:
;stm32f10x_i2c.c,442 :: 		void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_i2c.c,447 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_AcknowledgeConfig45
; NewState end address is: 4 (R1)
;stm32f10x_i2c.c,450 :: 		I2Cx->CR1 |= CR1_ACK_Set;
LDRH	R2, [R0, #0]
ORR	R2, R2, #1024
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,451 :: 		}
IT	AL
BAL	L_I2C_AcknowledgeConfig46
L_I2C_AcknowledgeConfig45:
;stm32f10x_i2c.c,455 :: 		I2Cx->CR1 &= CR1_ACK_Reset;
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #64511
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,456 :: 		}
L_I2C_AcknowledgeConfig46:
;stm32f10x_i2c.c,457 :: 		}
L_end_I2C_AcknowledgeConfig:
BX	LR
; end of _I2C_AcknowledgeConfig
_I2C_OwnAddress2Config:
;stm32f10x_i2c.c,465 :: 		void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
; Address start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; Address end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; Address start address is: 4 (R1)
;stm32f10x_i2c.c,467 :: 		uint16_t tmpreg = 0;
;stm32f10x_i2c.c,473 :: 		tmpreg = I2Cx->OAR2;
ADDW	R4, R0, #12
; I2Cx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f10x_i2c.c,476 :: 		tmpreg &= OAR2_ADD2_Reset;
MOVW	R2, #65281
ANDS	R3, R2
UXTH	R3, R3
;stm32f10x_i2c.c,479 :: 		tmpreg |= (uint16_t)((uint16_t)Address & (uint16_t)0x00FE);
UXTB	R2, R1
; Address end address is: 4 (R1)
AND	R2, R2, #254
UXTH	R2, R2
ORR	R2, R3, R2, LSL #0
;stm32f10x_i2c.c,482 :: 		I2Cx->OAR2 = tmpreg;
STRH	R2, [R4, #0]
;stm32f10x_i2c.c,483 :: 		}
L_end_I2C_OwnAddress2Config:
BX	LR
; end of _I2C_OwnAddress2Config
_I2C_DualAddressCmd:
;stm32f10x_i2c.c,492 :: 		void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_i2c.c,497 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_DualAddressCmd47
; NewState end address is: 4 (R1)
;stm32f10x_i2c.c,500 :: 		I2Cx->OAR2 |= OAR2_ENDUAL_Set;
ADDW	R3, R0, #12
; I2Cx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #1
STRH	R2, [R3, #0]
;stm32f10x_i2c.c,501 :: 		}
IT	AL
BAL	L_I2C_DualAddressCmd48
L_I2C_DualAddressCmd47:
;stm32f10x_i2c.c,505 :: 		I2Cx->OAR2 &= OAR2_ENDUAL_Reset;
; I2Cx start address is: 0 (R0)
ADDW	R4, R0, #12
; I2Cx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65534
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_i2c.c,506 :: 		}
L_I2C_DualAddressCmd48:
;stm32f10x_i2c.c,507 :: 		}
L_end_I2C_DualAddressCmd:
BX	LR
; end of _I2C_DualAddressCmd
_I2C_GeneralCallCmd:
;stm32f10x_i2c.c,516 :: 		void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_i2c.c,521 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_GeneralCallCmd49
; NewState end address is: 4 (R1)
;stm32f10x_i2c.c,524 :: 		I2Cx->CR1 |= CR1_ENGC_Set;
LDRH	R2, [R0, #0]
ORR	R2, R2, #64
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,525 :: 		}
IT	AL
BAL	L_I2C_GeneralCallCmd50
L_I2C_GeneralCallCmd49:
;stm32f10x_i2c.c,529 :: 		I2Cx->CR1 &= CR1_ENGC_Reset;
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65471
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,530 :: 		}
L_I2C_GeneralCallCmd50:
;stm32f10x_i2c.c,531 :: 		}
L_end_I2C_GeneralCallCmd:
BX	LR
; end of _I2C_GeneralCallCmd
_I2C_ITConfig:
;stm32f10x_i2c.c,545 :: 		void I2C_ITConfig(I2C_TypeDef* I2Cx, uint16_t I2C_IT, FunctionalState NewState)
; NewState start address is: 8 (R2)
; I2C_IT start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 8 (R2)
; I2C_IT end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; I2C_IT start address is: 4 (R1)
; NewState start address is: 8 (R2)
;stm32f10x_i2c.c,552 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_I2C_ITConfig51
; NewState end address is: 8 (R2)
;stm32f10x_i2c.c,555 :: 		I2Cx->CR2 |= I2C_IT;
ADDS	R4, R0, #4
; I2Cx end address is: 0 (R0)
LDRH	R3, [R4, #0]
ORRS	R3, R1
; I2C_IT end address is: 4 (R1)
STRH	R3, [R4, #0]
;stm32f10x_i2c.c,556 :: 		}
IT	AL
BAL	L_I2C_ITConfig52
L_I2C_ITConfig51:
;stm32f10x_i2c.c,560 :: 		I2Cx->CR2 &= (uint16_t)~I2C_IT;
; I2C_IT start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
ADDS	R5, R0, #4
; I2Cx end address is: 0 (R0)
MVN	R4, R1
UXTH	R4, R4
; I2C_IT end address is: 4 (R1)
LDRH	R3, [R5, #0]
ANDS	R3, R4
STRH	R3, [R5, #0]
;stm32f10x_i2c.c,561 :: 		}
L_I2C_ITConfig52:
;stm32f10x_i2c.c,562 :: 		}
L_end_I2C_ITConfig:
BX	LR
; end of _I2C_ITConfig
_I2C_SendData:
;stm32f10x_i2c.c,570 :: 		void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
; Data start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; Data end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; Data start address is: 4 (R1)
;stm32f10x_i2c.c,575 :: 		I2Cx->DR = Data;
ADDW	R2, R0, #16
; I2Cx end address is: 0 (R0)
STRH	R1, [R2, #0]
; Data end address is: 4 (R1)
;stm32f10x_i2c.c,576 :: 		}
L_end_I2C_SendData:
BX	LR
; end of _I2C_SendData
_I2C_ReceiveData:
;stm32f10x_i2c.c,583 :: 		uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
; I2Cx start address is: 0 (R0)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
;stm32f10x_i2c.c,588 :: 		return (uint8_t)I2Cx->DR;
ADDW	R1, R0, #16
; I2Cx end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTB	R0, R1
;stm32f10x_i2c.c,589 :: 		}
L_end_I2C_ReceiveData:
BX	LR
; end of _I2C_ReceiveData
_I2C_Send7bitAddress:
;stm32f10x_i2c.c,601 :: 		void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, uint8_t I2C_Direction)
; I2C_Direction start address is: 8 (R2)
; Address start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; I2C_Direction end address is: 8 (R2)
; Address end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; Address start address is: 4 (R1)
; I2C_Direction start address is: 8 (R2)
;stm32f10x_i2c.c,607 :: 		if (I2C_Direction != I2C_Direction_Transmitter)
CMP	R2, #0
IT	EQ
BEQ	L_I2C_Send7bitAddress53
; I2C_Direction end address is: 8 (R2)
;stm32f10x_i2c.c,610 :: 		Address |= OAR1_ADD0_Set;
ORR	R3, R1, #1
UXTB	R1, R3
;stm32f10x_i2c.c,611 :: 		}
IT	AL
BAL	L_I2C_Send7bitAddress54
L_I2C_Send7bitAddress53:
;stm32f10x_i2c.c,615 :: 		Address &= OAR1_ADD0_Reset;
MOVW	R3, #65534
AND	R3, R1, R3, LSL #0
UXTB	R1, R3
; Address end address is: 4 (R1)
;stm32f10x_i2c.c,616 :: 		}
L_I2C_Send7bitAddress54:
;stm32f10x_i2c.c,618 :: 		I2Cx->DR = Address;
; Address start address is: 4 (R1)
ADDW	R3, R0, #16
; I2Cx end address is: 0 (R0)
STRH	R1, [R3, #0]
; Address end address is: 4 (R1)
;stm32f10x_i2c.c,619 :: 		}
L_end_I2C_Send7bitAddress:
BX	LR
; end of _I2C_Send7bitAddress
_I2C_ReadRegister:
;stm32f10x_i2c.c,636 :: 		uint16_t I2C_ReadRegister(I2C_TypeDef* I2Cx, uint8_t I2C_Register)
; I2C_Register start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
MOV	R2, R0
; I2C_Register end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 8 (R2)
; I2C_Register start address is: 4 (R1)
;stm32f10x_i2c.c,638 :: 		__IO uint32_t tmp = 0;
;stm32f10x_i2c.c,644 :: 		tmp = (uint32_t) I2Cx;
; tmp start address is: 0 (R0)
MOV	R0, R2
; I2Cx end address is: 8 (R2)
;stm32f10x_i2c.c,645 :: 		tmp += I2C_Register;
ADDS	R0, R0, R1
; I2C_Register end address is: 4 (R1)
;stm32f10x_i2c.c,648 :: 		return (*(__IO uint16_t *) tmp);
MOV	R2, R0
; tmp end address is: 0 (R0)
LDRH	R2, [R2, #0]
UXTH	R0, R2
;stm32f10x_i2c.c,649 :: 		}
L_end_I2C_ReadRegister:
BX	LR
; end of _I2C_ReadRegister
_I2C_SoftwareResetCmd:
;stm32f10x_i2c.c,658 :: 		void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_i2c.c,663 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_SoftwareResetCmd55
; NewState end address is: 4 (R1)
;stm32f10x_i2c.c,666 :: 		I2Cx->CR1 |= CR1_SWRST_Set;
LDRH	R2, [R0, #0]
ORR	R2, R2, #32768
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,667 :: 		}
IT	AL
BAL	L_I2C_SoftwareResetCmd56
L_I2C_SoftwareResetCmd55:
;stm32f10x_i2c.c,671 :: 		I2Cx->CR1 &= CR1_SWRST_Reset;
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #32767
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,672 :: 		}
L_I2C_SoftwareResetCmd56:
;stm32f10x_i2c.c,673 :: 		}
L_end_I2C_SoftwareResetCmd:
BX	LR
; end of _I2C_SoftwareResetCmd
_I2C_NACKPositionConfig:
;stm32f10x_i2c.c,696 :: 		void I2C_NACKPositionConfig(I2C_TypeDef* I2Cx, uint16_t I2C_NACKPosition)
; I2C_NACKPosition start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; I2C_NACKPosition end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; I2C_NACKPosition start address is: 4 (R1)
;stm32f10x_i2c.c,703 :: 		if (I2C_NACKPosition == I2C_NACKPosition_Next)
CMP	R1, #2048
IT	NE
BNE	L_I2C_NACKPositionConfig57
; I2C_NACKPosition end address is: 4 (R1)
;stm32f10x_i2c.c,706 :: 		I2Cx->CR1 |= I2C_NACKPosition_Next;
LDRH	R2, [R0, #0]
ORR	R2, R2, #2048
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,707 :: 		}
IT	AL
BAL	L_I2C_NACKPositionConfig58
L_I2C_NACKPositionConfig57:
;stm32f10x_i2c.c,711 :: 		I2Cx->CR1 &= I2C_NACKPosition_Current;
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #63487
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,712 :: 		}
L_I2C_NACKPositionConfig58:
;stm32f10x_i2c.c,713 :: 		}
L_end_I2C_NACKPositionConfig:
BX	LR
; end of _I2C_NACKPositionConfig
_I2C_SMBusAlertConfig:
;stm32f10x_i2c.c,724 :: 		void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, uint16_t I2C_SMBusAlert)
; I2C_SMBusAlert start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; I2C_SMBusAlert end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; I2C_SMBusAlert start address is: 4 (R1)
;stm32f10x_i2c.c,729 :: 		if (I2C_SMBusAlert == I2C_SMBusAlert_Low)
CMP	R1, #8192
IT	NE
BNE	L_I2C_SMBusAlertConfig59
; I2C_SMBusAlert end address is: 4 (R1)
;stm32f10x_i2c.c,732 :: 		I2Cx->CR1 |= I2C_SMBusAlert_Low;
LDRH	R2, [R0, #0]
ORR	R2, R2, #8192
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,733 :: 		}
IT	AL
BAL	L_I2C_SMBusAlertConfig60
L_I2C_SMBusAlertConfig59:
;stm32f10x_i2c.c,737 :: 		I2Cx->CR1 &= I2C_SMBusAlert_High;
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #57343
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,738 :: 		}
L_I2C_SMBusAlertConfig60:
;stm32f10x_i2c.c,739 :: 		}
L_end_I2C_SMBusAlertConfig:
BX	LR
; end of _I2C_SMBusAlertConfig
_I2C_TransmitPEC:
;stm32f10x_i2c.c,748 :: 		void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_i2c.c,753 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_TransmitPEC61
; NewState end address is: 4 (R1)
;stm32f10x_i2c.c,756 :: 		I2Cx->CR1 |= CR1_PEC_Set;
LDRH	R2, [R0, #0]
ORR	R2, R2, #4096
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,757 :: 		}
IT	AL
BAL	L_I2C_TransmitPEC62
L_I2C_TransmitPEC61:
;stm32f10x_i2c.c,761 :: 		I2Cx->CR1 &= CR1_PEC_Reset;
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #61439
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,762 :: 		}
L_I2C_TransmitPEC62:
;stm32f10x_i2c.c,763 :: 		}
L_end_I2C_TransmitPEC:
BX	LR
; end of _I2C_TransmitPEC
_I2C_PECPositionConfig:
;stm32f10x_i2c.c,779 :: 		void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, uint16_t I2C_PECPosition)
; I2C_PECPosition start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; I2C_PECPosition end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; I2C_PECPosition start address is: 4 (R1)
;stm32f10x_i2c.c,784 :: 		if (I2C_PECPosition == I2C_PECPosition_Next)
CMP	R1, #2048
IT	NE
BNE	L_I2C_PECPositionConfig63
; I2C_PECPosition end address is: 4 (R1)
;stm32f10x_i2c.c,787 :: 		I2Cx->CR1 |= I2C_PECPosition_Next;
LDRH	R2, [R0, #0]
ORR	R2, R2, #2048
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,788 :: 		}
IT	AL
BAL	L_I2C_PECPositionConfig64
L_I2C_PECPositionConfig63:
;stm32f10x_i2c.c,792 :: 		I2Cx->CR1 &= I2C_PECPosition_Current;
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #63487
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,793 :: 		}
L_I2C_PECPositionConfig64:
;stm32f10x_i2c.c,794 :: 		}
L_end_I2C_PECPositionConfig:
BX	LR
; end of _I2C_PECPositionConfig
_I2C_CalculatePEC:
;stm32f10x_i2c.c,803 :: 		void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_i2c.c,808 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_CalculatePEC65
; NewState end address is: 4 (R1)
;stm32f10x_i2c.c,811 :: 		I2Cx->CR1 |= CR1_ENPEC_Set;
LDRH	R2, [R0, #0]
ORR	R2, R2, #32
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,812 :: 		}
IT	AL
BAL	L_I2C_CalculatePEC66
L_I2C_CalculatePEC65:
;stm32f10x_i2c.c,816 :: 		I2Cx->CR1 &= CR1_ENPEC_Reset;
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65503
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,817 :: 		}
L_I2C_CalculatePEC66:
;stm32f10x_i2c.c,818 :: 		}
L_end_I2C_CalculatePEC:
BX	LR
; end of _I2C_CalculatePEC
_I2C_GetPEC:
;stm32f10x_i2c.c,825 :: 		uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
; I2Cx start address is: 0 (R0)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
;stm32f10x_i2c.c,830 :: 		return ((I2Cx->SR2) >> 8);
ADDW	R1, R0, #24
; I2Cx end address is: 0 (R0)
LDRH	R1, [R1, #0]
LSRS	R1, R1, #8
UXTB	R0, R1
;stm32f10x_i2c.c,831 :: 		}
L_end_I2C_GetPEC:
BX	LR
; end of _I2C_GetPEC
_I2C_ARPCmd:
;stm32f10x_i2c.c,840 :: 		void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_i2c.c,845 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_ARPCmd67
; NewState end address is: 4 (R1)
;stm32f10x_i2c.c,848 :: 		I2Cx->CR1 |= CR1_ENARP_Set;
LDRH	R2, [R0, #0]
ORR	R2, R2, #16
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,849 :: 		}
IT	AL
BAL	L_I2C_ARPCmd68
L_I2C_ARPCmd67:
;stm32f10x_i2c.c,853 :: 		I2Cx->CR1 &= CR1_ENARP_Reset;
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65519
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,854 :: 		}
L_I2C_ARPCmd68:
;stm32f10x_i2c.c,855 :: 		}
L_end_I2C_ARPCmd:
BX	LR
; end of _I2C_ARPCmd
_I2C_StretchClockCmd:
;stm32f10x_i2c.c,864 :: 		void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_i2c.c,869 :: 		if (NewState == DISABLE)
CMP	R1, #0
IT	NE
BNE	L_I2C_StretchClockCmd69
; NewState end address is: 4 (R1)
;stm32f10x_i2c.c,872 :: 		I2Cx->CR1 |= CR1_NOSTRETCH_Set;
LDRH	R2, [R0, #0]
ORR	R2, R2, #128
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,873 :: 		}
IT	AL
BAL	L_I2C_StretchClockCmd70
L_I2C_StretchClockCmd69:
;stm32f10x_i2c.c,877 :: 		I2Cx->CR1 &= CR1_NOSTRETCH_Reset;
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65407
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f10x_i2c.c,878 :: 		}
L_I2C_StretchClockCmd70:
;stm32f10x_i2c.c,879 :: 		}
L_end_I2C_StretchClockCmd:
BX	LR
; end of _I2C_StretchClockCmd
_I2C_FastModeDutyCycleConfig:
;stm32f10x_i2c.c,890 :: 		void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, uint16_t I2C_DutyCycle)
; I2C_DutyCycle start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; I2C_DutyCycle end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; I2C_DutyCycle start address is: 4 (R1)
;stm32f10x_i2c.c,895 :: 		if (I2C_DutyCycle != I2C_DutyCycle_16_9)
CMP	R1, #16384
IT	EQ
BEQ	L_I2C_FastModeDutyCycleConfig71
; I2C_DutyCycle end address is: 4 (R1)
;stm32f10x_i2c.c,898 :: 		I2Cx->CCR &= I2C_DutyCycle_2;
ADDW	R4, R0, #28
; I2Cx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #49151
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_i2c.c,899 :: 		}
IT	AL
BAL	L_I2C_FastModeDutyCycleConfig72
L_I2C_FastModeDutyCycleConfig71:
;stm32f10x_i2c.c,903 :: 		I2Cx->CCR |= I2C_DutyCycle_16_9;
; I2Cx start address is: 0 (R0)
ADDW	R3, R0, #28
; I2Cx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #16384
STRH	R2, [R3, #0]
;stm32f10x_i2c.c,904 :: 		}
L_I2C_FastModeDutyCycleConfig72:
;stm32f10x_i2c.c,905 :: 		}
L_end_I2C_FastModeDutyCycleConfig:
BX	LR
; end of _I2C_FastModeDutyCycleConfig
_I2C_CheckEvent:
;stm32f10x_i2c.c,1030 :: 		ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, uint32_t I2C_EVENT)
; I2C_EVENT start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
MOV	R3, R0
; I2C_EVENT end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 12 (R3)
; I2C_EVENT start address is: 4 (R1)
;stm32f10x_i2c.c,1032 :: 		uint32_t lastevent = 0;
;stm32f10x_i2c.c,1033 :: 		uint32_t flag1 = 0, flag2 = 0;
;stm32f10x_i2c.c,1034 :: 		ErrorStatus status = ERROR;
;stm32f10x_i2c.c,1041 :: 		flag1 = I2Cx->SR1;
ADDW	R2, R3, #20
LDRH	R2, [R2, #0]
; flag1 start address is: 0 (R0)
UXTH	R0, R2
;stm32f10x_i2c.c,1042 :: 		flag2 = I2Cx->SR2;
ADDW	R2, R3, #24
; I2Cx end address is: 12 (R3)
LDRH	R2, [R2, #0]
; flag2 start address is: 12 (R3)
UXTH	R3, R2
;stm32f10x_i2c.c,1043 :: 		flag2 = flag2 << 16;
LSLS	R2, R3, #16
; flag2 end address is: 12 (R3)
;stm32f10x_i2c.c,1046 :: 		lastevent = (flag1 | flag2) & FLAG_Mask;
ORR	R3, R0, R2, LSL #0
; flag1 end address is: 0 (R0)
MVN	R2, #-16777216
AND	R2, R3, R2, LSL #0
;stm32f10x_i2c.c,1049 :: 		if ((lastevent & I2C_EVENT) == I2C_EVENT)
ANDS	R2, R1
CMP	R2, R1
IT	NE
BNE	L_I2C_CheckEvent73
; I2C_EVENT end address is: 4 (R1)
;stm32f10x_i2c.c,1052 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_i2c.c,1053 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_I2C_CheckEvent74
L_I2C_CheckEvent73:
;stm32f10x_i2c.c,1057 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
; status end address is: 0 (R0)
;stm32f10x_i2c.c,1058 :: 		}
L_I2C_CheckEvent74:
;stm32f10x_i2c.c,1060 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f10x_i2c.c,1061 :: 		}
L_end_I2C_CheckEvent:
BX	LR
; end of _I2C_CheckEvent
_I2C_GetLastEvent:
;stm32f10x_i2c.c,1078 :: 		uint32_t I2C_GetLastEvent(I2C_TypeDef* I2Cx)
; I2Cx start address is: 0 (R0)
MOV	R2, R0
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 8 (R2)
;stm32f10x_i2c.c,1080 :: 		uint32_t lastevent = 0;
;stm32f10x_i2c.c,1081 :: 		uint32_t flag1 = 0, flag2 = 0;
;stm32f10x_i2c.c,1087 :: 		flag1 = I2Cx->SR1;
ADDW	R1, R2, #20
LDRH	R1, [R1, #0]
; flag1 start address is: 0 (R0)
UXTH	R0, R1
;stm32f10x_i2c.c,1088 :: 		flag2 = I2Cx->SR2;
ADDW	R1, R2, #24
; I2Cx end address is: 8 (R2)
LDRH	R1, [R1, #0]
; flag2 start address is: 8 (R2)
UXTH	R2, R1
;stm32f10x_i2c.c,1089 :: 		flag2 = flag2 << 16;
LSLS	R1, R2, #16
; flag2 end address is: 8 (R2)
;stm32f10x_i2c.c,1092 :: 		lastevent = (flag1 | flag2) & FLAG_Mask;
ORR	R2, R0, R1, LSL #0
; flag1 end address is: 0 (R0)
MVN	R1, #-16777216
AND	R1, R2, R1, LSL #0
;stm32f10x_i2c.c,1095 :: 		return lastevent;
MOV	R0, R1
;stm32f10x_i2c.c,1096 :: 		}
L_end_I2C_GetLastEvent:
BX	LR
; end of _I2C_GetLastEvent
_I2C_GetFlagStatus:
;stm32f10x_i2c.c,1133 :: 		FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, uint32_t I2C_FLAG)
; I2C_FLAG start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
MOV	R2, R0
; I2C_FLAG end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 8 (R2)
; I2C_FLAG start address is: 4 (R1)
;stm32f10x_i2c.c,1135 :: 		FlagStatus bitstatus = RESET;
;stm32f10x_i2c.c,1136 :: 		__IO uint32_t i2creg = 0, i2cxbase = 0;
;stm32f10x_i2c.c,1143 :: 		i2cxbase = (uint32_t)I2Cx;
; i2cxbase start address is: 0 (R0)
MOV	R0, R2
; I2Cx end address is: 8 (R2)
;stm32f10x_i2c.c,1146 :: 		i2creg = I2C_FLAG >> 28;
LSRS	R2, R1, #28
; i2creg start address is: 12 (R3)
MOV	R3, R2
;stm32f10x_i2c.c,1149 :: 		I2C_FLAG &= FLAG_Mask;
MVN	R2, #-16777216
ANDS	R1, R2
;stm32f10x_i2c.c,1151 :: 		if(i2creg != 0)
CMP	R3, #0
IT	EQ
BEQ	L_I2C_GetFlagStatus75
; i2creg end address is: 12 (R3)
;stm32f10x_i2c.c,1154 :: 		i2cxbase += 0x14;
ADDS	R0, #20
;stm32f10x_i2c.c,1155 :: 		}
IT	AL
BAL	L_I2C_GetFlagStatus76
L_I2C_GetFlagStatus75:
;stm32f10x_i2c.c,1159 :: 		I2C_FLAG = (uint32_t)(I2C_FLAG >> 16);
LSRS	R1, R1, #16
;stm32f10x_i2c.c,1161 :: 		i2cxbase += 0x18;
ADDS	R0, #24
; i2cxbase end address is: 0 (R0)
; I2C_FLAG end address is: 4 (R1)
;stm32f10x_i2c.c,1162 :: 		}
L_I2C_GetFlagStatus76:
;stm32f10x_i2c.c,1164 :: 		if(((*(__IO uint32_t *)i2cxbase) & I2C_FLAG) != (uint32_t)RESET)
; i2cxbase start address is: 0 (R0)
; I2C_FLAG start address is: 4 (R1)
MOV	R2, R0
; i2cxbase end address is: 0 (R0)
LDR	R2, [R2, #0]
ANDS	R2, R1
; I2C_FLAG end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_I2C_GetFlagStatus77
;stm32f10x_i2c.c,1167 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_i2c.c,1168 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_I2C_GetFlagStatus78
L_I2C_GetFlagStatus77:
;stm32f10x_i2c.c,1172 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_i2c.c,1173 :: 		}
L_I2C_GetFlagStatus78:
;stm32f10x_i2c.c,1176 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_i2c.c,1177 :: 		}
L_end_I2C_GetFlagStatus:
BX	LR
; end of _I2C_GetFlagStatus
_I2C_ClearFlag:
;stm32f10x_i2c.c,1212 :: 		void I2C_ClearFlag(I2C_TypeDef* I2Cx, uint32_t I2C_FLAG)
; I2C_FLAG start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; I2C_FLAG end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; I2C_FLAG start address is: 4 (R1)
;stm32f10x_i2c.c,1214 :: 		uint32_t flagpos = 0;
;stm32f10x_i2c.c,1219 :: 		flagpos = I2C_FLAG & FLAG_Mask;
MVN	R2, #-16777216
AND	R2, R1, R2, LSL #0
; I2C_FLAG end address is: 4 (R1)
;stm32f10x_i2c.c,1221 :: 		I2Cx->SR1 = (uint16_t)~flagpos;
ADDW	R3, R0, #20
; I2Cx end address is: 0 (R0)
MVN	R2, R2
UXTH	R2, R2
STRH	R2, [R3, #0]
;stm32f10x_i2c.c,1222 :: 		}
L_end_I2C_ClearFlag:
BX	LR
; end of _I2C_ClearFlag
_I2C_GetITStatus:
;stm32f10x_i2c.c,1246 :: 		ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, uint32_t I2C_IT)
; I2C_IT start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; I2C_IT end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; I2C_IT start address is: 4 (R1)
;stm32f10x_i2c.c,1248 :: 		ITStatus bitstatus = RESET;
;stm32f10x_i2c.c,1249 :: 		uint32_t enablestatus = 0;
;stm32f10x_i2c.c,1256 :: 		enablestatus = (uint32_t)(((I2C_IT & ITEN_Mask) >> 16) & (I2Cx->CR2)) ;
AND	R2, R1, #117440512
LSRS	R3, R2, #16
ADDS	R2, R0, #4
LDRH	R2, [R2, #0]
AND	R2, R3, R2, LSL #0
; enablestatus start address is: 16 (R4)
MOV	R4, R2
;stm32f10x_i2c.c,1259 :: 		I2C_IT &= FLAG_Mask;
MVN	R2, #-16777216
AND	R3, R1, R2, LSL #0
; I2C_IT end address is: 4 (R1)
;stm32f10x_i2c.c,1262 :: 		if (((I2Cx->SR1 & I2C_IT) != (uint32_t)RESET) && enablestatus)
ADDW	R2, R0, #20
; I2Cx end address is: 0 (R0)
LDRH	R2, [R2, #0]
ANDS	R2, R3
CMP	R2, #0
IT	EQ
BEQ	L__I2C_GetITStatus94
CMP	R4, #0
IT	EQ
BEQ	L__I2C_GetITStatus93
; enablestatus end address is: 16 (R4)
L__I2C_GetITStatus92:
;stm32f10x_i2c.c,1265 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_i2c.c,1266 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_I2C_GetITStatus82
;stm32f10x_i2c.c,1262 :: 		if (((I2Cx->SR1 & I2C_IT) != (uint32_t)RESET) && enablestatus)
L__I2C_GetITStatus94:
L__I2C_GetITStatus93:
;stm32f10x_i2c.c,1270 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_i2c.c,1271 :: 		}
L_I2C_GetITStatus82:
;stm32f10x_i2c.c,1273 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_i2c.c,1274 :: 		}
L_end_I2C_GetITStatus:
BX	LR
; end of _I2C_GetITStatus
_I2C_ClearITPendingBit:
;stm32f10x_i2c.c,1307 :: 		void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, uint32_t I2C_IT)
; I2C_IT start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; I2C_IT end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; I2C_IT start address is: 4 (R1)
;stm32f10x_i2c.c,1309 :: 		uint32_t flagpos = 0;
;stm32f10x_i2c.c,1314 :: 		flagpos = I2C_IT & FLAG_Mask;
MVN	R2, #-16777216
AND	R2, R1, R2, LSL #0
; I2C_IT end address is: 4 (R1)
;stm32f10x_i2c.c,1316 :: 		I2Cx->SR1 = (uint16_t)~flagpos;
ADDW	R3, R0, #20
; I2Cx end address is: 0 (R0)
MVN	R2, R2
UXTH	R2, R2
STRH	R2, [R3, #0]
;stm32f10x_i2c.c,1317 :: 		}
L_end_I2C_ClearITPendingBit:
BX	LR
; end of _I2C_ClearITPendingBit
