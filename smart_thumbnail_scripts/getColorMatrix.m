function BW = getColorMatrix(im)
% Take as input an image. Create a color mask. The image is labelled
% by finding unique values to represent each RGB value. The RGB valued
% image is labelled and then the labels are replaced by areas of connected
% components withinthe image. The mask BW is returned.
[r, g, b] = size(im);
BW = zeros(r, g);

% Loop through image and initialize mask to contain a unique value to
% represent the RGB combination at each pixel. We divide each pixel by 5 so
% that we can create color ranges. Therefore, each RGB value within a range
% of 5 will be considered the same value. 
for i = 1: r
    for j = 1: g
        for k = 1: b
            tempR = double (floor(im(i, j, k)/5));
            tempG =  double (floor(im(i, j, k)/5));
            tempB =  double (floor(im(i, j, k)/5));
            BW(i, j) = log(2^tempR) + log(3^tempG) + log(5^tempB);
        end
    end
end

[L, x] = label(BW); %% returns a label and total number of labels;
areas = zeros(x, 1);
% Loop through every area labelled (including background) and assign to 
% matrix
for i = 0: x
   areas(i + 1) = bwarea(L == i);
end

% Loop through entire image. At each element, reassign the element to the
% area of the component it is a part of.
for a = 1: r 
    for b = 1: g 
       BW(a, b) = areas(L(a,b) + 1);
    end
end
end

