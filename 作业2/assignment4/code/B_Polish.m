function [ out ] = B_Polish( I,r,dsigma,rsigma)
% I输入图像；r滤波器大小；dsigma空间域sigma；rsigma值域sigma

%空间域高斯因子
[x,y] = meshgrid(-r:r);
w1 = exp(-(x.^2+y.^2)/(2*dsigma^2));

I = im2double(I);
[m,n] = size(I);
I2 = padarray(I,[r r],'symmetric');
out = zeros(m,n);
for i = r+1:m+r
    for j = r+1:n+r
        temp = I2(i-r:i+r,j-r:j+r);
        w2 = exp(-(temp-I(i-r,j-r)).^2/(2*rsigma^2));%值域高斯因子
        w = w1.*w2;
        s = temp.*w;
        out(i-r,j-r) = sum(s(:))/sum(w(:));
    end
end
end


