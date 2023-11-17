I=imread('1.png');
figure;
imshow(I);

I=rgb2gray(I);
A=I';
figure;
imshow(A);

[row,col]=size(I);
K=uint8(zeros(row,col));
for i=1:row
    for j=1:col
        K(j,i)=I(i,j);
    end
end

figure;
imshow(K);