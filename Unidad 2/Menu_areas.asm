;Menu
; 1 Area triangulo
; 2 Area rectangulo
; 3 Salir

.model small
.stack
.data

    Triangulo db 0ah,0dh, "[1] Area de un triangulo.$"
    Rectangulo db 0ah,0dh, "[2] Area de un rectangulo.$"
    salir db 0ah,0dh, "[3] Salir.$"
    Default db 0ah,0dh,"Opcion no valida.$"
    sali db 0ah,0dh,"[2] Salir.$"
    Conti db 0ah,0dh,"[1] Continuar.$"
    opt2 db 0ah,0dh,"Desea salir o continuar: $"
    Cerrando db 0ah,0dh,"Cerrando el programa.$"
    opcion db 0ah,0dh, "Seleccione una opcion: $"   
    op db ?  
    
    base db 0ah,0dh, "Base: $"
    altura db 0ah,0dh, "Altura: $" 
    Ancho db 0ah,0dh, "Ancho: $"
    Largo db 0ah,0dh, "Largo: $"
    
    area db 0ah,0dh,"Area: $"
    
.code
mov ax, @data
mov ds, ax

;Menu------------------------------------------------------------------------------------------------------------------
    LabelMenu:
    ;Mostrar opciones
    lea dx, Triangulo
    mov ah, 09h       
    int 21h

    lea dx, Rectangulo
    mov ah, 09h       
    int 21h 
    
    lea dx, salir
    mov ah, 09h       
    int 21h 
        
    ;Escoger opcion
    lea dx, opcion    
    mov ah, 09h       
    int 21h
         
    mov ah, 01h  
    int 21h
    sub al,30h
    mov op, al
    
    cmp op,1h
    je LabelTriangulo
    
    cmp op,2h
    je LabelRectangulo
    
    cmp op,3h
    je LabelEnd
    
    jmp LabelDefault
    
;Triangulo

LabelTriangulo:
    lea dx, Base
    mov ah, 09h       
    int 21h
                   
    mov ah, 01h  
    int 21h
    sub al,30h
    mov bh, al               
    
    lea dx, Altura
    mov ah, 09h       
    int 21h

    mov ah, 01h  
    int 21h
    sub al,30h
    
    mul bh
    mov cl,2h
    div cl 
    
    mov bx,ax
    
    ;imprimir resultado
    lea dx,area
    mov ah,09h
    int 21h 
    
    mov ah,02h
    add bl,30h
    mov dx,bx
    int 21h
    
    jmp LabelContinuar
    
LabelRectangulo:
    lea dx, Largo
    mov ah, 09h       
    int 21h
                   
    mov ah, 01h  
    int 21h
    sub al,30h
    mov bh, al               
    
    lea dx, Ancho
    mov ah, 09h       
    int 21h

    mov ah, 01h  
    int 21h
    sub al,30h
    
    mul bh
    aam 
    mov bx,ax
    
    ;imprimir resultado
    lea dx,area
    mov ah,09h
    int 21h 
    
    mov ah,02h
    add bh,30h
    mov dl,bh
    int 21h     
    
    mov ah,02h
    add bl,30h
    mov dl,bl
    int 21h
    
    jmp LabelContinuar
    
LabelDefault:
    
    lea dx, Default   
    mov ah, 09h       
    int 21h
    
    jmp LabelMenu    
    
LabelContinuar:
        
    lea dx, Conti    
    mov ah, 09h       
    int 21h
    
    lea dx, Sali    
    mov ah, 09h       
    int 21h
    
    lea dx, opt2    
    mov ah, 09h       
    int 21h
    
    mov ah, 01h  
    int 21h
    sub al,30h
    mov cl, al            
    
        ;Continua en el menu
        cmp cl,1
        je LabelMenu
        ;Sale del programa
        cmp cl,2
        je LabelEnd
    
    LabelEnd:
    lea dx, Cerrando   
    mov ah, 09h       
    int 21h
    .exit
    end    