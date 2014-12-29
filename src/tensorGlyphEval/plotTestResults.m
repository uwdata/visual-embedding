function  [] = plotTestResults()
%
%
% File  : plotTestResults.m
% Author: Cagatay Demiralp
% Desc  : 
%
% 	Input  :
%
% 	Output :
%
% 	Example: 
%
% Date    : Thu Mar 29 19:25:03 2012
%

% num of cameras 
numCampos =  9;

c = zeros(9,6);
q = zeros(9,6);

for i=1:numCampos
    imgc1 = ['data/test/c' int2str(i) '1.png'];
    imgq1 = ['data/test/q' int2str(i) '1.png'];
    t = zeros(6,1);
    D = zeros(3);
    D(1:4:end)=[2.1 2 1];
    d = D;
    rho = linspace(0, pi/2, 6);
    fprintf(1, '** camera position %d ...', i); 
    for j=2:6
        D = rotateTensor(d, 'z', rho(j));
        imgc  = ['data/test/c' int2str(i) int2str(j) '.png'];
        imgq  = ['data/test/q' int2str(i) int2str(j) '.png'];
        c(i,j)= imgDist(imgc1, imgc);
        q(i,j)= imgDist(imgq1, imgq);
        t(j)  = tensorDist(d,D);
    end
    fprintf(1,'done! **\n'); 
end

c = mean(c); 
q = mean(q); 

figure;
plot(c);
title('cuboid');

figure;
plot(q);
title('quadric');

figure;
plot(1:6, t);
title('tensor');

