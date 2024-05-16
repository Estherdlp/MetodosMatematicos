% prueba: [c, iter] = resolverf_biseccion( @(x) x^2-4 , 1.1 , 3)
function [c, iter] = resolverf_biseccion(f,a,b)
  Err = b-a;
  Tol = 0.1;
  iter = 0;
  iterMax = 10;
  while iter < iterMax && Err > Tol
    iter += 1;
    c = (a+b)/2;
    Err = Err/2;
    if f(a)*f(c) < 0
      b = c;
    elseif f(c)*f(b) < 0
      a = c;
    else
      return
    endif
  endwhile
endfunction
