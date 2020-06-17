clear;
load('error_linear_output.mat')
load('error_multiplier.mat');
total_error = error_linear_output + error_multiplier;
hold on;

scatter(cap_x,error_multiplier,'x');
scatter(cap_x,error_linear_output,'x');
scatter(cap_x, total_error,'s','filled');

xlabel('Capacitor size /C_0');
ylabel('Mean error /%');
set(gca, 'YScale', 'log');
set(gca, 'XScale', 'log');
xticks([1 2 5 10])
xlim([0.9 11]);
ylim([1 20]);


legend('% error multiplier inpput','% error linear output','% error total');
