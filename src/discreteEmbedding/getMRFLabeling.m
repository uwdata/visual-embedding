%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% results_fname: name of the output file produced by running 'FastPD.exe' 
% labeling     : one-dimensional vector containing the MRF labels
%                (its length is equal to the number of MRF nodes)
%
% NOTE:
% This function assumes that the size of each label is 'uint8'.
% If a label type of a diffent size has been used in the FastPD C++ code
% (check type Graph::Label), then the variable label_size must be modified 
% accordingly.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function labeling = getMRFLabeling(results_fname )
	
	fid = fopen( results_fname, 'rb' );
	if fid == -1
		error( ['Cannot open file ' results_fname] );
	end

	label_size = 'uint8';
	labeling = fread( fid, label_size );

	fclose(fid);
	 	
