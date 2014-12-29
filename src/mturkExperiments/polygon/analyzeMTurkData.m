function analyzeMTurkData()

F = dlmread('badDataIndex.txt'); 
f = F(:,1); 
d = dlmread('filteredResults.txt');
d(f,:)=[]; % filter out the unreliable subject data   

d = 7-d;
d = normr(d); 
m = mean(d); 
D = zeros(7); 
I = dlmread('pairIndex.txt') - 2 ;
numPairs = 28; 

for i = 1:numPairs 
  k = I(i,1); 
  l = I(i,2); 
  if (k == l) 
    continue; 
  end
  D(k,l) = m(i); 
  D(l,k) = m(i); 
end

imagesc(D)

std(d)
