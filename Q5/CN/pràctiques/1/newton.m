function [xk,res,it] = newton(x0,tol,itmax,fun,dfun)

  xk = [x0] ; it = 0 ; res=[abs(x0-fun(x0))];

  tolk=abs(res(1));
  while (it < itmax) & (tolk > tol)
      fk = fun(xk(end)); dfk = dfun(xk(end));
      newit = xk(end) - fk/dfk;
      xk = [xk  newit];
      tolk = abs(xk(end)-xk(end-1));
      res = [res tolk];
      it = it + 1;
  end
end