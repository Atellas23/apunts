function Croquis_SLH(A)
% Parametro de entrada: A = matriz 2x2
% Ejemplos de uso:
% 1) Croquis_SLH([5 -1; 3 1])    %-> Nodo propio repulsor
% 2) Croquis_SLH([-1 0; 3 2])    %-> Silla
% 3) Croquis_SLH([3 -2; 4 -1])   %-> Foco repulsor antihorario
% 4) Croquis_SLH([2 -5; 1 -2])   %-> Centro antihorario
% 5) Croquis_SLH([1 -4; 4 -7])   %-> Nodo impropio atractor
% 4) Croquis_SLH([1 0; 1 0])     %-> Degenerado inestable

%Clasificacion y estabilidad del SLH por criterio traza-determinante
T=trace(A);
D=det(A);
Delta=T^2-4*D;

%Cuando hacemos calculos numericos, las cantidades nulas no suelen dar
%exactamente cero. Por eso, si alguna cantidad esta muy cerca de cero,
%la igualamos a cero.
if (abs(D) < 1.e-10)
    D = 0;
end
if (abs(Delta) < 1.e-10)
    Delta = 0;
end
if ( abs(T) < 1.e-10)
    T=0;
end


if ( D>0 )
    if ( Delta < 0 )
        if ( T<0 )
            clasificacion = 'Foco atractor';
        elseif (T>0)
            clasificacion = 'Foco repulsor';
        else
            clasificacion = 'Centro (Estable no atractor)';
        end
    elseif ( Delta > 0 )
        if ( T<0 )
            clasificacion = 'Nodo propio atractor';
        elseif ( T>0 )
            clasificacion = 'Nodo propio repulsor';
        end
    else
        if ( T<0 )
            clasificacion = 'Nodo impropio atractor';
        elseif ( T>0 )
            clasificacion = 'Nodo impropio repulsor';
        end
    end
elseif D<0
    clasificacion = 'Silla (Inestable no repulsor)';
else
    if ( T>0)
        clasificacion = 'Degenerado inestable no repulsor';
    elseif ( T<0 )
        clasificacion = 'Degenerado estable no atractor';
    else
        clasificacion = 'Degenerado con T=D=0';
    end
end

%Dibujar las rectas invariantes estables en azul, las rectas invariantes
%inestables en rojo y las rectas invariantes de puntos de equilibrio en
%negro
figure(1)
hold on
set(gca,'DefaultLineLineWidth',3)
axis equal
axis manual
axis on
title(['Croquis de x'' = Ax con A=[', num2str(A(1,1)),...
    ',', num2str(A(1,2)),...
    ';', num2str(A(2,1)),...
    ',', num2str(A(2,2)),'] -> ',clasificacion])
xlabel('x')
ylabel('y')
[S,D]=eig(A);
VAP=diag(D);
if (Delta >= 0)
    VAP=real(VAP);
    S=real(S);
    for j=1:2
        if ( VAP(j) > 0 )
            color ='r';
        elseif ( VAP(j) < 0 )
            color = 'b';
        else
            color = 'k';
        end
        plot(1.5*[-S(1,j) S(1,j)],1.5*[-S(2,j) S(2,j)],color)
        if (VAP(j)~= 0)
            vectarrow(S(:,j)/2,VAP(j)*S(:,j),0.04,color,2)
            vectarrow(-S(:,j)/2,-VAP(j)*S(:,j),0.04,color,2)
            if( abs(VAP(j)) > abs(VAP(3-j)) && VAP(1)*VAP(2)>0 )
                vectarrow(7*S(:,j)/13,VAP(j)*S(:,j),0.04,color,2)
                vectarrow(-7*S(:,j)/13,-VAP(j)*S(:,j),0.04,color,2)
            end
        end
    end
end

plot(0,0,'ko','MarkerFaceColor','k','MarkerSize',6)

axis([-1 1 -1 1])

%Crear funcion para pasarla al ode45
F = @(t,X) A*X;
opciones = odeset('AbsTol',1e-8,'RelTol',1e-8,'Events',@SalirVentana);

%El condicional while(p==1) obliga al programa a calcular y dibujar
%una nueva trayectoria cada vez que clicamos con el boton
%izquierdo del raton. Cualquier otra accion finaliza el programa.
p=1;
while(p==1)
    [x0,y0,p]=ginput(1);
    X0=[x0;y0];
    [~,X,~,~,~]=ode45(F,[0 100],X0,opciones);
    [~,Xp,~,~,~]=ode45(F,[0 -100],X0,opciones);
    X=[flipud(Xp);X];
    plot(X(:,1),X(:,2),'k','LineWidth',3)
    vectarrow(X0,F(0,X0),0.04,'k',3)
end
hold off

    function [value,isterminal,direction] = SalirVentana(~,X)
        % Funcion anidada (nested) para detectar salidas de la ventana
        value = [X(1)^2-1,X(2)^2-1];
        isterminal = [1,1];  % Detener o no la integracion
        direction = [0,0];   % Tener en cuenta ambas direcciones
    end

end