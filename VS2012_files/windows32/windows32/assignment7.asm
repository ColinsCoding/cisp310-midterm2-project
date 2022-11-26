.586
.MODEL FLAT

INCLUDE io.h

.STACK 4096

.DATA
num1 DWORD ?
num2 DWORD ?
promptnum1		BYTE	"Enter number 1", 0
promptoperator	BYTE	"Enter a math operator", 0
promptnum2		BYTE	"Enter number 2", 0
string		BYTE	40 DUP (?)
stringmathoperator		BYTE	1 DUP (?)
outputLbl	BYTE	"The result is", 0
result	BYTE	11 DUP (?), 0

.CODE

_MainProc3 PROC

; Ascii equivalents in decimal
; + 43
; - 45
; * 42
; / 47

	whileRunning:

	input	promptnum1, string, 40	; prompt the user for the first number
	atod	string	; convert to integer
	mov	num1, eax 

	input	promptoperator, stringmathoperator, 40

	input	promptnum2, string, 40	; pompt the user for the second number
	atod	string	; convert to integer
	mov	num2, eax 	; store it in ecx

	cmp num1, 101
	je quit 

	cmp num2, 101
	je quit 

	cmp stringmathoperator, 101
	je quit



	push num2 ; push number 2 first to the stack
	push num1 ; push number 1 secondly to the stack

	cmp stringmathoperator, 43 ; is multiplication?
		je add_	
		jne cont1
		add_: 
			call addition
			jmp display

		cont1:

	cmp stringmathoperator, 42 ; is addition?
		je mult	
		jne cont2
		mult: 
			call multiply
			jmp display

		cont2:

	cmp stringmathoperator, 45 ; is subtraction?
		je sub_	
		jne cont3
		sub_: 
			call subtract
			jmp display

		cont3:

	cmp stringmathoperator, 47 ; is division?
		je div_	
		jne cont4
		div_: 
			call divide
			jmp display

		cont4:


	display:
		add esp, 8      ; remove parametrs from stack
			dtoa	result, eax 	; convert the RESULT to ASCII and store in "product"
			output	outputLbl, result  ; output the RESULT
		jmp whileRunning

	quit:
		mov     eax, 0  ; exit with return code 0
        ret


_MainProc3 ENDP


addition PROC ; addition procedure start
	push   ebp            ; save EBP
		   mov    ebp,esp        ; establish stack frame
		   mov    eax,[ebp+8]    ; copy first parameter value
		   add    eax,[ebp+12]   ; ADD second parameter value
		   pop    ebp            ; restore EBP
		   ret                   ; return
addition ENDP


subtract PROC ; substract procedure start
	push   ebp            ; save EBP
		   mov    ebp,esp        ; establish stack frame
		   mov    eax,[ebp+8]    ; copy first parameter value
		   sub    eax,[ebp+12]   ; SUB second parameter value
		   pop    ebp            ; restore EBP
		   ret                   ; return
subtract ENDP




divide PROC ; divide procedure start
	push   ebp            ; save EBP
		   mov    ebp,esp        ; establish stack frame
		   mov    eax,[ebp+8]    ; copy first parameter value
		   mov    ebx,[ebp+12]   ; mov second parameter value
		   cdq
		   idiv		ebx
		   pop    ebp            ; restore EBP
		   ret                   ; return
divide ENDP


multiply PROC ;   multiply procedure start
	push   ebp            ; save EBP
		   mov    ebp,esp        ; establish stack frame
		   mov    eax,[ebp+8]    ; copy first parameter value
		   imul    eax,[ebp+12]   ; add second parameter value
		   pop    ebp            ; restore EBP
		   ret                   ; return
multiply ENDP
END
