% Take weights and x inputs and calculate cross voltage values
% This is for a resistive crossbar architecture
function [NNVScores,NNSplitVcross,VThevenin,Rth_all_split, VCap_scores] = calcNNVoltages(Xin,Win)

[a,b] = size(Xin);
[m,n] = size(Win);

% Convert weights to conductances
% Unit resistance is 6 M Ohms
Gweights = (Win.*8)./6e06;

% each Vcross is a sum of voltages * conductances, divided by total
% conductance
Gbranches = sum(abs(Gweights),1); % Find total coductance of each branch

Rth = zeros(m,n);
Rth_all_split = zeros(m,1);

    for i=1:m
        for j=1:n
            %Rin(i,j) = (1/Gweights(i,j)) + 1/(Gbranches(1,j)-Gweights(i,j));
            Rth(i,j) = (1/(Gbranches(1,j)-abs(Gweights(i,j))))+1/abs(Gweights(i,j));
        end
        Rth_all_split(i,1) = 1/((1/(Rth(i,1))) + (1/Rth(i,2)) + (1/Rth(i,3)));
        %Rth_all(i,1) = Rth_all_split(i,1)/2;
    end
    
   
        

% Convert X input into voltages (ideal)

VXin = Xin.*(4.5/4);


VGproducts = cell(a,1);
Vproducts = cell(a,1);
PosProds = cell(a,1);
NegProds = cell(a,1);
Vth_pos = cell(a,1);
Vth_neg = cell(a,1);
Vth_pos_all = cell(a,1);
Vth_neg_all = cell(a,1);

PosVcross = zeros(a,n);
NegVcross = zeros(a,n);

VCaps_pos = zeros(a,n);
VCaps_neg = zeros(a,n);


for k = 1:a
    
    %Multiply Values to determine final sign
    VXin_temp_array = [VXin(k,:)',VXin(k,:)',VXin(k,:)'];

    VGproducts{k,1} = VXin_temp_array.*Gweights;

    Vproducts{k,1}(:,:) = VGproducts{k,1}./Gbranches;

    % make weighted sum split to positive and negative

    PosProds{k,1} = zeros(m,n);
    NegProds{k,1} = zeros(m,n);
    
    for i=1:m
        for j=1:n
            
            %Rth(i,j) = 1/(Gbranches(1,j)-abs(Gweights(i,j)));
            
            if Vproducts{k,1}(i,j) >= 0
                PosProds{k,1}(i,j) = Vproducts{k,1}(i,j);
            else
                NegProds{k,1}(i,j) = abs(Vproducts{k,1}(i,j));
            end                     
        end
    end

    PosVcross(k,:) = sum(PosProds{k,1},1);
    NegVcross(k,:) = sum(NegProds{k,1},1);
  
    for i = 1:m
        for j = 1:n
            %Rth(i,j) = 1/(Gbranches(1,j)-abs(Gweights(i,j)));
            Vth_pos{k,1}(i,j) = ((PosVcross(k,j)-PosProds{k,1}(i,j))*Gbranches(1,j))/(Gbranches(1,j)-Gweights(i,j));
            Vth_neg{k,1}(i,j) = ((NegVcross(k,j)-NegProds{k,1}(i,j))*Gbranches(1,j))/(Gbranches(1,j)-Gweights(i,j));
        end
        
        Vth_pos_all{k,1}(i,1) = ((Vth_pos{k,1}(i,1)/Rth(i,1)) + (Vth_pos{k,1}(i,2)/Rth(i,2)) + (Vth_pos{k,1}(i,3)/Rth(i,3)))*Rth_all_split(i,1);
        Vth_neg_all{k,1}(i,1) = ((Vth_neg{k,1}(i,1)/Rth(i,1)) + (Vth_neg{k,1}(i,2)/Rth(i,2)) + (Vth_neg{k,1}(i,3)/Rth(i,3)))*Rth_all_split(i,1);
        
        %Vth_all{k,1}(i,1) = ((Vth_neg_all{k,1}(i,1)/Rth_all(i,1)) +f (Vth_pos_all{k,1}(i,1)/Rth_all(i,1)))*(Rth_all(i,1)/2)
        
        VCaps_pos(k,:) = PosVcross(k,:) .* (1-exp(-1.6e-06./((1./Gbranches).*7e-12)));
        VCaps_neg(k,:) = NegVcross(k,:) .* (1-exp(-1.6e-06./((1./Gbranches).*7e-12)));

    end
end

VThevenin = [Vth_pos_all,Vth_neg_all];
NNSplitVcross = [PosVcross,NegVcross];
NNVScores = PosVcross - NegVcross + 2.25;

VCap_scores = VCaps_pos-VCaps_neg +2.25;


end


