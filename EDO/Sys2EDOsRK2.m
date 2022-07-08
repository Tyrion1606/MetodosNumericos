clc; clear all; close all;

%EDO1 = @(x,y,z)((-y+z).*exp(1-x)+0.5.*y);
%EDO2 = @(x,y,z)(y-z^2);

EDO1 = @(x,y,z)(z.*x-y);
EDO2 = @(x,y,z)(y.*x+z);

x(1) = 0
xn = 1.2
h = 0.1

y(1) = 0.5
z(1) = 1

n = (xn-x(1))/h;

for i = 1:n
    x(i+1) = x(i) + h;
    
    Ky1 = EDO1(x(i),y(i),z(i));
    Kz1 = EDO2(x(i),y(i),z(i));
    
    Ky2 = EDO1(x(i+1),+y(i)+Ky1*h,z(i)+Kz1*h);
    Kz2 = EDO2(x(i+1),+y(i)+Ky1*h,z(i)+Kz1*h);
    
    y(i+1) = y(i) + (Ky1 + Ky2)*h/2;
    z(i+1) = z(i) + (Kz1 + Kz2)*h/2;
endfor


figure(1);
plot(x,y,x,z)
grid on;
