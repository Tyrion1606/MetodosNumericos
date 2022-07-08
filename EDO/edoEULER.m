clc;clear all;close all;

X(1) = 0; %Primeiro Valor de x
B = 4;    %Ultimo Valor de x
H = 0.1;  %Passo de integração
Y(1) = 1; %Valor Inicial
N = (B-X(1))/H;

F = @(X,Y)(-2*X^3+12*X^2-20*X+8.5); % EDO dependente de x e y

for i = 1:N
  X(i+1) = X(i) + H;
  Y(i+1) = Y(i) + F(X(i),Y(i))*H;
endfor

plot(X,Y) % Y(x) é a função RESPOSTA para a EDO F(x,y)