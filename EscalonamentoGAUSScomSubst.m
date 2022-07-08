clc;
clear all;

A = [4 , 3 , 2 ; 1 , 3 , 1 ; 2 , 1 , 3]; % MATRIZ
b = [960 510 610]; % Termos Independentes
n = 3; % Tamanho da matriz quadrada A

M = horzcat(A,b')

for k = 1 : n-1 % Percorre TODAS as Colunas a serem a serem ZERADAS
  % Encontrar o Maior Valor e guardar sua posição em 'L'
  [Maximo, Pos] = max(abs(A(k:n,k)));
  l = Pos + k-1;
  % colocá-lo Como pivô (no topo para facilitar a vizualização humana)
  if l ~= k
    for j = k : n
      aux = A(l,j);
      A(l,j) = A(k,j);
      A(k,j) = aux;
    endfor
    % Troca também a posição dos termos independentes
    aux = b(l);
    b(l) = b(k);
    b(k) = aux;
  endif
  
  % Aplicar a formula de GAUSS em toda a linha, repetindo o processo para todas as linhas
  for i = k+1 :n
    mult = A(i,k) / A(k,k);
    %A(i,k) = 0;
    for j = k : n
      A(i,j) = A(i,j) - mult * A(k,j);
    endfor
    b(i) = b(i) - mult * b(k);
  endfor
endfor
horzcat(A,b')

x(n) = b(n)/A(n,n); % Define o ultimo coeficiente

%com base no coeficiente obtido, podemos obter os demais:
for i = n-1 : -1 : 1
  s=0;
  for j = i+1 : n
    s = s + A(i,j)*x(j);
  endfor
  x(i) = (b(i)-s) / A(i,i);
endfor

disp(x);































