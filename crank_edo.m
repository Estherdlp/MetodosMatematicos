%Ejercicio 4 practica 2 - 04/11/2021
%Esther del Pico Garcia
%Funciones para probar que lo he hecho bien: F = @(t, y) ((y + log (1 + t ^ 2)) / t) - ((2 * t) / (1 + t ^ 2)), ode45(F1,[0.5,3],0.225); 
                                            %F2 = @(t, y) (sin (t) ^ 2) * y

function [Tiempo,y] = crank_edo(f,tspan,valor_inicial,num_iter)
  h = (tspan(2) - tspan(1))/num_iter;                    %Cálculo del paso de cada iteracion
  Tiempo(:,1) = linspace(tspan(1),tspan(2),num_iter+1);  %Vectores para almacenar los calculos intermedios
  y = zeros(num_iter+1,2);
  y (1,:) = valor_inicial(1,:);                          %Primer valor propuesto es el valor inicial de la EDO
  
  for (iter = 1:num_iter)
    
    y(iter+1,:) = fsolve(@(w) w - y(iter,:) - (h/2) * (f(Tiempo(iter+1),w) + f(Tiempo(iter),y(iter,:))), y(iter,:));
    
  endfor
  
endfunction