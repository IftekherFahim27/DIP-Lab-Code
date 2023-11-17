I=imread('armas.jpg');
I=rgb2gray(I);
I=imresize(I,[256,256]);

[row,col]=size(I);
O=uint8(zeros(row,col));

for i=1:row/2
    for j=1:col
        O(i,j)=I(i,j);    
    end
    
end    
figure;
imshow(O);