results_raw = import_time_domain_data("H:\FYP\NN Models\Test 1\results_test1_time_domain.csv", [2, Inf]);

results_raw(1,:) = []; %remove first row

y_time_domain_x1 = results_raw;
rows = size(results_raw,1);


%there are 3 rows 
for i = 1:2:(rows*2/3)
    y_time_domain_x1(i,:) = [];
end
rows = size(y_time_domain_x1,1); %new size

% if a value appears in the first row, of an index, it is postive, else it
% is negative, ie all even rows contain -ve times...
for i = 2:2:(rows)
    y_time_domain_x1(i,2) = -y_time_domain_x1(i,2);
end

y_time_domain_x1 = y_time_domain_x1(~any(isnan(y_time_domain_x1), 2), :);

y_time_domain_x1(:,1) = [];

load('linear_model_fixedpoint_4bit_3radix.mat');
load('jockeys_and_basketball_fixedpoint_4bit_3radix_normalised.mat');

y_model = X*w' + b; % ground truth, actual matrix multiplication
y_model = y_model';       %transpose
scatter(y_model, y_time_domain_x1, 'r');
xlabel("y = X*w + b");
ylabel("Output Pulse length /us");

   