%Generate compensation weights, for resistive architecture which required a
%compensation branch due to resistive loading.

% Take weights and x inputs and calculate cross voltage values
function [WPosComp, WNegComp] = findWeightBalance(Win)

[m,n] = size(Win);

PosWeights = zeros(m,n);
NegWeights = zeros(m,n);

% Convert weights to conductances
Gweights = (Win.*8)./6e06;

%Split weights to positive and negative
for i = 1:m
    for j=1:n
        if Gweights(i,j) > 0
            PosWeights(i,j) = Gweights(i,j);
        else
            NegWeights(i,j) = Gweights(i,j);
        end
    end
end

GBranches = sum(abs(Gweights),1); % Find total coductance of each branch

GPosBranches = sum(abs(PosWeights),1);
GNegBranches = sum(abs(NegWeights),1);

WNegComp = (GPosBranches.*6e6)./8;
WPosComp = (GNegBranches.*6e6)./8;

WPbin = dec2bin(WPosComp./0.125);
WNbin = dec2bin(WNegComp./0.125);


% each Vcross is a sum of voltages * conductances, divided by total
% conductance
