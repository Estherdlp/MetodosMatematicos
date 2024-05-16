%Examen convocatoria ordinaria. Ejercicio 3

function [x,t,u] = Ejercicio3_ep(a,f,rangoxt,N)
  
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
  
  # condicion inicial
  for i = 1:Nx+1
    u(i,1) = f(x(i));
  endfor
  
  # resolucion      
  for k = 1:Nt
    for i = 2:Nx
      uxx = (u(i-1,k)-2*u(i,k)+u(i+1,k))/hx^2;
      u(i,k+1) = u(i,k)+ht*a*uxx;
    endfor
  endfor
  
  u = u'; ## compatibilidad con meshgrid
  
endfunction