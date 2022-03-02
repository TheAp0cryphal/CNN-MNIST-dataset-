

layers = get_lenet();
load lenet.mat
load lenet_pretrained.mat

%path = strcat('..\data\Folder\image1.jpg');
%path = strcat('..\data\Folder\image2.jpg'); %image 2
%path = strcat('..\data\Folder\image3.png'); %image 3
path = strcat('..\data\Folder\image4.jpg'); %image 4
img = imread(path);



img = rgb2gray (img);
img = imcomplement(img);
level = graythresh(img);
imgBin = imbinarize(img,level);


CC = bwconncomp(imgBin);
L = bwlabel (imgBin);
stats = regionprops(CC, 'BoundingBox');

prediction = zeros([1, 50]);
var = zeros([51,1]);
disp(size(stats));

for i = 1:size(stats,1)
    
    layers{1,1}.batch_size = 1;
    
    subImage = imcrop(imgBin, stats(i).BoundingBox);
    
    
    %subImage = padarray(subImage, [50 50], 0, 'both');
    
    subImage = padarray(subImage, [10 10], 0, 'both'); % use this setting
    %for Image4 for better results.
    
    
    resizeImg = imresize(subImage,[28 28]); 
    
    subplot(3,17,i);
    imshow(resizeImg);
    resizeImg = transpose(resizeImg);
    
    resulted = reshape (resizeImg, 28*28, 1);    
    
     
    [output, P] = convnet_forward(params,layers,resulted);    
    
    [x,y] = max(P);
    
    y = y-1;
    
    prediction(i) = y;
    
    title(['prediction:',num2str(y)]);
    
end
disp(prediction);

  



    



    




