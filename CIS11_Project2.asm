;CIS11
;Jerry Cruz & Keopyseth Miech
;CIS11 Project - Bubble Sort
;Program will take 8 inputs from the user ranging from "0 - 100"



		.ORIG		x3000			;Origination address
		LD		R5, LC			;Loading LC into R5 (Loop counter = 8)
		LD		R6, NUMARR		;Loading Pointer into R6
		
		LEA		R0, PROMPT		;Loads Label Prompt into R0
		PUTS					;Displaying String
		

	LOOP1	JSR		GETNUM
		ADD		R6, R6, #-1
		ADD		R5, R5, #-1
		BRp		LOOP1	
		ADD		R6, R6, #1
		JSR		SORT	
		
		LD		R5, LC
		
	LOOP2	;JSR		POP
		LDR		R0, R6, #0
		ADD		R6, R6, #1
		OUT
		LD		R0, SPACE
		OUT
		ADD		R5, R5, #-1
		BRp		LOOP2	

		BR		OVER			;stops the program
		
	GETNUM	ST		R0, SAVEREG0
		ST		R1, SAVEREG1
		ST		R2, SAVEREG2
		ST		R3, SAVEREG3
		ST		R4, SAVEREG4
		ST		R5, SAVEREG5
		ST		R7, SAVEREG7

		AND		R5, R5, #0
	
		GETC					;gets 1st key input
		OUT					;output key input
		ADD 		R1, R0, x0		;Copying First input into R1
		ADD		R1, R1, #-16		;ASCII offset -48
		ADD		R1, R1, #-16
		ADD		R1, R1, #-16
		STI		R1, FNUM		;Store R1 into FNUM
		
		GETC					;gets 2nd key input
		OUT					;output key input
		ADD		R2, R0, x0		;copying Second input into R1
		ADD		R2, R2, #-16		;ASCII offset -48
		ADD		R2, R2, #-16
		ADD		R2, R2, #-16
		STI		R2, SNUM		;storing second input into SNUM
		ADD		R0, R0, #-11		;When "Enter" is input, R0 = 10
		BRn		STORE1			;if R0 = Negative, will branch to STORE1
	
		GETC					;gets 3rd key input
		OUT					;output key input
		ADD		R3, R0, x0		;copying 3rd input into R1
		ADD		R3, R3, #-16		;ASCII offset -48
		ADD		R3, R3, #-16
		ADD		R3, R3, #-16
		AND		R4, R4, #0
		STI		R3, TNUM		;storing third input into TNUM
		ADD		R0, R0, #-11		;When "Enter" is input, R0 = 10
		BRn		STORE2			;if R0 - Negative, will branch to STORE2

		GETC					;gets 3rd key input
		AND		R4, R4, #0
		ADD		R0, R0, #-10		
		BRz		STORE3			;if R0 = 0, will branch to STORE3
		;BRnp		ERROR			;if not, will branch to ERROR

	STORE1	LDI 		R1, FNUM		;load FNUM into R1
		STR		R1, R6, #0			;Storing R1 into R6
		BR		DONE1

	STORE2	LDI		R1, FNUM
		LDI		R2, SNUM
		ADD		R5, R5, #10		;R5 = 10, counter for loop
		
	MULT1	ADD		R4, R4, R1
		ADD		R5, R5, #-1
		BRp		MULT1			;if R5 > 0, will branch to MULT1 loop
		ADD		R4, R4, R2
		STR		R4, R6, #0
		BR		DONE1

	STORE3	LDI		R1, FNUM
		LDI		R2, SNUM
		LDI		R3, TNUM
		
		AND		R0, R0, #0
		ADD		R5, R5, #10		;R5 = 10, counter for loop	
	MULT2	ADD		R4, R4, R1		;Multiplying R1 by 10 = 10*R1 and storing in R4
		ADD		R0, R0, R2		
		ADD		R5, R5, #-1
		BRp		MULT2			;if R5 > 0, will branch to MULT3 loop
		
		ADD		R0, R0, R3
		AND		R2, R2, #0
		AND		R5, R5, #0		
		ADD		R5, R5, #10
	
	MULT3	ADD		R2, R2, R4
		ADD		R5, R5, #-1
		BRp		MULT3
		
		ADD		R0, R0, R2
		STR		R0, R6, #0

	DONE1	LD		R0, SAVEREG0
		LD		R1, SAVEREG1
		LD		R2, SAVEREG2
		LD		R3, SAVEREG3
		LD		R4, SAVEREG4
		LD		R5, SAVEREG5
		LD		R7, SAVEREG7
		RET

	PUSH	ADD		R6, R6, #-1
		STR		R0, R6, #0
		RET
	
	POP	LDR		R0, R6, #0
		ADD		R6, R6, #1
		RET
	
	SORT	ST		R0, SAVEREG0
		ST		R1, SAVEREG1
		ST		R2, SAVEREG2
		ST		R3, SAVEREG3
		ST		R4, SAVEREG4
		ST		R5, SAVEREG5
		ST		R7, SAVEREG7
		AND		R2, R2, #0
		LD		R4, LC
		LD		R5, LC
	SLOOP1	ADD		R4, R4, #-1
		BRz		DONE2
		ADD		R5, R4, #0

	SLOOP2	LDR		R0, R6, #0		;Load first to be compared
		LDR		R1, R6, #1		;Load second to be compared
		NOT		R2, R1			;First compliment
		ADD		R2, R2, #1		;Twos' compliment
		ADD		R2, R0, R2		;Adding first with -R2
		BRnz		SWAP			;if R1 is >= R0, branch to swap(nothing happens then we increment)
		STR		R1, R6, #0		;swapping R0 with R1
		STR		R0, R6, #1		;Swapping R1 with R0
	SWAP	ADD		R6, R6, #1		
		ADD		R5, R5, #-1		;Counter
		BRp		SLOOP2
		BR		SLOOP1

	DONE2	LD		R0, SAVEREG0
		LD		R1, SAVEREG1
		LD		R2, SAVEREG2
		LD		R3, SAVEREG3
		LD		R4, SAVEREG4
		LD		R5, SAVEREG5
		LD		R7, SAVEREG7
		RET
	

	OVER	HALT


		

		PROMPT	.STRINGZ "Enter a number from 0 - 100 eight times to be sorted:"
		INVALID	.STRINGZ "\nThe input is invalid. Enter a different number.\n"
		
		SAVEREG0	.FILL x0
		SAVEREG1	.FILL x1
		SAVEREG2	.FILL x2
		SAVEREG3	.FILL x3
		SAVEREG4	.FILL x4
		SAVEREG5	.FILL x5
		SAVEREG6	.FILL x6
		SAVEREG7	.FILL x7
		FNUM		.FILL x3550
		SNUM		.FILL x3551
		TNUM		.FILL x3552
		SPACE		.FILL x20		;Space
		LC		.FILL x04		;Counter
		EMPTY		.FILL xC000
		NUMARR		.FILL x3600		;Array to hold number inputs address


		
	.END	