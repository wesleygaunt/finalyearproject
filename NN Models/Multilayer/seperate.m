clear;
load('data.mat');



%classes = X(:,3);
%X = X(:,1:2);   %remove classes 


hold on;
scatter(class_0(:,1),class_0(:,2),'b');
scatter(class_1(:,1),class_1(:,2),'r');
scatter(class_2(:,1),class_2(:,2),'g');
xlim([-1 1]);
ylim([-1 1]);
xlabel('x0');
ylabel('x1');
line([0 1],[0 1],'Color','b');
W1 = [1, -1]';
line([0 0],[0 -1],'Color','r');
W2 = [1 0]';
line([0 -1],[0 1],'Color','g');
W3 = [1, 1]';

legend('class 0','class 1','class 2', 'x0 = x1', 'x0 = 0', 'x0 = - x1');

%class 0: x0 - x1 < 0     and     x0 + x1 > 0
%class 1: x0 < 0          and     x0 + x1 < 0
%class 2: x0 > 0          and     x0 - x1 > 0
OUT_1 = X*W1;
OUT_2 = X*W2;
OUT_3 = X*W3;
%class 0: x*w1 < 0          and     x*w3 > 0
%class 1: x*w2 < 0          and     X*W3 < 0
%class 2: X*W2 > 0          and     X*W1 < 0

%hidden layers
OUT_1 = bin_step(OUT_1);
OUT_2 = bin_step(OUT_2);
OUT_3 = bin_step(OUT_3);






%class 0: OUT1 > 0          and     OUT3 > 0
%class 1: OUT2 < 0          and     OUT3 < 0
%class 2: OUT2 > 0          and     OUT1 < 0

%This represents the first layer


%now filter







