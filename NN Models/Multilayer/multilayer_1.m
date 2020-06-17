clear;

%This just shows the line that the test 1 plots.

load('linear_model_fixedpoint_4bit_3radix.mat');
load('jockeys_and_basketball_fixedpoint_4bit_3radix_normalised.mat');
y_actual = y_actual';

X(:,3)= y_actual;   %

class_0 = X;
class_1 = X;

for i=1:1:200
    if class_0(i,3) ~= 0
            class_0(i,1) = NaN;
            class_0(i,2) = NaN;
            class_0(i,3) = NaN;   
    end
    
    if class_1(i,3) ~= 1
            class_1(i,1) = NaN;
            class_1(i,2) = NaN;
            class_1(i,3) = NaN;   
    end
end

class_0(any(isnan(class_0),2),:)=[];
class_1(any(isnan(class_1),2),:)=[];


scatter(class_0(:,1),class_0(:,2));
hold on;
scatter(class_1(:,1),class_1(:,2));

line([-1,1],[3,-3]);

legend('class_0', 'class_1');
xlim([-1 1]);
ylim([-1 1]);


%y_model = X*w' + b; % ground truth, actual matrix multiplication
%y_model = y_model';       %transpose