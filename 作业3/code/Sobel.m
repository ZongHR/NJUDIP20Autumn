function output = Sobel(input,scale,~)
[m,n]=size(input);
gx=zeros(m-2,n-2);
gy=zeros(m-2,n-2);
for i=1:m-2
    for j=1:n-2
        gx(i,j)=input(i+2,j)+2*input(i+2,j+1)+input(i+2,j+2)-input(i,j)-2*input(i,j+1)-input(i,j+1);
        gy(i,j)=input(i,j+2)+2*input(i+1,j+2)+input(i+2,j+2)-input(i,j)-2*input(i+1,j)-input(i+2,j);
    end
end
g=gx.^2+gy.^2;
thresh=scale*mean(g(:),'double');
output=g>thresh;
end
