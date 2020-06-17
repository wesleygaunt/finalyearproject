load('data_wilson.mat');
voltage(51) = [];
NMOS_wilson(51) = [];
PMOS_wilson(51) = [];

voltage(1) = [];
NMOS_wilson(1) = [];
PMOS_wilson(1) = [];

ideal_current = 1e-6;
figure;
hold on;
scatter(voltage,(NMOS_wilson));
scatter(voltage,(PMOS_wilson));
plot([0 1.8],[ideal_current ideal_current],'k--');
legend('NMOS','PMOS','1 \mu A');
xlabel('V_{OUT}');
ylabel('I_{OUT}');
ax = gca;
ax.YAxis.Exponent = -6;
ylim([0.8e-6 1.2e-6]);


figure;
hold on;
NMOS_percentage_error = 100*abs(NMOS_wilson - ideal_current)/ideal_current;
PMOS_percentage_error = 100*abs(PMOS_wilson - ideal_current)/ideal_current;
mean_error = mean([NMOS_percentage_error;PMOS_percentage_error]);

scatter(voltage,(NMOS_percentage_error));
scatter(voltage,(PMOS_percentage_error));
plot([0 1.8],[mean_error mean_error],'k--');

legend('NMOS','PMOS','mean');
xlabel('V_{OUT}');
ylabel('abs % error');
ylim([0 25]);