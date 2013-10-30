% This selects points on the image that the user finds valid
function points = selectPoints(im)

% Display and hold the image
figure;
imName = strcat('../Data Set 2/', im);
imshow(imName); 
hold;

% Create a file that stores the points
fileName = 'chosenpoints.txt';
fileId = fopen(fileName, 'a');

% vector that stores the three points
points = zeros(3, 2);

% User clicks three points on the image (one point for each iteration)
for i = 1:3
    hpoint = impoint(gca); 
    pos = hpoint.getPosition();
    points(i, 1) = pos(1, 1);
    points(i, 2) = pos(1, 2);
    fprintf(fileId, '%f %f\n', points(i, 1), points(i, 2));
end
    
fclose(fileId);

close all;

end
