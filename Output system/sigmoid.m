function [y] = sigmoid(x)
%SIGMOID computes the sigmoidal logistic funtion
%   Detailed explanation goes here

y = 1./(1+exp(-x));
end

