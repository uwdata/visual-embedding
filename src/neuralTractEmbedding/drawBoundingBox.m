function  [ur,ll,V,I] = drawBoundingBox(X) 
%
%
% File  : drawBoundingBox.m
% Author: Cagatay Demiralp
% Desc  : Draws the bounding box of a given point set.  
% 
% 	INPUT 
%          X: n by d matrix of points    
%
% 	OUTPUT 
%
% 
%
% 	Example: 
%
% Date    : Wed Mar 30 20:38:50 2011
%
%
if (nargin < 1)
  error('drawBoundingBox:ArgChk', 'Insufficient number of input args!'); 
end

[ur,ll]=boundingBox(X); 
V =  [ll; %1 
     [ll(1) ur(2) ll(3)]; %2
     [ur(1) ur(2) ll(3)]; %3
     [ur(1) ll(2) ll(3)]; %4
     [ll(1) ll(2) ur(3)]; %5
     [ll(1) ur(2) ur(3)]; %6 
     [ur(1) ur(2) ur(3)]; %7
     [ur(1) ll(2) ur(3)]];%8 

I = [1 2;
     2 3;
     3 4;
     4 1;
     5 6;
     6 7;
     7 8;
     8 5;
     1 5;
     2 6;
     3 7;
     4 8]; 

 for i=1:size(I,1)
     line(V(I(i,:),2),V(I(i,:),3),V(I(i,:),1), ...
     'LineWidth', 4, 'Color', 'black'); 
     hold on; 
 end

axis equal; 

