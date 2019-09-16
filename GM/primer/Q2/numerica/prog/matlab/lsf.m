clearvars
close all

x=transpose(0.25:0.25:1.75);
y=transpose([0.40 0.50 0.90 1.28 1.60 1.66 2.02]);

M=vander(x);
m=size(M,1);
deg=2;
A=M(:,m-deg:m);
n=size(A,2);

% Descomposició QR
Q=A;
R=zeros(n);

%k=1
R(1,1)=norm(Q(:,1)); % Per especificar norma, norm(Q(:,1),k) on k=1,2,inf
Q(:,1)=Q(:,1)/R(1,1);
R(1,2:n)=Q(:,1)'*Q(:,2:n);
Q(:,2:n)=Q(:,2:n)-Q(:,1)*R(1,2:n);
%k=2
R(2,2)=norm(Q(:,2));
Q(:,2)=Q(:,2)/R(2,2);
R(2,3:n)=Q(:,2)'*Q(:,3:n);
Q(:,3:n)=Q(:,3:n)-Q(:,2)*R(2,3:n);
%k=3
R(3,3)=norm(Q(:,3));
Q(:,3)=Q(:,3)/R(3,3);

% Solució del sistema triangular superior
[a,res]=solveTS(R,Q'*y)