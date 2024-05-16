%close all # <-- borra o comenta a conveniencia

### PVI (1)
F1 = @(t,y) y/(1+2*t)*(4-y/(1+2*t)*exp(t));
tini = 0;
tfin = 1;
yini = 5;
h = 0.2;
N = (tfin - tini)/h;
[Tiempo, y1] = Ejercicio2_tabla2(F1,[tini,tfin],yini,N);
[Tode,yode] = ode45(F1,[tini tfin],yini);
figure(21);
plot(Tiempo,y1);
figure(22);
plot(Tode,yode);
# solucion exacta
F2 = @(t) (1+2*t).^2./(exp(t)-0.8);
y = F2(1);

# orden
Err1 = y1(end,:) - y     %Error global h
Err_anterior = Err1;

for i = 1:10
  Ni = (tfin - tini)/(h/2^i);
  [To,yo] = Ejercicio2_tabla2(F1,[tini,tfin],yini,Ni);
  Err = yo(end) - y;
  Orden = Err_anterior/Err
  Err_anterior = Err;
endfor
figure(23);
plot(To,yo);