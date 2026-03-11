function output = Gaussian(input, window_size, sigma)
    [rows, cols] = size(input);
    pad_size = floor(window_size / 2);
    padded_input = padarray(input, [pad_size, pad_size], 'symmetric');
    output = zeros(size(input));
    
   
    [x, y] = meshgrid(-pad_size:pad_size, -pad_size:pad_size);
    gauss_mask = exp(-(x.^2 + y.^2) / (2 * sigma^2));
    gauss_mask = gauss_mask / sum(gauss_mask(:));
    
    for i = 1:rows
        for j = 1:cols
            window = padded_input(i:i+window_size-1, j:j+window_size-1);
            output(i, j) = sum(sum(window .* gauss_mask));
        end
    end
end

