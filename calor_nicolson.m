function [x,t,u]=calor_nicolson(a,funf,rangoxt,N)
  # numero de divisiones (= nodos-1)
  Nx = N(1); Nt = N(2);
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
    u(i,1) = funf(x(i));
  endfor
  # condicion de frontera
  # --homogenea (nada que hacer)--
  
  #matriz C
  b = -a / 2;
  d = 1 + a;
  C = diag(d*ones(1,Nx-1))+diag(b*ones(1,Nx-2),1)+diag(b*ones(1,Nx-2),-1);
  
  # resolucion
  for k = 1:Nt
    #vector B
    for i = 2:Nx
     B(i-1) = (1-a)*u(i,k)+(a/2)*(u(i-1,k)+u(i+1,k));
    endfor
    B(1) = B(1) - b*u(1,k+1);
    B(end) = B(end) - b*u(Nx+1,k+1);

    u(2:Nx,k+1)= inv(C)*B;
  endfor
  
  u = u'; ## compatibilidad con meshgrid
endfunction