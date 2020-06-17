%read NN output voltages from a CSV file and determine classifications
% This is for earlier Tests which used an output comparator to produce a 0
% or VDD result. VDD = 4.5V, so a '1' is counted as Vout > 4
function [OutMat,Y] = csvClassify(filename,NumVars,NumLines)

O = csvread(filename,1,3);

outLen = round(length(O)/(NumLines));
strtInd = 3:2:NumLines;
step = NumLines;

OutMat = zeros(outLen,NumVars);

for k = 1:NumVars
    OutMat(:,k) = O(strtInd(k):step:length(O),1);
end
    

Y = zeros(length(OutMat(:,1)),1);


for i = 1:length(OutMat(:,1))
    if (OutMat(i,1) >4) % threshold for deciding 1 or 0 set at 4V
        Y(i) = 1;
    else
        Y(i) = 0;
    end
end

end