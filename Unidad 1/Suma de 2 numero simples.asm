.model small
.stack
.data

    pedir1  db 0ah, 0dh, "Dame el primer numero $"
    pedir2  db 0ah, 0dh, "Dame el segundo numero $"
    resultado  db 0ah, 0dh, "El resultado es $"
    
.code
mov ax, @data
mov ds, ax

lea dx, pedir1    ;lea carga la direccion de memoria
mov ah, 09h       ;Mostrar a pantalla la cadena de caracteres
int 21h
     
mov ah, 01h  ;Entrada de caracter
int 21h
sub al,30h  ;resto  30h para obtener el valor decimal
mov bl, al  ;Guardado de datos de al a bl
            
           ;pedir segundo numero
            
lea dx, pedir2
mov ah, 09h
int 21h
              
              ;leer segundo numero
              
mov ah, 01h  
int 21h
sub al,30h 

;Realizar la suma    dato1 esta en bl y el dato2 esta en al
 add bl,al
 
 ;mostrar string del resultado
  lea dx,resultado
  mov ah,09h
  int 21h
  
;mostrar
mov ah,02h ;funcion 2
add bl,30h  ;sumo 30 para teber el codigo ascii del valor numerico
mov dl,bl   ;pongo el resultado en el dl para realizar la funcion 2 y mostrar a pantalla
int 21h

end