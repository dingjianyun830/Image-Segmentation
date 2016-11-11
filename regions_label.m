function clabel=regions_label(reg, rIDX,NUM ,pixels)
clabel = zeros(1,pixels);
for i = 1 : NUM
    region = reg{i};
    label = rIDX(i);
    for j = 1: size(region)
        clabel(region(j)) = label;
    end
end