%Examen 2021 convocatoria extraordinaria. Ejercicio 3

clear all
close all # <-- borra o comenta a conveniencia

F1 = @(x,t) (2 - abs(x-2));
tini = 0;
tfin = 4;
xini = 0;
xfin = 4;
rangoxt = [tini tfin xini xfin];
h = [1 0.5];
c = 1;
N(1) = (rangoxt(2) - rangoxt(1))/h(1);
N(2) = (rangoxt(4) - rangoxt(3))/h(2);


[x,t,u] = resolveredp_onda(c,F1,rangoxt,N);

# grafica global
figure(31);
imagesc(x,t,u);
