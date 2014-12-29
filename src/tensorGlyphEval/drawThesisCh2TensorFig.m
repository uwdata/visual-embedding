
close all; 
D1 =[2 0 0; 0 2 0 ; 0 0 2]; 
D2 =[0.5 0 0; 0 0.5 0; 0 0 2]; 
D3 =[0.5 0 0; 0 2 0; 0 0 2];
D = [0.5 0 0; 0 0.5 0; 0 0 3];
D4 = rotateTensor(D,'x',-pi/6); 

% D4
%tensors = cell(4,1); 

tensors = {D1,D2,D3,D4}; 

for i=1:4 
    figure(i); 
    ellipsoidTensor(tensors{i}); 
end
tilefig; 
