%Examen convocatoria ordinaria. Ejercicio 2 apartado b

function [t,y] = Ejercicio2_tabla2(f,rangot,y0,N)
  
  h = (rangot(2)-rangot(1))/N;
  t = linspace(rangot(1),rangot(2),N+1)';
  y = zeros(N+1,length(y0));
  y(1,:) = y0(:);
  k1 = 0;
  k2 = 0;

  for n = 1:N
    
    k1 = fsolve(@(w) w - f(t(n,:) + (h/3), y(n,:) + (h/3)*w), k1);
    k2 = fsolve(@(w) w - f(t(n,:) + (3*h)/4, y(n,:) + (h/4)*k1 + (h/2)*w), k2);
    
    y(n+1,:) = y(n,:) + (h/5)*(2*k1 + 3*k2);
    
  endfor
     
endfunction