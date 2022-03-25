
%{
x = output{2}.data;
x = reshape(x, 24, []);
x = imresize(x, [128 1024]);
disp(class(x));
subplot(1,2,1);
imshow(x,[]);

disp("RelU");

y = output{3}.data;


y = reshape(x, 64, []);
y = imresize(x, [128 1024]);
disp(class(x));
subplot(1,2,2);
imshow(y,[]);
%}