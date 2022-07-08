clc; clear all; close all;
format long
X = pi/3;
Res = 0;
for i= 0:5
  if (i/2 == 0)
    Res += (X^(2*i)) / factorial(2*i)
  else
    Res -= (X^(2*i)) / factorial(2*i)
  endif
endfor