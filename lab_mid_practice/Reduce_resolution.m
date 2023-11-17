I=imread('cameraman.png');
[row,col]=size(I);
O(1:row/2,1:col/2)=I(1:2:row,1:2:col);
figure;
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(O);