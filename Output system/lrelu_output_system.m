clear;

micro = 1e-6;

voltage_points = -0.9:0.1:0.9;
T_PULSE_x1_theoretical = zeros(size(voltage_points));

for i = 1:1:19
    if(voltage_points(i) < 0)
        T_PULSE_x1_theoretical(i) = 0.1*1*micro*(voltage_points(i));
    else
        T_PULSE_x1_theoretical(i) = 1*micro*(voltage_points(i));
    end

end

t_pulse_x1_experimental = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\lrelu_td_output.csv");

T_PULSE_x1_theoretical = T_PULSE_x1_theoretical';

hold on;

plot(voltage_points, T_PULSE_x1_theoretical);

scatter(voltage_points, t_pulse_x1_experimental);

ylim([-0.2*micro 1*micro])
xlabel('V_{in}');
ylabel('T_{OUT} /S');

ax = gca;
ax.YAxis.Exponent = -6; %need this else it defaults to 10e-7 and looks odd

legend('T expected [C = 1\cdot C_0]','T [C = 1\cdot C_0]');    
%
%normalise them




%error calc

error_x1 = abs((t_pulse_x1_experimental - T_PULSE_x1_theoretical)./T_PULSE_x1_theoretical); %
error_x1(isnan(error_x1))=0;error_x1(isinf(error_x1))=0;
percentage_error_x1 = 100*mean(error_x1);
