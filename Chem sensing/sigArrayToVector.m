function voltagevectorout = sigarraytovector(sigarrayin)
    voltagevectorout = zeros(1,4);
    voltagevectorout(1) = sigarrayin(1,1);  %K
    voltagevectorout(2) = sigarrayin(2,1);  %Na
    voltagevectorout(3) = sigarrayin(1,2);  %Ca
    voltagevectorout(4) = sigarrayin(2,2);  %Na
end
