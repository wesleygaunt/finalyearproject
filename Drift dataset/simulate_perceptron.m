clear;

X_time = import_X('X.csv', 1, 100);
full_data_time = X_time;
full_data = [1./X_time(:,1),1./X_time(:,2)];



ones_ = ones(100,1);
figure;


%data in format: target f, actual f
%seperate into classes
%class 1, good: actual is between target/1.1 and x*1.1
%class 2, high: frequency between target*1.1 and target*1.3
%class 3, very high: frequency above target*1.3
%class 4, low: frequency between target/1.1 and target/1.3
%class 5, very low: frequency below target/1.3

%the output vectors that represent the output classes
class_1_output_vector = [1 -1 -1 -1 -1];
class_2_output_vector = [-1 1 -1 -1 -1];
class_3_output_vector = [-1 -1 1 -1 -1];
class_4_output_vector = [-1 -1 -1 1 -1];
class_5_output_vector = [-1 -1 -1 -1 1];


for i = 1:1:size(full_data,1)
    if(full_data(i,2)  >= full_data(i,1)/1.1) && (full_data(i,2)  < full_data(i,1)*1.1)
        class_1(i,1:2) = full_data(i,1:2);
        full_data(i,3:7) = class_1_output_vector;
    elseif(full_data(i,2)  >= full_data(i,1)*1.1) && (full_data(i,2)  < full_data(i,1)*1.3)
        class_2(i,1:2) = full_data(i,1:2);
        full_data(i,3:7) = class_2_output_vector;
    elseif (full_data(i,2)  >= full_data(i,1)*1.3) 
        class_3(i,1:2) = full_data(i,1:2);
        full_data(i,3:7) = class_3_output_vector;
    elseif (full_data(i,2)  >= full_data(i,1)/1.3) && (full_data(i,2)  < full_data(i,1)/1.1)
         class_4(i,1:2) = full_data(i,1:2);
         full_data(i,3:7) = class_4_output_vector;
    else
         class_5(i,1:2) = full_data(i,1:2);
         full_data(i,3:7) = class_5_output_vector;
    end
end

indices = find(class_1(:,2)==0);
class_1(indices,:) = [];

indices = find(class_2(:,2)==0);
class_2(indices,:) = [];

indices = find(class_3(:,2)==0);
class_3(indices,:) = [];

indices = find(class_4(:,2)==0);
class_4(indices,:) = [];

indices = find(class_5(:,2)==0);
class_5(indices,:) = [];

hold on;

%scatter(data(:,1), data(:,2));
scatter(class_1(:,1), class_1(:,2),'x');
scatter(class_2(:,1), class_2(:,2),'x');
scatter(class_3(:,1), class_3(:,2),'x');
scatter(class_4(:,1), class_4(:,2),'x');
scatter(class_5(:,1), class_5(:,2),'x');

%plot([0 1],[0 1.1]); %x1 = 1.1*x0
%plot([0 1],[0 1.3]); %x1 = 1.3*x0
%plot([0 1],[0 1/1.1]); %x1 = x0/1.1
%plot([0 1],[0 1/1.3]);%x1 = x0/1.3
legend("class_1: frequency good","class_2: high","class_3: very high","class_4: low","class_5: very low");
% xlim([0 1]);
% ylim([0 1]);
xlabel('x0 - target frequency');
ylabel('x1 - input frequency');

class_1_time = [1./class_1(:,1),1./class_1(:,2)];
class_2_time = [1./class_2(:,1),1./class_2(:,2)];
class_3_time = [1./class_3(:,1),1./class_3(:,2)];
class_4_time = [1./class_4(:,1),1./class_4(:,2)];
class_5_time = [1./class_5(:,1),1./class_5(:,2)];
full_data_time = [full_data_time,full_data(:,3:7)];


