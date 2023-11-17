S = rgb2gray(imread('bean.jpg'));

[row, col] = size(S);
S = imresize(S,[row*1,col*1]);
P = padarray(S,[1 1]);
[row, col] = size(P);
R = zeros(row,col);
X = [-1 0 1;-1 0 1;-1 0 1];
Y = [-1 -1 -1;0 0 0;1 1 1];
X2 = X.^2;
Y2 = Y.^2;
s = input('Enter the sigma value:');
sigma =s;  

var = sigma^2;
filter = (1/(2*pi*var))*exp(-(X2+Y2)/(2*var));

filter = filter/sum(filter(:));
for i = 1:row-2
    for j = 1:col-2
        N = double(P(i:i+2, j:j+2));
        t = N.*filter;
        P(i+1, j+1) = sum(t(:));
    end
end
R = P;
R1= R(2:end-1,2:end-1);
R1 = uint8(R1);
figure;
imshow(S);
figure;
imshow(R1);

