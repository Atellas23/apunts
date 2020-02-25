function Display_Images(varargin)
% DISPLAY_IMAGES  Normalized display of 1, 2, 3 or 4 intensity images
%
%  Display_Images(im1, im2, im3, ...) displays the intensity images 
%  im1, im2, ... using subimage and imshow.
%  Each displayed image is normalized for display between its 
%  minimum and maximum intensity values
%
%  See also IMSHOW, SUBIMAGE
%
%  Alternativa: Display_Images(im1, [min,max], ...), on [min,max] són els
%  valors mínim i màxim (marge dinàmic) de la represetació de la imatge.
%
% JRC Feb98, josep@gps.tsc.upc.es. Versió 2, juny16.

nvar=length(varargin);

qim=[];
for i=1:nvar
    if ~(size(varargin{i})==[1,2]); qim=[qim,i]; end
end
N=length(qim);
for i=1:N
    switch i
        case 1
            im1=varargin{qim(1)}; mM1=[];
            if nvar>qim(1), aux=varargin{qim(1)+1};
                if size(aux)==[1,2]; mM1=aux; end
            end
        case 2
            im2=varargin{qim(2)}; mM2=[];
            if nvar>qim(2), aux=varargin{qim(2)+1};
                if size(aux)==[1,2]; mM2=aux; end
            end
        case 3
            im3=varargin{qim(3)}; mM3=[];
            if nvar>qim(3), aux=varargin{qim(3)+1};
                if size(aux)==[1,2]; mM3=aux; end
            end
        case 4
            im4=varargin{qim(4)}; mM4=[];
            if nvar>qim(4), aux=varargin{qim(4)+1};
                if size(aux)==[1,2]; mM4=aux; end
            end
        case 5
            im5=varargin{qim(5)}; mM5=[];
            if nvar>qim(5), aux=varargin{qim(5)+1};
                if size(aux)==[1,2]; mM5=aux; end
            end
    end
end


switch N
    case 5
        subplot(2,3,1), imshow(im1,mM1); title('Image 1');
        subplot(2,3,2), imshow(im2,mM2); title('Image 2');
        subplot(2,3,3), imshow(im3,mM3); title('Image 3');
        subplot(2,3,4), imshow(im4,mM4); title('Image 4');
        subplot(2,3,5), imshow(im5,mM5); title('Image 5');
    case 4
        subplot(2,2,1), imshow(im1,mM1); title('Image 1');
        subplot(2,2,2), imshow(im2,mM2); title('Image 2');
        subplot(2,2,3), imshow(im3,mM3); title('Image 3');
        subplot(2,2,4), imshow(im4,mM4); title('Image 4');
    case 3
        subplot(1,3,1), imshow(im1,mM1); title('Image 1');
        subplot(1,3,2), imshow(im2,mM2); title('Image 2');
        subplot(1,3,3), imshow(im3,mM3); title('Image 3');
    case 2
        subplot(1,2,1), imshow(im1,mM1); title('Image 1');
        subplot(1,2,2), imshow(im2,mM2); title('Image 2');
    case 1
        imshow(im1,mM1); title('Image 1');
    otherwise
        error('You can only visualize 1, 2, 3, 4 or 5 images with this function');
end
set(gcf,'visible','off')

linkaxes, zoom on
set(gcf,'units','normalized','outerposition',[0 0 1 1],'visible','on')
impixelinfo