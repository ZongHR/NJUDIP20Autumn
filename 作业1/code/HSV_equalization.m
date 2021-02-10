function [output] = HSV_equalization(input_image)
%first test the image is a RGB or gray image
if numel(size(input_image)) == 3
    %this is a RGB image
   %先转化为HSV图像
    %对HSV图像的明度V进行均衡
    %将新的HSV图像转化为RGB图像
    hsv=rgb2hsv(input_image);
    v=hsv(:,:,3);
    v=uint8(255*v+0.5);
    v1=hist_equal(v);
    v2=im2double(v1);
    output=hsv;
    output(:,:,3)=v2;
    output=hsv2rgb(output);
    
else
    %this is a gray image
    [output] = hist_equal(input_image);
end
end

