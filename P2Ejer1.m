%Ejercicio 1 practica 2 - 04/11/2021
%Esther del Pico Garcia

%Apartado a
F1 = @(t,y) ((y + log(1+t^2))/t) - ((2*t)/(1+t^2))  %Declaracion de la funcion

ode45(F1,[0.5,3],0.225);                            %Llamada a la funcion declarada anteriormente, intervalo de tiempos, valor inicial
[t,y]= ode45 (F1,[0.5,3],0.225)

%Apartado b
F2 = @(t,y) [y(1) - y(2), y(1) + y(2) - sin(t)]     %Declaracion de la funcion, siendo x = y(1) e y = y(2)

ode45(F2, [0,4],[1,2])                              %Llamada a la funcion declarada anteriormente, intervalo de tiempos, valor inicial
[t2,y2] = ode45(F2, [0,4],[1,2])

%Apartado c
F3 = @(t,y) [y(2), (y(2) - 1/y(2))/(2*t)]           %Hacemos el cambio de variable y = x', despejamos y' y despues hacemos
                                                    %la matriz de las derivadas parciales con respecto al tiempo, y esa es la
                                                    %definicion de nuestra funcion F3.
ode45(F3,[1,4],[2,3])
[t3,y3] = ode45(F3,[1,4],[2,3])