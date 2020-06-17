clear;
full_data(:,1) = (1.01:0.01:2)';
full_data(:,2) = full_data(:,1);
full_data = full_data + cluster(0,0,0.2,0.2,100);

scatter(full_data(:,1),full_data(:,2));
full_data_time = [1./full_data(:,1),1./full_data(:,2)];

X_time = full_data_time(:,1:2);
%csvwrite("X.csv",X_time);