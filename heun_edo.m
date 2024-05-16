%Ejercicio 2 practica 2 - 04/11/2021
%Esther del Pico Garcia
%Funciones para probar que lo he hecho bien: F = @(t, y) ((y + log (1 + t ^ 2)) / t) - ((2 * t) / (1 + t ^ 2))
                                            %F2 = @(t, y) (sin (t) ^ 2) * y

function [Tiempo,y] = heun_edo(funcion,tspan,valor_inicial,num_iter)
  h = (tspan(2) - tspan(1))/num_iter;       %Cálculo del paso de cada iteracion
  Tiempo(:,1) = linspace(tspan(1),tspan(2),num_iter+1);  %Vectores para almacenar los calculos intermedios
  y = zeros(num_iter+1,2)
  yp = zeros(num_iter+1,2)
  
  Tiempo (1,:) = tspan(1);                  %Primer valor de tiempo es el introducido por el usuario
  y (1,:) = valor_inicial                  %Primer valor propuesto es el valor inicial de la EDO
  
  for (iter = 1:num_iter)
    
    yp(iter+1,:) = y(iter,:) + h*funcion(Tiempo(iter,:),y(iter,:));               %Predictor
    
    y(iter+1,:) = y(iter,:) + (h/2) * (funcion(Tiempo(iter+1,:),yp(iter+1,:)) + funcion(Tiempo(iter,:),y(iter,:))); %Corrector (propuesta)
            
  endfor
  
endfunction