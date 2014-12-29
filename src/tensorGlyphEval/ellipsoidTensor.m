function   ellipsoidTensor(D)
%
%
% File  : plotTensor.m
% Author: Cagatay Demiralp (cad)
% Desc  : Plots a given second order tensor as an ellipsoid at p0.    
%
% 	Input  : 
% 	       : D -  3 x 3 second order symmetric tensor  
%
% 	Output : 
%
% 	Example: 
%
% Date    : Mon Feb 20 18:37:57 2012
% Modified: $Id$
%

[u,s] = svd(D); 

% [x,y,z]=sphere(32); 
[x,y,z]=sphere(128); 
d = size(x); 
xyz =[x(:) y(:) z(:)]'; 
 xyz= u*(s)*xyz;
%  xyz= u*(s.^0.5)*xyz;

x = reshape(xyz(1,:)', d); 
y = reshape(xyz(2,:)', d); 
z = reshape(xyz(3,:)', d); 
h=surf(x,y,z); 
glyphVis(h);
axis equal; 


