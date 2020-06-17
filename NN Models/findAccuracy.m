function Accuracy = findAccuracy(y_actual, YResult)

% NumInputs = length(y_actual);
% 
% diff = y_actual - YResult;
% 
% NumDiffs = sum(abs(diff));
% 
% Accuracy = ((NumInputs - NumDiffs)*100)/NumInputs;
Accuracy = (mean(YResult == y_actual))*100;