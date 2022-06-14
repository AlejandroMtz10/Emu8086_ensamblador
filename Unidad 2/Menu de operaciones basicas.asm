
    .model small
    .stack
    .data
        suma db 0ah,0dh,"[1] Suma.$"
        rest db 0ah,0dh,"[2] Resta.$"
        divi db 0ah,0dh,"[3] Division.$"
        mult db 0ah,0dh,"[4] Multiplicacion.$"
        opcion  db 0ah, 0dh, "Escoge una opcion $"    
        n1 db 0ah,0dh,"1. Numero: $"
        n2 db 0ah,0dh,"2. Numero: $"    
        num1 db 0ah,0dh,"Dividendo: $"
        num2 db 0ah,0dh,"Divisor: $"
        resultado  db 0ah, 0dh, "Resultado: $" 
        Default db 0ah,0dh,"Opcion no valida.$"
        salir db 0ah,0dh,"[2] Salir.$"
        Conti db 0ah,0dh,"[1] Continuar.$"
        opt2 db 0ah,0dh,"Desea salir o continuar: $" 
        Cerrando db 0ah,0dh,"Cerrando el programa.$"
        
        op db ?
        
    .code
    mov ax, @data
    mov ds, ax
    ;Menu------------------------------------------------------------------------------------------------------------------
    LabelMenu:
    ;Mostrar opciones
    lea dx, suma    
    mov ah, 09h       
    int 21h
    
    lea dx, rest    
    mov ah, 09h       
    int 21h
    
    lea dx, divi    
    mov ah, 09h       
    int 21h 
    
    lea dx, mult    
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
    je LabelSuma
    
    cmp op,2h
    je LabelResta
    
    cmp op,3h
    je LabelDivision
    
    cmp op,4h
    je LabelMultiplicacion
    
    jmp LabelDefault
    
    LabelSuma:
    ;Primer numero
    lea dx, n1    
    mov ah, 09h       
    int 21h
    
    mov ah, 01h
    int 21h
    sub al,30h
    mov bl, al     
    
    ;Segundo numero
    lea dx, n2    
    mov ah, 09h       
    int 21h
    
    mov ah, 01h
    int 21h
    sub al,30h
    
    add al,bl
    mov bl,al
    ;imprimir resultado
    lea dx,resultado
    mov ah,09h
    int 21h 
    
    mov ah,02h
    add bl,30h
    mov dl,bl
    int 21h
    
    jmp LabelTerminar
        
    LabelResta:
    
    ;Primer numero
    lea dx, n1    
    mov ah, 09h       
    int 21h
    
    mov ah, 01h
    int 21h
    sub al,30h
    mov bl, al     
    
    ;Segundo numero
    lea dx, n2    
    mov ah, 09h       
    int 21h
    
    mov ah, 01h
    int 21h
    sub al,30h
    
    sub bl,al
     
    
    ;imprimir resultado
    lea dx,resultado
    mov ah,09h
    int 21h 
    
    mov ah,02h
    add bl,30h
    mov dl,bl
    int 21h
    
    jmp LabelTerminar
    
    LabelDivision:
    
    ;Primer numero
    lea dx, num1    
    mov ah, 09h       
    int 21h
    
    mov ah, 01h
    int 21h
    sub al,30h
    mov bl, al     
    
    ;Segundo numero
    lea dx, num2    
    mov ah, 09h       
    int 21h
    
    mov ah, 01h
    int 21h
    sub al,30h
    mov cl,al
    
    mov ax,bx
    div cl 
    mov bx,ax
    
    ;imprimir resultado
    lea dx,resultado
    mov ah,09h
    int 21h 
    
    mov ah,02h
    add bl,30h
    mov dl,bl
    int 21h
    
    jmp LabelTerminar
    
    LabelMultiplicacion:
    
    ;Primer numero
    lea dx, n1    
    mov ah, 09h       
    int 21h
    
    mov ah, 01h
    int 21h
    sub al,30h
    mov bl, al     
    
    ;Segundo numero
    lea dx, n2    
    mov ah, 09h       
    int 21h
    
    mov ah, 01h
    int 21h
    sub al,30h
    
    mul bx
    mov bx,ax
    
    ;imprimir resultado
    lea dx,resultado
    mov ah,09h
    int 21h 
    
    mov ah,02h
    add bl,30h
    mov dl,bl
    int 21h
    
    jmp LabelTerminar
    
    LabelDefault:
    
    lea dx, Default   
    mov ah, 09h       
    int 21h
    
    jmp LabelMenu
    
    LabelTerminar:
    
    lea dx, Conti    
    mov ah, 09h       
    int 21h
    
    lea dx, Salir    
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
