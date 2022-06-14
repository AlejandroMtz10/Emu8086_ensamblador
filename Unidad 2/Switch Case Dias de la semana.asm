.model small
.stack
.data

 msj db 0ah,0dh, "Ingresa un numero: $"
 msj1 db 0ah,0dh, "Domingo$"
 msj2 db 0ah,0dh, "Lunes$"
 msj3 db 0ah,0dh, "Martes$"
 msj4 db 0ah,0dh, "Miercoles$"
 msj5 db 0ah,0dh, "Jueves$"
 msj6 db 0ah,0dh, "Viernes$"
 msj7 db 0ah,0dh, "Sabado$" 
 msj8 db 0ah,0dh, "Dia no valido$"
 
 dia db ?
 
.code
.startup     

mov ax,@data
mov ds,ax      

;Mostrar mensaje para pedir un numero---------------------------------------------------------------------------------------------

lea dx,msj
mov ah,09h
int 21h

;Pedir numero y guardarlo en la variable dia---------------------------------------------------------------------------------------

mov ah,01h
int 21h
sub al,30h
mov dia,al

;Etiquetas de los dias-------------------------------------------------------------------------------------------------------------

cmp dia,1
je Label1

cmp dia,2
je Label2

cmp dia,3
je Label3 

cmp dia,4
je Label4

cmp dia,5
je Label5

cmp dia,6
je Label6

cmp dia,7
je Label7

jmp LabelDefault

;Funciones etiquetas---------------------------------------------------------------------------------------------------------------

Label1:
lea dx,msj1
mov ah,09h
int 21h
jmp LabelEnd
            
            
Label2:
lea dx,msj2
mov ah,09h
int 21h
jmp LabelEnd

Label3:
lea dx,msj3
mov ah,09h
int 21h
jmp LabelEnd

Label4:
lea dx,msj4
mov ah,09h
int 21h
jmp LabelEnd

Label5:
lea dx,msj5
mov ah,09h
int 21h
jmp LabelEnd
   
Label6:
lea dx,msj6
mov ah,09h
int 21h
jmp LabelEnd

Label7:
lea dx,msj7
mov ah,09h
int 21h
jmp LabelEnd


LabelDefault:
lea dx,msj8
mov ah,09h
int 21h
jmp LabelEnd

LabelEnd:
.exit  
end

