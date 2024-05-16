close all
clear all

% REEMPLAZAR ode45 CON resolveredo_<metodo>
% Y AÑADIR NUMERO DE PASOS
% resolveredo_euler(f, tspan, y0, N)


% EXPERIMENTO 1
f1 = @(t,y) 4*exp(.8*t)-.5*y; % EDO lineal
yf = @(t) exp(-.5*t);         % solucion fundamental
yp = @(t) 4/1.3*exp(.8*t);    % solucion particular
yg = @(t,t0,y0) (y0-yp(t0))*yf(t-t0) + yp(t); % sol. general

tini = 2; yini = 4;           % condicion inicial
tfin = 5;                     % tiempo final
[Tiempo, y] = heunmod_edo(f1,[tini,tfin],yini,20); % sol. numerica

for i=1:length(Tiempo)
  yv(i,:) = yg(Tiempo(i,:),tini,yini); % solucion exacta
endfor
Err1 = norm(y(end,:)-yv(end,:),inf);      % error global (verdadero)
printf("Valor propuesto para tiempo %s: %s\nError verdadero: %s\n",num2str(Tiempo(end)),num2str(y(end)),num2str(Err1));
figure;
plot(Tiempo,[y,yv]);


% EXPERIMENTO 2
f2 = @(t,y) (1-2*t*y).*y/t % EDO Bernoulli
C  = @(t,y) (1-t*y)*t/y;   % parametro en funcion de cond. ini.
yg2 = @(t,t0,y0) t./(C(t0,y0)+t.^2); % sol. gen.

tini2 = 1; yini2 = -0.1; % condicion inicial
tfin2 = 3;              % tiempo final
[Tiempo2, y2] = heunmod_edo(f2, [tini2,tfin2], yini2,20); % sol. numerica

for j=1:length(Tiempo2)
  yv2(j,:) = yg2(Tiempo2(j,:),tini2,yini2); % solucion exacta
endfor
Err2 = norm(y2(end,:)-yv2(end,:),inf);    % error global (verdadero)
printf("Valor propuesto para tiempo %s: %s\nError verdadero: %s\n",num2str(Tiempo2(end)),num2str(y2(end)),num2str(Err2));
figure;
plot(Tiempo2,[y2,yv2]);