Input1 = imread('Fahim1.jpg');
Input2 = imread('Fahim2.jpg');

Input1 = rgb2gray(Input1);
Input2 = rgb2gray(Input2);

c = 6;
c_size = 100;
size = c * c_size;

Input1 = imresize(Input1, [size size]);
Input2 = imresize(Input2, [size size]);

Input1 = rgb2gray(Input1);
Input2 = rgb2gray(Input2);

Result1 = uint8(ones(size, size));

for i = 2 : 2 : c
    Result1(c_size * (i - 2) + 1 : c_size * (i-1), :) = Input1(c_size * (i - 2) + 1 : 100 * (i - 1), :);
    Result1(c_size * (i - 1) + 1 : c_size * i, :) = Input2(c_size * (i - 1) + 1 : 100 * i, :);
end

[size,size]=size(Result1);
% Rotate the Result1 image by 90 degrees
rotatedResult1 = zeros(size, size, 'uint8');

for i = 1:size
    for j = 1:size
        rotatedResult1(j, size - i + 1) = Result1(i, j);
    end
end

% Display the rotated image
figure;
imshow(rotatedResult1);
