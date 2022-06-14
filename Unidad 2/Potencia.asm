;Realizar un programa por medio de un ciclo dado un numero y un numero de potencia calcule la pontencia de ese numero

.model small
.stack
.data      
    
    numero db 0ah,0dh, "Numero: $"
    potencia db 0ah,0dh, "Potencia: $"
    res db 0ah, 0dh, "Resultado: $"
     
    i db ? ;variable para guardar el numero
    j db ? ;variable para guardar la potencia
    incremento db ?
    
.code
mov ax, @data
mov ds, ax
              
;Mostrar mensaje para pedir el numero              
lea dx, numero    
mov ah, 09h       
int 21h

;Guardar el numero
mov ah, 01h  
int 21h
sub al,30h
mov i,al

;Mostrar mensaje para pedir el numero de la potencia              
lea dx, potencia    
mov ah, 09h       
int 21h

;Guardar el numero de la potencia
mov ah, 01h  
int 21h
sub al,30h
mov j,al

mov incremento,1
mov cl,j    
mov al,incremento

LabelInicio:
cmp incremento,cl
ja LabelExit  
mul i
add incremento,1   
jmp LabelInicio

LabelExit: 

mov bx,ax      
aam
mov bx,ax

;Mostrar mensaje para dar el resultado              
lea dx, res    
mov ah, 09h       
int 21h

    mov ah,02h 
    add bh,30h
    mov dl,bh
    int 21h   
    
    mov ah,02h
    add bl,30h
    mov dl,bl
    int 21h                
    
.exit
end


