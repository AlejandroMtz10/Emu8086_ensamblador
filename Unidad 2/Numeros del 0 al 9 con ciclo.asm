;Imprimir numeros del 0 al 9
.model small
.stack
.data  

   Msj db 0ah,0dh, "Numeros del 0 al 9$" 
   n db 0ah,0dh, "Numero: $"

.code
mov ax, @data
mov ds, ax      
 
lea dx, Msj   
mov ah, 09h       
int 21h 
           
mov bl,0h  
       
LabelCiclo:
cmp bx,9h
ja LabelExit  
     
   
    lea dx, n    
    mov ah, 09h       
    int 21h          
             
    mov ah,02h
    add bl,30h  
    mov dl,bl
    int 21h  
    sub bl,30h
    
add bl,1h 
    
mov ax,bx
aam
mov bx,ax   


jmp LabelCiclo

LabelExit:
.exit
end