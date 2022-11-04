;STACKKKK!!!

;Programa que invierta 2 numeros con un stack
mov ax,99

mov cx,0000h ;Limpiando el registro del contador
jmp almacenar

almacenar:    
    push ax
    add cx,1 ;Se agrega 1 al contador por cada elemento agg a la pila
    sub ax,1
    cmp ax,0
    jz mostrar
    jnz almacenar 


mostrar:
    ;Ahora solo debemos retirar los elementos del stack mientras cx sea mayor a 0
    pop ax 
    sub cx,1
    
    ;Podemos validar si ese numero es de 1 o 2 digitos con una division para 10
    mov bl,10
    div bl 
    cmp al,0
    jz singleDigit ;Si el cociente es 0, el numero es de 1 digito
    jnz doubleDigit ;Si el cociente es diferente de 0, el numero es de 2 digitos
    
    
    
    
   
   
singleDigit:
    mov dl,ah
    add dl,30h
    mov ah, 2
    int 21h
    mov dl,00h
    int 21h
    cmp cx,0
    jz finalizar
    jnz mostrar
   
   
   
doubleDigit:
    mov bx,ax
    mov dl, bl
    add dl,30h
    mov ah,2
    int 21h
    mov dl,bh
    add dl,30h    
    int 21h
    
    mov dl,00h
    int 21h
    cmp cx,0
    jnz mostrar
    jz finalizar  
    
    
    
finalizar:
    mov ah, 00h
    int 21h    