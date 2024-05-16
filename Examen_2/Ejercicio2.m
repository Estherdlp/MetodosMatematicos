%Examen 2021 convocatoria extraordinaria. Ejercicio 2

close all
clear all

%Apartado a
F1 = @(t,y) [y(2); cos(t) - 0.5*y(2) + y(1) - 2*y(1)^3];   %y(1) es x, y(2) es y, y(3) es z
N = 500;
rangot = [0 100];
y0 = [-1 1];

[Tiempo1, y1] = resolveredo_rk_tabla1(F1,rangot,y0,N);
[Tiempo2, y2] = resolveredo_rk_tabla2(F1,rangot,y0,N);
[Tiempo3, y3] = ode45(F1,rangot,y0);
figure(1);
plot(Tiempo1, y1(:,1));
figure(2);
plot(Tiempo2, y2(:,1));
figure(3);
plot(Tiempo3, y3(:,1));