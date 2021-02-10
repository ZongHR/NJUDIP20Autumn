clear all
%A = imread('../asset/image/1.png');
%A = imread('../asset/image/2.jpg');
%A = imread('../asset/image/3.png');
%A = imread('../asset/image/4.png');
A = imread('../asset/image/woman.png');

%参数
r=10;%双边滤波器大小
dsigma=5;%空间域sigma
rsigma=0.1;%值域sigma
gsigma=1;%高斯sigma
opacity = 50;%不透明度
beta=3;%美白度

if numel(size(A)) == 3
%彩色图像
I=im2double(A);
%原图进行双边滤波
B(:,:,1)=B_Polish(I(:,:,1),r,dsigma,rsigma);
B(:,:,2)=B_Polish(I(:,:,2),r,dsigma,rsigma);
B(:,:,3)=B_Polish(I(:,:,3),r,dsigma,rsigma);
%图层混合
C=im2double(B)-I+128;
D = imgaussfilt3(C,gsigma);
E = (I*(100 - opacity)+(I+2*D-256)*opacity)/100;
%RGB图像转HSV
F=uint8(E*255+0.5);
hsv=rgb2hsv(F);
v=hsv(:,:,3);
%调整明度进行美白
v=log_curve(v,beta);
hsv(:,:,3)=v;
%转回RGB图像
G=hsv2rgb(hsv);

subplot(1,3,1),imshow(A),title('原图');
subplot(1,3,2),imshow(E),title('磨皮后');
subplot(1,3,3),imshow(G),title('美白后');
else
    %灰度图像
    %只进行双边滤波，不进行图层混合
   I=im2double(A);
   B=B_Polish(I,r,dsigma,rsigma);
   
   subplot(1,2,1),imshow(A),title('原图');
   subplot(1,2,2),imshow(B),title('磨皮后');
end