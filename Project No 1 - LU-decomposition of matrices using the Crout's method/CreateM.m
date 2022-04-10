%Matrix M creation
function [M] = CreateM(A)
    B = A';
    A_size = size(A);
    I = eye(A_size(1));
    O = zeros (A_size(2));
    M = [I A; B O];
end