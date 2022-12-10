;Programa para la suma de dos numeros

.model small
.stack
.data

     ms1 db 0ah,0dh, "Dame numeros a sumar (2 digitos) $"
     respuesta db 0ah,0dh, "El resultado es: $"
.code
.startup
mov ax,@data
mov ds,ax

lea dx,ms1      ;muestra cadena
mov ah,09h
int 21h
 
 xor cx,cx
 xor bx,bx
 
;Primer digito del primer numero

mov ah,01h  ;lee caracter 1 del numero 1
int 21h
sub al,30h    ;obtenemos el valor numerico del valor ascii
mov bl,al     ;guardar

;Segundo digito del segundo numero
mov ah,01h
int 21h
sub al,30h
mov cl,al
         
         ;Segundo numero
           
lea dx,ms1
mov ah,09h
int 21h  

mov ah,01h ;Leer primer caracter segundo numero
int 21h
sub al,30h
add bl,al  ;sumamos a las decenas y guardamos

mov ah,01h  ;Leer segundo caracter de segundo numero
int 21h
sub al,30h
add cl,al ;sumamos unidades     

mov ax,cx   ;se pasa el resultado de la suma de las unidades
aaa    ;conviere a bcd
mov cx,ax

add bl,ch       ;sumamos el acarreo

;trabajar con las decenas de la misma forma
mov ax,bx
aaa
mov bx,ax

;mostrar a pantalla

lea dx,respuesta
mov ah,09
int 21h 

mov dl,bh   ;mostrar centenas
add dl,30h  ;agrego 30h para mostrar el caracter
mov ah,02h   ;funcion para mostrar el caracter

mov dl,bl   ;decenas
add dl,30h
int 21h

mov dl,cl   ;unidades
add dl,30h
int 21h

    .exit
    end     