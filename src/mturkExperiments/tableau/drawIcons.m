function  [] = drawIcons(p,l,c)
%
% File  : drawIcons.m
% Author: Cagatay Demiralp (cad)
% Desc  : Draws icons at given locations. The goal is to illustrate 
%         discrete embedding in the simple icon space for which 
%         we estimated the perceptual distances using Amazon 
%         Mechanical Turk. 
%
% 	Input  :
%
% 	Output :
%
% 	Example: 
%
% Date    : Wed May  2 17:35:34 2012
% Modified: $Id$
%
V     = cell(10,1);
V{1} = regPolygon(3,0); % triangle
V{2} = regPolygon(4,0); % square 
V{3} = [0 1; 0 -1; NaN NaN; 1 0; -1 0]; % plus  
V{4} = [cos(pi/4) sin(pi/4); -cos(pi/4) -sin(pi/4); NaN NaN; -cos(pi/4) sin(pi/4); cos(pi/4) -sin(pi/4)]; % cross   
V{5} = [V{3}; NaN NaN; V{4}] ; % star 
V{6} = ([cos(pi/4) -sin(pi/4); sin(pi/4) cos(pi/4)]*(V{2})')';    % diamond 
V{7} = ([cos(pi/2) -sin(pi/2); sin(pi/2) cos(pi/2)]*(V{1})')'; % left triangle     
V{8} = ([cos(-pi/2) -sin(-pi/2); sin(-pi/2) cos(-pi/2)]*(V{1})')'; % right triangle
V{9} = ([cos(pi) -sin(pi); sin(pi) cos(pi)]*(V{1})')' ; 
V{10}=0.9*regPolygon(9,0);  


hold on  ; 
scale=1.2;
N = size(p,1); 

for i=1:N
    x      = scale*V{l(i)};% translate to the position
    x(:,1) = p(i,1)+x(:,1);
    x(:,2) = p(i,2)+x(:,2);
    line(x(:,1), x(:,2), 'Color', c, 'LineWidth',1.5); 
end

axis equal; 

