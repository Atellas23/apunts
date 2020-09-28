function [Q, R] = qrdecomp(A)
    n = size(A, 2);
    Q = A;
    R = zeros(n);
    
    for i = 1:n
        v = Q(:,i);
        for j = 1:(i - 1)
            u = Q(:,j);
            R(j,i) = dot(v, u)/dot(u, u);  % MGS (dot with current v)
            v = v - R(j,i)*u;
        end
        R(i,i) = norm(v);
        Q(:,i) = v/R(i,i);
    end
end