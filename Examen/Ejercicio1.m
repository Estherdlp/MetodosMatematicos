%Examen convocatoria ordinaria. Ejercicio 1

close all
clear all

%Apartado a

F1 = @(t,y) (y/(1+2*t) * (4 - (y*exp(t))/(1+2*t)));

[t1,y1] = ode45(F1,[0,1],5);
figure(1);
plot(t1,y1);

%Apartado b

F2 = @(t,y) [10*( y(2) - y(1) ); y(1) * (28 - y(3) ) - y(2); y(1) * y(2) - y(3) * 8/3];   %y(1) es x, y(2) es y, y(3) es z

[t2,y2] = ode45(F2,[0,20],[1,1,1]);
figure(2);
plot(y2(:,1),y2(:,3));