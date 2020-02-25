function ima = Image_Read()
% READ_IMAGE Reads BMP files to intensity images of class double
%
%  ima = read_image() uses uigetfile to select an image file 
%  and then reads the image and converts it to intensity values
%  of class double.
%
%  See also IMREAD, IND2GRAY, RGB2GRAY
%
% PS Jan98
% JRC Feb98, josep@gps.tsc.upc.es
% TG Mar16

name = uigetfile({'*.png'});
if name==0, ima=[]; return, end
info=imfinfo(name);

switch info.ColorType
    case 'grayscale'
        ima= double(imread(name));   
    case 'indexed'
        [ima,map]=imread(name);
        ima=ind2gray(ima,map);   
    case 'truecolor' 
        rgb=imread(name);
        if isa(rgb,'uint8')
            ima=double(rgb2gray(rgb));
        else
            ima=rgb2gray(rgb);
        end 
end

ima=double(ima)/255;
