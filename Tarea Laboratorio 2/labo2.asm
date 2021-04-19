	org	100h

	section .text

;escribo las cuatro iniciales = Douglas Alfredo Lino Henriquez
	mov	byte [200h], "D" ;44  
	mov	byte [201h], "A" ;41  
	mov	byte [202h], "L" ;4C  
	mov	byte [203h], "H" ;48  

;Copiar el valor de 200h a AX usando direccionamiento directo.
        mov 	AL, [200h] 

; Copiar el valor de 201h a CX usando direccionamiento indirecto por registro.
        mov     BX, 201h
        mov	CL, [BX]

; Copiar el valor de 202h a DX usando direccionamiento indirecto base más índice.
        mov     BX, 202h
        mov     DL, [BX+SI]

; Copiar el valor de 203h a DI usando direccionamiento relativo por registro.
	mov	DI, [SI+203h]

	

	int 	20h