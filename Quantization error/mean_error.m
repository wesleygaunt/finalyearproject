n = [2 4 8 16];
indices = 1:1:size(n,2);

% for i = indices
%     mean_error_percentages(i) = quantization_error_weights(n(i));
% end




mean_error_percentages_expected = 100 ./((2.^n)-1);




figure;
hold on;
scatter(n, mean_error_percentages);

plot(n, mean_error_percentages_expected);
xticks(n);
xlim([1 17]);

%ylim([0.01 10]);
set(gca, 'YScale', 'log');
%set(gca, 'XScale', 'log');
xlabel('number of bits');
ylabel('Mean abs % error');

