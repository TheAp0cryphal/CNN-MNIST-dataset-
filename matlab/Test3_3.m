
prediction = zeros([1, 9]);
 
for i = 1:10
    
    layers{i}.batch_size = 1;
    
    path = strcat('..\data\Folder\t',num2str(i-1),'.png');
    
    img = imread(path);
    
    img = rgb2gray(img);
    
    figure;
    
    imshow(img);
    
    img = imresize(img,[28 28]);
    
    
    
    img = transpose(img);
    
    img = reshape (img, 28*28, 1);
    
    disp(size(img));
   
[output, P] = convnet_forward(params,layers,img);


[x,y] = max(P);
y = y-1;
prediction(i) = y;

     title(['prediction:',num2str(y)]);
    
end

disp(prediction);