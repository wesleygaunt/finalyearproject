% Find theoretical voltages
%determine voltages in New architecture for 8x1D NN
% the architecture is still based on resistors in a crossbar architecture.
Xin_wiBias = [X,repmat(b,size(X(:,1)))]+1;
Win_wiBias = [w';1];

[m,n] = size(Xin_wiBias);
[a,b] = size(Win_wiBias);

WPos = zeros(a,b);
WNeg = zeros(a,b);

X_split = zeros(2*m,n);

X_pos = zeros(m,n);
X_neg = zeros(m,n);

for i = 1:a
    for j = 1:b
    if Win(i,j) >=0
        WPos(i,j) = Win(i,j);
    else
        WNeg(i,j) = -1*Win(i,j);
    end
    end
end

GPos = WPos.*8/6e06;
GNeg = WNeg.*8/6e06;

GTot = sum(abs(Win.*8/6e06),1); % Find total coductance of each branch

Vin = Xin.*2.25;

ZV_Pos = (Vin*GPos)./GTot;
ZV_Neg = (Vin*GNeg)./GTot;
ZV = ZV_Pos - ZV_Neg + 2.25;

YNNMod = (ZV>=2.25);
