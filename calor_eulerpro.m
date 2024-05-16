########################################################################
##
## Copyright (C) 2020-2021 Cédric M. Campos
##
## Este archivo forma parte del curso de «Métodos Matemáticos para la
## Ingeniería» impartido por el propio autor.
##
## Este archivo y la obra están bajo una licencia de Creative Commons
## Reconocimiento-CompartirIgual 4.0 Internacional. Debería haber
## recibido una copia de la licencia junto a esta obra. Si no es así,
## visite <http://creativecommons.org/licenses/by-sa/4.0/>.
##
########################################################################

## -*- texinfo -*-
## @deftypefn {[@var{x},@var{t},@var{u}] =} resolvercalor_eulerpro(@var{a},@var{g},@var{f},@var{rangoxt},@var{N})
##
## Integra la ecuación del calor 1D homogénea mediante diferencias finitas aplicando el método de Euler progresivo (en tiempo).
##
## * Entrada *
##
## @var{a}, escalar. Coeficiente de difusividad térmica.
##
## @var{g}, función. Término fuente. Debe aceptar dos entradas, una de espacio, @code{x}, y otra de tiempo, @code{t}, o una única entrada de espacio.
##
## @var{f}, función. Condición inicial. Debe aceptar una entrada de espacio, @code{x}.
##
## @var{rangoxt}, vector. Rangos de integración en espacio y tiempo, @code{[x_ini x_fin t_ini t_fin]}.
##
## @var{N}, vector. Números de divisiones de los intervalos de integración, @code{[Nx Nt]}.
##
## * Salida *
##
## @var{x}, vector. Nodos de integracion en espacio.
##
## @var{t}, vector. Nodos de integracion en tiempo.
##
## @var{u}, matriz. Solución en los nodos.
##
## @end deftypefn
function [x,t,u]=calor_eulerpro(a,funf,rangoxt,N)
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
  # resolución
  for k = 1:Nt
    for i = 2:Nx
      uxx = (u(i-1,k)-2*u(i,k)+u(i+1,k))/hx^2;
      u(i,k+1) = u(i,k)+ht*a*uxx;
    endfor
  endfor
  u = u'; ## compatibilidad con meshgrid
endfunction
