function  superQuadricTensor(D,gamma,campos)
%
% File  : superQuadricTensor.m
% Author: Cagatay Demiralp (cad)
% Desc  : Visualizes a given single symmetric second order diffusion tensor
%         with a superquadric.
%
% 	Input  : D - 6 x 6 matrix representing a symmetric diffusion tensor
%
% 	Output :
%
% 	Example:
%
% Date    : Wed Mar 28 18:08:39 2012
% Modified: $Id$
%
if (nargin < 1 )
    error('superQuadricTensor:argchk', 'Insufficient number of input args');
elseif(nargin < 2)
    gamma=4.0;
    campos=[5 5 10]; 
end
n = 32;
p = linspace(0, pi, n);
t = linspace(0, 2*pi, 2*n);

[theta,phi]=meshgrid(t,p);
[u,s]      =svd(D);
eigvals    =diag(s);
[cl,cp]    =westinIndexes(eigvals);

if(cl>= cp)
    alpha   = (1-cp)^gamma;
    beta    = (1-cl)^gamma;
    [x,y,z] = qX(theta,phi,alpha,beta);
else
    alpha   = (1-cl)^gamma;
    beta    = (1-cp)^gamma;
    [x,y,z] =  qZ(theta,phi,alpha,beta);
end

% [x,y,z] =qX(theta,phi,0.5, 0.5);
d      = size(x);
xyz    = [x(:) y(:) z(:)]';
xyz    = u*s*xyz;
x      = reshape(xyz(1,:)', d);
y      = reshape(xyz(2,:)', d);
z      = reshape(xyz(3,:)', d);

h=surf(x,y,z);
axis equal;
glyphVis(h,campos); 
end

function [x,y,z]=qZ(theta,phi,alpha,beta)
x = sign(cos(theta)).*((abs(cos(theta))).^alpha).*sign(sin(phi)).*((abs(sin(phi))).^beta);
y = sign(sin(theta)).*((abs(sin(theta))).^alpha).*sign(sin(phi)).*((abs(sin(phi))).^beta);
z = sign(cos(phi)).*((abs(cos(phi))).^beta);
end

function [x,y,z]=qX(theta,phi,alpha,beta)
x = sign(cos(phi)).*((abs(cos(phi))).^beta);
y =-sign(sin(theta)).*((abs(sin(theta))).^alpha).*sign(sin(phi)).*((abs(sin(phi))).^beta);
z = sign(cos(theta)).*((abs(cos(theta))).^alpha).*sign(sin(phi)).*((abs(sin(phi))).^beta);

end

function [cl,cp,cs]=westinIndexes(eigvals)
z  = sum(eigvals);
cl = (eigvals(1)-eigvals(2))/z;
cp = 2*(eigvals(2)-eigvals(3))/z;
cs = 3*eigvals(3)/z;
end
