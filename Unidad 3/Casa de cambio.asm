;Realizar un programa que por medio de una macro solicite los datos y por medio de procedimientos realizar la conversion

mostrarMensaje Macro msg
    mov dx,offset msg
    mov ah,09h
    int 21h
ENDM

.Model Small
.Stack
.Data
    Msg0 db 0ah,0dh, "[0] Salir.$"
    Msg1 db 0ah,0dh,"Casa de cambio unos...$"          
    Msg2 db 0ah,0dh,"[1] Pesos a Dolares.$"
    Msg3 db 0ah,0dh, "[2] Pesos a Yen.$"
    Msg4 db 0ah,0dh, "[3] Pesos a Euro.$"
    Msg5 db 0ah,0dh, "Seleccione una opcion: $"       
    
    ValorD db 0ah,0dh, "El dolar vale 4 pesos.$"
    ValorY db 0ah,0dh, "El yen vale 3 pesos.$"
    ValorE db 0ah,0dh, "El Euro vale 5 pesos.$"
    
    PedirDolares db 0ah,0dh, "Ingrese la cantidad de pesos a convertir a dolares: $"     
    PedirYenes db 0ah,0dh, "Ingrese la cantidad de pesos a convertir a Yenes: $"
    PedirEuros db 0ah,0dh, "Ingrese la cantidad de pesos a convertir a Euros: $"
    resultado db 0ah,0dh, "cambio: $"   
    
.Code
inicio:
 
 
mov ax,@Data
mov ds,ax
 
LInicio:  

mostrarMensaje Msg1 
mostrarMensaje Msg0
mostrarMensaje Msg2
mostrarMensaje Msg3
mostrarMensaje Msg4
mostrarMensaje Msg5

mov ah,01h
int 21h
sub al,30h
mov bh,al 

cmp bh,0
je LExit

cmp bh,1
je conversionDolares

cmp bh,2
je conversionYen

cmp bh,3
je conversionEuro

;Default
jmp LInicio  

conversionDolares:     

mostrarMensaje ValorD
mostrarMensaje PedirDolares 
 
;Guardar cantidad de pesos
    mov ah, 01h
    int 21h
    sub al,30h
    mov bh, al 
    
    mov ah, 01h
    int 21h
    sub al,30h
    mov bl, al

call conversionDolar    

conversionYen:

mostrarMensaje ValorY
mostrarMensaje PedirYenes
 
;Guardar cantidad de pesos
    mov ah, 01h
    int 21h
    sub al,30h
    mov bh, al 
    
    mov ah, 01h
    int 21h
    sub al,30h
    mov bl, al

    call conversionYens    

conversionEuro:     
  
mostrarMensaje ValorE
mostrarMensaje PedirEuros
 
;Guardar cantidad de pesos
    mov ah, 01h
    int 21h
    sub al,30h
    mov bh, al 
    
    mov ah, 01h
    int 21h
    sub al,30h
    mov bl, al

    call conversionEuros 
    
conversionDolar Proc near
    mov ax,bx   
    mov cl,4h
    div cl  
    aam
    mov bx,ax  
      
    lea dx,resultado
    mov ah,09h
    int 21h 
    
      
    cmp bx,11
    ja Lmayor
    jbe Lmenor
    
    Lmenor:
    mov ah,02h
    add bl,30h  
    mov dl,bl
    int 21h     
    Jmp LInicio
    
    Lmayor:  
    mov ah,02h
    add bl,30h  
    sub bl,01h
    mov dl,bl
    int 21h     
    Jmp LInicio
    
ENDP  

conversionYens Proc near
    mov ax,bx
    mov cl,3h
    div cl
    aam 
    mov bx,ax     
     
    lea dx,resultado
    mov ah,09h
    int 21h 
    
    cmp bx,9h
    ja Lmayor1
    jbe Lmenor1
    
    Lmenor1:
    mov ah,02h
    add bl,30h  
    mov dl,bl
    int 21h     
    Jmp LInicio
    
    Lmayor1:  
    mov ah,02h
    add bl,30h  
    sub bl,02h
    mov dl,bl
    int 21h     
    Jmp LInicio
ENDP   

conversionEuros Proc near
    mov ax,bx
    mov cl,5
    div cl    
    aam
    mov bx,ax  
      
    lea dx,resultado
    mov ah,09h
    int 21h 
    
    cmp bx,9h
    ja Lmayor2
    jb Lmenor2
    
    Lmenor2:
    mov ah,02h
    add bl,30h  
    mov dl,bl
    int 21h     
    Jmp LInicio
    
    Lmayor2:  
    mov ah,02h
    add bl,30h  
    add bl,01h
    mov dl,bl
    int 21h       
    Jmp LInicio 
   
ENDP

LExit:
.exit
end