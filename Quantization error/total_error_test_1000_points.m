load('rand_x_and_w_1000.mat');
load('data_total_error_1000_points.mat');

%load('linearity_error_polyval.mat');

IREF = 1e-6;
T0 = 1e-6;
cap_x10 = 10 * 1e-12;

indices = 1:1:1000;




quantization_error = (100*abs((w - w_quantized)./w_quantized));
quantization_error(isinf(quantization_error))=[];
quantization_error(isnan(quantization_error))=[];
mean_quantization_error = mean(quantization_error,'all');

x_time = x * T0;

currents = w * IREF;

V_CHANGE_EXPECTED_x10 = (1/cap_x10) * currents .* x_time;
V_CHANGE_MAX_X10 = (1/(cap_x10)) * IREF * T0;


currents_quantized = w_quantized * IREF;
%V_CHANGE_quantized = (1/cap_x1) * currents_quantized .* x_time;



figure;
hold on;

plot([-0.1 0.1],[-0.1 0.1]);

scatter(V_CHANGE_EXPECTED_x10,x10_1000);
legend('Expected','C = 1\cdot C_0','C = 2\cdot C_0','C = 5\cdot C_0','C = 10\cdot C_0');
xlabel('\Delta V expected');
ylabel('\Delta V)');



PERCENTAGE_ERROR_X10 = 100*(x10_1000 - (V_CHANGE_EXPECTED_x10))./(V_CHANGE_EXPECTED_x10); %
PERCENTAGE_ERROR_X10(isnan(PERCENTAGE_ERROR_X10))=[];
PERCENTAGE_ERROR_X10(isinf(PERCENTAGE_ERROR_X10))=[];

%mean_quantization_error = 9.1;

figure;
hold on;
scatter((V_CHANGE_EXPECTED_x10), abs(PERCENTAGE_ERROR_X10));
plot([-1*V_CHANGE_MAX_X10 V_CHANGE_MAX_X10], [mean_quantization_error mean_quantization_error], 'k--');
ylabel('abs % error');
xlabel('\Delta V expected');
title('C_{ACC} = 10\cdot C_0');


percentage_x10 = sum(abs(PERCENTAGE_ERROR_X10) < 3.33);
max_error_x10 = max(abs(PERCENTAGE_ERROR_X10));
mean_error_x10 = mean(abs(PERCENTAGE_ERROR_X10));


% figure;
% hold on
% cap_x = [1,2,5,10];
% 
% max_error = [max_error_x1, max_error_x2,max_error_x5,max_error_x10]';
% mean_error = [mean_error_x1, mean_error_x2,mean_error_x5,mean_error_x10]';
% 
% 
% %scatter(cap_x,max_error);
% scatter(cap_x,mean_error);
% plot([0.9 11], [mean_quantization_error mean_quantization_error]);
% plot(cap_x, exp(linearity_error_polyval));
% plot(cap_x, exp(linearity_error_polyval) + mean_quantization_error);
% 
% xlabel('Capacitor size /C_0');
% ylabel('abs error /%');
% %set(gca, 'YScale', 'log');
% set(gca, 'XScale', 'log');
% 
% xticks([1 2 5 10]);
% xlim([0.9 11]);
% ylim([0 20]);
% 
% legend('Mean error','Mean quantization error','Mean linearity error','Mean quantization error + mean linearity error');
% 
% 

