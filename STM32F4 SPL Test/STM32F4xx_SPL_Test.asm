STM32F4xx_SPL_Test___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of STM32F4xx_SPL_Test___DSB
STM32F4xx_SPL_Test___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of STM32F4xx_SPL_Test___WFI
STM32F4xx_SPL_Test___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of STM32F4xx_SPL_Test___WFE
STM32F4xx_SPL_Test___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of STM32F4xx_SPL_Test___REV
STM32F4xx_SPL_Test_NVIC_SetPriorityGrouping:
;core_cm4.h,1046 :: 		static __INLINE void NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
; PriorityGroup start address is: 0 (R0)
; PriorityGroup end address is: 0 (R0)
; PriorityGroup start address is: 0 (R0)
;core_cm4.h,1049 :: 		uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07);               /* only values 0..7 are used          */
AND	R4, R0, #7
; PriorityGroup end address is: 0 (R0)
;core_cm4.h,1052 :: 		reg_value &= ~(SCB_AIRCR_VECTKEY_Msk | SCB_AIRCR_PRIGROUP_Msk);             /* clear bits to change               */
MOVW	R3, #60684
MOVT	R3, #57344
LDR	R2, [R3, #0]
MOVW	R1, #63743
MOVT	R1, #0
ANDS	R2, R1
;core_cm4.h,1054 :: 		((uint32_t)0x5FA << SCB_AIRCR_VECTKEY_Pos) |
MOVW	R1, #0
MOVT	R1, #1530
ORRS	R2, R1
;core_cm4.h,1055 :: 		(PriorityGroupTmp << 8));                                     /* Insert write key and priorty group */
LSLS	R1, R4, #8
ORR	R1, R2, R1, LSL #0
;core_cm4.h,1056 :: 		SCB->AIRCR =  reg_value;
STR	R1, [R3, #0]
;core_cm4.h,1057 :: 		}
L_end_NVIC_SetPriorityGrouping:
BX	LR
; end of STM32F4xx_SPL_Test_NVIC_SetPriorityGrouping
STM32F4xx_SPL_Test_NVIC_GetPriorityGrouping:
;core_cm4.h,1067 :: 		static __INLINE uint32_t NVIC_GetPriorityGrouping(void)
;core_cm4.h,1069 :: 		return ((SCB->AIRCR & SCB_AIRCR_PRIGROUP_Msk) >> SCB_AIRCR_PRIGROUP_Pos);   /* read priority grouping field */
MOVW	R0, #60684
MOVT	R0, #57344
LDR	R0, [R0, #0]
AND	R0, R0, #1792
LSRS	R0, R0, #8
;core_cm4.h,1070 :: 		}
L_end_NVIC_GetPriorityGrouping:
BX	LR
; end of STM32F4xx_SPL_Test_NVIC_GetPriorityGrouping
STM32F4xx_SPL_Test_NVIC_EnableIRQ:
;core_cm4.h,1080 :: 		static __INLINE void NVIC_EnableIRQ(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1083 :: 		NVIC->ISER[(uint32_t)((int32_t)IRQn) >> 5] = (uint32_t)(1 << ((uint32_t)((int32_t)IRQn) & (uint32_t)0x1F)); /* enable interrupt */
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
LSLS	R1, R2
STR	R1, [R3, #0]
;core_cm4.h,1084 :: 		}
L_end_NVIC_EnableIRQ:
BX	LR
; end of STM32F4xx_SPL_Test_NVIC_EnableIRQ
STM32F4xx_SPL_Test_NVIC_DisableIRQ:
;core_cm4.h,1094 :: 		static __INLINE void NVIC_DisableIRQ(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1096 :: 		NVIC->ICER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F)); /* disable interrupt */
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
LSLS	R1, R2
STR	R1, [R3, #0]
;core_cm4.h,1097 :: 		}
L_end_NVIC_DisableIRQ:
BX	LR
; end of STM32F4xx_SPL_Test_NVIC_DisableIRQ
STM32F4xx_SPL_Test_NVIC_GetPendingIRQ:
;core_cm4.h,1109 :: 		static __INLINE uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1111 :: 		return((uint32_t) ((NVIC->ISPR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0)); /* Return 1 if pending else 0 */
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
LSLS	R1, R2
AND	R1, R3, R1, LSL #0
CMP	R1, #0
IT	EQ
BEQ	L_STM32F4xx_SPL_Test_NVIC_GetPendingIRQ0
; ?FLOC__STM32F4xx_SPL_Test_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__STM32F4xx_SPL_Test_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_STM32F4xx_SPL_Test_NVIC_GetPendingIRQ1
L_STM32F4xx_SPL_Test_NVIC_GetPendingIRQ0:
; ?FLOC__STM32F4xx_SPL_Test_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__STM32F4xx_SPL_Test_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_STM32F4xx_SPL_Test_NVIC_GetPendingIRQ1:
; ?FLOC__STM32F4xx_SPL_Test_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__STM32F4xx_SPL_Test_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of STM32F4xx_SPL_Test_NVIC_GetPendingIRQ
STM32F4xx_SPL_Test_NVIC_SetPendingIRQ:
;core_cm4.h,1122 :: 		static __INLINE void NVIC_SetPendingIRQ(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1124 :: 		NVIC->ISPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F)); /* set interrupt pending */
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
LSLS	R1, R2
STR	R1, [R3, #0]
;core_cm4.h,1125 :: 		}
L_end_NVIC_SetPendingIRQ:
BX	LR
; end of STM32F4xx_SPL_Test_NVIC_SetPendingIRQ
STM32F4xx_SPL_Test_NVIC_ClearPendingIRQ:
;core_cm4.h,1135 :: 		static __INLINE void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1137 :: 		NVIC->ICPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F)); /* Clear pending interrupt */
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
LSLS	R1, R2
STR	R1, [R3, #0]
;core_cm4.h,1138 :: 		}
L_end_NVIC_ClearPendingIRQ:
BX	LR
; end of STM32F4xx_SPL_Test_NVIC_ClearPendingIRQ
STM32F4xx_SPL_Test_NVIC_GetActive:
;core_cm4.h,1148 :: 		static __INLINE uint32_t NVIC_GetActive(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1150 :: 		return((uint32_t)((NVIC->IABR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0)); /* Return 1 if active else 0 */
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
LSLS	R1, R2
AND	R1, R3, R1, LSL #0
CMP	R1, #0
IT	EQ
BEQ	L_STM32F4xx_SPL_Test_NVIC_GetActive2
; ?FLOC__STM32F4xx_SPL_Test_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__STM32F4xx_SPL_Test_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_STM32F4xx_SPL_Test_NVIC_GetActive3
L_STM32F4xx_SPL_Test_NVIC_GetActive2:
; ?FLOC__STM32F4xx_SPL_Test_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__STM32F4xx_SPL_Test_NVIC_GetActive?T78 end address is: 0 (R0)
L_STM32F4xx_SPL_Test_NVIC_GetActive3:
; ?FLOC__STM32F4xx_SPL_Test_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__STM32F4xx_SPL_Test_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of STM32F4xx_SPL_Test_NVIC_GetActive
STM32F4xx_SPL_Test_NVIC_SetPriority:
;core_cm4.h,1165 :: 		static __INLINE void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
; priority start address is: 4 (R1)
; IRQn start address is: 0 (R0)
; priority end address is: 4 (R1)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
; priority start address is: 4 (R1)
;core_cm4.h,1167 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_STM32F4xx_SPL_Test_NVIC_SetPriority4
;core_cm4.h,1168 :: 		SCB->SHP[((uint32_t)(IRQn) & 0xF)-4] = ((priority << (8 - __NVIC_PRIO_BITS)) & 0xff); } /* set Priority for Cortex-M  System Interrupts */
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
BAL	L_STM32F4xx_SPL_Test_NVIC_SetPriority5
L_STM32F4xx_SPL_Test_NVIC_SetPriority4:
;core_cm4.h,1170 :: 		NVIC->IP[(uint32_t)(IRQn)] = ((priority << (8 - __NVIC_PRIO_BITS)) & 0xff);    }        /* set Priority for device specific Interrupts  */
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
L_STM32F4xx_SPL_Test_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of STM32F4xx_SPL_Test_NVIC_SetPriority
STM32F4xx_SPL_Test_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_STM32F4xx_SPL_Test_NVIC_GetPriority6
;core_cm4.h,1190 :: 		return((uint32_t)(SCB->SHP[((uint32_t)(IRQn) & 0xF)-4] >> (8 - __NVIC_PRIO_BITS)));  } /* get priority for Cortex-M  system interrupts */
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
L_STM32F4xx_SPL_Test_NVIC_GetPriority6:
;core_cm4.h,1192 :: 		return((uint32_t)(NVIC->IP[(uint32_t)(IRQn)]           >> (8 - __NVIC_PRIO_BITS)));  } /* get priority for device specific interrupts  */
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
;core_cm4.h,1193 :: 		}
L_end_NVIC_GetPriority:
BX	LR
; end of STM32F4xx_SPL_Test_NVIC_GetPriority
STM32F4xx_SPL_Test_NVIC_EncodePriority:
;core_cm4.h,1210 :: 		static __INLINE uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
; SubPriority start address is: 8 (R2)
; PreemptPriority start address is: 4 (R1)
; PriorityGroup start address is: 0 (R0)
; SubPriority end address is: 8 (R2)
; PreemptPriority end address is: 4 (R1)
; PriorityGroup end address is: 0 (R0)
; PriorityGroup start address is: 0 (R0)
; PreemptPriority start address is: 4 (R1)
; SubPriority start address is: 8 (R2)
;core_cm4.h,1212 :: 		uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);          /* only values 0..7 are used          */
AND	R3, R0, #7
; PriorityGroup end address is: 0 (R0)
; PriorityGroupTmp start address is: 16 (R4)
MOV	R4, R3
;core_cm4.h,1216 :: 		PreemptPriorityBits = ((7 - PriorityGroupTmp) > __NVIC_PRIO_BITS) ? __NVIC_PRIO_BITS : 7 - PriorityGroupTmp;
RSB	R3, R3, #7
CMP	R3, #4
IT	LS
BLS	L_STM32F4xx_SPL_Test_NVIC_EncodePriority8
; ?FLOC__STM32F4xx_SPL_Test_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__STM32F4xx_SPL_Test_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_STM32F4xx_SPL_Test_NVIC_EncodePriority9
L_STM32F4xx_SPL_Test_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__STM32F4xx_SPL_Test_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__STM32F4xx_SPL_Test_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_STM32F4xx_SPL_Test_NVIC_EncodePriority9:
; ?FLOC__STM32F4xx_SPL_Test_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__STM32F4xx_SPL_Test_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_STM32F4xx_SPL_Test_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__STM32F4xx_SPL_Test_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__STM32F4xx_SPL_Test_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_STM32F4xx_SPL_Test_NVIC_EncodePriority11
L_STM32F4xx_SPL_Test_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__STM32F4xx_SPL_Test_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__STM32F4xx_SPL_Test_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_STM32F4xx_SPL_Test_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__STM32F4xx_SPL_Test_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOVS	R3, #1
LSLS	R3, R0
; PreemptPriorityBits end address is: 0 (R0)
SUBS	R3, R3, #1
AND	R3, R1, R3, LSL #0
; PreemptPriority end address is: 4 (R1)
LSL	R4, R3, R5
;core_cm4.h,1221 :: 		((SubPriority     & ((1 << (SubPriorityBits    )) - 1)))
MOVS	R3, #1
LSLS	R3, R5
; ?FLOC__STM32F4xx_SPL_Test_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of STM32F4xx_SPL_Test_NVIC_EncodePriority
STM32F4xx_SPL_Test_NVIC_DecodePriority:
;core_cm4.h,1240 :: 		static __INLINE void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* pPreemptPriority, uint32_t* pSubPriority)
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
;core_cm4.h,1242 :: 		uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);          /* only values 0..7 are used          */
AND	R4, R1, #7
; PriorityGroup end address is: 4 (R1)
; PriorityGroupTmp start address is: 20 (R5)
MOV	R5, R4
;core_cm4.h,1246 :: 		PreemptPriorityBits = ((7 - PriorityGroupTmp) > __NVIC_PRIO_BITS) ? __NVIC_PRIO_BITS : 7 - PriorityGroupTmp;
RSB	R4, R4, #7
CMP	R4, #4
IT	LS
BLS	L_STM32F4xx_SPL_Test_NVIC_DecodePriority12
; ?FLOC__STM32F4xx_SPL_Test_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__STM32F4xx_SPL_Test_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_STM32F4xx_SPL_Test_NVIC_DecodePriority13
L_STM32F4xx_SPL_Test_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__STM32F4xx_SPL_Test_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__STM32F4xx_SPL_Test_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_STM32F4xx_SPL_Test_NVIC_DecodePriority13:
; ?FLOC__STM32F4xx_SPL_Test_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__STM32F4xx_SPL_Test_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_STM32F4xx_SPL_Test_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__STM32F4xx_SPL_Test_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__STM32F4xx_SPL_Test_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_STM32F4xx_SPL_Test_NVIC_DecodePriority15
L_STM32F4xx_SPL_Test_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__STM32F4xx_SPL_Test_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__STM32F4xx_SPL_Test_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_STM32F4xx_SPL_Test_NVIC_DecodePriority15:
; ?FLOC__STM32F4xx_SPL_Test_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__STM32F4xx_SPL_Test_NVIC_DecodePriority?T140 end address is: 16 (R4)
MOVS	R4, #1
LSLS	R4, R1
; PreemptPriorityBits end address is: 4 (R1)
SUBS	R4, R4, #1
AND	R4, R5, R4, LSL #0
STR	R4, [R2, #0]
; pPreemptPriority end address is: 8 (R2)
;core_cm4.h,1250 :: 		*pSubPriority     = (Priority                   ) & ((1 << (SubPriorityBits    )) - 1);
MOVS	R4, #1
LSLS	R4, R6
; SubPriorityBits end address is: 24 (R6)
SUBS	R4, R4, #1
AND	R4, R0, R4, LSL #0
; Priority end address is: 0 (R0)
STR	R4, [R3, #0]
; pSubPriority end address is: 12 (R3)
;core_cm4.h,1251 :: 		}
L_end_NVIC_DecodePriority:
BX	LR
; end of STM32F4xx_SPL_Test_NVIC_DecodePriority
STM32F4xx_SPL_Test_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	STM32F4xx_SPL_Test___DSB+0
;core_cm4.h,1263 :: 		(SCB->AIRCR & SCB_AIRCR_PRIGROUP_Msk) |
MOVW	R2, #60684
MOVT	R2, #57344
LDR	R0, [R2, #0]
AND	R1, R0, #1792
MOVW	R0, #0
MOVT	R0, #1530
ORRS	R0, R1
;core_cm4.h,1264 :: 		SCB_AIRCR_SYSRESETREQ_Msk);                   /* Keep priority group unchanged */
ORR	R0, R0, #4
STR	R0, [R2, #0]
;core_cm4.h,1265 :: 		__DSB();                                                     /* Ensure completion of memory access */
BL	STM32F4xx_SPL_Test___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_STM32F4xx_SPL_Test_NVIC_SystemReset16:
IT	AL
BAL	L_STM32F4xx_SPL_Test_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of STM32F4xx_SPL_Test_NVIC_SystemReset
STM32F4xx_SPL_Test_SysTick_Config:
;core_cm4.h,1290 :: 		static __INLINE uint32_t SysTick_Config(uint32_t ticks)
; ticks start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; ticks end address is: 0 (R0)
; ticks start address is: 0 (R0)
;core_cm4.h,1292 :: 		if (ticks > SysTick_LOAD_RELOAD_Msk)  return (1);            /* Reload value impossible */
MVN	R1, #-16777216
CMP	R0, R1
IT	LS
BLS	L_STM32F4xx_SPL_Test_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_STM32F4xx_SPL_Test_SysTick_Config18:
;core_cm4.h,1294 :: 		SysTick->LOAD  = (ticks & SysTick_LOAD_RELOAD_Msk) - 1;      /* set reload register */
; ticks start address is: 0 (R0)
MVN	R1, #-16777216
AND	R1, R0, R1, LSL #0
; ticks end address is: 0 (R0)
SUBS	R2, R1, #1
MOVW	R1, #57364
MOVT	R1, #57344
STR	R2, [R1, #0]
;core_cm4.h,1295 :: 		NVIC_SetPriority (SysTick_IRQn, (1<<__NVIC_PRIO_BITS) - 1);  /* set Priority for Cortex-M0 System Interrupts */
MOV	R1, #15
MOVS	R0, #-1
SXTB	R0, R0
BL	STM32F4xx_SPL_Test_NVIC_SetPriority+0
;core_cm4.h,1296 :: 		SysTick->VAL   = 0;                                          /* Load the SysTick Counter Value */
MOV	R2, #0
MOVW	R1, #57368
MOVT	R1, #57344
STR	R2, [R1, #0]
;core_cm4.h,1299 :: 		SysTick_CTRL_ENABLE_Msk;                    /* Enable SysTick IRQ and SysTick Timer */
MOV	R2, #7
MOVW	R1, #57360
MOVT	R1, #57344
STR	R2, [R1, #0]
;core_cm4.h,1300 :: 		return (0);                                                  /* Function successful */
MOV	R0, #0
;core_cm4.h,1301 :: 		}
L_end_SysTick_Config:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of STM32F4xx_SPL_Test_SysTick_Config
STM32F4xx_SPL_Test_ITM_SendChar:
;core_cm4.h,1328 :: 		static __INLINE uint32_t ITM_SendChar (uint32_t ch)
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
;core_cm4.h,1330 :: 		if ((CoreDebug->DEMCR & CoreDebug_DEMCR_TRCENA_Msk)  &&      /* Trace enabled */
MOVW	R1, #60924
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #16777216
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
CMP	R1, #0
IT	EQ
BEQ	L_STM32F4xx_SPL_Test_ITM_SendChar51
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_STM32F4xx_SPL_Test_ITM_SendChar52
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_STM32F4xx_SPL_Test_ITM_SendChar53
L_STM32F4xx_SPL_Test_ITM_SendChar47:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_STM32F4xx_SPL_Test_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_STM32F4xx_SPL_Test_ITM_SendChar23
IT	AL
BAL	L_STM32F4xx_SPL_Test_ITM_SendChar22
L_STM32F4xx_SPL_Test_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_STM32F4xx_SPL_Test_ITM_SendChar50
L_STM32F4xx_SPL_Test_ITM_SendChar51:
L_STM32F4xx_SPL_Test_ITM_SendChar50:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_STM32F4xx_SPL_Test_ITM_SendChar49
L_STM32F4xx_SPL_Test_ITM_SendChar52:
L_STM32F4xx_SPL_Test_ITM_SendChar49:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_STM32F4xx_SPL_Test_ITM_SendChar48
L_STM32F4xx_SPL_Test_ITM_SendChar53:
L_STM32F4xx_SPL_Test_ITM_SendChar48:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of STM32F4xx_SPL_Test_ITM_SendChar
STM32F4xx_SPL_Test_ITM_ReceiveChar:
;core_cm4.h,1350 :: 		static __INLINE int32_t ITM_ReceiveChar (void) {
SUB	SP, SP, #4
;core_cm4.h,1351 :: 		int32_t ch = -1;                           /* no character available */
MOV	R0, #-1
STR	R0, [SP, #0]
;core_cm4.h,1353 :: 		if (ITM_RxBuffer != ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	EQ
BEQ	L_STM32F4xx_SPL_Test_ITM_ReceiveChar24
;core_cm4.h,1354 :: 		ch = ITM_RxBuffer;
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R0, [R0, #0]
STR	R0, [SP, #0]
;core_cm4.h,1355 :: 		ITM_RxBuffer = ITM_RXBUFFER_EMPTY;       /* ready for next character */
MOVW	R1, #23205
MOVT	R1, #23205
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
STR	R1, [R0, #0]
;core_cm4.h,1356 :: 		}
L_STM32F4xx_SPL_Test_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of STM32F4xx_SPL_Test_ITM_ReceiveChar
STM32F4xx_SPL_Test_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_STM32F4xx_SPL_Test_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_STM32F4xx_SPL_Test_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of STM32F4xx_SPL_Test_ITM_CheckChar
_main:
;STM32F4xx_SPL_Test.c,10 :: 		void main()
SUB	SP, SP, #4
;STM32F4xx_SPL_Test.c,12 :: 		unsigned char s = 0;
MOVS	R0, #0
STRB	R0, [SP, #0]
;STM32F4xx_SPL_Test.c,14 :: 		setup_GPIOs();
BL	_setup_GPIOs+0
;STM32F4xx_SPL_Test.c,15 :: 		check_LEDs();
BL	_check_LEDs+0
;STM32F4xx_SPL_Test.c,17 :: 		while(1)
L_main27:
;STM32F4xx_SPL_Test.c,19 :: 		if(GPIO_ReadInputDataBit(GPIOA, GPIO_Pin_0))
MOVW	R1, #1
MOVW	R0, #0
MOVT	R0, #16386
BL	_GPIO_ReadInputDataBit+0
CMP	R0, #0
IT	EQ
BEQ	L_main29
;STM32F4xx_SPL_Test.c,21 :: 		while(GPIO_ReadInputDataBit(GPIOA, GPIO_Pin_0) == 1);
L_main30:
MOVW	R1, #1
MOVW	R0, #0
MOVT	R0, #16386
BL	_GPIO_ReadInputDataBit+0
CMP	R0, #1
IT	NE
BNE	L_main31
IT	AL
BAL	L_main30
L_main31:
;STM32F4xx_SPL_Test.c,22 :: 		s++;
LDRB	R0, [SP, #0]
ADDS	R0, R0, #1
STRB	R0, [SP, #0]
;STM32F4xx_SPL_Test.c,23 :: 		}
L_main29:
;STM32F4xx_SPL_Test.c,25 :: 		if(s >= 6)
LDRB	R0, [SP, #0]
CMP	R0, #6
IT	LT
BLT	L_main32
;STM32F4xx_SPL_Test.c,27 :: 		s = 0;
MOVS	R0, #0
STRB	R0, [SP, #0]
;STM32F4xx_SPL_Test.c,28 :: 		}
L_main32:
;STM32F4xx_SPL_Test.c,30 :: 		switch(s)
IT	AL
BAL	L_main33
;STM32F4xx_SPL_Test.c,32 :: 		case 1:
L_main35:
;STM32F4xx_SPL_Test.c,34 :: 		GPIO_SetBits(GPIOD, GPIO_Pin_12);
MOVW	R1, #4096
MOVW	R0, #3072
MOVT	R0, #16386
BL	_GPIO_SetBits+0
;STM32F4xx_SPL_Test.c,35 :: 		break;
IT	AL
BAL	L_main34
;STM32F4xx_SPL_Test.c,37 :: 		case 2:
L_main36:
;STM32F4xx_SPL_Test.c,39 :: 		GPIO_SetBits(GPIOD, GPIO_Pin_13);
MOVW	R1, #8192
MOVW	R0, #3072
MOVT	R0, #16386
BL	_GPIO_SetBits+0
;STM32F4xx_SPL_Test.c,40 :: 		break;
IT	AL
BAL	L_main34
;STM32F4xx_SPL_Test.c,42 :: 		case 3:
L_main37:
;STM32F4xx_SPL_Test.c,44 :: 		GPIO_SetBits(GPIOD, GPIO_Pin_14);
MOVW	R1, #16384
MOVW	R0, #3072
MOVT	R0, #16386
BL	_GPIO_SetBits+0
;STM32F4xx_SPL_Test.c,45 :: 		break;
IT	AL
BAL	L_main34
;STM32F4xx_SPL_Test.c,47 :: 		case 4:
L_main38:
;STM32F4xx_SPL_Test.c,49 :: 		GPIO_SetBits(GPIOD, GPIO_Pin_15);
MOVW	R1, #32768
MOVW	R0, #3072
MOVT	R0, #16386
BL	_GPIO_SetBits+0
;STM32F4xx_SPL_Test.c,50 :: 		break;
IT	AL
BAL	L_main34
;STM32F4xx_SPL_Test.c,52 :: 		case 5:
L_main39:
;STM32F4xx_SPL_Test.c,54 :: 		GPIO_SetBits(GPIOD, GPIO_Pin_12);
MOVW	R1, #4096
MOVW	R0, #3072
MOVT	R0, #16386
BL	_GPIO_SetBits+0
;STM32F4xx_SPL_Test.c,55 :: 		GPIO_SetBits(GPIOD, GPIO_Pin_13);
MOVW	R1, #8192
MOVW	R0, #3072
MOVT	R0, #16386
BL	_GPIO_SetBits+0
;STM32F4xx_SPL_Test.c,56 :: 		GPIO_SetBits(GPIOD, GPIO_Pin_14);
MOVW	R1, #16384
MOVW	R0, #3072
MOVT	R0, #16386
BL	_GPIO_SetBits+0
;STM32F4xx_SPL_Test.c,57 :: 		GPIO_SetBits(GPIOD, GPIO_Pin_15);
MOVW	R1, #32768
MOVW	R0, #3072
MOVT	R0, #16386
BL	_GPIO_SetBits+0
;STM32F4xx_SPL_Test.c,58 :: 		break;
IT	AL
BAL	L_main34
;STM32F4xx_SPL_Test.c,60 :: 		default:
L_main40:
;STM32F4xx_SPL_Test.c,62 :: 		break;
IT	AL
BAL	L_main34
;STM32F4xx_SPL_Test.c,64 :: 		}
L_main33:
LDRB	R0, [SP, #0]
CMP	R0, #1
IT	EQ
BEQ	L_main35
LDRB	R0, [SP, #0]
CMP	R0, #2
IT	EQ
BEQ	L_main36
LDRB	R0, [SP, #0]
CMP	R0, #3
IT	EQ
BEQ	L_main37
LDRB	R0, [SP, #0]
CMP	R0, #4
IT	EQ
BEQ	L_main38
LDRB	R0, [SP, #0]
CMP	R0, #5
IT	EQ
BEQ	L_main39
IT	AL
BAL	L_main40
L_main34:
;STM32F4xx_SPL_Test.c,65 :: 		Delay_ms(90);
MOVW	R7, #61054
MOVT	R7, #54
NOP
NOP
L_main41:
SUBS	R7, R7, #1
BNE	L_main41
NOP
NOP
NOP
;STM32F4xx_SPL_Test.c,67 :: 		GPIO_ResetBits(GPIOD, GPIO_Pin_12);
MOVW	R1, #4096
MOVW	R0, #3072
MOVT	R0, #16386
BL	_GPIO_ResetBits+0
;STM32F4xx_SPL_Test.c,68 :: 		GPIO_ResetBits(GPIOD, GPIO_Pin_13);
MOVW	R1, #8192
MOVW	R0, #3072
MOVT	R0, #16386
BL	_GPIO_ResetBits+0
;STM32F4xx_SPL_Test.c,69 :: 		GPIO_ResetBits(GPIOD, GPIO_Pin_14);
MOVW	R1, #16384
MOVW	R0, #3072
MOVT	R0, #16386
BL	_GPIO_ResetBits+0
;STM32F4xx_SPL_Test.c,70 :: 		GPIO_ResetBits(GPIOD, GPIO_Pin_15);
MOVW	R1, #32768
MOVW	R0, #3072
MOVT	R0, #16386
BL	_GPIO_ResetBits+0
;STM32F4xx_SPL_Test.c,71 :: 		Delay_ms(90);
MOVW	R7, #61054
MOVT	R7, #54
NOP
NOP
L_main43:
SUBS	R7, R7, #1
BNE	L_main43
NOP
NOP
NOP
;STM32F4xx_SPL_Test.c,72 :: 		}
IT	AL
BAL	L_main27
;STM32F4xx_SPL_Test.c,73 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup_GPIOs:
;STM32F4xx_SPL_Test.c,76 :: 		void setup_GPIOs()
SUB	SP, SP, #12
STR	LR, [SP, #0]
;STM32F4xx_SPL_Test.c,80 :: 		RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
MOVS	R1, #1
MOV	R0, #1
BL	_RCC_AHB1PeriphClockCmd+0
;STM32F4xx_SPL_Test.c,81 :: 		RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD, ENABLE);
MOVS	R1, #1
MOV	R0, #8
BL	_RCC_AHB1PeriphClockCmd+0
;STM32F4xx_SPL_Test.c,83 :: 		GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0;
MOVW	R0, #1
STR	R0, [SP, #4]
;STM32F4xx_SPL_Test.c,84 :: 		GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
MOVS	R0, #0
STRB	R0, [SP, #8]
;STM32F4xx_SPL_Test.c,85 :: 		GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
MOVS	R0, #2
STRB	R0, [SP, #9]
;STM32F4xx_SPL_Test.c,86 :: 		GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
MOVS	R0, #0
STRB	R0, [SP, #10]
;STM32F4xx_SPL_Test.c,87 :: 		GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_DOWN;
MOVS	R0, #2
STRB	R0, [SP, #11]
;STM32F4xx_SPL_Test.c,88 :: 		GPIO_Init(GPIOA, &GPIO_InitStructure);
ADD	R0, SP, #4
MOV	R1, R0
MOVW	R0, #0
MOVT	R0, #16386
BL	_GPIO_Init+0
;STM32F4xx_SPL_Test.c,90 :: 		GPIO_InitStructure.GPIO_Pin = (GPIO_Pin_12 | GPIO_Pin_13 | GPIO_Pin_14 | GPIO_Pin_15);
MOV	R0, #61440
STR	R0, [SP, #4]
;STM32F4xx_SPL_Test.c,91 :: 		GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
MOVS	R0, #1
STRB	R0, [SP, #8]
;STM32F4xx_SPL_Test.c,92 :: 		GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
MOVS	R0, #0
STRB	R0, [SP, #9]
;STM32F4xx_SPL_Test.c,93 :: 		GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
MOVS	R0, #0
STRB	R0, [SP, #10]
;STM32F4xx_SPL_Test.c,94 :: 		GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
MOVS	R0, #0
STRB	R0, [SP, #11]
;STM32F4xx_SPL_Test.c,95 :: 		GPIO_Init(GPIOD, &GPIO_InitStructure);
ADD	R0, SP, #4
MOV	R1, R0
MOVW	R0, #3072
MOVT	R0, #16386
BL	_GPIO_Init+0
;STM32F4xx_SPL_Test.c,96 :: 		}
L_end_setup_GPIOs:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _setup_GPIOs
_check_LEDs:
;STM32F4xx_SPL_Test.c,99 :: 		void check_LEDs()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;STM32F4xx_SPL_Test.c,101 :: 		GPIO_SetBits(GPIOD, (GPIO_Pin_12 | GPIO_Pin_13 | GPIO_Pin_14 | GPIO_Pin_15));
MOVW	R1, #61440
MOVW	R0, #3072
MOVT	R0, #16386
BL	_GPIO_SetBits+0
;STM32F4xx_SPL_Test.c,102 :: 		Delay_ms(900);
MOVW	R7, #20734
MOVT	R7, #549
NOP
NOP
L_check_LEDs45:
SUBS	R7, R7, #1
BNE	L_check_LEDs45
NOP
NOP
NOP
;STM32F4xx_SPL_Test.c,103 :: 		GPIO_ResetBits(GPIOD, (GPIO_Pin_12 | GPIO_Pin_13 | GPIO_Pin_14 | GPIO_Pin_15));
MOVW	R1, #61440
MOVW	R0, #3072
MOVT	R0, #16386
BL	_GPIO_ResetBits+0
;STM32F4xx_SPL_Test.c,104 :: 		}
L_end_check_LEDs:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _check_LEDs
