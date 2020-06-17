figure;
c = 0.3;
input_points = -10:0.01:10;
output_points_1 = tanh(c*input_points);

hold on;
plot(input_points, output_points_1);


legend('c=1','c=2','c=5');