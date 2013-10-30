%This function was written by Mustapha

% This is meant to test the degree of error on our smart_thumbnail
% script.

% Get the vector containing names of images

nameVec = getFileNames( 2 );

% Loop through and make images smart_thumbnails
for i = 1:length(nameVec)
    name = nameVec(1,i);
    filename = strcat('thumbnail_', num2str(i));
    makeSmarter( name{1}, filename, 2, 0 );
    
end