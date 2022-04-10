%The Crout's Algorithm
function [L,U] = CroutDecomposition(A)
    A_size = size(A);
    C = min(A_size(1), A_size(2));
    L = zeros(C);
    U = eye(C);
    det_A=det(A(1:C,1:C));
    if abs(det_A)<1e-12
        error("A given matrix has a zero determinant!")
    end
    for i = 1:C-1
        if abs(det(A(1:i,1:i)))<1e-12
            error("A given matrix has at least one zero leading principal minor!")
        end
    end
    
    for i = 1:C
        L(i,1) = A(i,1);
    end
    for j = 2:C
        if L(1,1)==0
            error("Precision error!")
        end
        U(1,j) = A(1,j) / L(1,1);
    end
    for i = 2:C
        for j = 2:i
            L(i,j) = A(i,j) - L(i,1:j-1) * U(1:j-1,j);
        end
        for j = i + 1:C
            if L(i,i)==0
                error("Precision error!")
            end
            U(i,j) = (A(i,j) - L(i,1:i-1) * U(1:i-1,j)) / L(i,i);
        end
    end
end