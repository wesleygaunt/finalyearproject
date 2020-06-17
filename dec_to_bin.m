binary = zeros(1,6);

input = 3;

binary(1) = mod(input,2);
input = input / 2;
binary(2) = mod(input,2);
input = input / 2;
binary(3) = mod(input,2);
input = input / 2;
binary(4) = mod(input,2);
input = input / 2;
binary(5) = mod(input,2);
input = input / 2;
binary(6) = mod(input,2);
input = input / 2;



if mod(input,2) >= 4
    binary(6) = 1;
    input = input - 4;
end

if input >= 2
    binary(5) = 1;
    input = input - 2;
end

if input >= 1
    binary(4) = 1;
    input = input - 1;
end

if input >= 0.5
    binary(3) = 1;
    input = input - 0.5;
end

if input >= 0.25
    binary(2) = 1;
    input = input - 0.25;
end

if input >= 0.125
    binary(1) = 1;
    input = input - 0.125;
end