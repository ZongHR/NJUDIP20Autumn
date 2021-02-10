function I =shift(I,P,Q)
for i=1:1:P
    for j=1:1:Q
        I(i,j)=((-1)^(i+j))*I(i,j);
    end
end
end

