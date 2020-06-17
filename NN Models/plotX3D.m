%plot 1s vs 0s for 3D inputs i.e. 3 inputs 3 weights, 1 class
function plotX3D(X,YData)

X = X';

figure;
hold;

for i = 1:length(X)
    
    if (YData(i) == 1)
        
        scatter3(X(1,i),X(2,i),X(3,i),'MarkerEdgeColor', 'red', 'Marker', 'x');
        
    elseif (YData(i) == 0)
        
        scatter3(X(1,i),X(2,i),X(3,i),'MarkerEdgeColor', 'blue', 'Marker', 'x');
        
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

