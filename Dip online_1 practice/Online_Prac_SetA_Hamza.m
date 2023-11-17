img1 = imread('1.png');
img2 = imread('2.png');

row = 462;
col = 462;

%figure;
%imshow(img1);
%figure;
%imshow(img2);

%img = zeros(row, col, 3, 'uint8');

k = 462;

for i=1:row
   for j=i:(col-i-1)
       img2(j, k, 1) = img1(k, j, 1);
       img2(j, k, 2) = img1(k, j, 2);
       img2(j, k, 3) = img1(k, j, 3);
   end
   k = k-1;
end

figure;
imshow(img2);