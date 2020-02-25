
function [x_quant, SNR, QError] = Audio_UniformQ(x,Nbits,Fs)

x=x(:);
Delta = 2/(2^Nbits -1); 	% Compute the quantization step

x_quant=round(x/Delta) * Delta; % Quantize

Interval = round(length(x)/2):round(length(x)/2)+min(10000,round(length(x)/2)-1); % Define a temporal interval
figure(2); plot(Interval,x(Interval),'-.',Interval,x_quant(Interval),'x')
legend('Original signal','Quantized signal'); title('Signal quantization')
figure(3); plot(Interval,x(Interval),Interval,x(Interval)-x_quant(Interval));
title('Quantization Error')

QError=x-x_quant;

SNR=10*log10((x'*x)/(QError'*QError));

sound(x_quant,Fs)