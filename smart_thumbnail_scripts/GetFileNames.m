% This functions to retrieve the filenames of the image set.

% This returns a vector of structures with information 
% about the images contained in the image set.
function fileNames = getFileNames( dataset )

if dataset == 1
    files = dir('../Data Set 1');
else
    files = dir('../Data Set 2');
end

% This retrieves only the names of the files from the vector
fileNames = {files.name};

% This eliminates the file extensions 
fileNames(strmatch('.',fileNames))=[];

% Returns the vector of file names
fileNames;

end

