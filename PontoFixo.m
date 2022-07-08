clc;
clear all;
%close all;

F = @(x)(exp(x)-4*x.^2); % fun��o
G = @(x)(0.5*exp(0.5*x));

xi = 0.5; % x0
Tolerancia = 1e-3;
iMax = 50;

for i = 1:iMax
  if abs(F(G(xi))) < Tolerancia
    xz = G(xi);
    break
  endif
  xi = G(xi);
endfor

fprintf('Solu��o xz = %.6f com Tolerancia de %f, obtida em %i intera��es', xz, Tolerancia, i)