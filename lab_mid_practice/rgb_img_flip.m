I=imread('armas.jpg');
I=imresize(I,[800,800]);

[row,col,ch]=size(I);
O=uint8(zeros(row,col,ch));

for i=1:row
    for j=1:col
        for k=1:ch
            O(i,j,k)=I(j,i,k);
        end
    end    
end
imshow(O);