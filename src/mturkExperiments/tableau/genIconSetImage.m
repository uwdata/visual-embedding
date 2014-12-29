function  [] = genIconSetImage()
%
%
% File  : genIconSetImage.m
% Author: Cagatay Demiralp (cad)
% Desc  : 
%
% 	Input  :
%
% 	Output :
%
% 	Example: 
%
% Date    : Fri Mar 30 23:45:16 2012
% Modified: $Id$
%
%

V = cell(10,1);
V{7} = regPolygon(3,0); % triangle
V{2} = regPolygon(4,0); % square 
V{3} = [0 1; 0 -1; NaN NaN; 1 0; -1 0]; % plus  
V{4} = [cos(pi/4) sin(pi/4); -cos(pi/4) -sin(pi/4); NaN NaN; -cos(pi/4) sin(pi/4); cos(pi/4) -sin(pi/4)]; % cross   
V{5} = [V{3}; NaN NaN; V{4}] ; % star 
V{6} = ([cos(pi/4) -sin(pi/4); sin(pi/4) cos(pi/4)]*(V{2})')'; % diamond 
V{9} = ([cos(pi/2) -sin(pi/2); sin(pi/2) cos(pi/2)]*(V{7})')'; % left triangle     
V{10} = ([cos(-pi/2) -sin(-pi/2); sin(-pi/2) cos(-pi/2)]*(V{7})')'; % right triangle
V{8} = ([cos(pi) -sin(pi); sin(pi) cos(pi)]*(V{7})')' ; % down triangle 
V{1}=0.9*regPolygon(9,0);  



for i=1:10
  v = V{i}; 
  v = v+repmat([(i-1)*3, 0],size(v,1),1);
  plot(v(:,1), v(:,2), 'LineWidth',4,'Color','k');
  set(gca, 'XLim', [-3, 32], 'YLim', [-2, 2], 'DataAspectRatio', [1 1 1]);
  axis equal;
  axis off;
  box off; 
  hold on; 
end 
  print(gcf, '-deps', 'Vi.eps');

