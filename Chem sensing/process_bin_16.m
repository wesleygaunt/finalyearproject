vmm_x1 = import_and_process('vmm_x1_bin_16.csv');
vmm_x2 = import_and_process('vmm_x2_bin_16.csv');
vmm_x5 = import_and_process('vmm_x5_bin_16.csv');
vmm_x10 = import_and_process('vmm_x10_bin_16.csv');


load('y_bin_16.mat');
load('X_bin_16.mat');

indices = 1:1:16;

[sig_initial, membrane] = createMembrane(2,2); %create a 2x2 membrane
inv_matrix = inv(membrane{1,3})';
inv_matrix_x100 = inv_matrix * 100;
inv_matrix_x100_rounded = roundPartial(inv_matrix_x100,0.0625);
y_expected_rounded = X * inv_matrix_x100_rounded;



euclid_distance_x1 = distance(y,vmm_x1);
euclid_distance_x2 = distance(y,vmm_x2);
euclid_distance_x5 = distance(y,vmm_x5);
euclid_distance_x10 = distance(y,vmm_x10);

euclid_distance_expected = euclidean_distance(y,y_expected_rounded);

hold on;

plot(indices, euclid_distance_x1);
plot(indices, euclid_distance_x2);
plot(indices, euclid_distance_x5);
plot(indices, euclid_distance_x10);
plot(indices, euclid_distance_expected);

mean_distance_x1 = mean(euclid_distance_x1);
mean_distance_x2 = mean(euclid_distance_x2);
mean_distance_x5 = mean(euclid_distance_x5);
mean_distance_x10 = mean(euclid_distance_x10);
mean_distance_expected = mean(euclid_distance_expected);

xlabel("Expected output vector - binary");
ylabel("Euclidean distance of output from expected");
legend('x1','x2','x5','x10','expected');

figure;
scatter([1 2 5 10],[mean_distance_x1 mean_distance_x2 mean_distance_x5 mean_distance_x10]);
set(gca, 'YScale', 'log');
set(gca, 'XScale', 'log');
xticks([1 2 5 10])


