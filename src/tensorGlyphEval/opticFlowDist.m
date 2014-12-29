function  d = opticFlowDist(I1,I2)
%
%
% File  : opticFlowDist.m
% Author: Cagatay Demiralp (cad)
% Desc  : 
%
% 	Input  :
%
% 	Output :
%
% 	Example: 
%
% Date    : Wed Apr 18 22:39:31 2012
% Modified: $Id$
%
%
if (nargin~=2 )
  error('opticFlowDist:ArgChk', 'Insufficient number of input arguments'); 
end
v  = estimate_flow_interface(I2, I1);
D  = sum(v.^2,3);
d  = sqrt(sum(D(:)));


