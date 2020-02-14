% f(x) = 1/(1+30*x^2), en el intervalo [-1,1]
f = @(x) 1./(1+30*x.^2);
x = linspace(-1,1,11); % 11 puntos equiespaciados
y = f(x);
fprintf('Intervalo: (%e %e), #punts: %d\n',x(1),x(end),length(x));