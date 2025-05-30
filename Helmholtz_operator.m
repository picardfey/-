function A = Helmholtz_operator(u, N, k)
% HELMHOLTZ_OPERATOR - Discrete Helmholtz operator
% u - Current solution
% N - Number of grid points in x and y directions
% k - Wavenumber
% A - Discrete Helmholtz operator applied to u

h = 1/(N+1); % Grid size

% Discretize the Laplacian operator
L = gallery('tridiag',N,1,-2,1)/h^2;

% Build the discrete Helmholtz operator
I = eye(N);
A = kron(I,L) + kron(L,I) + k^2*speye(N^2);
u=u';
A = A*u(:);
end
