weights = (-1:0.00000001:1)';
n = 4;
weights_rounded = roundPartial(weights, 1/(2^n -1));

figure;
hold on;
plot(weights,weights);
plot(weights, weights_rounded(:,1));
xlabel('Ideal weight');
ylabel('Weight');
legend('Ideal','Quantized');


figure;
hold on;
%weights_error = abs(weights - weights_rounded)/1;
weights_error = abs(weights - weights_rounded);
weights_error_percentage = 100*weights_error;
max_error_percentage = max(weights_error_percentage);

plot(weights, (weights_error_percentage));
plot([-1 1], [max_error_percentage max_error_percentage], 'k--');
%plot([-1 1], [-3.3333 -0.033333], 'k--');
ylim([-0.1 5]);

legend('Error','3.33%');%,'Experimental');
xlabel('Weight');
ylabel('abs % error');

figure;
hold on;
weights_error_proportional_percentage = 100*(weights_error)./abs(weights);
weights_error_proportional_percentage(isnan(weights_error_proportional_percentage))=100;

plot(weights,weights_error_proportional_percentage);

mean_percentage_error = mean(weights_error_proportional_percentage);
ratio = mean_percentage_error/max_error_percentage;

plot([-1 1], [3.3333 3.3333], '--');
plot([-1 1], [mean_percentage_error mean_percentage_error], '--');
ylim([-5 105]);

legend('error','3.33%','mean error');
xlabel('Weight');
ylabel('abs % error');

figure;
hold on;

%rowsToDelete =  abs(weights_error_proportional_percentage) >= 50;
%weights_error_proportional_percentage(rowsToDelete) = [];

hist = histogram(weights_error_proportional_percentage,100,'Normalization','probability');
xlabel('% error');
ylabel('Probability');


binedges_1 = hist.BinEdges';
binedges_1(1) = [];
values_1_input = hist.Values';

mean_quantization_error_1_input = 100*sum(values_1_input.*binedges_1)/100;
pdf = [binedges_1 values_1_input];
figure;


bar(binedges_1 - 0.5,values_1_input);
xlabel('abs % error');
ylabel('Probability');
title('Probabilty density of quantization absolute % error');

values_2_input = conv(values_1_input,values_1_input);
binedges_2 = (2:1:200)';
mean_quantization_error_2_inputs = 100*sum(values_2_input.*binedges_2)/200;

values_3_input = conv(values_2_input,values_1_input);
binedges_3 = (3:1:300)';
mean_quantization_error_3_inputs = 100*sum(values_3_input.*binedges_3)/300;




%figure;
hold on;
bar(binedges_2 - 0.5, values_2_input);
xlabel('abs % error');
ylabel('Probability');
title('Probabilty density of quantization absolute % error for 2 inputs');