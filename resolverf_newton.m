function x1 = resolverf_newton(f,df,x0)
  err = Inf;  % inicialización
  tol = 1e-3; % tolerancia
  while err > tol
    x1 = x0 - f(x0)/df(x0); % iteración de Newton-Raphson
    err = abs((x1-x0)/x1);  % error relativo aproximado
    x0 = x1;
  endwhile
endfunction
