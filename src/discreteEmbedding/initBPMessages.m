function  nodes = initBPMessages(nodes,k)
%
%
% File  : initBPMessages.m
% Author: Cagatay Demiralp (cad)
% Desc  : Initalizes bp messages to 1. Adapted from Bill Freeman's toy 
%         example. 
%
% 	Input  :
%
% 	Output :
%
% 	Example: 
%
% Date    : Sat Mar 17 17:12:07 2012
% Modified: $Id$
%
%
if (nargin ~= 2 )
  error('initBPMessages:argChk','insuffienct number of input args'); 
end
numOfNodes= size(nodes,1);
for i = 1:numOfNodes
    for j = 1:nodes{i}.numLinks
        nodes{i}.links{j}.farsMessageToMe       = ones(1,k);
        nodes{i}.links{j}.fars_NEXT_MessageToMe = ones(1,k);        
    end
end

