[Xaxis,Yaxis] = meshgrid(-1.5:0.005:1.5);
M = 0.0121529;

cm = [1 1 1
    1 0 0];

r1 = sqrt((Xaxis - M).^2 + Yaxis.^2);
r2 = sqrt((Xaxis - M + 1).^2 + Yaxis.^2);
O = (Xaxis.^2 + Yaxis.^2)/2 + (1 - M)./r1 + M./r2 + (M*(1 - M))/2;

C = [3.3 3.19 3.08 3.0242 3.01];

for i = 1:5
    figure('Name', ['Complement de la regió de Hill per a la constant de Jacobi ', num2str(C(i)), ' (pitja una tecla per continuar)']);
    hold on;
    [row, col] = find(2*O < C(i));
    axis([-1.5 1.5 -1.5 1.5]);
    scatter(col/200 - 1.5, row/200 - 1.5, 'r.');
    grid on;
    xlabel('x'); ylabel('y');
    hold off;
    pause;
    close;
end