I=imread('Jmbo.jpg');
I=imresize(I,[600,600]);
I=rgb2gray(I);


P = padarray(I, [5 5]);
[row, col] = size(P);


X = -5:5;
Y = -5:5;
X2 = X.^2;
Y2 = Y.^2;
sigma = input('Please Enter the sigma value for blurring : ');

var = sigma^2;
filter = zeros(11);
for i = 1:11
    for j = 1:11
        filter(i, j) = (1 / (2 * pi * var))*exp(-(X(j)^2 + Y(i)^2) / (2 * var));
    end
end
filter = filter / sum(filter(:));

for i = 6:row-5
    for j = 6:col-5
        N = double(P(i-5:i+5, j-5:j+5));
        t = N .* filter;
        P(i, j) = sum(t(:));
    end
end

O= P;
Owb =P(6:end-5, 6:end-5);
Owb = uint8(Owb);

figure;
imshow(I);

figure;
subplot(1,2,1);
imshow(O);
title('Blur Image With border padding ');

subplot(1,2,2);
imshow(Owb);
title('Blur Image Without border padding ');