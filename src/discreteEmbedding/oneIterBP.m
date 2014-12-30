function  nodes = oneIterBP(nodes,maxProductFlag)
% File  : oneIterBP.m
% Author: Cagatay Demiralp
% Desc  : Propogate messages in a given MRF. Adapted from the code used in 
%         Bill Freeman's computer vision class at MIT.   
%          
% 
% 	Input  : nodes - N x 1 cell containing the mrf graph with N nodes
%            maxProductFlag -  flag (0 or 1) indicating the desired estimator
%                              0 => sum product (mmse estimator),
%                              1 => max product (map estimator)
%
% 	Output : nodes - N x 1 cell containing the mrf graph with N nodes
% 	                 with updated messages.
%
%
% Date    : Sat Mar 17 17:20:42 2012
%
%
if (nargin ~= 2)
    error('oneIterBP:argChk', 'incorrect number of input arguments');
end

numOfNodes=size(nodes,1);
% Go through every link, and transmit messages near to far
% ----------------------------------------------------------------
fprintf(1, '\nDoing belief propagation for %d nodes:\n', numOfNodes); 

% ----------------------------------------------------------------

for nearIdx = 1:numOfNodes
    
    near = nodes{nearIdx};
    for linkIdx = 1:near.numLinks
        
        % - - - - - - - - - - - - - - - - - - -
        message = near.localEvidence;
        
        link   = near.links{linkIdx};
        farIdx = link.farsIndex;
        far    = nodes{farIdx};
        for link2Idx = 1:near.numLinks
            if (link2Idx ~= linkIdx)
                link2 = near.links{link2Idx};
                if ~isempty(link2.farsMessageToMe)
                    message = message.*link2.farsMessageToMe;
                    message = message./sum(message);
                end
            end
        end
        
        if (maxProductFlag)
            message = max(nodes{nearIdx}.links{linkIdx}.propMat...
                .*repmat(message,size(nodes{nearIdx}.links{linkIdx}.propMat,1),1),[],2)';
            %message = max(nodes{nearIdx}.links{linkIdx}.propMat.*repmat(message,k,1),[],2)';
        else message = (nodes{nearIdx}.links{linkIdx}.propMat * message')';
        end
        
        nodes{ farIdx }.links{ link.farsLinkToMe }.fars_NEXT_MessageToMe = message;
        % - - - - - - - - - - - - - - - - - - -
        
    end
    if (mod(nearIdx,10)==0) fprintf(1, '.'); end;
end

fprintf(1,'\nDone propagating belief\n');

% fprintf(1, 'Clocking.... '); tic

for node = 1:numOfNodes
    for link = 1:nodes{node}.numLinks
        nodes{node}.links{link}.farsMessageToMe = ...
            nodes{node}.links{link}.fars_NEXT_MessageToMe;
    end % links to this node
end % nodes

% fprintf(1, ' ... Done %f secs\n',toc);

