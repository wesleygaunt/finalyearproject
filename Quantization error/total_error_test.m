load('rand_x_and_w.mat');
load('data_total_error_1083.mat');
load('data_total_error_wilson.mat');

load('linearity_error_polyval.mat');

IREF = 1e-6;
T0 = 1e-6;
cap_x1 = 1 * 1e-12;

indices = 1:1:100;

w_quantized = roundPartial(w, 1/15);


quantization_error = (100*abs((w - w_quantized)./w_quantized));
quantization_error(isinf(quantization_error))=[];

mean_quantization_error = mean(quantization_error,'all');


%csvwrite("w_random.csv", w_quantized);
%csvwrite("x_random.csv", x);

results = x .* w;
results_quantized = x .* w_quantized;

x_time = x * T0;

currents = w * IREF;
V_CHANGE_EXPECTED_x1 = (1/cap_x1) * currents .* x_time;

V_CHANGE_MAX_X1 = (1/(1*cap_x1)) * IREF * T0;
V_CHANGE_MAX_X2 = (1/(2*cap_x1)) * IREF * T0;
V_CHANGE_MAX_X3 = (1/(3*cap_x1)) * IREF * T0;       %wilson

V_CHANGE_MAX_X5 = (1/(5*cap_x1)) * IREF * T0;
V_CHANGE_MAX_X10 = (1/(10*cap_x1)) * IREF * T0;


currents_quantized = w_quantized * IREF;
V_CHANGE_quantized = (1/cap_x1) * currents_quantized .* x_time;



figure;
hold on;
%plot(V_CHANGE_EXPECTED_x1,V_CHANGE_EXPECTED_x1);
plot([-1 1],[-1 1])
%scatter(results,V_CHANGE_quantized);
scatter(V_CHANGE_EXPECTED_x1,V_CHANGE_EXPERIMENTAL_x1);
scatter(V_CHANGE_EXPECTED_x1,V_CHANGE_EXPERIMENTAL_x3*3,'x');

scatter(V_CHANGE_EXPECTED_x1,V_CHANGE_EXPERIMENTAL_x2*2);
scatter(V_CHANGE_EXPECTED_x1,V_CHANGE_EXPERIMENTAL_x5*5);
scatter(V_CHANGE_EXPECTED_x1,V_CHANGE_EXPERIMENTAL_x10*10);
% xlim([-0.1 0.1]);
% ylim([-0.1 0.1]);
legend('Expected','C = 1\cdot C_0','C = 2\cdot C_0','C = 5\cdot C_0','C = 10\cdot C_0');
xlabel('\Delta V expected (normalised)');
ylabel('\Delta V (normalised)');


%V_CHANGE_ERROR_EXPECTED = (V_CHANGE_EXPECTED - V_CHANGE_quantized)/0.1;
%V_CHANGE_ERROR_x10 = (V_CHANGE_EXPECTED - V_CHANGE_EXPERIMENTAL_x10)/V_CHANGE_MAX;

PERCENTAGE_ERROR_X1 = 100*(V_CHANGE_EXPERIMENTAL_x1 - (V_CHANGE_EXPECTED_x1/1))./(V_CHANGE_EXPECTED_x1/1); %
PERCENTAGE_ERROR_X1(isnan(PERCENTAGE_ERROR_X1))=0;
PERCENTAGE_ERROR_X1(isinf(PERCENTAGE_ERROR_X1))=0;

PERCENTAGE_ERROR_X2 = 100*(V_CHANGE_EXPERIMENTAL_x2 - (V_CHANGE_EXPECTED_x1/2))./(V_CHANGE_EXPECTED_x1/2); %
PERCENTAGE_ERROR_X2(isnan(PERCENTAGE_ERROR_X2))=0;
PERCENTAGE_ERROR_X2(isinf(PERCENTAGE_ERROR_X2))=0;

PERCENTAGE_ERROR_X3 = 100*(V_CHANGE_EXPERIMENTAL_x3 - (V_CHANGE_EXPECTED_x1/3))./(V_CHANGE_EXPECTED_x1/3); %
PERCENTAGE_ERROR_X3(isnan(PERCENTAGE_ERROR_X3))=0;
PERCENTAGE_ERROR_X3(isinf(PERCENTAGE_ERROR_X3))=0;

PERCENTAGE_ERROR_X5 = 100*(V_CHANGE_EXPERIMENTAL_x5 - (V_CHANGE_EXPECTED_x1/5))./(V_CHANGE_EXPECTED_x1/5); %
PERCENTAGE_ERROR_X5(isnan(PERCENTAGE_ERROR_X5))=0;
PERCENTAGE_ERROR_X5(isinf(PERCENTAGE_ERROR_X5))=0;

