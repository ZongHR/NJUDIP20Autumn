function [output] = HSI_equalization(input_image)
%first test the image is a RGB or gray image
if numel(size(input_image)) == 3
    %this is a RGB image
    %��ת��ΪHSIͼ��
    %��HSIͼ�������I���о���
    %���µ�HSIͼ��ת��ΪRGBͼ��
    hsi=myrgb2hsi(input_image);
    i=hsi(:,:,3);
    i=uint8(255*i+0.5);
    i1=hist_equal(i);
    i2=im2double(i1);
    output=hsi;
    output(:,:,3)=i2;
    output=myhsi2rgb(output);
else
    %this is a gray image
    [output] = hist_equal(input_image);
end
end
