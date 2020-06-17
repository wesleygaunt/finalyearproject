
function writeVinFile(filename, XData)

XDataFile = fopen(filename, 'w');

inForm = '';

for k=1:size(XData,2)
    inForm = inForm + '%1.4f ';
end
inForm = inForm + '\n';


for i = 1:size(XData,1)
fprintf(XDataFile, inForm, XData(i,:));
end

fclose(XDataFile);


%%
% XDataFile = fopen('VCompIn.in', 'w');
% 
% for i = 1:size(VZo,2)
% fprintf(XDataFile, '%1.3f\n', VZo(i));
% end
% 
% fclose(XDataFile);
% 
% %%
% XDataFile = fopen('VSubt_SplitVin.in', 'w');
% 
% for i = 1:size(Z_pos_scaled,2)
% fprintf(XDataFile, '%1.3f %1.3f\n', Z_pos_scaled(i), Z_neg_scaled(i));
% end
% 
% fclose(XDataFile);
end