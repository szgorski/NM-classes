function [Exact] = ExactSolution(a, b, A, B0, B)
A_size = size(A,2);
B_size = size(B,2);
N = A_size;
if (A_size ~= B_size)
    error ("Number of a_(k) and b_(k) arguments differ from each other!")
end
Exact = B0*(b-a);
Function = @(i,x) B(i)*cos(i*x)+A(i)*sin(i*x);
for i=1:N
    Exact = Exact + integral(@(x) Function(i,x), a, b);
end
end