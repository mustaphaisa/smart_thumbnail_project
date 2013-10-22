function mat = getLocationMatrix2(img)
% This function returns a matirx containing ranks that prioritize
% regions in an image based on distance from the center.

% returns the size of the image
[r,c,t] = size(img);

% initalizes the mask
mat = ones(r,c);

% loops that divides an image into 3 parts with respective ratings of 1,6
% and 9
for i = 1:r
    for j = 1:c
        if(i<=(r/6)||j<=(c/6)||i>=(5*r/6))||j>(5*c/6)
            mat(i,j) = mat(i,j)*1; % outer frame
        elseif(i>=(r/6)&&i<=(2*r/6))||(i<=(5*r/6)&&i>=(4*r/6))||(j>=(c/6)&&j<=(2*c/6))||(j<=(5*c/6)&&j>(4*c/6))
            mat(i,j) = mat(i,j)*6; % second frame
        else
            mat(i,j) = mat(i,j)*9; % innermost frame
        end
    end     
end

