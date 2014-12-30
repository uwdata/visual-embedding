function  nodes=initMRF(A,k,K,D)
%
%
% File  : initMRF.m
% Author: Cagatay Demiralp (cad)
% Desc  : Initializes the MRF model with the given number of nodes
%         and neighborhood (or connnectivity) matrix. This code is
%         adapted from B. Freeman's vision course.
%
% 	Input  : A - N x N neighboorhod matrix: Aij=1 if the nodes i and j
% 	             are connected otherwise Aij=0
%            k - number of states (labels) that each node can take
%            K - k x k perceptual distance matrix --normalized
%            D - N x N distance matrix 
% 	Output : nodes - the mrf model
%
% Date    : Fri Mar 16 23:39:35 2012
%
%

if (nargin ~= 4 )
    error('initMRF:argchk','insufficient num of input arguments!');
end

N=size(A,1);  % number of nodes

nodes = cell(N,1);

	% K = floor(1000*K); 
	% D = floor(1000*D); 

for i=1:N
    
    % initially each label is equally probable
    nodes{i}.marginal = ones(k,1)/k;
    
    % construct the graph (links)
    links             = find(A(i,:));
    numLinks          = numel(links);
    nodes{i}.numLinks = numLinks;
    nodes{i}.links    = cell(numLinks,1);
    
    for j=1:numLinks
        nodes{i}.links{j}.farsIndex = links(j);
        nodes{i}.links{j}.propMat   = getPropMat(i,j);
    end
    
end


% check bidirectionality
for i=1:N
    
    for j=1:(nodes{i}.numLinks)
        
        fi = nodes{i}.links{j}.farsIndex;
        nhits=0;
        for k = 1:nodes{fi}.numLinks
            if(nodes{fi}.links{k}.farsIndex == i)
                nodes{i}.links{j}.farsLinkToMe = k;
                nhits = nhits+1;
            end
        end
        if (nhits ~=1)
            fprintf(1,'the edge from node %i to node %i does not have a flip edge', i,j);
            error(' ');
        end
    end
end

function C = getPropMat(i,j)
        dij = D(i,j);
        C = exp(-(K-repmat(dij,size(K))).^2);
    end
end

