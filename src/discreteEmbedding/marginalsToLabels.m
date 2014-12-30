function  L = marginalsToLabels(nodes)
%
%
% File  : marginalsToLabels.m
% Author: Cagatay Demiralp (cad)
% Desc  : Convert marginal beliefs to labels. Right now, we take the
%         index of the maximum belief value.   
%
% 	Input  : nodes - N x 1 cell containing the mrf graph with N nodes.   
%
% 	Output :     L - N x 1 matrix of labels (\in 1 and k states)   
%
% 	Example: 
%
% Date    : Sat Mar 17 18:00:49 2012
% Modified: $Id$
%
%
if (nargin ~= 1)
  error('marginalsToLabels:argChk','insufficient number of input arguments'); 
end

numOfNodes = size(nodes,1); 
L = zeros(numOfNodes,1); 
for i=1:numOfNodes
   [~,L(i)]=max(nodes{i}.marginal); 
end 


