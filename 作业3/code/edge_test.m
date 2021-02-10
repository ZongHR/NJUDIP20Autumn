clc; clear all;
% 读取测试图片
imgTest = im2double(imread('../asset/image/rubberband_cap.png'));
%imgTest = im2double(imread('../asset/image/noise.jpg'));
%imgTest = im2double(imread('../asset/image/ayu.jpg'));
%转为灰度图像
imgTestGray = rgb2gray(imgTest);

%调用边缘检测函数
%库函数
img_edge = edge(imgTestGray);
%Robert算子
scale=5;
sigma = 0;
img_robert = my_edge(imgTestGray,1,scale,sigma);
%Prewitt算子
scale=5;
sigma = 0;
img_prewitt = my_edge(imgTestGray,2,scale,sigma);
%Sobel算子
scale=5;
sigma = 0;
img_sobel = my_edge(imgTestGray,3,scale,sigma);
%Marr
sigma = 3;
scale = 0.75;
img_marr = my_edge(imgTestGray,4,scale,sigma);
%Canny
sigma =2; 
scale = 4;
img_canny = my_edge(imgTestGray,5,scale,sigma);

figure;
imshow(img_edge);title('库边缘图像');
figure;
imshow(img_robert);title('Robert边缘图像');
figure;
imshow(img_prewitt);title('Prewitt边缘图像');
figure;
imshow(img_sobel);title('Sobel边缘图像');
figure;
imshow(img_marr);title('Marr边缘图像');
figure;
imshow(img_canny);title('Canny边缘图像');

%背景
background = im2bw(imgTest, 1);

imtool(img_canny);

Bxpc1 = my_edgelinking(img_canny, 96,45);
Bxpc2 = my_edgelinking(img_canny, 97,52);
Bxpc3 = my_edgelinking(img_canny, 58,250);
Bxpc4 = my_edgelinking(img_canny, 58,255);
Bxpc5 = my_edgelinking(img_canny, 146,169);
Bxpc6 = my_edgelinking(img_canny, 211,60);
Bxpc7 = my_edgelinking(img_canny, 297,209);
Bxpc8 = my_edgelinking(img_canny, 134,376);
Bxpc9 = my_edgelinking(img_canny, 183,420);
Bxpc10 = my_edgelinking(img_canny, 164,420);
Bxpc11 = my_edgelinking(img_canny, 156,390);
figure; clf; imshow(background);
hold on
plot(Bxpc1(:,2), Bxpc1(:,1), 'y', 'LineWidth', 1);
plot(Bxpc2(:,2), Bxpc2(:,1), 'm', 'LineWidth', 1);
plot(Bxpc3(:,2), Bxpc3(:,1), 'c', 'LineWidth', 1);
plot(Bxpc4(:,2), Bxpc4(:,1), 'r', 'LineWidth', 1);
plot(Bxpc5(:,2), Bxpc5(:,1), 'g', 'LineWidth', 1);
plot(Bxpc6(:,2), Bxpc6(:,1), 'b', 'LineWidth', 1);
plot(Bxpc7(:,2), Bxpc7(:,1), 'w', 'LineWidth', 1);
plot(Bxpc8(:,2), Bxpc8(:,1), 'y', 'LineWidth', 1);
plot(Bxpc9(:,2), Bxpc9(:,1), 'm', 'LineWidth', 1);
plot(Bxpc10(:,2), Bxpc10(:,1), 'c', 'LineWidth', 1);
plot(Bxpc11(:,2), Bxpc11(:,1), 'r', 'LineWidth', 1);