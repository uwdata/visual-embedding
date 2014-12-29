function Y = embedTracts(distmat, dim, tractfile, tubifyinput)
%
%
% File  : embedTracts.m
% Author: Cagatay Demiralp 
% Desc  : Embeds three-dimensional neural tracts in CIELAB color space. 
%
% 	Input  :
%
% 	Output :
%
%
[V,n] = readTracts(tractfile); 
fid = fopen(distmat,'r'); 
D = fread(fid, [n n], 'double');
Y = cmdscale(D); 
Y = Y(:,1:dim); 

if(dim == 2)
  sensitivity = 1;
  C = flatTorusColoring(Y,sensitivity);
else

  bbox     = [40 -50 -60; 80 80 70]; % in lab
  midpt    = mean(bbox);
  [~,Y]    = princomp(Y); 
  bboxsize = abs(bbox(1,:)-bbox(2,:)); % h w d
  max_Y  = max(Y);
  min_Y  = min(Y);
  size_Y = max_Y - min_Y;
  [~,I] = sort(bboxsize,'descend');
  [~,J] = sort(size_Y,'descend');
  N     = size(Y,1);
  Y     = Y - repmat(min_Y,N,1);
  Y     = Y - repmat(mean(Y), N,1); 
  Y(:,J(1)) = Y(:,J(1))./size_Y(J(1));
  Y(:,J(2)) = Y(:,J(2))./size_Y(J(2));
  Y(:,J(3)) = Y(:,J(3))./size_Y(J(3));
  
  Y(:,J(1))=Y(:,J(1))*bboxsize(I(1))+midpt(I(1));
  Y(:,J(2))=Y(:,J(2))*bboxsize(I(2))+midpt(I(2));
  Y(:,J(3))=Y(:,J(3))*bboxsize(I(3))+midpt(I(3));
  lab = zeros(size(Y)); 
  lab(:, I(1))=Y(:,J(1)); 
  lab(:, I(2))=Y(:,J(2)); 
  lab(:, I(3))=Y(:,J(3)); 
  Y = lab; 
  C = applycform(lab, makecform('lab2srgb')); 
end

writeTracts(V,tubifyinput,C); 

