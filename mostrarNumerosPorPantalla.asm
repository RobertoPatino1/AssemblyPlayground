;INT 21H PARA VALORES DE 2 DIGITOS MAYORES A 9
mov ax, 34

;Se debe dividir el numero para 10, para de esta forma cortarlo en 2. El resultado es el primer digito, el residuo es el segundo
mov bl,10
mov cx,ax ;Guardando el numero original por si las moscas
div bl
mov bx,ax ;Copiando el resultado y residuo de la division anterior para no perderlo
;Mostrando la representacion en pantalla
mov ah,2
mov dx,cx
add dx,30h
int 21h
mov dx,'='
int 21h
;Validando si el numero es de 1 o 2 digitos. Si es de un digito el resultado de la division sera 0. Si es de 2 digitos no lo sera
cmp bl,0
je singleDigits
jnz doubleDigits




singleDigits:
mov dl,bh
add dl,30h
int 21h
;jmp finalizar


;Mostrando el resto de valores
doubleDigits:
mov dl,bl
add dl,30h
int 21h
mov dl,bh
add dl,30h
int 21h
;jmp finalizar


;finalizar:
;;Finalizando el programa enviandole 0000h al registro AH
;mov ah,00h
;int 21h1h