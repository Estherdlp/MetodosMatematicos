%Ejercicio 3 practica 2 - 04/11/2021
%Esther del Pico Garcia
%Funciones para probar que lo he hecho bien: F1 = @(t, y) ((y + log (1 + t ^ 2)) / t) - ((2 * t) / (1 + t ^ 2)), ode45(F1,[0.5,3],0.225); 
                                            %F2 = @(t, y) (sin (t) ^ 2) * y

function [Tiempo,y] = heunmod_edo(f,tspan,valor_inicial,num_iter)
  h = (tspan(2) - tspan(1))/num_iter;     %Cálculo del paso de cada iteracion
  Tiempo(:,1) = linspace(tspan(1),tspan(2),num_iter+1);  %Vectores para almacenar los calculos intermedios
  y = zeros(num_iter+1,2);
  j = zeros(10,2);
  y (1,:) = valor_inicial(1,:);           %Primer valor propuesto es el valor inicial de la EDO
  Err = inf;
  
  for (iter = 1:num_iter)
    
    y(iter+1,:) = y(iter,:) + h*f(Tiempo(iter),y(iter,:));        %Predictor
    j(1,:) = y(iter+1,:);                                         %Valor intermedio para iterar el corrector
    
    for i = 1:10
      
      j(i+1,:) = y(iter,:) + (h/2)*(f(Tiempo(iter),y(iter,:))+f(Tiempo(iter+1),j(i,:)));   %Iteracion valores corrector
      
      y(iter+1,:) = j(i+1,:);                                     %Propuesta iterando corrector
      
      Err = norm((j(i+1,:)-j(i,:)),inf);                          %Error de ejemplo
      
      if Err < 0.01*norm(j(i+1,:),inf)                            %Tolerancia 1%
        break
      endif
    endfor
  endfor
  
endfunction