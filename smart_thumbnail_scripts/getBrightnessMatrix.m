function mat = getBrightnessMatrix(im, val)
% Takes as input the image and a value which represents how much the user
% would like to weigh brightness in the final priority scheme. Returns the
% brightness scheme mat.

% Read the image dimensions and create and initial mask, mat
[x,y,z] = size(im);
mat = ones(x,y);

% Convert the rgb to an hsv image, which gives brightness values
bright = rgb2hsv(im);
illum = (bright(:,:,3));
% Identify the max brightness values
Max = max(illum(:));

% Loop through the brightness image and at every point which is a max
% bright point, set the corresponding mask value to val. 
for i = 1: x
    for j = 1: y
        if (bright(i, j, 3) == Max)
            mat(i, j) = val;
        end
    end
end
end