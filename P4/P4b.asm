;b) direccionamiento indirecto remplace la letra x de la cadena msg por la letra X.
%include "../LIB/pc_io.inc"  	; incluir declaraciones de procedimiento externos que se encuentran en la biblioteca libpc_io.a

section	.text
	global _start       ;referencia para inicio de programa
	
_start:    
 
    mov edx, msg        ; cadena original
    call puts

    
	mov esi, msg
	add esi, 23
	mov byte [esi], 'X'		; edx = dirección de la cadena msg
	call puts		; imprime cadena msg terminada en valor nulo (0)


	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	int	0x80        	; llamada al sistema - fin de programa

section	.data
msg	db  'abcdefghijklmnopqrstuvwxyz0123456789',0xa,0 

