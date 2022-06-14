;Realizar un programa que por medio de un ciclo solicite 5 numeros y determine cual es par o impar
;al final debe dar la cantidad de pares e impares

.model small
.stack
.data      
    
    n db 0ah,0dh, "Numero: $"
    Par db 0ah,0dh,"Pares: $"
    Impar db 0ah,0dh, "Impares: $" 
    num db ? 
    i db ?
    j db ?
    incremento db ?
    
.code
mov ax, @data
mov ds, ax

LabelInicio:
    cmp incremento,5
    je LabelExit
    
    lea dx, n    
    mov ah, 09h       
    int 21h
    
    mov ah, 01h  
    int 21h
    sub al,30h
    mov bl,al
    mov ax,bx 
    
    mov bl,2 
    div bl
    mov cl,ah
    
    cmp cl,0h
    jz LabelPar
    jmp LabelImpar
    
    LabelPar:
    add j,1
    jmp LabelExitCont
    
    LabelImpar:
    add i,1
    jmp LabelExitCont
    
    LabelExitCont: 
    add incremento,1
    jmp LabelInicio
  
LabelExit:
    lea dx, Par    
    mov ah, 09h       
    int 21h 
    
    mov bl,j
    mov ah,02h
    add bl,30h
    mov dl,bl
    int 21h 
    
    lea dx, Impar    
    mov ah, 09h       
    int 21h 
    
    mov bh,i
    mov ah,02h
    add bh,30h
    mov dl,bh
    int 21h
    
.exit
end 