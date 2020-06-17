clear;

voltage_points_313 = 0:0.01:1.8; %course for the entire voltage range, 10u


voltage_points_324 = 0.8:0.001:1.0;%10u

voltage_points_fine = 0:0.001:1.8;

micro = 0.000001; %mu = 1e-6
pico = micro*micro;

%normalised = extract_td_data("H:\FYP\Sigmoid stuff\sigmoidal_time_domain_output3.csv");
x_313 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\interactive.313.csv");
x_324 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\interactive.324.csv");



hold on;

scatter(voltage_points_313, x_313);


scatter(voltage_points_324, x_324);

T_0 = 1*micro; %scaling factor, 1uS?
V_0 = 0.90;  %voltage offset
compress = 30;
t_pulse_output_theoretical = T_0*(sigmoid((voltage_points_fine-V_0)*compress));
plot(voltage_points_fine,t_pulse_output_theoretical);

ylim([-0.1*micro 1.1*micro])
xlim([0.0 1.8])

xlabel('V_{CAP} V');
ylabel('T_{OUT} S');

legend('Course','Fine', 'Theoretical');

figure;
hold on;
%341, IREF = 25u, v discharge = 0.3V
compress = 10;
t_pulse_output_theoretical = T_0*(sigmoid((voltage_points_fine-V_0)*compress));
voltage_points_341 = 0:0.01:1.8;%10u
x_341 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\interactive.341.csv");


scatter(voltage_points_341, x_341);
plot(voltage_points_fine,t_pulse_output_theoretical);

figure;
hold on;
voltage_points_350 = 0:0.1:1.8;%10u
x_350 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\interactive.350.csv");

compress = 5
t_pulse_output_theoretical = T_0*(sigmoid((voltage_points_fine-V_0)*compress));
scatter(voltage_points_350, x_350);
plot(voltage_points_fine,t_pulse_output_theoretical);

    