clear;
micro = 1e-6;

step = 0.05*micro;
start = -1*micro;
finish = 1*micro;
t_pulse_input = start:step:finish;
t_pulse_input = t_pulse_input';
t_pulse_output_theoretical = t_pulse_input; %ideally should be out = in


t_pulse_output_experimental_x1 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\memory_cell_td_output_Cx1.csv");
t_pulse_output_experimental_x2 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\memory_cell_td_output_Cx2.csv");
t_pulse_output_experimental_x5 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\memory_cell_td_output_Cx5.csv");
t_pulse_output_experimental_x10 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\memory_cell_td_output_Cx10.csv");
t_pulse_output_experimental_x20 = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\memory_cell_td_output_Cx20.csv");


hold on;

plot(t_pulse_input, t_pulse_output_theoretical);

scatter(t_pulse_input, t_pulse_output_experimental_x1);

scatter(t_pulse_input, t_pulse_output_experimental_x2);

scatter(t_pulse_input, t_pulse_output_experimental_x5);

scatter(t_pulse_input, t_pulse_output_experimental_x10);

scatter(t_pulse_input, t_pulse_output_experimental_x20);

ylim([-1*micro 1*micro])
xlabel('T_{IN} /S');
ylabel('T_{OUT} /S');
legend('Ideal','C_{MEM} = 1\cdot C_0','C_{MEM} = 2\cdot C_0','C_{MEM} = 5\cdot C_0','C_{MEM} = 10\cdot C_0'); 

%%%%%%%%%%%%%%%%%%%%%%%
error_x1 = abs((t_pulse_output_experimental_x1 - t_pulse_output_theoretical)./t_pulse_output_theoretical); %
error_x1(isnan(error_x1))=0;error_x1(isinf(error_x1))=0;
percentage_error_x1 = 100*mean(error_x1);

error_x2 = abs((t_pulse_output_experimental_x2 - t_pulse_output_theoretical)./t_pulse_output_theoretical); %
error_x2(isnan(error_x2))=0;error_x2(isinf(error_x2))=0;
percentage_error_x2 = 100*mean(error_x2);

error_x5 = abs((t_pulse_output_experimental_x5 - t_pulse_output_theoretical)./t_pulse_output_theoretical); %
error_x5(isnan(error_x5))=0;error_x5(isinf(error_x5))=0;
percentage_error_x5 = 100*mean(error_x5);

error_x10 = abs((t_pulse_output_experimental_x10 - t_pulse_output_theoretical)./t_pulse_output_theoretical); %
error_x10(isnan(error_x10))=0;error_x10(isinf(error_x10))=0;
percentage_error_x10 = 100*mean(error_x10);

error_x20 = abs((t_pulse_output_experimental_x20 - t_pulse_output_theoretical)./t_pulse_output_theoretical); %
error_x20(isnan(error_x20))=0;error_x20(isinf(error_x20))=0;
percentage_error_x20 = 100*mean(error_x20);


figure;
hold on;
cap_x = [1,2,5,10];
error = [percentage_error_x1, percentage_error_x2,percentage_error_x5,percentage_error_x10];
scatter(cap_x,error);
xlabel('Capacitor size /C_0');
ylabel('Mean abs % error');
set(gca, 'YScale', 'log');
set(gca, 'XScale', 'log');
xticks(cap_x)
% ylim([1.3 5]);
% xlim([0.9 11]);

% p = polyfit(log(cap_x),log(error),1);
% z = polyval(p,log(cap_x));
% plot(cap_x, exp(z));

load('mean_error.mat');
scatter(cap_x,2*multiplier_mean_error);


