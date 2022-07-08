clc; clear all; close all;
x = linspace(-92 , 92 , 10);  % intervalo e amostragem

F = @(x)(sqrt(1+(0.5*(sinh(x/30)).^2)));

LowerLimit = -91
UpperLimit = 91

n = 4e3 %number of intervals
h = (UpperLimit-LowerLimit)/n;

j = LowerLimit:h:UpperLimit;
for i=1:n+1
  K(i)=F(j(i));
endfor
i = h*(K(1)+K(n+1))/2+h*sum(K(2:n))


figure(1);
plot(x,F(x))
grid on;
xlabel('x')
ylabel('F(x)')