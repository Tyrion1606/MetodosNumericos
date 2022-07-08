clc; clear all;

A = [55 , 0 , 1 ; 75 , 1 , -1 ; 60 , -1 , 0]; % MATRIZ
b = [499.55 687.75 528.60]; % Termos Independentes
n = 3; % Tamanho da matriz quadrada A
M = horzcat(A,b');

disp('A matriz M é:'); disp(M); disp('')

[m,n] = size(M);  % obtem as dimensões da matriz M
for j = 1 : m-1
  for z = 2 : m
    if M(j,j) == 0
      t = M(1,:) ; M(1,:) = M(z,:);
      a(z,:) = t;
    endif
  endfor
  for i = j+1 : m
    M(i,:) = M(i,:) - M(j,:)*(M(i,j)/M(j,j));
  endfor
endfor

for j = m : -1 : 2
  for i = j-1 : -1 : 1
    M(i,:) = M(i,:) - M(j,:)*(M(i,j)/M(j,j));
  endfor
endfor
  % NORMATIZA A DIAGONAL PRINCIPAL
for s = 1  : m
  M(s,:) = M(s,:)/M(s,s);
  x(s) = M(s,n);  
endfor
disp('A matriz DIAGONALIZADA é:'); disp(M); disp('')
fprintf('Os coeficientes são a = %f R = %f e T = %f\n', x(1), x(2),x(3));