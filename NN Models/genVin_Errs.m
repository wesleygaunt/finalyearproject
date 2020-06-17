%Generate Voltage inputs for error points
%Error points are the inputs for which the MAC produces an incorrect result
%This function takes the MAC result (YDat) and compares it to the model
%result (YMod) and then collects the rows of the input matrix (XDat_Vin)
%which correspond to errors.

%Allows testing of these points individually without running the full input
%set.

function [XDataVin_Errs,Y_errs,errInds] = genVin_Errs(YMod,YDat, XDat_Vin)

errInds = find(not(YMod == YDat));

XDataVin_Errs = XDat_Vin(errInds,:);

Y_errs = YDat(errInds);

end
