I=imread('armas.jpg');
I=rgb2gray(I);
I=imresize(I,[256,256]);

[row,col]=size(I);
O=uint8(zeros(row,col));
n=256;
for i=1:row
    for j=i:col-i
        O(j,n)=I(j,n);    
    end
    n=n-1;
end    
figure;
imshow(O);