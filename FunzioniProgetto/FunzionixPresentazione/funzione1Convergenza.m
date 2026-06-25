clear; clc; close all;
format long

g = @(x) nthroot(-log(x+2)+2, 3);

x0 = 1;
tol = 1.e-12; 
max_it = 226;

[x, res, iter] = puntofisso(g, x0, tol, max_it);

fprintf('Soluzione: %.12g\n', x);
fprintf('Numero di iterazioni: %d\n', iter);

p = log(res(end))/log(res(end-1))

creaGrafico(res);