clear; clc; close all;
format long

g = @(x) sqrt((2 - log(x + 2)) ./ x);

x0 = 1;
tol = 1.e-12;
max_it = 150;

[x, res, iter] = puntofisso(g, x0, tol, max_it);

fprintf('Soluzione: %f\n', x);
fprintf('Numero di iterazioni: %d\n', iter);

p = log(res(end))/log(res(end-1));

creaGrafici(res);