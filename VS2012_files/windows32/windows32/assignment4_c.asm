; 3.	A bag of cookies holds 30 cookies. The calorie information on the bag claims that there are 10 “servings” in the bag and that a serving equals 240 calories. Write a program that asks the user to input how many cookies they actually ate and then reports how many total calories were consumed.
.586
.MODEL FLAT

INCLUDE io.h

.STACK 4096

.DATA
prompt_b BYTE "How many cookies did you eat?", 0
result_a BYTE "You consumed the following amount of calories: ", 0

calories_per_cookie DWORD 80 
cookies_ate DWORD ?
total_calories_consumed DWORD ?

temp BYTE 11 DUP (?)
string BYTE 40 DUP(?)


.CODE
_MainProc1 PROC

        input prompt_b, string, 40 
        atod string
        mov cookies_ate, eax 

        mul calories_per_cookie
        dtoa total_calories_consumed, eax
        output result_a, total_calories_consumed

        mov eax, 0                                                  ; make compiler happy 
        ret 
_MainProc1 ENDP
END
