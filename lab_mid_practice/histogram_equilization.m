I = imread('cameraman.png');
J = I;
L=256;
[row, col] = size(I);
temp = zeros(1, L);


for i = 1:row
    for j = 1:col
        temp(I(i, j) + 1) = temp(I(i, j) + 1) + 1;
    end
end


PDF = temp / sum(temp);


CDF = zeros(1, L);
CDF(1) = PDF(1);

for i = 2:L
    CDF(i) = PDF(i) + CDF(i - 1);
end


CDF =CDF * (L - 1);


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