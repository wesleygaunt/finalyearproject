load('data.mat');
load('data_wilson.mat');

voltage(51) = [];
NMOS(51) = [];
PMOS(51) = [];
NMOS_wilson(51) = [];
PMOS_wilson(51) = [];

voltage(1) = [];
NMOS(1) = [];
PMOS(1) = [];
NMOS_wilson(1) = [];
PMOS_wilson(1) = [];

ideal_current = 1e-6;
figure;
hold on;
scatter(voltage,(NMOS));
scatter(voltage,(PMOS));

scatter(voltage,(NMOS_wilson));
scatter(voltage,(PMOS_wilson));
plot([0 1.8],[ideal_current ideal_current],'k--');
legend('NMOS','PMOS','NMOS wilson','PMOS wilson','1 \mu A');
xlabel('V_{OUT}');
ylabel('I_{OUT}');
ax = gca;
ax.YAxis.Exponent = -6;
ylim([0.8e-6 1.2e-6]);




NMOS_percentage_error = mean_error(NMOS, ideal_current);
PMOS_percentage_error = mean_error(PMOS, ideal_current);
mean_error_basic = mean([NMOS_percentage_error;PMOS_percentage_error]);

NMOS_percentage_error_wilson = mean_error(NMOS_wilson, ideal_current);
PMOS_percentage_error_wilson = mean_error(PMOS_wilson, ideal_current);
mean_error_wilson = mean([NMOS_percentage_error_wilson;PMOS_percentage_error_wilson]);


figure;
hold on;
scatter(voltage,(NMOS_percentage_error));
scatter(voltage,(PMOS_percentage_error));
%plot([0 1.8],[mean_error_basic mean_error_basic]);

scatter(voltage,(NMOS_percentage_error_wilson));
scatter(voltage,(PMOS_percentage_error_wilson));
%plot([0 1.8],[mean_error_wilson mean_error_wilson]);


legend('NMOS','PMOS','mean','NMOS wilson','PMOS wilson','mean wilson');
xlabel('V_{OUT}');
ylabel('abs % error');
ylim([0 25]);

function mean_error_calc = mean_error(current,ideal_current)
mean_error_calc = 100*abs(current - ideal_current)/ideal_current;
end