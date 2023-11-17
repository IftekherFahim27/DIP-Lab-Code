
%%%%%%% A %%%%%%
I = imread('cameraman.png');
J = I;
L=256;
[row, col] = size(I);
temp = zeros(1, L);

%%%%%%%% B %%%%%%

for i = 1:row
    for j = 1:col
        temp(I(i, j) + 1) = temp(I(i, j) + 1) + 1;
    end
end

%%%%%% C %%%%%%%

PDF = temp / sum(temp);

%%%%%% D %%%%%%%
CDF = zeros(1, L);
CDF(1) = PDF(1);

for i = 2:L
    CDF(i) = PDF(i) + CDF(i - 1);
end

%%%%%%% E %%%%%
CDF =CDF * (L - 1);

%%%%%%% F %%%%%
CDF=round(CDF);

for i = 1:row
    for j = 1:col
        J(i, j) = CDF(I(i, j) + 1);
    end
end

temp2 = zeros(1, L);

for i = 1:row
    for j = 1:col
        temp2(J(i, j) + 1) = temp2(J(i, j) + 1) + 1;
    end
end

%%%%%%% G & H %%%%%
figure;

subplot(2, 2, 1);
imshow(I);
title('Original Image');

subplot(2, 2, 2);
bar(temp);
title('Histogram');

subplot(2, 2, 3);
imshow(J);
title('Modified Image');

subplot(2, 2, 4);
bar(temp2);
title('Histogram');

imwrite(J, 'Output.png');

                                            %%%%%%% Bonus  %%%%%

I2 = imread('lena.jpg');
J2 = I2;
[row, col] = size(I2);

temp3 = zeros(1, L);
CDF2 = zeros(1, L);

for i = 1:row
    for j = 1:col
        temp3(I2(i, j) + 1) = temp3(I2(i, j) + 1) + 1;
    end
end

PDF2 = temp3 / sum(temp3);
CDF2(1) = PDF2(1);

for i = 2:L
    CDF2(i) = PDF2(i) + CDF2(i - 1);
end

CDF2 = round(CDF2 * (L - 1));

for i = 1:row
    for j = 1:col
        J2(i, j) = CDF2(I2(i, j) + 1);
    end
end

temp4 = zeros(1, L);
for i = 1:row
    for j = 1:col
        temp4(J2(i, j) + 1) = temp4(J2(i, j) + 1) + 1;
    end
end

figure;

subplot(2, 2, 1);
imshow(I2);
title('Original Image');

subplot(2, 2, 2);
bar(temp3);
title('Histogram');

subplot(2, 2, 3);
imshow(J2);
title('Modified Image');

subplot(2, 2, 4);
bar(temp4);
title('Histogram');

Specified = imhistmatch(I, I2);
figure;

subplot(1, 3, 1);
imshow(I);
title('Input Image');

subplot(1, 3, 2);
imshow(I2);
title('Desired Image');

subplot(1, 3, 3);
imshow(Specified);
title('Specified Image');
imwrite(Specified, 'Bonus.png');
