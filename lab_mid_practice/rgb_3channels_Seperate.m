I=imread('armas.jpg');
I=imresize(I,[256,256]);

[row,col,ch]=size(I);


R=I(1:row,1:col,1);
G=I(1:row,1:col,2);
B=I(1:row,1:col,3);

figure;
subplot(1,3,1);
imshow(R);
subplot(1,3,2);
imshow(G);
subplot(1,3,3);
imshow(B);

