function  [V,vol] = regPolygon(n,draw)
%
%
% File  : regPolygon.m
% Author: Cagatay Demiralp (cad)
% Desc  : creates a regular  n-gon
%
% 	Input  :
% 	        n    - number of sides (i.e., n>=3)
%           draw - flag variable to draw the resulting polygon
%
% 	Output :
%           V - vertex list
%
% 	Example:
%
% Date    : Sat Mar 26 23:29:48 2011
% Modified: $Id$
%
%
if (nargin< 1)
    n = 3;
    draw = 0;
elseif(nargin<2)
    draw =0;
    if(~(n>=3))
        error('regPolygon:argchk','number of sides should be bigger than 3!');
    end
end
r=1;
if(n == 9)
    n=256; 
end
t = linspace(0,2*pi,n+1);
xy =[r*cos(t);
    r*sin(t)];

a=pi/2;
if (n == 4)
    a = pi/4;
    
end
% rotate w/ pi/4 ccw
xy = [cos(a) -sin(a); sin(a) cos(a)]*xy;
if( n == 3)
    xy = xy+repmat([0;-0.2], 1, size(xy,2));
end

if(draw)
    figure(gcf);
    set(gca, 'XLim', [-2, 2], 'YLim', [-2, 2], 'DataAspectRatio', [1 1 1]);
    plot(xy(1,:), xy(2,:), 'LineWidth',4,'Color','k');
    axis equal;
    axis off;
    box off;
end
V = xy';
vol =(0.25*n*(norm(V(1,:)-V(2,:)))^2*cot(pi/n)); 
