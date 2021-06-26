        
        
; ****************************************************** CONTRASEÑA: asdas ******************************************************
;****************************************************** puedes ver la contra y lo que ingresas con : " d 300 "
        
        org 100h

        XOR CX, CX
        XOR BX, BX
        ;  Aqui inserto la contraseña , lo deje asi porque si lo metia en un array me daba bastante problemas al momento de ocupar la pantalla
        mov	byte [310h], "a" ;44  
	mov	byte [311h], "s" ;41  
	mov	byte [312h], "d" ;41  
	mov	byte [313h], "a" ;41  
	mov	byte [314h], "s" ;41  
	mov	byte [315h], "L" ;4C  

        call    Modotexto       
        call    LeerCadena
        call    Limpiar 
        call    comprobar        


; Inicio el modo texto
Modotexto:
        mov     AH, 00h         
        mov     AL, 03h         ; modo texto: 80 columnas por 25 filas. 16 colores. 8 páginas
        int     10h 
        ret
 

; Esperamos la entrada de la tecla
EsperarTecla:
        mov     AH, 00h         
        int     16h 
        ret


; Leer cadena de texto desde el teclado
LeerCadena:
        xor     SI, SI          ; SI = 0
while:  
        call    EsperarTecla    ; retorna un caracter en AL
        cmp     AL, 0x0D        ; comparar AL con caracter EnterKey
        je      exit            ; si AL == EnterKey, saltar a exit

        mov     [300h+SI], AL   ; guardar caracter en memoria
        inc     SI              ; SI++
        inc     BH              ; Este lo ocupo como un contador para saber cuantas palabas a ingresado
        jmp     while           ; saltar a while
exit:
        ret
        

Limpiar:                        ; Limpio las variables
        MOV CX,SI               ; muevo el total de caracteres ingresado

        xor AX, AX
        xor SI, SI
        xor DX, DX
        
        ret


; --------------Aqui realizo la comprobacion-----------------------------------------------------------------------------dock
comprobar:
        cmp     byte [310h+SI], "L"             ; comparar AL con caracter L "este seria mi final"
        je      valitamanio                     ; aqui salto para salir

        mov     AL,[300h+SI]                    ; lo muevo a AL para poder hacer la comparacion
        cmp     byte [310h+SI], AL              ; comparar AL con caracter que se a digitado
        je      simon                           ; si AL == a una palabra que ingreso, lo salta al contador

continuar:
        inc     SI                              ; SI++
        jmp     comprobar                       ; repetimos el proceso


simon:
        INC BL                                  ; Aqui guardo como un contador, cada ves que coincida una palabra lo incrementa
        jmp continuar                           ; regresamos



valitamanio:
        CMP BH,5                                ; aqui compruebo que la cantidad de caracteres que ingreso sea la misma a la contra
        je mensaje                              ; si es la misma salta

        jmp neles                               ; si no es la misma cantidad de caracteres de un solo que le diga que es incorrecto

; ------ validando
mensaje:                                        ; aqui verifico si el contado tiene exactamente la misma longitud de la palabra,
        CMP BL,5                                ; si digamos la clave es "trueno" y ingreso "rueno", ya no coincide
; ------- simon son identicas
        je awuebo                               ;y si esto es correcto, lo manda a que imprimia la palabra BIENVENIDO

; ------ neles no son iguales
        jmp neles                               ;Sino pues que lo mande a imprimir la palabta INCORRECTO

awuebo:
        mov     byte [320h], "P"                ;esto es solo para probar si me daba bienvenido o incorrecto

        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 16 ;fila en la que se mostrará el cursor
        MOV DL, 20 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h

        MOV AH, 09h ; escribe cadena en pantalla según posición del cursor
        MOV DX, afirmativo ; cadena que vamos a imprimir, debe ir sin corchetes
        INT 21h




        int    20h       
neles:

        mov     byte [330h], "P"                ;esto es solo para probar si me daba bienvenido o incorrecto 

        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 16 ;fila en la que se mostrará el cursor
        MOV DL, 20 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h

        MOV AH, 09h ; escribe cadena en pantalla según posición del cursor
        MOV DX, negativo ; cadena que vamos a imprimir, debe ir sin corchetes
        INT 21h




	int    20h


section .data

afirmativo DB "BIENVENIDO$"
negativo DB "INCORRECTO$"