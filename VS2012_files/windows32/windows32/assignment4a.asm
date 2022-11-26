; Assignment 4a
; Colin Casey
; CISP 360 Al Juboori
; 10/1/2022

.586
.MODEL FLAT

INCLUDE io.h

.STACK 4096

.DATA
capacity DWORD ?
miles DWORD ?
prompt_miles BYTE "Enter the total miles driven in one tank", 0
prompt_capacity BYTE "Enter the capacity of your vehicle in gallons", 0
string BYTE 40 DUP (?)
resultLbl BYTE "Miles per Gallon of vehicle", 0
miles_per_gallon BYTE 16 DUP (?),0

.CODE
_MainProc PROC
        input   prompt_capacity, string, 40                         ; read ASCII characters, get StudentName
        atod    string                                              ; convert to integer
        mov     capacity, eax                                       ; store in memory

        input   prompt_miles, string, 40                            ; repeat for second number, DegreeName
        atod    string
        mov     miles, eax

        mov     eax, capacity                                        ; move miles (variable) into EAX
        mov     ebx, miles                                        ; move capacity into EBX 
        cdq                                                         ; convert double to quad 
        div     ebx                                               ;miles divided BY capacity (gallons)
    
        dtoa miles_per_gallon, eax                                  ; convert to ASCII
        output resultLbl, miles_per_gallon                           ; out the resultLbl variable AND the miles per gallon

        mov eax, 0                                                  ; make compiler happy 
        ret 
_MainProc ENDP
END

 