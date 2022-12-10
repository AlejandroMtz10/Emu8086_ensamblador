.model small
.stack
.data      
    
    Factorial db 0ah,0dh, "Numero para calcular el factorial: $"
    Res db 0ah,0dh,"Resultado: $" 
    i db ?  
    j db ?
    
.code
mov ax, @data
mov ds, ax

    lea dx, Factorial
    mov ah, 09h       
    int 21h 
    
    mov ah, 01h  
    int 21h
    sub al,30h
    mov i, al

mov cl,i 
mov j,0
        
cmp cl,0
je Label0        
cmp cl,1
je Label1

LabelBegin: 

add j,1
cmp j,cl
je LabelFinFor

LabelTrue:
  
mul j
mov bx,ax 
 

jmp LabelBegin

    LabelFinFor:
              
    mov ax,bx
    aam
    mov bx,ax
    mov al,bh
    aam
    mov bh,al
    mov ch,ah  
    jmp LabelRes:
    
Label0:
mov ch,0
mov bl,1
jmp LabelRes

Label1: 
mov ch,0
mov bl,1
jmp LabelRes


    LabelRes:   
    lea dx, Res   
    mov ah, 09h       
    int 21h      
  
    mov ah,02h
    add ch,30h  
    mov dl,ch
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