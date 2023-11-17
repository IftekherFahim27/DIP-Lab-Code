I1 = imread('1.png');
I2 = imread('2.JPG');

x = 6;
y = 50;
z = x*y;

I1 = imresize(I1, [z z]);
I2 = imresize(I2, [z z]);

I1 = rgb2gray(I1);
I2 = rgb2gray(I2);

O1 = uint8(ones(z,z));
for i = 2 : 2 : x
    O1(:, y * (i - 2) + 1 : y * (i-1) ) = I1(:, y * (i - 2) + 1 : y * (i - 1) );
    O1(:, y * (i - 1) + 1 : y * i ) = I2(:, y * (i - 1) + 1 : y * i );
end


imshow(O1);
imwrite(O1, '3.jpg');


