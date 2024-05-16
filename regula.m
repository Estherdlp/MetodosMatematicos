%Ejercicio 2 practica 1 - 06/10/2021
%Esther del Pico Garcia
%Metodo de "regula falsi"

function [c, iter] = regula(funcion,a,b,Tol)
  iter = 1;                           %Reinicializar el contador de iteraciones
  iter_imprimir = 1;                  %Reinicializar el contador para imprimir la tabla
  raiz_exacta = 0;                    %Variable por si se encuentra la raiz exacta
  introducido = 0;                    %Variable por si uno de los valores introducidos es raiz
  q = 0;                              %Calculo del orden de convergencia
  Err = [];                           %Vector error absoluto
  Err_rel = [];                       %Vector error relativo
  valores_a = [];                     %Vector valores a
  valores_b = [];                     %Vector valores b
  valores_c = [];                     %Vector propuesta
  Fa = [];                            %Vector resultados f(a)
  Fb = [];                            %Vector resultados f(b)
  Fc = [];                            %Vector resultados f(c)
  lado = [];                          %Vector lado
  valores_a(iter) = a;                %Primera posicion de vector a es el valor del usuario
  valores_b(iter) = b;                %Primera posicion de vector b es el valor del usuario
  
  %Parametros impresion grafica
  xs = linspace(a,b,127);
  fxs = funcion(xs);
  
  
  %Calculo para ver si lo que ha introducido el usuario es una raiz
  Fa(1) = funcion(valores_a(1));
  Fb(1) = funcion(valores_b(1));
  Err(1) = 1;
  
  if (Fa(1) == 0)
    raiz_exacta = 1;
    introducido = 1;
    Err(1) = '-';
    Err_rel(1) = '-';
    iter++;
    printf("El valor de a introducido es una raiz\n");
  endif
  if (Fb(1) == 0)
    raiz_exacta = 1;
    introducido = 1;
    Err(1) = '-';
    Err_rel(1) = '-';
    iter++;
    printf("El valor de b introducido es una raiz\n");
  endif
  
  
  while ( (iter <= 100) && ((abs(Err(length(Err)))) > Tol) && (raiz_exacta == 0) && (introducido == 0) )
    
    %Calculo de la propuesta y del error
    valores_c(iter) = (valores_a(iter)*Fb(iter) - valores_b(iter)*Fa(iter)) / (Fb(iter) - Fa(iter));
    if iter == 1
      Err(iter) = '-';
      Err_rel(iter) = '-';
    else
      Err(iter) = abs((valores_c(iter) - valores_c(iter-1)));
      Err_rel(iter) = Err(iter) / (valores_c(iter));
    endif
    Fc(iter) = funcion(valores_c(iter));
    
    %Impresion de la grafica de la funcion
    plot(xs,fxs,'b',"linewidth",4)
    grid on
    hold on
    plot([valores_a(iter),valores_a(iter)],[0,Fa(iter)],'-gs',"linewidth",3,"markerfacecolor",'g')
    plot([valores_b(iter),valores_b(iter)],[0,Fb(iter)],'-gs',"linewidth",3,"markerfacecolor",'g')
    plot([valores_c(iter),valores_c(iter)],[0,Fc(iter)],'-ro',"linewidth",3,"markerfacecolor",'r')
    hold off
    pause
    
    %Aplicamos el teorema de Bolzano para saber si existe un 0 encerrado entre los dos numeros
    %Si hay cambio de signo, cambiamos limite superior
    if (Fa(iter)*Fc(iter) < 0)
      valores_a(iter+1) = valores_a(iter);
      valores_b(iter+1) = valores_c(iter);
      Fa(iter+1) = Fa(iter);
      Fb(iter+1) = Fc(iter);
      lado(iter) = 'I';
    %Si no hay cambio de signo en el producto anterior, probamos si hay que cambiar el limite inferior
    elseif (Fa(iter)*Fc(iter) > 0)
      valores_a(iter+1) = valores_c(iter);                          
      valores_b(iter+1) = valores_b(iter);
      Fa(iter+1) = Fc(iter);
      Fb(iter+1) = Fb(iter);
      lado(iter) = 'D';
    %Si el producto es 0, es porque ya hemos encontrado la raiz
    elseif (Fc(iter) == 0)
      raiz_exacta = 1;
      lado = '-';
    endif
    
    iter ++;
    
  endwhile 
  
  %Aviso maximo numero de iteraciones alcanzado
  if iter == 100
    printf("\nSe ha alcanzado el numero maximo de iteraciones\n");
  endif
  
  %Rellenamos la tabla con los valores calculados
  if (introducido == 0)
    printf("iter.  |      raiz      | lado |    error abs.   |   error rel.\n")
    for (iter_imprimir=1:(iter-1))
      printf("   %2d  |   %10.3e   |  %s   |   %10.3e    |   %10.3e\n",iter_imprimir,valores_c(iter_imprimir),lado(iter_imprimir),Err(iter_imprimir),Err_rel(iter_imprimir))
    endfor
    printf("\nLa raiz propuesta mediante el metodo de regula falsi es: %s\n",num2str(valores_c(iter-1)));
    
    if (length(Err)>1)
      %Estimacion del orden de convergencia
      q = (log(Err(length(Err))/Err(length(Err)-1))) / (log(Err(length(Err)-1)/Err(length(Err)-2)));
      printf("El orden de convergencia del metodo de regula falsi es: %s\n",num2str(q));
    else
      printf("Imposible calcular el orden de convergencia por no haber iteraciones suficientes\n");
    endif
  endif

endfunction