function [x, res, iter] = puntofisso(g, x0, tol, max_it)

condiz = 1;
iter = 1;

while condiz && (iter<max_it)

    x = g(x0);
    % aggiorno x a partire da x0, usando f e gli input ...
    condiz = abs(x-x0)>tol;
    res(iter) = abs(x-x0);
    % aggiorno condizione di convergenza

    x0 = x; % aggiorno l'iterata iter-esima
    iter = iter+1;

end