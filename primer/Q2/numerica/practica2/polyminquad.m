function [coefs, norm2res] = polyminquad(x,y,grau,plt)
%POLYMINQUAD Calcula l'aproximació polinomial de les dades de x i y pel
%mètode de mínims quadrats.
%INPUT:
%x:vector d'abcisses.
%y:vector d'ordenades.
%grau:grau del polinomi que es vol.
%plt:nombre de punts a utilitzar per dibuixar la gràfica de la funció.
x=transpose(x);
y=transpose(y);
M=vander(x);
m=size(M,1); %nombre de files
A=M(:,m-grau:m);
n=size(A,2); %nombre de columnes
Q=A'*A; %dimensions m*m
R=zeros(n);

%Descomposem QR
for k=1:n-1
    R(k,k)=norm(Q(:,k));
    Q(:,k)=Q(:,k)/R(k,k);
    R(k,k+1:n)=Q(:,k)'*Q(:,k+1:n);
    Q(:,k+1:n)=Q(:,k+1:n)-Q(:,k)*R(k,k+1:n);
end
R(n,n)=norm(Q(:,n));
Q(:,n)=Q(:,n)/R(n,n);

%Solucionem el sistema triangular superior R*a=Q'*y
x = zeros(m,1);
x(m)=b(m)/A(m,m);
for k=m-1:-1:1
    x(k) = (b(k) - A(k,k+1:n)*x(k+1:n))/A(k,k);
end
res = norm(A*x-b);






end