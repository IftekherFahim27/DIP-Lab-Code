

I=(imread('concoin.png'));
I = rgb2gray(I);
subplot(2,3,1);
imshow(I);
title('Original image');

I = imbinarize(I);
subplot(2,3,2);
imshow(I);
title('Binarized image');

[row,col]=size(I);
p=zeros(row,col);
p2=zeros(row,col);
p12=zeros(row,col);
p13=zeros(row,col);

%Dilation
w=[1 1 1; 1 1 1; 1 1 1];
for i=2:row-1
    for j=2:col-1
        w1=[I(i-1,j-1)*w(1,1) I(i-1,j)*w(1,2) I(i-1,j+1)*w(1,3) I(i,j-1)*w(2,1) I(i,j)*w(2,2) I(i,j+1)*w(2,3) I(i+1,j-1)*w(3,1) I(i+1,j)*w(3,2) I(i+1,j+1)*w(3,3)];
        p(i,j)=max(w1);
    end
end
subplot(2,3,3);
imshow(p);
title('Dilated image');

%erosion
w=[1 1 1; 1 1 1; 1 1 1];
for i=2:row-1
    for j=2:col-1
        w12=[I(i-1,j-1)*w(1) I(i-1,j)*w(2) I(i-1,j+1)*w(3) I(i,j-1)*w(4) I(i,j)*w(5) I(i,j+1)*w(6) I(i+1,j-1)*w(7) I(i+1,j)*w(8) I(i+1,j+1)*w(9)];
        p2(i,j)=min(w12);
    end
end
subplot(2,3,4);
imshow(p2);
title('Eroded image');

%Opening of image
[m,n]=size(p2);
w=[1 1 1; 1 1 1; 1 1 1];
for i=2:m-1
    for j=2:n-1
        w13=[p2(i-1,j-1)*w(1) p2(i-1,j)*w(2) p2(i-1,j+1)*w(3) p2(i,j-1)*w(4) p2(i,j)*w(5) p2(i,j+1)*w(6) p2(i+1,j-1)*w(7) p2(i+1,j)*w(8) p2(i+1,j+1)*w(9)];
        p12(i,j)=max(w13);
    end
end
subplot(2,3,5);
imshow(p12);
title('opening of image');

%Closing of image

[r,c]=size(p);
w=[1 1 1; 1 1 1; 1 1 1];
for i=2:r-1
    for j=2:c-1
        w14=[p(i-1,j-1)*w(1) p(i-1,j)*w(2) p(i-1,j+1)*w(3) p(i,j-1)*w(4) p(i,j)*w(5) p(i,j+1)*w(6) p(i+1,j-1)*w(7) p(i+1,j)*w(8) p(i+1,j+1)*w(9)];
        p13(i,j)=min(w14);
    end
end
subplot(2,3,6);
imshow(p13);
title('Closing of image');




