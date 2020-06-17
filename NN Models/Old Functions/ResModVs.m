%Inputs
%XwiBias
%Win
%GSamp = 6e6;

function Vscores = ResModVs(XwiBias,Win,M,GSamp)

VXin = ((XwiBias)+4)*(4.5/8);

Vref = 2.25;

[m,n] = size(Win);

Gweights = ((Win.*8)./6e06)*M;

GBranches = sum(abs(Gweights),1); % Find total coductance of each branch

GT = max(GBranches)+GSamp;

PosWeights = zeros(m,n);
NegWeights = zeros(m,n);

for i = 1:m
    for j=1:n
        if Gweights(i,j) > 0
            PosWeights(i,j) = Gweights(i,j);
        else
            NegWeights(i,j) = Gweights(i,j);
        end
    end
end

GPosBranches = sum(abs(PosWeights),1);
GNegBranches = sum(abs(NegWeights),1);

VcPos = ((VXin*PosWeights)/GT)+(Vref.*((GNegBranches+GSamp)/GT));
VcNeg = ((VXin*abs(NegWeights))/GT)+(Vref.*((GPosBranches+GSamp)/GT));

Vscores = VcPos - VcNeg + 2.25;

% [res, ind] = max(Vscores2,[],2);
% ind = ind' -1;
% 
% AccNNCalc_ResSamp = findAccuracy(y,ind);

end