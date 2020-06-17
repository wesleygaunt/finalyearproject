function [Vout1, Vout2, VoutNet] = readDebugV2(filename, NumDataPairs)

DebugTEST = fopen(filename,'r');

Vout1 = zeros(1,NumDataPairs);
Vout2 = zeros(1,NumDataPairs);
VoutNet = zeros(1,NumDataPairs);

%TestData = fscanf(DebugTEST, "%s %d %s '%f, %f, %f, %f' %s '%f, %f, %f, %f'   %s %s %f   %s %s %f\n");
tempString = fscanf(DebugTEST, "%s\n",21);  

i = 1;

while(tempString ~= "")
    tempSplit = split(tempString, [",", "'","=","V"]);
    Vout1(i) = str2double(tempSplit{13});
    Vout2(i) = str2double(tempSplit{15});
    VoutNet(i) = str2double(tempSplit{17});
    i = i+1;
    tempString = fscanf(DebugTEST, "%s\n",21);
end

fclose(DebugTEST);