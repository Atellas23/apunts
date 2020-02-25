function imaout = Image_Contrast(imain, low_high, min_max, gamma)
% CONTRAST  Contrast modification of graylevel images of class double.
%
%  Contrast(imain, low_high, min_max, gamma) stretches the graylevel 
%  values of imain using the toolbox function imadjust. Then shows the 
%  original and contrasted images and presents along with a linear plot 
%  of the mapping function.
%
%  See also IMADJUST
%
% JRC Feb98, josep@gps.tsc.upc.es
% TG Mar16

inplot= (0:1/255:1)';

if nargin==3
   imaout=imadjust(imain, low_high, min_max);
   outplot=imadjust(inplot, low_high, min_max);
elseif nargin==4
   imaout=imadjust(imain, low_high, min_max, gamma);
   outplot=imadjust(inplot, low_high, min_max, gamma);
else
   error('Sintax: output_image = Contrast(input_image, [low high], [min max], gamma)');
end

subplot(221), plot(inplot,outplot,'k','linewidth',2); axis([0 1 0 1]); grid on
ha(1)=subplot(223); imshow(imain,[0.0 1.0]); title('image input')
ha(2)=subplot(222); imshow(imaout,[0.0 1.0]); title('image output'), linkaxes(ha)
zoom on
hi=impixelinfo;
set(hi,'units','normalized'), pos=get(hi,'position');
pos(1)=0.6;pos(2)=0.2; set(hi,'position',pos);

% subplot(2,2,1), imshow(imain,[0.0 1.0]);
% %colormap([inplot inplot inplot]),colorbar('horiz');
% subplot(2,2,3), plot(inplot,outplot); axis([0.0 1.0 0.0 1.0]);
% %colormap([outplot outplot outplot]),colorbar('vert');
% subplot(2,2,4), imshow(imaout,[0.0 1.0]);
