function [xk,res,it] = secant(a,b,tol,itmax,fun)
  xk = [a b]; it = 1; res = [abs(a-b)];

  tolk = abs(res(1));
  while (it < itmax) && (tolk > tol)
      app = xk(end)-fun(xk(end))*(xk(end)-xk(end-1))/(fun(xk(end))-fun(xk(end-1)));
      xk = [xk  app];
      tolk = abs(fun(app));
      res = [res tolk];
      it = it + 1;
  end
  if (it == itmax)
      fprintf("Hem arribat al nombre màxim d'iteracions.\n");
  end
end
