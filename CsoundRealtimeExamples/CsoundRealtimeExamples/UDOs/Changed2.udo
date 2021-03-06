; Changed2
; ----------------
; Similar to the 'changed' opcode but prevents the initial erroneous trigger generated by the opcode during the first k-rate pass
;
; Initialisation
; --------------
; iInstr --  the number of the instrument to be called
; idur   --  the duration of the instrument to be called
;
; ktrig Changed2 kvar1 [, kvar2,..., kvar20]



; Performance
; -----------
; ktrig - Outputs a value of 1 when any of the k-rate signals has changed, otherwise outputs 0.
; kvar1 [, kvar2,..., kvarN] - k-rate variables to watch for changes. 


opcode	changed2,k,kOOOOOOOOOOOOOOOOOOO
	kval1,kval2,kval3,kval4,kval5,kval6,kval7,kval8,kval9,kval10,kval11,kval12,kval13,kval14,kval15,kval16,kval17,kval18,kval19,kval20	xin				;READ IN ARGUMENTS (VALUES TO BE SCANNED)
	ktime	timeinstk			;READ TIME ELAPSED FOR THIS INSTRUMENT FROM INITIALISATION IN k-PERIODS
	ktrig	changed	kval1,kval2,kval3,kval4,kval5,kval6,kval7,kval8,kval9,kval10,kval11,kval12,kval13,kval14,kval15,kval16,kval17,kval18,kval19,kval20			;SCAN FOR CHANGES IN THE INPUT ARGUMENT
	ktrig	=	(ktime<1?0:ktrig)	;IGNORE TRIGGER GENERATED FOR THE FIRST k PERIOD
		xout	ktrig			;OUTPUT CORRECTED TRIGGER
endop
