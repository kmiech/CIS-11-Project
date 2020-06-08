;CIS11
;Jerry Cruz & Keopyseth Miech
;CIS11 Project - Bubble Sort
;Program will take 8 inputs from the user ranging from "0 - 100"



		.ORIG		x3000			;Origination address
		LDI		R6, NUMARR		;Loading Pointer into R6

		LEA		R0, PROMPT		;Loads Label Prompt into R0
		PUTS					;Displaying String
		JSR		GETNUM
		HALT					;stops the program
		
	GETNUM	GETC					;gets 1st key input
		OUT					;output key input
		ADD 		R1, R0, x0		;Copying First input into R1
		ADD		R1, R1, #-16		;ASCII offset -48
		ADD		R1, R1, #-16
		ADD		R1, R1, #-16
		STI		R1, FNUM		;Store R1 into FNUM
		
		GETC					;gets 2nd key input
		OUT					;output key input
		ADD		R1, R0, x0		;copying Second input into R1
		ADD		R1, R1, #-16		;ASCII offset -48
		ADD		R1, R1, #-16
		ADD		R1, R1, #-16
		STI		R1, SNUM		;storing second input into SNUM
		ADD		R0, R0, #-11		;When "Enter" is input, R0 = 10
		BRn		STORE1			;if R0 = Negative, will branch to STORE1
	
		GETC					;gets 3rd key input
		OUT					;output key input
		ADD		R1, R0, x0		;copying 3rd input into R1
		ADD		R1, R1, #-16		;ASCII offset -48
		ADD		R1, R1, #-16
		ADD		R1, R1, #-16
		STI		R1, TNUM		;storing third input into TNUM
		ADD		R0, R0, #-11		;When "Enter" is input, R0 = 10
		BRn		STORE2			;if R0 - Negative, will branch to STORE2

		GETC					;gets 3rd key input
		OUT					;output key input
		ADD		R0, R0, #-10		
		BRz		STORE3			;if R0 = 0, will branch to STORE3
		;BRnp		ERROR			;if not, will branch to ERROR

	STORE1	LDI 		R1, FNUM		;load FNUM into R1
		STR		R1, R6, #0			;Storing R1 into R6
		RET

	STORE2	LDI		R1, FNUM
		LDI		R2, SNUM
		ADD		R4, R4, #10		;R5 = 10, counter for loop
		
	MULT1	ADD		R1, R1, R1
		ADD		R4, R4, #-1
		BRp		MULT1			;if R5 > 0, will branch to MULT1 loop
		ADD		R1, R1, R2
		STR		R1, R6, #0
		RET

	STORE3	LDI		R1, FNUM
		LDI		R2, SNUM
		LDI		R3, TNUM
		ADD		R4, R4, #10		;R4 = 10, counter for loop
		ADD		R5, R5, #10		;R5 = 10, counter for loop	
		
	MULT2	ADD		R1, R1, R1
		ADD		R4, R4, #-1
		BRp		MULT2			;if R5 > 0, will branch to MULT3 loop

	MULT3	ADD		R1, R1, R1
		ADD		R2, R2, R2
		ADD		R5, R5, #-1
		BRp		MULT3			;if R5 > 0, will branch to MULT3 loop
		ADD		R1, R1, R2
		ADD		R1, R1, R3
		STR		R1, R6, #0
		RET
		






		

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
		LOOPCOUNTER	.FILL x08		;Counter
		NUMARR		.FILL x3600		;Array to hold number inputs address


		
	.END	