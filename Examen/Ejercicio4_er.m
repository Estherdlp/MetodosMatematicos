%Examen convocatoria ordinaria. Ejercicio 4

function [x,t,u] = Ejercicio4_er(a,f,rangoxt,N)
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
  for i = 1:Nx+1
    u(i,1) = f(x(i));
  endfor
  
  %resolucion
  l = a * ht/(hx^2);
  d = 1 + 2*l;
  M = diag(d*ones(1,Nx-1)) - diag(l*ones(1,Nx-2),1) - diag(l*ones(1,Nx-2),-1);
  
  for k = 2:Nt+1
    U = u(2:Nx,k-1);
    U(1) = u(2,k-1) - l*u(1,k);
    U(end) = u(end-1,k-1) - l*u(end,k);
    u(2:Nx,k) = M\U;
  endfor
  
  u = u'; ## compatibilidad con meshgrid
  
endfunction