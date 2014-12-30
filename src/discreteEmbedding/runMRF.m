function l = runMRF(nodes, maxProductFlag, k)

if(nargin< 2)
    maxProductFlag=1; 
end

maxIter = 10;

nodes = initLocalEvidence(nodes,k);
nodes = initBPMessages(nodes,k); 
lprev=zeros(numel(nodes),1); 
for i=1:maxIter
    nodes = oneIterBP(nodes, maxProductFlag);
    nodes = computeBeliefs(nodes);
    l = marginalsToLabels(nodes);
    r=sum(double(l~=lprev))/numel(l);
    fprintf(1, 'iter: %d, relative label change:%f\n', i, r);
    if(r<1e-6) 
        break;
    else
       lprev=l; 
    end
end

