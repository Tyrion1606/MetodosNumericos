clc;
clear all;
%close all;

%F = @(x)(x.^5 - (10/9).*x.^3 + (5/21).*x);
%F = @(x)(8-4.5*(x-sin(x)));
%F = @(x)(x^3 + 3.8*x^2 - 8.6*x - 24.4);

F = @(x)(2*x^3 - 11.7*x^2 + 17.7*x - 5); % função
a = 0;
b = 1;
Tolerancia = 1e-3;
iMax = 50;

for i = 1:iMax
  xi = b - F(b)*(a-b)/(F(a)-F(b));
  
  if abs(F(xi)) < Tolerancia || abs((xi-b)/b) < Tolerancia
    xz = xi;
    break
  endif
  a = b;
  b = xi;
endfor

fprintf('Solução xz = %.6f com Tolerancia de %f, obtida em %i interações', xz, Tolerancia, i)