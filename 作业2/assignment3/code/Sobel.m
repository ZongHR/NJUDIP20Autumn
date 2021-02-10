A=imread('../asset/image/3_3.jpg');
M=size(A,1);
N=size(A,2);
P=size(A,1)+2;  %滤波器的行数
Q=size(A,2)+2;  %滤波器的列数

%频率域滤波
%对原图进行零填充
B=uint8(zeros(P,Q));
B(2:size(A,1)+1,2:size(A,2)+1)=A;
B2=im2double(B);
%中心化并进行DFT
C=shift(B2,P,Q);
D=fft2(C); 

%将算子置于滤波器中心
H=uint8(zeros(P,Q));
sobel=[[1,0,-1];[2,0,-2];[1,0,-1]];
H(P/2:P/2+2,Q/2:Q/2+2)=sobel;
%中心化
H2=im2double(H);
H2=shift(H2,P,Q);
%DFT
Ht=fft2(H2);
%实部置为零
Ht=imag(Ht)*1i;
%中心化
Ht=shift(Ht,size(Ht,1),size(Ht,2));
%滤波运算
E=Ht.*D;
%转回空间域
F=ifft2(E);
%提取实部
G=shift(real(F),P,Q);
%裁剪
R=G(2:size(A,1)+1,2:size(A,2)+1);

%空间域滤波
B2=zeros(P,Q);
B2(2:M+1,2:N+1)=A;
C2=zeros(P,Q);

for i=2:1:M+1
    for j=2:1:N+1
        C2(i,j) =B2(i-1,j+1)+2*B2(i,j+1)+B2(i+1,j+1)-B2(i-1,j-1)-2*B2(i,j-1)-B2(i+1,j-1);
    end
end
R2=C2(2:size(A,1)+1,2:size(A,2)+1);

figure;
subplot(221);imshow(A,[]);title('原图');
subplot(222);imshow(log(1 + abs(Ht)),[]);title('频域算子');
subplot(223);imshow(R,[]);title('频率域滤波');
subplot(224);imshow(R2,[]);title('空间域滤波');