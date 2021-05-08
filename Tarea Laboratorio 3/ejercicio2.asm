        org 	100h

	section	.text

        XOR AX, AX
        XOR BX, BX
        XOR DX, DX

        MOV AL, 5h          ;le asigno 5
        MOV BL, 4h          ; le asigno 4 (uno menos)
        JMP iterar          ;salto sin condicion
iterar:
        CMP BL, 0h          ;comparamos si BL tiene 0
        JE exit             ;salto condicional,
        
        MUL BL              ;Realizo la multiplicacion
        SUB BL, 1h          ; le resto uno a BL (BL lo ocupo como que fuera contador)
        MOV DX, AX          ;Muevo resultado a DX solo para verlo y tenerlo a la mano
        jmp iterar          ; repito
exit:
        MOV word [20Bh], AX  ;aqui muevo el dato(78h = 120d) a la direccion,


	int	20h