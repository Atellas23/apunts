function [xk,res,it] = iteracio_simple(x0,tol,itmax,fun)

  xk = [x0] ; it = 0 ; res=[abs(x0-fun(x0))];

  tolk=abs(res(1));
  while (it < itmax) & (tolk > tol)
      fk = fun(xk(end)) ; tolk = abs(xk(end)-fk) ;
      xk = [xk  fk];
      res = [res tolk] ;
      it = it + 1 ;
  end
end