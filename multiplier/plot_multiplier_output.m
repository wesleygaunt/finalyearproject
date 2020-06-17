%clear;


micro = 1e-6;
step = 0.05*micro;
start = -1*micro;
finish = 1*micro;

x = (-1:0.05:1)';
time_domain_input = x * micro;

voltage_output_experimental_x1 = importfile("C:\Users\Test\OneDrive - Imperial College London\FYP\multiplier\td_to_voltage_single_multiplier_1pF_x1.csv");
voltage_output_experimental_x2 = importfile("C:\Users\Test\OneDrive - Imperial College London\FYP\multiplier\td_to_voltage_single_multiplier_1pF_x2.csv");
voltage_output_experimental_x5 = importfile("C:\Users\Test\OneDrive - Imperial College London\FYP\multiplier\td_to_voltage_single_multiplier_1pF_x5.csv");
voltage_output_experimental_x10 = importfile("C:\Users\Test\OneDrive - Imperial College London\FYP\multiplier\td_to_voltage_single_multiplier_1pF_x10.csv");
voltage_output_experimental_x3_wilson = importfile("C:\Users\Test\OneDrive - Imperial College London\FYP\multiplier\td_to_voltage_single_multiplier_1pF_x3_wilson.csv");
voltage_output_experimental_x5_wilson = importfile("C:\Users\Test\OneDrive - Imperial College London\FYP\multiplier\td_to_voltage_single_multiplier_1pF_x5_wilson.csv");

voltage_output_theoretical_x1 = (time_domain_input/micro) * (1/1);      %this is the expected output
voltage_output_theoretical_x2 = (time_domain_input/micro) * (1/2);      %this is the expected output
voltage_output_theoretical_x3 = (time_domain_input/micro) * (1/3);      %this is the expected output
voltage_output_theoretical_x5 = (time_domain_input/micro) * (1/5);      %this is the expected output
voltage_output_theoretical_x10 = (time_domain_input/micro) * (1/10);      %this is the expected output

figure;
hold on;
plot(time_domain_input, voltage_output_theoretical_x1);
plot(time_domain_input, voltage_output_theoretical_x2);
plot(time_domain_input, voltage_output_theoretical_x5);
plot(time_domain_input, voltage_output_theoretical_x3);

plot(time_domain_input, voltage_output_theoretical_x10);

scatter(time_domain_input,voltage_output_experimental_x1);
scatter(time_domain_input,voltage_output_experimental_x2);
scatter(time_domain_input,voltage_output_experimental_x3_wilson);

scatter(time_domain_input,voltage_output_experimental_x5);
scatter(time_domain_input,voltage_output_experimental_x10);

xlabel("T_{IN} /s");
ylabel("\Delta V /V");

legend('\Delta V expected [C = 1\cdot C_0]','\Delta V expected [C = 2\cdot C_0]','\Delta V expected [C = 5\cdot C_0]','\Delta V expected [C = 10\cdot C_0]','\Delta V [C = 1\cdot C_0] ','\Delta V [C = 2\cdot C_0] ','\Delta V [C = 5\cdot C_0]','\Delta V [C = 10\cdot C_0]');
ylim([-1.1 1.1]);



%normalise it all to 1V
figure;
voltage_output_experimental_x1_normalised = voltage_output_experimental_x1*1;
voltage_output_experimental_x2_normalised = voltage_output_experimental_x2*2;
voltage_output_experimental_x5_normalised = voltage_output_experimental_x5*5;
voltage_output_experimental_x10_normalised = voltage_output_experimental_x10*10;

voltage_output_theoretical_normalised = voltage_output_theoretical_x1 * 1;


hold on;
plot(voltage_output_theoretical_normalised, voltage_output_theoretical_normalised);


scatter(voltage_output_theoretical_normalised,voltage_output_experimental_x1_normalised);
scatter(voltage_output_theoretical_normalised,voltage_output_experimental_x2_normalised);
scatter(voltage_output_theoretical_normalised,voltage_output_experimental_x5_normalised);
scatter(voltage_output_theoretical_normalised,voltage_output_experimental_x10_normalised);

xlabel("\Delta V expected (normalised)");
ylabel("\Delta V (normalised)");

legend('Expected','C = 1\cdot C_0','C = 2\cdot C_0','C = 5\cdot C_0','C = 10\cdot C_0');
ylim([-1.1 1.1]);
%%%%%%%%%%%%%%%%%%%%%%              error calc.

voltage_output_theoretical_normalised_no_0V = voltage_output_theoretical_normalised;
voltage_output_theoretical_normalised_no_0V(21) = [];

error_x3_wilson = 100*abs((voltage_output_experimental_x3_wilson - voltage_output_theoretical_x3)./voltage_output_theoretical_x3); %
error_x3_wilson(isnan(error_x3_wilson))=[];
error_x3_wilson(isinf(error_x3_wilson))=[];
mean_percentage_error_x3_wilson = mean(error_x3_wilson);
max_percentage_error_x3_wilson = max(error_x3_wilson);


error_x5_wilson = 100*abs((voltage_output_experimental_x5_wilson - voltage_output_theoretical_x5)./voltage_output_theoretical_x5); %
error_x5_wilson(isnan(error_x5_wilson))=[];
error_x5_wilson(isinf(error_x5_wilson))=[];
mean_percentage_error_x5_wilson = mean(error_x5_wilson);
max_percentage_error_x5_wilson = max(error_x5_wilson);




