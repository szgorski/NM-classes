% Crout's determinant
function [det_L] = CroutDeterminant(A)
    A_size = size(A);
    if A_size(1)~=A_size(2)
        error("A given matrix is not square!")
    end
    [L,~] = CroutDecomposition(A);
    det_L = 1;
    for i = 1:A_size(1)
        det_L = det_L * L(i,i);
    end
end