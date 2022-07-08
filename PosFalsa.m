clc;
clear all;
close all;

F = @(x)(8-4.5*(x-sin(x))); % fun��o

a = 2;
b = 3;
iMax = 20; % Numero m�ximo de Ciclos
Tolerancia = 1e-3; % Toler�ncia

Fa = F(a);
Fb = F(b);

if F(a)*F(b) > 0
  disp('Erro: Este m�todo n�o � capaz de encontrar F(x)=0 no intervalo definido\n');
elseif F(a)*F(b) == 0
  disp('(F(a) e/ou F(b)) = 0\n');
else
  printf(' i         a           b       ZeroReta   F(ZeroReta)    Erro\n');
  for i = 1:iMax
    ZeroReta = (a*Fb-b*Fa) / (Fb-Fa);
    Erro = (b-a)/2;
    
    printf('%3i %11.6f %11.6f %11.6f %11.6f %11.6f\n', i, a, b, ZeroReta, F(ZeroReta), Erro);
    
    if Erro <= Tolerancia
      printf("Convergiu para: %f Com toler�ncia de %f \n" , ZeroReta, Tolerancia)
      break
    endif
    
    if F(a)*F(ZeroReta) < 0
      b = ZeroReta;
    elseif F(a)*F(ZeroReta) > 0
      a = ZeroReta;
    else
      
    endif
  endfor
  
  if  i == iMax && Erro > Tolerancia
    printf('N�o encontrou resultado, Ciclos esgotaram!\n');
  endif
endif