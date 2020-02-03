function [x,res]=solveTS(A,b)
%SOLVETS:
%Solve upper triangular systems
%INPUT:
%Yo momma
%OUTPUT:
%Yo fucking idiot


    [n,m] = size(A);
    if (n ~= m)
        error('La matriu no és quadrada!')
    end
    x = zeros(n,1);
    x(n)=b(n)/A(n,n);
    for k=n-1:-1:1
        x(k) = (b(k) - A(k,k+1:n)*x(k+1:n))/A(k,k);
    end
    res = norm(A*x-b);
end