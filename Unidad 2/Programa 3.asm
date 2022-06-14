;1 America del Norte $6.00
;2 America Central $4.00
;3 America del Sur $8.00
;4 Europa $10.00
;5 Asia $27.00

.model small
.stack
.data

    msj db 0ah,0dh, "Ingrese un digito para consultar el costo por gramo: $"
    NA db 0ah,0dh, "America del Norte 6.00. $"
    AC db 0ah,0dh, "America Central 4.00. $"
    LAS db 0ah,0dh, "America del Sur 8.00. $"
    EU db 0ah,0dh, "Europa 10.00. $"
    AS db 0ah,0dh, "Asia 27.00. $" 
    msj1 db 0ah,0dh,"Valor no encontrado.$"
    n db ?
    
.code
.startup     

mov ax,@data
mov ds,ax      

;Mostrar mensaje para pedir un numero---------------------------------------------------------------------------------------------

lea dx,msj
mov ah,09h
int 21h

;Pedir numero y guardarlo en la variable dia---------------------------------------------------------------------------------------

mov ah,01h
int 21h
sub al,30h
mov n,al

;Switch----------------------------------------------------------------------------------------------------------------------------

cmp n,1
je LabelNA

cmp n,2
je LabelAC

cmp n,3
je LabelLAS

cmp n,4
je LabelEU

cmp n,5
je LabelAS

jmp LabelDefault 

LabelNA:

lea dx,NA
mov ah,09h
int 21h
jmp LabelEnd

LabelAC: 

lea dx,AC
mov ah,09h
int 21h
jmp LabelEnd

LabelLAS:

lea dx,LAS
mov ah,09h
int 21h
jmp LabelEnd

LabelEU:

lea dx,EU
mov ah,09h
int 21h
jmp LabelEnd

LabelAS:

lea dx,AS
mov ah,09h
int 21h
jmp LabelEnd

LabelDefault:

lea dx,msj1
mov ah,09h
int 21h
jmp LabelEnd


LabelEnd:
.exit
end