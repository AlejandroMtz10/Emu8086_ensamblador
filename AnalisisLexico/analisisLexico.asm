.model small
.stack 64
.data

    msj1 db 0ah,0dh,'Analisis lexico. ', '$'
    msj2 db 0ah,0dh,'Expresion: ', '$'
    msj3 db 0ah,0dh,'Analisis lexico exitoso.','$'
    msj4 db 0ah,0dh,'Error lexico','$'
    array db 50 dup(' '), '$';Array para guardar los caracteres

.code
inicio:

    mov ax,@data
    mov ds,ax
    mov ah,09    
    
    mov dx,offset msj1 ;imprimir mensaje 1
    int 21h      
    
    mov dx,offset msj2 ;imprimir mensaje 2
    int 21h  
    
    lea si,array ;cargamos en el registro si el array          
    
pedir1:
    
    mov ah,01h    ;pedimos un caracter
    int 21h
    mov [si],al    ;se guarda en el registro indexado al vector
    inc si
    cmp al,0dh ;Se cicla hasta que se digite un Enter
    ja pedir1
    jb pedir1  
    
    ;posiciona el apuntador si en la primera posicion del arreglo
    lea si, array
    
comparar:

    ciclo:
    mov dl, [si]  
    cmp dl,0dh
    je expresionValida
      
    
    ;Verificar el caracter con 0  
    
    mov cl,'0'        
    cmp cl,dl      
    je valido      
    
    ;Verificar el caracter con 1   
    mov cl,'1'        
    cmp cl,dl      
    je valido   
    
    mov cl,'2'        
    cmp cl,dl      
    je valido  
    
    mov cl,'3'        
    cmp cl,dl      
    je valido  
    
    mov cl,'4'        
    cmp cl,dl      
    je valido  
    
    mov cl,'5'        
    cmp cl,dl      
    je valido 
    
    mov cl,'6'        
    cmp cl,dl      
    je valido
    
    mov cl,'7'        
    cmp cl,dl      
    je valido
    
    mov cl,'8'        
    cmp cl,dl      
    je valido
    
    mov cl,'9'        
    cmp cl,dl      
    je valido  
    
    mov cl,'-'        
    cmp cl,dl      
    je valido
    
    mov cl,'+'        
    cmp cl,dl      
    je valido
    
    mov cl,'/'        
    cmp cl,dl      
    je valido
    
    mov cl,'*'        
    cmp cl,dl      
    je valido
      
    mov cl,' '        
    cmp cl,dl      
    je valido  
      
    jne noValido                         
    
    valido:  
       
    inc si        
    jmp ciclo
    
    noValido:
    mov ah,09                                        
    mov dx,offset msj4 ;imprimir mensaje 4
    int 21h     
    jmp salir
     
    expresionValida: 
    mov ah,09  
    mov dx,offset msj3 ;imprimir mensaje 3
    int 21h  
salir:
.exit
end                              