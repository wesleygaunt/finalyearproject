%function to simulate the addition of ions to the array created with 
% createMembrane.m

%SigOut is the sensing array output
%Conc should be a number presenting the decades of ion you want to add
% e.g. 1 would be 1pH or 1pNa
% Ion is a string representing the ion 
% must be 'K', 'Na', 'Ca', 'H'

% SigOut and Membrane were created in the previous function.

function SigOut = addIon(Conc, Ion, SigOut, Membrane)

    %Determine which ion is being added and select that column
    %of the cross sensitivity matrix.
    if strcmp(Ion, 'K')
        CrossSensCol = 1;
    elseif strcmp(Ion, 'Na')
        CrossSensCol = 2;
    elseif strcmp(Ion, 'Ca')
        CrossSensCol = 3;        
    elseif strcmp(Ion, 'H')
        CrossSensCol = 4;
    end
                 
    %Membrane
    % 1. K  3.Ca
    % 2.Na  4. H
    
    % adjust array output for each quadrant.
    for n = 1:4
        SigOut(Membrane{1,2}{n}) = SigOut( Membrane{1,2}{n}) + Conc*Membrane{1,3}(n, CrossSensCol);
    end

    %Optional, add noise to output?
    IonNoise = randn(Membrane{1,1}); %Stand dev of 1, mean 0
    %SigOut = SigOut+IonNoise;
    
   %surf(SigOut); 
    
end