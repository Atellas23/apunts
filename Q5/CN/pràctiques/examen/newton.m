function [xk,res,it] = newton(x0,tol,itmax,fun,dfun)
  xk = [x0]; it = 1; res = [abs(fun(x0))];

  tolk = abs(res(1));
  while (it < itmax) && (tolk > tol)
      fk = fun(xk(end)); dfk = dfun(xk(end));
      if (dfk == 0)
          fprintf("hem trobat una derivada igual a 0!\n");
      end
      newit = xk(end) - fk/dfk;
      xk = [xk  newit];
      tolk = abs(fun(newit));
      res = [res tolk];
      it = it + 1;
  end
  if (it == itmax)
      fprintf("Hem arribat al nombre màxim d'iteracions.\n");
  end
end