%include 'in_out.asm'    ; подключение внешнего файла 

SECTION   .data 
msg: DB  'Введите значение переменной x: ',0
rem: DB  'Результат: ',0

SECTION  .bss
x: RESB  80 ; Переменная, значание к-рой будем вводить с клавиатуры
SECTION  .text 
GLOBAL  _start
_start:

; ---  Вычесление выражения

mov  eax, msg
call sprint
mov  ecx, x
mov  edx, 80
call  sread
  
mov  eax,x ; вызов подпрограммы преобразования
call atoi  ; ASCII когда в число, 'eax=x'
add  eax,11; eax = eax+11 + x + 11
mov  ebx,2
mul  ebx; EAX=EAX*EBX = (x+11)*2
add  eax,-6; eax = eax-6 = (x+11)*2-6
mov  edi,eax ; запись результата вычисления в 'edi'
;  ---  Выводд результата на экран
mov eax,rem   ; вызов подпрограммы печати
call sprint   ; сообщения 'Результат: '
mov eax,edi  ; вызов подпрограммы печати значания
call iprint  ; из 'edi' в виде символов 
call quit     ; вызов подпрограммы завершения 

