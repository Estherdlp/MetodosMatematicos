%Ejercicio 4 practica 3 - 15/06/2022

function [x,t,u] = resolvercalor_eulerprogen(a,phi,rangoxt,N)
  # numero de divisiones (= nodos-1)
  Nx = N(1);
  Nt = N(2);
  # pasos de integracion
  hx = (rangoxt(2)-rangoxt(1))/Nx;
  ht = (rangoxt(4)-rangoxt(3))/Nt;
  # nodos
  x = linspace(rangoxt(1),rangoxt(2),Nx+1);
  t = linspace(rangoxt(3),rangoxt(4),Nt+1);
  
  %Condicion inicial homogénea
  u = zeros(Nx+1,Nt+1);
  
  %Término fuente
  g = zeros(Nx+1,Nt+1);
  
  for j = 1:Nx+1
    g(j,1:Nt+1) = phi(x(j));
  endfor
  
  # condicion de frontera
  # --homogenea (nada que hacer)--
  
  # resolucion
  for k = 1:Nt
    for i = 2:Nx
      
      uxx = (u(i-1,k)-2*u(i,k)+u(i+1,k))/hx^2;
      
      u(i,k+1) = u(i,k)+ht*a*uxx + ht*g(i-1,k);
      
    endfor
  endfor
  u = u'; ## compatibilidad con meshgrid
endfunction
