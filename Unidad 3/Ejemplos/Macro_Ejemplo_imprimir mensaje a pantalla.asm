;Macro para imprimir un mensaje

imprime Macro msg
    mov ah, 09h
    mov dx, offset msg
    int 21h
ENDM

.model small
.stack
.data

    msg1 db 13,10, "Macro! Mensaje 1$"
    msg2 db 13,10, "Macro!!! Mensaje 2$"
    
.Code
inicio:

mov ax,@Data
mov ds,ax   

imprime msg1   
imprime msg2           

.exit
end