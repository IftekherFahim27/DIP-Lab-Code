%Take input
Input1 = imread('Fahim1.jpg');
Input2 = imread('Fahim2.jpg');

%Convert rgb to Grey
Input1 = rgb2gray(Input1);
Input2 = rgb2gray(Input2);

% row size and resolution
c = 6;
c_size = 100;
matrix_size = c * c_size;

%Resize the input image
Input1 = imresize(Input1, [matrix_size, matrix_size]);
Input2 = imresize(Input2, [matrix_size, matrix_size]);


Result1 = uint8(ones(matrix_size, matrix_size));

for i = 2:2:c
    Result1(c_size * (i - 2) + 1 : c_size * (i-1), :) = Input1(c_size * (i - 2) + 1 : c_size * (i - 1), :);
    Result1(c_size * (i - 1) + 1 : c_size * i, :) = Input2(c_size * (i - 1) + 1 : c_size * i, :);
end

figure;
imshow(Result1);

%Rotate the output pic to 90 degree
rotatedResult1 = zeros(matrix_size, matrix_size, 'uint8');

for i = 1:matrix_size
    for j = 1:matrix_size
        rotatedResult1(j,i) = Result1(i, j);
    end
end

figure;
imshow(rotatedResult1);
imwrite(rotatedResult1, 'Output.jpg');