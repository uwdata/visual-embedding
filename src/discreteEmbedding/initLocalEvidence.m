function  nodes = initLocalEvidence(nodes,k)
%
%
% File  : initLocalEvidence.m
% Author: Cagatay Demiralp
% Desc  : Initializes the local evidence (related to data cost) 
% 	      for a given mrf. Adapted from Bil Freeman's toy MRF 
% 	      example.  
%
%
% 	Input  : nodes - N x 1 cell of mrf graph nodes with neighborhood 
% 	                 structures.  N is the number of nodes. 
%            k     - the number of the states 
% 	Output : nodes - N x 1 cell of mrf  graphs nodes with initialized 
% 	                 local evidence
% 	Example: 
%
% Date    : Sat Mar 17 16:55:52 2012
%
%
if (nargin ~= 2 )
  error('initLocalEvidence:argChk','insufficient number of input args'); 
end

numOfNodes = size(nodes,1); 
assert(numOfNodes>1); 

for i=1:numOfNodes
  nodes{i}.localEvidence = ones(1,k)/k;  % local is the same everywhere
end                                      % this is a good place to put 
                                         % hard constraints on nodes



