f = @(x) x.^2 - 2.0001*x - 3.0001;

a = 3.0001;
g = @(x) (a - x.^2)/(a-1);

gp = @(x) abs(-2* x/(a-1));

x = linspace(-2,1);

figure(1)
plot(x, gp(x));
grid;

[xest, res, niter] = puntofisso(g, -.9, 1.e-10, 10000000);
semilogy(res, 'b.-')
