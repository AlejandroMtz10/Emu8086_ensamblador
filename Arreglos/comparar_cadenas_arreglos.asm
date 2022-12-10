.model small
.stack 64
.data

    msj1 db 0ah,0dh,'Cadena 1: ', '$'
    msj2 db 0ah,0dh,'Cadena 2: ', '$'
    msj3 db 0ah,0dh,'Son iguales','$'
    msj4 db 0ah,0dh,'Son diferentes','$'
    vec db 50 dup(' '), '$';Array 1
    vec2 db 50 dup(' '),'$';Array 2
    
.code
inicio:

    mov ax,@data
    mov ds,ax
    mov ah,09
    mov dx,offset msj1 ;imprimir mensaje 1
    int 21h
    
    lea si,vec ;cargamos en el registro si el primer vector
    
pedir1:
    
    mov ah,01h    ;pedimos un caracter
    int 21h
    mov [si],al    ;se guarda en el registro indexado al vector
    inc si
    cmp al,0dh ;Se cicla hasta que se digite un Enter
    ja pedir1
    jb pedir1
    
    mov ax,@data
    mov ds,ax
    mov ah,09
    mov dx,offset msj2  ;imprime mensaje 2
    int 21h
    lea si,vec2 ;Se carga en SI el vector 2
                         
pedir2:  ;mismo procedimiento que en pedir1

    mov ah,01h
    int 21h
    mov [si],al
    inc si
    cmp al,0dh
    ja pedir2
    jb pedir2
    
    mov cx,50 ;Detenemos la cantidad de datos
    mov AX,DS  ;mueve el segmento datos a AX
    mov ES,AX ;Mueve los datos al segmento extra

compara:
    lea si,vec ;cargamos en SI la cadena que contiene el vector1
    lea di,vec2 ;cargamos en DI la cadena que contiene el vector2
    repe cmpsb ;compara las dos cadenas
    jne diferente ;Si no fueron iguales
    je iguales ;Si fueron iguales
    
iguales:
    mov ax,@data
    mov ds,ax
    mov ah,09
    mov dx,offset msj3
    int 21h
    mov ah,04ch
    int 21h
    
diferente:
    mov ax,@data
    mov ds,ax
    mov ah,09
    mov dx,offset msj4
    int 21h
    mov ah,04ch
    int 21h
                               
 end                        