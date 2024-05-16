%Examen convocatoria ordinaria. Ejercicio 2 apartado a

function [t,y] = Ejercicio2_tabla1(f,rangot,y0,N)

  h = (rangot(2)-rangot(1))/N;
  t = linspace(rangot(1),rangot(2),N+1)';
  y = zeros(N+1,length(y0));
  y(1,:) = y0(:);
    
  for n = 1:N
    
    k1 = f(t(n,:),y(n,:));
    k2 = f(t(n,:)+h/2,y(n,:) + k1*h/2);
    k3 = f(t(n,:)+h,y(n,:) + k1*h/3 + 2*k2*h/3);
    
    y(n+1,:) = y(n,:) + (h/8)*(k1 + 6*k2 + k3);
    
  endfor
  
endfunction