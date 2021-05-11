        org 	100h

section	.text
            
        XOR SI, SI
        XOR AX, AX
        XOR DI, DI
        MOV byte CX, 5d         ; tamaño de la variable (carnet)
        JMP iterar              ;salto sin condicion
iterar:
        MOV AL, [msj+DI]         ;en la primera iteracion DI =0, se agarra la primera letra
        ADD BL, AL              ;En BX estoy guardando las sumas
        INC SI                  ; Se incrementa SI -> SI++
        INC DI                  ; Se incrementa DI -> DI++
        LOOP iterar 
exit:
        MOV AL,BL               ;muevo el total(BL) a AL(porque aqui va el diviendo)
        XOR BX, BX              ; limpio BX (por comodidad)
        MOV BL, 8h              ;muevo 8 a BL(el divisor)
        DIV BL                  ; lo divido
        mov BYTE[20Ah], AL      ; lo muevo a la direccion que quieren (AL porque alli quedo el cociento de 8 bits)
    	int	20h             

section .data
msj DB  1d,8d,3d,1d,8d           ;mi carnet es 00018318, le quite los ceros

                                ; la suma = 21 tiene que dar 15 en hexa
                                ; mi promedio seria 21/8 = 2.625