function res = smoothing_after(phi, f, h, k)
N = size(phi, 1)-1;
res = zeros(N+1, N+1);
for t=1:4
for i = 2:N
    for j = 2:N
        res(i,j) = (phi(i,j+1)+phi(i,j-1)+phi(i+1,j)+phi(i-1,j)-h^2*f(i,j))/(4-h^2*k^2);
    end
end
phi=res;
end
end