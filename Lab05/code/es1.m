f = @(x) cos(x) - x;
fp = @(x) -sin(x) -1;

x= linspace(0,1);


plot(x,f(x))
grid;

x = bisection(f, 0,1, 1e-10, 100)

g = @(x)  cos(x);
[x2, res2, iter2] = puntofisso(g,1, 1.e-10, 100);

semilogy(res2)

[x3, res3, iter3] = newton(f,fp,1, 1.e-10, 100);
