%Ejercicio 5 practica 2 - 11/06/2022
%Esther del Pico Garcia
%Funciones para probar que lo he hecho bien: F1 = @(t, y) ((y + log (1 + t ^ 2)) / t) - ((2 * t) / (1 + t ^ 2)), ode45(F1,[0.5,3],0.225); 
                                            %F2 = @(t, y) (sin (t) ^ 2) * y

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
## @deftypefn {[@var{t},@var{y}] =} resolveredo_pvf(@var{a1},@var{a0},@var{rangot},@var{condsfr},@var{N})
##
## Resuelve el problema de valores en la frontera (PVF) para la
## ecuación lineal de segundo orden con coeficientes constantes
##
##   @code{y'' + a1*y' + a0*y = g(t)}
##
## dadas condiciones de frontera de tipo Dirichlet.
##
## /* Entrada */
##
## @var{a?}, escalar. Coeficiente en la ecuación.
##
## @var{g}, manejador de función. Término fuente.
##
## @var{rangot}, vector. Rango de tiempo de integración, @code{[t_ini, t_fin]}.
##
## @var{condsfr}, vector. Condiciones de frontera, @code{[y_ini, y_fin]}.
##
## @var{N}, entero positivo. Tamaño de la partición (menos 1).
##
## /* Salida */
## 
## @var{t}, vector. Tiempos de integración.
##
## @var{y}, vector. Valores integrados.
##
## @end deftypefn
function [t,y] = resolveredo_pvf(a1,a0,g,rangot,condsfr,N)
  y0 = condsfr(1); yN = condsfr(2);
  h = (rangot(2)-rangot(1))/N;
  t = linspace(rangot(1),rangot(2),N+1)';
  u = (1/h+a1/2)/h;
  l = (1/h-a1/2)/h;
  m = (a0-2/h^2);
  A = diag(u*ones(N-2,1),1) + diag(l*ones(N-2,1),-1) + diag(m*ones(N-1,1));
  b = g(t(2:end-1));
  b( 1 ) -= l*y0;
  b(N-1) -= u*yN;
  y = [y0; A\b; yN]; # mejor usar Thomas !!!
endfunction