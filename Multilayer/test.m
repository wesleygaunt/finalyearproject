n = 50;
sd = 0.15;

a = cluster(0,2,1,0.3,n);
b = cluster(2,0,0.3,1,n);
c = cluster(-2,0,0.3,1,n);
class_0 = [a;b;c];

d = cluster(0,0,0.5,0.5,n);
e = cluster(0,-3,0.5,0.5,n);
class_1 = [d;e];


hold on;

scatter(class_0(:,1),class_0(:,2),'b');
scatter(class_1(:,1),class_1(:,2),'r');

xlim([-5 +5])
ylim([-5 +5])
