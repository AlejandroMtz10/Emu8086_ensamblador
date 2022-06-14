.model small
.stack
.data      

    Res db 0ah,0dh,"Resultado: $"
    i db ?  
    
.code
mov ax, @data
mov ds, ax

mov i,1
      
LabelBegin: 
cmp i,5
JA LabelFinFor

LabelTrue: 

add bl,i 
add i,1 

jmp LabelBegin

    LabelFinFor:
     
    mov al,bl
    aam
    mov bx,ax
     
    lea dx, Res   
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