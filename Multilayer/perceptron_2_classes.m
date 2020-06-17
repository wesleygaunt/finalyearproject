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

%X: [x1,x0]

scatter(class_1(:,2),class_1(:,1));
hold on;
scatter(class_0(:,2),class_0(:,1));

line([3,-3],[-2,2]);
xlabel('x_0');
ylabel('x_1');
legend('C_1', 'C_0');
xlim([-1 1]);
ylim([-1 1]);
text(0.3,0,"(0.75)x_1 + (0.5)x_0 \geq 0")
text(0.4,-0.1,"Class = 1")
text(-0.9,0,"(0.75)x_1 + (0.5)x_0 < 0")
text(-0.8,-0.1,"Class = -1")




y_0 = class_0*[w 0]' + b; % ground truth, actual matrix multiplication
y_1 = class_1*[w 0]' + b; % ground truth, actual matrix multiplication
%y_model = y_model';       %transpose