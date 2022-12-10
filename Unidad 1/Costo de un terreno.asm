;Programa para calcular el costo de un terreno en metros cuadrados

.model small
.stack
.data

    Largo db 0ah,0dh, "Ingrese el largo: $"
    Ancho db 0ah,0dh, "Ingrese el ancho: $"
    Resultado db 0ah,0dh, "Resultado: $"
    
.code
.startup

    mov ax,@data
    mov ds,ax
    
    ;Pedir Largo
    
    lea dx,Largo
    mov ah,09h
    int 21h
    
    
                                                                        