vmm_x1 = import_and_process('vmm_x1_rand_1083.csv');
vmm_x2 = import_and_process('vmm_x2_rand_1083.csv');
vmm_x5 = import_and_process('vmm_x5_rand_1083.csv');
vmm_x10 = import_and_process('vmm_x10_rand_1083.csv');

vmm_x4 = import_and_process('vmm_x4_rand_1083.csv');
vmm_x8 = import_and_process('vmm_x8_rand_1083.csv');
vmm_x20 = import_and_process('vmm_x20_rand_1083.csv');
vmm_x40 = import_and_process('vmm_x40_rand_1083.csv');


load('y_rand.mat');
load('X_rand.mat');
load('linearity_error_polyval.mat');


indices = 1:1:100;

[sig_initial, membrane] = createMembrane(2,2); %create a 2x2 membrane
inv_matrix = inv(membrane{1,3})';
inv_matrix_x100 = inv_matrix * 100;
inv_matrix_x100_quantized = roundPartial(inv_matrix_x100,0.0625);

mean_quantization_error = mean(100*abs((inv_matrix_x100 - inv_matrix_x100_quantized)./inv_matrix_x100),'all');


y_expected_rounded = X * inv_matrix_x100_quantized;

euclid_distance_x1 = euclidean_distance(y,vmm_x1);
euclid_distance_x2 = euclidean_distance(y,vmm_x2);
euclid_distance_x5 = euclidean_distance(y,vmm_x5);
euclid_distance_x10 = euclidean_distance(y,vmm_x10);

euclid_distance_x4 = euclidean_distance(y,vmm_x4);
euclid_distance_x8 = euclidean_distance(y,vmm_x8);
euclid_distance_x20 = euclidean_distance(y,vmm_x20);
euclid_distance_x40 = euclidean_distance(y,vmm_x40);

euclid_distance_expected = euclidean_distance(y,y_expected_rounded);

size = euclidean_distance(y,0);

euclid_distance_x1_error = 100*euclid_distance_x1./size;
euclid_distance_x2_error = 100*euclid_distance_x2./size;
euclid_distance_x5_error = 100*euclid_distance_x5./size;
euclid_distance_x10_error = 100*euclid_distance_x10./size;

euclid_distance_x4_error = 100*euclid_distance_x4./size;
euclid_distance_x8_error = 100*euclid_distance_x8./size;
euclid_distance_x20_error = 100*euclid_distance_x20./size;
euclid_distance_x40_error = 100*euclid_distance_x40./size;

euclid_distance_expected_error = 100*euclid_distance_expected./size;

mean_error_x1 = mean(euclid_distance_x1_error);
mean_error_x2 = mean(euclid_distance_x2_error);
mean_error_x5 = mean(euclid_distance_x5_error);
mean_error_x10 = mean(euclid_distance_x10_error);

mean_error_x4 = mean(euclid_distance_x4_error);
mean_error_x8 = mean(euclid_distance_x8_error);
mean_error_x20 = mean(euclid_distance_x20_error);
mean_error_x40 = mean(euclid_distance_x40_error);

mean_error_expected = mean(euclid_distance_expected_error);



figure;
hold on;
plot(indices, euclid_distance_x1_error);
plot(indices, euclid_distance_x2_error);
plot(indices, euclid_distance_x5_error);
plot(indices, euclid_distance_x10_error);
%plot(indices, euclid_distance_x40);
plot(indices, euclid_distance_expected_error);


xlabel("Expected output vector - binary");
ylabel("abs % error of output from expected");
legend('x1','x2','x5','x10','expected');


%mean_quantization_error = 9.1;
figure;
hold on;
cap_x = [4 8 20 40];
%scatter([1 2 5 10 4 8 20 40],[mean_error_x1 mean_error_x2 mean_error_x5 mean_error_x10 mean_error_x4 mean_error_x8 mean_error_x20 mean_error_x40]);
scatter(cap_x,[mean_error_x4 mean_error_x8 mean_error_x20 mean_error_x40]);
plot([1 50],[mean_quantization_error mean_quantization_error]);
linearity_error = exp(linearity_error_polyval);

%plot(cap_x, linearity_error);
%plot(cap_x, linearity_error + mean_quantization_error);
%set(gca, 'XScale', 'log');
%set(gca, 'YScale', 'log');
legend('Mean error', 'Mean quantization error');
xlabel("Capacitor size /pF");
ylabel("abs % error");
xticks(cap_x);
ylim([8 11]);
xlim([3 41]);


