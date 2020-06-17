class_0 = cluster(0,0.75,0.5,0.1,50);
class_0 = [class_0; cluster(0,-0.75,0.5,0.1,50)];
class_0 = [class_0; cluster(-0.75,0,0.1,0.5,50)];
class_0 = [class_0; cluster(0.75,0,0.1,0.5,50)];

class_1 = cluster(0,0,0.2,0.2,200);
subplot(1,2,1);
hold on;
scatter(class_0(:,1),class_0(:,2));
hold on;
scatter(class_1(:,1),class_1(:,2));
xlim([-1 1]);
ylim([-1 1]);

subplot(1,2,2);
xlim([-1 1]);
ylim([-1 1]);
hold on;

class_3 = cluster(-0.5,0.5,0.2,0.2,50);
class_3 = [class_3;cluster(0.5,-0.5,0.2,0.2,50)];
class_4 = cluster(0.5,0.5,0.2,0.2,50);
class_4 = [class_4;cluster(-0.5,-0.5,0.2,0.2,50)];

scatter(class_3(:,1),class_3(:,2));

scatter(class_4(:,1),class_4(:,2));
xlim([-1 1]);
ylim([-1 1]);