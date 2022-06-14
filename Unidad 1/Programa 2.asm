;Programa que calcula la velocidad a la que debe de circular un coche para recorrer 2 metros en "X" tiempo.
;Solo funciona con un digito y numeros pares.                                                                                                                
                                                                                                                
.model small
.stack
.data

    ms1 db 0ah,0dh, "Tiempo: $"
    Velocidad db 0ah,0dh, "Velocidad: $"  
    Num db ?
.code
.startup

    mov ax,@data
    mov ds,ax

;Pedir tiempo-------------------------------------------------------------------------------------------------

;Mensaje------------------------------------------------------------------------------------------------------

lea dx,ms1
mov ah,09h
int 21h

;Ingresar numero----------------------------------------------------------------------------------------------

mov ah,01h
int 21h
sub al,30h
mov Num,al

;Division-----------------------------------------------------------------------------------------------
xor ax,ax
mov al,Num
mov bl,2
div bl
aad
add ax,3030h 
mov Num,al

;Imprimir resultado-------------------------------------------------------------------------------------------

    lea dx,Velocidad
    mov ah,09h
    int 21h
    
    mov ah,02h
    mov dl,Num
    int 21h
    
end
