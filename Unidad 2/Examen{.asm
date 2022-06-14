.model small
.stack
.data  

 msj db 0ah,0dh, "Ingresa un numero decimal: $"
 msj2 db 0ah,0dh,"Numero menor a 5. $"         
 msj3 db 0ah,0dh, "Numero mayor a 5.$"  

.code
mov ax, @data
mov ds, ax   


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
jb LabelMenor
jae LabelMayor

;Cuando es verdad-----------------------------------------------------------------------------------------------------------------
LabelMenor:           

    ;Imprime mensaje      
    lea dx,msj2
    mov ah,09h
    int 21h 
    
    mov al,bl
    
    mul bl
    
    aam
    
    mov bx,ax
    
    mov ah,02h
    add bh,30h  
    mov dl,bh
    int 21h 
    
    mov ah,02h
    add bl,30h  
    mov dl,bl
    int 21h
       
    jmp LabelFin
    
;Cuando no es verdad--------------------------------------------------------------------------------------------------------------
LabelMayor:
    ;Imprime mensaje
    lea dx,msj3 
    mov ah,09h
    int 21h 
     
    jmp LabelFin
    
LabelFin: 
.exit
end