clear all;
%利用高斯低通滤波器对图像进行滤波
A=imread('../asset/image/436.tif');
M=size(A,1);
N=size(A,2);
P=2*size(A,1);  %滤波器的行数
Q=2*size(A,2);  %滤波器的列数
%进行零填充
B = uint8(zeros(P,Q));
B(1:size(A,1),1:size(A,2))=A;
B2=im2double(B);
%移动到变换中心
C=shift(B2,P,Q);
%时域图像转换到频域
D=fft2(C); 
D2=log(abs(D)+1);
%高斯低通滤波器
D0=20;
E=Gauss(D0,P,Q);
%滤波处理
F=D.*E;  
F2=log(abs(F)+1);
%傅立叶反变换
Ltmp=ifft2(F); 
%提取实部
G=shift(real(Ltmp),P,Q);
%裁剪
H=G(1:size(A,1),1:size(A,2));
figure;
subplot(331);imshow(A); 
subplot(332);imshow(B);  
subplot(333);imshow(C);  
subplot(334);imshow(D2,[]);  
subplot(335);imshow(E);  
subplot(336);imshow(F2,[]);  
subplot(337);imshow(G); 
subplot(338),imshow(H);  