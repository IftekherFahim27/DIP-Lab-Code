I=imread('2.png');
L=imread('1.png');

figure;
imshow(I);


[row,col,ch]=size(I);
K=uint8(zeros(row,col,ch));
n=462;
for i=1:row
    for j=i:col-i-1
        K(j,n,:)=I(n,j,:);
       
        L(j,n,:)=K(j,n,:);
    end
    n=n-1;
end

figure;
imshow(K);

figure;
imshow(L);

%imwrite(L, 'Res.png');