clear;
step = 0.1;
start = 0;
finish = 1.8;
micro = 1e-6;
voltage_points = start:step:finish;

bin_step_td = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\Output system\binary_step_td_output.csv");


hold on;
scatter(voltage_points, bin_step_td);


T_PUlSE = voltage_points;

for i = 1:1:19
    if (voltage_points(i) >= 0.9)
        T_PULSE(i) = micro;
        
    else
        T_PULSE(i) = -1*micro;
           
    end
end

T_0 = 1*micro; %scaling factor, 1uS?
V_0 = 0.9;  %voltage offset
compress = 100;
    %capacitor in 
T_PULSE = T_PULSE';
plot(voltage_points, T_PULSE);


ylim([-1.1*micro 1.1*micro])
xlabel('V_{CAP} V');
ylabel('T_{OUT} S');

legend('Binary step FSM output', 'Binary step theoretical');



    