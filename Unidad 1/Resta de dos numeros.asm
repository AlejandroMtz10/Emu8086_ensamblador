.model samll
.stack
.data

  mensaje1 db 0ah,0dh, "Numero de dos digitos para restar: $"
  resultado db 0ah,0dh, "Resultado: $"
  
  ;Variables 
  M db ?
  N db ?
  
.code
.startup                                     
          
;Mostrar texto          
mov ax,@data
mov ds,ax
lea dx,mensaje1
mov ah,09h
int 21h             

;Pedir primer numero
mov ah,01h
int 21h
sub al,30h
mov M,al
;Pedir primer numero parte 2
mov ah,01h
int 21h   
sub al,30h   
mov ah,M
aad
mov M,al
                  
;Mostrar texto segundo numero
lea dx,mensaje1
mov ah,09h
int 21h             

;Pedir primer numero
mov ah,01h
int 21h
sub al,30h
mov N,al
;Pedir primer numero parte 2
mov ah,01h
int 21h   
sub al,30h   
mov ah,N
aad
mov N,al

;Resultado
lea dx,Resultado
mov ah,09h
int 21h   

mov al,M
sub al,N

aam  ;Convierte lo del "al" en binario

add ax,3030h ;suma 30 a "ah" y "al"
mov bx,ax

mov ah,02h
mov dl,bh
int 21h

mov dl,bl
int 21h

end


