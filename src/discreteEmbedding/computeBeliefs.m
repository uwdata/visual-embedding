function  nodes = computeBeliefs(nodes)
%
%
% File  : computeBeliefs.m
% Author: Cagatay Demiralp (cad)
% Desc  : Update beliefs in BP. Adapted from Bil Freeman's toy MRF 
% 	      example code.  
%
% 	Input  : nodes - N x 1 cell containing the MRF graph with N nodes.   
%
% 	Output : nodes - N x 1 cell containing the MRF graph with N nodes with 
% 	                 updated beliefs. 
%
% 	Example: 
%
% Date    : Sat Mar 17 17:42:22 2012
% Modified: $Id$
%
%
if (nargin~=1)
  error('computeBeliefs:argChk','insufficient number of input args')
end

numOfNodes=size(nodes,1); 
%
% Go through every link, and transmit messages near to far
% ----------------------------------------------------------------
fprintf(1, '\nSetting beliefs for %d nodes:\n', length(nodes)); tic;
% ----------------------------------------------------------------
for nearIdx = 1:numOfNodes     
    near = nodes{nearIdx};
    belief = near.localEvidence;
    for linkIdx = 1:near.numLinks
        link   = near.links{linkIdx};      
        if ~isempty(link.farsMessageToMe)
            belief = belief.*link.farsMessageToMe; % multiply messages
            belief = belief./sum(belief);          % normalize "
        end
    end;
    nodes{nearIdx}.marginal = belief;
end;

fprintf(1,'\nDone setting beliefs: %f secs\n',toc);
