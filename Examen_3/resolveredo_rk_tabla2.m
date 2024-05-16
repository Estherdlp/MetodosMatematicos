%Examen 2021 convocatoria ordinaria. Ejercicio 1

function [t,y] = resolveredo_rk_tabla2(f,rangot,y0,N)
  
  h = (rangot(2)-rangot(1))/N;
  t = linspace(rangot(1),rangot(2),N+1)';
  y = zeros(N+1,length(y0));
  y(1,:) = y0(:);
  k1 = zeros(N+1,length(y0));
  k2 = zeros(N+1,length(y0));
  
  
  for n = 1:N
    
    k1(n+1,:) = fsolve(@(w) w - f(t(n) + h/2, y(n,:) + w*(h/2)),k1(n,:));
    k2(n+1,:) = fsolve(@(w) w - f(t(n) + h/2, y(n,:) + (h/2)*(k1(n+1,:) + w)), k2(n,:));
    
    y(n+1,:) = y(n,:) + (h/2)*(k1(n+1,:) + k2(n+1,:));
    
  endfor

endfunction