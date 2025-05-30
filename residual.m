function res = residual(phi,f,h,k)
N = size(phi,1)-1;
res = zeros(N+1,N+1);
for i = 2:N
    for j = 2:N
        res(i,j) = f(i,j)-(phi(i-1,j)+phi(i+1,j)+phi(i,j-1)+phi(i,j+1)-4*phi(i,j))/h^2 - k^2*phi(i,j);
    end
end
end