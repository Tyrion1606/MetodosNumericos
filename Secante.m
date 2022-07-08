clc;
clear all;
close all;

%F = @(x)(x.^5 - (10/9).*x.^3 + (5/21).*x);

F = @(x)(8-4.5*(x-sin(x))); % função
a = 2;
b = 3;
Tolerancia = 1e-5;
iMax = 50;

for i = 1:iMax
  xi = b - F(b)*(a-b)/(F(a)-F(b));
  
  if abs(F(xi)) < Tolerancia || abs(xi-b)/b < Tolerancia
    xz = xi;
    break
  endif
  a = b;
  b = xi;
endfor

fprintf('Solução xz = %.6f com Tolerancia de %f, obtida em %i interações', xz, Tolerancia, i)