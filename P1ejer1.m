%Ejercicio 1 practica 1 - 06/10/2021
%Esther del Pico Garcia
function [] = P1ejer1()
  %Apartado A

  f = @(x) sin(x) - log(x);                     %Guardamos la funcion
  printf("EJERCICIO 1 APARTADO A\nPara la funcion %s , las raices son: \n", func2str(f))
  fplot(f,[0,3])                                %Dibujar grafica
  %Resolver la funcion para x=1,x=2 y x=3
  for i=1:3                  
    sol_1A=fsolve(f,i);           
    printf("El resultado para x=%s es: %s\n",num2str(i),num2str(sol_1A));
  endfor

  printf("\n-------------------------------------------------\n");
  
  %Apartado B

  F = @(X) [X(1)^2+X(2)^2-4;X(1)^3-X(2)^3-2];    %Guardamos la funcion. X(1) es x y X(2) es y en el sistema de ecuaciones
  printf("EJERCICIO 1 APARTADO B\nPara el sistema de ecuaciones: %s \n", func2str(F));
  for j=0:2
    sol_1B = fsolve(F,[j,j]);                    %Resolucion del ejercicio para los valores (0,0) y (1,1)
    printf("El resultado para x=%s y y=%s es: %s\n",num2str(j),num2str(j),num2str(sol_1B));
  endfor
  printf("\n-------------------------------------------------\n");
    
endfunction                               