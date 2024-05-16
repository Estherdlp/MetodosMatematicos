%Examen convocatoria ordinaria. Ejercicio 3

clear all
close all

### PVF
a = 0.09;
f = @(x) 60*max(0,1-abs(x-1));
h = [0.1 0.05];
rangoxt = [0 4 0 8];
N(1) = (rangoxt(2)-rangoxt(1))/h(1);
N(2) = (rangoxt(4)-rangoxt(3))/h(2);

### solucion del problema
# resolucion numerica
[x,t,u] = Ejercicio3_ep(a,f,rangoxt,N);


# grafica global
figure(31);
imagesc(x,t,u);

# grafica a tiempo final
figure(32);
plot(x(:,end),u(end,:));