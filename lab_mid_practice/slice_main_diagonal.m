I=imread('armas.jpg');
I=rgb2gray(I);
I=imresize(I,[256,256]);
imshow(I);
[row,col]=size(I);
O=uint8(zeros(row,col));

for i=1:row
    for j=1:col
        if i>j
            O(i,j)=I(i,j);
        end
    end
end    

imshow(O);