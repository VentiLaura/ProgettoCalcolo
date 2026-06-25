clear; clc; close all;
format long

% Zero di f(x) = x^3 + log(x+2) - 2
g = @(x) sqrt((2 - log(x + 2)) ./ x);

x0 = 1;
tol = 1.e-12;
max_it = 150;

[x, res, iter] = puntofisso(g, x0, tol, max_it);

x
iter

figure()
semilogy(res, 'b.-')
xlabel('iter'); ylabel('residuo'); grid on
title('Decrescita del Residuo');

C_reale = res(2:end) ./ res(1:end-1);

figure()
plot(C_reale, 'r.-')
xlabel('iter'); ylabel('Fattore C (res_{n}/res_{n-1})'); grid on
title('Verifica del Fattore di Conversione Reale');


p = log(res(end))/log(res(end-1))
