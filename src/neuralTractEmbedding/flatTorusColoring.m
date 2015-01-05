function C = flatTorusColoring(coord, sensitivity) 
%
% flatTorusColoring - Colors given 2D coords by embedding them 
%                     on a flat torus in the CIELAB color space.    
%                   
%
% INPUT 
%       coord       - N by 2 matrix containing 2D coords. 
%       sensitivity - uniform scale value for the bounding 
%                     plane of the torus. 
%  
% OUTPUT 
%
%       C           -  N by 3 matrix of colors  
%

ll = 50; 
lh = 84; 
al = -50; 
ah = 70; 
bl = -20; 
bh = 70; 

max_x = max(coord(:,1)); 
min_x = min(coord(:,1)); 
max_y = max(coord(:,2)); 
min_y = min(coord(:,2)); 

%lc= [min_x max_y]; 
%rc= [max_x min_y]; 
w = max_x - min_x; 
h = max_y - min_y;

% origin  
ol = 0.5 * (lh + ll);
oa = 0.5 * (ah + al); 
ob = 0.5 * (bh + bl); 

nscale = w; 

if(h<w) 
  nscale = h; 
end
% scale points into 0-2*pi interval 
X= ((coord(:,1) - min_x)./nscale)*2*pi; 
Y= ((coord(:,2) - min_y)./nscale)*2*pi; 

%lab scales 
lscale = lh - ll;
ascale = ah - al; 
bscale = bh - bl;

r1 = lscale*0.5; 
r2 = (ascale-lscale)*0.5; % assumes ascale > lscale  
r3 = bscale*0.5; 

% adjust sensitivity 
X = X * sensitivity; 
Y = Y * sensitivity; 

if(h>w)
% map x = l, y = a & b  
L = r1*sin(X); 
a = r2*cos(Y); 
b = r1*cos(X)+r3*sin(Y); 
else 
% map y = l, x = a & b 
L = r1*sin(Y); 
a = r2*cos(Y); 
b = r1*cos(X)+r3*sin(Y);
end;

% translate to the center of the cubic region 
% [45 95 -50 70 -20 70];   
L = L + ol; 
a = a + oa; 
b = b + ob; 

% get colors 
C = applycform([L a b], makecform('lab2srgb')); 

