tol = 10e-10; itmax = 100;

mu = (0:0.001:0.5); n = size(mu,2);

L = zeros(3,n);

for i=1:n
  s0 = (mu(i)/(3*(1-mu(i))))^(1/3);
  [xk, res, it] = iteracio_simple(s0, tol, itmax, @(x)G1(x,mu(i)));
  L(1,i) = mu(i) - 1 - xk(end);
end

for i=1:n
  s0 = (mu(i)/(3*(1-mu(i))))^(1/3);
  [xk, res, it] = iteracio_simple(s0, tol, itmax, @(x)G2(x,mu(i)));
  L(2,i) = mu(i) - 1 + xk(end);
end

for i=1:n
  s0 = 1 - (7*mu(i))/12;
  [xk, res, it] = iteracio_simple(s0, tol, itmax, @(x)G3(x,mu(i)));
  L(3,i) = mu(i) + xk(end);
end

plot(mu,L(1,1:n),'k',mu,L(2,1:n),'k--',mu,L(3,1:n),'k-.');
legend({'x_{L_1}','x_{L_2}','x_{L_3}'},'Location','west');

function [g1] = G1(s,m)
  g1 = ((m*(1+s)^2)/(3-2*m+s*(3-m+s)))^(1/3);
end

function [g2] = G2(s,m)
  g2 = ((m*(1-s)^2)/(3-2*m-s*(3-m-s)))^(1/3);
end

function [g3] = G3(s,m)
  g3 = (((1-m)*(1+s)^2)/(1+2*m+s*(2+m+s)))^(1/3);
end