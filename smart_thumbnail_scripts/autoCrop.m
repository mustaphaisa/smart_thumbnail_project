%This function was written by Mustapha

function autoCrop(img, x, y, name)
% Crops an image to a 4th of its size based on vectores x and y that define
% points of interests

% Finds the size of the image
[r,c,t] = size(img);

% Create a file that stores the points
fileName = 'ALGOpoints.txt';
fileId = fopen(fileName, 'a');

% Calulates the average of salient points
avX = round(mean(x));
avY = round(mean(y));

% Finds the width and length of the cropped region
xPoint = round(r * sqrt(0.20));
yPoint = round(c * sqrt(0.20));

% This saves the average salient point of the image to file
fprintf(fileId, '%s %f %f %f %f\n', name, avY-(yPoint/2),avX-(xPoint/2), yPoint, xPoint);

% Finds the top left corner of the cropped image
img2 = imcrop(img,[avY-(yPoint/2),avX-(xPoint/2),yPoint,xPoint]);

% Saving the file
filename = strcat('../Test_Images/', name );
filename = strcat( filename, '.jpg' );
imwrite( img2, filename );

fclose(fileId);

end

