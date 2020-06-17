function YData = readYData(filename)

YDataFile = fopen(filename,'r');

YData = fscanf(YDataFile,"%d");

fclose(YDataFile);

YData = YData';