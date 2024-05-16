%Examen 2021 convocatoria extraordinaria. Ejercicio 1

close all # <-- borra o comenta a conveniencia

%Resolucion con tabla 1
F1 = @(t,y) tanh(t)*y - (2*t)*y^2/cosh(t);
tini = 0;                 %Tiempo inicial
tfin = 4;                 %Tiempo final
y0 = 1; 
rangot = [tini tfin];
h = 0.5;
N = (tfin - tini)/h;      %Num iteraciones necesarias
# solucion numerica
[t,y] = ode45(F1,rangot,y0);
figure(19);
plot(t,y);
[Tiempo1, y1] = resolveredo_rk_tabla1(F1,rangot,y0,N);
# grafica
figure(20);
plot(Tiempo1,y1);
# solucion exacta
F2 = @(t) cosh(t)/(t^2+1);
yex = zeros(N,1)';
yex(1) = y0;
tex = linspace(rangot(1),rangot(2),N+1)';

for k = 2:N+1
  
  yex(k) = F2(tex(k));
  
endfor
figure(30);
plot(tex,yex);

yex

# orden global tabla 1
Err_anterior = abs(y1(end) - yex(end));
for i = 1:7
  Ni = (tfin - tini)/(h/2^i);
  [Torden1,yorden1] = resolveredo_rk_tabla1(F1,[tini,tfin],yini,Ni);
  Error1 = abs(yorden1(end) - yex(end));
  Orden_tabla1 = Err_anterior/Error1
  Err_anterior = Error1;
endfor


%Resolucion con tabla 2
[Tiempo2, y2] = resolveredo_rk_tabla2(F1,rangot,y0,N);
# grafica
figure(21);
plot(Tiempo2,y2);

# orden global tabla 2
Error_ant2 = abs(y2(end) - yex(end));

for j = 1:7
  Nj = (tfin - tini)/(h/2^j);
  [Torden2,yorden2] = resolveredo_rk_tabla2(F1,[tini,tfin],yini,Nj);
  Error2 = abs(yorden2(end) - yex(end));
  Orden_tabla2 = abs(Error_ant2/Error2)
  Error_ant2 = Error2;
endfor

