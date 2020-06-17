clear;
n = 50;
sd = 0.15;

class_0 = cluster(0,0.75,sd,sd,n);
class_1 = cluster(-0.5,-0.5,sd,sd,n);
class_2 = cluster(0.5,-0.5,sd,sd,n);


hold on;
scatter(class_0(:,1),class_0(:,2),'b');
scatter(class_1(:,1),class_1(:,2),'r');
scatter(class_2(:,1),class_2(:,2),'g');
