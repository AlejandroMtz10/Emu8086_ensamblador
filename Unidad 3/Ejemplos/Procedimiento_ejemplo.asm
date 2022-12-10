.Model Small
.Data
    msg db "Es un procedimiento.$"
    
.code
inicio:
mov ax, @Data
mov ds,ax
call imprime

imprime PROC near
    mov ah,09h
    mov dx, offset msg
    int 21h 
    RET
ENDP