tol = 10e-10; itmax = 100;

mu = (0.001:0.001:0.5); n = size(mu,2);

L = zeros(3,n);
C = zeros(3,n);

for i=1:n
  s0 = (mu(i)/(3*(1-mu(i))))^(1/3);
  [xk, res, it] = newton(s0, tol, itmax, @(x)G1(x,mu(i)), @(x)dG1(x,mu(i)));
  L(1,i) = mu(i) - 1 - xk(end);
  C(1,i) = 2*O(L(1,i), 0, mu(i));
end

for i=1:n
  s0 = (mu(i)/(3*(1-mu(i))))^(1/3);
  [xk, res, it] = newton(s0, tol, itmax, @(x)G2(x,mu(i)), @(x)dG2(x,mu(i)));
  L(2,i) = mu(i) - 1 + xk(end);
  C(2,i) = 2*O(L(2,i), 0, mu(i));
end

for i=1:n
  s0 = 1 - (7*mu(i))/12;
  [xk, res, it] = newton(s0, tol, itmax, @(x)G3(x,mu(i)), @(x)dG3(x,mu(i)));
  L(3,i) = mu(i) + xk(end);
  C(3,i) = 2*O(L(3,i), 0, mu(i));
end

figure(1);
plot(mu,L(1,1:n),'k',mu,L(2,1:n),'k--',mu,L(3,1:n),'k-.');
legend({'$x_{L_1}$','$x_{L_2}$','$x_{L_3}$'},'Location','west','interpreter','latex');

figure(2);
plot(mu,C(1,:),'k',mu,C(2,:),'k--',mu,C(3,:),'k-.');
legend({'$C_{L_1}$','$C_{L_2}$','$C_{L_3}$'},'Location','northwest','interpreter','latex');

function [g1] = G1(s,m)
  g1 = s^5+(3-m)*s^4+(3-2*m)*s^3-m*s^2-2*m*s-m;
end

function [dg1] = dG1(s,m)
  dg1 = 5*s^4 - 2*m*s - 3*s^2*(2*m - 3) - 2*m - 4*s^3*(m - 3);
end

function [g2] = G2(s,m)
  g2 = s^5-(3-m)*s^4+(3-2*m)*s^3-m*s^2+2*m*s-m;;
end

function [dg2] = dG2(s,m)
  dg2 = 2*m - 2*m*s - 3*s^2*(2*m - 3) + 5*s^4 + 4*s^3*(m - 3);
end

function [g3] = G3(s,m)
  g3 = s^5+(2+m)*s^4+(1+2*m)*s^3-(1-m)*s^2-2*(1-m)*s-(1-m);
end

function [dg3] = dG3(s,m)
  dg3 = 2*m + 3*s^2*(2*m + 1) + 2*s*(m - 1) + 5*s^4 + 4*s^3*(m + 2) - 2;
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
