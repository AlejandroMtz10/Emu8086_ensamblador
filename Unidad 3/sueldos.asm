;Realizar un prigrama que por medio de macros solicite datos y por medio de procedimientos
;almacenados calcule horas normales, horas extras, pago tiempo normal, pago tiempo extra, sueldo neto
; horas normales = 8
mensajeGuardarDato Macro mensaje
    mov dx,offset mensaje
    mov ah,09h
    int 21h     
    
    mov ah, 01h
    int 21h
    sub al,30h
    mov bh, al
    
    mov ah, 01h
    int 21h
    sub al,30h
    mov bl, al
ENDM              

guardarN Macro
    mov ah, 01h
    int 21h
    sub al,30h
    mov bh, al   
ENDM

mostrarMensaje Macro msg
    mov dx,offset msg
    mov ah,09h
    int 21h
ENDM
         
mostrarMensajeDato Macro
    
    mov ah,02h
    add bl,30h
    mov dl,bl
    int 21h    
                 
ENDM

.Model Small
.Stack
.Data 

    ht db 0ah,0dh, "Horas trabajadas: $"
    hn db 0ah,0dh, "Horas normales: $"
    he db 0ah,0dh, "Horas extra: $"
    ptn db 0ah, 0dh, "Pago tiempo normal: $"
    pte db 0ah,0dh, "Pago tiempo extra: $"
    sn db 0ah,0dh, "Sueldo neto: 2 dolares por hora.$"
    se db 0ah,0dh, "Sueldo por hora extra: 4 dolares por hora.$"
    hrsDia db 0ah,0dh, "Despues de 8 horas se consideran extras.$"   
    continuar db 0ah,0dh, "[0] Salir        [1] Continuar$"
    ptn8 db 0ah, 0dh, "Pago tiempo normal: 16$"
    
    pago db 2      
    pagoExtra db 4    
    n db ?
                          
    close db 0ah,0dh,"Cerrando................................................$"                     
    cerrando db 0ah,0dh, ">> Cerrando el programa, hecho por Alejandro Martinez...$"                      
.Code

inicio:
 
 
mov ax,@Data
mov ds,ax     


mostrarMensaje hrsDia  

mostrarMensaje sn
mostrarMensaje se
 
mensajeGuardarDato ht  


call calcularHrs  
  
mostrarMensaje continuar
guardarN 

cmp bh,1
je inicio
  
cmp bh,0
je LExit   

calcularHrs PROC near
    cmp bl,8
    jbe labelHrsNormales  
    ja labelHrsExtra
    
    cmp bh,1
    jae labelHrsExtra
    
    labelHrsNormales: 
    cmp bh,1
    jae labelHrsExtra 
    
    mostrarMensaje hn
    mostrarMensajeDato   
    
    mov al,bl
    sub al,30h
    
    mul pago
    aam
    mov cx,ax
    
    mostrarMensaje ptn
    mov bl,ch
    mostrarMensajeDato
    mov bl,cl
    mostrarMensajeDato
    
    jmp return
    
    labelHrsExtra:
    sub bx,8
    mov ax,bx
    aas
    mov bh,al
    mov bl,8h     
    
    mostrarMensaje hn
    mostrarMensajeDato
    
    mostrarMensaje he
    mov n,bh
    mov bl,bh
    mostrarMensajeDato   
    
    call calcularPagoHrsExtra
    
    jmp return
    
    return:
    RET
ENDP   
       
calcularPagoHrsExtra PROC near
     mostrarMensaje ptn8
     
     mov al,n
     mul pagoExtra
     aam
     mov cx,ax
     
    mostrarMensaje pte
    mov bl,ch
    mostrarMensajeDato
    mov bl,cl
    mostrarMensajeDato 
    
    RET 
ENDP   

LExit:  
mostrarMensaje close
mostrarMensaje cerrando
.exit
end
          