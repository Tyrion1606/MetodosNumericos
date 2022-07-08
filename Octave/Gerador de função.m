clc; clear all; close all;

pkg load signal;
pkg load nan;

Frequencia_Amostragem = 1000;
t = [0:1/Frequencia_Amostragem:1];

senoide = sin(2*pi*1000*t);
plot(t, senoide);