error_x1 = 100*abs((voltage_output_experimental_x1 - voltage_output_theoretical_x1)./voltage_output_theoretical_x1); %
error_x1(isnan(error_x1))=[];
error_x1(isinf(error_x1))=[];
mean_percentage_error_x1 = mean(error_x1);
max_percentage_error_x1 = max(error_x1);

error_x2 = 100*abs((voltage_output_experimental_x2 - voltage_output_theoretical_x2)./voltage_output_theoretical_x2); %
error_x2(isnan(error_x2))=[];
error_x2(isinf(error_x2))=[];
mean_percentage_error_x2 = mean(error_x2);
max_percentage_error_x2 = max(error_x2);

error_x5 = 100*abs((voltage_output_experimental_x5 - voltage_output_theoretical_x5)./voltage_output_theoretical_x5); %
error_x5(isnan(error_x5))=[];
error_x5(isinf(error_x5))=[];
mean_percentage_error_x5 = mean(error_x5);
max_percentage_error_x5 = max(error_x5);

error_x10 = 100*abs((voltage_output_experimental_x10 - voltage_output_theoretical_x10)./voltage_output_theoretical_x10); %
error_x10(isnan(error_x10))=[];
error_x10(isinf(error_x10))=[];
mean_percentage_error_x10 = mean(error_x10);
max_percentage_error_x10 = max(error_x10);

mean_quantization_error = 9.1;

figure;
hold on;
scatter(voltage_output_theoretical_normalised_no_0V,error_x3_wilson);
plot([-1 1], [mean_percentage_error_x3_wilson mean_percentage_error_x3_wilson], 'k--');
ylabel('abs % error');
xlabel('\Delta V expected (normalised)');
title('C_{ACC} = 3\cdot C_0 wilson');
ylim([0 20]);

figure;
hold on;
scatter(voltage_output_theoretical_normalised_no_0V,error_x5_wilson);
plot([-1 1], [mean_percentage_error_x5_wilson mean_percentage_error_x5_wilson], 'k--');
ylabel('abs % error');
xlabel('\Delta V expected (normalised)');
title('C_{ACC} = 5\cdot C_0 wilson');
ylim([0 20]);

figure;
hold on;
diff_x3 = voltage_output_experimental_x3_wilson - voltage_output_theoretical_x3;
diff_x5 = voltage_output_experimental_x5_wilson - voltage_output_theoretical_x5;
plot(diff_x3);
plot(diff_x5);

figure;

subplot(2,2,1);
hold on;
scatter(voltage_output_theoretical_normalised_no_0V,error_x1);
plot([-1 1], [mean_percentage_error_x1 mean_percentage_error_x1], 'k--');
ylabel('abs % error');
xlabel('\Delta V expected (normalised)');
title('C_{ACC} = 1\cdot C_0');
ylim([0 20]);

subplot(2,2,2);
hold on;
scatter(voltage_output_theoretical_normalised_no_0V,error_x2);
plot([-1 1], [mean_percentage_error_x2 mean_percentage_error_x2], 'k--');
ylabel('abs % error');
xlabel('\Delta V expected (normalised)');
title('C_{ACC} = 2\cdot C_0');
ylim([0 20]);

subplot(2,2,3);
hold on;
scatter(voltage_output_theoretical_normalised_no_0V,error_x5);
plot([-1 1], [mean_percentage_error_x5 mean_percentage_error_x5], 'k--');
ylabel('abs % error');
xlabel('\Delta V expected (normalised)');
title('C_{ACC} = 5\cdot C_0');
ylim([0 20]);

subplot(2,2,4);
hold on;
scatter(voltage_output_theoretical_normalised_no_0V,error_x10);
plot([-1 1], [mean_percentage_error_x10 mean_percentage_error_x10], 'k--');
ylabel('abs % error');
xlabel('\Delta V expected (normalised)');
title('C_{ACC} = 10\cdot C_0');
ylim([0 20]);


% scatter(voltage_output_theoretical_normalised,error_x1);
% scatter(voltage_output_theoretical_normalised,error_x2);
% scatter(voltage_output_theoretical_normalised,error_x5);
% scatter(voltage_output_theoretical_normalised,error_x10);


%legend('C = 1\cdot C_0','C = 2\cdot C_0','C = 5\cdot C_0','C = 10\cdot C_0');





cap_x = [1,2,5,10];
mean_error = [mean_percentage_error_x1, mean_percentage_error_x2,mean_percentage_error_x5,mean_percentage_error_x10]';
max_error = [max_percentage_error_x1, max_percentage_error_x2,max_percentage_error_x5,max_percentage_error_x10]';

figure;
hold on;
scatter(cap_x,max_error);
scatter(cap_x,mean_error);

xlabel('Capacitor size /C_0');
ylabel('abs error /%');
set(gca, 'YScale', 'log');
set(gca, 'XScale', 'log');
xticks([1 2 5 10]);
xlim([0.9 11]);
%ylim([0.8 13]);
ax.YAxis.Exponent = 0;



legend('Max error','Mean error');

% p = polyfit(log(cap_x),log(mean_error),1);
% z = polyval(p,log(cap_x));
% hold on;
% plot(cap_x, exp(z));


