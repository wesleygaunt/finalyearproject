hold;
scatter(y1, results1, 'r');
scatter(y2, results2, 'b');
scatter(y3, results3, 'g');
scatter(y4, results4, 'k*');
scatter(y5, results5, 'b+');
scatter(y6, results6, 'r*');
scatter(y7, results7, 'p');
xlabel("y = X*w");
ylabel("Change from 0.9 V / V");
legend("[0.75, 0.25]","[1.00, 1.00]","[0.25, 0.25]","[0.25, 0.75]","[0.50, 0.50]","[0.75, 0.75]","[0.10,0.10]");
