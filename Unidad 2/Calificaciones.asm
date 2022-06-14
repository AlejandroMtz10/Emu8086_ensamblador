;Realizar un programa que mediante un ciclo pida 3 calificaciones y obtenga el promedio,
;si el promedio es mayor o igual a 9 es excelente
;si el promedio es mayor a 6 es suficiente y
;si es menor es insuficiente

.model small
.stack
.data      
    
    Calif db 0ah,0dh, "Calificacion: $"
    Prome db 0ah,0dh, "Promedio: $"
    Excelente db 0ah,0dh, "Excelente.$"
    Suficiente db 0ah,0dh, "Suficiente.$"
    Deficiente db 0ah,0dh, "Deficiente.$"
    
    c1 db ?
    c2 db ?
    c3 db ?
    incremento db ?
    
.code
mov ax, @data
mov ds, ax      

mov incremento,1

LabelInicio:
cmp incremento,3
ja LabelOperaciones
              
;Mostrar mensaje para pedir las calificaciones             
lea dx, Calif    
mov ah, 09h       
int 21h

;Guardar calificaciones
mov ah, 01h  
int 21h
sub al,30h

cmp incremento,1
je LabelCal1

cmp incremento,2
je LabelCal2   

cmp incremento,3
je LabelCal3

LabelCal1:
mov c1,al
jmp LabelCont

LabelCal2:
mov c2,al
jmp LabelCont

LabelCal3:
mov c3,al 
jmp LabelCont

LabelCont:
add incremento,1
jmp LabelInicio

LabelOperaciones:

mov bl,c1

add bl,c2
add bl,c3

mov ax,bx
mov cl,3
div cl

aam

mov bx,ax

lea dx, Prome    
mov ah, 09h       
int 21h   
    
    mov ah,02h
    add bl,30h
    mov dl,bl
    int 21h    
    
sub bl,30h

cmp bl,9
jae LabelExcelente 
  

cmp bl,6
jae LabelSuficiente
jl LabelDeficiente

LabelExcelente:
lea dx, Excelente    
mov ah, 09h       
int 21h    
jmp LabelExit

LabelSuficiente:
lea dx, Suficiente    
mov ah, 09h       
int 21h 
jmp LabelExit

LabelDeficiente:
lea dx, Deficiente    
mov ah, 09h       
int 21h      
jmp LabelExit

LabelExit:
    
.exit
end   