% This code was written by Kelsey

function loopImages(fileNames)
for i = 1: 60
    img = fileNames(1, i);
    SelectPoints(img{1}, 1, 60);
end