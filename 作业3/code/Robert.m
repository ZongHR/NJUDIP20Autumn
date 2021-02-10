function output = Robert(input,scale,~)

[m,n]=size(input);
gx=zeros(m-1,n-1);
gy=zeros(m-1,n-1);
for i=1:m-1
    for j=1:n-1
        gx(i,j)=input(i+1,j+1)-input(i,j);
        gy(i,j)=input(i+1,j)-input(i,j+1);
    end
end
g=gx.^2+gy.^2;
thresh=scale*mean(g(:),'double');
output=g>thresh;
end

