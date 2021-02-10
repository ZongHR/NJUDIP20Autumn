%利用高斯低通滤波器对图像进行滤波
I=imread('../asset/image/432.tif');
M=size(I,1);
N=size(I,2);
P=size(I,1);  %滤波器的行数
Q=size(I,2);  %滤波器的列数
%不进行零填充
I2=im2double(I);
Itmp=shift(I2,P,Q);
%时域图像转换到频域
J=fft2(Itmp,P,Q); 
%高斯低通滤波器
D0=10;
H=Gauss(D0,P,Q);
%滤波处理
K=J.*H;  
%傅立叶反变换
Ltmp=ifft2(K); 
%提取实部
L=shift(real(Ltmp),P,Q);
figure;
subplot(121);imshow(I);title('原图');  %显示原图像
subplot(122),imshow(L);title('无填充');  %显示滤波后的图像