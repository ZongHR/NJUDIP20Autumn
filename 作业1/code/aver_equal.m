    function [output1,output2,output3] = aver_equal(input_channel1,input_channel2,input_channel3)
    %you should complete this sub-function
    [height,width]=size(input_channel1);
    i1=imhist(input_channel1);
    i2=imhist(input_channel2);
    i3=imhist(input_channel3);
    PDF=round((i1+i2+i3)/3);
    %构造累积分布直方图
    CDF=zeros(256,1);
    for i=1:256
        if i==1
            CDF(i)=PDF(i);
        else
            CDF(i)=CDF(i-1)+PDF(i);
        end    
    end
    CDF=256*CDF/(height*width);
    %根据CDF进行灰度变换，从而均衡化
    output1=zeros(height,width);
    output2=zeros(height,width);
    output3=zeros(height,width);
    for i=1:height
        for j=1:width
            output1(i,j)=CDF(input_channel1(i,j)+1);
            output2(i,j)=CDF(input_channel2(i,j)+1);
            output3(i,j)=CDF(input_channel3(i,j)+1);
        end
    end
    output1=uint8(output1);
    output2=uint8(output2);
    output3=uint8(output3);
    end

