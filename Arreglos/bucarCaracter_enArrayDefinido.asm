;Programa que tiene arreglo definido
;{0,1,2,...,9,+,-,/,*}
;dado un caracter de entrada dira si el caracter se encuentra en el arreglo

.model small
.stack
.data
    
    array db '1', '2', '3', '4','5','6','7'.'8','9','0','+','-','/','*'      
    msj db 0ah,0dh, " Ingresa un caracter de 0 a 9 o un signo aritmetico: $"
    c db 01h 
    
    existe db 0ah,0dh, "Si existe.$"
    noExiste db 0ah,0dh, "No existe.$"

.code          

main proc
    
    ;cargo el data en segmento de datos
    mov ax, @data
    mov ds, ax
    
    mov ah,09h
    mov dx,offset msj  ;imprime mensaje
    int 21h 
    
    mov ah,01h
    int 21h
    mov cl,al 
    
    ;posiciona el apuntador si en la primera posicion del arreglo
    lea si, array   
    
    ciclo:
    cmp c, 14h
    je noExisteCaracter
    
    mov dl, [si]    
    
    cmp dl,cl
    je existeCaracter
    
    add c, 01h
       
    inc si    
    
    jmp ciclo
    
existeCaracter:
     
         
    mov ah,09h
    mov dx,offset existe  ;imprime mensaje
    int 21h  
    jmp salir    
    
noExisteCaracter:

    mov ah,09h
    mov dx,offset noExiste  ;imprime mensaje
    int 21h     
    jmp salir
     
salir:
.exit
end