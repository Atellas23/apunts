function [imaq,mseval,psnrval, th]=Image_MaxLloydQ(ima,L,valini)

% Optimum quantization (Max_Lloyd)
%
% Format: [imaq,llindars]=MaxLloyd_Quantizer(ima,L,valini)
%         ima: Input image
%           L: Number of levels
%      valini: Initial values (optional). Defaut: uniform distribution
%        imaq: Quantized image
%          th: Thresholds
%


if (max(max(ima))>1)
    error('the pixels of the input image of intensity (grayscale) values should be between 0.0-1.0')
end

[N,M]=size(ima);
max_ima=double(max(max(ima)));
min_ima=double(min(min(ima)));
if nargin<3 
    valini=(1:2:2*L)*(max_ima-min_ima)/L/2; 
    valini = valini + min_ima;
end
aux=reshape(ima,M*N,1);
[th,valq] = lloyds(aux,valini);
[~,auxq] = quantiz(aux,th,valq);
imaq=reshape(auxq,N,M);

mseval= std2(ima-imaq)^2;
psnrval= -10*log10(mseval);
