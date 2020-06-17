
micro = 0.000001; %mu = 1e-6
pico = micro*micro;

T_0 = 1*micro; %scaling factor, 1uS?
V_0 = 0.9;  %voltage offset
compress = 3;

C = 10*pico;        %capacitor in 

V_in = 0:0.01:1.8;      %range of v_in required
T_PULSE = T_0*tanh((V_in-V_0)*compress);

dT_PULSE = diff(T_PULSE);
dV_in = diff(V_in);
numerical_approx_derivative = dT_PULSE./dV_in;

dT_PULSEdV_in = T_0*compress*(1 - (tanh((V_in-V_0)*compress).^2));


subplot(4,1,1);
line(V_in,T_PULSE);
xlabel('V_{CAP} V');
ylabel('\tau_{OUT} s');

subplot(4,1,2);
line(V_in, dT_PULSEdV_in);
line(V_in(1:180), numerical_approx_derivative,'Color', 'red');
xlabel('V_{CAP} V');
ylabel('anti-slew rate sV^{-1}');

slew_rate = 1./dT_PULSEdV_in;
subplot(4,1,3);
line(V_in, slew_rate);
xlabel('V_{CAP} V');
ylabel('slew rate Vs^{-1}');
	
current = C .* slew_rate;
subplot(4,1,4);
line(V_in, current);
xlabel('V_{CAP} V');
ylabel('I_{CAP} A');

% figure;
% line(V_in,T_PULSE);
% xlabel('V_{CAP} V');
% ylabel('\tau_{OUT} s');

