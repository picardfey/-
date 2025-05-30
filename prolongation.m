function res = prolongation(eps)
    N = size(eps,1)-1;
    res = zeros(2*N+1,2*N+1);
    res(1:2:2*N+1,1:2:2*N+1) = eps;
    res(2:2:2*N,2:2:2*N) = 0.25*(eps(1:N,1:N) + eps(1:N,2:N+1) + eps(2:N+1,1:N) + eps(2:N+1,2:N+1));
    res(2:2:2*N,1:2:2*N+1) = 0.5*(eps(1:N,1:N+1) + eps(2:N+1,1:N+1));
    res(1:2:2*N+1,2:2:2*N) = 0.5*(eps(1:N+1,1:N) + eps(1:N+1,2:N+1));
end