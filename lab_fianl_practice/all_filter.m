% Load an image
I = imread('cameraman.png');
%I= rgb2gray(I);
figure;
subplot(1,3,1);
imshow(I);
title('Original Image');

I=imnoise(I,'salt & pepper',0.01);
subplot(1,3,2);
imshow(I);
title('Noise Image');

k = 3;

paddedImage = padarray(I, [(k-1)/2, (k-1)/2]);
[row, col] = size(I);

filteredImage = zeros(row, col);

% Apply the mean filter
for i = 1:row
    for j = 1:col
        neighbors = double(paddedImage(i:i+k-1, j:j+k-1));
        T = mean(neighbors(:));
        %T = max(neighbors(:)); 
        %T = min(neighbors(:));
        filteredImage(i, j) = T;
    end
end



% Display the filtered image
subplot(1,3,3);
imshow(uint8(filteredImage));
title('Filtered Image');
