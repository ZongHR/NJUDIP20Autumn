        function [output2] = hist_equal(input_channel)
        %you should complete this sub-function
        [height,width]=size(input_channel);
        PDF=imhist(input_channel);
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
        output2=zeros(height,width);
        for i=1:height
            for j=1:width
                output2(i,j)=CDF(input_channel(i,j)+1);
            end
        end
        output2=uint8(output2);
        end

