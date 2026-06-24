clear; clc; close all;
format long

% Zero di f(x) = x^3 + log(x+2) - 2
% g(x) = exp(2-x^3) - 2
% g'(x*) = -8.38  ->  |g'(x*)|>1: NON e' una contrazione, il metodo diverge
% (vedi slide 15: non tutte le funzioni di punto fisso sono utili)
g = @(x) exp(2-x.^3)-2;

x0 = 1;
tol = 1.e-12;
max_it = 40;

[x, res, iter] = puntofisso(g, x0, tol, max_it);

x
iter

figure()
semilogy(res, 'b.-')
xlabel('iter'); ylabel('residuo'); grid on
title('g_2 non converge: il residuo non scende sotto tol')

% Il residuo si stabilizza intorno a ~2.2e4 (x oscilla tra -2 e ~22024)
% senza mai scendere sotto tol: qui la stima dell'ordine p non avrebbe senso.
