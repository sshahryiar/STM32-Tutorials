stm32f10x_spi_NVIC_SetPriorityGrouping:
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
; end of stm32f10x_spi_NVIC_SetPriorityGrouping
stm32f10x_spi_NVIC_GetPriorityGrouping:
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
; end of stm32f10x_spi_NVIC_GetPriorityGrouping
stm32f10x_spi_NVIC_EnableIRQ:
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
; end of stm32f10x_spi_NVIC_EnableIRQ
stm32f10x_spi_NVIC_DisableIRQ:
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
; end of stm32f10x_spi_NVIC_DisableIRQ
stm32f10x_spi_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f10x_spi_NVIC_GetPendingIRQ0
; ?FLOC__stm32f10x_spi_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_spi_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_spi_NVIC_GetPendingIRQ1
L_stm32f10x_spi_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f10x_spi_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_spi_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
L_stm32f10x_spi_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f10x_spi_NVIC_GetPendingIRQ?T41 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_spi_NVIC_GetPendingIRQ?T41 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1593 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f10x_spi_NVIC_GetPendingIRQ
stm32f10x_spi_NVIC_SetPendingIRQ:
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
; end of stm32f10x_spi_NVIC_SetPendingIRQ
stm32f10x_spi_NVIC_ClearPendingIRQ:
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
; end of stm32f10x_spi_NVIC_ClearPendingIRQ
stm32f10x_spi_NVIC_GetActive:
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
BEQ	L_stm32f10x_spi_NVIC_GetActive2
; ?FLOC__stm32f10x_spi_NVIC_GetActive?T72 start address is: 0 (R0)
MOVS	R0, #1
SXTH	R0, R0
; ?FLOC__stm32f10x_spi_NVIC_GetActive?T72 end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_spi_NVIC_GetActive3
L_stm32f10x_spi_NVIC_GetActive2:
; ?FLOC__stm32f10x_spi_NVIC_GetActive?T72 start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; ?FLOC__stm32f10x_spi_NVIC_GetActive?T72 end address is: 0 (R0)
L_stm32f10x_spi_NVIC_GetActive3:
; ?FLOC__stm32f10x_spi_NVIC_GetActive?T72 start address is: 0 (R0)
SXTH	R1, R0
; ?FLOC__stm32f10x_spi_NVIC_GetActive?T72 end address is: 0 (R0)
MOV	R0, R1
;core_cm3.h,1633 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f10x_spi_NVIC_GetActive
stm32f10x_spi_NVIC_SetPriority:
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
BGE	L_stm32f10x_spi_NVIC_SetPriority4
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
BAL	L_stm32f10x_spi_NVIC_SetPriority5
L_stm32f10x_spi_NVIC_SetPriority4:
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
L_stm32f10x_spi_NVIC_SetPriority5:
;core_cm3.h,1653 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f10x_spi_NVIC_SetPriority
stm32f10x_spi_NVIC_GetPriority:
;core_cm3.h,1670 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm3.h,1673 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f10x_spi_NVIC_GetPriority6
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
L_stm32f10x_spi_NVIC_GetPriority6:
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
; end of stm32f10x_spi_NVIC_GetPriority
stm32f10x_spi_NVIC_EncodePriority:
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
BLS	L_stm32f10x_spi_NVIC_EncodePriority8
; ?FLOC__stm32f10x_spi_NVIC_EncodePriority?T112 start address is: 12 (R3)
MOVW	R3, #4
; ?FLOC__stm32f10x_spi_NVIC_EncodePriority?T112 end address is: 12 (R3)
IT	AL
BAL	L_stm32f10x_spi_NVIC_EncodePriority9
L_stm32f10x_spi_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f10x_spi_NVIC_EncodePriority?T112 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_spi_NVIC_EncodePriority?T112 end address is: 0 (R0)
MOV	R3, R0
L_stm32f10x_spi_NVIC_EncodePriority9:
; ?FLOC__stm32f10x_spi_NVIC_EncodePriority?T112 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f10x_spi_NVIC_EncodePriority?T112 end address is: 12 (R3)
;core_cm3.h,1702 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f10x_spi_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f10x_spi_NVIC_EncodePriority?T116 start address is: 20 (R5)
MOVW	R5, #0
; ?FLOC__stm32f10x_spi_NVIC_EncodePriority?T116 end address is: 20 (R5)
IT	AL
BAL	L_stm32f10x_spi_NVIC_EncodePriority11
L_stm32f10x_spi_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f10x_spi_NVIC_EncodePriority?T116 start address is: 20 (R5)
; ?FLOC__stm32f10x_spi_NVIC_EncodePriority?T116 end address is: 20 (R5)
L_stm32f10x_spi_NVIC_EncodePriority11:
;core_cm3.h,1705 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f10x_spi_NVIC_EncodePriority?T116 start address is: 20 (R5)
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
; ?FLOC__stm32f10x_spi_NVIC_EncodePriority?T116 end address is: 20 (R5)
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
; end of stm32f10x_spi_NVIC_EncodePriority
stm32f10x_spi_NVIC_DecodePriority:
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
BLS	L_stm32f10x_spi_NVIC_DecodePriority12
; ?FLOC__stm32f10x_spi_NVIC_DecodePriority?T130 start address is: 16 (R4)
MOVW	R4, #4
; ?FLOC__stm32f10x_spi_NVIC_DecodePriority?T130 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_spi_NVIC_DecodePriority13
L_stm32f10x_spi_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f10x_spi_NVIC_DecodePriority?T130 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_spi_NVIC_DecodePriority?T130 end address is: 4 (R1)
MOV	R4, R1
L_stm32f10x_spi_NVIC_DecodePriority13:
; ?FLOC__stm32f10x_spi_NVIC_DecodePriority?T130 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f10x_spi_NVIC_DecodePriority?T130 end address is: 16 (R4)
;core_cm3.h,1733 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f10x_spi_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f10x_spi_NVIC_DecodePriority?T134 start address is: 16 (R4)
MOVW	R4, #0
; ?FLOC__stm32f10x_spi_NVIC_DecodePriority?T134 end address is: 16 (R4)
IT	AL
BAL	L_stm32f10x_spi_NVIC_DecodePriority15
L_stm32f10x_spi_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f10x_spi_NVIC_DecodePriority?T134 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f10x_spi_NVIC_DecodePriority?T134 end address is: 20 (R5)
MOV	R4, R5
L_stm32f10x_spi_NVIC_DecodePriority15:
; ?FLOC__stm32f10x_spi_NVIC_DecodePriority?T134 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm3.h,1735 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f10x_spi_NVIC_DecodePriority?T134 end address is: 16 (R4)
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
; end of stm32f10x_spi_NVIC_DecodePriority
stm32f10x_spi_SysTick_Config:
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
BLS	L_stm32f10x_spi_SysTick_Config16
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f10x_spi_SysTick_Config16:
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
BL	stm32f10x_spi_NVIC_SetPriority+0
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
; end of stm32f10x_spi_SysTick_Config
stm32f10x_spi_NVIC_SystemReset:
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
L_stm32f10x_spi_NVIC_SystemReset17:
IT	AL
BAL	L_stm32f10x_spi_NVIC_SystemReset17
;core_cm3.h,1787 :: 		}
L_end_NVIC_SystemReset:
BX	LR
; end of stm32f10x_spi_NVIC_SystemReset
stm32f10x_spi_ITM_SendChar:
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
BEQ	L_stm32f10x_spi_ITM_SendChar71
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_spi_ITM_SendChar72
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f10x_spi_ITM_SendChar73
L_stm32f10x_spi_ITM_SendChar67:
;core_cm3.h,1823 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f10x_spi_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f10x_spi_ITM_SendChar23
IT	AL
BAL	L_stm32f10x_spi_ITM_SendChar22
L_stm32f10x_spi_ITM_SendChar23:
;core_cm3.h,1824 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm3.h,1820 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f10x_spi_ITM_SendChar70
L_stm32f10x_spi_ITM_SendChar71:
L_stm32f10x_spi_ITM_SendChar70:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_spi_ITM_SendChar69
L_stm32f10x_spi_ITM_SendChar72:
L_stm32f10x_spi_ITM_SendChar69:
;core_cm3.h,1821 :: 		(ITM->TER & (1ul << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f10x_spi_ITM_SendChar68
L_stm32f10x_spi_ITM_SendChar73:
L_stm32f10x_spi_ITM_SendChar68:
;core_cm3.h,1826 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm3.h,1827 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f10x_spi_ITM_SendChar
stm32f10x_spi_ITM_ReceiveChar:
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
BEQ	L_stm32f10x_spi_ITM_ReceiveChar24
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
L_stm32f10x_spi_ITM_ReceiveChar24:
;core_cm3.h,1847 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm3.h,1848 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f10x_spi_ITM_ReceiveChar
stm32f10x_spi_ITM_CheckChar:
;core_cm3.h,1859 :: 		static __INLINE int ITM_CheckChar (void) {
;core_cm3.h,1861 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f10x_spi_ITM_CheckChar25
;core_cm3.h,1862 :: 		return (0);                                 /* no character available */
MOVW	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm3.h,1863 :: 		} else {
L_stm32f10x_spi_ITM_CheckChar25:
;core_cm3.h,1864 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm3.h,1866 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f10x_spi_ITM_CheckChar
_SPI_I2S_DeInit:
;stm32f10x_spi.c,119 :: 		void SPI_I2S_DeInit(SPI_TypeDef* SPIx)
; SPIx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
;stm32f10x_spi.c,124 :: 		if (SPIx == SPI1)
MOVW	R1, #12288
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_SPI_I2S_DeInit27
; SPIx end address is: 0 (R0)
;stm32f10x_spi.c,127 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_SPI1, ENABLE);
MOVS	R1, #1
MOV	R0, #4096
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_spi.c,129 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_SPI1, DISABLE);
MOVS	R1, #0
MOV	R0, #4096
BL	_RCC_APB2PeriphResetCmd+0
;stm32f10x_spi.c,130 :: 		}
IT	AL
BAL	L_SPI_I2S_DeInit28
L_SPI_I2S_DeInit27:
;stm32f10x_spi.c,131 :: 		else if (SPIx == SPI2)
; SPIx start address is: 0 (R0)
MOVW	R1, #14336
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_SPI_I2S_DeInit29
; SPIx end address is: 0 (R0)
;stm32f10x_spi.c,134 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_SPI2, ENABLE);
MOVS	R1, #1
MOV	R0, #16384
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_spi.c,136 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_SPI2, DISABLE);
MOVS	R1, #0
MOV	R0, #16384
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_spi.c,137 :: 		}
IT	AL
BAL	L_SPI_I2S_DeInit30
L_SPI_I2S_DeInit29:
;stm32f10x_spi.c,140 :: 		if (SPIx == SPI3)
; SPIx start address is: 0 (R0)
MOVW	R1, #15360
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_SPI_I2S_DeInit31
; SPIx end address is: 0 (R0)
;stm32f10x_spi.c,143 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_SPI3, ENABLE);
MOVS	R1, #1
MOV	R0, #32768
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_spi.c,145 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_SPI3, DISABLE);
MOVS	R1, #0
MOV	R0, #32768
BL	_RCC_APB1PeriphResetCmd+0
;stm32f10x_spi.c,146 :: 		}
L_SPI_I2S_DeInit31:
;stm32f10x_spi.c,147 :: 		}
L_SPI_I2S_DeInit30:
L_SPI_I2S_DeInit28:
;stm32f10x_spi.c,148 :: 		}
L_end_SPI_I2S_DeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _SPI_I2S_DeInit
_SPI_Init:
;stm32f10x_spi.c,158 :: 		void SPI_Init(SPI_TypeDef* SPIx, SPI_InitTypeDef* SPI_InitStruct)
; SPI_InitStruct start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; SPI_InitStruct end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_InitStruct start address is: 4 (R1)
;stm32f10x_spi.c,160 :: 		uint16_t tmpreg = 0;
;stm32f10x_spi.c,178 :: 		tmpreg = SPIx->CR1;
LDRH	R2, [R0, #0]
;stm32f10x_spi.c,180 :: 		tmpreg &= CR1_CLEAR_Mask;
AND	R4, R2, #12352
UXTH	R4, R4
;stm32f10x_spi.c,189 :: 		tmpreg |= (uint16_t)((uint32_t)SPI_InitStruct->SPI_Direction | SPI_InitStruct->SPI_Mode |
LDRH	R2, [R1, #0]
UXTH	R3, R2
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
ORRS	R3, R2
;stm32f10x_spi.c,190 :: 		SPI_InitStruct->SPI_DataSize | SPI_InitStruct->SPI_CPOL |
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
ORRS	R3, R2
ADDS	R2, R1, #6
LDRH	R2, [R2, #0]
ORRS	R3, R2
;stm32f10x_spi.c,191 :: 		SPI_InitStruct->SPI_CPHA | SPI_InitStruct->SPI_NSS |
ADDW	R2, R1, #8
LDRH	R2, [R2, #0]
ORRS	R3, R2
ADDW	R2, R1, #10
LDRH	R2, [R2, #0]
ORRS	R3, R2
;stm32f10x_spi.c,192 :: 		SPI_InitStruct->SPI_BaudRatePrescaler | SPI_InitStruct->SPI_FirstBit);
ADDW	R2, R1, #12
LDRH	R2, [R2, #0]
ORRS	R3, R2
ADDW	R2, R1, #14
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
UXTH	R2, R2
ORR	R2, R4, R2, LSL #0
;stm32f10x_spi.c,194 :: 		SPIx->CR1 = tmpreg;
STRH	R2, [R0, #0]
;stm32f10x_spi.c,197 :: 		SPIx->I2SCFGR &= SPI_Mode_Select;
ADDW	R4, R0, #28
LDRH	R3, [R4, #0]
MOVW	R2, #63487
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_spi.c,201 :: 		SPIx->CRCPR = SPI_InitStruct->SPI_CRCPolynomial;
ADDW	R3, R0, #16
; SPIx end address is: 0 (R0)
ADDW	R2, R1, #16
; SPI_InitStruct end address is: 4 (R1)
LDRH	R2, [R2, #0]
STRH	R2, [R3, #0]
;stm32f10x_spi.c,202 :: 		}
L_end_SPI_Init:
BX	LR
; end of _SPI_Init
_I2S_Init:
;stm32f10x_spi.c,219 :: 		void I2S_Init(SPI_TypeDef* SPIx, I2S_InitTypeDef* I2S_InitStruct)
; I2S_InitStruct start address is: 4 (R1)
; SPIx start address is: 0 (R0)
SUB	SP, SP, #36
STR	LR, [SP, #0]
; I2S_InitStruct end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; I2S_InitStruct start address is: 4 (R1)
;stm32f10x_spi.c,221 :: 		uint16_t tmpreg = 0, i2sdiv = 2, i2sodd = 0, packetlength = 1;
;stm32f10x_spi.c,222 :: 		uint32_t tmp = 0;
;stm32f10x_spi.c,224 :: 		uint32_t sourceclock = 0;
;stm32f10x_spi.c,237 :: 		SPIx->I2SCFGR &= I2SCFGR_CLEAR_Mask;
ADDW	R4, R0, #28
LDRH	R3, [R4, #0]
MOVW	R2, #61504
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_spi.c,238 :: 		SPIx->I2SPR = 0x0002;
ADDW	R3, R0, #32
MOVW	R2, #2
STRH	R2, [R3, #0]
;stm32f10x_spi.c,241 :: 		tmpreg = SPIx->I2SCFGR;
ADDW	R2, R0, #28
LDRH	R2, [R2, #0]
; tmpreg start address is: 24 (R6)
UXTH	R6, R2
;stm32f10x_spi.c,244 :: 		if(I2S_InitStruct->I2S_AudioFreq == I2S_AudioFreq_Default)
ADDW	R2, R1, #8
LDR	R2, [R2, #0]
CMP	R2, #2
IT	NE
BNE	L_I2S_Init32
;stm32f10x_spi.c,246 :: 		i2sodd = (uint16_t)0;
; i2sodd start address is: 16 (R4)
MOVW	R4, #0
;stm32f10x_spi.c,247 :: 		i2sdiv = (uint16_t)2;
; i2sdiv start address is: 20 (R5)
MOVW	R5, #2
;stm32f10x_spi.c,248 :: 		}
; i2sodd end address is: 16 (R4)
; i2sdiv end address is: 20 (R5)
IT	AL
BAL	L_I2S_Init33
L_I2S_Init32:
;stm32f10x_spi.c,253 :: 		if(I2S_InitStruct->I2S_DataFormat == I2S_DataFormat_16b)
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
CMP	R2, #0
IT	NE
BNE	L_I2S_Init34
;stm32f10x_spi.c,256 :: 		packetlength = 1;
; packetlength start address is: 12 (R3)
MOVS	R3, #1
;stm32f10x_spi.c,257 :: 		}
; packetlength end address is: 12 (R3)
IT	AL
BAL	L_I2S_Init35
L_I2S_Init34:
;stm32f10x_spi.c,261 :: 		packetlength = 2;
; packetlength start address is: 12 (R3)
MOVW	R3, #2
; packetlength end address is: 12 (R3)
;stm32f10x_spi.c,262 :: 		}
L_I2S_Init35:
;stm32f10x_spi.c,265 :: 		if(((uint32_t)SPIx) == SPI2_BASE)
; packetlength start address is: 12 (R3)
MOVW	R2, #14336
MOVT	R2, #16384
CMP	R0, R2
IT	NE
BNE	L_I2S_Init36
;stm32f10x_spi.c,269 :: 		}
IT	AL
BAL	L_I2S_Init37
L_I2S_Init36:
;stm32f10x_spi.c,274 :: 		}
L_I2S_Init37:
;stm32f10x_spi.c,314 :: 		RCC_GetClocksFreq(&RCC_Clocks);
ADD	R2, SP, #16
STRH	R3, [SP, #4]
STRH	R6, [SP, #6]
STR	R1, [SP, #8]
STR	R0, [SP, #12]
MOV	R0, R2
BL	_RCC_GetClocksFreq+0
LDR	R0, [SP, #12]
LDR	R1, [SP, #8]
LDRH	R6, [SP, #6]
LDRH	R3, [SP, #4]
;stm32f10x_spi.c,317 :: 		sourceclock = RCC_Clocks.SYSCLK_Frequency;
; sourceclock start address is: 16 (R4)
LDR	R4, [SP, #16]
;stm32f10x_spi.c,321 :: 		if(I2S_InitStruct->I2S_MCLKOutput == I2S_MCLKOutput_Enable)
ADDS	R2, R1, #6
LDRH	R2, [R2, #0]
CMP	R2, #512
IT	NE
BNE	L_I2S_Init38
; packetlength end address is: 12 (R3)
;stm32f10x_spi.c,324 :: 		tmp = (uint16_t)(((((sourceclock / 256) * 10) / I2S_InitStruct->I2S_AudioFreq)) + 5);
LSRS	R3, R4, #8
; sourceclock end address is: 16 (R4)
MOVW	R2, #10
MULS	R3, R2, R3
ADDW	R2, R1, #8
LDR	R2, [R2, #0]
UDIV	R3, R3, R2
ADDS	R3, R3, #5
; tmp start address is: 12 (R3)
UXTH	R3, R3
;stm32f10x_spi.c,325 :: 		}
; tmp end address is: 12 (R3)
IT	AL
BAL	L_I2S_Init39
L_I2S_Init38:
;stm32f10x_spi.c,329 :: 		tmp = (uint16_t)(((((sourceclock / (32 * packetlength)) *10 ) / I2S_InitStruct->I2S_AudioFreq)) + 5);
; sourceclock start address is: 16 (R4)
; packetlength start address is: 12 (R3)
LSLS	R2, R3, #5
UXTH	R2, R2
; packetlength end address is: 12 (R3)
UDIV	R3, R4, R2
; sourceclock end address is: 16 (R4)
MOVW	R2, #10
MULS	R3, R2, R3
ADDW	R2, R1, #8
LDR	R2, [R2, #0]
UDIV	R3, R3, R2
ADDS	R3, R3, #5
; tmp start address is: 12 (R3)
UXTH	R3, R3
; tmp end address is: 12 (R3)
;stm32f10x_spi.c,330 :: 		}
L_I2S_Init39:
;stm32f10x_spi.c,333 :: 		tmp = tmp / 10;
; tmp start address is: 12 (R3)
MOVW	R2, #10
UDIV	R4, R3, R2
; tmp end address is: 12 (R3)
;stm32f10x_spi.c,336 :: 		i2sodd = (uint16_t)(tmp & (uint16_t)0x0001);
AND	R3, R4, #1
;stm32f10x_spi.c,339 :: 		i2sdiv = (uint16_t)((tmp - i2sodd) / 2);
UXTH	R2, R3
SUB	R2, R4, R2
LSRS	R2, R2, #1
; i2sdiv start address is: 16 (R4)
UXTH	R4, R2
;stm32f10x_spi.c,342 :: 		i2sodd = (uint16_t) (i2sodd << 8);
UXTH	R2, R3
LSLS	R2, R2, #8
; i2sodd start address is: 12 (R3)
UXTH	R3, R2
; i2sdiv end address is: 16 (R4)
; i2sodd end address is: 12 (R3)
UXTH	R5, R4
UXTH	R4, R3
;stm32f10x_spi.c,343 :: 		}
L_I2S_Init33:
;stm32f10x_spi.c,346 :: 		if ((i2sdiv < 2) || (i2sdiv > 0xFF))
; i2sodd start address is: 16 (R4)
; i2sdiv start address is: 20 (R5)
CMP	R5, #2
IT	CC
BCC	L__I2S_Init76
CMP	R5, #255
IT	HI
BHI	L__I2S_Init75
; i2sodd end address is: 16 (R4)
; i2sdiv end address is: 20 (R5)
IT	AL
BAL	L_I2S_Init42
L__I2S_Init76:
L__I2S_Init75:
;stm32f10x_spi.c,349 :: 		i2sdiv = 2;
; i2sdiv start address is: 20 (R5)
MOVW	R5, #2
;stm32f10x_spi.c,350 :: 		i2sodd = 0;
; i2sodd start address is: 16 (R4)
MOVW	R4, #0
; i2sodd end address is: 16 (R4)
; i2sdiv end address is: 20 (R5)
;stm32f10x_spi.c,351 :: 		}
L_I2S_Init42:
;stm32f10x_spi.c,354 :: 		SPIx->I2SPR = (uint16_t)(i2sdiv | (uint16_t)(i2sodd | (uint16_t)I2S_InitStruct->I2S_MCLKOutput));
; i2sodd start address is: 16 (R4)
; i2sdiv start address is: 20 (R5)
ADDW	R3, R0, #32
ADDS	R2, R1, #6
LDRH	R2, [R2, #0]
ORR	R2, R4, R2, LSL #0
UXTH	R2, R2
; i2sodd end address is: 16 (R4)
ORR	R2, R5, R2, LSL #0
; i2sdiv end address is: 20 (R5)
STRH	R2, [R3, #0]
;stm32f10x_spi.c,359 :: 		(uint16_t)I2S_InitStruct->I2S_CPOL))));
LDRH	R5, [R1, #0]
ADDS	R2, R1, #2
LDRH	R4, [R2, #0]
ADDS	R2, R1, #4
LDRH	R3, [R2, #0]
ADDW	R2, R1, #12
; I2S_InitStruct end address is: 4 (R1)
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
UXTH	R2, R2
ORR	R2, R4, R2, LSL #0
UXTH	R2, R2
ORR	R2, R5, R2, LSL #0
UXTH	R2, R2
ORR	R2, R2, #2048
UXTH	R2, R2
ORR	R3, R6, R2, LSL #0
; tmpreg end address is: 24 (R6)
;stm32f10x_spi.c,362 :: 		SPIx->I2SCFGR = tmpreg;
ADDW	R2, R0, #28
; SPIx end address is: 0 (R0)
STRH	R3, [R2, #0]
;stm32f10x_spi.c,363 :: 		}
L_end_I2S_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #36
BX	LR
; end of _I2S_Init
_SPI_StructInit:
;stm32f10x_spi.c,370 :: 		void SPI_StructInit(SPI_InitTypeDef* SPI_InitStruct)
; SPI_InitStruct start address is: 0 (R0)
; SPI_InitStruct end address is: 0 (R0)
; SPI_InitStruct start address is: 0 (R0)
;stm32f10x_spi.c,374 :: 		SPI_InitStruct->SPI_Direction = SPI_Direction_2Lines_FullDuplex;
MOVW	R1, #0
STRH	R1, [R0, #0]
;stm32f10x_spi.c,376 :: 		SPI_InitStruct->SPI_Mode = SPI_Mode_Slave;
ADDS	R2, R0, #2
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_spi.c,378 :: 		SPI_InitStruct->SPI_DataSize = SPI_DataSize_8b;
ADDS	R2, R0, #4
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_spi.c,380 :: 		SPI_InitStruct->SPI_CPOL = SPI_CPOL_Low;
ADDS	R2, R0, #6
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_spi.c,382 :: 		SPI_InitStruct->SPI_CPHA = SPI_CPHA_1Edge;
ADDW	R2, R0, #8
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_spi.c,384 :: 		SPI_InitStruct->SPI_NSS = SPI_NSS_Hard;
ADDW	R2, R0, #10
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_spi.c,386 :: 		SPI_InitStruct->SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_2;
ADDW	R2, R0, #12
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_spi.c,388 :: 		SPI_InitStruct->SPI_FirstBit = SPI_FirstBit_MSB;
ADDW	R2, R0, #14
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_spi.c,390 :: 		SPI_InitStruct->SPI_CRCPolynomial = 7;
ADDW	R2, R0, #16
; SPI_InitStruct end address is: 0 (R0)
MOVW	R1, #7
STRH	R1, [R2, #0]
;stm32f10x_spi.c,391 :: 		}
L_end_SPI_StructInit:
BX	LR
; end of _SPI_StructInit
_I2S_StructInit:
;stm32f10x_spi.c,398 :: 		void I2S_StructInit(I2S_InitTypeDef* I2S_InitStruct)
; I2S_InitStruct start address is: 0 (R0)
; I2S_InitStruct end address is: 0 (R0)
; I2S_InitStruct start address is: 0 (R0)
;stm32f10x_spi.c,402 :: 		I2S_InitStruct->I2S_Mode = I2S_Mode_SlaveTx;
MOVW	R1, #0
STRH	R1, [R0, #0]
;stm32f10x_spi.c,405 :: 		I2S_InitStruct->I2S_Standard = I2S_Standard_Phillips;
ADDS	R2, R0, #2
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_spi.c,408 :: 		I2S_InitStruct->I2S_DataFormat = I2S_DataFormat_16b;
ADDS	R2, R0, #4
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_spi.c,411 :: 		I2S_InitStruct->I2S_MCLKOutput = I2S_MCLKOutput_Disable;
ADDS	R2, R0, #6
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_spi.c,414 :: 		I2S_InitStruct->I2S_AudioFreq = I2S_AudioFreq_Default;
ADDW	R2, R0, #8
MOV	R1, #2
STR	R1, [R2, #0]
;stm32f10x_spi.c,417 :: 		I2S_InitStruct->I2S_CPOL = I2S_CPOL_Low;
ADDW	R2, R0, #12
; I2S_InitStruct end address is: 0 (R0)
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f10x_spi.c,418 :: 		}
L_end_I2S_StructInit:
BX	LR
; end of _I2S_StructInit
_SPI_Cmd:
;stm32f10x_spi.c,427 :: 		void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_spi.c,432 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_SPI_Cmd43
; NewState end address is: 4 (R1)
;stm32f10x_spi.c,435 :: 		SPIx->CR1 |= CR1_SPE_Set;
LDRH	R2, [R0, #0]
ORR	R2, R2, #64
STRH	R2, [R0, #0]
; SPIx end address is: 0 (R0)
;stm32f10x_spi.c,436 :: 		}
IT	AL
BAL	L_SPI_Cmd44
L_SPI_Cmd43:
;stm32f10x_spi.c,440 :: 		SPIx->CR1 &= CR1_SPE_Reset;
; SPIx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65471
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; SPIx end address is: 0 (R0)
;stm32f10x_spi.c,441 :: 		}
L_SPI_Cmd44:
;stm32f10x_spi.c,442 :: 		}
L_end_SPI_Cmd:
BX	LR
; end of _SPI_Cmd
_I2S_Cmd:
;stm32f10x_spi.c,451 :: 		void I2S_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_spi.c,456 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2S_Cmd45
; NewState end address is: 4 (R1)
;stm32f10x_spi.c,459 :: 		SPIx->I2SCFGR |= I2SCFGR_I2SE_Set;
ADDW	R3, R0, #28
; SPIx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #1024
STRH	R2, [R3, #0]
;stm32f10x_spi.c,460 :: 		}
IT	AL
BAL	L_I2S_Cmd46
L_I2S_Cmd45:
;stm32f10x_spi.c,464 :: 		SPIx->I2SCFGR &= I2SCFGR_I2SE_Reset;
; SPIx start address is: 0 (R0)
ADDW	R4, R0, #28
; SPIx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #64511
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_spi.c,465 :: 		}
L_I2S_Cmd46:
;stm32f10x_spi.c,466 :: 		}
L_end_I2S_Cmd:
BX	LR
; end of _I2S_Cmd
_SPI_I2S_ITConfig:
;stm32f10x_spi.c,482 :: 		void SPI_I2S_ITConfig(SPI_TypeDef* SPIx, uint8_t SPI_I2S_IT, FunctionalState NewState)
; NewState start address is: 8 (R2)
; SPI_I2S_IT start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; NewState end address is: 8 (R2)
; SPI_I2S_IT end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_I2S_IT start address is: 4 (R1)
; NewState start address is: 8 (R2)
;stm32f10x_spi.c,484 :: 		uint16_t itpos = 0, itmask = 0 ;
;stm32f10x_spi.c,491 :: 		itpos = SPI_I2S_IT >> 4;
LSRS	R3, R1, #4
UXTB	R3, R3
; SPI_I2S_IT end address is: 4 (R1)
; itpos start address is: 4 (R1)
UXTB	R1, R3
;stm32f10x_spi.c,494 :: 		itmask = (uint16_t)1 << (uint16_t)itpos;
MOVW	R3, #1
LSLS	R3, R1
; itpos end address is: 4 (R1)
; itmask start address is: 4 (R1)
UXTH	R1, R3
;stm32f10x_spi.c,496 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_SPI_I2S_ITConfig47
; NewState end address is: 8 (R2)
;stm32f10x_spi.c,499 :: 		SPIx->CR2 |= itmask;
ADDS	R4, R0, #4
; SPIx end address is: 0 (R0)
LDRH	R3, [R4, #0]
ORRS	R3, R1
; itmask end address is: 4 (R1)
STRH	R3, [R4, #0]
;stm32f10x_spi.c,500 :: 		}
IT	AL
BAL	L_SPI_I2S_ITConfig48
L_SPI_I2S_ITConfig47:
;stm32f10x_spi.c,504 :: 		SPIx->CR2 &= (uint16_t)~itmask;
; itmask start address is: 4 (R1)
; SPIx start address is: 0 (R0)
ADDS	R5, R0, #4
; SPIx end address is: 0 (R0)
MVN	R4, R1
UXTH	R4, R4
; itmask end address is: 4 (R1)
LDRH	R3, [R5, #0]
ANDS	R3, R4
STRH	R3, [R5, #0]
;stm32f10x_spi.c,505 :: 		}
L_SPI_I2S_ITConfig48:
;stm32f10x_spi.c,506 :: 		}
L_end_SPI_I2S_ITConfig:
BX	LR
; end of _SPI_I2S_ITConfig
_SPI_I2S_DMACmd:
;stm32f10x_spi.c,521 :: 		void SPI_I2S_DMACmd(SPI_TypeDef* SPIx, uint16_t SPI_I2S_DMAReq, FunctionalState NewState)
; NewState start address is: 8 (R2)
; SPI_I2S_DMAReq start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; NewState end address is: 8 (R2)
; SPI_I2S_DMAReq end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_I2S_DMAReq start address is: 4 (R1)
; NewState start address is: 8 (R2)
;stm32f10x_spi.c,527 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_SPI_I2S_DMACmd49
; NewState end address is: 8 (R2)
;stm32f10x_spi.c,530 :: 		SPIx->CR2 |= SPI_I2S_DMAReq;
ADDS	R4, R0, #4
; SPIx end address is: 0 (R0)
LDRH	R3, [R4, #0]
ORRS	R3, R1
; SPI_I2S_DMAReq end address is: 4 (R1)
STRH	R3, [R4, #0]
;stm32f10x_spi.c,531 :: 		}
IT	AL
BAL	L_SPI_I2S_DMACmd50
L_SPI_I2S_DMACmd49:
;stm32f10x_spi.c,535 :: 		SPIx->CR2 &= (uint16_t)~SPI_I2S_DMAReq;
; SPI_I2S_DMAReq start address is: 4 (R1)
; SPIx start address is: 0 (R0)
ADDS	R5, R0, #4
; SPIx end address is: 0 (R0)
MVN	R4, R1
UXTH	R4, R4
; SPI_I2S_DMAReq end address is: 4 (R1)
LDRH	R3, [R5, #0]
ANDS	R3, R4
STRH	R3, [R5, #0]
;stm32f10x_spi.c,536 :: 		}
L_SPI_I2S_DMACmd50:
;stm32f10x_spi.c,537 :: 		}
L_end_SPI_I2S_DMACmd:
BX	LR
; end of _SPI_I2S_DMACmd
_SPI_I2S_SendData:
;stm32f10x_spi.c,547 :: 		void SPI_I2S_SendData(SPI_TypeDef* SPIx, uint16_t Data)
; Data start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; Data end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; Data start address is: 4 (R1)
;stm32f10x_spi.c,553 :: 		SPIx->DR = Data;
ADDW	R2, R0, #12
; SPIx end address is: 0 (R0)
STRH	R1, [R2, #0]
; Data end address is: 4 (R1)
;stm32f10x_spi.c,554 :: 		}
L_end_SPI_I2S_SendData:
BX	LR
; end of _SPI_I2S_SendData
_SPI_I2S_ReceiveData:
;stm32f10x_spi.c,563 :: 		uint16_t SPI_I2S_ReceiveData(SPI_TypeDef* SPIx)
; SPIx start address is: 0 (R0)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
;stm32f10x_spi.c,569 :: 		return SPIx->DR;
ADDW	R1, R0, #12
; SPIx end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
;stm32f10x_spi.c,570 :: 		}
L_end_SPI_I2S_ReceiveData:
BX	LR
; end of _SPI_I2S_ReceiveData
_SPI_NSSInternalSoftwareConfig:
;stm32f10x_spi.c,581 :: 		void SPI_NSSInternalSoftwareConfig(SPI_TypeDef* SPIx, uint16_t SPI_NSSInternalSoft)
; SPI_NSSInternalSoft start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; SPI_NSSInternalSoft end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_NSSInternalSoft start address is: 4 (R1)
;stm32f10x_spi.c,586 :: 		if (SPI_NSSInternalSoft != SPI_NSSInternalSoft_Reset)
MOVW	R2, #65279
CMP	R1, R2
IT	EQ
BEQ	L_SPI_NSSInternalSoftwareConfig51
; SPI_NSSInternalSoft end address is: 4 (R1)
;stm32f10x_spi.c,589 :: 		SPIx->CR1 |= SPI_NSSInternalSoft_Set;
LDRH	R2, [R0, #0]
ORR	R2, R2, #256
STRH	R2, [R0, #0]
; SPIx end address is: 0 (R0)
;stm32f10x_spi.c,590 :: 		}
IT	AL
BAL	L_SPI_NSSInternalSoftwareConfig52
L_SPI_NSSInternalSoftwareConfig51:
;stm32f10x_spi.c,594 :: 		SPIx->CR1 &= SPI_NSSInternalSoft_Reset;
; SPIx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65279
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; SPIx end address is: 0 (R0)
;stm32f10x_spi.c,595 :: 		}
L_SPI_NSSInternalSoftwareConfig52:
;stm32f10x_spi.c,596 :: 		}
L_end_SPI_NSSInternalSoftwareConfig:
BX	LR
; end of _SPI_NSSInternalSoftwareConfig
_SPI_SSOutputCmd:
;stm32f10x_spi.c,605 :: 		void SPI_SSOutputCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_spi.c,610 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_SPI_SSOutputCmd53
; NewState end address is: 4 (R1)
;stm32f10x_spi.c,613 :: 		SPIx->CR2 |= CR2_SSOE_Set;
ADDS	R3, R0, #4
; SPIx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #4
STRH	R2, [R3, #0]
;stm32f10x_spi.c,614 :: 		}
IT	AL
BAL	L_SPI_SSOutputCmd54
L_SPI_SSOutputCmd53:
;stm32f10x_spi.c,618 :: 		SPIx->CR2 &= CR2_SSOE_Reset;
; SPIx start address is: 0 (R0)
ADDS	R4, R0, #4
; SPIx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65531
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f10x_spi.c,619 :: 		}
L_SPI_SSOutputCmd54:
;stm32f10x_spi.c,620 :: 		}
L_end_SPI_SSOutputCmd:
BX	LR
; end of _SPI_SSOutputCmd
_SPI_DataSizeConfig:
;stm32f10x_spi.c,631 :: 		void SPI_DataSizeConfig(SPI_TypeDef* SPIx, uint16_t SPI_DataSize)
; SPI_DataSize start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; SPI_DataSize end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_DataSize start address is: 4 (R1)
;stm32f10x_spi.c,637 :: 		SPIx->CR1 &= (uint16_t)~SPI_DataSize_16b;
LDRH	R3, [R0, #0]
MOVW	R2, #63487
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
;stm32f10x_spi.c,639 :: 		SPIx->CR1 |= SPI_DataSize;
LDRH	R2, [R0, #0]
ORRS	R2, R1
; SPI_DataSize end address is: 4 (R1)
STRH	R2, [R0, #0]
; SPIx end address is: 0 (R0)
;stm32f10x_spi.c,640 :: 		}
L_end_SPI_DataSizeConfig:
BX	LR
; end of _SPI_DataSizeConfig
_SPI_TransmitCRC:
;stm32f10x_spi.c,647 :: 		void SPI_TransmitCRC(SPI_TypeDef* SPIx)
; SPIx start address is: 0 (R0)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
;stm32f10x_spi.c,653 :: 		SPIx->CR1 |= CR1_CRCNext_Set;
LDRH	R1, [R0, #0]
ORR	R1, R1, #4096
STRH	R1, [R0, #0]
; SPIx end address is: 0 (R0)
;stm32f10x_spi.c,654 :: 		}
L_end_SPI_TransmitCRC:
BX	LR
; end of _SPI_TransmitCRC
_SPI_CalculateCRC:
;stm32f10x_spi.c,663 :: 		void SPI_CalculateCRC(SPI_TypeDef* SPIx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f10x_spi.c,668 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_SPI_CalculateCRC55
; NewState end address is: 4 (R1)
;stm32f10x_spi.c,671 :: 		SPIx->CR1 |= CR1_CRCEN_Set;
LDRH	R2, [R0, #0]
ORR	R2, R2, #8192
STRH	R2, [R0, #0]
; SPIx end address is: 0 (R0)
;stm32f10x_spi.c,672 :: 		}
IT	AL
BAL	L_SPI_CalculateCRC56
L_SPI_CalculateCRC55:
;stm32f10x_spi.c,676 :: 		SPIx->CR1 &= CR1_CRCEN_Reset;
; SPIx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #57343
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; SPIx end address is: 0 (R0)
;stm32f10x_spi.c,677 :: 		}
L_SPI_CalculateCRC56:
;stm32f10x_spi.c,678 :: 		}
L_end_SPI_CalculateCRC:
BX	LR
; end of _SPI_CalculateCRC
_SPI_GetCRC:
;stm32f10x_spi.c,689 :: 		uint16_t SPI_GetCRC(SPI_TypeDef* SPIx, uint8_t SPI_CRC)
; SPI_CRC start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; SPI_CRC end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_CRC start address is: 4 (R1)
;stm32f10x_spi.c,691 :: 		uint16_t crcreg = 0;
;stm32f10x_spi.c,695 :: 		if (SPI_CRC != SPI_CRC_Rx)
CMP	R1, #1
IT	EQ
BEQ	L_SPI_GetCRC57
; SPI_CRC end address is: 4 (R1)
;stm32f10x_spi.c,698 :: 		crcreg = SPIx->TXCRCR;
ADDW	R2, R0, #24
; SPIx end address is: 0 (R0)
LDRH	R0, [R2, #0]
; crcreg start address is: 0 (R0)
;stm32f10x_spi.c,699 :: 		}
; crcreg end address is: 0 (R0)
IT	AL
BAL	L_SPI_GetCRC58
L_SPI_GetCRC57:
;stm32f10x_spi.c,703 :: 		crcreg = SPIx->RXCRCR;
; SPIx start address is: 0 (R0)
ADDW	R2, R0, #20
; SPIx end address is: 0 (R0)
LDRH	R0, [R2, #0]
; crcreg start address is: 0 (R0)
; crcreg end address is: 0 (R0)
;stm32f10x_spi.c,704 :: 		}
L_SPI_GetCRC58:
;stm32f10x_spi.c,706 :: 		return crcreg;
; crcreg start address is: 0 (R0)
; crcreg end address is: 0 (R0)
;stm32f10x_spi.c,707 :: 		}
L_end_SPI_GetCRC:
BX	LR
; end of _SPI_GetCRC
_SPI_GetCRCPolynomial:
;stm32f10x_spi.c,714 :: 		uint16_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
; SPIx start address is: 0 (R0)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
;stm32f10x_spi.c,720 :: 		return SPIx->CRCPR;
ADDW	R1, R0, #16
; SPIx end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
;stm32f10x_spi.c,721 :: 		}
L_end_SPI_GetCRCPolynomial:
BX	LR
; end of _SPI_GetCRCPolynomial
_SPI_BiDirectionalLineConfig:
;stm32f10x_spi.c,732 :: 		void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, uint16_t SPI_Direction)
; SPI_Direction start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; SPI_Direction end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_Direction start address is: 4 (R1)
;stm32f10x_spi.c,737 :: 		if (SPI_Direction == SPI_Direction_Tx)
CMP	R1, #16384
IT	NE
BNE	L_SPI_BiDirectionalLineConfig59
; SPI_Direction end address is: 4 (R1)
;stm32f10x_spi.c,740 :: 		SPIx->CR1 |= SPI_Direction_Tx;
LDRH	R2, [R0, #0]
ORR	R2, R2, #16384
STRH	R2, [R0, #0]
; SPIx end address is: 0 (R0)
;stm32f10x_spi.c,741 :: 		}
IT	AL
BAL	L_SPI_BiDirectionalLineConfig60
L_SPI_BiDirectionalLineConfig59:
;stm32f10x_spi.c,745 :: 		SPIx->CR1 &= SPI_Direction_Rx;
; SPIx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #49151
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; SPIx end address is: 0 (R0)
;stm32f10x_spi.c,746 :: 		}
L_SPI_BiDirectionalLineConfig60:
;stm32f10x_spi.c,747 :: 		}
L_end_SPI_BiDirectionalLineConfig:
BX	LR
; end of _SPI_BiDirectionalLineConfig
_SPI_I2S_GetFlagStatus:
;stm32f10x_spi.c,766 :: 		FlagStatus SPI_I2S_GetFlagStatus(SPI_TypeDef* SPIx, uint16_t SPI_I2S_FLAG)
; SPI_I2S_FLAG start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; SPI_I2S_FLAG end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_I2S_FLAG start address is: 4 (R1)
;stm32f10x_spi.c,768 :: 		FlagStatus bitstatus = RESET;
;stm32f10x_spi.c,773 :: 		if ((SPIx->SR & SPI_I2S_FLAG) != (uint16_t)RESET)
ADDW	R2, R0, #8
; SPIx end address is: 0 (R0)
LDRH	R2, [R2, #0]
ANDS	R2, R1
UXTH	R2, R2
; SPI_I2S_FLAG end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_SPI_I2S_GetFlagStatus61
;stm32f10x_spi.c,776 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_spi.c,777 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_SPI_I2S_GetFlagStatus62
L_SPI_I2S_GetFlagStatus61:
;stm32f10x_spi.c,781 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_spi.c,782 :: 		}
L_SPI_I2S_GetFlagStatus62:
;stm32f10x_spi.c,784 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_spi.c,785 :: 		}
L_end_SPI_I2S_GetFlagStatus:
BX	LR
; end of _SPI_I2S_GetFlagStatus
_SPI_I2S_ClearFlag:
;stm32f10x_spi.c,804 :: 		void SPI_I2S_ClearFlag(SPI_TypeDef* SPIx, uint16_t SPI_I2S_FLAG)
; SPI_I2S_FLAG start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; SPI_I2S_FLAG end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_I2S_FLAG start address is: 4 (R1)
;stm32f10x_spi.c,811 :: 		SPIx->SR = (uint16_t)~SPI_I2S_FLAG;
ADDW	R3, R0, #8
; SPIx end address is: 0 (R0)
MVN	R2, R1
; SPI_I2S_FLAG end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f10x_spi.c,812 :: 		}
L_end_SPI_I2S_ClearFlag:
BX	LR
; end of _SPI_I2S_ClearFlag
_SPI_I2S_GetITStatus:
;stm32f10x_spi.c,829 :: 		ITStatus SPI_I2S_GetITStatus(SPI_TypeDef* SPIx, uint8_t SPI_I2S_IT)
; SPI_I2S_IT start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; SPI_I2S_IT end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_I2S_IT start address is: 4 (R1)
;stm32f10x_spi.c,831 :: 		ITStatus bitstatus = RESET;
;stm32f10x_spi.c,832 :: 		uint16_t itpos = 0, itmask = 0, enablestatus = 0;
;stm32f10x_spi.c,839 :: 		itpos = 0x01 << (SPI_I2S_IT & 0x0F);
AND	R3, R1, #15
SXTH	R3, R3
MOVS	R2, #1
LSL	R4, R2, R3
UXTH	R4, R4
;stm32f10x_spi.c,842 :: 		itmask = SPI_I2S_IT >> 4;
LSRS	R2, R1, #4
UXTB	R2, R2
; SPI_I2S_IT end address is: 4 (R1)
; itmask start address is: 4 (R1)
UXTB	R1, R2
;stm32f10x_spi.c,845 :: 		itmask = 0x01 << itmask;
MOVS	R2, #1
LSL	R3, R2, R1
UXTH	R3, R3
; itmask end address is: 4 (R1)
;stm32f10x_spi.c,848 :: 		enablestatus = (SPIx->CR2 & itmask) ;
ADDS	R2, R0, #4
LDRH	R2, [R2, #0]
ANDS	R2, R3
; enablestatus start address is: 4 (R1)
UXTH	R1, R2
;stm32f10x_spi.c,851 :: 		if (((SPIx->SR & itpos) != (uint16_t)RESET) && enablestatus)
ADDW	R2, R0, #8
; SPIx end address is: 0 (R0)
LDRH	R2, [R2, #0]
ANDS	R2, R4
UXTH	R2, R2
CMP	R2, #0
IT	EQ
BEQ	L__SPI_I2S_GetITStatus79
CMP	R1, #0
IT	EQ
BEQ	L__SPI_I2S_GetITStatus78
; enablestatus end address is: 4 (R1)
L__SPI_I2S_GetITStatus77:
;stm32f10x_spi.c,854 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f10x_spi.c,855 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_SPI_I2S_GetITStatus66
;stm32f10x_spi.c,851 :: 		if (((SPIx->SR & itpos) != (uint16_t)RESET) && enablestatus)
L__SPI_I2S_GetITStatus79:
L__SPI_I2S_GetITStatus78:
;stm32f10x_spi.c,859 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f10x_spi.c,860 :: 		}
L_SPI_I2S_GetITStatus66:
;stm32f10x_spi.c,862 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f10x_spi.c,863 :: 		}
L_end_SPI_I2S_GetITStatus:
BX	LR
; end of _SPI_I2S_GetITStatus
_SPI_I2S_ClearITPendingBit:
;stm32f10x_spi.c,883 :: 		void SPI_I2S_ClearITPendingBit(SPI_TypeDef* SPIx, uint8_t SPI_I2S_IT)
; SPI_I2S_IT start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; SPI_I2S_IT end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_I2S_IT start address is: 4 (R1)
;stm32f10x_spi.c,885 :: 		uint16_t itpos = 0;
;stm32f10x_spi.c,891 :: 		itpos = 0x01 << (SPI_I2S_IT & 0x0F);
AND	R3, R1, #15
SXTH	R3, R3
; SPI_I2S_IT end address is: 4 (R1)
MOVS	R2, #1
LSLS	R2, R3
UXTH	R2, R2
;stm32f10x_spi.c,894 :: 		SPIx->SR = (uint16_t)~itpos;
ADDW	R3, R0, #8
; SPIx end address is: 0 (R0)
MVN	R2, R2
STRH	R2, [R3, #0]
;stm32f10x_spi.c,895 :: 		}
L_end_SPI_I2S_ClearITPendingBit:
BX	LR
; end of _SPI_I2S_ClearITPendingBit
