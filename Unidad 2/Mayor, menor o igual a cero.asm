;Realiza un programa para que dado un numero por el usuario determine si éste es mayor o menor que cero

.model small
.stack
.data
    
    msj db 0ah,0dh, "Ingresa un numero con su signo (si es negativo): $"
    msj2 db 0ah,0dh, "El numero es menor a cero.$"
    msj3 db 0ah,0dh, "El numero es mayor a cero.$"
    msj4 db 0ah,0dh, "El numero es cero.$"
    
    c db ?
    
.code
.startup

mov ax,@data
mov ds,ax      
   
;Mostrar mensaje para pedir un numero---------------------------------------------------------------------------------------------

lea dx,msj
mov ah,09h
int 21h

;Pedir numero----------------------------------------------------------------------------------------------------------------------

mov ah,01h
int 21h
sub al,30h
mov c,al
int 21h
sub al,30h
mov ah,c
mov bl,c                                                                                                                            

;Comparacion-----------------------------------------------------------------------------------------------------------------------
cmp bl,0 

JG LabelMayor
JL LabelMenor
JE LabelCero

    LabelMayor:
        mov ah,09h
        lea dx,msj3
        int 21h
        jmp LabelExit
    
    LabelMenor:
        mov ah,09h
        lea dx,msj2
        int 21h
        jmp LabelExit
        
     LabelCero:
        mov ah,09h
        lea dx,msj4
        int 21h
        jmp LabelExit
        
LabelExit:
.exit        
end        