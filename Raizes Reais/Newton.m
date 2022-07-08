clc;
clear all;
%close all;

%F = @(x)(x.^5 - (10/9).*x.^3 + (5/21).*x);
%dF = @(x)(5.*x.^4 - 3.*(10/9).*x^2 + (5/21));

##F = @(x)(8-4.5*(x-sin(x)));
##dF = @(x)(-4.5*(1-cos(x)));

F = @(x)(x^3 + 3.8*x^2 - 8.6*x - 24.4); % função
dF = @(x)(3*x^2 + 3.8*2*x - 8.6); % Derivada da função


x0 = 4;
Tolerancia = 1e-6;
iMax = 50;

for i = 1:iMax
  xi = x0 - (F(x0)/dF(x0));
  
  if abs(F(x0)) < Tolerancia || abs((xi-x0)/x0) < Tolerancia
    xz = xi;
    break
  endif
  
  x0 = xi;
endfor

fprintf('Solução xz = %.6f com Tolerancia de %f, obtida em %i interações', xz, Tolerancia, i)