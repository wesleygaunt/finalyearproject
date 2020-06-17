load('rand_x_and_w_2_input.mat');
load('data_total_error_2_input.mat');


IREF = 1e-6;
T0 = 1e-6;
cap_x20 = 20 * 1e-12;

indices = 1:1:1000;

y = sum(x_2_input .* w_2_input, 2);  %MAC
y_quantized = sum(x_2_input .* w_quantized_2_input, 2);  %MAC


% quantization_error = (100*abs((w - w_quantized)./w_quantized));
% quantization_error(isinf(quantization_error))=[];
% quantization_error(isnan(quantization_error))=[];
% mean_quantization_error = mean(quantization_error,'all');

%x_time = x * T0;

V_CHANGE_EXPECTED = (1/cap_x20) * IREF * T0 * y;

V_CHANGE_MAX = (1/(cap_x20)) * 2 * IREF * T0;

V_CHANGE_QUANTIZED = (1/cap_x20) * IREF * T0 * y_quantized;

figure;
hold on;

plot([-0.1 0.1],[-0.1 0.1]);
scatter(V_CHANGE_EXPECTED,V_CHANGE_EXPERIMENTAL_2_INPUT_x10);
legend('Expected','C = 20\cdot C_0');
xlabel('\Delta V expected');
ylabel('\Delta V)');



PERCENTAGE_ERROR_X10 = 100*(V_CHANGE_EXPERIMENTAL_2_INPUT_x10 - (V_CHANGE_EXPECTED))./(V_CHANGE_EXPECTED); %
PERCENTAGE_ERROR_X10(isnan(PERCENTAGE_ERROR_X10))=[];
PERCENTAGE_ERROR_X10(isinf(PERCENTAGE_ERROR_X10))=[];

mean_quantization_error = 9.6;

figure;
hold on;
scatter((V_CHANGE_EXPECTED), abs(PERCENTAGE_ERROR_X10));
plot([-1*V_CHANGE_MAX V_CHANGE_MAX], [mean_quantization_error mean_quantization_error], 'k--');
ylabel('abs % error');
xlabel('\Delta V expected');
title('2-input MAC error');
ylim([0 100]);

%percentage_x10 = sum(abs(PERCENTAGE_ERROR_X10) < 3.33);
max_error_x10 = max(abs(PERCENTAGE_ERROR_X10));
mean_error_x10 = mean(abs(PERCENTAGE_ERROR_X10));

