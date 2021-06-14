org 100h

    section .text
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    
    call modotexto
    
    ; escribo el primer Nombre
    call movercursornombreuno
    call escribircaracternombreuno

    ; escribo el segundo Nombre
    call movercursornombredos
    call escribircaracternombredos

    ; escribo el primer apellido
    call movercursorprimerapellido
    call escribircaracterprimerapellido

    ; escribo el segundo apellido
    call movercursorsegundoapellido
    call escribircaractersegundoapellido

    call esperartecla
    call exit

    modotexto: 
        MOV AH, 0h ; activa modo texto
        MOV AL, 03h ; modo gráfico deseado, 03h denota un tamaño de 80x25 (80 columnas, 25 filas)
        INT 10h
        RET
    ;------------------------------------ Escribo el primer nombre ------------------------------------
    movercursornombreuno:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 10 ;fila en la que se mostrará el cursor
        MOV DL, 20 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h
        RET
    escribircaracternombreuno: ;utilizando interrupcion DOS
        MOV AH, 09h ; escribe cadena en pantalla según posición del cursor
        MOV DX, nombreuno ; cadena que vamos a imprimir, debe ir sin corchetes
        INT 21h
        RET
    ;------------------------------------ Escribo el segundo nombre ------------------------------------
    movercursornombredos:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 12 ;fila en la que se mostrará el cursor
        MOV DL, 20 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h
        RET
    escribircaracternombredos: ;utilizando interrupcion DOS
        MOV AH, 09h ; escribe cadena en pantalla según posición del cursor
        MOV DX, nombredos ; cadena que vamos a imprimir, debe ir sin corchetes
        INT 21h
        RET
    ;------------------------------------ Escribo el primer apellido ------------------------------------
    movercursorprimerapellido:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 14 ;fila en la que se mostrará el cursor
        MOV DL, 20 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h
        RET
    escribircaracterprimerapellido: ;utilizando interrupcion DOS
        MOV AH, 09h ; escribe cadena en pantalla según posición del cursor
        MOV DX, apellidoeuno ; cadena que vamos a imprimir, debe ir sin corchetes
        INT 21h
        RET

    ;------------------------------------ Escribo el segundo apellido ------------------------------------
    movercursorsegundoapellido:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 16 ;fila en la que se mostrará el cursor
        MOV DL, 20 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h
        RET
    escribircaractersegundoapellido: ;utilizando interrupcion DOS
        MOV AH, 09h ; escribe cadena en pantalla según posición del cursor
        MOV DX, apellidodos ; cadena que vamos a imprimir, debe ir sin corchetes
        INT 21h
        RET

    esperartecla:
        MOV AH, 00h ; espera buffer del teclado para avanzar en la siguiente instrucción
        INT 16h

        ret
    exit:
        int 20h

section .data

nombreuno DB "Douglas$"
nombredos DB "Alfredo$"

apellidoeuno DB "Lino$"
apellidodos DB "Henriquez$"