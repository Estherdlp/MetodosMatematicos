%Ejercicio 2 practica 1 - 06/10/2021
%Esther del Pico Garcia
%Menu para llamar a los metodos

%Definicion de las funciones a calcular
f = @(x) e.^x - x - 2;
g = @(x) x.^2 - x - 1;
h = @(x) x.^3 - 2*x.^2 - x + 2;
u = @(x) x.^10 - 1;
v = @(x) cosh(x) - 1;
w = @(x) x - e.^-x;
df = @(x) e.^x - 1;
dg = @(x) 2*x-1;
dh = @(x) 3*x.^2 - 4*x - 1;
du = @(x) 10*x.^9;
dv = @(x) sinh(x);
dw = @(x) 1 + e.^-x;
funcion_final = [];
metodo_final = [];
derivada = [];
opcionmet = 0;
opcion = 0;

%Se pide por pantalla al usuario el metodo que desee utilizar
printf("Métodos disponibles: \n 1. Biseccion\n 2. Regula falsi\n 3. Newton - Raphson\n 4. Secante\n 5. Punto fijo\n");
do
  opcionmet = input("Por favor, indique el metodo que desee utilizar para el calculo de la raiz: ",'s');
  opcionmetok = true;
  if opcionmet == '1'
    metodo_final = '1';
  elseif opcionmet == '2'
    metodo_final = '2';
  elseif opcionmet == '3'
    metodo_final = '3';
  elseif opcionmet == '4'
    metodo_final = '4';
  elseif opcionmet == '5'
    metodo_final = '5';
  else 
    opcionmetok = false;
  endif
until (opcionmetok)

%Se muestran las funciones a calcular
printf("Funciones a calcular: \n 1. %s\n 2. %s\n 3. %s\n 4. %s\n 5. %s\n 6. %s\n", func2str(f), func2str(g), func2str(h), func2str(u), func2str(v), func2str(w));

%Se pide al usuario que escoja la funcion que desee calcular
do
  opcion = input("Por favor, indique la funcion que desee calcular: ",'s');
  opcionok = true;
  if opcion == '1'
    funcion_final = f;
    derivada = df;
  elseif opcion == '2'
    funcion_final = g;
    derivada = dg;
  elseif opcion == '3'
    funcion_final = h;
    derivada = dh;
  elseif opcion == '4'
    funcion_final = u;
    derivada = du;
  elseif opcion == '5'
    funcion_final = v;
    derivada = dv;
  elseif opcion == '6'
    funcion_final = w;
    derivada = dw;
  else 
    opcionok = false;
  endif
until (opcionok)
    
%Se pide al usuario que introduzca los puntos y la tolerancia
a = input("Por favor, indique el punto de partida (a): ");
if (metodo_final == '1' || metodo_final == '2');
  b = input("Por favor, indique el punto final (b): ");
endif
Tol = input("Por favor, indique la tolerancia: ");

%Se llama a la funcion del metodo escogido y se pasan como parametros de entrada las elecciones del usuario
if metodo_final == '1'
  biseccion(funcion_final,a,b,Tol);
elseif metodo_final == '2'
  regula(funcion_final,a,b,Tol);
elseif metodo_final == '3'
  newton(funcion_final,derivada,a,Tol);
elseif metodo_final == '4'
  secante(funcion_final,a,Tol);
elseif metodo_final == '5'
  punto_fijo(funcion_final,a,Tol);
endif