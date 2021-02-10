function [output] = myrgb2hsi(input_image)
%first test the image is a RGB or gray image
if numel(size(input_image)) == 3
   input_image=im2double(input_image);
   R=input_image(:,:,1);
   G=input_image(:,:,2);
   B=input_image(:,:,3);
   
   angle=acos(0.5*((R-G)+(R-B))./(sqrt((R-G).^2+(R-B).*(G-B))));
   [height,width]=size(R);
   H=zeros(height,width);
   for i=1:height
       for j=1:width
           if(B(i,j)>G(i,j))
               H(i,j)=2*pi-angle(i,j);
           else
               H(i,j)=angle(i,j);
           end
       end
   end
    H = H/(2*pi);
    S=1-3.*(min(min(R,G),B))./(R+G+B);
    I=(R+G+B)/3;
    output=cat(3,H,S,I); 
else
    %this is a gray image
    output = input_image;
end
end

