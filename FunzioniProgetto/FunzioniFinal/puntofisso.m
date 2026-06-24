function [x, res, iter] = puntofisso(g, x0, tol, max_it)
condiz = 1;
iter = 1;
while condiz && (iter<max_it)
    x = g(x0);
    condiz = abs(x-x0)>tol;
    res(iter) = abs(x-x0);
    x0 = x;
    iter = iter+1;
end
