SECTION .data
    msg_result db "Resultado: ", 0
    msg_input db "Valor de x: ", 0
    newline db 0xA, 0
    res db 0  ; Espacio para almacenar el resultado

SECTION .bss
    x resb 4  ; Variable para almacenar x

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
    jl less_than_4  ; Si x < 4, saltar a less_than_4
    jge greater_or_equal_4  ; Si x >= 4, saltar a greater_or_equal_4

less_than_4:
    ; Calcular x + b (b = 83)
    mov eax, [x]
    add eax, 83
    mov [res], eax  ; Guardar el resultado
    jmp print_result  ; Saltar para imprimir el resultado

greater_or_equal_4:
    ; Calcular a * x - c (a = 79, c = 41)
    mov eax, [x]
    imul eax, 79  ; Multiplicar x * a
    sub eax, 41   ; Restar c
    mov [res], eax  ; Guardar el resultado

print_result:
    ; Imprimir "Resultado: "
    mov eax, msg_result
    call sprintLF

    ; Imprimir el resultado
    mov eax, [res]
    call print_int

    ; Imprimir nueva línea
    mov eax, newline
    call sprintLF

    ; Finalizar programa
    call quit
