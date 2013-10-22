% This script was initially written by Kelsey Lafer
% This script was edited by Mustapha Isa 
function loopImages(fileNames)

for i = 1: 60
    img = fileNames(1, i);
    SelectPoints(img{1}, 1, 60);
end

end