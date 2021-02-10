function out = log_curve(I,beta)
%通过对数映射进行美白
I=im2double(I);
out=log(I*(beta-1)+1)/log(beta);
end

