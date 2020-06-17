%To Test the effect of different weights and biasing.
% An effort to test an analogue neural net using the properties extracted
% from cadence simulations.


function [Z, Out, Acc] = NNTest(X,w,b,y)

XRange = -1:0.125:0.875;
[X0_VAL,X1_VAL] = meshgrid(XRange,XRange);

XALL = [reshape(X0_VAL,1,256);reshape(X1_VAL,1,256)];

Z = w*X;
ZALL = w*XALL;
%p = [94959.0476190476,0.0257980952380951];

%Z_V = p(1)*Z+p(2);

Out = zeros(1,200);

for i = 1:length(Z)
    if Z(i)>=-b
        Out(i) = 1;
    else
        Out(i) = 0;
    end
end

for i = 1:length(ZALL)
    if ZALL(i)>=-b
        OutALL(i) = 1;
    else
        OutALL(i) = 0;
    end
end

Acc = findAccuracy(y,Out);


plotXFULL(X,Out);

figure;
%surf(X0_VAL,X1_VAL,reshape(OutALL,16,16));
pcolor(X0_VAL,X1_VAL,reshape(OutALL,16,16));
