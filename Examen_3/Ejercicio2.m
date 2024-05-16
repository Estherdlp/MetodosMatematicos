%Examen 2021 convocatoria ordinaria. Ejercicio 2

clear all
close all # <-- borra o comenta a conveniencia

%Apartado a
F1 = @(t,y) [y(1) - .2*y(1)*y(2); .1*y(1)*y(2) - 3*y(2)];      %y(1) es x, y(2) es y      
N = 200;                                                        %Num iteraciones
rangot = [0 50];                                                %Intervalo tiempos
y0 = [50 10];                                                   %Valores iniciales
# solucion numerica
[t,y] = ode45(F1,rangot,y0);
# grafica
%figure(1);
%plot(t,y);

[Tiempo1, y1] = resolveredo_rk_tabla1(F1,rangot,y0,N);
[Tiempo2, y2] = resolveredo_rk_tabla2(F1,rangot,y0,N);
figure(2);
plot(Tiempo1,y1);
figure(3);
plot(Tiempo2,y2);