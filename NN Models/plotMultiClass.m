%plot 1s vs 0s
function plotMultiClass(ZV_norm,OutDataIn_norm,j,YData_In, y)


%figure;
%hold;
%j = 2;

%NN_res = YData_8x3D_ResSamp_CapRef2V13' == y;
%NN_res_CM = YData_8x3D_CM_12u8s' == y;
%pred_res = y_pred == y;

%OutDataIn_norm = norm_outData_NN8x3D_CM_12u8s;
res_vec = YData_In == y;

for i = 1:length((ZV_norm(:,1)))
    
    if (res_vec(i) == 1)
        
        scatter(ZV_norm(i,j),OutDataIn_norm(i,j),'MarkerEdgeColor', 'red', 'Marker', 'x');
        
    elseif (res_vec(i) == 0)
        
        scatter(ZV_norm(i,j),OutDataIn_norm(i,j),'MarkerEdgeColor', 'blue', 'Marker', 'x');
        
    else
        disp('Error, Y value not 1 or 0');
    end
    
end

end

% for a = 1:16
%     for b = 1:16
%         
%         
%         
%         
%     end
% end



        