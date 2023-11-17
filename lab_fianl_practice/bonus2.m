threshold = 250;

I = imread('coins.jpg');
I = rgb2gray(I);

Gx = [1, 0, -1; 2, 0, -2; 1, 0, -1];
Gy = [1, 2, 1; 0, 0, 0; -1, -2, -1];

[row, col] = size(I);

magnitude = zeros(row, col);



for i = 1:row-2
    for j = 1:col-2
        
        g_x = sum(sum(double(I(i:i+2, j:j+2)) .* Gx));
        g_y = sum(sum(double(I(i:i+2, j:j+2)) .* Gy));
        
       
        magnitude(i, j) = sqrt(g_x^2 + g_y^2);
    end
end

edge_image = magnitude > threshold;

figure;
subplot(1, 2, 1);
imshow(I);
title('Original Image');

subplot(1, 2, 2);
imshow(edge_image);
title('Edge Detected');
