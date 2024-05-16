function [x] = f_newton_sistemas_2(F,J,x0,tol)
  x=x0;
  error=1e3;
  n=0;
  
  while error > tol
    dx = -J(x)\F(x);
    error = norm(dx)/norm(x);
    x = x + dx;
    n = n + 1;
  endwhile
fprintf("Iteraciones: %d\n", n)
Y = F(x)