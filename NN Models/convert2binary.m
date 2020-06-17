%function takes X data quantised to 0.125 steps in the range [-1 to 0.875]
%and and produces two outputs. one of the inputs converted into 
% ***** NOTE NOT 2s complement binary *** sign magnitude binary with a shift
% so -8 = 1111 and -1 = 1000
% the other splits each of the bits of these binary
%inputs and converts to voltages for direct input into cadence.
% The latter output is in the format:
% [X0_b3 X0_b2 X0_b1 X0_b0 X1_b3 X1_b2 X1_b1 X1_b0; %input 1
%  X0_b3 X0_b2 X0_b1 X0_b0 X1_b3 X1_b2 X1_b1 X1_b0; % input 2
%                      ...
%  X0_b3 X0_b2 X0_b1 X0_b0 X1_b3 X1_b2 X1_b1 X1_b0] %input N

function [X_binary,X_data_Vinputs] = convert2binary(X)

[x,y] = size(X);

X_binary  = cell(x,y);
X_data_Vinputs = zeros(y,x*4);
VDD = 4.5;

X_conv = 8*(X);

for i = 1:y
    for j=1:x
        temp_dec = X_conv(j,i);
        bit = ((j-1)*4)+1;
        
        if temp_dec < 0
            temp_dec = abs(temp_dec)-1;
            temp_bin = dec2bin(temp_dec,3);
            
            temp_bin = "1" + temp_bin;
        else
            temp_bin = "0" + dec2bin(temp_dec,3);
        end

        X_binary{j,i} = temp_bin;
        
        temp_mat = str2double(split(temp_bin,'',2));
        temp_mat = temp_mat(2:5);
        
        X_data_Vinputs(i,bit:bit+3) = VDD.*temp_mat;
      
    end
end

% XData = fopen('XData_FULL.in', 'w');
% 
% for k = 1:i
%     fprintf(XData, "%1.1f %1.1f %1.1f %1.1f %1.1f %1.1f %1.1f %1.1f\n", X_data_Vinputs(k,:));
% end
% 
% fclose(XData);
% end