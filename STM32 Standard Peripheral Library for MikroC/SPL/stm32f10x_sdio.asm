stm32f10x_sdio_NVIC_SetPriorityGrouping:
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
; end of stm32f10x_sdio_NVIC_SetPriorityGrouping
stm32f10x_sdio_NVIC_GetPriorityGrouping:
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
; end of stm32f10x_sdio_NVIC_GetPriorityGrouping
stm32f10x_sdio_NVIC_EnableIRQ:
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
; end of stm32f10x_sdio_NVIC_EnableIRQ
stm32f10x_sdio_NVIC_DisableIRQ:
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
; end of stm32f10x_sdio_NVIC_DisableIRQ
stm32f10x_sdio_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f10x_sdio_NVIC_GetPendingIRQ0
; ?FLOC__stm32f10x_sdio_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_sdio_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_sdio_NVIC_GetPendingIRQ1
L_stm32f10x_sdio_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f10x_sdio_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_sdio_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
L_stm32f10x_sdio_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f10x_sdio_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_sdio_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1593 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f10x_sdio_NVIC_GetPendingIRQ
stm32f10x_sdio_NVIC_SetPendingIRQ:
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
; end of stm32f10x_sdio_NVIC_SetPendingIRQ
stm32f10x_sdio_NVIC_ClearPendingIRQ:
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
; end of stm32f10x_sdio_NVIC_ClearPendingIRQ
stm32f10x_sdio_NVIC_GetActive:
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
BEQ	L_stm32f10x_sdio_NVIC_GetActive2
; ?FLOC__stm32f10x_sdio_NVIC_GetActive?T72 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_sdio_NVIC_GetActive?T72 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_sdio_NVIC_GetActive3
L_stm32f10x_sdio_NVIC_GetActive2:
; ?FLOC__stm32f10x_sdio_NVIC_GetActive?T72 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_sdio_NVIC_GetActive?T72 end address is: 0 (R0)
L_stm32f10x_sdio_NVIC_GetActive3:
; ?FLOC__stm32f10x_sdio_NVIC_GetActive?T72 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_sdio_NVIC_GetActive?T72 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1633 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f10x_sdio_NVIC_GetActive
stm32f10x_sdio_NVIC_SetPriority:
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
BGE	L_stm32f10x_sdio_NVIC_SetPriority4
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
BAL	L_stm32f10x_sdio_NVIC_SetPriority5
L_stm32f10x_sdio_NVIC_SetPriority4:
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
L_stm32f10x_sdio_NVIC_SetPriority5:
;core_cm3.h,1653 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f10x_sdio_NVIC_SetPriority
stm32f10x_sdio_NVIC_GetPriority:
;core_cm3.h,1670 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1673 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f10x_sdio_NVIC_GetPriority6
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
L_stm32f10x_sdio_NVIC_GetPriority6:
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
; end of stm32f10x_sdio_NVIC_GetPriority
stm32f10x_sdio_NVIC_EncodePriority:
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
BLS	L_stm32f10x_sdio_NVIC_EncodePriority8
; ?FLOC__stm32f10x_sdio_NVIC_EncodePriority?T112 start address is: 12 (R3)
MOVW	R3, #4
; ?FLOC__stm32f10x_sdio_NVIC_EncodePriority?T112 end address is: 12 (R3)
IT	AL
BAL	L_stm32f10x_sdio_NVIC_EncodePriority9
L_stm32f10x_sdio_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f10x_sdio_NVIC_EncodePriority?T112 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_sdio_NVIC_EncodePriority?T112 end address is: 0 (R0)
MOV	R3, R0
L_stm32f10x_sdio_NVIC_EncodePriority9:
; ?FLOC__stm32f10x_sdio_NVIC_EncodePriority?T112 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_sdio_NVIC_EncodePriority?T112 end address is: 12 (R3)
;core_cm3.h,1702 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f10x_sdio_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f10x_sdio_NVIC_EncodePriority?T116 start address is: 20 (R5)
MOVW	R5, #0
; ?FLOC__stm32f10x_sdio_NVIC_EncodePriority?T116 end address is: 20 (R5)
IT	AL
BAL	L_stm32f10x_sdio_NVIC_EncodePriority11
L_stm32f10x_sdio_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f10x_sdio_NVIC_EncodePriority?T116 start address is: 20 (R5)
; ?FLOC__stm32f10x_sdio_NVIC_EncodePriority?T116 end address is: 20 (R5)
L_stm32f10x_sdio_NVIC_EncodePriority11:
;core_cm3.h,1705 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f10x_sdio_NVIC_EncodePriority?T116 start address is: 20 (R5)
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
; ?FLOC__stm32f10x_sdio_NVIC_EncodePriority?T116 end address is: 20 (R5)
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
; end of stm32f10x_sdio_NVIC_EncodePriority
stm32f10x_sdio_NVIC_DecodePriority:
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
BLS	L_stm32f10x_sdio_NVIC_DecodePriority12
; ?FLOC__stm32f10x_sdio_NVIC_DecodePriority?T130 start address is: 16 (R4)
MOVW	R4, #4
; ?FLOC__stm32f10x_sdio_NVIC_DecodePriority?T130 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_sdio_NVIC_DecodePriority13
L_stm32f10x_sdio_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f10x_sdio_NVIC_DecodePriority?T130 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_sdio_NVIC_DecodePriority?T130 end address is: 4 (R1)
MOV	R4, R1
L_stm32f10x_sdio_NVIC_DecodePriority13:
; ?FLOC__stm32f10x_sdio_NVIC_DecodePriority?T130 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_sdio_NVIC_DecodePriority?T130 end address is: 16 (R4)
;core_cm3.h,1733 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f10x_sdio_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f10x_sdio_NVIC_DecodePriority?T134 start address is: 16 (R4)
MOVW	R4, #0
; ?FLOC__stm32f10x_sdio_NVIC_DecodePriority?T134 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_sdio_NVIC_DecodePriority15
L_stm32f10x_sdio_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f10x_sdio_NVIC_DecodePriority?T134 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f10x_sdio_NVIC_DecodePriority?T134 end address is: 20 (R5)
MOV	R4, R5
L_stm32f10x_sdio_NVIC_DecodePriority15:
; ?FLOC__stm32f10x_sdio_NVIC_DecodePriority?T134 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm3.h,1735 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f10x_sdio_NVIC_DecodePriority?T134 end address is: 16 (R4)
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
; end of stm32f10x_sdio_NVIC_DecodePriority
stm32f10x_sdio_SysTick_Config:
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
BLS	L_stm32f10x_sdio_SysTick_Config16
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f10x_sdio_SysTick_Config16:
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
BL	stm32f10x_sdio_NVIC_SetPriority+0
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
; end of stm32f10x_sdio_SysTick_Config
stm32f10x_sdio_NVIC_SystemReset:
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
L_stm32f10x_sdio_NVIC_SystemReset17:
IT	AL
BAL	L_stm32f10x_sdio_NVIC_SystemReset17
;core_cm3.h,1787 :: 		}
L_end_NVIC_SystemReset:
BX	LR
; end of stm32f10x_sdio_NVIC_SystemReset
stm32f10x_sdio_ITM_SendChar:
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
BEQ	L_stm32f10x_sdio_ITM_SendChar37
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_sdio_ITM_SendChar38
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_sdio_ITM_SendChar39
L_stm32f10x_sdio_ITM_SendChar33:
;core_cm3.h,1823 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f10x_sdio_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f10x_sdio_ITM_SendChar23
IT	AL
BAL	L_stm32f10x_sdio_ITM_SendChar22
L_stm32f10x_sdio_ITM_SendChar23:
;core_cm3.h,1824 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm3.h,1820 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f10x_sdio_ITM_SendChar36
L_stm32f10x_sdio_ITM_SendChar37:
L_stm32f10x_sdio_ITM_SendChar36:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_sdio_ITM_SendChar35
L_stm32f10x_sdio_ITM_SendChar38:
L_stm32f10x_sdio_ITM_SendChar35:
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_sdio_ITM_SendChar34
L_stm32f10x_sdio_ITM_SendChar39:
L_stm32f10x_sdio_ITM_SendChar34:
;core_cm3.h,1826 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm3.h,1827 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f10x_sdio_ITM_SendChar
stm32f10x_sdio_ITM_ReceiveChar:
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
BEQ	L_stm32f10x_sdio_ITM_ReceiveChar24
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
L_stm32f10x_sdio_ITM_ReceiveChar24:
;core_cm3.h,1847 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm3.h,1848 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f10x_sdio_ITM_ReceiveChar
stm32f10x_sdio_ITM_CheckChar:
;core_cm3.h,1859 :: 		static __INLINE int ITM_CheckChar (void) {
;core_cm3.h,1861 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f10x_sdio_ITM_CheckChar25
;core_cm3.h,1862 :: 		return (0);                                 /* no character available */
MOVW	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm3.h,1863 :: 		} else {
L_stm32f10x_sdio_ITM_CheckChar25:
;core_cm3.h,1864 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm3.h,1866 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f10x_sdio_ITM_CheckChar
_SDIO_DeInit:
;stm32f10x_sdio.c,161 :: 		void SDIO_DeInit(void)
;stm32f10x_sdio.c,163 :: 		SDIO->POWER = 0x00000000;
MOVW	R1, #0
MOVW	R0, #32768
MOVT	R0, #16385
STR	R1, [R0, #0]
;stm32f10x_sdio.c,164 :: 		SDIO->CLKCR = 0x00000000;
MOVW	R1, #0
MOVW	R0, #32772
MOVT	R0, #16385
STR	R1, [R0, #0]
;stm32f10x_sdio.c,165 :: 		SDIO->ARG = 0x00000000;
MOVW	R1, #0
MOVW	R0, #32776
MOVT	R0, #16385
STR	R1, [R0, #0]
;stm32f10x_sdio.c,166 :: 		SDIO->CMD = 0x00000000;
MOVW	R1, #0
MOVW	R0, #32780
MOVT	R0, #16385
STR	R1, [R0, #0]
;stm32f10x_sdio.c,167 :: 		SDIO->DTIMER = 0x00000000;
MOVW	R1, #0
MOVW	R0, #32804
MOVT	R0, #16385
STR	R1, [R0, #0]
;stm32f10x_sdio.c,168 :: 		SDIO->DLEN = 0x00000000;
MOVW	R1, #0
MOVW	R0, #32808
MOVT	R0, #16385
STR	R1, [R0, #0]
;stm32f10x_sdio.c,169 :: 		SDIO->DCTRL = 0x00000000;
MOVW	R1, #0
MOVW	R0, #32812
MOVT	R0, #16385
STR	R1, [R0, #0]
;stm32f10x_sdio.c,170 :: 		SDIO->ICR = 0x00C007FF;
MOVW	R1, #2047
MOVT	R1, #192
MOVW	R0, #32824
MOVT	R0, #16385
STR	R1, [R0, #0]
;stm32f10x_sdio.c,171 :: 		SDIO->MASK = 0x00000000;
MOVW	R1, #0
MOVW	R0, #32828
MOVT	R0, #16385
STR	R1, [R0, #0]
;stm32f10x_sdio.c,172 :: 		}
L_end_SDIO_DeInit:
BX	LR
; end of _SDIO_DeInit
_SDIO_Init:
;stm32f10x_sdio.c,181 :: 		void SDIO_Init(SDIO_InitTypeDef* SDIO_InitStruct)
; SDIO_InitStruct start address is: 0 (R0)
; SDIO_InitStruct end address is: 0 (R0)
; SDIO_InitStruct start address is: 0 (R0)
;stm32f10x_sdio.c,183 :: 		uint32_t tmpreg = 0;
;stm32f10x_sdio.c,197 :: 		tmpreg &= CLKCR_CLEAR_MASK;
MOVW	R4, #32772
MOVT	R4, #16385
LDR	R2, [R4, #0]
MOVW	R1, #33024
MOVT	R1, #65535
AND	R3, R2, R1, LSL #0
;stm32f10x_sdio.c,205 :: 		tmpreg |= (SDIO_InitStruct->SDIO_ClockDiv  | SDIO_InitStruct->SDIO_ClockPowerSave |
ADDW	R1, R0, #20
LDRB	R2, [R1, #0]
ADDW	R1, R0, #8
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f10x_sdio.c,206 :: 		SDIO_InitStruct->SDIO_ClockBypass | SDIO_InitStruct->SDIO_BusWide |
ADDS	R1, R0, #4
LDR	R1, [R1, #0]
ORRS	R2, R1
ADDW	R1, R0, #12
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f10x_sdio.c,207 :: 		SDIO_InitStruct->SDIO_ClockEdge | SDIO_InitStruct->SDIO_HardwareFlowControl);
LDR	R1, [R0, #0]
ORRS	R2, R1
ADDW	R1, R0, #16
; SDIO_InitStruct end address is: 0 (R0)
LDR	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
ORR	R1, R3, R1, LSL #0
;stm32f10x_sdio.c,210 :: 		SDIO->CLKCR = tmpreg;
STR	R1, [R4, #0]
;stm32f10x_sdio.c,211 :: 		}
L_end_SDIO_Init:
BX	LR
; end of _SDIO_Init
_SDIO_StructInit:
;stm32f10x_sdio.c,219 :: 		void SDIO_StructInit(SDIO_InitTypeDef* SDIO_InitStruct)
; SDIO_InitStruct start address is: 0 (R0)
; SDIO_InitStruct end address is: 0 (R0)
; SDIO_InitStruct start address is: 0 (R0)
;stm32f10x_sdio.c,222 :: 		SDIO_InitStruct->SDIO_ClockDiv = 0x00;
ADDW	R2, R0, #20
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f10x_sdio.c,223 :: 		SDIO_InitStruct->SDIO_ClockEdge = SDIO_ClockEdge_Rising;
MOV	R1, #0
STR	R1, [R0, #0]
;stm32f10x_sdio.c,224 :: 		SDIO_InitStruct->SDIO_ClockBypass = SDIO_ClockBypass_Disable;
ADDS	R2, R0, #4
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_sdio.c,225 :: 		SDIO_InitStruct->SDIO_ClockPowerSave = SDIO_ClockPowerSave_Disable;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_sdio.c,226 :: 		SDIO_InitStruct->SDIO_BusWide = SDIO_BusWide_1b;
ADDW	R2, R0, #12
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_sdio.c,227 :: 		SDIO_InitStruct->SDIO_HardwareFlowControl = SDIO_HardwareFlowControl_Disable;
ADDW	R2, R0, #16
; SDIO_InitStruct end address is: 0 (R0)
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_sdio.c,228 :: 		}
L_end_SDIO_StructInit:
BX	LR
; end of _SDIO_StructInit
_SDIO_ClockCmd:
;stm32f10x_sdio.c,235 :: 		void SDIO_ClockCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f10x_sdio.c,240 :: 		*(__IO uint32_t *) CLKCR_CLKEN_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1110442144
MOVT	R1, 16944
STR	R2, [R1, #0]
;stm32f10x_sdio.c,241 :: 		}
L_end_SDIO_ClockCmd:
BX	LR
; end of _SDIO_ClockCmd
_SDIO_SetPowerState:
;stm32f10x_sdio.c,251 :: 		void SDIO_SetPowerState(uint32_t SDIO_PowerState)
; SDIO_PowerState start address is: 0 (R0)
; SDIO_PowerState end address is: 0 (R0)
; SDIO_PowerState start address is: 0 (R0)
;stm32f10x_sdio.c,256 :: 		SDIO->POWER &= PWR_PWRCTRL_MASK;
MOVW	R3, #32768
MOVT	R3, #16385
LDR	R2, [R3, #0]
MVN	R1, #3
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f10x_sdio.c,257 :: 		SDIO->POWER |= SDIO_PowerState;
ORRS	R1, R0
; SDIO_PowerState end address is: 0 (R0)
STR	R1, [R3, #0]
;stm32f10x_sdio.c,258 :: 		}
L_end_SDIO_SetPowerState:
BX	LR
; end of _SDIO_SetPowerState
_SDIO_GetPowerState:
;stm32f10x_sdio.c,269 :: 		uint32_t SDIO_GetPowerState(void)
;stm32f10x_sdio.c,271 :: 		return (SDIO->POWER & (~PWR_PWRCTRL_MASK));
MOVW	R0, #32768
MOVT	R0, #16385
LDR	R0, [R0, #0]
AND	R0, R0, #3
;stm32f10x_sdio.c,272 :: 		}
L_end_SDIO_GetPowerState:
BX	LR
; end of _SDIO_GetPowerState
_SDIO_ITConfig:
;stm32f10x_sdio.c,307 :: 		void SDIO_ITConfig(uint32_t SDIO_IT, FunctionalState NewState)
; NewState start address is: 4 (R1)
; SDIO_IT start address is: 0 (R0)
; NewState end address is: 4 (R1)
; SDIO_IT end address is: 0 (R0)
; SDIO_IT start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_sdio.c,313 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_SDIO_ITConfig27
; NewState end address is: 4 (R1)
;stm32f10x_sdio.c,316 :: 		SDIO->MASK |= SDIO_IT;
MOVW	R3, #32828
MOVT	R3, #16385
LDR	R2, [R3, #0]
ORRS	R2, R0
; SDIO_IT end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f10x_sdio.c,317 :: 		}
IT	AL
BAL	L_SDIO_ITConfig28
L_SDIO_ITConfig27:
;stm32f10x_sdio.c,321 :: 		SDIO->MASK &= ~SDIO_IT;
; SDIO_IT start address is: 0 (R0)
MVN	R4, R0
; SDIO_IT end address is: 0 (R0)
MOVW	R3, #32828
MOVT	R3, #16385
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f10x_sdio.c,322 :: 		}
L_SDIO_ITConfig28:
;stm32f10x_sdio.c,323 :: 		}
L_end_SDIO_ITConfig:
BX	LR
; end of _SDIO_ITConfig
_SDIO_DMACmd:
;stm32f10x_sdio.c,331 :: 		void SDIO_DMACmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f10x_sdio.c,336 :: 		*(__IO uint32_t *) DCTRL_DMAEN_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1110443404
MOVT	R1, 16944
STR	R2, [R1, #0]
;stm32f10x_sdio.c,337 :: 		}
L_end_SDIO_DMACmd:
BX	LR
; end of _SDIO_DMACmd
_SDIO_SendCommand:
;stm32f10x_sdio.c,346 :: 		void SDIO_SendCommand(SDIO_CmdInitTypeDef *SDIO_CmdInitStruct)
; SDIO_CmdInitStruct start address is: 0 (R0)
; SDIO_CmdInitStruct end address is: 0 (R0)
; SDIO_CmdInitStruct start address is: 0 (R0)
;stm32f10x_sdio.c,348 :: 		uint32_t tmpreg = 0;
;stm32f10x_sdio.c,358 :: 		SDIO->ARG = SDIO_CmdInitStruct->SDIO_Argument;
LDR	R2, [R0, #0]
MOVW	R1, #32776
MOVT	R1, #16385
STR	R2, [R1, #0]
;stm32f10x_sdio.c,364 :: 		tmpreg &= CMD_CLEAR_MASK;
MOVW	R4, #32780
MOVT	R4, #16385
LDR	R2, [R4, #0]
MOVW	R1, #63488
MOVT	R1, #65535
AND	R3, R2, R1, LSL #0
;stm32f10x_sdio.c,369 :: 		tmpreg |= (uint32_t)SDIO_CmdInitStruct->SDIO_CmdIndex | SDIO_CmdInitStruct->SDIO_Response
ADDS	R1, R0, #4
LDR	R2, [R1, #0]
ADDW	R1, R0, #8
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f10x_sdio.c,370 :: 		| SDIO_CmdInitStruct->SDIO_Wait | SDIO_CmdInitStruct->SDIO_CPSM;
ADDW	R1, R0, #12
LDR	R1, [R1, #0]
ORRS	R2, R1
ADDW	R1, R0, #16
; SDIO_CmdInitStruct end address is: 0 (R0)
LDR	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
ORR	R1, R3, R1, LSL #0
;stm32f10x_sdio.c,373 :: 		SDIO->CMD = tmpreg;
STR	R1, [R4, #0]
;stm32f10x_sdio.c,374 :: 		}
L_end_SDIO_SendCommand:
BX	LR
; end of _SDIO_SendCommand
_SDIO_CmdStructInit:
;stm32f10x_sdio.c,382 :: 		void SDIO_CmdStructInit(SDIO_CmdInitTypeDef* SDIO_CmdInitStruct)
; SDIO_CmdInitStruct start address is: 0 (R0)
; SDIO_CmdInitStruct end address is: 0 (R0)
; SDIO_CmdInitStruct start address is: 0 (R0)
;stm32f10x_sdio.c,385 :: 		SDIO_CmdInitStruct->SDIO_Argument = 0x00;
MOVW	R1, #0
STR	R1, [R0, #0]
;stm32f10x_sdio.c,386 :: 		SDIO_CmdInitStruct->SDIO_CmdIndex = 0x00;
ADDS	R2, R0, #4
MOVW	R1, #0
STR	R1, [R2, #0]
;stm32f10x_sdio.c,387 :: 		SDIO_CmdInitStruct->SDIO_Response = SDIO_Response_No;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_sdio.c,388 :: 		SDIO_CmdInitStruct->SDIO_Wait = SDIO_Wait_No;
ADDW	R2, R0, #12
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_sdio.c,389 :: 		SDIO_CmdInitStruct->SDIO_CPSM = SDIO_CPSM_Disable;
ADDW	R2, R0, #16
; SDIO_CmdInitStruct end address is: 0 (R0)
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_sdio.c,390 :: 		}
L_end_SDIO_CmdStructInit:
BX	LR
; end of _SDIO_CmdStructInit
_SDIO_GetCommandResponse:
;stm32f10x_sdio.c,397 :: 		uint8_t SDIO_GetCommandResponse(void)
;stm32f10x_sdio.c,399 :: 		return (uint8_t)(SDIO->RESPCMD);
MOVW	R0, #32784
MOVT	R0, #16385
LDRB	R0, [R0, #0]
;stm32f10x_sdio.c,400 :: 		}
L_end_SDIO_GetCommandResponse:
BX	LR
; end of _SDIO_GetCommandResponse
_SDIO_GetResponse:
;stm32f10x_sdio.c,412 :: 		uint32_t SDIO_GetResponse(uint32_t SDIO_RESP)
; SDIO_RESP start address is: 0 (R0)
; SDIO_RESP end address is: 0 (R0)
; SDIO_RESP start address is: 0 (R0)
;stm32f10x_sdio.c,414 :: 		__IO uint32_t tmp = 0;
;stm32f10x_sdio.c,419 :: 		tmp = SDIO_RESP_ADDR + SDIO_RESP;
MOVW	R1, #32788
MOVT	R1, #16385
ADDS	R1, R1, R0
; SDIO_RESP end address is: 0 (R0)
; tmp start address is: 0 (R0)
MOV	R0, R1
;stm32f10x_sdio.c,421 :: 		return (*(__IO uint32_t *) tmp);
MOV	R1, R0
; tmp end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
;stm32f10x_sdio.c,422 :: 		}
L_end_SDIO_GetResponse:
BX	LR
; end of _SDIO_GetResponse
_SDIO_DataConfig:
;stm32f10x_sdio.c,431 :: 		void SDIO_DataConfig(SDIO_DataInitTypeDef* SDIO_DataInitStruct)
; SDIO_DataInitStruct start address is: 0 (R0)
; SDIO_DataInitStruct end address is: 0 (R0)
; SDIO_DataInitStruct start address is: 0 (R0)
;stm32f10x_sdio.c,433 :: 		uint32_t tmpreg = 0;
;stm32f10x_sdio.c,444 :: 		SDIO->DTIMER = SDIO_DataInitStruct->SDIO_DataTimeOut;
LDR	R2, [R0, #0]
MOVW	R1, #32804
MOVT	R1, #16385
STR	R2, [R1, #0]
;stm32f10x_sdio.c,448 :: 		SDIO->DLEN = SDIO_DataInitStruct->SDIO_DataLength;
ADDS	R1, R0, #4
LDR	R2, [R1, #0]
MOVW	R1, #32808
MOVT	R1, #16385
STR	R2, [R1, #0]
;stm32f10x_sdio.c,454 :: 		tmpreg &= DCTRL_CLEAR_MASK;
MOVW	R4, #32812
MOVT	R4, #16385
LDR	R2, [R4, #0]
MVN	R1, #247
AND	R3, R2, R1, LSL #0
;stm32f10x_sdio.c,459 :: 		tmpreg |= (uint32_t)SDIO_DataInitStruct->SDIO_DataBlockSize | SDIO_DataInitStruct->SDIO_TransferDir
ADDW	R1, R0, #8
LDR	R2, [R1, #0]
ADDW	R1, R0, #12
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f10x_sdio.c,460 :: 		| SDIO_DataInitStruct->SDIO_TransferMode | SDIO_DataInitStruct->SDIO_DPSM;
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
ORRS	R2, R1
ADDW	R1, R0, #20
; SDIO_DataInitStruct end address is: 0 (R0)
LDR	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
ORR	R1, R3, R1, LSL #0
;stm32f10x_sdio.c,463 :: 		SDIO->DCTRL = tmpreg;
STR	R1, [R4, #0]
;stm32f10x_sdio.c,464 :: 		}
L_end_SDIO_DataConfig:
BX	LR
; end of _SDIO_DataConfig
_SDIO_DataStructInit:
;stm32f10x_sdio.c,472 :: 		void SDIO_DataStructInit(SDIO_DataInitTypeDef* SDIO_DataInitStruct)
; SDIO_DataInitStruct start address is: 0 (R0)
; SDIO_DataInitStruct end address is: 0 (R0)
; SDIO_DataInitStruct start address is: 0 (R0)
;stm32f10x_sdio.c,475 :: 		SDIO_DataInitStruct->SDIO_DataTimeOut = 0xFFFFFFFF;
MOV	R1, #-1
STR	R1, [R0, #0]
;stm32f10x_sdio.c,476 :: 		SDIO_DataInitStruct->SDIO_DataLength = 0x00;
ADDS	R2, R0, #4
MOVW	R1, #0
STR	R1, [R2, #0]
;stm32f10x_sdio.c,477 :: 		SDIO_DataInitStruct->SDIO_DataBlockSize = SDIO_DataBlockSize_1b;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_sdio.c,478 :: 		SDIO_DataInitStruct->SDIO_TransferDir = SDIO_TransferDir_ToCard;
ADDW	R2, R0, #12
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_sdio.c,479 :: 		SDIO_DataInitStruct->SDIO_TransferMode = SDIO_TransferMode_Block;
ADDW	R2, R0, #16
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_sdio.c,480 :: 		SDIO_DataInitStruct->SDIO_DPSM = SDIO_DPSM_Disable;
ADDW	R2, R0, #20
; SDIO_DataInitStruct end address is: 0 (R0)
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f10x_sdio.c,481 :: 		}
L_end_SDIO_DataStructInit:
BX	LR
; end of _SDIO_DataStructInit
_SDIO_GetDataCounter:
;stm32f10x_sdio.c,488 :: 		uint32_t SDIO_GetDataCounter(void)
;stm32f10x_sdio.c,490 :: 		return SDIO->DCOUNT;
MOVW	R0, #32816
MOVT	R0, #16385
LDR	R0, [R0, #0]
;stm32f10x_sdio.c,491 :: 		}
L_end_SDIO_GetDataCounter:
BX	LR
; end of _SDIO_GetDataCounter
_SDIO_ReadData:
;stm32f10x_sdio.c,498 :: 		uint32_t SDIO_ReadData(void)
;stm32f10x_sdio.c,500 :: 		return SDIO->FIFO;
MOVW	R0, #32896
MOVT	R0, #16385
LDR	R0, [R0, #0]
;stm32f10x_sdio.c,501 :: 		}
L_end_SDIO_ReadData:
BX	LR
; end of _SDIO_ReadData
_SDIO_WriteData:
;stm32f10x_sdio.c,508 :: 		void SDIO_WriteData(uint32_t Data)
; Data start address is: 0 (R0)
; Data end address is: 0 (R0)
; Data start address is: 0 (R0)
;stm32f10x_sdio.c,510 :: 		SDIO->FIFO = Data;
MOVW	R1, #32896
MOVT	R1, #16385
STR	R0, [R1, #0]
; Data end address is: 0 (R0)
;stm32f10x_sdio.c,511 :: 		}
L_end_SDIO_WriteData:
BX	LR
; end of _SDIO_WriteData
_SDIO_GetFIFOCount:
;stm32f10x_sdio.c,518 :: 		uint32_t SDIO_GetFIFOCount(void)
;stm32f10x_sdio.c,520 :: 		return SDIO->FIFOCNT;
MOVW	R0, #32840
MOVT	R0, #16385
LDR	R0, [R0, #0]
;stm32f10x_sdio.c,521 :: 		}
L_end_SDIO_GetFIFOCount:
BX	LR
; end of _SDIO_GetFIFOCount
_SDIO_StartSDIOReadWait:
;stm32f10x_sdio.c,529 :: 		void SDIO_StartSDIOReadWait(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f10x_sdio.c,534 :: 		*(__IO uint32_t *) DCTRL_RWSTART_BB = (uint32_t) NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1110443424
MOVT	R1, 16944
STR	R2, [R1, #0]
;stm32f10x_sdio.c,535 :: 		}
L_end_SDIO_StartSDIOReadWait:
BX	LR
; end of _SDIO_StartSDIOReadWait
_SDIO_StopSDIOReadWait:
;stm32f10x_sdio.c,543 :: 		void SDIO_StopSDIOReadWait(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f10x_sdio.c,548 :: 		*(__IO uint32_t *) DCTRL_RWSTOP_BB = (uint32_t) NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1110443428
MOVT	R1, 16944
STR	R2, [R1, #0]
;stm32f10x_sdio.c,549 :: 		}
L_end_SDIO_StopSDIOReadWait:
BX	LR
; end of _SDIO_StopSDIOReadWait
_SDIO_SetSDIOReadWaitMode:
;stm32f10x_sdio.c,559 :: 		void SDIO_SetSDIOReadWaitMode(uint32_t SDIO_ReadWaitMode)
; SDIO_ReadWaitMode start address is: 0 (R0)
; SDIO_ReadWaitMode end address is: 0 (R0)
; SDIO_ReadWaitMode start address is: 0 (R0)
;stm32f10x_sdio.c,564 :: 		*(__IO uint32_t *) DCTRL_RWMOD_BB = SDIO_ReadWaitMode;
MOVW	R1, 1110443432
MOVT	R1, 16944
STR	R0, [R1, #0]
; SDIO_ReadWaitMode end address is: 0 (R0)
;stm32f10x_sdio.c,565 :: 		}
L_end_SDIO_SetSDIOReadWaitMode:
BX	LR
; end of _SDIO_SetSDIOReadWaitMode
_SDIO_SetSDIOOperation:
;stm32f10x_sdio.c,573 :: 		void SDIO_SetSDIOOperation(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f10x_sdio.c,578 :: 		*(__IO uint32_t *) DCTRL_SDIOEN_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1110443436
MOVT	R1, 16944
STR	R2, [R1, #0]
;stm32f10x_sdio.c,579 :: 		}
L_end_SDIO_SetSDIOOperation:
BX	LR
; end of _SDIO_SetSDIOOperation
_SDIO_SendSDIOSuspendCmd:
;stm32f10x_sdio.c,587 :: 		void SDIO_SendSDIOSuspendCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f10x_sdio.c,592 :: 		*(__IO uint32_t *) CMD_SDIOSUSPEND_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1110442412
MOVT	R1, 16944
STR	R2, [R1, #0]
;stm32f10x_sdio.c,593 :: 		}
L_end_SDIO_SendSDIOSuspendCmd:
BX	LR
; end of _SDIO_SendSDIOSuspendCmd
_SDIO_CommandCompletionCmd:
;stm32f10x_sdio.c,601 :: 		void SDIO_CommandCompletionCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f10x_sdio.c,606 :: 		*(__IO uint32_t *) CMD_ENCMDCOMPL_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1110442416
MOVT	R1, 16944
STR	R2, [R1, #0]
;stm32f10x_sdio.c,607 :: 		}
L_end_SDIO_CommandCompletionCmd:
BX	LR
; end of _SDIO_CommandCompletionCmd
_SDIO_CEATAITCmd:
;stm32f10x_sdio.c,614 :: 		void SDIO_CEATAITCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f10x_sdio.c,619 :: 		*(__IO uint32_t *) CMD_NIEN_BB = (uint32_t)((~((uint32_t)NewState)) & ((uint32_t)0x1));
UXTB	R1, R0
; NewState end address is: 0 (R0)
MVN	R1, R1
AND	R2, R1, #1
MOVW	R1, 1110442420
MOVT	R1, 16944
STR	R2, [R1, #0]
;stm32f10x_sdio.c,620 :: 		}
L_end_SDIO_CEATAITCmd:
BX	LR
; end of _SDIO_CEATAITCmd
_SDIO_SendCEATACmd:
;stm32f10x_sdio.c,627 :: 		void SDIO_SendCEATACmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f10x_sdio.c,632 :: 		*(__IO uint32_t *) CMD_ATACMD_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1110442424
MOVT	R1, 16944
STR	R2, [R1, #0]
;stm32f10x_sdio.c,633 :: 		}
L_end_SDIO_SendCEATACmd:
BX	LR
; end of _SDIO_SendCEATACmd
_SDIO_GetFlagStatus:
;stm32f10x_sdio.c,666 :: 		FlagStatus SDIO_GetFlagStatus(uint32_t SDIO_FLAG)
; SDIO_FLAG start address is: 0 (R0)
; SDIO_FLAG end address is: 0 (R0)
; SDIO_FLAG start address is: 0 (R0)
;stm32f10x_sdio.c,668 :: 		FlagStatus bitstatus = RESET;
;stm32f10x_sdio.c,673 :: 		if ((SDIO->STA & SDIO_FLAG) != (uint32_t)RESET)
MOVW	R1, #32820
MOVT	R1, #16385
LDR	R1, [R1, #0]
ANDS	R1, R0
; SDIO_FLAG end address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_SDIO_GetFlagStatus29
;stm32f10x_sdio.c,675 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_sdio.c,676 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_SDIO_GetFlagStatus30
L_SDIO_GetFlagStatus29:
;stm32f10x_sdio.c,679 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_sdio.c,680 :: 		}
L_SDIO_GetFlagStatus30:
;stm32f10x_sdio.c,681 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_sdio.c,682 :: 		}
L_end_SDIO_GetFlagStatus:
BX	LR
; end of _SDIO_GetFlagStatus
_SDIO_ClearFlag:
;stm32f10x_sdio.c,704 :: 		void SDIO_ClearFlag(uint32_t SDIO_FLAG)
; SDIO_FLAG start address is: 0 (R0)
; SDIO_FLAG end address is: 0 (R0)
; SDIO_FLAG start address is: 0 (R0)
;stm32f10x_sdio.c,709 :: 		SDIO->ICR = SDIO_FLAG;
MOVW	R1, #32824
MOVT	R1, #16385
STR	R0, [R1, #0]
; SDIO_FLAG end address is: 0 (R0)
;stm32f10x_sdio.c,710 :: 		}
L_end_SDIO_ClearFlag:
BX	LR
; end of _SDIO_ClearFlag
_SDIO_GetITStatus:
;stm32f10x_sdio.c,743 :: 		ITStatus SDIO_GetITStatus(uint32_t SDIO_IT)
; SDIO_IT start address is: 0 (R0)
; SDIO_IT end address is: 0 (R0)
; SDIO_IT start address is: 0 (R0)
;stm32f10x_sdio.c,745 :: 		ITStatus bitstatus = RESET;
;stm32f10x_sdio.c,749 :: 		if ((SDIO->STA & SDIO_IT) != (uint32_t)RESET)
MOVW	R1, #32820
MOVT	R1, #16385
LDR	R1, [R1, #0]
ANDS	R1, R0
; SDIO_IT end address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_SDIO_GetITStatus31
;stm32f10x_sdio.c,751 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_sdio.c,752 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_SDIO_GetITStatus32
L_SDIO_GetITStatus31:
;stm32f10x_sdio.c,755 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_sdio.c,756 :: 		}
L_SDIO_GetITStatus32:
;stm32f10x_sdio.c,757 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_sdio.c,758 :: 		}
L_end_SDIO_GetITStatus:
BX	LR
; end of _SDIO_GetITStatus
_SDIO_ClearITPendingBit:
;stm32f10x_sdio.c,779 :: 		void SDIO_ClearITPendingBit(uint32_t SDIO_IT)
; SDIO_IT start address is: 0 (R0)
; SDIO_IT end address is: 0 (R0)
; SDIO_IT start address is: 0 (R0)
;stm32f10x_sdio.c,784 :: 		SDIO->ICR = SDIO_IT;
MOVW	R1, #32824
MOVT	R1, #16385
STR	R0, [R1, #0]
; SDIO_IT end address is: 0 (R0)
;stm32f10x_sdio.c,785 :: 		}
L_end_SDIO_ClearITPendingBit:
BX	LR
; end of _SDIO_ClearITPendingBit
