function [output] = myhsi2rgb(input_image)
%first test the image is a RGB or gray image
if numel(size(input_image)) == 3
H = input_image(:,:,1)*2*pi;
S = input_image(:,:,2);
I = input_image(:,:,3);
%×ª»»
[m,n]=size(H);
R=zeros(m,n);
G=zeros(m,n);
B=zeros(m,n);
for i = 1:m
    for j = 1:n
        if (0<=H(i,j))&&(H(i,j)<2*pi/3)
            B(i,j)=I(i,j).*(1-S(i,j));
            R(i,j)=I(i,j).*(1+S(i,j).*cos(H(i,j))./cos(pi/3-H(i,j)));
            G(i,j)=3*I(i,j)-(R(i,j)+B(i,j));
        end
        if (2*pi/3<=H(i,j))&&(H(i,j)<4*pi/3)
            R(i,j)=I(i,j).*(1-S(i,j));
            G(i,j)=I(i,j).*(1+S(i,j).*cos(H(i,j)-2*pi/3)./cos(pi-H(i,j)));
            B(i,j)=3*I(i,j)-(R(i,j)+G(i,j));
        end
        if (4*pi/3<=H(i,j))&& (H(i,j)<2*pi)
            G(i,j)=I(i,j).*(1-S(i,j));
            B(i,j)=I(i,j).*(1+S(i,j).*cos(H(i,j)-4*pi/3)./cos(5*pi/3-H(i,j)));
            R(i,j)=3*I(i,j)-(G(i,j)+B(i,j));
        end
    end
end
output=cat(3,R,G,B);
output=uint8(output*255+0.5);
else
    %this is a gray image
    output = input_image;
end
end

