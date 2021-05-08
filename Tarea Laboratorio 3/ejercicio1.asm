        org 	100h

section	.text
            
        XOR SI, SI
        XOR AX, AX
        XOR DI, DI
        MOV byte CX, 5d         ; tamaño de la variable
        JMP iterar              ;salto sin condicion
iterar:
        MOV AL, [msj+DI]         ;en la primera iteracion DI =0, se agarra la primera letra
        ADD BL, AL              ;En BX estoy guardando las sumas
        INC SI                  ; Se incrementa SI -> SI++
        INC DI                  ; Se incrementa DI -> DI++
        LOOP iterar 
exit:
        mov BYTE[20Ah], BL      ; lo muevo a la direccion que quieren
    	int	20h

section .data
msj DB  1d,8d,3d,1d,8d              ;mi correo es 00018318, le quite los ceros

                                ; la suma = 21 tiene que dar 15 en hexa