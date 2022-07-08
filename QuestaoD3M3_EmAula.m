clc;
clear all;
close all;

%Fu = @(x)(x.^5 - (10/9).*x.^3 + (5/21).*x);
%D1_Fu = @(x)(5.*x.^4 - 3.*(10/9).*x^2 + (5/21));


x = linspace(-1 , 1 , 100); % Intervalo e Quantidade de Amostras
F = x.^5 - (10/9).*x.^3 + (5/21).*x; % Fun��o dependente de X
plot(x,F); % plota o Gr�fico