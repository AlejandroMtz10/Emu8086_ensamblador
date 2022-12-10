.model small
.stack
.data

    arreglo db 'H','o','l','a'
    
.code
main proc
    ;cargo el data en segmento de datos
    mov ax,@data
    mov ds,ax
    
    ;funcion 2 para mostrar caracter a pantalla
    mov ah,2
    
    ;posiciona el apuntador SI en la primera posicion del arreglo      
    lea si,arreglo
    
    ;pone en el registro dl el caracter a mostrar
    mov dl,[si]
    int 21h
    
    ;incrementa el apuntador a la siguiente posicion
    inc si
    mov dl,[si]
    int 21h
    
    ;incrementa el apuntador a la siguiente posicion
    inc si
    mov dl,[si]
    int 21h    
    
    ;incrementa el apuntador a la siguiente posicion
    inc si
    mov dl,[si]
    int 21h        
    
    
end