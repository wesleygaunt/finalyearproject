figure;
c = 0.3;
input_points = -10:0.01:10;
output_points_1 = sigmoid(1*input_points);

hold on;
plot(input_points, output_points_1);

