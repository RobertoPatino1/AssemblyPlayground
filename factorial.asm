;PROGRAMA QUE IMPRIME EL FACTORIAL DE UN NUMERO
mov ax, 5 ;Valor al que se le calculara su factorial

;Ojo: No quiero guardar valores, solo multiplicarlos progresivamente
mov cx,ax
;Rutina de multiplicacion por los valores anteriores
calcular:
    sub cx,1 ;Restamos 1 a cx
    mul cx   ;Se multiplica el registro ax por cx-->AX-1, el resultado se guarda en AX
    ;Si queda 1 en cx-->(n-1) saltamos a la rutina de conversion, de no ser asi se repite la rutina de calculo
    cmp cx,1
    jz convertir
    jnz calcular


;Una vez que tenemos el factorial del numero listo, solo debemos mostrarlo por pantalla
;Este paso es algo delicado ya que el numero puede ser de varios digitos
convertir:
int 21h    