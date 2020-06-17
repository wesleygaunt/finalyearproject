clear;
[sig_initial, membrane] = createMembrane(2,2); %create a 2x2 membrane
inv_matrix = inv(membrane{1,3})';
inv_matrix_x100 = inv_matrix * 100;
inv_matrix_x100_rounded = roundPartial(inv_matrix_x100,0.0625);


full_data = cell(16,2);
X = zeros(16,4);

   %[K Na Ca H]
load('y_rand.mat')

for i =1:1:size(y,1)   %loop through all a
    full_data{i,1} = sig_initial;
    full_data{i,2} = y(i,:);

    full_data{i,1} = addIon(y(i,1),'K',full_data{i,1},membrane);
    full_data{i,1} = addIon(y(i,2),'Na',full_data{i,1},membrane);
    full_data{i,1} = addIon(y(i,3),'Ca',full_data{i,1},membrane);
    full_data{i,1} = addIon(y(i,4),'H',full_data{i,1},membrane);
    
    delta_V_array = full_data{i,1} - sig_initial;
    delta_V_vector = sigArrayToVector(delta_V_array);

    delta_T_vector = delta_V_vector/100;
    X(i,:) = delta_T_vector;
end



col_1 = inv_matrix_x100_rounded(:,1);
col_2 = inv_matrix_x100_rounded(:,2);
col_3 = inv_matrix_x100_rounded(:,3);
col_4 = inv_matrix_x100_rounded(:,4);

csvwrite("w_col_1.csv",col_1');
csvwrite("w_col_2.csv",col_2');
csvwrite("w_col_3.csv",col_3');
csvwrite("w_col_4.csv",col_4');
csvwrite("x_in_chem_array.csv",X);
