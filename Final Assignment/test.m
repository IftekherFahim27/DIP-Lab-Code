%Step 1
I = imread('Image1.jpg');
figure;
imshow(I);

%Step 2
figure;
subplot(2,4,1);
imshow(I);
title('Figure (a) ');

Lf = [ 0 -1 0;
      -1 4 -1;
      0 -1 0 ];
  
Padd = padarray(I,[1 1]);
[row, col] = size(Padd);
O = zeros(row,col);

for i = 1:row-2
    for j = 1:col-2
        V = double(Padd(i:i+2, j:j+2));
        temp = V.*Lf;
        O(i+1, j+1) = sum(temp(:));
    end
end
O= O(2:end-1,2:end-1);

subplot(2,4,2);
imshow(O,[]);
title('Figure (b) ');

%Step 3

C = I + uint8(O);

subplot(2,4,3);
imshow(C);
title('Figure (c)');

%Step 4
Gx = [ 1 0 -1;
       2 0 -2;
       1 0 -1 ];
   
Gy = [ 1 2 1;
       0 0 0;
     -1 -2 -1];

d = zeros(row,col);

for i = 1:row-2
    for j = 1:col-2
        
        V = double(Padd(i:i+2, j:j+2));
        GX = sum(sum(V.*Gx));
        GY = sum(sum(V.*Gy));
        
        d(i+1, j+1) = sqrt(GX.^2+GY.^2);
    end
end
d= uint8(d(2:end-1,2:end-1));

subplot(2,4,4);
imshow(d);
title('Figure (d)');

%Step 5
Avg = [0.04 0.04 0.04 0.04 0.04;
       0.04 0.04 0.04 0.04 0.04;
       0.04 0.04 0.04 0.04 0.04;
       0.04 0.04 0.04 0.04 0.04;
       0.04 0.04 0.04 0.04 0.04;];
   
Padd = padarray(d,[2 2]);
[row2, col2] = size(Padd);
E = zeros(row2,col2);

for i = 1:row2-4
    for j = 1:col2-4
        V = double(Padd(i:i+4, j:j+4));
        t = V.*Avg;
        E(i+2, j+2) = sum(t(:));
    end
end
E= uint8(E(3:end-2,3:end-2));

subplot(2,4,5);
imshow(E);
title('Figure (e) ');

%Step 6

E = im2double(E);
C = im2double(C);
F = E.*C;
F = im2uint8(F);

subplot(2,4,6);
imshow(F);
title('Figure (f) ');

%Step 7
G = I+F;

subplot(2,4,7);
imshow(G);
title('Figure (g) ');

%Step 8

n = 0.5;
c = 1;
T = im2double(G);
[row3,col3]=size(T);
H = zeros(row3,col3);

for i=1:row3
    for j=1:col3
        H(i,j)= c*power(T(i,j),n);
    end
end

subplot(2,4,8);
imshow(H);
title('Figure (h) ');