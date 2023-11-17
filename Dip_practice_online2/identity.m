
I = imread('cameraman.png'); 
O=I;

subplot(2, 2, 1);
imshow(I);
title('Original Image');

[row,col]=size(I);

K=zeros(1,256);

for i=1:row
    for j=1:col
        temp=I(i,j)+1;
        K(temp)=K(temp)+1;
        
    end    
end

subplot(2,2,2);
bar(K);
title('Original Image Histogram');


subplot(2, 2, 3);
imshow(O);
title('Transformed Image');

[row,col]=size(O);

K=zeros(1,256);

for i=1:row
    for j=1:col
        temp=O(i,j)+1;
        K(temp)=K(temp)+1;
        
    end    
end

subplot(2,2,4);
bar(K);
title('Transformed Image histogram');
