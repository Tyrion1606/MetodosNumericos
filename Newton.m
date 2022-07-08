clc;
clear all;
close all;

%F = @(x)(x.^5 - (10/9).*x.^3 + (5/21).*x);
%dF = @(x)(5.*x.^4 - 3.*(10/9).*x^2 + (5/21));

F = @(x)(8-4.5*(x-sin(x))); % fun��o
dF = @(x)(-4.5*(1-cos(x))); % Derivada da fun��o
x0 = 2.5;
Tolerancia = 1e-5;
iMax = 50;

for i = 1:iMax
  xi = x0 - (F(x0)/dF(x0));
  
  if abs(F(x0)) < Tolerancia || abs(xi-x0)/x0 < Tolerancia
    xz = xi;
    break
  endif
  
  x0 = xi;
endfor

fprintf('Solu��o xz = %.6f com Tolerancia de %f, obtida em %i intera��es', xz, Tolerancia, i)