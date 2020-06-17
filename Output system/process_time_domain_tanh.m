clear;
step_course = 0.1;
step_fine = 0.01;
start = 0;
finish = 1.8;

voltage_points_course = start:step_course:finish;
voltage_points_fine = start:step_fine:finish;
voltage_points_2 = 0.7:0.01:1.1;
voltage_points_221 = 0.6:0.01:1.2;
voltage_points_223 = 0.7:0.01:1.1;


micro = 0.000001; %mu = 1e-6
pico = micro*micro;

%normalised = extract_td_data("H:\FYP\Sigmoid stuff\sigmoidal_time_domain_output3.csv");
x_175 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\interactive.175.csv");
x_180 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\interactive.180.csv");
x_181 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\interactive.181.csv");
x_182 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\interactive.182.csv");
x_183 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\interactive.183.csv");
x_184 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\interactive.184.csv");
x_200 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\interactive.200.csv");
x_202 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\interactive.202.csv");
x_221 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\interactive.221.csv");
x_223 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\interactive.223.csv");


% asymm = extract_td_data("H:\FYP\Sigmoid stuff\sigmoidal_time_domain_output_asymmetric.csv");
% normalised = extract_td_data("H:\FYP\Sigmoid stuff\sigmoidal_time_domain_output2.csv");
% new_cap = extract_td_data("H:\FYP\Sigmoid stuff\sigmoidal_time_domain_output_new_C.csv");

hold on;
%scatter(voltage_points, td_data, 'b');
%scatter(voltage_points_course, x_175, 'r');

%scatter(voltage_points_2, x_202/5);
%scatter(voltage_points_course, x_183);



%scatter(voltage_points_course, x_184, 'g');

%scatter(voltage_points_221, x_221);
%scatter(voltage_points_223, x_223);


T_0 = 1*micro; %scaling factor, 1uS?
V_0 = 0.9;  %voltage offset
compress = 3;
    %capacitor in 
t_pulse_output_theoretical_course = T_0*(tanh((voltage_points_course-V_0)*compress));
%t_pulse_output_theoretical_course = t_pulse_output_theoretical_course';

t_pulse_output_theoretical_fine = T_0*(tanh((voltage_points_fine-V_0)*compress));
t_pulse_output_theoretical_fine = t_pulse_output_theoretical_fine';
plot(voltage_points_fine, t_pulse_output_theoretical_fine);
scatter(voltage_points_fine, x_200);

%ylim([-1.1*micro 1.1*micro])
xlabel('V_{CAP} V');
ylabel('T_{OUT} S');

legend('T_{OUT} theoretical', 'T_{OUT} experimental [C = 10 \cdot C_0]');

error175 = abs((x_175 - t_pulse_output_theoretical_course)./t_pulse_output_theoretical_course); %
error175(isnan(error175))=0;error175(isinf(error175))=0;
percentage_error_175 = 100*mean(error175);

error184 = abs((x_184 - t_pulse_output_theoretical_course)./t_pulse_output_theoretical_course); %
error184(isnan(error184))=0;error184(isinf(error184))=0;
percentage_error_184 = 100*mean(error184);


    