load('data_1083.mat');
voltage(51) = [];
NMOS(51) = [];
PMOS(51) = [];

voltage(1) = [];
NMOS(1) = [];
PMOS(1) = [];

ideal_current = 1e-6;
figure;
hold on;
scatter(voltage,(NMOS));
scatter(voltage,(PMOS));
plot([0 1.8],[ideal_current ideal_current],'k--');
legend('NMOS','PMOS','1 \mu A');
xlabel('V_{OUT}');
ylabel('I_{OUT}');
ax = gca;
ax.YAxis.Exponent = -6;
ylim([0.8e-6 1.2e-6]);


figure;
hold on;
NMOS_percentage_error = 100*abs(NMOS - ideal_current)/ideal_current;
PMOS_percentage_error = 100*abs(PMOS - ideal_current)/ideal_current;
mean_error = mean([NMOS_percentage_error;PMOS_percentage_error]);

scatter(voltage,(NMOS_percentage_error));
scatter(voltage,(PMOS_percentage_error));
plot([0 1.8],[mean_error mean_error],'k--');

legend('NMOS','PMOS','mean');
xlabel('V_{OUT}');
ylabel('abs % error');
ylim([0 25]);