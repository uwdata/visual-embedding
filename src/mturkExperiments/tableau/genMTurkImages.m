function genMTurkImages
%
%
% generates the images for crowdsourcing

close all;

%local polygons
V = cell(10,1);
V{1} = regPolygon(3,0); % triangle
V{2} = regPolygon(4,0); % square 
V{3} = [0 1; 0 -1; NaN NaN; 1 0; -1 0]; % plus  
V{4} = [cos(pi/4) sin(pi/4); -cos(pi/4) -sin(pi/4); NaN NaN; -cos(pi/4) sin(pi/4); cos(pi/4) -sin(pi/4)]; % cross   
V{5} = [V{3}; NaN NaN; V{4}] ; % star 
V{6} = ([cos(pi/4) -sin(pi/4); sin(pi/4) cos(pi/4)]*(V{2})')';    % diamond 
V{7} = ([cos(pi/2) -sin(pi/2); sin(pi/2) cos(pi/2)]*(V{1})')'; % left triangle     
V{8} = ([cos(-pi/2) -sin(-pi/2); sin(-pi/2) cos(-pi/2)]*(V{1})')'; % right triangle
V{9} = ([cos(pi) -sin(pi); sin(pi) cos(pi)]*(V{1})')' ; 
V{10}=0.9*regPolygon(9,0);  


n = 10;  
k=0; 
for i=1:n
    for j=i:n
        if(rand>0.5)
            v1 = V{j};
            v2 = V{i};
        else
          v1 = V{i}; 
          v2 = V{j}; 
        end

        v1 = v1+repmat([-1.5, 0],size(v1,1),1);
        v2 = v2+repmat([+1.5, 0],size(v2,1),1);
    
        k=k+1; 
        k
        plot(v1(:,1), v1(:,2), v2(:,1), v2(:,2), 'LineWidth',4,'Color','k');
        set(gca, 'XLim', [-2.25, 2.25], 'YLim', [-2, 2], 'DataAspectRatio', [1 1 1]);
        axis equal;
        axis off;
        box off; 

        print(gcf, '-dpng', [int2str(i) '-' int2str(j) '.png']);

    end
end
    
