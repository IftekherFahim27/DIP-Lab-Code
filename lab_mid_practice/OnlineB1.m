I=imread('armas.jpg');
I=rgb2gray(I);
I=imresize(I,[256,256]);

[row,col]=size(I);
O=uint8(zeros(row,col));
P=uint8(zeros(row,col));


for i=1:56
    for j=1:col/2
        O(i,j)=I(i,j);
        P(i,j)=O(i,j);
    end
    
end
c=50;
for i=56:row
    for j=1:col/2
        O(i,j)=I(i,j);
        P(i,j)=O(i,j);
        P(i,j)=c*log(1+double( P(i,j)));
    end
    
end  

for i=201:row
    for j=128:col
        O(i,j)=I(i,j);
        P(i,j)=O(i,j);
    end
    
end
c=2;
n=2;
for i=1:200
    for j=128:col
        O(i,j)=I(i,j);
        P(i,j)=O(i,j);
        P(i,j)=c*double(P(i,j)).^(1/n);
    end
    
end

figure;
imshow(P);

K=zeros(1,256);

for i=1:row
    for j=1:col
        temp=P(i,j)+1;
        K(temp)=K(temp)+1;
        
    end    
end   
figure;
bar(K);