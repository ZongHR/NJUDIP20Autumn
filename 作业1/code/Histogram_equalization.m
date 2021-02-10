function [output] = Histogram_equalization(input_image)
%first test the image is a RGB or gray image
if numel(size(input_image)) == 3
    %this is a RGB image
    %对RGB三个通道分别进行均衡，然后合成为结果
    r=input_image(:,:,1);
    g=input_image(:,:,2);
    b=input_image(:,:,3);
    r1 = hist_equal(r);
    g1 = hist_equal(g);
    b1 = hist_equal(b);
    output = cat(3,r1,g1,b1);    
else
    %this is a gray image
    [output] = hist_equal(input_image);
end
end