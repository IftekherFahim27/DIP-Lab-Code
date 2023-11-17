I = imread('lines.png');
I = rgb2gray(I); 

Gx = [ 1  0 -1;2  0 -2;1  0 -1 ];
Gy = [ 1  2  1;0  0  0;-1 -2 -1 ];


[row, col] = size(I);

horizontal = zeros(row, col);
vertical = zeros(row, col);

for i = 1:row-2
    for j = 1:col-2
        N = double(I(i:i+2, j:j+2));
        
        horizontal_value = sum(sum(N .* Gx));
        horizontal(i, j) = horizontal_value;
        
        vertical_value = sum(sum(N .* Gy)); 
        vertical(i, j) = vertical_value;
    end
end

horizontal_output = horizontal > 0;
vertical_output = vertical > 0;

figure;
subplot(1, 3, 1);
imshow(I);
title('Original Image');

subplot(1, 3, 2);
imshow(horizontal_output);
title('Horizontal Lines Detected');

subplot(1, 3, 3);
imshow(vertical_output);
title('Vertical Lines Detected');
