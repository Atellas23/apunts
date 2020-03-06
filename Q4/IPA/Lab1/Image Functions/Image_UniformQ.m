function [output_image,mseval,psnrval]= Image_UniformQ(input_image, N);
%	UNIFORM QUANTIZER with N levels %	
%	output_image=uniform_quanizer(input_image, N)  
%	quantizes a float valued image input_image 
% with N uniform discrete levels %
% DIVP, Sep05

if (max(max(input_image))>1)
    error('the pixels of the input image of intensity (grayscale) values should be between 0.0-1.0')
end

if (N>1)
output_image = round((N-1)*input_image)/(N-1);
else
	error('The number of gray levels requested should be greater than 1');
end
mseval= std2(input_image-output_image)^2;
psnrval= -10*log10(mseval);
return  
