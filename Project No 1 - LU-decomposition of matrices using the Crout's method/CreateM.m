%I certify that this assignment is entirely my work,
%performed independently and without any help
%from the sources which are not allowed.
%Szymon Górski

%Matrix M creation
function [M] = CreateM(A)
    B = A';
    A_size = size(A);
    I = eye(A_size(1));
    O = zeros (A_size(2));
    M = [I A; B O];
end