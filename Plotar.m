clc;
clear all;
close all;

x = linspace(-1 , 1 , 50);  % intervalo e amostragem
%F = @(x)(exp(x)-4*x.^2); % função
%F = @(x)((1+0.4764*(sinh(x/30.38)^2))^(1/2));
F = @(x)(211.5-20.97*cosh(x/30.38));


figure(1);
plot(x,F(x))
grid on;
xlabel('x')
ylabel('F(x)')