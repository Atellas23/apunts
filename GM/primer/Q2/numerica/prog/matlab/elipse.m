clearvars
close all
A=rand(2);
theta=linspace(0,2*pi,401);
x=cos(theta);
y=sin(theta);
z=A*[x;y];
plot(x,y,'r-')
hold on
axis equal
plot(z(1,:),z(2,:),'b-')
[U,S,V]=svd(A);
eix=zeros(2,3);
eix(:,2)=U(:,1)*S(1,1);
eix(:,3)=U(:,2)*S(2,2);
plot(eix(1,[1,2]),eix(2,[1,2]),'k-')
plot(eix(1,[1,3]),eix(2,[1,3]),'k-')
hold off