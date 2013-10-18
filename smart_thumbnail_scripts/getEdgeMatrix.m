% getEdge(I)
% This function will take in an image and run Canny edge detection on the
% image. For every pixel that is an edge (a logical 1) it will increase the
% value in the same locaion on the matrix that will be returned by the
% function. It will then apply a Gaussian filter to blur the image and
% repeat the preceeding process. This function attempts to attach
% importance to areas of the image that are more in focus than others

function edgemat = getEdgeMatrix(I)

%I = imread(i);
[r,c] = size(I);
edgemat = zeros(r,c);

BW = edge(I, 'canny');
G = fspecial('gaussian', [5 5], 5);


% while the number of pixels that equal 1 is greater than 0, apply a gaussian
%  filter and increment the appropriate values in edgemat
for x = 1:10
    for i = 1:r
       for j = 1:c
       
           if BW(i,j) == 1
               edgemat(i,j) = edgemat(i,j)+1;
           end
       end
    end
    
    I = imfilter(I,G,'same');
    BW = edge(I,'canny');
end

edgemat = (edgemat/10)+1;

end















