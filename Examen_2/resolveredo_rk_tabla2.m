%Examen 2021 convocatoria extraordinaria. Ejercicio 1

function [t,y] = resolveredo_rk_tabla2(f,rangot,y0,N)
  
  h = (rangot(2)-rangot(1))/N;
  t = linspace(rangot(1),rangot(2),N+1)';
  y = zeros(N+1,length(y0));
  y(1,:) = y0(:);
  k1(1,:) = 0;
  k2(1,:) = 0;
  
  for n = 1:N
    
    k1(n+1,:) = fsolve(@(w) w - f(t(n,1) + h/3, y(n,:) + w*h/3),k1(n,:));
    k2(n+1,:) = fsolve(@(w) w - f(t(n,1) + 2*h/3, y(n,:) + 2*w*h/3), k2(n,:));
    
    y(n+1,:) = y(n,:) + (h/3)*(k1(n+1,:) + 2*k2(n+1,:));
    
  endfor
endfunction