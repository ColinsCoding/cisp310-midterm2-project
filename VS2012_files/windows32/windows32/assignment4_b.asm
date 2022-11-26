.586
.MODEL FLAT

INCLUDE io.h

.STACK 4096

.DATA
prompt_a BYTE "Enter Rent Cost Per Month in USD", 0
prompt_b BYTE "Enter Utilities Cost Per Month in USD", 0
prompt_c BYTE "Enter Phone Cost Per Month in USD", 0
prompt_d BYTE "Enter Cable Cost Per Month in USD", 0

Rent        DWORD ?
Utilities   DWORD ?
Phone       DWORD ?
Cable       DWORD ?
months_ina_year DWORD 12

string BYTE 40 DUP(?)
result_str_a BYTE "Total Monthly Payment in USD: ", 0
result_str_b BYTE "Total Yearly Payment in USD: ", 0
tempTTLpayment BYTE 11 DUP (?)

.CODE
_MainProc PROC
        input prompt_a, string, 40
        atod string 
        mov Rent, eax

        input prompt_b, string, 40
        atod string 
        mov Utilities, eax

        input prompt_c, string, 40
        atod string 
        mov Phone, eax

        input prompt_d, string, 40
        atod string 
        mov Cable, eax

        mov eax, Rent
        add eax, Utilities
        add eax, Phone
        add eax, Cable

        dtoa tempTTLpayment, eax
        output result_str_a, tempTTLpayment

        mul months_ina_year
        dtoa tempTTLpayment, eax
        output result_str_b, tempTTLpayment


        mov eax, 0                                                  ; make compiler happy 
        ret 
_MainProc ENDP
END
