function [coefs, norm2res] = polminquad(x,y,grau,plt)
%POLYMINQUAD    Calcula l'aproximació polinomial de les dades de x i y pel
%mètode de mínims quadrats.
%INPUT:
%x: vector d'abcisses.
%y: vector d'ordenades.
%grau: grau del polinomi que es vol.
%plt: nombre de punts a utilitzar per dibuixar la gràfica de la funció.
%OUTPUT:
%coefs: vector de coeficients del polinomi aproximador.
%norm2res: norma-2 del residu, ||A'A(coefs)=y||_2.
x=x(:);
y=y(:);
N=vander(x);
m=size(N,1); %nombre de files
M=N(:,m-grau:m);
n=size(M,2); %nombre de columnes, grau+1
Q=M; %dimensions m*(grau+1)
R=zeros(n); %dimensions (grau+1)*(grau+1)

%Descomposem M=QR
for k=1:n-1
    R(k,k)=norm(Q(:,k));
    Q(:,k)=Q(:,k)/R(k,k);
    R(k,k+1:n)=Q(:,k)'*Q(:,k+1:n);
    Q(:,k+1:n)=Q(:,k+1:n)-Q(:,k)*R(k,k+1:n);
end
R(n,n)=norm(Q(:,n));
Q(:,n)=Q(:,n)/R(n,n);

Qortogonal = norm(Q'*Q-eye(m),inf)

%Solucionem el sistema triangular superior Ra=Q'*y, equivalent a M'*Ma=M'*y
a = zeros(n,1);
b = Q'*y;
a(n)=b(n)/R(n,n);
for k=m-1:-1:1
    a(k) = (a(k) - R(k,k+1:n)*a(k+1:n))/R(k,k);
end
coefs = a;
norm2res = norm(M*a-y,2);

if (nargin == 4)
    xx = linspace(x(1),x(end),plt);
    plot(x,y,'ro')
    hold on
    yy = polyval(coefs,xx);
    plot(xx,yy,'b-')
    title('mínims quadrats')
    xlabel('x')
    ylabel('y')
    legend('punts','polinomi')
    hold off
end
end