%%%%% A  %%%%%

I=imread('Jmbo.jpg');
I = imresize(I, [256 256]);
I=rgb2gray(I);
[row, col] = size(I);


%%%%% B %%%%%

J = de2bi(double(I));

%%%%% C  %%%%%

p1 = reshape(J(:, 1), row, col);
p2 = reshape(J(:, 2), row, col);
p3 = reshape(J(:, 3), row, col);
p4 = reshape(J(:, 4), row, col);
p5 = reshape(J(:, 5), row, col);
p6 = reshape(J(:, 6), row, col);
p7 = reshape(J(:, 7), row, col);
p8 = reshape(J(:, 8), row, col);

figure;

subplot(2, 4, 1);
imshow(p1); 
title('LSB Bit Plane'); 

subplot(2, 4, 2);
imshow(p2); 
title('2nd Bit Plane');

subplot(2, 4, 3);
imshow(p3); 
title('3rd Bit Plane');

subplot(2, 4, 4);
imshow(p4); 
title('4th Bit Plane');

subplot(2, 4, 5);
imshow(p5); 
title('5th Bit Plane');

subplot(2, 4, 6);
imshow(p6); 
title('6th Bit Plane');

subplot(2, 4, 7);
imshow(p7); 
title('7th Bit Plane');

subplot(2, 4, 8);
imshow(p8); 
title('MSB Bit Plane');

%%%%% D %%%%%

X = ones(1, 8);
for i = 1 : 8
    X(i) = 2 ^ (i - 1);
end
R = I;


%%%%% E  %%%%%

plane1 = zeros(row, col);
plane2 = zeros(row, col);
plane3 = zeros(row, col);
plane4 = zeros(row, col);
plane5 = zeros(row, col);
plane6 = zeros(row, col);
plane7 = zeros(row, col);
plane8 = zeros(row, col);

for i = 1 : row
    for j = 1: col
        plane1(i, j) = bitand(R(i, j), X(1));
        plane2(i, j) = bitand(R(i, j), X(2));
        plane3(i, j) = bitand(R(i, j), X(3));
        plane4(i, j) = bitand(R(i, j), X(4));
        plane5(i, j) = bitand(R(i, j), X(5));
        plane6(i, j) = bitand(R(i, j), X(6));
        plane7(i, j) = bitand(R(i, j), X(7));
        plane8(i, j) = bitand(R(i, j), X(8));
    end
end


%%%%% F  %%%%%

figure;
subplot(2, 4, 1);
imshow(plane1); 
title('LSB Bit Plane');

subplot(2, 4, 2);
imshow(plane2); 
title('2nd Bit Plane');

subplot(2, 4, 3);
imshow(plane3); 
title('3rd Bit Plane');

subplot(2, 4, 4);
imshow(plane4);
title('4th Bit Plane');

subplot(2, 4, 5);
imshow(plane5); 
title('5th Bit Plane');

subplot(2, 4, 6);
imshow(plane6); 
title('6th Bit Plane');

subplot(2, 4, 7);
imshow(plane7); 
title('7th Bit Plane');

subplot(2, 4, 8);
imshow(plane8); 
title('MSB Bit Plane');


