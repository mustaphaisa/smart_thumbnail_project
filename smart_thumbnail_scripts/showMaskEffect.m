function showMaskEffect( filenum )
% Given a lis of filenames, this goes through them and
% runs each mask on the image detailing their effects 
% and weights on images.


nameVec = getFileNames( filenum );

% Loop through and make mask plots
for i = 1:102
    name = nameVec(1,i);
    filename = strcat('thumbnail_', num2str(i));
    makeSmarter( name{1}, filename, 2, 0 );
    
end


end

