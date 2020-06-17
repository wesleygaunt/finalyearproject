function a = euclidean_distance(array_1, array_2)
diff = array_1 - array_2;
diff = diff.^2;

diff_squared = sum(diff,2).^0.5;

a = diff_squared;
end