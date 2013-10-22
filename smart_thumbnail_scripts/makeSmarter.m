% This script was written by Mustapha Isa 

function makeSmarter( img, name, setNum, showPlot )

% This script makes the combination of all the images 
if setNum == 1
    fileName = strcat('../Data Set 1/', img);
else
    fileName = strcat('../Data Set 2/', img);
end

% This loads the image
TestImage = imread(fileName);
[m,n,t] = size(TestImage);

% Returns the Size matrix
A = getSizeMatrix(TestImage);

% Returns the Color Matrix
%B = getColorMatrix(TestImage);

% Returns the Location Matrix
C = getLocationMatrix2(TestImage);

% Returns the Edge Matrix
%D = getDistinctMatrix(TestImage, 1);

% Returns the Luminous matrix
E = getBrightnessMatrix(TestImage, 10);

% Returns the Face Matrix

F = faceDetectionMatrix(TestImage, 3);

% Returns the Upper Body Matrix

G = bodyDetectionMatrix(TestImage, 5);

% Combines the masks
% Result =(uint64(A)+uint64(B)).*uint64(C).*uint64(D).*uint64(E).*uint64(F).*uint64(G);
Result = uint64(A).*uint64(C).*uint64(E).*uint64(F).*uint64(G);

%[Result,p] = label(Result);

% Finds the Maximum points
Max = max(Result(:));
[r,c] = find(Result==Max);

h = figure('visible', 'off'), imshow(TestImage);
hold on;
plot(c,r,'r+');
axis([1, n, 1, m]); 

if(showPlot == 1 )
    
    % Finds the Minimum points
    Min = min(Result(:));
    [x,y] = find(Result==(Min));  
    hold on;
    
    % Creates a plot for the maximum and minimum values
    plot(y,x,'b+');
    axis([1, n, 1, m]);
  
end

% Saving the original 
filename = strcat('../Test_Images/', name );
filename = strcat( filename, '_original' );
filename = strcat( filename, '.jpg' );
saveas( h, filename );

% This crops the image 
autoCrop(TestImage,r,c,name);

end

