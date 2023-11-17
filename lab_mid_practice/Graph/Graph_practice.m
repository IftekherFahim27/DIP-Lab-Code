X = [-5 6 8 9 -1];
Y = [-2 4 -3 5 1];
plot(X,Y,'*'); % . O X ^ t d s 

figure;
A=1:100;
B=A.^3;
plot(A,B,'.-r'); % line "-" color r g b c
hold on;
B=(A+10).^3
plot(A,B,'.-g');

figure;
bar(A,B);

I=imread('cameraman.png');
figure;
bar(I);
figure;
plot(I);