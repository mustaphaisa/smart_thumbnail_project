% Using the input from user testing to plot all three levels
% ROIs per user by color
function A = plotUserPoints

fileNames = GetFileNames(2);

fid = fopen('chosenpoints.txt');
A = fscanf(fid, '%g', [2 inf]);
A = A';
[rSize, cSize] = size(A);
fclose(fid);

dataCube = cell(1,rSize/3,3);

for i = 1:rSize/3
    choiceA= cell(1,2);
    choiceB= cell(1,2);
    choiceC= cell(1,2);
    choiceA(1,1)= {A((i*3)-2,1)};
    choiceA(1,2)= {A((i*3)-2,2)};
    choiceB(1,1)= {A((i*3)-1,1)};
    choiceB(1,2)= {A((i*3)-1,2)};
    choiceC(1,1)= {A((i*3),1)};
    choiceC(1,2)= {A((i*3),2)};    
    dataCube(1,i,1) = {choiceA};
    dataCube(1,i,2) = {choiceB};
    dataCube(1,i,3) = {choiceC};
end

%   This loops to find plots for each image
for i = 1:60
    img = fileNames(1, i);
    img = img{1};
    figure,imshow(strcat('../Data Set 2/',img));
    hold on;
    for j = i:60:rSize/3
        Cord1 = dataCube{1,j,1};
        Cord2 = dataCube{1,j,2};
        Cord3 = dataCube{1,j,3};
        plot(Cord1{1,1},Cord1{1,2},'r+');
        plot(Cord2{1,1},Cord2{1,2},'b+');
        plot(Cord3{1,1},Cord3{1,2},'y+');        
    end
end
end