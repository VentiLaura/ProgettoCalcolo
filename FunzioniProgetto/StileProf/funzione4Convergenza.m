clear; clc; close all;
format long

% Zero di f(x) = x^3 + log(x+2) - 2 con il metodo di Newton
% Newton e' un metodo di punto fisso con g(x) = x - f(x)/f'(x);
% g'(x*) = 0 nella radice -> convergenza quadratica
f = @(x) x.^3 + log(x+2) - 2;
fp = @(x) 3*x.^2 + 1./(x+2);

x0 = 1;
tol = 1.e-12;
max_it = 150;

[x, res, iter] = newton(f, fp, x0, tol, max_it);

x
iter

figure()
semilogy(res, 'b.-')
xlabel('iter'); ylabel('residuo'); grid on

p = log(res(end))/log(res(end-1))
