function  d = gaborImgDist(I1,I2)
%
%
% File  : gaborImgDist.m
% Author: Cagatay Demiralp (cad)
% Desc  : 
%
% 	Input  :
%
% 	Output :
%
% 	Example: 
%
% Date    : Fri Mar 30 17:40:58 2012
% Modified: $Id$
%
%

I1 = single(I1); 
I2 = single(I2); 

lambda  = 4;
theta   = 0;
psi     = [0 pi/2];
gamma   = 1;
bw      = 1;
N       = 4;

[r,c]=size(I1); 
gaborI1 =  zeros(r,c,3); 
gaborI2 =  gaborI1; 

for i=1:N
  gb = gabor_fn(bw,gamma,psi(1),lambda,theta)...
        + 1i * gabor_fn(bw,gamma,psi(2),lambda,theta);
    % gb is the n-th gabor filter
    gaborI1(:,:,i) = imfilter(I1, gb, 'symmetric');
    gaborI2(:,:,i) = imfilter(I2, gb, 'symmetric');
    % filter output to the n-th channel
    theta = theta + 2*pi/N;
    % next orientation
end


gaborI1 = sum(abs(gaborI1).^2, 3).^0.5; 
gaborI1 = gaborI1./max(gaborI1(:)); 
gaborI2 = sum(abs(gaborI2).^2, 3).^0.5;
gaborI2 = gaborI2./max(gaborI2(:)); 

figure; imshow(gaborI1); 
figure; imshow(gaborI2); 

d = (gaborI1 - gaborI2).^2; 
d = (sum(d(:))).^0.5; 
