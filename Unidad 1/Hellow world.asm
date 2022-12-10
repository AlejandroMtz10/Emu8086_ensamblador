.model
.stack
.data
  saludo db "Hola mundo!!! $"
  linea db 0ah, 0dh,'$'
  bye db "Adios!!! $"
  
.code               
.startup            

    mov ax,@data    ;Cargar datos al regisro
    mov ds, ax               
    
    mov dx, offset saludo   ;visualizacion de cadena
    mov ah, 09h                                     
    int 21h      ;interrupcion 21      
    
    mov dx, offset linea   ;visualizacion de cadena
    mov ah, 09h                                     
    int 21h
                    
    mov dx, offset bye   ;visualizacion de cadena
    mov ah, 09h                                     
    int 21h
  end