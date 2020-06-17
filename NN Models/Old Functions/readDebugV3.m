function [VCompIn, VCompOut, FileInfo] = readDebugV3(filename, NumDataPairs)

DebugTEST = fopen(filename,'r');

VCompIn = zeros(1,NumDataPairs);
VCompOut = zeros(1,NumDataPairs);


%TestData = fscanf(DebugTEST, "%s %d %s '%f, %f, %f, %f' %s '%f, %f, %f, %f'   %s %s %f   %s %s %f\n");
%FileInfo = fscanf(DebugTEST, "%s\n",1); % to get rid of first line
FileInfo = 0;

tempString = fscanf(DebugTEST, "%s\n",2);

i = 1;

while(tempString ~= "")
    tempSplit = split(tempString, [",","="]);
    stringSize = length(tempSplit);
    VCompIn(i) = str2double(tempSplit{stringSize-2});
    VCompOut(i) = str2double(tempSplit{stringSize});
    i = i+1;
    tempString = fscanf(DebugTEST, "%s\n",2);
end

fclose(DebugTEST);