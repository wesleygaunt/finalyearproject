%This test plot the voltage rise, of a single input/weight pair for a
%linearly spaced vector of currents. 

VRISE_X1 = importfile('IREF_VS_VRISE_X1.csv');
VRISE_X1 = VRISE_X1(:,2)';    %get rid of first column

VRISE_X250 = importfile('IREF_VS_VRISE_X250.csv');
VRISE_X250 = VRISE_X250(:,2)';    %get rid of first column


IREF_X1 = 0:0.01E-6:0.2E-6;       %0.05uA steps, 0-1uA
IREF_X250 = 0:0.5E-6:10E-6;     %0.5uA steps, 0-10uA

subplot(2,1,1);
scatter(IREF_X1, VRISE_X1,'b');
title(' V_{RISE} vs I_{REF} for a single X/W pair, C = 0.8pF (0.8pF * 1)'); 
ylabel('V_{RISE}');
xlabel('I_{REF}');

subplot(2,1,2);
scatter(IREF_X250, VRISE_X250, 'r');
title('V_{RISE} vs I_{REF} for a single X/W pair, C = 200pF (0.8pF * 250)'); 
ylabel('V_{RISE}');
xlabel('I_{REF}');

