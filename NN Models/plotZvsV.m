% plot in vs out

function plotZvsV(Z,V,y,YDat)

figure;
hold;

for i = 1:length(Z)
    
    if (YDat(i) == 1)
        
        scatter(Z(i),V(i),'MarkerEdgeColor', 'red', 'Marker', 'x');
        
    elseif (YDat(i) == 0)
        
        scatter(Z(i),V(i),'MarkerEdgeColor', 'blue', 'Marker', 'x');
        
    else
        disp("Error, Y value not 1 or 0");
    end
    
end

for i = 1:length(Z)
    
    if (y(i) == 1)
        
        scatter(Z(i),Z(i),'MarkerEdgeColor', 'magenta', 'Marker', 'x');
        
    elseif (y(i) == 0)
        
        scatter(Z(i),Z(i),'MarkerEdgeColor', 'green', 'Marker', 'x');
        
    else
        disp("Error, Y value not 1 or 0");
    end
    
end

% figure;
% hold;
% 
% 
% for i = 1:length(ZV_3D)
%     
%     if (YData_3D_V3(i) == 1)
%         
%         scatter(ZV_3D(i),VcompIn_3D_V3(i),'MarkerEdgeColor', [0.8 0.5 0], 'Marker', 'x');
%         
%     elseif (YData_3D_V3(i) == 0)
%         
%         scatter(ZV_3D(i),VcompIn_3D_V3(i),'MarkerEdgeColor', '0 1 0.5', 'Marker', 'x');
%         
%     else
%         disp("Error, Y value not 1 or 0");
%     end
%     
% end

% for i = 1:length(ZV)
%     
%     if (YData_8D_NoSamp_2V355b_longT(i) == 1)
%         
%         scatter(ZV(i),VCompIn_8D_NoSamp_2V355b_longT(i),'MarkerEdgeColor', [0.8 0.5 0], 'Marker', 'x');
%         
%     elseif (YData_8D_NoSamp_2V355b_longT(i) == 0)
%         
%         scatter(ZV(i),VCompIn_8D_NoSamp_2V355b_longT(i),'MarkerEdgeColor', [0 1 0.5], 'Marker', 'x');
%         
%     else
%         disp("Error, Y value not 1 or 0");
%     end
%     
% end



end


