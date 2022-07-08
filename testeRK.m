%function y = runge(fun,alpha,a,b,N,grau)
% y = runge(fun,alpha,a,b,N,grau)
%
% METODO RUNGE-KUTTA encontra uma solucao numerica para uma EDO com uma
% dada condicao inicial.
%
% DADOS:
% fun   - funcao string que define y'=f(t,y(t))
% alpha - condicao inicial y(a) = alpha
% [a,b] - intervalo
% N     - numero de passos
% grau  - grau do metodo Runge-Kutta, grau pode ser 2, 3 ou 4.
%         Default grau=4.

h = abs(b-a)/N;

k = 1;
y = alpha;
t = a;
Y(k) = y;
T(k) = t;


    for k = 2:(N+1)
        K1 = feval(fun,t,y);
        K2 = feval(fun,t+h,y+h*K1);
        
        y = y + h/2*[K1 + K2];
        Y(k) = y;
        t = t + h;
        T(k) = t;
    endfor
    
    
    