clc;
clear all;
close all;

%F = @(x)(8-4.5*(x-sin(x)));
F = @(x)(x^2 - e^-x); % função

a = 0;
b = 1;
iMax = 100; % Numero máximo de Ciclos
Tolerancia = 1e-4; % Tolerância

if F(a)*F(b) > 0
  disp('Erro: Este método não é capaz de encontrar F(x)=0 no intervalo definido\n');
elseif F(a)*F(b) == 0
  disp('(F(a) e/ou F(b)) = 0\n');
else
  printf(' i         a           b         PMed       F(PMed)      Erro\n');
  for i = 1:iMax
    PontoMedio = (a+b)/2;
    Erro = (b-a)/2;
    
    printf('%3i %11.6f %11.6f %11.6f %11.6f %11.6f\n', i, a, b, PontoMedio, F(PontoMedio), Erro);
    
    if Erro <= Tolerancia
      printf("Convergiu para: %f Com tolerância de %f \n" , PontoMedio, Tolerancia)
      break
    endif
    
    if F(a)*F(PontoMedio) < 0
      b = PontoMedio;
    else
      a = PontoMedio;
    endif
  endfor
  
  if  i == iMax && Erro > Tolerancia
    printf('Não encontrou resultado, Ciclos esgotaram!\n');
  endif
endif