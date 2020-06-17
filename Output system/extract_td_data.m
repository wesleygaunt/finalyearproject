function results = extract_td_data(file)


results = importfile_output_td(file, [2, Inf]);
results(1,:) = []; %remove first row
rows = size(results,1);
%there are 3 rows 
for i = 1:2:(rows*2/3)
    results(i,:) = [];
end
rows = size(results,1); %new size
results(:,1) = [];
for i = 1:2:rows
    results(i) = results(i) + results(i+1);
    results(i+1) = NaN;
end

results = results(~any(isnan(results), 2), :);

results;