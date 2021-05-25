
;------------------------- con t 94 podes corre el programa completo ----------------------------------------------------------------
                org     100h
                section .text

                MOV     BP, arrByte                     ;BP = puntero a arrbyte
                MOV     BL, 2h                          ;BL = guardo el 2, es para hacer la division
                XOR     SI,SI                           ;limpio

                CALL    fun                             ;llamo a la funcion

        ;Los pares  0300H y impares  0320H. 

                int     20h

        section .data


arrByte    db      3d,2d,4d,5d,6d,7d,8d,9d,2d,4d,0xA   ;arreglo de numeros 
fun:
                XOR     AX,AX                          ;limpio
                MOV     BH,00d                         ; muevo el 0, solo para estar limpiando el registro
                mov     AL, [BP+SI]                    ;AL = [puntero a arreglo + SI], muevo el numero
; compruebo si ya termino
                cmp     AL, 0xA                        ; verifica si AL == 0xA
                je      end                            ; salta a end si AL == 0xA

                MOV     BH,AL                          ;lo muevo solo para tenerlo guardo, porque al dividirlo me lo quita 
                DIV     BL                             ; lo divido
;comparo si el residuo es 0
                cmp     AH, 0d                         ;verifica si Ah (residuo) = 0 -> es par
                JZ    numpar

;comparo si el residuo es 1
                cmp     AH, 1d                         ;verifica si Ah (residuo) = 1 -> es impar
                JZ    numimpar

;esto es para que se regrese (solo asi me salia)
again:       
                
                         
                INC     SI                             ;SI ++
                JMP     fun                            ;se repite
;si es par lo muevo a la direccion
numpar:
                MOV     [0300H+SI], BH                 ;[direccion de guardado + SI] = AL \\ lo mandamos a guardar 0300h
                JMP     again                          ;salta para que siga el proces

;si es impar lo muevo a la direccion
numimpar:
                MOV     [0320H+SI], BH                 ;[direccion de guardado + SI] = AL \\ lo mandamos a guardar 0320h
                JMP     again                          ;salta para que siga el proces
end:
                RET                                    ;regreso a MAIN