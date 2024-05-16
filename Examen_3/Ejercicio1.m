%Examen 2021 convocatoria ordinaria. Ejercicio 1

clear all
close all # <-- borra o comenta a conveniencia

### PVI (1)
F1 = @(t,y) tanh(t)*y - (2*t*y^2)/(cosh(t));
tini = 0;
tfin = 4;
yini = 1;
h = 0.5;
N = (tfin - tini)/h;
printf("Numero de iteraciones %d",N);
[t,y] = ode45(F1,[tini tfin],yini);
[Tiempo1, y1] = resolveredo_rk_tabla1(F1,[tini,tfin],yini,N);
[Tiempo2, y2] = resolveredo_rk_tabla2(F1,[tini,tfin],yini,N);
figure(20);
plot(t,y);
figure(21);
plot(Tiempo1,y1);
figure(22);
plot(Tiempo2,y2);

# solucion exacta
F2 = @(t) cosh(t)/(1 + t^2);
y = F2(4);
# orden tabla 1
Error_ant = abs(y1(end) - y);

for n = 1:7
  N = (tfin - tini)*(2^n)/h;
  [Tiempob2, yb] = resolveredo_rk_tabla1(F1,[tini,tfin],yini,N);
  Error = yb(end) - y;
  Orden_tabla1 = abs(Error_ant/Error)
  Error_ant = Error;
endfor

# orden tabla 2
Error_ant2 = abs(y2(end) - y);

for i = 1:7
  N = (tfin - tini)*(2^i)/h;
  [Tiempob2, yb2] = resolveredo_rk_tabla2(F1,[tini,tfin],yini,N);
  Error2 = yb2(end) - y;
  Orden_tabla2 = abs(Error_ant2/Error2)
  Error_ant2 = Error2;
endfor

