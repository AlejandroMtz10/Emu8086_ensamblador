;Programa para invertir una cadena de caracteres usando una pila

.model small 
.stack
.data

 cadena db "odnum aloH",'$'
 tamaCadena = ($ - cadena) - 1
 
 .code
 
 main PROC
    mov ax,@data
    mov ds,ax
    
    ;Coloca el nombre en la pila
    mov cx,tamaCadena
    mov si,0
    
   L1: mov al,cadena[si] ;obtiene el caracter
       push ax ;Agrega el caracter a la pila
       inc si
       loop L1
       
       ;Saca el nombre de la pila en orden inverso
       ;y lo almacena en el arreglo cadena
       
       mov cx,tamaCadena
       mov si,0
       
   L2: pop ax ;obtiene un caracter
       mov cadena[si], al ;el caracter se almacena en la cadena
       inc si
       loop L2
       
       mov ah,09h
       lea dx, cadena
       int 21h      
       
    main ENDP
 
 END main
 
.exit
End