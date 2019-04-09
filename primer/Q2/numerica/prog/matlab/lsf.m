clearvars
close all

x=transpose(0.25:0.25:1.75);
y=transpose([0.40 0.50 0.90 1.28 1.60 1.66 2.02]);

M=fliplr(vander(x));
deg=2;
n=deg+1;
A=M(:,1:n);
[m,n]=size(A);

% Descomposició QR
Q=A;
R=zeros(n);
for i=1:n
    R(1,1)=norm(Q(:,1)); % Per especificar norma, norm(Q(:,1),k) on k=1,2,inf
    Q(:,1)=Q(:,1)/R(1,1);
    R(1,2:n)=Q(:,1)'*Q(:,2:n);
    Q(:,2:n)=Q(:,2:n)-Q(:,1)*R(1,2:n);
end