function [xk,res,it] = secant(a,b,tol,itmax,fun)
  xk = [a b] ; it = 0 ; res=[abs(a-b)];

  tolk=abs(res(1));
  while (it < itmax) & (tolk > tol)
      sub = fun(xk(end))*(xk(end)-xk(end-1))/(fun(xk(end))-fun(xk(end-1)));
      app = xk(end)-sub;
      xk = [xk  app];
      tolk = abs(xk(end)-xk(end-1));
      res = [res tolk] ;
      it = it + 1 ;
  end
end

