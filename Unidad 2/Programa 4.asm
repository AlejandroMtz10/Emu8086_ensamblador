;Las dos primeras horas a $5.00
;Las siguientes tres $4.00
;Las 5 siguientes a $3.00
;Despues de diez horas el costo por cada una es de dos pesos

.model small
.stack
.data

    msj db 0ah,0dh, "Tiempo de estancia en horas: $"
    hr1 db 0ah,0dh, "Una hora por 5.00$"
    hr2 db 0ah,0dh, "Una hora por 5.00 total 10.00$"
    hr3 db 0ah,0dh, "Una hora por 4.00 total 12.00$"
    hr4 db 0ah,0dh, "Una hora por 4.00 total 16.00$"
    hr5 db 0ah,0dh, "Una hora por 4.00 total 20.00$"
    hr6 db 0ah,0dh, "Una hora por 3.00 total 18.00$"
    hr7 db 0ah,0dh, "Una hora por 3.00 total 21.00$"
    hr8 db 0ah,0dh, "Una hora por 3.00 total 24.00$"
    hr9 db 0ah,0dh, "Una hora por 3.00 total 27.00$"
    hr10 db 0ah,0dh, "Una hora por 3.00 total 30.00$"
    
    msj1 db 0ah,0dh,"Cada hora por 2.00 para mas de 10 horas$"
                                                                   
    n db ?                                                               
                                                                   
.code
.startup     

mov ax,@data
mov ds,ax      

;Mostrar mensaje para pedir un numero de horas---------------------------------------------------------------------------------------------

lea dx,msj
mov ah,09h
int 21h

;Pedir numero de horas--------------------------------------------------------------------------------------------------

mov ah,01h
int 21h
sub al,30h
mov bh,al
                                           

int 21h
sub al,30h
mov bl,al

;switch------------------------------------------------------------------

cmp bx,01h
je LabelH1 

cmp bx,02h
je LabelH2

cmp bx,03h
je LabelH3

cmp bx,04h
je LabelH4

cmp bx,05h
je LabelH5

cmp bx,06h
je LabelH6

cmp bx,07h
je LabelH7

cmp bx,08h
je LabelH8

cmp bx,09h
je LabelH9
   
cmp bh,1
je LabelH10

jmp LabelDefault
                                  
LabelH1:

    lea dx,hr1
    mov ah,09h
    int 21h
    jmp LabelEnd

LabelH2:

    lea dx,hr2
    mov ah,09h
    int 21h
    jmp LabelEnd

LabelH3:

    lea dx,hr3
    mov ah,09h
    int 21h
    jmp LabelEnd
    
LabelH4:

    lea dx,hr4
    mov ah,09h
    int 21h
    jmp LabelEnd
    
LabelH5:

    lea dx,hr5
    mov ah,09h
    int 21h
    jmp LabelEnd

LabelH6:

    lea dx,hr6
    mov ah,09h
    int 21h
    jmp LabelEnd
    
LabelH7:

    lea dx,hr7
    mov ah,09h
    int 21h
    jmp LabelEnd
        
LabelH8:

    lea dx,hr8
    mov ah,09h
    int 21h
    jmp LabelEnd
    
LabelH9:

    lea dx,hr9
    mov ah,09h
    int 21h
    jmp LabelEnd 
          
 LabelH10:
    
    cmp bl,0
    ;Entra aqui si no es 10
    ja LabelDefault
    
    lea dx,hr10
    mov ah,09h
    int 21h
    jmp LabelEnd     

LabelDefault:     
    
    ;Para mayor a 10
    lea dx,msj1
    mov ah,09h
    int 21h
    jmp LabelEnd       
 
  

LabelEnd:
.exit
end