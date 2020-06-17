%Function to set up membrane sim
% SigOut - Matrix representing sensor outputs. A bias point and noise is
% added.
% Membrane is a cell containing info on the size of the array, the indexes
% of the four membranes and the cross sensitivity matrix defined below.

% RDim and CDim are the rows and columns respectively. They do not have to be the same
% but should be even numbers.

% The array is split into quadrants as below

% | 1.K+    3.Ca2+ |
% | 2.Na+   4.H+   |


function [SigOut,Membrane] = createMembrane(RDim,CDim)

Membrane = cell(1,3);

BiasPoint = 500; % sets array mean in mV
NoiseStanDev = 10; % Standard deviation of noise.

% Create array filled with indexes to help with setting array values later.
SensArray = 1:RDim*CDim;
SensArray = reshape(SensArray,RDim,CDim);

% Allocate indexes to each membrane.
K_ArrayInd = SensArray(1:RDim/2,1:CDim/2);
Na_ArrayInd = SensArray((RDim/2)+1:RDim,1:CDim/2);
Ca_ArrayInd = SensArray(1:RDim/2,CDim/2+1:CDim);
H_ArrayInd = SensArray((RDim/2)+1:RDim,(CDim/2)+1:CDim);

Membrane{1,1} = [RDim,CDim];

Membrane{1,2} = ...
    {K_ArrayInd, Ca_ArrayInd; ...
     Na_ArrayInd, H_ArrayInd};

 % Define cross sensitivity matrix
 % S_X-Y means sensitivity of membrane X to ion Y
 % Columns are ions, rows are membranes.
 %  S_K-K   S_K-Na   S_K-Ca    S_K-H
 %  S_Na-K  S_Na-Na  S_Na-Ca   S_Na-H
 %  S_Ca-K  S_Ca-Na  S_Ca-Ca   S_Ca-H
 %  S_H-K   S_H-Na   S_H-Ca    S_H-H
 
 CrossSensMat = ...                      % Membrane \/
[    58.9    8.15,   -1.48,  -1.33; ... % K+
    -0.99   53.83,    1.85    2.71; ... % Na+
    -1.71   10.73    25.31   -1.96; ... % Ca2+
     14.8   24.3     2.14    19.2  ...  % H+
];  % K+    Na+      Ca2+     H+  <--Ion
Membrane{1,3} = CrossSensMat;

% Save array dimensions.
    R = Membrane{1,1}(1,1);
    C = Membrane{1,1}(1,2);
    
    % Set initial array output.
    SigOut = zeros(R,C)+BiasPoint;
    Noise = randn(R,C).*NoiseStanDev;

    SigOut = SigOut;%+Noise;

end