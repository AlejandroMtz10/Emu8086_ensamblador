.model small

stack segment STACK para 'stack'
    db 64h dup (00h)
stack ends

data segment
    mensaje db 10,13, "Ejemplo de pila >> $"
data ends

code segment
     assume cs:code, ds:data, ss:stack

start:
mov ax,data
mov ds,ax

lea dx, mensaje
mov ah,9
int 21h


;Pila LIFO ingresar HOLA al reves para imprimirla al derecho

mov ax,0e41h    ;A
mov bx,0e4ch    ;L
mov cx,0e4fh    ;O
mov dx,0e48h    ;H

push ax
push bx
push cx
push dx

mov bx,0071h
pop ax
int 10h
pop ax
int 10h
pop ax
int 10h
pop ax
int 10h 

end
end start