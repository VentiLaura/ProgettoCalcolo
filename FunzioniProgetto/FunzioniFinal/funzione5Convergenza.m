clear; clc; close all;
format long

% Zero di f(x) = x^3 + log(x+2) - 2
% g(x) = (x+2-log(x+2)) / (x^2+1)
% g'(x*) = -0.627  ->  |g'(x*)|<1: convergenza lineare ma lenta (~55 iterazioni)
g = @(x) (x + 2 - log(x + 2)) ./ (x.^2 + 1);

x0 = 1;
tol = 1.e-12;
max_it = 150;

[x, res, iter] = puntofisso(g, x0, tol, max_it);

x
iter

figure()
semilogy(res, 'b.-')
xlabel('iter'); ylabel('residuo'); grid on

p = log(res(end))/log(res(end-1))
