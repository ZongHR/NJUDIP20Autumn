function output = Marr(input,scale,sigma)
[m,n] = size(input);
output = false(m,n);
%生成LoG滤波器
LoG = fspecial('log',ceil(sigma*3) * 2 + 1,sigma);
LoG = LoG - mean(LoG(:));
%卷积
g = imfilter(input,LoG,'replicate');
%设置阈值
thresh = scale * mean(abs(g(:)));
%寻找零交叉点
for i=2:m-1
    for j=2:n-1
        if(g(i,j)*g(i+1,j+1)<0 && abs(g(i,j)-g(i+1,j+1))>thresh)
            output(i,j)=1;
        end
        if(g(i,j)*g(i+1,j)<0 && abs(g(i,j)-g(i+1,j))>thresh)
            output(i,j)=1;
        end
        if(g(i,j)*g(i,j+1)<0 && abs(g(i,j)-g(i,j+1))>thresh)
            output(i,j)=1;
        end
    end
end

end