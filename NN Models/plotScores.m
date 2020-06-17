% plot in vs out

function plotScores(NumPoints,DatScores,ModScores)

figure;
hold;

[~,n] = max(DatScores,[],2);
[ModMax,o] = max(ModScores,[],2);

Col = {'red';'blue';'green';'black'};

for i = 1:NumPoints

%     C1 = 4;
%     C2 = 4;
%     C3 = 4;
    
    if (n(i) == 1)
        C1 = 1;
        scatter(i,DatScores(i,1),'MarkerEdgeColor', Col{C1}, 'Marker', 'x');
    elseif n(i) == 2
        C2 = 2;
        scatter(i,DatScores(i,2),'MarkerEdgeColor', Col{C2}, 'Marker', 'x');
    elseif n(i) == 3
        C3 = 3;
        scatter(i,DatScores(i,3),'MarkerEdgeColor', Col{C3}, 'Marker', 'x');
    else
        disp('error');
    end
       
if o(i) ~= n(i)
     scatter(i,ModMax(i),'MarkerEdgeColor', Col{o(i)}, 'Marker', 'o');
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


