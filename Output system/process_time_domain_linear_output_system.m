clear;

micro = 1e-6;

voltage_points_x1 = -0.9:0.1:0.9;
voltage_points_x2 = -0.5:0.05:0.5;
voltage_points_x5 = -0.2:0.02:0.2;
voltage_points_x10 = -0.1:0.01:0.1;

T_PULSE_x1_theoretical = 1*micro*(voltage_points_x1);
T_PULSE_x2_theoretical = 2*micro*(voltage_points_x2);
T_PULSE_x5_theoretical = 5*micro*(voltage_points_x5);
T_PULSE_x10_theoretical = 10*micro*(voltage_points_x10);


% t_pulse_x1_experimental = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\linear_td_output_Cx1.csv");
% t_pulse_x2_experimental = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\linear_td_output_Cx2.csv");
% t_pulse_x5_experimental = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\linear_td_output_Cx5.csv");
% t_pulse_x10_experimental = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\linear_td_output_Cx10.csv");

t_pulse_x1_experimental = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\linear_td_output_Cx1_1083.csv");
t_pulse_x2_experimental = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\linear_td_output_Cx2_1083.csv");
t_pulse_x5_experimental = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\linear_td_output_Cx5_1083.csv");
t_pulse_x10_experimental = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\linear_td_output_Cx10_1083.csv");


T_PULSE_x1_theoretical = T_PULSE_x1_theoretical';
T_PULSE_x2_theoretical = T_PULSE_x2_theoretical';
T_PULSE_x5_theoretical = T_PULSE_x5_theoretical';
T_PULSE_x10_theoretical = T_PULSE_x10_theoretical';

hold on;

plot(voltage_points_x1, T_PULSE_x1_theoretical);
plot(voltage_points_x2, T_PULSE_x2_theoretical);
plot(voltage_points_x5, T_PULSE_x5_theoretical);
plot(voltage_points_x10, T_PULSE_x10_theoretical);

scatter(voltage_points_x1, t_pulse_x1_experimental);
scatter(voltage_points_x2, t_pulse_x2_experimental);
scatter(voltage_points_x5, t_pulse_x5_experimental);
scatter(voltage_points_x10, t_pulse_x10_experimental);



ylim([-1*micro 1*micro]);
xlabel('V_{in} /V');
ylabel('T_{OUT} /s');

legend('T expected [C = 1\cdot C_0]', 'T expected [C = 2\cdot C_0]', 'T expected [C = 5\cdot C_0]', 'T expected [C = 10\cdot C_0]', 'T [C = 1\cdot C_0]', 'T [C = 2\cdot C_0]', 'T [C = 5\cdot C_0]', 'T [C = 10\cdot C_0]');    
%
%normalise them
figure;
hold on;

voltage_points_normalised = -1:0.1:1;
T_PULSE_theoretical_normalised = 1*micro*(voltage_points_normalised);
plot(voltage_points_normalised,T_PULSE_theoretical_normalised);

scatter(voltage_points_x1, t_pulse_x1_experimental);
scatter(voltage_points_normalised, t_pulse_x2_experimental);
scatter(voltage_points_normalised, t_pulse_x5_experimental);
scatter(voltage_points_normalised, t_pulse_x10_experimental);

xlabel('V_{in} normalised /V');
ylabel('T_{OUT} /s');
ylim([-1.1*micro 1.1*micro]);


legend('T expected (normalised)', 'T [C = 1\cdot C_0] (normalised)', 'T [C = 2\cdot C_0] (normalised)', 'T [C = 5\cdot C_0] (normalised)', 'T [C = 10\cdot C_0] (normalised)');    
%error calc

error_x1 = abs((t_pulse_x1_experimental - T_PULSE_x1_theoretical)./T_PULSE_x1_theoretical); %
error_x1(isnan(error_x1))=0;error_x1(isinf(error_x1))=0;
percentage_error_x1 = 100*mean(error_x1);

error_x2 = abs((t_pulse_x2_experimental - T_PULSE_x2_theoretical)./T_PULSE_x2_theoretical); %
error_x2(isnan(error_x2))=0;error_x2(isinf(error_x2))=0;
percentage_error_x2 = 100*mean(error_x2);

error_x5 = abs((t_pulse_x5_experimental - T_PULSE_x5_theoretical)./T_PULSE_x5_theoretical); %
error_x5(isnan(error_x5))=0;error_x5(isinf(error_x5))=0;
percentage_error_x5 = 100*mean(error_x5);

error_x10 = abs((t_pulse_x10_experimental - T_PULSE_x10_theoretical)./T_PULSE_x10_theoretical); %
error_x10(isnan(error_x10))=0;error_x10(isinf(error_x10))=0;
percentage_error_x10 = 100*mean(error_x10);

figure;

cap_x = [1,2,5,10];
error_linear_output = [percentage_error_x1, percentage_error_x2,percentage_error_x5,percentage_error_x10];
scatter(cap_x,error_linear_output);
xlabel('Capacitor size /C_0');
ylabel('Mean abs % error');
set(gca, 'YScale', 'log');
set(gca, 'XScale', 'log');
xticks([1 2 5 10]);
xlim([0.9 11]);

p = polyfit(log(cap_x),log(error_linear_output),1);
z = polyval(p,log(cap_x));
hold on;
plot(cap_x, exp(z),'k--');