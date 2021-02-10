function [output] = Average_equalization(input_image)
%first test the image is a RGB or gray image
if numel(size(input_image)) == 3
    %this is a RGB image
    %先对RGB三个通道取平均值
    %根据平均值的直方图对三个通道进行均衡
    r=input_image(:,:,1);
    g=input_image(:,:,2);
    b=input_image(:,:,3);
    [r1,g1,b1]=aver_equal(r,g,b);
    output = cat(3,r1,g1,b1);    
else
    %this is a gray image
    [output] = hist_equal(input_image);
end
end
