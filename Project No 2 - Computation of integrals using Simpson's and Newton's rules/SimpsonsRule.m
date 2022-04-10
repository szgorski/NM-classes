function [S] = SimpsonsRule(a, b, A, B0, B)
A_size = size(A,2);
B_size = size(B,2);
if (A_size ~= B_size)
    error ("Number of a_(k) and b_(k) arguments differ from each other!")
end
[U1,~] = GoertzelsAlgorithm(a, B0, B);
[~,V1] = GoertzelsAlgorithm(a, 0, A);
[U2,~] = GoertzelsAlgorithm((a+b)/2, B0, B);
[~,V2] = GoertzelsAlgorithm((a+b)/2, 0, A);
[U3,~] = GoertzelsAlgorithm(b, B0, B);
[~,V3] = GoertzelsAlgorithm(b, 0, A);
S = (b-a)*(U1+V1 + 4*(U2+V2) + U3+V3)/6;
end