f = @(x) x.^3 .* exp(-x);
fp = @(x) 3*x.^2.* exp(-x) - x.^3.* exp(-x);

[x3, res3, iter3] = newton(f,fp,1, 1.e-8, 100);

semilogy(res3)