function [output] = inner_product_forward(input, layer, param)

d = size(input.data, 1);
k = size(input.data, 2); % batch size
n = size(param.w, 2);

% Replace the following line with your implementation.


W = transpose(param.w);
B = transpose(param.b);
X = input.data;
output = input;
mat = mtimes(W,X);

output.data = mat + B;
