function [x,k]=Gauss_seidel(A,b,x0,tol)
maxl=10000;
U=-triu(A,1);
L=-tril(A,-1);
D=diag(diag(A));
G=(D-L)\U;
f=(D-L)\b;
x=G*x0+f;
k=1;
while norm(x-x0)>=tol
    x0=x;
    x=G*x+f;
    k=k+1;
    if(k>=maxl)
        disp('迭代次数太多，方程组可能不收敛');
        return;
    end
end


