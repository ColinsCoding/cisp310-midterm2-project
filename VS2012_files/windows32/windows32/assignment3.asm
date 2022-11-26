; Assignment 3
; Colin Casey
; CISP 360 Al Juboori
; 10/1/2022


.586 ; Start of Source Code
.MODEL FLAT

INCLUDE io.h    ; header file for input/output

.STACK 4096

.DATA 
number1 DWORD   ?
number2 DWORD   ?
number3 DWORD   ?
number4 DWORD   ?
prompt1 BYTE    "Enter student name", 0
prompt2 BYTE    "Enter degree name", 0
prompt3 BYTE    "Enter credits taken", 0
prompt4 BYTE    "Enter credits needed", 0
string  BYTE    40 DUP (?)
resultLbl BYTE  "Remaining credits needed to graduate", 0
sum     BYTE    11 DUP (?), 0

.CODE
_MainProc PROC
        input   prompt1, string, 40      ; read ASCII characters, get StudentName
        atod    string          ; convert to integer
        mov     number1, eax    ; store in memory

        input   prompt2, string, 40      ; repeat for second number, DegreeName
        atod    string
        mov     number2, eax

        input   prompt3, string, 40      ; repeat for third number, CreditsTaken
        atod    string
        mov     number3, eax

        input   prompt4, string, 40      ; repeat for fourth number, TotalCreditsNeeded
        atod    string
        mov     number4, eax
        
        mov     eax, number4    ; first number to EAX
        sub     eax, number3    ; add second number
        dtoa    sum, eax        ; convert to ASCII characters
        output  resultLbl, sum  ; output label and sum

        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code
