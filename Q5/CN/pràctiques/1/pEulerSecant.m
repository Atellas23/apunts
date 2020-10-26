tol = 10e-10; itmax = 100;

mu = (0:0.001:0.5); n = size(mu,2);

L = zeros(3,n);

for i=1:n
  [xk,res,tol] = secant(0.3, 0.8, tol, itmax, @(x)G1(x,mu(i)));
  L(1,i) = mu(i) - 1 - xk(end);
end

for i=1:n
  [xk,res,tol] = secant(0.3, 0.8, tol, itmax, @(x)G2(x,mu(i)));
  L(2,i) = mu(i) - 1 + xk(end);
end

for i=1:n
  [xk,res,tol] = secant(0.3, 0.8, tol, itmax, @(x)G3(x,mu(i)));
  L(3,i) = mu(i) + xk(end);
end

plot(mu,L(1,1:n),'k',mu,L(2,1:n),'k--',mu,L(3,1:n),'k-.');
legend({'x_{L_1}','x_{L_2}','x_{L_3}'},'Location','west');

function [g1] = G1(s,m)
  g1 = s^5+(3-m)*s^4+(3-2*m)*s^3-m*s^2-2*m*s-m;
end

function [g2] = G2(s,m)
  g2 = s^5-(3-m)*s^4+(3-2*m)*s^3-m*s^2+2*m*s-m;;
end

function [g3] = G3(s,m)
  g3 = s^5+(2+m)*s^4+(1+2*m)*s^3-(1-m)*s^2-2*(1-m)*s-(1-m);
end