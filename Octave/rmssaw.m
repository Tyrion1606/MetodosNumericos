clc; clear all; close all;

pkg load signal;
pkg load nan;
A = 3;
F = 4;
T = 1/F;
X = 0:T/1000:2*T;
Y = A*sawtooth(0.5);
plot(X, Y+1)
VRMS = rms(Y);
VRMS