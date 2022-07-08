clc;
clear all;

A = [4 , 3 , 2 ; 1 , 3 , 1 ; 2 , 1 , 3]
R = [4 , 3 , 2 ; 0 , 9/4 , 1/2 ; 0 , 0 , 19/9]
b = [960 510 610];

n = 3; % Tamanho da matriz quadrada

for k = 1 : n-1 % Percorre TODAS as k a serem ZERADAS
  
  % ESCOLHER O PIVÔ
  max = abs(A(k,k)); % Guarda o Elemento Pivô em valor absoluto
  l = k; % Guarda a Linha do pivô
  for i = k+1 : n
    if abs(A(i,k)) > max
      max = abs(A(i,k));
      l = i;
    endif
  endfor
  
  if l ~= k
    for j = k : n
      aux = A(l,j);
      A(l,j) = A(k,j);
      A(k,j) = aux;
    endfor
    aux = b(l);
    b(l) = b(k);
    b(k) = aux;
  endif
  
  for i = k+1 :n
    mult = A(i,k) / A(k,k);
    A(i,k) = 0;
    for j = k+1 : n
      A(i,j) = A(i,j) - mult * A(k,j);
    endfor
    b(i) = b(i) - mult * b(k);
  endfor
endfor
disp(A);
disp(b);