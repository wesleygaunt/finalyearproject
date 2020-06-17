function y = bin_step(x)
%y = x;
%SIGMOID computes the sigmoidal logistic funtion
%   Detailed explanation goes here
for x(i) in x
    if (x(i) >= 0)
        y(i) = 1;
        
    else
        y(i) = 0;
           
    end
end
 
end