load('weights_error_proportional_percentage.mat');


bins_number_1 = 1000;
bins_step_1 = 100/bins_number_1;

[values_1_input,binedges_1] = histcounts(weights_error_proportional_percentage,bins_number_1, 'Normalization', 'pdf');

values_1_input = values_1_input';
binedges_1 = (((bins_step_1:bins_step_1:100)) - (bins_step_1/2))';
mean_quantization_error_1_input = mean(values_1_input.*binedges_1);

figure;
hold on;
%bar(binedges_1 - (bins_step_1/2),values_1_input, 1);
plot(binedges_1,values_1_input,'LineWidth',1);
xlim([0 105]);
xlabel('abs % error');
ylabel('Probability');
title('Probabilty density of quantization absolute % error');

values_2_input = conv(values_1_input,values_1_input);
binedges_2 = ((2*bins_step_1:bins_step_1:200) - (bins_step_1/2))';
mean_quantization_error_2_inputs =100* mean(values_2_input.*binedges_2);

%values_3_input = conv(values_2_input,values_1_input);
%binedges_3 = (3:1:300)';
%mean_quantization_error_3_inputs = 100*sum(values_3_input.*binedges_3)/300;




figure;
hold on;
%bar(binedges_2 - (bins_step_1/2), values_2_input, 1);
plot(binedges_2,values_2_input,'LineWidth',1);
xlim([0 205]);
xlabel('abs % error');
ylabel('Probability');
title('Probabilty density of quantization absolute % error for 2 inputs');