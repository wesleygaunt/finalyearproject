clear;
x_2_input = [-1,-1] + 2.*rand(100,2);
w_2_input = [-1,-1] + 2.*rand(100,2);

%save these 


w_quantized_2_input = roundPartial(w_2_input, 1/15);

% csvwrite("x_2_input_random.csv", w_quantized_2_input);
% csvwrite("w_2_input_random.csv", x_2_input);