%read NN output voltages from a CSV file and determine classifications
% For later tests with 3 classes, so chosen class is determined by max of
% the three voltage outputs.

function [OutMat,Y] = csvfindMax(filename,NumVars,NumLines)

O = csvread(filename,1,3);

outLen = round(length(O)/(NumLines));
strtInd = 3:1:NumLines;
step = NumLines;

OutMat = zeros(outLen,NumVars);

for k = 1:NumVars
    OutMat(:,k) = O(strtInd(k):step:length(O),1);
end
    

%Y = zeros(length(OutMat(:,1)),1);

[~, Y] = max(OutMat(:,:),[],2);

Y = Y-1;
end