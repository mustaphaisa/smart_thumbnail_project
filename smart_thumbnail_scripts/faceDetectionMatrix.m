%This function was written by Mustapha

function mask = faceDetectionMatrix(img, val)
% This function creates a matrix of with a mask of prioritized regions
% based on face detection.

[r,c,t] = size(img);
% Create a cascade detector object
faceDetector = vision.CascadeObjectDetector();

% find the coordinates for the detected face
bbox = step(faceDetector, img);
[m,n] = size(bbox);

% Draw the returned bounding box around the detected face.
%frame = insertObjectAnnotation(img,'rectangle',bbox,'Face');
%figure, imshow(frame), title('Detected face');

% Creates a mask of ones
mask = ones(r,c);


% makes all faces 3 times as important as rest of the picture.
for i = 1:m
    mask(bbox(i,2):(bbox(i,2)+bbox(i,4)), bbox(i,1):(bbox(i,1)+bbox(i,3))) = val;
end

end

