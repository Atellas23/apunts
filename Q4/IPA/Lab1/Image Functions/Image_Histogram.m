function Image_Histogram(varargin)
% HISTOGRAM Displays the histogram of intensity images
%
%  Histogram(imain) displays the image and its histogram 
%  in a window, using imhist.
%
%  See also imhist
%
% JRC Feb98, josep@gps.tsc.upc.es
% TG Mar16

nima=length(varargin);

if (nima>5)||(nima<1)
   error('Sintax: Histograma(input_image1,input_image2,input_image3,input_image4,input_image5)');
end

[~,x] = imhist(varargin{1}); Mn=x(1); Mx=x(end);
for i=1:nima
    imain=varargin{i};
    ha(i)=subplot(nima,2,2*i-1); imshow(imain,[Mn,Mx]);%imshow(imain,[]);%imshow(imain,[0,1]);
    subplot(nima,2,2*i), imhist(imain); axis('tight'); grid on
end
linkaxes(ha)
%zoom on
impixelinfo


