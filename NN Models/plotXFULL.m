%plot 1s vs 0s for 2D inputs i.e. 2 inputs 2 weights, 1 class
function plotXFULL(X_FULL,YData_FULL)

X_FULL = X_FULL';

figure;
hold;

for i = 1:length(X_FULL)
    
    if (YData_FULL(i) == 1)
        
        scatter(X_FULL(1,i),X_FULL(2,i),'MarkerEdgeColor', 'red', 'Marker', 'x');
        
    elseif (YData_FULL(i) == 0)
        
        scatter(X_FULL(1,i),X_FULL(2,i),'MarkerEdgeColor', 'blue', 'Marker', 'x');
        
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