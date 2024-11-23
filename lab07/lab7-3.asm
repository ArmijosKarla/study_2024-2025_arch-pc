SECTION .data
    msg_result db "Resultado: ", 0
    msg_input db "Valor de x: ", 0
    res db 0      ; Espacio para almacenar el resultado
    newline db 0xA, 0

SECTION .bss
    x resb 4      ; Variable para almacenar x
    a resb 4      ; Variable para a (constante calculada)

SECTION .text
GLOBAL _start

_start:
    ; Imprimir mensaje para introducir x
    mov eax, msg_input
    call sprintLF

    ; Leer valor de x
    call read_int
    mov [x], eax  ; Guardar x

    ; Comparar x con 4
    mov eax, [x]
    cmp eax, 4
    jl less_than_4 ; Si x < 4, saltar a less_than_4
    jge greater_or_equal_4 ; Si x >= 4, saltar a greater_or_equal_4

less_than_4:
    ; Calcular x + 4
    mov eax, [x]
    add eax, 4
    mov [res], eax ; Guardar el resultado
    jmp print_result ; Saltar para imprimir el resultado

greater_or_equal_4:
    ; Calcular a * x (a = 1/7)
    ; Definimos a como 1/7 (en formato fijo o flotante para simplificar)
    mov eax, [x]
    mov ebx, 7  ; Divisor (a = 1/7)
    div ebx      ; eax = x / 7
    mov [res], eax ; Guardar el resultado

print_result:
    ; Imprimir "Resultado: "
    mov eax, msg_result
    call sprintLF

    ; Imprimir el resultado
    mov eax, [res]
    call print_int

    ; Imprimir una nueva línea
    mov eax, newline
    call sprintLF

    ; Finalizar programa
    call quit
