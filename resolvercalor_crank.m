%Ejercicio 3 practica 3 - 17/12/2021

function [x,t,u,U] = resolvercalor_crank(a,phi,rangoxt,N)
  # numero de divisiones (= nodos-1)
  Nx = N(1);
  Nt = N(2);
  
  # pasos de integracion
  hx = (rangoxt(2)-rangoxt(1))/Nx;
  ht = (rangoxt(4)-rangoxt(3))/Nt;
  
  # nodos
  x = linspace(rangoxt(1),rangoxt(2),Nx+1);
  t = linspace(rangoxt(3),rangoxt(4),Nt+1);
  
  # solucion (reserva de espacio/memoria)
  u = zeros(Nx+1,Nt+1);
  
  # condicion inicial
  for j = 1:Nx+1
    u(j,1) = phi(x(j));
  endfor
  
  %resolucion
  b = -(a^2*ht)/(2*hx^2);
  d = 1 + (a^2*ht)/(hx^2);
  c = 1 - (a^2*ht)/(hx^2);
  M = diag(d*ones(1,Nx-1)) + diag(b*ones(1,Nx-2),-1) + diag (b*ones(1,Nx-2),1);
  
  # resolucion
  for k = 1:Nt
    
    U = -b*u(1:Nx-1,k) + u(2:Nx,k)*c - b*u(3:Nx+1,k);
    
    U(1) = U(1) - b*u(1,k+1);  
    U(end) = U(end) - b*u(end,k+1);
    
    u(2:Nx,k+1) = M\U;

  endfor
  
  u = u'; ## compatibilidad con meshgrid
  
endfunction