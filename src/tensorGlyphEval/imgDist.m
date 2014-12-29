function  d = imgDist(img1,img2)
% File  : imgDist.m
% Author: Cagatay Demiralp (cad)
% Desc  : SSD distances in lab color space   
%
% 	Input  :
%
% 	Output :
%
% 	Example: 
%
% Date    : Thu Mar 29 16:44:44 2012
% Modified: $Id$
%
%
if (nargin~=2)
  error('imgDist:argchk', 'incorrect number of args'); 
end



I1rgb=imresize(imread(img1), 0.25);
I2rgb=imresize(imread(img2), 0.25); 
I1 = (rgb2gray(I1rgb)); 
I2 = (rgb2gray(I2rgb)); 
%  x = (edge(I1, 'canny', 0.1, 2));
%  y = (edge(I2, 'canny', 0.1, 2));
%  
%   
%  
% d(1) = (sum((abs(x(:)-y(:))).^2)).^0.5;
% d(2) = (sum((I1(:)-I2(:)).^2)).^0.5; 
% x = double(rgb2gray(I1rgb)<240); 
% y = double(rgb2gray(I2rgb)<240); 
% d(3) = (sum(abs(x(:)-y(:)).^2)).^0.5; 
% figure; 
%  imshow(x)
%  figure
%  imshow(y)

%x = (edge(I1, 'sobel'));%, 0.01, 2));
%y = (edge(I2, 'sobel'));%, 0.01, 2));
 %^d(4) = sum(abs(x(:)-y(:)));

%  [k, d1]=vl_sift(I1); 
%  figure; 
%  vl_plotsiftdescriptor(d1); 
%  [k, d2]=vl_sift(I2); 
%  figure;
%  vl_plotsiftdescriptor(d2); 
%  [m, s]=vl_ubcmatch(d1,d2); 
 
%  d(4) = sum(s); %
 % d(4) = gaborImgDist(I1, I2); 

%  d(4) = opticFlowDist(I1,I2); 
  d = opticFlowDist(I1,I2); 
  
% cform = makecform('srgb2lab');
% I1= applycform(I1rgb,cform); 
% I2= applycform(I2rgb,cform); 
%delta = (I1rgb - I2rgb).^2; 
%d = sqrt(sum(delta(:))); 

