function   cuboidTensor(D, campos)
%
% File  : cuboidTensor.m
% Author: Cagatay Demiralp (cad)
% Desc  : 
%
% 	Input  :
%
% 	Output :
%
% 	Example: 
%
% Date    : Thu Mar 29 02:23:21 2012
% Modified: $Id$
%
%


[u,s] = svd(D); 
xyz   =1.5*([0 0 0; 1 0 0; 1 1 0; 0 1 0; 0 0 1; 1 0 1; 1 1 1; 0 1 1]-0.5); 
% xyz   =xyz; 
faces =[1 2 6 5; 2 3 7 6; 3 4 8 7; 4 1 5 8; 1 2 3 4; 5 6 7 8]; 
xyz   =(u*s*xyz')';




h     =patch('Vertices',xyz,'Faces',faces,'FaceColor','interp'); 

shading interp;
% lighting phong; 
material dull; 

set(gcf, 'renderer', 'zbuffer'); 
% this is necessary to prevent Matlab's seam problem
vn = get(h,'VertexNormals');
vnSeam = mean(vn(:,[1,end],:),2);
vnNew = vn;
vnNew(:,[1,end],:) = repmat(vnSeam,[1 2 1]);
axis equal; 
axis off; 
box off; 


 
set(h, 'FaceColor', [0.85 0.85 0.85], 'EdgeColor', [ 0 0 0 ]); 
set(gca,'camerapositionmode', 'manual','cameraviewanglemode','manual');
set(gca,'cameraposition', campos, 'cameratarget', [0 0 0], 'cameraviewangle', 15); 
camlight('right'); 

