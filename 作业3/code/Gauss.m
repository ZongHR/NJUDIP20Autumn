function H = Gauss(D0,P,Q)
%高斯滤波器
%D0为截止频率 P,Q为滤波器大小
u=-P/2:(P/2-1);
v=-Q/2:(Q/2-1);
[U,V]=meshgrid(u,v);
D=(U.^2+V.^2)/(2*D0*D0);
H=exp(-D);
H=H/sum(sum(H));
end

