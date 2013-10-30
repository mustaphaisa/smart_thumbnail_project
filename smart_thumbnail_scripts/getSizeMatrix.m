% This code is written by Kelsey

function BW = getSizeMatrix(img)
% getSizeMatrix takes as input an image. 
% Ouput BW, a priority mask that prioritizes connected components with
% larger areas. 

% Convertthe JPEG image to a BLACK-WHITE image. 
level = graythresh(img);
BW = im2bw(img, level);
[r, c] = size(BW);
[L, x] = bwlabel(BW); %% returns a label and total number of labels;
areas = zeros(x, 1);

% Loop through every area labelled (including background) and assign to 
% matrix
for i = 0: x
   areas(i + 1) = bwarea(L == i);
end

% Check if background area is greater than object area and there is a
% single object found. If true, take the image complement.
if areas(1) <= areas(2) &&  x < 2
   BW = imcomplement(BW);
   %Relabel the img 
   [L, x] = bwlabel(BW);
end
areas = zeros(x, 1);
%Reassign areas function, not including background area
for i = 0: x
  areas(i + 1) = bwarea(L == i);
end
BW = double (BW);
% Loop through entire image. At each element, reassign the element to the
% area of the component it is a part of.
for a = 1: r 
    for b = 1: c 
       BW(a, b) = areas(BW(a,b) + 1);
    end
end

end

