clear; clc; close all;
format long

% Zero di f(x) = x^3 + log(x+2) - 2
% g ricavata isolando x^3 = -log(x+2)+2 e prendendo la radice cubica
% g'(x*) = -0.119  ->  |g'(x*)|<1: contrazione, convergenza lineare prevista
g = @(x) nthroot(-log(x+2)+2, 3);

x0 = 1;
tol = 1.e-12; % controllo se è sbagliata
max_it = 40;

[x, res, iter] = puntofisso(g, x0, tol, max_it);

x
iter

figure()
semilogy(res, 'b.-')
xlabel('iter'); ylabel('residuo'); grid on

p = log(res(end))/log(res(end-1))
