.model small
.stack
.data

        ms1 db 0ah,0dh, "Ingresa el primer digito: $"
        ms2 db 0ah,0dh, "Ingresa el segundo digito: $"
        resultado db 0ah,0dh, "Resultado: $"

.code
.starup
    
    mov ax,@data
    mov ds,ax
    
    ;mostrar mensaje
    lea dx,ms1
    mov ah,09h
    int 21h
    
    ;ingresar primer numero
    mov ah,01h
    int 21h
    sub al,30h
    mov bl,al
    
    ;mostrar segundo mensaje
    lea dx,ms2
    mov ah,09h
    int 21h
    
    ;ingresar el segundo numero
    mov ah,01h
    int 21h
    sub al,30h
    
    ;Multiplicacion
     mul bl
     aam
     add ax,3030h


end

