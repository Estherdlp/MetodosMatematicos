%Examen convocatoria extraordinaria. Ejercicio 3

function [x,t,u] = resolveredp_onda(c,f,rangoxt,N)
  
  # numero de divisiones
  Nx = N(1);
  Nt = N(2);
  
  # pasos de integracion
  hx = (rangoxt(2)-rangoxt(1))/Nx;  
  ht = (rangoxt(4)-rangoxt(3))/Nt;
  
  # nodos
  x = linspace(rangoxt(1),rangoxt(2),Nx+1)';
  t = linspace(rangoxt(3),rangoxt(4),Nt+1)';
  
  # solucion (reserva de espacio/memoria)
  u = zeros(Nx+1,Nt+1);
  b = (c^2*ht^2)/(hx^2);
  
  #Columna 1: condiciones iniciales
  for i = 1:Nx+1
    u(i,1) = f(x(i));
  endfor
  %Columna 2: ui1 = f(xi) + kg(xi)
  for i2 = 2:Nx
    u(i2,2) = (b/2)*(f(x(i2+1)) + f(x(i2-1))) + (1 - b)*f(x(i2)) + ht*0;   %Como ut(x,0) = 0, g(xi) = 0
  endfor
  %Condiciones de contorno
  for i3 = 1:Nt+1
    u(1,i3) = 0;
    u(end,i3) = 0;
  endfor
  
  # resolucion
  %Fijamos el indice j y variamos el indice i de 1 hasta Nx-1 para obtener la expresion matricial
  
  for k = 2:Nt
    for j = 2:Nx
      
      u(j,k+1) = b*(u(j+1,k) + u(j-1,k)) + 2*(1 - b)*u(j,k) - u(j,k-1);
      
    endfor
  endfor

  u = u'; ## compatibilidad con meshgrid
  
endfunction