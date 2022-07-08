clc;
clear all;

TempK = 298.15
xM = 3.33e-2

C = xM*TempK*8.0656;
X = [1 2 -C];

max(round(roots(X)))