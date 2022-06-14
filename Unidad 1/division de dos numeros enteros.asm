.model small
.stack
.data

    mensaje1 db 0ah,0dh, "Primer numero: $"
    mensaje2 db 0ah,0dh, "Segundo numero: $"                                                                          
    Resultado db 0ah,0dh, "El resultado es: $" 
    
    
.code
.startup

mov ax,@data
mov ds,ax

;Mostrar el mensaje1

lea dx,mensaje1
mov ah,09h
int 21h

;Ingresar primer numero
mov ah,01h
int 21h
sub al,30h
mov bl,al

;Mostrar el segundo mensaje

lea dx,mensaje2
mov ah,09h
int 21h

;Ingresar segundo numero

mov ah,01h
int 21h
sub al,30h   
mov cl,al

;Division
mov ax,bx
mov bx,cx
idiv bx
add ax,3030h

;Mostrar resultado mensaje
lea dx,Resultado
mov ah,09h
int 21h

;Mostrar resultado
mov ah,02h
mov dl,al
int 21h

end