figure;
hold on;
scatter(class_1_time(:,1), class_1_time(:,2),'x');
scatter(class_2_time(:,1), class_2_time(:,2),'x');
scatter(class_3_time(:,1), class_3_time(:,2),'x');
scatter(class_4_time(:,1), class_4_time(:,2),'x');
scatter(class_5_time(:,1), class_5_time(:,2),'x');
xlabel('in0 - target time');
ylabel('in1 - input time');
xlim([0 1]);
ylim([0 1]);

plot([0 1],[0 1.1]); %x1 = 1.1*x0, w1
plot([0 1],[0 1.3]); %x1 = 1.3*x0, w2
plot([0 1],[0 1/1.1]); %x1 = x0/1.1, w3
plot([0 1],[0 1/1.3]);%x1 = x0/1.3, w4
legend("class_1: frequency good","class_2: high","class_3: very high","class_4: low","class_5: very low","x1 - 1.1*x0 = 0 w1","x1 - 1.3x0 = 0 w2", "x1 - x0/1.1 = 0 w3", "x1 - x0/1.3 = 0 w4");

layer1_W1 = [-1,1/1.1]';       % -  x0 + x1/1.1 = 0
layer1_W2 = [-1,1/1.3]';       % -  x0 + x1/1.3 = 0
layer1_W3 = [-1/1.1,1]';       % - (1/1.1)x0 + x1 = 0
layer1_W4 = [-1/1.3,1]';       % - (1/1.3)x0 + x1 = 0

%class 1, good: X1 < X0*1.1 and x1 > x0/1.1     -> in*w1 < 0, in*w3 > 0
%class 2, high: x1< x0/1.1 and x1 > x0/1.3      -> in*w3 < 0, in*w4 > 0
%class 3, very high: x1 < x0/1.3                -> in*w4 < 0
%class 4,low: x1 > x0*1.1 and x0<x0*1.3         -> in*w2 < 0, in*w1>0
%class 5, very low: x1 > x0*1.3                 -> in*w2 > 0


Y = full_data(:,3:7);

layer_1_out_1 = bin_step(X_time*layer1_W1);
layer_1_out_2 = bin_step(X_time*layer1_W2);
layer_1_out_3 = bin_step(X_time*layer1_W3);
layer_1_out_4 = bin_step(X_time*layer1_W4);

layer2_W1 = [-1, 1, -1]';
layer_2_out_1 = bin_step([layer_1_out_1, layer_1_out_3, ones_]*layer2_W1);

layer2_W2 = [-1, 1, -1]';
layer_2_out_2 = bin_step([layer_1_out_3, layer_1_out_4, ones_]*layer2_W2);

layer2_W3 = [-1, 0, 0]';
layer_2_out_3 = bin_step([layer_1_out_4, ones_, ones_]*layer2_W3);

layer2_W4 = [-1, 1, -1]';
layer_2_out_4 = bin_step([layer_1_out_2, layer_1_out_1, ones_]*layer2_W4);

layer2_W5 = [1, 0, 0]';
layer_2_out_5 = bin_step([layer_1_out_2, ones_, ones_]*layer2_W5);

Y_out = [layer_2_out_1,layer_2_out_2,layer_2_out_3,layer_2_out_4,layer_2_out_5];

% csvwrite("layer1_W1.csv",layer1_W1');
% csvwrite("layer1_W2.csv",layer1_W2');
% csvwrite("layer1_W3.csv",layer1_W3');
% csvwrite("layer1_W4.csv",layer1_W4');
% 
% csvwrite("layer2_W1.csv",layer2_W1');
% csvwrite("layer2_W2.csv",layer2_W2');
% csvwrite("layer2_W3.csv",layer2_W3');
% csvwrite("layer2_W4.csv",layer2_W4');
% csvwrite("layer2_W5.csv",layer2_W5');


%csvwrite("X.csv",X_time);
csvwrite("Y_drift.csv",Y);


result = sum(Y == Y_out);

%X = full_data_time(:,1:2);
%Y = full_data(:,3:7);
%csvwrite("X.csv",X);
