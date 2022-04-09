%I certify that this assignment is entirely my work,
%performed independently and without any help
%from the sources which are not allowed.
%Szymon Górski

function [u, v] = GoertzelsAlgorithm(x, A0, A)
A_size = size(A,2);
N = A_size;
z_x = cos(x);
z_y = sin(x);
p = 2*z_x;
q = -(z_x^2 + z_y^2);
C = zeros(1, N+1);
C(N) = A(N);
for i = N-1:-1:1
    C(i) = A(i) + p*C(i+1) + q*C(i+2);
end
u = A0 + z_x*C(1) + q*C(2); % real
v = z_y*C(1); % imaginary
end