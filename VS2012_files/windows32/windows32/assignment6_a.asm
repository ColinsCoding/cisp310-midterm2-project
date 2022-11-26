;pennies for pay
;exponential pay

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
caloriesburned DWORD ?
cpm DWORD 4
minutes DWORD 5


prompt0 BYTE "Minutes: ", 0
prompt1 BYTE "You've burned the following amount of calories:", 0

caloriesburnedB     BYTE    11 DUP (?), 0

.CODE
_MainProc2 PROC


        mov     eax, 0 ;intialize zero to eax
        mov     ecx, 0 ;intialize zero to ecx

        repeatLoop:
                add     ecx, 5 ; iterate ecx by + 5 each loop cycle
                mov     eax, ecx ; move iterator to eax to prepare multiplication
                imul    eax, cpm ; multiply iterator inside eax by cpm (4)
                dtoa     caloriesburnedB, eax  ; copy eax result into out variable
                 
                cmp   ecx, 30  ;compare ecx (the iterator) to 30 
                jg endRepeatLoop          ; jump if not less than or equal to 

                output  prompt1, caloriesburnedB

                jmp repeatLoop ; jump to the top of the loop
        endRepeatLoop: ; end loop section

        mov     eax, 0  ; exit with return code 0
        ret
_MainProc2 ENDP
END                             ; end of source code
INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA

nplus1 DWORD ?

sum BYTE 11 DUP (?),0
prompt1 BYTE "Summation", 0
string BYTE 40 DUP (?),0
