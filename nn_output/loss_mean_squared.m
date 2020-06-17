function mean_squared = loss_mean_squared(array_1, array_2)
diff_squared = (array_1 - array_2).^2;
mean_squared = mean(diff_squared, 'all');
end