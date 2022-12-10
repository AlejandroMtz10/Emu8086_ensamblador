;Programa para sentencia if y else    

.model small
.stack
.data

 msj db 0ah,0dh, "Ingresa un numero decimal: $"
 msj2 db 0ah,0dh,"Numero menor a 5.$"         
 msj3 db 0ah,0dh, "Numero mayor a 5.$"
 
.code
.startup

mov ax,@data
mov ds,ax                                            

;Mostrar mensaje para pedir un numero---------------------------------------------------------------------------------------------

lea dx,msj
mov ah,09h
int 21h

;Pedir numero y guardarlo en el registro bl---------------------------------------------------------------------------------------

mov ah,01h
int 21h
sub al,30h
mov bl,al

;Sentencia if de comparacion------------------------------------------------------------------------------------------------------

cmp bl,5h 
jb LabelTrue
jae LabelFalse

;Cuando es verdad-----------------------------------------------------------------------------------------------------------------
LabelTrue:           

    ;Imprime mensaje      
    lea dx,msj2
    mov ah,09h
    int 21h    
       
    jmp LabelFin
    
;Cuando no es verdad--------------------------------------------------------------------------------------------------------------
LabelFalse:
    ;Imprime mensaje
    lea dx,msj3 
    mov ah,09h
    int 21h   
    
LabelFin:
end