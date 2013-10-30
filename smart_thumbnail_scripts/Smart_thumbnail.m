%This function was written by Mustapha

% This script makes the combination of all the images 

% Prompts for user input
name = input('Type in the name of the file to be processed: \n', 's');

% This loads the image
TestImage = imread(name);

% Returns the Size matrix
A = getSizeMatrix(TestImage);

% Returns the Color Matrix
B = getColorMatrix(TestImage);

% Returns the Location Matrix
C = getLocationMatrix2(TestImage);

% Returns the Edge Matrix
D = getDistinctMatrix(TestImage, 1);

% Returns the Luminous matrix
E = getBrightnessMatrix(TestImage, 10);

% Returns the Face Matrix

F = faceDetectionMatrix(TestImage, 3);

% Returns the Upper Body Matrix

G = bodyDetectionMatrix(TestImage, 5);

% Combines the masks
Result = (uint64(A)+uint64(B)).*uint64(C).*uint64(D).*uint64(E).*uint64(F).*uint64(G);
% Result = uint64(A).*uint64(C).*uint64(D).*uint64(E).*uint64(F).*uint64(G);
% Result = uint64(B);
%[Result,p] = label(Result);

% Finds the Maximum points
Max = max(Result(:));
[r,c] = find(Result==Max);

% Finds the Minimum points
Min = min(Result(:));
[x,y] = find(Result==(Min));

[m,n,t] = size(TestImage);

figure,imshow(TestImage);
hold on;

% Creates a plot for the maximum and minimum values
% plot(y,x,'r+');
% axis([1, n, 1, m]);
% hold on;
plot(c,r,'y+');
axis([1, n, 1, m]);

% This crops the image 
autoCrop(TestImage,r,c);