function value_out = roundPartial(value, resolution)
value_out = round(value / resolution) .* resolution;
end