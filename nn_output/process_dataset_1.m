dataline = (1:1:4)';

y_actual = importfile_y_python("y_actual_dataset_1.csv");
y_python = importfile_y_python("y_python_dataset_1.csv");
y_python_clipped = importfile_y_python("y_python_clipped_dataset_1.csv");
td_output_analogue_nn = extract_td_data("C:\Users\Test\OneDrive - Imperial College London\FYP\nn_output\td_output_dataset_1.csv");
output_analogue= td_output_analogue_nn/(1e-6);

loss_python = loss_mean_squared(y_actual, y_python);
loss_python_clipped = loss_mean_squared(y_actual, y_python_clipped);
loss_analogue = loss_mean_squared(y_actual, output_analogue);

hold on;
%scatter(dataline, y_actual(:,1));
%scatter(dataline, y_python(:,1));
scatter(dataline, y_python_clipped(:,1));
scatter(dataline, output_analogue(:,1));





