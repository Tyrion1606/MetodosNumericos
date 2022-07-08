clc;
clear all;

A = [4 , 3 , 2 ; 1 , 3 , 1 ; 2 , 1 , 3]; % MATRIZ
b = [960 510 610]; % Termos Independentes
n = 3; % Tamanho da matriz quadrada A

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

disp(A);
disp(' ');
disp(b);
disp(' ');


x(n) = b(n)/A(n/n); % Define o ultimo coeficiente

%com base no coeficiente obtido, podemos obter os demais:
for c = n-1 : -1 : 1
  t=0;
  for h = c+1 : n
    t = t+A(c,h)*x(h);
  endfor
  x(c) = (b(c)-t) / A(c,c);
endfor

disp(x);































