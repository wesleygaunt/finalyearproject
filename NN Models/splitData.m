% A set of test commands deisgned to check how splitting data into a
% positive and negative branch affects the outcome.


[m,n] = size(XDat);


W_split = [w_pos,w_pos];

X_split = zeros(2*m,n);

X_pos = zeros(m,n);
X_neg = zeros(m,n);



for i = 1:n
    for j = 1:m
    if XDat(j,i) >=0
        X_split(j,i) = XDat(j,i);
        X_pos(j,i) = XDat(j,i);
    else
        X_split(m+j,i) = XDat(j,i);
        X_neg(j,i) = -1*XDat(j,i);
    end
    end
end

Z_split = W_split * X_split;

Z_pos = w_pos*X_pos;
Z_neg = w_pos*X_neg;

Z_split2 = Z_pos - Z_neg;

Z_split2 = Z_split2 + 1;
Out2 = zeros(1,200);

for i = 1:length(Z_split2)
    if Z_split2(i)>=1
        Out2(i) = 1;
    else
        Out2(i) = 0;
    end
end