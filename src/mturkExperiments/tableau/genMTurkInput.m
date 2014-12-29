function  genMTurkInput(indexfile, html)
%
%
% File     : genMTurkInput.m
% Author   : Cagatay Demiralp 
% Desc     : 
%
% 	Input  :
%
% 	Output :
%
% 	Example: 
%
% Date     : Tue Mar 27 14:58:24 2012
%
%
imgindx =dlmread(indexfile);
n       =size(imgindx,1);
fid     =fopen('input.csv','w');
for i=1:n-1
    fprintf(fid,'%d, ', i); 
end

fprintf(fid, '%d\n', i+1); 
for i=1:n-1
  s=[html int2str(imgindx(i,1)) '-' int2str(imgindx(i,2)) '.png']; 
  fprintf(fid,'%s, ', s); 
end

s=[html int2str(imgindx(i+1,1)) '-'  int2str(imgindx(i+1,2)) '.png']; 
fprintf(fid, '%s\n', s); 
fclose(fid); 
