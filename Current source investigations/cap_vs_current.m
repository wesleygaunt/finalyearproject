m = 1E-3;
u = 1E-6;
n = 1E-9;
p = 1E-12;

unit_C = 0.9982 * p;


VDD = 1.8;   %max voltage swing
pulse_width_max = 1*u;    %1 uS

inputs = 3; %this is 2 X inputs + 1 b input


I_REF_uA = [0.1];

I_REF = I_REF_uA*u;
max_multiplier = 15;       %this is for 4 bit multiplier
I_MAX = max_multiplier * I_REF;

C = pulse_width_max * inputs * I_MAX * 2 / VDD;    %F
C_pF = C/p
E = VDD * I_MAX * inputs*pulse_width_max;
%E = 2 * C * ((VDD/2)^2)
E_pJ = E/p
scatter(I_REF, C);
Cap_M = C/unit_C;

xlabel('I_{REF} /A');
ylabel('C /F');
title('Capacitor size vs referance current magnitude');


