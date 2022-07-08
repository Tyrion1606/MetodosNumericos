clc;
clear all;

A = [4 , 3 , 2 ; 1 , 3 , 1 ; 2 , 1 , 3]; % MATRIZ
b = [960 510 610]; % Termos Independentes
n = 3; % Tamanho da matriz quadrada A

M = horzcat(A,b')

for k = 1 : n-1 % Percorre TODAS as Colunas a serem a serem ZERADAS
  % Encontrar o Maior Valor e guardar sua posição em 'L'
  [Maximo, Pos] = max(abs(M(k:n,k)));
  l = Pos + k-1;
  % colocá-lo Como pivô (no topo para facilitar a vizualização humana)
  if l ~= k
    for j = k : n+1
      aux = M(l,j);
      M(l,j) = M(k,j);
      M(k,j) = aux;
    endfor
    % Troca também a posição dos termos independentes
    aux = b(l);
    b(l) = b(k);
    b(k) = aux;
  endif
##  M(k,k)
##  M(k,:) /= M(k,k)
  
  % Aplicar a formula de GAUSS em toda a linha, repetindo o processo para todas as linhas
  for i = k+1 :n
    mult = M(i,k) / M(k,k);
    %A(i,k) = 0;
    for j = k : n+1
      M(i,j) = M(i,j) - mult * M(k,j);
    endfor
    b(i) = b(i) - mult * b(k);
  endfor
endfor
M