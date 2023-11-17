img1 = imread('fahim1.jpg');
img2 = imread('fahim2.jpg');

m = 6;
n = 70;
imgsz = m*n;

img1 = imresize(img1, [imgsz,imgsz]);
img2 = imresize(img2, [imgsz,imgsz]);

img1 = rgb2gray(img1);
img2 = rgb2gray(img2);

figure;
imshow(img1);
title('Input 1');
figure;
imshow(img2);
title('Input 2');

output1 = uint8(zeros(imgsz,imgsz));
for i = 2 : 2 : m
    output1( n * (i - 2)+1 : n * (i-1),:) = img1(n * (i - 2)+1 : n * (i-1),:);
    output1( n * (i - 1)+1 : n * i,:) = img2(n * (i - 1)+1 : n * i,:);
end

figure;
imshow(output1);

imwrite(output1, 'output1.jpg');

[height, width] = size(output1);

output2 = uint8(zeros(width, height));

for i = 1:height
    for j = 1:width
        output2(width - j + 1, i) = output1(i, j);
    end
end

figure;
imshow(output2);

imwrite(output2, 'output2.jpg');
