function writeTracts(c, fn, C)
% writes the given cluster c to fn in binary format required for
% streamtube generating function
num_tubes = numel(c);
fid  =  fopen(fn, 'wb');
fwrite(fid, num_tubes, 'integer*4');
for i=1:num_tubes
    num_vertices =length(c{i});
    fwrite(fid, num_vertices, 'integer*4');
    for j=1:num_vertices
        fwrite(fid, c{i}(j,1), 'real*4');
        fwrite(fid, c{i}(j,2), 'real*4');
        fwrite(fid, c{i}(j,3), 'real*4');
    end
end
if(size(C,1) == 1)
  for i=1:num_tubes
    fwrite(fid, C(1), 'real*4');
    fwrite(fid, C(2), 'real*4');
    fwrite(fid, C(3), 'real*4');
  end
else
  for i=1:num_tubes
    fwrite(fid, C(i,1), 'real*4');
    fwrite(fid, C(i,2), 'real*4');
    fwrite(fid, C(i,3), 'real*4');
end
end
fclose(fid);

