function diff = abs_distance(array_1, array_2)
diff = abs(array_1 - array_2);
diff = mean(diff,2);
end