%This function was written by Mustapha

function mask = bodyDetectionMatrix(img, val)
% This mask generates an anking that gives all bodeis in the image 3
% times the priority of others

[r,c,t] = size(img);
% Create a cascade detector object
bodyDetector = vision.CascadeObjectDetector('UpperBody');

% find the coordinates for the detected body
bbox = step(bodyDetector, img);
[m,n] = size(bbox);

% Draw the returned bounding box around the detected face.
%frame = insertObjectAnnotation(img,'rectangle',bbox,'Face');
%figure, imshow(frame), title('Detected face');

% Creates a mask of ones
mask = ones(r,c);


% makes all bodies 3 times as important as rest of the picture.
for i = 1:m
    mask(bbox(i,2):(bbox(i,2)+bbox(i,4)), bbox(i,1):(bbox(i,1)+bbox(i,3))) = val;
end

end

