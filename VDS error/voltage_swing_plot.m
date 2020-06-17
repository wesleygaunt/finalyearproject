clear;
load('data_swing_09.mat');
load('data_swing_009.mat');
load('data_swing_018.mat');
load('data_swing_045.mat');

load('data_swing_09_wilson.mat');
load('data_swing_045_wilson.mat');
load('data_swing_03_wilson.mat');
load('data_swing_0225_wilson.mat');
load('data_swing_018_wilson.mat');

load('data_swing_009_wilson.mat');
load('data_swing_0009_wilson.mat');



% 
voltage_09(51) = [];
NMOS_09(51) = [];
PMOS_09(51) = [];

voltage_09(1) = [];
NMOS_09(1) = [];
PMOS_09(1) = [];

ideal_current = 1e-6;




[mean_error_09, max_error_09] = mean_error_calc(NMOS_09, PMOS_09);
[mean_error_045, max_error_045] = mean_error_calc(NMOS_045, PMOS_045);
[mean_error_018, max_error_018] = mean_error_calc(NMOS_018, PMOS_018);
[mean_error_009, max_error_009] = mean_error_calc(NMOS_009, PMOS_009);


[mean_error_09_wilson, max_error_09_wilson] = mean_error_calc(NMOS_09_wilson, PMOS_09_wilson);
[mean_error_045_wilson, max_error_045_wilson] = mean_error_calc(NMOS_045_wilson, PMOS_045_wilson);
[mean_error_03_wilson, max_error_03_wilson] = mean_error_calc(NMOS_03_wilson, PMOS_03_wilson);
[mean_error_0225_wilson, max_error_0225_wilson] = mean_error_calc(NMOS_0225_wilson, PMOS_0225_wilson);

[mean_error_018_wilson, max_error_018_wilson] = mean_error_calc(NMOS_018_wilson, PMOS_018_wilson);
[mean_error_009_wilson, max_error_009_wilson] = mean_error_calc(NMOS_009_wilson, PMOS_009_wilson);
[mean_error_0009_wilson, max_error_0009_wilson] = mean_error_calc(NMOS_0009_wilson, PMOS_0009_wilson);




factor = [1 2 5 10];
mean_error = [mean_error_09 mean_error_045 mean_error_018 mean_error_009];
mean_error_wilson = [mean_error_09_wilson mean_error_045_wilson mean_error_03_wilson mean_error_0225_wilson mean_error_018_wilson mean_error_009_wilson];


figure;
hold on;
%scatter(factor, mean_error);
scatter([1 2 3 4 5 10], mean_error_wilson);
%scatter(100, mean_error_0009_wilson);


%legend('Sized adjusted basic mirror','Wilson current mirror');


xlabel('\Delta V decrease factor, p');
ylabel('Mean abs % error');
set(gca, 'YScale', 'log');
set(gca, 'XScale', 'log');
xticks([1 2 3 4 5 10]);
xlim([0.9 6]);



function [mean_error,max_error] = mean_error_calc(NMOS, PMOS)
ideal_current = 1e-6;
NMOS_percentage_error = 100*abs(NMOS - ideal_current)/ideal_current;
PMOS_percentage_error = 100*abs(PMOS - ideal_current)/ideal_current;
mean_error = mean([NMOS_percentage_error;PMOS_percentage_error]);
max_error = max([NMOS_percentage_error;PMOS_percentage_error]);

end

