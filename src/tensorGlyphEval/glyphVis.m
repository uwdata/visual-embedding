function glyphVis(h,campos)

if(nargin < 2) 
%   campos = [5 5 30]; 
    campos = [30 0 0];   
end

shading interp;
lighting gouraud; 


set(h, 'FaceColor', [0.85 0.85 0.85]); 
% set(h, 'specularstrength', 0.5, 'diffusestrength', 0.5); 
material dull; 
axis off; 
box off; 
set(gcf, 'renderer', 'zbuffer'); 
% this is necessary to prevent Matlab's seam problem
    vn = get(h,'VertexNormals');
    vnSeam = mean(vn(:,[1,end],:),2);
    vnNew = vn;
    vnNew(:,[1,end],:) = repmat(vnSeam,[1 2 1]);
set(h,'VertexNormals',vnNew);
set(gca,'camerapositionmode', 'manual','cameraviewanglemode','manual');
set(gca,'cameraposition', campos, 'cameratarget', [0 0 0], 'cameraviewangle', 15); 
camlight('right'); 
 