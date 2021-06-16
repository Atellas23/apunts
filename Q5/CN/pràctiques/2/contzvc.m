function X = contzvc(x0, ds, smax, sgn, f, Df)
    % refinem x0
    tol = 1e-12;
    G = @(x) [f(x); x(1)];
    DG = @(x) [Df(x); 1, 0];
    if (x0(1) ~= 0)
        G = @(x) [f(x); x(2)];
        DG = @(x) [Df(x); 0, 1];
    end
    [Xk, DFk, ~, ~] = nnewton(x0, tol, 10, G, DG);
    X = [Xk(:, end)];
    % busquem un vector tangent a la corba en el punt refinat
    v = sgn*null(DFk(1:(end - 1), :));
    % declarem el terme independent del sistema ampliat que utilitzarem
    % a cada iteracio per calcular un vector perpendicular
    b = x0(:); b(1:end)=0.0; b(end) = 1.0;
    s = 0; it = 0;
    while (s < smax)
        if (it > 1 && (norm(X(:, end) - X(:, 1)) < ds))
            break;
        end
        % trobem un punt x0 nou
        x0 = X(:, end) + v*ds;
        % ara el volem refinar usant el metode de newton
        F = @(x) [f(x); dot(x - X(:, end), v) - ds];
        DF = @(x) [Df(x); v'];
        [Xk, DFk, ~, ~] = nnewton(x0, tol, 10, F, DF);
        % un cop refinat el punt (si hi ha hagut convergencia a nnewton)
        % el posem a X
        X = [X Xk(:, end)];
        % ara calculem el vector tangent a la corba en aquest nou punt
        M = [DFk(1:end - 1, :); v']; v = M\b; v = v/norm(v);
        % i passem a la seguent iteracio controlant la longitud del pseudo-arc
        % que portem calculada
        s = s + ds;
        it = it + 1;
    end
end