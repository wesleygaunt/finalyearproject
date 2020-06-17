%Function that uses coefficients of linear regression model to create
%predicted output currents of analogue MAC, and therefore test neural
%network in Matlab.

%Coefficients were obtained from cadence simulation results. This full
%script depends is specific to one architecture.

function [Z, Z_V, Out] = NNclassify(X,w,b)

Z = w*X;

p = [94959.0476190476,0.0257980952380951];

Z_V = p(1)*Z+p(2);

Out = zeros(1,200);

for i = 1:length(Z)
    if Z_V(i)>=b
        Out(i) = 1;
    else
        Out(i) = 0;
    end
end