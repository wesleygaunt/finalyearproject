load('error_vals.mat');

figure;
hold on;
scatter(cap_x,max_error);
scatter(cap_x,max_error_1083);
scatter(cap_x,mean_error);
scatter(cap_x,mean_error_1083);

xlabel('Capacitor size /C_0');
ylabel('abs error /%');
set(gca, 'YScale', 'log');
set(gca, 'XScale', 'log');
xticks([1 2 5 10]);
xlim([0.9 11]);
%ylim([0.5 13]);
ax.YAxis.Exponent = 0;




linearity_error_polyfit = polyfit(log(cap_x),log(mean_error_1083'),1);
linearity_error_polyval = polyval(linearity_error_polyfit,log(cap_x));
hold on;
plot(cap_x, exp(linearity_error_polyval),'k--');

legend('Max error p = 1','Max error p = 1.083','Mean error p = 1','Mean error p = 1.083');
