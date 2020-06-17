clear;
driftrun1 = extract_td_data('drift_run_1.csv');
driftrun1(:,2:6) = driftrun1(:,2:6) > 0;
y_analogue = driftrun1(:,2:6) > 0;

load('y_drift.mat')
Y = Y > 0;
results = y_analogue == Y;
%results = sum(results,2) == 5;
%accuracy = sum(results)/100;


function results = extract_td_data(file)
%the data will be in the format [line, out0, out 1]
data = importfile(file, [2, Inf]);

rows = size(data,1);
%results = results(:,2);

%results(:,1) = []; %remove first line
%there are 5 rows 
for i = 1:6:rows
    %display(i);
    data(i,:) = [0,0];
    data(i + 1,1);
    data(i+1:i+5,2);
    results(data(i+1,1),1) = data(i+1,1);
    results(data(i+1,1),2:6) = data(i+1:i+5,2);
end

results(isnan(results))=0;



end