%Ejercicio 2 practica 2 - 04/11/2021
%Esther del Pico Garcia
%Funciones para probar que lo he hecho bien: F = @(t, y) ((y + log (1 + t ^ 2)) / t) - ((2 * t) / (1 + t ^ 2))
                                            %F2 = @(t, y) (sin (t) ^ 2) * y

function [t,y] = eulerp_edo(funcion,tspan,valor_inicial,num_iter)
  h = (tspan(2) - tspan(1))/num_iter;     %Cálculo del paso de cada iteracion
  Tiempo = [];                            %Vectores para almacenar los calculos intermedios
  y = [];
  f = [];
  
  Tiempo (1) = tspan(1);                  %Primer valor de tiempo es el introducido por el usuario
  y (1) = valor_inicial;                  %Primer valor propuesto es el valor inicial de la EDO
  
  for (iter = 1:num_iter)
    f(iter) = funcion(Tiempo(iter),y(iter));    %Valor funcion para ultimo tiempo y propuesta
    
    y(iter+1) = y(iter) + h*f(iter);            %Nueva propuesta = propuesta anterior + paso*valor de EDO
    Tiempo(iter+1) = Tiempo(iter) + h;          %Nuevo tiempo = tiempo anterior + paso
  endfor
  printf("\nValor propuesto para tiempo %s: %s",num2str(Tiempo(iter+1)),num2str(y(iter+1)));    %Imprimir propuesta
endfunction
  