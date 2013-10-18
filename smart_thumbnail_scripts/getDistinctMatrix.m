% This function takes in an image and determines the most distinct parts of
% the image by a combination of bwlabel and a Gaussian filter. It returns a
% priority mask that shows which parts are most distinct and which aren't.

function values = getDistinctMatrix(img, val)
level = graythresh(img);
BW = im2bw(img, level);
[r, c] = size(BW);

% returns a label and total number of labels;
values = zeros(r,c);
[L, x] = bwlabel(BW); 
G = fspecial('gaussian', [5 5], 30);

% Check if background is greater than the objects and there is a
% single object found. If true, take the image complement.
if x < 2
   BW = imcomplement(BW);
   %Relabel the img 
   L = bwlabel(BW);
  
end

% Loop through every connected component labelled (including background) and assign to 
% matrix
for h = 1:val
    for i = 1:r
        for j = 1:c
            if L(i,j) > 0
                values(i,j) = values(i,j) + 1;
            end    
        end
    end
    BW = imfilter(BW,G,'same');
    L= bwlabel(BW);
end

end

