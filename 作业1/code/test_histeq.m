%test histeq
%I = imread('../asset/image/gray.jpg');
%I = imread('../asset/image/gray1.jpg');
%I = imread('../asset/image/gray2.jpg');
%I = imread('../asset/image/gray3.jpg');
%I = imread('../asset/image/color.jpg');
I = imread('../asset/image/color1.jpg');
%I = imread('../asset/image/color2.jpg');
%I = imread('../asset/image/color3.jpg');
if numel(size(I)) == 3
    [J1]=Histogram_equalization(I);
    [J2] = Average_equalization(I);
    [J3] =HSV_equalization(I);
    [J4] =HSI_equalization(I);
    [J5]=histeq(I);
    
    figure
    subplot(3,2, 1), imshow(I), title('原图')
    subplot(3,2, 2), imshow(J1), title('RGB均衡')
    subplot(3,2, 3), imshow(J2), title('平均RGB均衡')
    subplot(3,2, 4), imshow(J3), title('HSV均衡')
    subplot(3,2, 5), imshow(J4), title('HSI均衡')
    subplot(3,2, 6), imshow(J3), title('库函数均衡')
else
    [J1]=Histogram_equalization(I);
    [J2]=histeq(I);
    subplot(1,3, 1), imshow(I), title('原图')
    subplot(1,3, 2), imshow(J1), title('均衡')
    subplot(1,3, 3), imshow(J2), title('库函数')
    
end