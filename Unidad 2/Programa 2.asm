.model small
.stack
.data

  msj db 0ah,0dh, "1. Ingresa un numero decimal: $"
 msj2 db 0ah,0dh, "2. Ingresa un numero decimal: $"         
 msj3 db 0ah,0dh, "3. Ingresa un numero decimal: $"
 msj4 db 0ah,0dh, "El mayor es $"
 msj5 db 0ah,0dh, "El menor es $"
 
 n1 db ?
 n2 db ?
 n3 db ?
 
.code
.startup

mov ax,@data
mov ds,ax                                            

;Mostrar mensaje para pedir el primer numero---------------------------------------------------------------------------------------------

lea dx,msj
mov ah,09h
int 21h

;Pedir numero y guardarlo en la variable n1---------------------------------------------------------------------------------------

mov ah,01h
int 21h
sub al,30h
mov n1,al   

;Mostrar mensaje para pedir el primer numero---------------------------------------------------------------------------------------------

lea dx,msj2
mov ah,09h
int 21h

;Pedir numero y guardarlo en la variable n2---------------------------------------------------------------------------------------

mov ah,01h
int 21h
sub al,30h
mov n2,al

;Mostrar mensaje para pedir el primer numero---------------------------------------------------------------------------------------------

lea dx,msj3
mov ah,09h
int 21h

;Pedir numero y guardarlo en la variable n3---------------------------------------------------------------------------------------

mov ah,01h
int 21h
sub al,30h
mov n3,al      

;Comparaciones---------------------------------------------------------------------------------------------------------------------
;Comparando n1 
mov bh,n1
mov bl,n2 
mov cl,n3 

cmp bh,bl

ja LabelTempMayor
jb LabelTempMenor
        
        LabelTempMayor:
        cmp bh,cl
        ja LabelMayorn1
        jb LabelMayorn3
            
            ;n1 es el mayor
            LabelMayorn1:
                ;Imprime mensaje      
                 lea dx,msj4
                 mov ah,09h
                 int 21h 
                ;Imprime n1
                 mov ah,02h
                 add bh,30h
                 mov dl,bh
                 int 21h   
             
            ;Compara para saber el menor entre n2 y n3     
            cmp bl,cl
            ja LabelMenorn3
            jb LabelMenorn2
                
                LabelMenorn3:
                ;Imprime mensaje      
                 lea dx,msj5
                 mov ah,09h
                 int 21h
                ;Imprime n3
                 mov ah,02h
                 add cl,30h
                 mov dl,cl
                 int 21h
                 jmp LabelEnd
                
                LabelMenorn2:
                ;Imprime mensaje      
                 lea dx,msj5
                 mov ah,09h
                 int 21h  
                ;Imprime n2
                 mov ah,02h  
                 add bl,30h
                 mov dl,bl
                 int 21h 
                 jmp LabelEnd
                     
             ;n3 es el mayor    
             LabelMayorn3: 
                ;Imprime mensaje      
                 lea dx,msj4
                 mov ah,09h
                 int 21h
                ;Imprime n3
                 mov ah,02h
                 add cl,30h
                 mov dl,cl
                 int 21h

                ;Imprime mensaje      
                 lea dx,msj5
                 mov ah,09h
                 int 21h  
                ;Imprime n2
                 mov ah,02h
                 add bl,30h
                 mov dl,bl
                 int 21h 
                 jmp LabelEnd        

        LabelTempMenor:
        cmp bl,cl
        ja LabelMayorn2
        jb Labeln3
        
            LabelMayorn2:

                ;Imprime mensaje      
                 lea dx,msj4
                 mov ah,09h
                 int 21h    
                                                 
                ;Imprime n2
                 mov ah,02h
                 add bl,30h
                 mov dl,bl
                 int 21h
                 
            ;Compara para saber el menor entre n1 y n3     
            cmp bh,cl
            ja LabelMenor3
            jb LabelMenorN1
                
                LabelMenor3:

                ;Imprime mensaje      
                 lea dx,msj5
                 mov ah,09h
                 int 21h 
                ;Imprime n3
                 mov ah,02h
                 add cl,30h
                 mov dl,cl
                 int 21h
                 jmp LabelEnd
                
                LabelMenorN1:

                ;Imprime mensaje      
                 lea dx,msj5
                 mov ah,09h
                 int 21h    
                ;Imprime n1
                 mov ah,02h
                 add bh,30h
                 mov dl,bh
                 int 21h
                 jmp LabelEnd
                
            Labeln3:
               ;Imprime mensaje      
                lea dx,msj4
                mov ah,09h
                int 21h
               ;Imprime n3
                mov ah,02h
                add cl,30h 
                mov dl,cl
                int 21h

               ;Imprime mensaje      
                lea dx,msj5
                mov ah,09h
                int 21h  
                                         
               ;Imprime n2
                mov ah,02h
                add bh,30h
                mov dl,bh
                int 21h 
                jmp LabelEnd        

LabelEnd:
.exit
end 