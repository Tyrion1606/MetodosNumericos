yVector = y
uVector = u
h = 0.002

n = length(uVector);

for i = 1 : n-2
    dx(i) = (-3*u(i)+4*u(i+1)-u(i+2))/2*h;
endfor
