;Programa para calcular el promedio de 3 calificaciones

.model small
.stack
.data

    Calf1 db 0ah,0dh, "Calificacion 1: $"
    Calf2 db 0ah,0dh, "Calificacion 2: $"
    Calf3 db 0ah,0dh, "Calificacion 3: $"
    N1 db ?
    N2 db ?
    N3 db ?
    N4 db ?
    N5 db ?
    N6 db ?  
    
.code
.startup

    mov ax,@data
    mov ds,ax
    
;Pedir primer calificacion---------------------------------------------------------------------------------------------------

;Mensaje---------------------------------------------------------------------------------------------------------------------

lea dx,Calf1
mov ah,09h
int 21h

;Capturar primer digito (decenas)--------------------------------------------------------------------------------------------

mov ah,01h
int 21h
sub al,30h
mov N1,al ;el digito es guardado en N1

;Capturar segundo digito (unidades)------------------------------------------------------------------------------------------

mov ah,01h
int 21h
sub al,30h
mov N2,al ;el digito es guardado en N2

;Pedir segunda calificacion-------------------------------------------------------------------------------------------------

;Mensaje---------------------------------------------------------------------------------------------------------------------

lea dx,Calf2
mov ah,09h
int 21h

;Capturar primer digito (decenas)-------------------------------------------------------------------------------------------

mov ah,01h
int 21h
sub al,30h
mov N3,al ;el digito se guarda en N3

;Capturar segundo digito (unidades)-----------------------------------------------------------------------------------------

mov ah,01h
int 21h
sub al,30h
mov N4,al ;el digito es guardado en N4                 

;Pedir tercera calificacion-------------------------------------------------------------------------------------------------

;Mensaje---------------------------------------------------------------------------------------------------------------------

lea dx,Calf3
mov ah,09h
int 21h

;Capturar primer digito (decenas)-------------------------------------------------------------------------------------------

mov ah,01h
int 21h
sub al,30h
mov N5,al ;el digito se guarda en N3

;Capturar segundo digito (unidades)-----------------------------------------------------------------------------------------

mov ah,01h
int 21h
sub al,30h
mov N6,al ;el digito es guardado en N4

;Sumas----------------------------------------------------------------------------------------------------------------------

;Suma de calificacion 1 mas calificacion 2




end    