PERCENTAGE_ERROR_X10 = 100*(V_CHANGE_EXPERIMENTAL_x10 - (V_CHANGE_EXPECTED_x1/10))./(V_CHANGE_EXPECTED_x1/10); %
PERCENTAGE_ERROR_X10(isnan(PERCENTAGE_ERROR_X10))=0;
PERCENTAGE_ERROR_X10(isinf(PERCENTAGE_ERROR_X10))=0;

%V_CHANGE_ERROR_x5 = (V_CHANGE_x5 - V_CHANGE_EXPERIMENTAL_x5)/0.2;

figure;
hold on;

scatter((V_CHANGE_EXPECTED_x1), abs(PERCENTAGE_ERROR_X3));
plot([-1 1], [mean_quantization_error mean_quantization_error], 'k--');
ylabel('abs % error');
xlabel('\Delta V expected (normalised)');
title('C_{ACC} = 3\cdot C_0 wilson');


figure;
mean_quantization_error = 9.1;

subplot(2,2,1);
hold on;

scatter((V_CHANGE_EXPECTED_x1), abs(PERCENTAGE_ERROR_X1));
plot([-1 1], [mean_quantization_error mean_quantization_error], 'k--');
ylabel('abs % error');
xlabel('\Delta V expected (normalised)');
title('C_{ACC} = 1\cdot C_0');

subplot(2,2,2);
hold on;
scatter((V_CHANGE_EXPECTED_x1), abs(PERCENTAGE_ERROR_X2));
plot([-1 1], [mean_quantization_error mean_quantization_error], 'k--');
ylabel('abs % error');
xlabel('\Delta V expected (normalised)');
title('C_{ACC} = 2\cdot C_0');

subplot(2,2,3);
hold on;
scatter((V_CHANGE_EXPECTED_x1), abs(PERCENTAGE_ERROR_X5));
plot([-1 1], [mean_quantization_error mean_quantization_error], 'k--');
ylabel('abs % error');
xlabel('\Delta V expected (normalised)');
title('C_{ACC} = 5\cdot C_0');

subplot(2,2,4);
hold on;
scatter((V_CHANGE_EXPECTED_x1), abs(PERCENTAGE_ERROR_X10));
plot([-1 1], [mean_quantization_error mean_quantization_error], 'k--');
ylabel('abs % error');
xlabel('\Delta V expected (normalised)');
title('C_{ACC} = 10\cdot C_0');

%legend('\pm 3.33%','% error [C_{ACC} = 1\cdot C_0]','% error [C_{ACC} = 10\cdot C_0]');%,'Experiemental');
%legend('\pm 3.33%','% error [C_{ACC} = 1\cdot C_0]','% error [C_{ACC} = 2\cdot C_0]','% error [C_{ACC} = 5\cdot C_0]','% error [C_{ACC} = 10\cdot C_0]');%,'Experiemental');

%scatter(indices, V_CHANGE_ERROR_x5);
%legend('x10','x5');

percentage_x1 = sum(abs(PERCENTAGE_ERROR_X1) < 3.33);
percentage_x2 = sum(abs(PERCENTAGE_ERROR_X2) < 3.33);
percentage_x5 = sum(abs(PERCENTAGE_ERROR_X5) < 3.33);
percentage_x10 = sum(abs(PERCENTAGE_ERROR_X10) < 3.33);

max_error_x1 = max(abs(PERCENTAGE_ERROR_X1));
max_error_x2 = max(abs(PERCENTAGE_ERROR_X2));
max_error_x5 = max(abs(PERCENTAGE_ERROR_X5));
max_error_x10 = max(abs(PERCENTAGE_ERROR_X10));

mean_error_x1 = mean(abs(PERCENTAGE_ERROR_X1));
mean_error_x2 = mean(abs(PERCENTAGE_ERROR_X2));
mean_error_x3 = mean(abs(PERCENTAGE_ERROR_X3));

mean_error_x5 = mean(abs(PERCENTAGE_ERROR_X5));
mean_error_x10 = mean(abs(PERCENTAGE_ERROR_X10));


figure;
hold on
cap_x = [1,2,5,10];

max_error = [max_error_x1, max_error_x2,max_error_x5,max_error_x10]';
mean_error = [mean_error_x1, mean_error_x2,mean_error_x5,mean_error_x10]';


%scatter(cap_x,max_error);
scatter(cap_x,mean_error);
plot([0.9 11], [mean_quantization_error mean_quantization_error]);
plot(cap_x, exp(linearity_error_polyval));
plot(cap_x, exp(linearity_error_polyval) + mean_quantization_error);

xlabel('Capacitor size /C_0');
ylabel('abs error /%');
%set(gca, 'YScale', 'log');
set(gca, 'XScale', 'log');

xticks([1 2 5 10]);
xlim([0.9 11]);
ylim([0 20]);

legend('Mean error','Mean quantization error','Mean linearity error','Mean quantization error + mean linearity error');



