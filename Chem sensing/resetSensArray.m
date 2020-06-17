function SigOut = resetSensArray(SigOut, BiasPoint, NoiseSD)

    [R,C] = size(SigOut);

    % Set initial array output.
    SigOut = zeros(R,C)+BiasPoint;
    Noise = randn(R,C).*NoiseSD;

    SigOut = SigOut+Noise;
    
    surf(SigOut);
    
end