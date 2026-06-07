function [x,iter] = bisection(f,a,b,tol,max_it)

condiz=1; iter=0; x=a;

while condiz && (iter<max_it)
    c=(a+b)/2;
    if f(c)==0
        x=c; return;
    elseif f(c)*f(a)<0
        b=c;
    elseif f(c)*f(b)<0
        a=c;
    end
    condiz = abs(f(c))>tol;
    x=c; iter=iter+1;
end