function [XK, DFk, res, it] = nnewton(x0, tol, itmax, fun, dfun)
    XK = [x0]; it = 0; tolk = 1.0;
    Fk = fun(x0); res = [norm(Fk)];
    DFk = dfun(x0);

    while it < itmax && tolk > tol
        dxk = DFk\Fk;
        xk  = XK(:,end) - dxk; XK = [XK xk];
        Fk  = fun(xk); res = [res norm(Fk)];
        DFk = dfun(xk);
        tolk = norm(dxk);
        it = it + 1;
    end
    
    if (it == itmax)
      fprintf("Hem arribat al nombre màxim d'iteracions.\n");
    end
end