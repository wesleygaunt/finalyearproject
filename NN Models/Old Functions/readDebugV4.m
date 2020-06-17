function [VScoreOut, FileInfo] = readDebugV4(filename, NumDataPairs)

DebugTEST = fopen(filename,'r');

VScoreOut = zeros(NumDataPairs,3);

%TestData = fscanf(DebugTEST, '%s %d %s '%f, %f, %f, %f' %s '%f, %f, %f, %f'   %s %s %f   %s %s %f\n');
FileInfo = fscanf(DebugTEST, '%s\n',1); % to get rid of first line
%FileInfo = 0;

tempString = fscanf(DebugTEST, '%s\n',2);

i = 1;

while(tempString ~= '')
    tempSplit = split(tempString, [',','=']);
    stringSize = length(tempSplit);
    VScoreOut(i,1) = str2double(tempSplit{stringSize-4});
    VScoreOut(i,2) = str2double(tempSplit{stringSize-2});
    VScoreOut(i,3) = str2double(tempSplit{stringSize});
    i = i+1;
    tempString = fscanf(DebugTEST, '%s\n',2);
end

fclose(DebugTEST);




end