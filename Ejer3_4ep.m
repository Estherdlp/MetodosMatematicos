%Ejercicio 4 practica 3 - 14/06/2022
%Esther del Pico Garcia

#Suposicion 1
a = 0.1;
z = @() 0; # funcion nula (para despues)
phi = @(x,t) exp (-x ^ 2 / 2);# <- fuente
rango = [-3, 3, 0, 6];
divs = [30 30];

#Solucion y grafica
[x,t,u] = resolvercalor_eulerprogen(a,phi,rango,divs);
figure(); imagesc(x,t,u)

#Suposicion 2
a = 0.1;
z = @() 0; # funcion nula (para despues)
phi = @(x,t) exp (-x ^ 2 / 2);# <- fuente
rango = [-3, 3, 0, 6];
divs = [30 60];

#Solucion y grafica
[x,t,u] = resolvercalor_eulerprogen(a,phi,rango,divs);
figure(); imagesc(x,t,u)

#Suposicion 3
a = 0.1;
z = @() 0; # funcion nula (para despues)
phi = @(x,t) exp (-x ^ 2 / 2);# <- fuente
rango = [-3, 3, 0, 6];
divs = [60 30];

#Solucion y grafica
[x,t,u] = resolvercalor_eulerprogen(a,phi,rango,divs);
figure(); imagesc(x,t,u)

#Suposicion 4
a = 0.2;
z = @() 0; # funcion nula (para despues)
phi = @(x,t) exp (-x ^ 2 / 2);# <- fuente
rango = [-3, 3, 0, 6];
divs = [30 30];

#Solucion y grafica
[x,t,u] = resolvercalor_eulerprogen(a,phi,rango,divs);
figure(); imagesc(x,t,u)