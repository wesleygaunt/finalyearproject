clear;
step = 0.01;
start = 0;
finish = 1.8;

voltage_points = start:step:finish;
micro = 0.000001; %mu = 1e-6
pico = micro*micro;

%normalised = extract_td_data("H:\FYP\Sigmoid stuff\sigmoidal_time_domain_output3.csv");
x1 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\sigmoidal_time_domain_output_X1.csv");
x2 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\sigmoidal_time_domain_output_X2.csv");
x3 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\sigmoidal_time_domain_output_X3.csv");

% asymm = extract_td_data("H:\FYP\Sigmoid stuff\sigmoidal_time_domain_output_asymmetric.csv");
% normalised = extract_td_data("H:\FYP\Sigmoid stuff\sigmoidal_time_domain_output2.csv");
% new_cap = extract_td_data("H:\FYP\Sigmoid stuff\sigmoidal_time_domain_output_new_C.csv");

hold on;%scatter(voltage_points, td_data, 'b');
scatter(voltage_points, x1, 'r');
scatter(voltage_points, x2, 'g');
scatter(voltage_points, x3, 'b');

%scatter(voltage_points, asymm, 'g');

T_0 = 1*micro; %scaling factor, 1uS?
V_0 = 0.9;  %voltage offset
compress = 2.5;
    %capacitor in 
T_PULSE_theoretical = T_0*(tanh((voltage_points-V_0)*compress));
T_PULSE_theoretical = T_PULSE_theoretical';
plot(voltage_points, T_PULSE_theoretical);

ylim([-1.1*micro 1.1*micro])
xlabel('V_{CAP} V');
ylabel('T_{OUT} S');

legend('X1','X2','X3', 'theoretical');


    