clc; clear all; close all;

pkg load signal;
pkg load nan;

Frequencia_Amostragem = e^9;
t = linspace(0,0.001,Frequencia_Amostragem);

##====================================================================================
% Senoide:
##====================================================================================
Frequencia_Sinal_Senoide = 1000;
Amplitude_Sinal_Senoide = 2.5;
Valor_Medio_Senoide = 0.5;
Senoide = Valor_Medio_Senoide + Amplitude_Sinal_Senoide * sin(2*pi*Frequencia_Sinal_Senoide*t);
Linha_Valor_Medio_Senoide = linspace(Valor_Medio_Senoide,Valor_Medio_Senoide,Frequencia_Amostragem);
Vrms_Senoide = rms(Senoide)
Linha_RMS_Senoide = linspace(Vrms_Senoide,Vrms_Senoide,Frequencia_Amostragem);

figure(1);
title("Senoide");
hold on;
plot(t, Senoide,'r',"linewidth",2);
plot(t, Linha_Valor_Medio_Senoide,'k',"linewidth",2);
plot(t, Linha_RMS_Senoide,'b',"linewidth",2);
plot(t, linspace(0,0,Frequencia_Amostragem),':k',"linewidth",1);

Legend_Figure_1_Media = strcat("Valor Médio = ", num2str(mean(Senoide),4));
Legend_Figure_1_RMS = strcat("RMS = ", num2str(Vrms_Senoide,4));
L1 = legend ("Onda Senoidal", Legend_Figure_1_Media, Legend_Figure_1_RMS);
set (L1, "fontsize", 20);

hold off;

##====================================================================================
% Quadrada:
##====================================================================================
Frequencia_Sinal_Quadrada = 15000;
Amplitude_Sinal_Quadrada = 2;
Valor_Medio_Quadrada = 1;

Quadrada = Valor_Medio_Quadrada + Amplitude_Sinal_Quadrada * square(2*pi*Frequencia_Sinal_Quadrada*t);
Linha_Valor_Medio_Quadrada = linspace(Valor_Medio_Quadrada,Valor_Medio_Quadrada,Frequencia_Amostragem);
Vrms_Quadrada = rms(Quadrada)
Linha_RMS_Quadrada = linspace(Vrms_Quadrada,Vrms_Quadrada,Frequencia_Amostragem);

figure(2);
hold on;
plot(t, Quadrada,'r',"linewidth",2);
plot(t, Linha_Valor_Medio_Quadrada,'k',"linewidth",2);
plot(t, Linha_RMS_Quadrada,'b',"linewidth",2);
plot(t, linspace(0,0,Frequencia_Amostragem),':k',"linewidth",1);

Legend_Figure_2_Media = strcat("Valor Médio = ", num2str(mean(Quadrada),4));
Legend_Figure_2_RMS = strcat("RMS = ", num2str(Vrms_Quadrada,4));
L2 = legend ("Onda Quadrada", Legend_Figure_2_Media, Legend_Figure_2_RMS);
set (L2, "fontsize", 20);

hold off;

##====================================================================================
% Triangular:
##====================================================================================
Frequencia_Sinal_Triangular = 4000;
Amplitude_Sinal_Triangular = 3;
Valor_Medio_Triangular = 0;

Triangular = Valor_Medio_Triangular + Amplitude_Sinal_Triangular * sawtooth(2*pi*Frequencia_Sinal_Triangular*t,0.5);
Linha_Valor_Medio_Triangular = linspace(Valor_Medio_Triangular,Valor_Medio_Triangular,Frequencia_Amostragem);
Vrms_Triangular = rms(Triangular)
Linha_RMS_Triangular = linspace(Vrms_Triangular,Vrms_Triangular,Frequencia_Amostragem);

figure(3);
hold on;
plot(t, Triangular,'r',"linewidth",2);
plot(t, Linha_Valor_Medio_Triangular,'k',"linewidth",2);
plot(t, Linha_RMS_Triangular,'b',"linewidth",2);
plot(t, linspace(0,0,Frequencia_Amostragem),':k',"linewidth",1);

Legend_Figure_3_Media = strcat("Valor Médio = ", "0"); %%%%% MODIFICADO PARA APRESENTAÇÃO, DESFAZER MUDANÇA SE FOR USAR: TROCAR "0" POR num2str(mean(Triangular),0).
Legend_Figure_3_RMS = strcat("RMS = ", num2str(Vrms_Triangular,4));
L3 = legend ("Onda Triangular", Legend_Figure_3_Media, Legend_Figure_3_RMS);
set (L3, "fontsize", 20);

hold off;

##====================================================================================
##               TODAS SOBREPOSTAS
##====================================================================================

figure(4);
hold on;
plot(t, Senoide,'r',"linewidth",2);
plot(t, Quadrada,'g',"linewidth",2);
plot(t, Triangular,'b',"linewidth",2);
plot(t, linspace(0,0,Frequencia_Amostragem),':k',"linewidth",1);

L4 = legend ("Senoide", "Quadrada", "Triangular");
set (L3, "fontsize", 20);

hold off;

##====================================================================================
##               MEDIA REAL
##====================================================================================

printf("-----------\n");
printf("Média Senoide: %.4f\n",mean(Senoide));
printf("Média Quadrada: %.4f\n",mean(Quadrada));
printf("Média Triangular: %.4f\n",mean(Triangular));