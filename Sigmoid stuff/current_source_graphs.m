lower_current = importfile_current_source('0_70_to_0_89.csv', 2, 21);
upper_current = importfile_current_source('0_91_to_1_1.csv', 2, 21);
hold on;
scatter(lower_current(:,1),lower_current(:,2));
scatter(upper_current(:,1),upper_current(:,2));
%legend('negative arm','positive arm');
xlabel('V_{IN}');
ylabel('I_{OUT}');
xlim([0.7 1.1]);
