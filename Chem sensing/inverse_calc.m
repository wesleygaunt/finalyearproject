clear;
[sig_initial, membrane] = createMembrane(2,2); %create a 2x2 membrane
inv_matrix = inv(membrane{1,3})';
inv_matrix_x100 = inv_matrix * 100;

sig = addIon(1,'K',sig_initial,membrane);
sig = addIon(1,'Na',sig,membrane);
sig = addIon(1,'Ca',sig,membrane);
sig = addIon(1,'H',sig,membrane);



delta_V_array = sig - sig_initial;
delta_V_vector = sigArrayToVector(delta_V_array);

delta_T_vector = delta_V_vector/100;

delta_a = delta_T_vector * inv_matrix * 100;
inv_matrix = inv_matrix * 100;

%csvwrite("w_col_1.csv",inv_matrix(:,1)');
%csvwrite("w_col_2.csv",inv_matrix(:,2)');
%csvwrite("w_col_3.csv",inv_matrix(:,3)');
%csvwrite("w_col_4.csv",inv_matrix(:,4)');


%csvwrite("x_in_chem_array.csv",delta_T_vector);