function [output] = pooling_layer_forward(input, layer)

    h_in = input.height;
    w_in = input.width;
     
    c = input.channel;
    batch_size = input.batch_size;
    k = layer.k;
    pad = layer.pad;
     
    stride = layer.stride;
    
    h_out = (h_in + 2*pad - k) / stride + 1;
    w_out = (w_in + 2*pad - k) / stride + 1;
  
    output.height = h_out;
    output.width = w_out;
    output.channel = c;
    output.batch_size = batch_size;

    % Replace the following line with your implementation.
   
    output.data = zeros(h_out*w_out*c, batch_size);
    in = reshape(input.data, [h_in, w_in, c, batch_size]);
  
    out = reshape(output.data, [h_out, w_out, c, batch_size]);
    
    
    for i = 1:h_out
        for j = 1:w_out
    
            x = in((i-1)*stride + 1: (i-1)*stride + k, (j-1)*stride + 1 : (j-1)*stride + k,:);
            out(i,j,:) = max(max(x(:,:,:)));
;
         
        end
    end
    
    output.data = reshape (out,[h_out*w_out*c, batch_size]);
   
end

