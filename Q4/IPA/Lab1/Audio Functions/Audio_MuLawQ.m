
function [x_quant, SNR, QError] = Audio_MuLawQ(x,Nbits,Fs)

x=x(:);
u=255;

C = sign(x).*log(1+u*abs(x))/log(1+u); % u-law compressor
Delta = 2/(2^Nbits -1); % Compute the quantization step
q = round(C/Delta) * Delta; % Quantize u-law
x_quant = sign(q).*((1+u).^abs(q)-1)/u; % u-law expander

Interval = round(length(x)/2):round(length(x)/2)+min(10000,round(length(x)/2)-1); % Define a temporal interval
figure(2); plot(Interval,x(Interval),'-.',Interval,x_quant(Interval),'x')
legend('Original signal','Quantized signal'); title('Signal quantization')
figure(3); plot(Interval,x(Interval),Interval,x(Interval)-x_quant(Interval));
title('Quantization Error')

QError=x-x_quant;

SNR=10*log10((x'*x)/(QError'*QError));

sound(x_quant,Fs)