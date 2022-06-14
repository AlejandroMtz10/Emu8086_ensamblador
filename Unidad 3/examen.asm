imprime Macro msg
    mov ah, 09h
    mov dx, offset msg
    int 21h
ENDM       

mensajeGuardarDato Macro mensaje
    mov dx,offset mensaje
    mov ah,09h
    int 21h     
    
    mov ah, 01h
    int 21h
    sub al,30h
    mov bh, al
    
ENDM 

.model small
.stack
.data
     
     salir db 13,10,"[0] Salir$"
    hotDog db 13,10, "[1] Hot Dog precio 2$"
    hamburguesa db 13,10, "[2] Hamburguesa precio 3$"
    refresco db 13,10, "[3] Refresco precio 1$"  
    orden db 13,10,"Que desea ordenar? $"  
    cant db 13,10,"Cuantos desea? $"  
    total db 13,10,"Total: $"
    
.Code

mov ax,@Data
mov ds,ax       

 inicio:

imprime salir
imprime hotDog
imprime hamburguesa
imprime refresco
                
mensajeGuardarDato orden

cmp bh,0
je Lexit
                
cmp bh,1
je LHotdog

cmp bh,2
je LHamburguesa

cmp bh,3
je LRefresco


LHotdog:  
mensajeGuardarDato cant
call hotdogs  

    imprime total
    mov ah,02h
    add bh,30h
    mov dl,bh
    int 21h
    jmp inicio
LHamburguesa:
mensajeGuardarDato cant
call hamburguesas  

    imprime total
    mov ah,02h
    add bh,30h
    mov dl,bh
    int 21h
    jmp inicio
     
     
LRefresco:

mensajeGuardarDato cant
call refrescos  

    imprime total
    mov ah,02h
    add bh,30h
    mov dl,bh
    int 21h
    jmp inicio


hotdogs PROC near
    mov al,2h
    mul bx
    mov bx,ax
    RET
ENDP       

hamburguesas PROC near
    mov al,3h
    mul bx
    mov bx,ax
    RET
ENDP   

refrescos PROC near
    mov al,1h
    mul bx
    mov bx,ax
    RET
ENDP 

Lexit:
.exit
end