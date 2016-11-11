function Energy=ComputeEnergy(parent,high_clouds,im,clouds)
neighbors = im.ob_neighborhood;
[~,m] = size(parent);
fEnergy = ComputeEnergyf(clouds(1,:),high_clouds);
Energyf = zeros(1,m);
Energys = zeros(1,m);
for j=1:m
    Energyf(j)=fEnergy(j,(parent(j)));
    Energys(j)=ComputeEnergys(parent,clouds(4,:),neighbors{j},j,im);
end
A = sum(Energyf);
B = sum(Energys);
Energy = A + B;
