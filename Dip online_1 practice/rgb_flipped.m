I=imread('1.png');
figure;
imshow(I);



[row,col,ch]=size(I);
K=uint8(zeros(row,col,ch));
for i=1:row
    for j=1:col
        K(j,i,:)=I(i,j,:);
    end
end

figure;
imshow(K);