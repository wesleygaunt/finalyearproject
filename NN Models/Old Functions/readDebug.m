function [VCompIn, VCompOut] = readDebug(filename, NumDataPairs)

DebugTEST = fopen(filename,'r');

VCompIn = zeros(1,NumDataPairs);
VCompOut = zeros(1,NumDataPairs);

%TestData = fscanf(DebugTEST, "%s %d %s '%f, %f, %f, %f' %s '%f, %f, %f, %f'   %s %s %f   %s %s %f\n");
tempString = fscanf(DebugTEST, "%s\n",18);

i = 1;

while(tempString ~= "")
    tempSplit = split(tempString, [",", "'","=","V"]);
    VCompIn(i) = str2double(tempSplit{13});
    VCompOut(i) = str2double(tempSplit{15});
    i = i+1;
    tempString = fscanf(DebugTEST, "%s\n",18);
end

fclose(DebugTEST);