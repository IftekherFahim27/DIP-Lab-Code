I=imread('2.png');
L=imread('1.png');

figure;
imshow(I);



[row,col,ch]=size(I);
K=uint8(zeros(row,col,ch));
for i=1:row
    for j=i:col-i-1
        K(j,i,:)=I(i,j,:);
        L(j,i,:)=K(j,i,:);
    end
    
end

figure;
imshow(K);

figure;
imshow(L);

%imwrite(L, 'Res.png');