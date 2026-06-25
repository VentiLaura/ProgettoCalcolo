clear; clc; close all;
format long

g = @(x) exp(2-x.^3)-2;

x0 = 1;
tol = 1.e-12;
max_it = 40;

[x, res, iter] = puntofisso(g, x0, tol, max_it);

fprintf('Soluzione: %f\n', x);
fprintf('Numero di iterazioni: %d\n', iter);
figure()
semilogy(res, 'b.-')
xlabel('iter'); ylabel('residuo'); grid on
