function [S] = NewtonsRule(a, b, A, B0, B)
A_size = size(A,2);
B_size = size(B,2);
if (A_size ~= B_size)
    error ("Number of a_(k) and b_(k) arguments differ from each other!")
end
[U1,~] = GoertzelsAlgorithm(a, B0, B);
[~,V1] = GoertzelsAlgorithm(a, 0, A);
[U2,~] = GoertzelsAlgorithm(((2*a+b)/3), B0, B);
[~,V2] = GoertzelsAlgorithm(((2*a+b)/3), 0, A);
[U3,~] = GoertzelsAlgorithm(((a+2*b)/3), B0, B);
[~,V3] = GoertzelsAlgorithm(((a+2*b)/3), 0, A);
[U4,~] = GoertzelsAlgorithm(b, B0, B);
[~,V4] = GoertzelsAlgorithm(b, 0, A);
S = (b-a)*(U1+V1 + 3*(U2+V2) + 3*(U3+V3) + U4+V4)/8;
end