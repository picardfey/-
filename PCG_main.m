clc,clear
tic
N=64;k=3*pi;h=1/(N+1);
x=(1:N)*h;
[X,Y]=meshgrid(x,x);
uex=sin(pi*X).*cos(2*pi*Y);
[u, error,iter] = PCG_Helmholtz(N, k);
wucha=abs(u-uex);

erawucha=norm(wucha,inf);
% surf(x,x,u)
% grid off
% feature('memstats')

plot(1:iter,log(error))
title("k=3*pi")
xlabel('iters')
ylabel('log(error)')
toc