function [output] = Canny(input,low,sigma)
%��ͼ����и�˹ģ��
N = ceil(sigma*3) * 2 + 1;
gauss=Gauss(sigma,N,N);
img= imfilter(input, gauss, 'replicate');
%ʹ��Sobel���Ӿ����������ͼ���ݶ�
[m,n]=size(img);
gx=zeros(m-2,n-2);
gy=zeros(m-2,n-2);
for i=1:m-2
    for j=1:n-2
        gx(i,j)=img(i+2,j)+2*img(i+2,j+1)+img(i+2,j+2)-img(i,j)-2*img(i,j+1)-img(i,j+1);
        gy(i,j)=img(i,j+2)+2*img(i+1,j+2)+img(i+2,j+2)-img(i,j)-2*img(i+1,j)-img(i+2,j);
    end
end
%�ݶȴ�С�뷽��
M = sqrt(gx.*gx+gy.*gy);
a = atan2d(gy,gx);
dir=zeros(m-2,n-2);
dir((-22.5<=a&a<22.5)|(abs(a)>=157.5))=1;%ˮƽ��Ե����ֱ�ݶ�
dir((-157.5<a&a<=-112.5)|(22.5<=a&a<67.5))=2;%-45�ȱ�Ե
dir((-112.5<a&a<=-67.5)|(67.5<=a&a<112.5))=3;%��ֱ��Ե��ˮƽ�ݶ�
dir((-67.5<a&a<-22.5)|(112.5<=a&a<157.5))=4;%+45�ȱ�Ե

[m,n] = size(M);
%���������
gn = zeros(m,n);
for i=2:1:m-1
    for j=2:1:n-1
        switch dir(i,j)
            case 1
                m1=M(i-1,j);
                m2=M(i+1,j);
            case 2
                m1=M(i-1,j-1);
                m2=M(i+1,j+1);
            case 3
                m1=M(i,j-1);
                m2=M(i,j+1);
            case 4
                m1=M(i-1,j+1);
                m2=M(i+1,j-1);
        end
        if(m1<M(i,j)&&m2<M(i,j))
            gn(i,j)=M(i,j);
        end
    end
end
%�ͺ���ֵ
low = low*mean(gn(:),'double');
%��ֵ�����̶�Ϊ1:2.5
high = low * 2.5;
gnh=(gn>=high);
gnl=(gn>=low);
gnl = gnl-gnh;

output = gnh;
%��ͨ�Է���
for i=2:1:m-1
    for j=2:1:n-1
        if gnl(i,j)>0
            if(gnh(i-1,j-1)||gnh(i-1,j)||gnh(i-1,j+1)||gnh(i,j-1)||gnh(i,j+1)||gnh(i+1,j-1)||gnh(i+1,j)||gnh(i+1,j+1))
                output(i,j)=1;
            end
        end
    end
end

end

