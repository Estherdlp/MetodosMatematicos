%Ejercicio 2 practica 2 - 04/11/2021
%Esther del Pico Garcia
%Funciones para probar que lo he hecho bien: F = @(t, y) ((y + log (1 + t ^ 2)) / t) - ((2 * t) / (1 + t ^ 2))
                                            %F2 = @(t, y) (sin (t) ^ 2) * y

function [t,y] = rkv_edo(funcion,tspan,valor_inicial,num_iter)
  h = (tspan(2) - tspan(1))/num_iter;     %Cálculo del paso de cada iteracion
  Tiempo = [];                            %Vectores para almacenar los calculos intermedios
  y = [];
  f = [];
  k1 = [];
  k2 = [];
  k3 = [];
  k4 = [];
  
  Tiempo (1) = tspan(1);                  %Primer valor de tiempo es el introducido por el usuario
  y (1) = valor_inicial;                  %Primer valor propuesto es el valor inicial de la EDO
  
  for (iter = 1:num_iter)
    k1(iter) = funcion(Tiempo(iter),y(iter));                   %Valores intermedios
    k2(iter) = funcion(Tiempo(iter)+h/2,y(iter)+h*k1(iter)/2);
    k3(iter) = funcion(Tiempo(iter)+h/2,y(iter)+h*k2(iter)/2);
    k4(iter) = funcion(Tiempo(iter)+h,y(iter)+h*k3(iter));
    
    y(iter+1) = y(iter) + (h/6)*(k1(iter)+2*k2(iter)+2*k3(iter)+k4(iter));  %Valor propuesto
    Tiempo(iter+1) = Tiempo(iter) + h;               %Nuevo tiempo = tiempo anterior + paso
            
    printf("Valor propuesto a tiempo %s: %s\n",num2str(Tiempo(iter)),num2str(y(iter))); %Propuestas intermedias
    
  endfor
  printf("\nValor propuesto para tiempo %s: %s",num2str(Tiempo(iter+1)),num2str(y(iter+1)));    %Imprimir propuesta
endfunction