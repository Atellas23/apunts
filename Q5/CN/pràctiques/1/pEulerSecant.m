tol = 10e-10; itmax = 100;

mu = (0.001:0.001:0.5); n = size(mu,2);

L = zeros(3,n);
C = zeros(3,n);

for i=1:n
  [xk,res,it1] = secant(0.3, 0.8, tol, itmax, @(x)Q1(x,mu(i)));
  L(1,i) = mu(i) - 1 - xk(end);
  C(1,i) = 2*O(L(1,i), 0, mu(i));
end

for i=1:n
  [xk,res,it2] = secant(0.3, 0.8, tol, itmax, @(x)Q2(x,mu(i)));
  L(2,i) = mu(i) - 1 + xk(end);
  C(2,i) = 2*O(L(2,i), 0, mu(i));
end

for i=1:n
  [xk,res,it3] = secant(0.3, 0.8, tol, itmax, @(x)Q3(x,mu(i)));
  L(3,i) = mu(i) + xk(end);
  C(3,i) = 2*O(L(3,i), 0, mu(i));
end

figure(1);
plot(mu,L(1,1:n),'k',mu,L(2,1:n),'k--',mu,L(3,1:n),'k-.');
legend({'$x_{L_1}$','$x_{L_2}$','$x_{L_3}$'},'Location','west','interpreter','latex');

figure(2);
plot(mu,C(1,:),'k',mu,C(2,:),'k--',mu,C(3,:),'k-.');
legend({'$C_{L_1}$','$C_{L_2}$','$C_{L_3}$'},'Location','northwest','interpreter','latex');

function [q1] = Q1(s,m)
  q1 = s^5+(3-m)*s^4+(3-2*m)*s^3-m*s^2-2*m*s-m;
end

function [q2] = Q2(s,m)
  q2 = s^5-(3-m)*s^4+(3-2*m)*s^3-m*s^2+2*m*s-m;
end

function [q3] = Q3(s,m)
  q3 = s^5+(2+m)*s^4+(1+2*m)*s^3-(1-m)*s^2-2*(1-m)*s-(1-m);
end

function [val] = r1(x,y,m)
  val = sqrt((x-m)^2+y^2);
end

function [val] = r2(x,y,m)
  val = sqrt((x-m+1)^2+y^2);
end

function [o] = O(x,y,m)
  o = (x^2+y^2)/2 + (1-m)/r1(x,y,m) + m/r2(x,y,m) + (m*(1-m))/2;
end