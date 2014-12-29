function  [ur,ll] = boundingBox(X) 
%
%
% File  : boundingbox.m
% Author: Cagatay Demiralp
% Desc  : 
%
% 	Input  :
%
% 	Output :
%
% 	Example: 
%
% Date    : Wed Mar 30 20:42:50 2011
%
%
if (nargin < 1)
  error('boundingBox:ArgChk', 'Insufficient number of input args'); 
end

ur = max(X); 
ll = min(X); 

