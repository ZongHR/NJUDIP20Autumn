function out = log_curve(I,beta)
%ͨ������ӳ���������
I=im2double(I);
out=log(I*(beta-1)+1)/log(beta);
end

