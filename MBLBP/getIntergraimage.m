% This function just using to obtain the Intergral image
% Hunan University
% Edit 25.01.2013
% if you find anything wrong,just not hesitate to email me
% hudalikm@163.com
% look for paper "Robust real time object detection" for details
function Intergraimage=getIntergraimage(img)
if ndims(img)==3
    img=rgb2gray(img);% »Ò¶È
end
img=double(img); % transform to double
Intergraimage.img=cumsum(cumsum(img,1),2); % the intergral image
% IntegralImages.ii=padarray(IntegralImages.ii,[1 1], 0, 'pre');
Intergraimage.width = size(Intergraimage.img,2);
Intergraimage.height = size(Intergraimage.img,1);
end