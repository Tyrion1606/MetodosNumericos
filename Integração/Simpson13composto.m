clc; clear all;F = @(x)(sqrt(1+(0.476454*(sinh(x/30.38).^2))));LowerLimit = -91.21UpperLimit = 91.21n = 20 %number of intervalsh = (UpperLimit-LowerLimit)/n;Total = F(LowerLimit)+F(UpperLimit);for i = 1:2:n-1  Total = Total + 4*F(LowerLimit+i*h)endforfor i = 2:2:n-2  Total = Total + 2*F(LowerLimit+i*h)endforIntegral = h/3*Total*3.28%Davi Monteiro Alves 16/0049156 - 17/04/2021