f = @(x) x.^2 - log(x.^2 +2);

x= linspace(1,2);
plot(x,f(x))
grid;

g1 = @(x) x - sqrt(log(x.^2 +2));
gp1 = @(x) x./(log(x.^2 + 2).^(1/2).*(x.^2 + 2))

figure(2)
plot(x, gp1(x))
