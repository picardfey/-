%Jacobi迭代 X=BX+g B=E-D^-1*A
function [x,kk]=jacobi(A,b,x0,tol)
D=diag(diag(A));
maxl=100000000;
L=-tril(A,-1);
U=-triu(A,1);
B=D\(L+U);
f=D\b;
x=B*x0+f;
kk=1;
while norm(x-x0)>=tol
    x0=x;
    x=B*x0+f;
    kk=kk+1;
    if(kk>=maxl)
        disp('迭代超过300次，方程组可能不收敛');
        return;
    end
end
