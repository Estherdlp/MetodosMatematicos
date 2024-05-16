%close all # <-- borra o comenta a conveniencia

### PVI (1)
F1 = @(t,y) y/(1+2*t)*(4-y/(1+2*t)*exp(t));
tini = 0;
tfin = 1;
yini = 5;
h = 0.5;
N = (tfin - tini)/h;
[Tiempo, y1] = Ejercicio2_tabla1(F1,[tini,tfin],yini,N);
figure(20);
plot(Tiempo,y1);
hold on;

# solucion exacta
F2 = @(t) (1+2*t).^2./(exp(t)-0.8);
y = F2(1);


# orden
Err1 = y1(end,:) - y;     %Error global h
Err_anterior = Err1;
for i = 1:10
  Ni = (tfin - tini)/(h/2^i);
  [Torden,yorden] = Ejercicio2_tabla1(F1,[tini,tfin],yini,Ni);
  Err = yorden(end) - y;
  Orden = Err_anterior/Err
  Err_anterior = Err;
endfor
