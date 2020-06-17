% Converts a millivolt change to a pulse width based on
% sensitivity measured on ATLAS

function Tout = convertSigtoT(SigOut)

%not used currently as have full /millivolts to freq relationship.
%subslope = log10(exp(1))/(0.026*1.35);
%logI = (SigOut./1000).*subslope;
%logItoF = 
%Tout = SigOut.*gm.*ItoF;

% THis relationship taken from measured results of atlas.
% Note this is taken from a reference electrode input, so may be attenuated
% compared to actual ion response.
FreqOut = 400*exp(0.009.*SigOut);



Tout = 1./FreqOut;

end