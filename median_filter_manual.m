function output = Median(input, window_size)
    [rows, cols] = size(input);
    pad_size = floor(window_size / 2);
    padded_input = padarray(input, [pad_size, pad_size], 'symmetric');
    output = zeros(size(input));
    
    for i = 1:rows
        for j = 1:cols
            window = padded_input(i:i+window_size-1, j:j+window_size-1);
            output(i, j) = median(window(:));
        end
    end
end