.model small
.stack
.data
    
    array db 'H', 'O', 'L', 'A'
    c db 01h

.code
main proc       
    
    ;cargo el data en segmento de datos
    mov ax, @data
    mov ds, ax
    
    ;funcion 2 para mostrar caracter en pantalla
    mov ah, 2
    
    ;posiciona el apuntador si en la primera posicion del arreglo
    lea si, array
    
    ;pone en el registro dl el caracter a mostrar
    mov dl, [si]
    int 21h
    
    ;incrementa el apuntador a la siguiente posicion
    
    
    ciclo:
    cmp c, 04h
    je salir
    
    inc si
    mov dl, [si]
    int 21h
    add c, 01h
    
    jmp ciclo
    

salir:
.exit
end