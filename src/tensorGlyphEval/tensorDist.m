function d=tensorDist(D1,D2,type)
%
%
% File  : tensorDist.m
% Author: Cagatay Demiralp (cad)
% Desc  :  
%
% 	Input  :
%
% 	Output :
%
% 	Example: 
%
% Date    : Thu Mar 29 16:49:48 2012
% Modified: $Id$
%
%
if (nargin<2)
  error('tensorDist:argchk', 'insufficient number of args'); 
elseif(nargin<3)
    type='euclidean';   
end

if(strcmp(type,'euclidean'))

  delta = (D1 - D2).^2;
  d = sqrt(sum(delta(:))); 
elseif(strcmp(type,'riemannian'))

  [u,s] = svd((D1^-0.5)*D2*(D1^-0.5)); 
  d     = sqrt(sum(log(diag(s)).^2));

end 
  

