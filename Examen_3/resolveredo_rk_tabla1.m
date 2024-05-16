%Examen 2021 convocatoria ordinaria. Ejercicio 1

function [t,y] = resolveredo_rk_tabla1(f,rangot,y0,N)
  
  h = (rangot(2)-rangot(1))/N;
  t = linspace(rangot(1),rangot(2),N+1)';
  y = zeros(N+1,length(y0));
  y(1,:) = y0(:);
  
  for n = 1:N
    
    k1(n,:) = f(t(n,:),y(n,:));
    k2(n,:) = f(t(n,:) + h/2, y(n,:) + k1(n,:)*h/2);    
    k3(n,:) = f(t(n,:) + 3*h/4, y(n,:) + 3*h/4*k2(n,:));
    
    y(n+1,:) = y(n,:) + (h/9)*(2*k1(n,:) + 3*k2(n,:) + 4*k3(n,:));
    
  endfor
  
endfunction