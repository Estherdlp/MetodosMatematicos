% prueba: [c, iter] = resolverg_biseccion( @(x) x^2-4 , 1.1 , 3)
function [c, iter] = resolverg_biseccion(f,a,b)
% bloque grafica (inicio) --------
  xs = linspace(a,b,127);
  fxs = f(xs);
% bloque grafica (fin) -----------
  Err = b-a;
  Tol = 0.1;
  iter = 0;
  iterMax = 10;
  while iter < iterMax && Err > Tol
    iter += 1;
    c = (a+b)/2;
    Err = Err/2;
% bloque grafica (inicio) --------
    plot(xs,fxs,'b',"linewidth",4)
    grid on
    hold on
    plot([a,a],[0,fa],'-gs',"linewidth",3,"markerfacecolor",'g')
    plot([b,b],[0,fb],'-gs',"linewidth",3,"markerfacecolor",'g')
    plot([c,c],[0,fc],'-ro',"linewidth",3,"markerfacecolor",'r')
    hold off
    pause
% bloque grafica (fin) -----------
    if f(a)*f(c) < 0
      b = c;
    elseif f(c)*f(b) < 0
      a = c;
    else
      return
    endif
  endwhile
endfunction