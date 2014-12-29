function [V n] = readTracts(fn)
C = dlmread(fn);
n = C(1,1);  % num of tracts  
cnt = 2;
for i=1:n
    m = C(cnt,1); % num of points sampled on the tract 
    cnt = cnt+1;
    V{i}=C(cnt:cnt+m-1,1:3);
    cnt = m+cnt;
end

