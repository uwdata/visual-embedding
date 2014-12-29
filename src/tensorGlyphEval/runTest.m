function  [] = runTest()
%
%
% File  : runTest.m
% Author: Cagatay Demiralp 
% Desc  :
%
% 	Input  :
%
% 	Output :
%
% 	Example:
%
% Date    : Thu Mar 29 19:24:26 2012
D         = zeros(3);
D(1:4:end)= [2.1 2 1];
d         = D;
rho       = linspace(0, pi/2, 6);
campos    = load('neal9.txt');
camdist   = 20;
campos    = camdist*campos(:,1:3);
for i = 1:size(campos,1)
    for j=1:6

         D = rotateTensor(d, 'z', rho(j));

         h=figure;
         superQuadricTensor(D,1,campos(i,:))
         print(h, '-dpng', '-r72',['data/test/q' int2str(i) int2str(j) '.png']);

         h=figure;
         cuboidTensor(D,campos(i,:));
         print(h, '-dpng', '-r72',['data/test/c' int2str(i) int2str(j) '.png']);

    end
end

    
