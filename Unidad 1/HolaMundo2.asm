.model small
.stack
.data
    mensaje db 0ah, 0dh,'Hola mundo $'
    bye db 0ah, 0dh "Adios!!!!! $"

.code
mov ax,@data
mov ds, ax

lea dx, mensaje  ;carga direccion
mov ah, 09h
int 21h