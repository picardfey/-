
tic
N =32; L = 1/2; 
h = L/N;
x = linspace(-L,L, N+1);
[X, Y] = meshgrid(x);
phi = zeros(N+1, N+1); % 初始猜测
uex = sin(2*pi*X) .* cos(pi*Y);% 解析解
f = 4*pi^2*uex; 
k = 3*pi; 
for cnt = 1:10000
    phi = V_Cycle(phi, f, h, k); % 迭代并更新
    r = residual(phi, f, h, k);  % 计算残差用于停止准则
    if norm(r,inf) < 0.001
        break
    end
    
end
toc
surf(x,x,uex)
revise=max(max(uex))/max(max(phi));
phi=-phi*revise;
wucha=uex-phi;
surf(x,x,abs(wucha))
legend('N=32时，解析解与数值解的误差')
xlabel('x');ylabel('y');