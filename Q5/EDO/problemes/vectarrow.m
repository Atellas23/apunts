function vectarrow(X,DX,tmny,clr,lw)
%Dibuja una flecha en el punto X con direccion DX de tamaño tmny, color
%clr y grosor lw
nrm = norm(DX);

if (nrm > 1.e-5)
    DX=tmny*DX/nrm;
    x0 = X(1);
    y0 = X(2);
    x1 = X(1)+DX(1);
    y1 = X(2)+DX(2);
    plot([x0;x1],[y0;y1],clr,'LineWidth',lw);
    
    alpha = 1;  % Tamaño de la cabeza (alpha pequeña = flecha invisible)
    beta = 0.5;  % Tamaño de la base (beta pequeña = flecha puntiaguda)
    
    hu = [x1-alpha*(DX(1)+beta*DX(2)); x1; x1-alpha*(DX(1)-beta*DX(2))];
    hv = [y1-alpha*(DX(2)-beta*DX(1)); y1; y1-alpha*(DX(2)+beta*DX(1))];
    
    plot(hu(:),hv(:),clr,'LineWidth',lw)  % Plot arrow head
end

end