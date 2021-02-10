function H = Gauss(D0,P,Q)
%��˹�˲���
u=-P/2:(P/2-1);
v=-Q/2:(Q/2-1);
[U,V]=meshgrid(u,v);
D=(U.^2+V.^2)/(2*D0*D0);
H=exp(-D);
end

