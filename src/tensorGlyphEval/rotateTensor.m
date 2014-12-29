function  D = rotateTensor(D,w,theta) 
%
%
% File  : rotateTensor.m
% Author: Cagatay Demiralp (cad)
% Desc  : 
%
% 	Input  :
%
% 	Output :
%
% 	Example: 
%
% Date    : Wed Feb 29 20:04:28 2012
% Modified: $Id$
%
%
 

if(w == 'x') 
 R = [1 0 0; 0 cos(theta) -sin(theta);  0 sin(theta) cos(theta)]; 
elseif(w  == 'y'); 
 R = [cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)]; 
elseif(w == 'z'); 
 R = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1]; 
else
  error('invalid rotation axis name'); 
end

D=R*D*R'; 

