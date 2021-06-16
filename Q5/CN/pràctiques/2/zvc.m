clear;

[Xaxis,Yaxis] = meshgrid(-1.5:0.005:1.5);
M = 0.0121529;

colors = 'krgbm';

r1 = sqrt((Xaxis - M).^2 + Yaxis.^2);
r2 = sqrt((Xaxis - M + 1).^2 + Yaxis.^2);
O = (Xaxis.^2 + Yaxis.^2)/2 + (1 - M)./r1 + M./r2 + (M*(1 - M))/2;

C = [3.3 3.19 3.08 3.0242 3.01];

punts_corba1 = [0, 1.335; 0, 0.74; -0.9, 0]';
punts_corba2 = [0, 1.255; 0, 0.755]';
punts_corba3 = [0, 1.16]';
punts_corba4 = [0, -1.09]';
punts_corba5 = [0, 1; 0, -1]';
% f serà 2*omega(x,y)-c i Df la seva diferencial

f =  @(x,c) (x(1)^2 + x(2)^2) + 2*(1 - M)/sqrt((x(1) - M)^2 + x(2)^2) + 2*M/sqrt((x(1) - M + 1)^2 + x(2)^2) + (M*(1 - M)) - c;
Df = @(x,c) [2*x(1) - (M*(2*x(1) - 2*M + 2))/(x(2)^2 + (x(1) - M + 1)^2)^(3/2) - ((2*M - 2)*(2*M - 2*x(1)))/(2*(x(2)^2 + (M - x(1))^2)^(3/2)), 2*x(2) + (x(2)*(2*M - 2))/(x(2)^2 + (M - x(1))^2)^(3/2) - (2*M*x(2))/(x(2)^2 + (x(1) - M + 1)^2)^(3/2)];

points = contzvc(punts_corba1(:, 1), 0.001, 15, -1, @(x) f(x, C(1)), @(x) Df(x, C(1)));
p1 = plot(points(1, :), points(2, :), colors(1)); hold on;
points = contzvc(punts_corba1(:, 2), 0.001, 15, -1, @(x) f(x, C(1)), @(x) Df(x, C(1)));
plot(points(1, :), points(2, :), colors(1)); hold on;
points = contzvc(punts_corba1(:, 3), 0.001, 15, -1, @(x) f(x, C(1)), @(x) Df(x, C(1)));
plot(points(1, :), points(2, :), colors(1)); hold on;

points = contzvc(punts_corba2(:, 1), 0.001, 15, -1, @(x) f(x, C(2)), @(x) Df(x, C(2)));
p2 = plot(points(1, :), points(2, :), colors(2)); hold on;
points = contzvc(punts_corba2(:, 2), 0.001, 15, -1, @(x) f(x, C(2)), @(x) Df(x, C(2)));
plot(points(1, :), points(2, :), colors(2)); hold on;

points = contzvc(punts_corba3(:, 1), 0.001, 15, -1, @(x) f(x, C(3)), @(x) Df(x, C(3)));
p3 = plot(points(1, :), points(2, :), colors(3)); hold on;

points = contzvc(punts_corba4(:, 1), 0.001, 15, -1, @(x) f(x, C(4)), @(x) Df(x, C(4)));
p4 = plot(points(1, :), points(2, :), colors(4)); hold on;

points = contzvc(punts_corba5(:, 1), 0.001, 15, -1, @(x) f(x, C(5)), @(x) Df(x, C(5)));
p5 = plot(points(1, :), points(2, :), 'm'); hold on;
points = contzvc(punts_corba5(:, 2), 0.001, 15, -1, @(x) f(x, C(5)), @(x) Df(x, C(5)));
plot(points(1, :), points(2, :), 'm'); hold on;

ax = gca; axis square;
ax.XAxisLocation = 'origin'; ax.YAxisLocation = 'origin';
box off; xticks([]), yticks([]);

% dibuixem (a escala) la Terra i la Lluna
earth_radius = 0.12;
moon_radius = 0.03;
rectangle('Position',[[M-1, 0] - [moon_radius, moon_radius], 2*moon_radius, 2*moon_radius],'Curvature',1,'EdgeColor','k','FaceColor','y'); % draw moon
rectangle('Position',[[M, 0] - [earth_radius, earth_radius], 2*earth_radius, 2*earth_radius],'Curvature',1,'EdgeColor','k','FaceColor','b'); % draw earth

% Càlcul dels punts Lagrangians
L = zeros(3,2);
G1 = @(s) ((M*(1+s)^2)/(3-2*M+s*(3-M+s)))^(1/3);
G2 = @(s) ((M*(1-s)^2)/(3-2*M-s*(3-M-s)))^(1/3);
G3 = @(s) (((1-M)*(1+s)^2)/(1+2*M+s*(2+M+s)))^(1/3);
tol = 1e-10; itmax = 100;

s0 = (M/(3*(1-M)))^(1/3);
[xk, ~, ~] = iteracio_simple(s0, tol, itmax, G1);
L(1,1) = M - 1 - xk(end);

s0 = (M/(3*(1-M)))^(1/3);
[xk, ~, ~] = iteracio_simple(s0, tol, itmax, G2);
L(2,1) = M - 1 + xk(end);

s0 = (M/(3*(1-M)))^(1/3);
[xk, ~, ~] = iteracio_simple(s0, tol, itmax, G3);
L(3,1) = M + xk(end);

r = 0.025;
rectangle('Position',[L(1,:)-[r, r], 2*r, 2*r],'Curvature',1,'EdgeColor','k','FaceColor','r'); % draw L1
rectangle('Position',[L(2,:)-[r, r], 2*r, 2*r],'Curvature',1,'EdgeColor','k','FaceColor','r'); % draw L2
rectangle('Position',[L(3,:)-[r, r], 2*r, 2*r],'Curvature',1,'EdgeColor','k','FaceColor','r'); % draw L3

angle1 = pi/3;
angle2 = -angle1;
rotation_matrix = @(a) [cos(a) -sin(a); sin(a) cos(a)];
trojan1_pos = rotation_matrix(angle1)*[-0.9877; 0];
trojan2_pos = rotation_matrix(angle2)*[-0.9877; 0];

rectangle('Position',[trojan1_pos'-[r, r], 2*r, 2*r],'Curvature',1,'EdgeColor','k','FaceColor','r'); % draw L4
rectangle('Position',[trojan2_pos'-[r, r], 2*r, 2*r],'Curvature',1,'EdgeColor','k','FaceColor','r'); % draw L5

line([trojan1_pos(1), 0],[trojan1_pos(2), 0], 'Color', 'k', 'LineStyle', '--');
line([trojan1_pos(1), -0.9877],[trojan1_pos(2), 0], 'Color', 'k', 'LineStyle', '--');

line([trojan2_pos(1), 0],[trojan2_pos(2), 0], 'Color', 'k', 'LineStyle', '--');
line([trojan2_pos(1), -0.9877],[trojan2_pos(2), 0], 'Color', 'k', 'LineStyle', '--');

legend([p1 p2 p3 p4 p5],'$C_1=3.3$','$C_2=3.19$','$C_3=3.08$','$C_4=3.0242$','$C_5=3.01$','Location','southeast','interpreter','latex');
hold off;