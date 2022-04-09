%I certify that this assignment is entirely my work,
%performed independently and without any help
%from the sources which are not allowed.
%Szymon Górski

%Mz=f solver
function [z] = SolveSystem(M, f)
    M_size = size(M);
    f_size = size(f);
    if M_size(1) ~= M_size(2)
        error("The first matrix is not square!");
    end
    if f_size(2) ~= 1
        error("The second matrix must be a vector!");
    end
    if f_size(1) ~= M_size(1)
        error("Matrices have incompatible sizes!");
    end
    [L,U] = CroutDecomposition(M);
    det_L=CroutDeterminant(L);
    if abs(det_L)<1e-12
        error("A given matrix has a zero determinant!")
    end
    
    n = f_size(1);
    y = zeros(n,1);
    if L(1,1)==0
        error("Precision error!")
    end
    y(1) = f(1)/L(1,1);
    for i = 2:n
        y(i) = f(i);
        for j = 1:i-1
            y(i) = y(i) - y(j)*L(i,j);
        end
        if L(i,i)==0
            error("Precision error!")
        end
        y(i) =  y(i) / L(i,i);
    end
    
    z = zeros(n,1);
    if U(n,n)==0
        error("Precision error!")
    end
    z(n) = y(n) / U(n,n);
    for i = n-1:-1:1
        z(i) = y(i);
        for j = n:-1:i+1
            z(i) = z(i) - z(j)*U(i,j);
        end
        if U(i,i)==0
            error("Precision error!")
        end
        z(i) = z(i) / U(i,i);
    end
end