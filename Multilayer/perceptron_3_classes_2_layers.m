clear;
load('data.mat');

%X is in this format: X1,X0, 1
%W is in this format: W1;W0; b

%classes = X(:,3);
%X = X(:,1:2);   %remove classes 


hold on;
scatter(class_0(:,1),class_0(:,2),'b');
scatter(class_1(:,1),class_1(:,2),'r');
scatter(class_2(:,1),class_2(:,2),'g');
xlim([-1 1]);
ylim([-1 1]);
xlabel('x_1');
ylabel('x_0');
line([-1 1],[-1 1],'Color','b');

line([0 0],[1 -1],'Color','r');

line([1 -1],[-1 1],'Color','g');


legend('Class_0','Class_1','Class_2', 'x_1 - x_0 = 0', 'x_1 = 0', 'x_1 + x_0 = 0');
ones_ = ones(150,1);

%class 0: x1 - x0 < 0     and     x1 + x0 > 0
%class 1: x1 < 0          and     x1 + x0 < 0
%class 2: x1 > 0          and     x1 - x0 > 0
W1 = [1, -1, 0]';       %x1 - x0 + 0
W2 = [1,  0, 0]';       %x1      + 0
W3 = [1,  1, 0]';       %x1 + x0 + 0

OUT_1 = [X, ones_]*W1;
OUT_2 = [X, ones_]*W2;
OUT_3 = [X, ones_]*W3;
%class 0: x*w1 < 0          and     x*w3 > 0
%class 1: x*w2 < 0          and     X*W3 < 0
%class 2: X*W2 > 0          and     X*W1 > 0

%hidden layers
OUT_1 = bin_step(OUT_1);
OUT_2 = bin_step(OUT_2);
OUT_3 = bin_step(OUT_3);

%class 0: OUT1 < 0          and     OUT3 > 0
%class 1: OUT2 < 0          and     OUT3 < 0
%class 2: OUT2 > 0          and     OUT1 > 0


%This represents the first layer
W_CLASS_0 = [-1, 1, -1]';
CLASS_0_OUT = [OUT_1, OUT_3, ones_]*W_CLASS_0;
CLASS_0_OUT = bin_step(CLASS_0_OUT);

W_CLASS_1 = [-1, -1, -1]';
CLASS_1_OUT = [OUT_2, OUT_3, ones_]*W_CLASS_1;
CLASS_1_OUT = bin_step(CLASS_1_OUT);


W_CLASS_2 = [1, 1, -1]';
CLASS_2_OUT = [OUT_1, OUT_2, ones_]*W_CLASS_2;
CLASS_2_OUT = bin_step(CLASS_2_OUT);