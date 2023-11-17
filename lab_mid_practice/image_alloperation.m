I=imread('cameraman.png');
imshow(I);
I=imresize(I,[200,200]);
figure;
imshow(I);

K=imfinfo('armas.jpg');
disp(K);