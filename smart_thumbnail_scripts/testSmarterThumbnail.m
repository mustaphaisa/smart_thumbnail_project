% This is meant to test the degree of error on our smart_thumbnail
% script.

% Get the vector containing names of images
<<<<<<< HEAD
nameVec = getFileNames( 2 );
=======
nameVec = GetFileNames( 1 );
>>>>>>> b54de4bf33a9b917c23feb4116249324a3ca3bf5

% Loop through and make images smart_thumbnails
for i = 1:102
    name = nameVec(1,i);
    filename = strcat('thumbnail_', num2str(i));
<<<<<<< HEAD
    makeSmarter( name{1}, filename, 2, 0 );
    
=======
    makeSmarter( name{1}, filename, 1, 1 );
>>>>>>> b54de4bf33a9b917c23feb4116249324a3ca3bf5
end