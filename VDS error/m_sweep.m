load('data_m_sweep.mat');


ideal_current = 1e-6;
figure;
hold on;
scatter(m,(nmosirefsweep));
scatter(m,(pmosirefsweep));
plot([1 1.1],[ideal_current ideal_current],'k--');
xlim([1 1.1]);
legend('NMOS','PMOS','1 \mu A');
xlabel('m');
ylabel('I_{OUT}');



figure;
hold on;
NMOS_percentage_error = 100*abs(nmosirefsweep - ideal_current)/ideal_current;
PMOS_percentage_error = 100*abs(pmosirefsweep - ideal_current)/ideal_current;
%mean_error = mean([NMOS_percentage_error;PMOS_percentage_error]);

scatter(m,(NMOS_percentage_error));
scatter(m,(PMOS_percentage_error));
%plot([0 1.8],[mean_error mean_error],'k--');

legend('NMOS','PMOS','mean');
xlabel('m');
ylabel('abs % error');
%ylim([0 25]);