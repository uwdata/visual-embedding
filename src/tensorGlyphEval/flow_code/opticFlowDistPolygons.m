function  [] = opticFlowDistPolygons()
%
%
% File  : opticFlowDistPolygons.m
% Author: Cagatay Demiralp (cad)
% Desc  : Computes the optic flow distances between the polygonal icons
%         used in the mturk study.  
%
% 	Input  :
%
% 	Output :
%
% 	Example: 
%
% Date    : Mon Jul  1 01:38:33 2013
% Modified: $Id$
%
%

D=zeros(7,7); 

prefix='../../mturk/userstudy/src/polygonImages/p';
for i=3:9
  Ii = rgb2gray(imresize(imread([prefix int2str(i) '.png']),0.25)); 
  for j=3:9
    Ij = rgb2gray(imresize(imread([prefix int2str(j) '.png']),0.25)); 
    v  = estimate_flow_interface(Ii, Ij);
    S  = sum(v.^2,3);
    D(i-2,j-2)= sqrt(sum(S(:)));
end
end

dlmwrite('opticPolygonDistance.txt', D, 'delimiter', ' '); 

D(1:8:end)=0; 

dlmwrite('opticPolygonDistanceZeroDiag.txt', D, 'delimiter', ' '); 


 
    

