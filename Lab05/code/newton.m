function [x, res, iter] = newton(f, fp,x0, tol, max_it)

condiz = 1;
iter = 1;

while condiz && (iter<max_it)
    
    x = x0 - f(x0)/(fp(x0)+1.e-12);
    % aggiorno x a partire da x0, usando f e gli input ...
    % aggiorno condizione di convergenza
    condiz = abs(x-x0)>tol;
    res(iter) = abs(x-x0);
    
    x0 = x; % aggiorno l'iterata iter-esima
    iter = iter+1;

end