I=imread('cameraman.png');
[row, col] = size(I);
S = imnoise(I, 'salt & pepper', 0.02);

subplot(1,2,1);
imshow(I);
title('Original Image');


subplot(1,2,2);
imshow(S);
title('Noise Image');




