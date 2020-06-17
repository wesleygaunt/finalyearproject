% Make weights positive

[x,y] = size(w);

signChange = ones(x,y);

for i = 1:y
    
    if w(i) < 0
        
        signChange(i) = -1;
    end
end

signChangeMat = diag(signChange);



X_signChange = signChangeMat*X;

w_pos = abs(w);

YModel_8D_posWeights = w_pos*X_signChange>-b;