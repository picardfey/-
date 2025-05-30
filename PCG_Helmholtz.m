function [u, error,iter] = PCG_Helmholtz(N, k)
% PCG_HELMHOLTZ - Preconditioned Conjugate Gradient method for solving Helmholtz equation
% N - Number of grid points in x and y directions
% k - Wavenumber
% u - Numerical solution
% error - Error at each iteration

h = 1/(N+1); % Grid size
x = (1:N)*h; % x grid points
y =x; % y grid points

[X, Y] = meshgrid(x,y); % Grid points

% Initial guess
u = zeros(N, N);

% Right hand side
b = 4*pi^2*sin(pi*X).*cos(2*pi*Y);
D=1/h^2*speye(N);
u0=sin(pi*x);un=u0;
b(1,:)=b(1,:)-u0*D';
b(end,:)=b(end,:)-un*D';
b=b';
% Preconditioner
P = eye(N^2);

% Residual
r = b(:) - Helmholtz_operator(u, N, k);

% Search direction
p = P\r;

% Error
error = [];

% PCG iterations
for i = 1:N^2
    Ap = Helmholtz_operator(p, N, k);
    alpha = (r'*r)/(p'*Ap);
    ap=reshape(alpha*p,N,N);
    u = u +ap';
    r_new = r - alpha*Ap;
    beta = (r_new'*r_new)/(r'*r);
    p = P\r_new + beta*p;
    r = r_new;
    error(i) = norm(r_new, 2);
    if error(i) < 1e-10
        break;
    end
end
iter=i;
end

