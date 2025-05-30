clc,clear
L=1/2;N=8;k=3*pi;
x0=zeros((N-1)^2,1);
tol=1e-3;
xx=linspace(-L,L,N-1);
[X,Y]=meshgrid(xx);
b=4*pi^2*sin(2*pi*X).*cos(pi*Y);
b=b';b=b(:);
A = Helmholtz_operator( N-1, k);
[x1,k1]=jacobi(A,b,x0,tol);
[x2,k2]=Gauss_seidel(A,b,x0,tol);
