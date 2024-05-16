%Calcula las raices de una funcion mediante el metodo de Newton-Rapshon para sistemas
function [xn, yn] = f_newton_sistemas(f,dfx,dfy,g,dgx,dgy,x,y)     %pide al usuario las dos funciones, sus derivadas parciales y un punto
  
  iter = 0;       %inicializamos las iteraciones a 0
  iterMax = 10;   %definimos las iteraciones maximas
  err = Inf;      % inicializacion del error
  tol = 1e-3;     % tolerancia maxia del error
  printf("iter. |    punto: x    |    punto: y    | error rel.\n");   %muestra por pantalla el encabezado del historial
  while err > tol && iter < iterMax        %bucle: se repitira mientras el error sea mayor que la tolerancia y no se hayan alcanzado las iteraciones maximas
    iter += 1;    %sumamos 1 al valor de las iteraciones
    
    j = [dfx(x,y), dfy(x,y); dgx(x,y), dgy(x,y)];
    J = j(2,2) * j(1,1) - j(1,2) * j (2,1);
    fp = f(x,y);
    gp = g(x,y);     %g en el punto (x,y)
    
    xn = x - ((fp * j(2,2) - gp * j(1,2))/J);      %x nueva
    yn = y - ((gp * j(1,1) - fp * j(2,1))/J);
    
    err = abs(xn-x);      % error relativo aproximado: valor absoluto de (x1 (x actual) - x0 (x anterior)) / x1 (x actual) 

    x = xn;
    y = yn;
    
    printf("  %2d  |  %e  |  %e  | %10d\n",iter,xn,yn,err);     %muestra los valores de las variables de la nueva iteracion: 2d (reserva 2 espacion para nº enteros), e (nº en notacion cientifica), d (nº enteros)
    %x0 = x1;      %asigna el valor actual a la variable de valor anterio para poder usarla en la proxima iteraccion
  endwhile
endfunction