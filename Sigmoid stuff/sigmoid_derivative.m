function [dydx] = sigmoid_derivative(x)
%SIGMOID_DERIVATIVE Summary of this function goes here
%   Detailed explanation goes here
dydx = exp(x)./((1+exp(x)).^2);

end

