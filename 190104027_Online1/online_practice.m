Input=imread('input.png');
Back=imread('back.jpg');

subplot(1,4,1);
imshow(Input);
subplot(1,4,2);
imshow(Back);

%imtool(Input);


Input=cat(3,Input,Input,Input);

[row,col,ch]=size(Input);

for i=1:row
    for j=1:col
       R=Input(i,j,1);
       G=Input(i,j,2);
       B=Input(i,j,3);
       
       if R==200 || G==200 || B==200
           
           Input(i,j,:)=Back(i,j,:);
           
       end
       
       if R==218 || G==218 || B==218
           
            Input(i, j, 1) = 255;
            Input(i, j, 2) = 0;
            Input(i, j, 3) = 0;
           
       end
       
       if R==192 || G==192 || B==192
           
            Input(i, j, 1) = 0;
            Input(i, j, 2) = 0;
            Input(i, j, 3) = 128;
           
       end
       
       if R==43 || G==43 || B==43
           
            Input(i, j, 1) = 128;
            Input(i, j, 2) = 0;
            Input(i, j, 3) = 0;
           
       end
       
       if R==84 || G==84 || B==84
           
             Input(i, j, 1) = 0;
             Input(i, j, 2) = 255;
             Input(i, j, 3) = 0;
           
       end
       
       if R==201 || G==201 || B==201
           
             Input(i, j, 1) = 250;
             Input(i, j, 2) = 128;
             Input(i, j, 3) = 114;
           
       end
       
    end    
end            
            




subplot(1,4,3);
imshow(Input);

figure;
imshow(Input);
