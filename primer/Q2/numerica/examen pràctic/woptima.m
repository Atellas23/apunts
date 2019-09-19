function[m, w] = woptima(A)
W = 0.001:0.001:1.999;
%W = linspace(0, 2, n);
rho = zeros(1,1999);
m = 100000;
w = 0;
for k=1:1999
    G = (W(k)*tril(A,-1)+diag(diag(A)));
    B = G\((1-W(k))*diag(diag(A))-W(k)*triu(A,1));
    rho(k) = max(abs(eig(B)));
    if(rho(k) < m) 
        m = rho(k);
        w = W(k);
    end
end
figure(2);
plot(W, rho);
grid on;
xlabel('w')
ylabel('rho')
title('radi espectral en funció de omega','FontSize',12)
    
    
    