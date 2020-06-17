
function results = extract_td_data(file)
%the data will be in the format [line, out0, out 1]
results = importfile(file, [2, Inf]);

rows = size(results,1);
%results = results(:,2);

%results(:,1) = []; %remove first line
%there are 5 rows 
for i = 1:4:rows*(4/5)
    %display(i);
    results(i,:) = [];
end

rows = size(results,1); %new size


 for i = 1:4:rows
    results(i,2) = results(i,2) + results(i+1,2); %out 0
    results(i,3) = results(i+2,2) + results(i+3,2); % out 1
    
    results(i+1,2) = NaN;
    results(i+2,2) = NaN;
    results(i+3,2) = NaN;
 end

results = results(~any(isnan(results), 2), :);
results(:,1) = [];
end
 